// module implementation for z-fighter game "mechzoom"
// by xrrawva 2021

#include <stdlib.h>
#include <zf_gfx.h>
#include <zf_lcd.h>
#include "mode_game.h"
#include "mode_pause.h"
#include "rnd.h"
#include "sound.h"
#include "tilemap.h"
#include "ui.h"
#define TRUE 1
#define FALSE 0

// tileset values
#define EMPTY        0
#define WALL_PIECES  1
#define WALL_BROKEN  2
#define WALL         3
#define MECH_NONE    4
#define MECH         5
#define MECH_ARMORED 6
#define BULLET       7
#define ALIEN        8
#define METAL        9

// tileset frames
const unsigned char tileset0[]={0,0,0,0,0,0,0,0,                  // EMPTY
                                0,32,48,0,0,12,28,0,              // WALL_PIECES  0
                                0,57,115,7,175,63,255,126,        // WALL_BROKEN  0
                                126,255,255,255,255,255,255,126,  // WALL
                                0,0,8,28,8,20,0,0,                // MECH_NONE
                                223,77,231,30,15,37,216,144,      // MECH         0
                                223,109,247,14,31,27,120,96,      // MECH_ARMORED 0
                                0,0,0,255,255,0,0,0,              // BULLET
                                14,108,200,48,56,40,46,2,         // ALIEN        0
                                175,143,255,6,240,246,6,175};     // METAL        0
const unsigned char tileset1[]={0,0,0,0,0,0,0,0,                  // EMPTY
                                0,16,48,0,12,28,0,0,              // WALL_PIECES  1
                                0,57,115,7,175,63,255,126,        // WALL_BROKEN  0
                                126,255,255,255,255,255,255,126,  // WALL
                                0,0,8,28,8,20,0,0,                // MECH_NONE
                                223,77,231,30,15,229,152,16,      // MECH         1
                                223,109,247,14,31,27,120,96,      // MECH_ARMORED 0
                                0,0,0,255,255,0,0,0,              // BULLET
                                0,110,204,48,56,40,46,2,          // ALIEN        1
                                175,141,255,6,240,246,6,175};     // METAL        1
const unsigned char tileset2[]={0,0,0,0,0,0,0,0,                  // EMPTY
                                0,48,16,0,6,14,0,0,               // WALL_PIECES  2
                                0,113,227,7,175,63,255,126,       // WALL_BROKEN  1
                                126,255,255,255,255,255,255,126,  // WALL
                                0,0,8,28,8,20,0,0,                // MECH_NONE
                                223,77,231,30,15,253,144,0,       // MECH         2
                                223,109,247,14,31,27,120,96,      // MECH_ARMORED 0
                                0,0,0,255,255,0,0,0,              // BULLET
                                0,96,206,48,56,40,46,2,           // ALIEN        2
                                175,143,255,6,240,246,6,175};     // METAL        0
const unsigned char tileset3[]={0,0,0,0,0,0,0,0,                  // EMPTY
                                0,48,32,0,0,6,14,0,               // WALL_PIECES  3
                                0,113,227,7,175,63,255,126,       // WALL_BROKEN  1
                                126,255,255,255,255,255,255,126,  // WALL
                                0,0,8,28,8,20,0,0,                // MECH_NONE
                                223,79,231,30,15,61,208,128,      // MECH         3
                                223,111,247,14,31,27,120,96,      // MECH_ARMORED 1
                                0,0,0,255,255,0,0,0,              // BULLET
                                0,110,204,48,56,40,46,2,          // ALIEN        1
                                175,139,255,6,240,246,6,175};     // METAL        3

// world
#define SCROLL_POS_MAX 200 // max 240 (or less?) because used in 8bit additions
#define LANDING_ZONE_LENGTH 16
unsigned char scrollDelay;
unsigned char scrollDelayCounter;
unsigned char scrollPos;
unsigned char interlaceY;

// player
unsigned char playerTile;
unsigned char playerX;
unsigned char playerY;

// score
unsigned char scoreMech;
unsigned char scoreJunk;
unsigned char scoreAlien;
unsigned char scoreMaxMech;
unsigned char scoreMaxJunk;
unsigned char scoreMaxAlien;

// returns TRUE to push back
unsigned char playerCollision()
{
    unsigned char tile=tilemap[(playerY<<4)+playerX];
    if(tile==EMPTY)return FALSE; // nothing?
    if(tile==BULLET)return FALSE; // bullet?
    if(tile<WALL+1)return TRUE; // space junk?
    if(tile<MECH_ARMORED+1) // item?
    {
        if(playerTile==EMPTY)return FALSE; // skip if player already dead
        if(playerTile<tile || tile==MECH_ARMORED) // item: collectable?
        {
            soundEnterMech();
            playerTile=tile;
            tilemap[(playerY<<4)+playerX]=EMPTY;
            if(tile==MECH_ARMORED&&scoreMech<255)scoreMech++;
            return FALSE;
        }
        else // item: not collectable?
        {
            return TRUE;
        }
    }
    if(tile==ALIEN) // hazard?
    {
        if(playerTile==EMPTY)return FALSE; // skip if player already dead
        tilemap[(playerY<<4)+playerX]=EMPTY;
        color=1; // flash screen
        playerTile--;
        if(playerTile<MECH_NONE)playerTile=EMPTY;
        else                    soundLoseMech();
        if(scoreAlien<255)scoreAlien++;
        return FALSE;
    }
    return TRUE; // other: metal?
}

void scroll()
{
    // scroll
    unsigned char* tilemapPointerTo=(interlaceY<<4)+tilemap;
    unsigned char* tilemapPointerFrom=tilemapPointerTo+1;
    for(unsigned char x=0;x<15;x++)
    {
        (*tilemapPointerTo)=(*tilemapPointerFrom);
        tilemapPointerTo++;
        tilemapPointerFrom++;
    }

    // generate new world tiles
    unsigned char newTile=EMPTY;
    if(scrollPos>3) // away from starting zone gate?
    {
        if(scrollPos<SCROLL_POS_MAX) // not landing zone?
        {
            if(rnd(128)==0)
            {
                newTile=MECH_ARMORED;
                if(scoreMaxMech<255)scoreMaxMech++;
            }
            else if((scrollPos&(unsigned char)(1+2+4+8))<4 && rnd(1)==0)
            {
                newTile=WALL;
                if(scoreMaxJunk<255)scoreMaxJunk++;
            }
            else if(rnd(16)==0)
            {
                newTile=ALIEN;
                if(scoreMaxAlien<255)scoreMaxAlien++;
            }
        }
        else // landing zone?
        {
            if(scrollPos==SCROLL_POS_MAX)
            {
                if(interlaceY!=3&&interlaceY!=4)newTile=METAL;
            }
            else if(scrollPos<SCROLL_POS_MAX+LANDING_ZONE_LENGTH-1)
            {
                if(interlaceY==0||interlaceY==7)newTile=METAL;
            }
            else
            {
                newTile=METAL;
            }
        }
    }
    (*tilemapPointerTo)=newTile;
}

void sim()
{
    // interlace and scroll
    interlaceY+=2;
    if     (interlaceY==8)interlaceY=1;
    else if(interlaceY==9)
    {
        interlaceY=0;
        if(scrollDelayCounter==0)
        {
            scrollDelayCounter=scrollDelay;
            scrollPos++;
        }
        scrollDelayCounter--;
    }
    if(!scrollDelayCounter)scroll();

    // sim
    unsigned char* tilemapPointer=(interlaceY<<4)+tilemap+15;
    for(unsigned char x=15;x<16;x--)
    {
        unsigned char tile=(*tilemapPointer);
        if(tile==BULLET)
        {
            (*tilemapPointer)=EMPTY;
            if(x<15)
            {
                unsigned char* tilemapPointer2=tilemapPointer+1;
                unsigned char tile=(*tilemapPointer2);
                if(tile==EMPTY)
                {
                    (*tilemapPointer2)=BULLET;
                }
                else if(tile<WALL+1)
                {
                    (*tilemapPointer2)=tile-1;
                    if(tile==WALL_PIECES)
                    {
                        if(scrollPos+x>15)
                        {
                            if(scoreJunk<255)scoreJunk++;
                        }
                    }
                }
                else if(tile==ALIEN)
                {
                    soundAlienDeath();
                    (*tilemapPointer2)=EMPTY;
                    if(scoreAlien<255)scoreAlien++;
                }
                else if(tile<MECH_ARMORED+1)
                {
                    (*tilemapPointer2)=WALL_PIECES;
                }
            }
        }
        else if(tile==ALIEN)
        {
            (*tilemapPointer)=EMPTY;
            unsigned char* tilemapPointer2=tilemapPointer;
            if((x&(unsigned char)(1+2+4))<4)tilemapPointer2-=16;
            else                            tilemapPointer2+=16;
            if(tilemapPointer2<tilemap||tilemapPointer2>tilemap+16*8-1||(*tilemapPointer2)!=EMPTY)tilemapPointer2=tilemapPointer;
            (*tilemapPointer2)=ALIEN;
        }
        tilemapPointer--;
    }
}

unsigned char modeGame()
{
    // init world
    scrollDelay=4;
    scrollDelayCounter=4;
    scrollPos=0;
    interlaceY=255;
    srand(1201);

    // init player
    playerTile=MECH_NONE;
    playerX=1;
    playerY=4;

    scoreMech=0;
    scoreJunk=0;
    scoreAlien=0;
    scoreMaxMech=0;
    scoreMaxJunk=0;
    scoreMaxAlien=0;

    // starting zone
    unsigned char* tilemapPointer=tilemap;
    for(unsigned char y=0;y<8;y++)
    {
        for(unsigned char x=0;x<16;x++)
        {
            *tilemapPointer=EMPTY;
            if((y==2||y==5) && (x&1) && x>8)*tilemapPointer=MECH;
            if(x==15||y==0||y==7)*tilemapPointer=METAL;
            if(x==15&&(y==3||y==4))*tilemapPointer=EMPTY;
            tilemapPointer++;
        }
    }

    // main loop
    color = 0;
    unsigned char tilesetAnimationFrame=0;
    while(playerTile!=EMPTY)
    {
        // input: move
        unsigned char playerXOld=playerX;
        unsigned char playerYOld=playerY;
        if(keyLeft(FALSE))playerX--;
        if(keyRight(FALSE))playerX++;
        if(playerX>14)playerX=playerXOld;
        if(playerX==playerXOld)
        {
            if(keyUp(FALSE))playerY--;
            if(keyDown(FALSE))playerY++;
            if(playerY>7)playerY=playerYOld;
        }

        // player collision 1/2: from moving
        if(playerCollision())
        {
            playerX=playerXOld;
            playerY=playerYOld;
        }

        // input: shoot
        if(keyOk(FALSE))
        {
            if(playerTile>MECH_NONE)tilemap[(playerY<<4)+playerX]=BULLET;
        }

        // input: pause
        if(keyBack(TRUE))
        {
            soundBack();
            modePause();
        }

        // move and scroll world
        sim();
        sim();

        // player collision 2/2: from scrolling
        if(playerCollision())
        {
            playerX--;
            if(playerX>15)
            {
                playerX++;
                color=1; // flash screen
                playerTile=EMPTY;
            }
        }

        // draw
        tilesetAnimationFrame++;
        if(tilesetAnimationFrame==16)tilesetAnimationFrame=0;
        if     (tilesetAnimationFrame< 4)tileset=tileset0;
        else if(tilesetAnimationFrame< 8)tileset=tileset1;
        else if(tilesetAnimationFrame<12)tileset=tileset2;
        else                             tileset=tileset3;
        drawTilemap();
        block(tileset+(playerTile<<3),playerX,playerY);
        lcd(screen);

        // game complete
        if(scrollPos>SCROLL_POS_MAX+LANDING_ZONE_LENGTH-1)return TRUE;

        // unflash screen
        color=0;
    }
    return FALSE;
}
