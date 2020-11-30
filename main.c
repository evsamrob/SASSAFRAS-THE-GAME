/*
What is finished
    Most things (few bells and wistles to add -see below)
What is not finished
    better cheat 
        highlight pixels to line up with player's hand when wall jumping
        will carry player to the end if they jump at the right times
    bug fixes
bugs
    game does not respawn player if switch to cheat mode while dying animation is playing
how to play
    up is jump
    left/right are side to side
    you will latch onto the walls
    when on the wall press space to wall jump (arrow key away from wall just makes you fall)
    spikes kill you
    if you run out of lives you will be sent to the previous level
    if you are on the first level when you run out of lives you lose :(
    collect all the music to win :) 
*/

#include <stdlib.h>
#include <stdio.h>

#include "myLib.h"
#include "game.h"
#include "sound.h"
// screen includes
#include "splashScreen.h"
#include "instructionsScreen.h"
#include "gameScreen.h"
#include "gameScreenDemo.h"
#include "level1.h"
#include "level2.h"
#include "level2Back.h"
#include "level3.h"
#include "level3Back.h"
#include "pauseScreen.h"
#include "winScreen.h"
#include "loseScreen.h"

// song includes
#include "splashSong.h"
#include "level1Song.h"
#include "level2Song.h"
#include "level3Song.h"
#include "winSong.h"
#include "loseSong.h"


// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void drawCurLevel();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum
{
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

PLAYER player;

SOUND soundSong;

int curLevel;

unsigned short hOff;
unsigned short vOff;

int main()
{
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state)
        {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

// Sets up GBA
void initialize()
{
    //REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; // Bitwise OR the BG(s) you want to use and Bitwise OR SPRITE_ENABLE if you want to use sprites
    //REG_BG0CNT = BG_SIZE_SMALL | BG_SCREENBLOCK(28) | BG_CHARBLOCK(0);
    REG_DISPCTL = MODE4 | BG2_ENABLE;

    buttons = BUTTONS;
    oldButtons = 0;

    curLevel = 0;

    setupSounds();
    setupInterrupts();

    goToStart();

    waitForVBlank();
    //flipPage();
}

// Sets up the start state
void goToStart() {
    state = START;

    waitForVBlank();

    // setting background
    REG_DISPCTL = MODE4 | BG2_ENABLE;
    videoBuffer = FRONTBUFFER;
    DMANow(3, splashScreenPal, PALETTE, splashScreenPalLen/2);
    drawFullscreenImage4(splashScreenBitmap);

    // playing splash screen song
    stopSound();
    playSong(splashSong_data, splashSong_length, 1);
}

// Runs every frame of the start state
void start() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        initGame();
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToPause();
    }
}

// Sets up the game state
void goToGame() {
    state = GAME;
    drawCurLevel();
}

void drawCurLevel() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; 
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL | BG_8BPP;

    switch (curLevel) {
        case 0:
            // instructions
            //playSong(splashSong_data, splashSong_length, 1);
            DMANow(3, instructionsScreenPal, PALETTE, instructionsScreenPalLen/2);
            DMANow(3, instructionsScreenTiles, &CHARBLOCK[1], instructionsScreenTilesLen/2);
            DMANow(3, instructionsScreenMap, &SCREENBLOCK[28], instructionsScreenMapLen/2);
            break;
        case 1:
            // Level 1
            // playing song
            //stopSound();
            //playSong(level1Song_data, level1Song_length, 1);
            // drawing bg
            DMANow(3, level1Pal, PALETTE, level1PalLen/2);
            DMANow(3, level1Tiles, &CHARBLOCK[1], level1TilesLen/2);
            DMANow(3, level1Map, &SCREENBLOCK[28], level1MapLen/2);
            break;
        case 2:
            // Level 2
            // playing song
            //stopSound();
            //playSong(level2Song_data, level2Song_length, 1);
            // drawing bg
            DMANow(3, level2Pal, PALETTE, level2PalLen/2);
            DMANow(3, level2Tiles, &CHARBLOCK[1], level2TilesLen/2);
            DMANow(3, level2Map, &SCREENBLOCK[28], level2MapLen/2);
            // drawing synchonous bg
            REG_DISPCTL |= BG1_ENABLE;
            REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_SIZE_LARGE;
            //DMANow(3, level2BackPal, PALETTE, level2BackPalLen/2);
            DMANow(3, level2BackTiles, &CHARBLOCK[0], level2BackTilesLen/2);
            DMANow(3, level2BackMap, &SCREENBLOCK[16], level2BackMapLen/2);
            break;
        case 3:
            // Level 3
            // playing song
            //stopSound();
            //playSong(level3Song_data, level3Song_length, 1);
            // drawing bg
            DMANow(3, level3Pal, PALETTE, level3PalLen/2);
            DMANow(3, level3Tiles, &CHARBLOCK[1], level3TilesLen/2);
            DMANow(3, level3Map, &SCREENBLOCK[28], level3MapLen/2);

            // drawing synchonous bg
            REG_DISPCTL |= BG1_ENABLE;
            REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_SIZE_WIDE | BG_8BPP;
            //DMANow(3, level2BackPal, PALETTE, level2BackPalLen/2);
            DMANow(3, level3BackTiles, &CHARBLOCK[0], level3BackTilesLen/2);
            DMANow(3, level3BackMap, &SCREENBLOCK[16], level3BackMapLen/2);
            break;
    }
}

void playCurSong() {
    switch (curLevel) {
        case 1:
            // Level 1
            stopSound();
            playSong(level1Song_data, level1Song_length, 1);
            break;
        case 2:
            // Level 2
            stopSound();
            playSong(level2Song_data, level2Song_length, 1);
            break;
        case 3:
            // Level 3
            stopSound();
            playSong(level3Song_data, level3Song_length, 1);
            break;
    }
}

// Runs every frame of the game state
void game() {

    updateGame();
    drawGame();

    waitForVBlank();
    flipPage();

    

    if (BUTTON_PRESSED(BUTTON_START) && player.level != 0) {
            goToPause();
    }
    
    if (BUTTON_PRESSED(BUTTON_START) && player.level == 0) {
        player.level++;
        initPlayer();
        initRecordPlayer();
        initCheat();
    }

    if (player.level == 1 && player.lives == 0) {       // player has lost
        goToLose();
    }

    if (player.level >= 4) {                            // player has beaten the game!
        goToWin();
    } else if (player.level != curLevel) {
        curLevel = player.level;
        drawCurLevel();
        playCurSong();
        initPlayer(player.level);
    }

    

    hOff = SHIFTDOWN(player.col);
    vOff = SHIFTDOWN(player.row);
    if (player.level == 2) {
        REG_BG1HOFF = hOff*2;
        REG_BG1VOFF = vOff*2;
    }
    if (player.level == 3) {
        REG_BG1HOFF = hOff/2;
    }
    
}

// Sets up the pause state
void goToPause() {
    state = PAUSE;

    waitForVBlank();

    // setting background
    REG_DISPCTL = MODE4 | BG2_ENABLE;
    videoBuffer = FRONTBUFFER;
    DMANow(3, pauseScreenPal, PALETTE, splashScreenPalLen/2);
    drawFullscreenImage4(pauseScreenBitmap);
}

// Runs every frame of the pause state
void pause() {

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
    state = WIN;

    player.level = 0;
    stopSound();
    playSong(winSong_data, winSong_length, 1);

    waitForVBlank();

    // setting background
    REG_DISPCTL = MODE4 | BG2_ENABLE;
    videoBuffer = FRONTBUFFER;
    DMANow(3, winScreenPal, PALETTE, splashScreenPalLen/2);
    drawFullscreenImage4(winScreenBitmap);
}

// Runs every frame of the win state
void win() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    } 
}

// Sets up the lose state
void goToLose() {
    state = LOSE;

    stopSound();
    playSong(loseSong_data, loseSong_length, 1);

    waitForVBlank();

    // setting background
    REG_DISPCTL = MODE4 | BG2_ENABLE;
    videoBuffer = FRONTBUFFER;
    DMANow(3, loseScreenPal, PALETTE, splashScreenPalLen/2);
    drawFullscreenImage4(loseScreenBitmap);
}

// Runs every frame of the lose state
void lose() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    } 
}