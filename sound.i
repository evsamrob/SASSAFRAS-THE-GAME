# 1 "sound.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sound.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct
{
    u16 tileimg[8192];
} charblock;


typedef struct
{
    u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();




typedef struct
{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 160 "myLib.h"
void hideSprites();






typedef struct
{
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 203 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 213 "myLib.h"
typedef volatile struct
{
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 254 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 290 "myLib.h"
typedef void (*ihp)(void);
# 311 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);

unsigned short colorAt(int col, int row, const unsigned short *colBitMap, int width);

int freeToMove(int col, int row, int width, int height, int dx, int dy,
                const unsigned short *colBitMap);

int inDeadZone(int col, int row, int width, int height,
                const unsigned short *colBitMap);

int checkWinDie(int col, int row, int width, int height,
                const unsigned short *colBitMap);
# 2 "sound.c" 2
# 1 "sound.h" 1

void setupSounds();
void playSong(const signed char* sound, int length, int loops);
void playEffect(const signed char* sound, int length);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 50 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundSong;
SOUND soundEffect;
# 3 "sound.c" 2

void setupSounds()
{
    *(volatile u16 *)0x04000084 = (1<<7);

    *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     (0<<10) |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

    *(u16*)0x04000080 = 0;
}

void playSong( const signed char* sound, int length, int loops) {
        dma[1].cnt = 0;

        int ticks = (16777216) / 11025;

        DMANow(1, sound, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000102 = 0;

        *(volatile unsigned short*)0x4000100 = -ticks;
        *(volatile unsigned short*)0x4000102 = (1<<7);

        soundSong.data = sound;
        soundSong.length = length;
        soundSong.frequency = 11025;
        soundSong.isPlaying = 1;
        soundSong.loops = loops;
        soundSong.duration = (((59.727)*length) / 11025);
        soundSong.vBlankCount = 0;
}


void playEffect( const signed char* sound, int length) {

        dma[2].cnt = 0;

        int ticks = (16777216) / 11025;

        DMANow(2, sound, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000106 = 0;

        *(volatile unsigned short*)0x4000104 = -ticks;
        *(volatile unsigned short*)0x4000106 = (1<<7);

        soundEffect.data = sound;
        soundEffect.length = length;
        soundEffect.frequency = 11025;
        soundEffect.isPlaying = 1;
        soundEffect.loops = 0;
        soundEffect.duration = (((59.727)*length) / 11025);
        soundEffect.vBlankCount = 0;
}

void setupInterrupts() {
    *(unsigned short*)0x4000208 = 0;
    *((ihp*)0x03007FFC) = interruptHandler;
    *(unsigned short*)0x4000200 |= 1 << 0;
    *(unsigned short*)0x4000004 |= 1 << 3;
    *(unsigned short*)0x4000208 = 1;
}

void interruptHandler() {

    *(unsigned short*)0x4000208 = 0;

    if(*(volatile unsigned short*)0x4000202 & 1 << 0) {
        if (soundSong.isPlaying) {
            soundSong.vBlankCount++;
            if (soundSong.vBlankCount > soundSong.duration) {
                if (soundSong.loops) {
                    playSong(soundSong.data, soundSong.length, 1);
                } else {
                    soundSong.isPlaying = 0;
                    dma[1].cnt = 0;
                    *(volatile unsigned short*)0x4000102 = 0;
                }
            }
        }
        if (soundEffect.isPlaying) {
            soundEffect.vBlankCount++;
            if (soundEffect.vBlankCount > soundEffect.duration) {
                soundEffect.isPlaying = 0;
                dma[2].cnt = 0;
                *(volatile unsigned short*)0x4000106 = 0;
            }
        }
        *(volatile unsigned short*)0x4000202 = 1 << 0;
    }
    *(unsigned short*)0x4000208 = 1;
}

void pauseSound() {
    soundSong.isPlaying = 0;
    soundEffect.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = (0<<7);
    *(volatile unsigned short*)0x4000106 = (0<<7);
}

void unpauseSound() {
    soundSong.isPlaying = 1;
    *(volatile unsigned short*)0x4000102 = (1<<7);
    soundEffect.isPlaying = 1;
    *(volatile unsigned short*)0x4000106 = (1<<7);
}

void stopSound() {
    soundSong.isPlaying = 0;
    dma[1].cnt = 0;
    *(volatile unsigned short*)0x4000102 = (0<<7);

    soundEffect.isPlaying = 0;
    dma[2].cnt = 0;
    *(volatile unsigned short*)0x4000106 = (0<<7);
}
