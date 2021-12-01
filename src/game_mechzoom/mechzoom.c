// space shooter game for z-fighter
// by xrrawva 2021

#include <zf_buzzer.h>
#include <zf_gfx.h>
#include <zf_keypad.h>
#include <zf_lcd.h>
#include "rnd.h"
#include "rnd.c"
#include "tilemap.h"
#include "tilemap.c"
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
#define DEMON        8

// tilesets
const unsigned char tilesetFrame0[]={0,0,0,0,0,0,0,0,                 // EMPTY
                                     243,64,4,48,3,64,12,126,         // WALL_PIECES
                                     255,227,15,127,7,193,31,255,     // WALL_BROKEN
                                     255,255,255,255,255,255,255,255, // WALL
                                     0,8,28,8,20,0,0,0,               // MECH_NONE
                                     223,77,231,30,15,37,216,144,     // MECH
                                     223,109,247,78,223,27,48,60,     // MECH_ARMORED
                                     0,0,0,255,255,0,0,0,             // BULLET
                                     14,108,200,48,56,40,46,2};       // DEMON

void scroll()
{
    tilemap[16*1]=0;
    tilemap[16*2]=0;
    tilemap[16*3]=0;
    tilemap[16*4]=0;
    tilemap[16*5]=0;
    tilemap[16*6]=0;
    tilemap[16*7]=0;
    for(unsigned char i=0;i<128-1;i++)
    {
        tilemap[i]=tilemap[i+1];
    }
    tilemap[127]=0;
}

unsigned char simY=255;
void sim()
{
    simY++;
    if(simY==8)simY=0;

    unsigned char* tilemapPointer=(simY<<4)+tilemap;
    for(unsigned char x=1;x<15;x++)
    {
        unsigned char tile=(*tilemapPointer);
        if(tile==BULLET)
        {
            (*tilemapPointer)=EMPTY;
            unsigned char* tilemapPointer2=tilemapPointer;
            tilemapPointer2++;
            unsigned char tile=(*tilemapPointer2);
            if(tile==EMPTY)
            {
                (*tilemapPointer2)=BULLET;
            }
            else if(tile<WALL+1)
            {
                (*tilemapPointer2)=tile-1;
            }
            else if(tile<WALL+1)
            {
                (*tilemapPointer2)=WALL_PIECES; // TODO: EXPLOSION
            }


            x++;
            tilemapPointer++;
        }
        else if(tile==DEMON)
        {
            (*tilemapPointer)=EMPTY;
            unsigned char* tilemapPointer2=tilemapPointer;
            if(x&3)tilemapPointer2-=16;
            else   tilemapPointer2+=16;
            if(tilemapPointer2>tilemap-1 && tilemapPointer2<tilemap+16*8)tilemapPointer2=tilemapPointer;
            (*tilemapPointer2)=DEMON;
        }
        tilemapPointer++;
    }
}

void main()
{
    // player
    unsigned char playerTile=MECH_NONE;
    unsigned char playerX=1;
    unsigned char playerY=4;

    // world
    unsigned char scrollDelay=16;
    unsigned char scrollDelayCounter=1;
    tileset=tilesetFrame0;
    for(unsigned char i=0;i<128;i++)tilemap[i]=EMPTY;

    // main loop
    color = 0;
    unsigned char run=TRUE;
    while(run)
    {
        tilemap[(playerY<<4)+playerX]=EMPTY;

        unsigned char playerXOld=playerX;
        unsigned char playerYOld=playerY;

        if(key(KEY_LEFT))playerX--;
        if(key(KEY_RIGHT))playerX++;
        if(playerX>14)playerX=playerXOld;

        if(key(KEY_UP))playerY--;
        if(key(KEY_DOWN))playerY++;
        if(playerY>7)playerY=playerYOld;

        unsigned char tile=tilemap[(playerY<<4)+playerX];
        if(tile!=EMPTY)
        {
            if(tile<WALL+1) // wall collision
            {
                playerX=playerXOld;
                playerY=playerYOld;
            }
            else if(tile<MECH_ARMORED+1) // item collision
            {
                playerTile++;
                if(playerTile>MECH_ARMORED)
                {
                    playerTile=MECH_ARMORED;
                    // TODO: bonus points
                }
            }
            else // damage collision
            {
                playerTile--;
                if(playerTile<MECH_NONE)
                {
                    playerTile=MECH_NONE; // TODO: game over
                }
            }
        }

        if(key(KEY_A))tilemap[(playerY<<4)+playerX+1]=BULLET;

        sim();
        sim();

        scrollDelayCounter--;
        if(scrollDelayCounter==0)
        {
            scrollDelayCounter=scrollDelay;
            scroll();

            tilemap[(rnd(7)<<4)+15]=DEMON;
            tilemap[(rnd(7)<<4)+15]=WALL;
            tilemap[(rnd(7)<<4)+15]=WALL;
            tilemap[(rnd(7)<<4)+15]=WALL-rnd(2);
        }


        tilemap[(playerY<<4)+playerX]=playerTile;

        drawTilemap();
        lcd(screen);
    }

    // exit
    color = 1;
    cls();
    lcd(screen);
}
