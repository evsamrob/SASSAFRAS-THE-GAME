#include "myLib.h"
#include "sound.h"

void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER1 |
                     DSB_FIFO_RESET;

    REG_SOUNDCNT_L = 0;
}

void playSong( const signed char* sound, int length, int loops) {
        dma[1].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;

        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM0CNT = 0;

        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;

        soundSong.data = sound;
        soundSong.length = length;
        soundSong.frequency = 11025;
        soundSong.isPlaying = 1;
        soundSong.loops = loops;
        soundSong.duration = ((VBLANK_FREQ*length) / SOUND_FREQ);
        soundSong.vBlankCount = 0;
}


void playEffect( const signed char* sound, int length) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;

        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;

        soundEffect.data = sound;
        soundEffect.length = length;
        soundEffect.frequency = 11025;
        soundEffect.isPlaying = 1;
        soundEffect.loops = 0;
        soundEffect.duration = ((VBLANK_FREQ*length) / SOUND_FREQ);
        soundEffect.vBlankCount = 0;
}

void setupInterrupts() {
    REG_IME = 0;
    REG_INTERRUPT = interruptHandler;
    REG_IE |= INT_VBLANK;
    REG_DISPSTAT |= INT_VBLANK_ENABLE;
    REG_IME = 1;
}

void interruptHandler() {

    REG_IME = 0;

    if(REG_IF & INT_VBLANK) {
        if (soundSong.isPlaying) {
            soundSong.vBlankCount++;
            if (soundSong.vBlankCount > soundSong.duration) {
                if (soundSong.loops) {
                    playSong(soundSong.data, soundSong.length, 1);
                } else {
                    soundSong.isPlaying = 0;
                    dma[1].cnt = 0;
                    REG_TM0CNT = 0;
                }
            }
        }
        if (soundEffect.isPlaying) {
            soundEffect.vBlankCount++;
            if (soundEffect.vBlankCount > soundEffect.duration) {
                soundEffect.isPlaying = 0;
                dma[2].cnt = 0;
                REG_TM1CNT = 0;
            }
        }
        REG_IF = INT_VBLANK;
    }
    REG_IME = 1;
}

void pauseSound() {
    soundSong.isPlaying = 0;
    soundEffect.isPlaying = 0;
    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;
}

void unpauseSound() {
    soundSong.isPlaying = 1;
    REG_TM0CNT = TIMER_ON;
    soundEffect.isPlaying = 1;
    REG_TM1CNT = TIMER_ON;
}

void stopSound() {
    soundSong.isPlaying = 0;
    dma[1].cnt = 0;
    REG_TM0CNT = TIMER_OFF;

    soundEffect.isPlaying = 0;
    dma[2].cnt = 0;
    REG_TM1CNT = TIMER_OFF;
}