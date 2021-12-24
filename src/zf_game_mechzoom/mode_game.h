// module definitions for z-fighter game "mechzoom"
// by xrrawva 2021

#ifndef MECHZOOM_MODEGAME_H
#define MECHZOOM_MODEGAME_H

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
extern const unsigned char tileset0[];
extern const unsigned char tileset1[];
extern const unsigned char tileset2[];
extern const unsigned char tileset3[];

// world
#define SCROLL_POS_MAX 200 // max 240 (or less?) because used in 8bit additions
#define LANDING_ZONE_LENGTH 16
extern unsigned char scrollDelay;
extern unsigned char scrollDelayCounter;
extern unsigned char scrollPos;
extern unsigned char interlaceY;

// player
extern unsigned char playerTile;
extern unsigned char playerX;
extern unsigned char playerY;

extern unsigned char scoreMech;
extern unsigned char scoreJunk;
extern unsigned char scoreAlien;
extern unsigned char scoreMaxMech;
extern unsigned char scoreMaxJunk;
extern unsigned char scoreMaxAlien;

unsigned char modeGame();
void sim();
void scroll();
unsigned char playerCollision(); // returns TRUE to push back

#endif // MECHZOOM_MODEGAME_H
