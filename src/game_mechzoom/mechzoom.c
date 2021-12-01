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
const unsigned char tilesetFrame0[]={0,0,0,0,0,0,0,0,                  // EMPTY
                                     0,32,48,0,0,6,14,0,               // WALL_PIECES rock
                                     0,57,115,7,175,63,255,126,        // WALL_BROKEN rock
                                     126,255,255,255,255,255,255,126,  // WALL        rock
                                     0,0,8,28,8,20,0,0,                // MECH_NONE
                                     223,77,231,30,15,37,216,144,      // MECH
                                     223,109,247,78,223,27,48,60,      // MECH_ARMORED
                                     0,0,0,255,255,0,0,0,              // BULLET
                                     14,108,200,48,56,40,46,2};        // DEMON
// TODO: animation vs level skins
const unsigned char tilesetFrame1[]={0,0,0,0,0,0,0,0,                  // EMPTY
                                     0,48,192,4,4,4,8,0,               // WALL_PIECES metal
                                     36,36,255,36,36,255,36,36,        // WALL_BROKEN metal
                                     255,189,255,255,255,255,189,255}; // WALL        metal

void scrollAll()
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


unsigned char scrollDelay=4;
unsigned char scrollDelayCounter=scrollDelay;

//unsigned char scrollY=255;
void scroll()
{
    if(scrollDelayCounter)return;
//    simY++;
  //  if(simY==8)simY=0;

    unsigned char* tilemapPointerTo=(simY<<4)+tilemap;
    unsigned char* tilemapPointerFrom=tilemapPointerTo+1;
    for(unsigned char x=0;x<15;x++)
    {
        (*tilemapPointerTo)=(*tilemapPointerFrom);
        tilemapPointerTo++;
        tilemapPointerFrom++;
    }

    unsigned char newTile=EMPTY;
    if(rnd(16)==0)newTile=DEMON;
    if(rnd(8)==0)newTile=WALL;
    (*tilemapPointerTo)=newTile;





}

void sim()
{
    simY++;
    if(simY==8)
        {
        simY=0;

        if(scrollDelayCounter==0)scrollDelayCounter=scrollDelay;
        scrollDelayCounter--;
        }

    scroll();

    unsigned char* tilemapPointer=(simY<<4)+tilemap+15;
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
                }
                else
                {
                    (*tilemapPointer2)=WALL_PIECES; // TODO: EXPLOSION?
                }
                //x++;
                //tilemapPointer++;
            }
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
        tilemapPointer--;
    }
}

void main()
{
    unsigned char playerTile=MECH;
    unsigned char playerX=3;
    unsigned char playerY=4;


    tileset=tilesetFrame0; // TODO: animate
    for(unsigned char i=0;i<128;i++)tilemap[i]=EMPTY; // TODO: start ramp

    // main loop
    color = 0;
    unsigned char run=TRUE;
    while(run)
    {
        //tilemap[(playerY<<4)+playerX]=EMPTY;

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
            else if(tile>BULLET) // damage collision
            {
                playerTile--;
                if(playerTile<MECH_NONE)
                {
                    playerTile=MECH_NONE; // TODO: game over
                }
            }
        }


/*
        scrollDelayCounter--;
        if(scrollDelayCounter==0)
        {
            scrollDelayCounter=scrollDelay;
            scroll();

            tilemap[(rnd(7)<<4)+15]=DEMON;
            tilemap[(rnd(7)<<4)+15]=WALL-rnd(1);
            //tilemap[(rnd(7)<<4)+15]=WALL-rnd(1);

        }*/

        if(key(KEY_A))tilemap[(playerY<<4)+playerX]=BULLET;

        sim();
        sim();

        //tilemap[(playerY<<4)+playerX]=playerTile;


        drawTilemap();

        block(tileset+( playerTile<<3 ),playerX,playerY);

        lcd(screen);
    }

    // exit
    color = 1;
    cls();
    lcd(screen);
}
