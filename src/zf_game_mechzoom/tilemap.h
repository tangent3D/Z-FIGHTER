// module definitions for z-fighter game "mechzoom"
// by xrrawva 2021

#ifndef MECHZOOM_TILEMAP_H
#define MECHZOOM_TILEMAP_H

extern const unsigned char* tileset; // pointer to first zf gfx block in tileset
extern unsigned char tilemap[16*8]; // tilemap[(y<<3)+x]=...

void drawTilemap();
void drawTilemapOverlay(unsigned char* tilemapPointer, unsigned char yOffset);

#endif // MECHZOOM_TILEMAP_H
