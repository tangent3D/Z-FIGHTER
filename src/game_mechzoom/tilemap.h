// tilemap definitions for z-fighter game "mechzoom"
// by xrrawva 2021

#ifndef MECHZOOM_TILEMAP_H
#define MECHZOOM_TILEMAP_H

extern unsigned char* tileset; // pointer to first zf gfx block in tileset
extern unsigned char tilemap[16*8]; // tilemap[(y<<3)+x]=...

void drawTilemap();

#endif // MECHZOOM_TILEMAP_H
