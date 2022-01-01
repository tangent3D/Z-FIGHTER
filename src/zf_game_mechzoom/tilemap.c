// module implementation for z-fighter game "mechzoom"
// by xrrawva 2021

#include <zf_gfx.h>
#include "tilemap.h"

const unsigned char* tileset=0;
unsigned char tilemap[16*8]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                             0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

void drawTilemap()
{
    unsigned char* tilemapPointer=tilemap;
    for(unsigned char y=0;y<8;y++)
    {
        for(unsigned char x=0;x<16;x++)
        {
            block(tileset+( (*tilemapPointer)<<3 ),x,y);
            tilemapPointer++;
        }
    }
}

void drawTilemapOverlay(unsigned char* tilemapPointer, unsigned char yOffset)
{
    for(unsigned char y=0;y<8;y++)
    {
        for(unsigned char x=0;x<16;x++)
        {
            unsigned char tileId=*tilemapPointer;
            if(tileId)block(tileset+( tileId<<3 ),x,y+yOffset);
            tilemapPointer++;
        }
    }
}
