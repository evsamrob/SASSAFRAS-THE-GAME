#include <stdlib.h>
#include <stdio.h>

#include "game.h"
#include "myLib.h"
#include "sound.h"
#include "spriteSheet.h"
#include "insructionsMap.h"
#include "level1Map.h"
#include "level2Map.h"
#include "level3Map.h"

#include "deathEffect.h"
#include "jumpEffect.h"


// variables
PLAYER player;
RECORDPLAYER recordPlayer;
LIVESDISP  livesDisp;
CHEAT cheat[10];
int numSprites = 256;

const unsigned short *curColMap;

// Initializes Game
void initGame() { 
    player.level = 0;
    curColMap = &insructionsMapBitmap;
    initSprites();
    initPlayer();
    initRecordPlayer();
    initLivesDisplay();
    initCheat();
}

// Updates Game
void updateGame() {
    updatePlayer();
    updateRecordPlayer();
    updateLivesDisplay();
    updateCheat();

    if (player.lives <= 0) {
        if (player.level > 1) {    // player has gone to previous level
            player.level--;
            initPlayer();
            initRecordPlayer();
            initCheat();
        }
    }
}

// Draws Game
void drawGame() {
    drawSprites();
}

// Initializes Sprites
void initSprites() {
    DMANow(3, spriteSheetPal, SPRITEPALETTE, spriteSheetPalLen/2);
    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

// Draws Sprites
void drawSprites() {
    DMANow(3, shadowOAM, OAM, numSprites/2);
}

// Initializes Player
void initPlayer() {
    player.width = 8;
    player.height = 16;

    player.vx = 0;
    player.vy = 0;
    player.canJump = 0;
    player.lastJumpSide = ONGROUND;
    player.lastWallTouch = ONGROUND;

    player.OAMIndex = 0;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.direction = RIGHT;
    player.playerControls = 1;

    player.isCheating = 0;
    player.isCheating2 = 0;
    player.lives = 10;

    switch (player.level) {
        case 0:
            curColMap = &insructionsMapBitmap;
            player.col = SHIFTUP(120);
            player.row = SHIFTUP(96);
            break;
        case 1:
            curColMap = &level1MapBitmap;
            player.col = SHIFTUP(12);
            player.row = SHIFTUP(24);
            player.spawnCol = player.col;
            player.spawnRow = player.row;
            break;
        case 2:
            curColMap = &level2MapBitmap;
            player.col = SHIFTUP(80);
            player.row = SHIFTUP(32);
            player.spawnCol = player.col;
            player.spawnRow = player.row;
            player.direction = LEFT;
            break;
        case 3:
            curColMap = &level3MapBitmap;
            player.col = SHIFTUP(16);
            player.row = SHIFTUP(128);
            player.spawnCol = player.col;
            player.spawnRow = player.row;
            break;
    }
}

void respawnPlayer() {
    player.vx = 0;
    player.vy = 0;
    player.canJump = 0;
    player.lastJumpSide = ONGROUND;
    player.lastWallTouch = ONGROUND;

    player.aniCounter = 0;
    player.curFrame = 0;
    player.direction = RIGHT;
    player.playerControls = 1;

    switch (player.level) {
        case 0:
            curColMap = &insructionsMapBitmap;
            player.col = SHIFTUP(120);
            player.row = SHIFTUP(96);
            break;
        case 1:
            curColMap = &level1MapBitmap;
            player.col = SHIFTUP(12);
            player.row = SHIFTUP(24);
            player.spawnCol = player.col;
            player.spawnRow = player.row;
            break;
        case 2:
            curColMap = &level2MapBitmap;
            player.col = SHIFTUP(80);
            player.row = SHIFTUP(32);
            player.spawnCol = player.col;
            player.spawnRow = player.row;
            player.direction = LEFT;
            break;
        case 3:
            curColMap = &level3MapBitmap;
            player.col = SHIFTUP(16);
            player.row = SHIFTUP(128);
            player.spawnCol = player.col;
            player.spawnRow = player.row;
            break;
    }
}

// Updates Player
void updatePlayer() {

    if (player.playerControls) {
        if (player.isCheating) {
            player.vx = 0;
            player.vy = 0;
            if (BUTTON_HELD(BUTTON_UP)) {
                player.vy -= 200;
            }
            if (BUTTON_HELD(BUTTON_DOWN)) {
                player.vy += 200;
            }
            if (BUTTON_HELD(BUTTON_LEFT)) {
                player.vx -= 200;
                player.direction = LEFT;
            }
            if (BUTTON_HELD(BUTTON_RIGHT)) {
                player.vx += 200;
                player.direction = RIGHT;
            }
        } else {
            player.aniState = IDLE;

            player.vy += GRAVITY;
            
            if (BUTTON_PRESSED(BUTTON_UP) && player.canJump) {
                player.vy -= JUMPPOWER;
                player.canJump = 0;
            }
            if (BUTTON_HELD(BUTTON_LEFT)) {
                player.direction = LEFT;
                player.aniState = RUNNING;
                player.vx -= XACCELERATION;
                if (player.vx <= -MAXVX) {
                    player.vx = -MAXVX;
                }
            }
            if (BUTTON_HELD(BUTTON_RIGHT)) {
                player.direction = RIGHT;
                player.aniState = RUNNING;
                player.vx += XACCELERATION;
                if (MAXVX <= player.vx) {
                    player.vx = MAXVX;
                }
            }

            // applying friction
            if (0 < player.vx) {
                player.vx -= FRICTION;
                if (player.vx < 0) {
                    player.vx = 0;
                }
            } else if (player.vx < 0) {
                player.vx += FRICTION;
                if (0 < player.vx) {
                    player.vx = 0;
                }
            }

            if (freeToMove(SHIFTDOWN(player.col), SHIFTDOWN(player.row), 
                        player.width-1, player.height, 0, -1, curColMap)) {                // player not on ground
                if (!freeToMove(SHIFTDOWN(player.col), SHIFTDOWN(player.row), 
                            player.width, player.height-1, 1, 0, curColMap)) {             // player on right wall
                    player.lastWallTouch = RIGHT;
                    player.direction = LEFT;
                    player.aniState = ONWALL;
                    if (player.lastJumpSide != player.lastWallTouch) {
                        player.canJump = 1;
                        player.vy = 0;
                        player.vy += GRAVITY;
                        player.vy -= FRICTION;
                        if (BUTTON_PRESSED(BUTTON_UP)) {
                            player.vy -= 900;
                            player.vx -= 600;
                            player.lastJumpSide = RIGHT;
                        }
                        if (BUTTON_HELD(BUTTON_DOWN)) {
                            player.vy += 200;
                        }
                    }
                } else if (!freeToMove(SHIFTDOWN(player.col), SHIFTDOWN(player.row), 
                            player.width, player.height-1, -1, 0, curColMap)) {            // player on left wall
                    player.lastWallTouch = LEFT;
                    player.direction = RIGHT;
                    player.aniState = ONWALL;
                    if (player.lastJumpSide != player.lastWallTouch) {
                        player.canJump = 1;
                        player.vy = 0;
                        player.vy += GRAVITY;
                        player.vy -= FRICTION;
                        if (BUTTON_PRESSED(BUTTON_UP)) {
                            player.vy -= 900;
                            player.vx += 600;
                            player.lastJumpSide = LEFT;
                        }
                        if (BUTTON_HELD(BUTTON_DOWN)) {
                            player.vy += 200;
                        }
                    }
                    
                } else {
                    player.canJump = 0;
                }
            }

            if (freeToMove(SHIFTDOWN(player.col), SHIFTDOWN(player.row), 
                player.width, player.height, 1, 1, curColMap) && 
                freeToMove(SHIFTDOWN(player.col), SHIFTDOWN(player.row), 
                player.width, player.height, -1, -1, curColMap)) {
                if (0 < player.vy) {
                    player.aniState = FALLING;
                } else if (player.vy < 0) {
                    player.aniState = JUMPING;
                }
            }
        }
        

        // check for col collision
        if (freeToMove(SHIFTDOWN(player.col), SHIFTDOWN(player.row), 
                    player.width, player.height-1, SHIFTDOWN(player.vx), 0, curColMap)) {
            player.col += player.vx;
        } else {

            int dCol = 0;
            if (player.vx < 0) {    // player is moving left    (vx is negative)
                for (int i = 0; i >= player.vx; i--) {
                    if (freeToMove(SHIFTDOWN(player.col), SHIFTDOWN(player.row), 
                                player.width, player.height-1, SHIFTDOWN(i), 0, curColMap)) {
                        dCol = i;
                    }
                }
            }
            if (0 < player.vx) {    // player is moving right   (vx is positive)
                for (int i = 0; i <= player.vx; i++) {
                    if (freeToMove(SHIFTDOWN(player.col), SHIFTDOWN(player.row), 
                                player.width, player.height-1, SHIFTDOWN(i), 0, curColMap)) {
                        dCol = i;
                    }
                }
            }
            if (dCol != player.vx) {
                player.vx = 0;
                player.col += dCol;
            } else {
                player.col += player.vx;
            }
        }

        // check for row collision
        if (freeToMove(SHIFTDOWN(player.col), SHIFTDOWN(player.row), 
                    player.width-1, player.height, 0, SHIFTDOWN(player.vy), curColMap)) {
            player.row += player.vy;
        } else {
            player.vy = 0;
            player.canJump = 1;
            player.lastJumpSide = ONGROUND;
            player.lastWallTouch = ONGROUND;
        }
        
        // checking for collision with dead zone and win zone
        if (checkWinDie(SHIFTDOWN(player.col), SHIFTDOWN(player.row), 
            player.width, player.height, curColMap) == 2 && !player.isCheating) {       // player is dead :(
            player.playerControls = 0;
            player.aniState = DYING;
            player.aniCounter = 0;
            player.curFrame = 0;
            player.lives--;
            playEffect(deathEffect_data, deathEffect_length);
        } else if (checkWinDie(SHIFTDOWN(player.col), SHIFTDOWN(player.row), 
            player.width, player.height, curColMap) == 3) { // player at finish :)
            recordPlayer.showInteraction = 1;
            if (BUTTON_PRESSED(BUTTON_A)) {                 // player is advancing
                player.level++;
                recordPlayer.showInteraction = 0;

                // adjusting player and record player locations
                initPlayer();
                initRecordPlayer();
                initCheat();
            }
        } else {
            recordPlayer.showInteraction = 0;
        }
    }

    if (BUTTON_PRESSED(BUTTON_R)) {
        if (player.isCheating2) {
            player.isCheating2 = 0;
        } else {
            player.isCheating2 = 1;
        }
    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        if (player.isCheating) {
            player.isCheating = 0;
        } else if (player.aniState != DYING) {
            player.isCheating = 1;
        }
    }

    if (player.isCheating) {
        player.aniState = CHEATING;
    }

    // animation stuff
    player.aniCounter++;
    player.curFrame += player.aniCounter/8;
    if (player.aniCounter >= 8) {
        player.aniCounter = 0;
        if (player.aniState == DYING && player.curFrame == 4) {
            player.playerControls = 1;
            respawnPlayer();
        }
    }
    
    // writing to shadow OAM
    
    shadowOAM[player.OAMIndex].attr0 = SHIFTDOWN(player.row) | ATTR0_TALL;
    shadowOAM[player.OAMIndex].attr1 = SHIFTDOWN(player.col) | ATTR1_TINY;
    if (player.direction == LEFT) {
        shadowOAM[player.OAMIndex].attr1 |= ATTR1_HFLIP;
    }
    shadowOAM[player.OAMIndex].attr2 = ATTR2_TILEID(player.aniState, (player.curFrame % 4) * 2);
}

void initRecordPlayer() {
    recordPlayer.width = 32;
    recordPlayer.height = 32;

    recordPlayer.showInteraction = 0;
    recordPlayer.flip = 0;
    recordPlayer.OAMIndex = 1;
    recordPlayer.aniState = 30;
    recordPlayer.aniCounter = 0;
    recordPlayer.curFrame = 0;

    switch (player.level) {
        case 0:
            recordPlayer.col = 72;
            recordPlayer.row = 96;
            break;
        case 1:
            recordPlayer.col = 128;
            recordPlayer.row = 120;
            break;
        case 2:
            recordPlayer.col = 178;
            recordPlayer.row = 136;
            break;
        case 3:
            recordPlayer.col = 208;
            recordPlayer.row = 48;
            recordPlayer.flip = 1;
            break;
    }
}

void updateRecordPlayer() {
    recordPlayer.aniCounter++;
    recordPlayer.curFrame += recordPlayer.aniCounter/8;
    if (recordPlayer.aniCounter >= 8) {
        recordPlayer.aniCounter = 0;
    }

    // writing to shadow OAM
    shadowOAM[recordPlayer.OAMIndex].attr0 = recordPlayer.row;
    shadowOAM[recordPlayer.OAMIndex].attr1 = recordPlayer.col | ATTR1_SMALL;
    if (recordPlayer.flip) {
        shadowOAM[recordPlayer.OAMIndex].attr1 |= ATTR1_HFLIP;
    }
    shadowOAM[recordPlayer.OAMIndex].attr2 = ATTR2_TILEID(recordPlayer.aniState, (recordPlayer.curFrame % 4) * 2) | 
                                            ATTR2_PALROW(1); 

    if (!recordPlayer.showInteraction || player.level == 0) {
        shadowOAM[recordPlayer.OAMIndex+1].attr0 = ATTR0_HIDE;
    } else {
        shadowOAM[recordPlayer.OAMIndex+1].attr0 = recordPlayer.row - 8 | ATTR0_WIDE;
        shadowOAM[recordPlayer.OAMIndex+1].attr1 = recordPlayer.col | ATTR1_TINY;
        shadowOAM[recordPlayer.OAMIndex+1].attr2 = ATTR2_TILEID(recordPlayer.aniState - 4, (recordPlayer.curFrame % 4)) | 
                                            ATTR2_PALROW(2);
    }
    
}

void initLivesDisplay() {
    livesDisp.col = 224;
    livesDisp.row = 0;
    livesDisp.width = 8;
    livesDisp.height = 16;
    livesDisp.OAMIndex = 3;
}

void updateLivesDisplay() {
    // writing to shadow OAM
    if (player.level != 0) {
        shadowOAM[livesDisp.OAMIndex].attr0 = livesDisp.row;
        shadowOAM[livesDisp.OAMIndex].attr1 = livesDisp.col | ATTR1_SMALL;
        shadowOAM[livesDisp.OAMIndex].attr2 = ATTR2_TILEID(24 ,(player.lives - 1) * 2) | 
                                                ATTR2_PALROW(2 + player.level);
    } else {
        shadowOAM[livesDisp.OAMIndex].attr0 = ATTR0_HIDE;
    }
}

void initCheat() {
    for (int i = 0; i > 10; i++) {
        cheat[i].OAMIndex = i + 4;
        cheat[i].active = 0;
    }

    switch (player.level) {
        case 0:
            break;
        case 1: 
            // 1st jump
            cheat[0].col = 0;
            cheat[0].row = 120;
            cheat[0].active = 1;

            // 2nd jump
            cheat[1].col = 104;
            cheat[1].row = 104;
            cheat[1].active = 1;

            // 3rd jump
            cheat[2].col = 56;
            cheat[2].row = 80;
            cheat[2].active = 1;

            // 4th jump
            cheat[3].col = 104;
            cheat[3].row = 64;
            cheat[3].active = 1;

            // 5th jump
            cheat[4].col = 56;
            cheat[4].row = 40;
            cheat[4].active = 1;

            // 6th jump
            cheat[5].col = 224;
            cheat[5].row = 96;
            cheat[5].active = 1;
            break;
        case 2:
            // 1st jump
            cheat[0].col = 48;
            cheat[0].row = 88;
            cheat[0].active = 1;

            // 2nd jump
            cheat[1].col = 128;
            cheat[1].row = 112;
            cheat[1].active = 1;

            // 3rd jump
            cheat[2].col = 88;
            cheat[2].row = 104;
            cheat[2].active = 1;

            // 4th jump
            cheat[3].col = 128;
            cheat[3].row = 72;
            cheat[3].active = 1;

            // 5th jump
            cheat[4].active = 0;

            // 6th jump
            cheat[5].active = 0;
            break;
        case 3:
            // 1st jump
            cheat[0].col = 64;
            cheat[0].row = 112;
            cheat[0].active = 1;

            // 2nd jump
            cheat[1].col = 32;
            cheat[1].row = 104;
            cheat[1].active = 1;

            // 3rd jump
            cheat[2].col = 112;
            cheat[2].row = 72;
            cheat[2].active = 1;

            // 4th jump
            cheat[3].col = 0;
            cheat[3].row = 32;
            cheat[3].active = 1;

            // 5th jump
            cheat[4].col = 120;
            cheat[4].row = 128;
            cheat[4].active = 1;

            cheat[5].active = 0;
            break;
    }
}

void updateCheat() {
    for (int i = 0; i < 10; i++) {
        if (cheat[i].active && player.isCheating2) {
            shadowOAM[4 + i].attr0 = cheat[i].row | ATTR0_TALL;
            shadowOAM[4 + i].attr1 = cheat[i].col | ATTR1_TINY;
            shadowOAM[4 + i].attr2 = ATTR2_TILEID(21 + (player.level - 1), i * 2) | ATTR2_PALROW(player.level + 2);
        } else {
            shadowOAM[4 + i].attr0 = ATTR0_HIDE;
        }
        
    }
}