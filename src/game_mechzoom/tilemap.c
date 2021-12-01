// tilemap implementation for z-fighter game "mechzoom"
// by xrrawva 2021

#include "tilemap.h"

unsigned char* tileset;
unsigned char tilemap[16*8];

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
