// graphics library definitions for z-fighter
// by tangent and xrrawva 2021

#ifndef ZF_GFX_H
#define ZF_GFX_H

// pixel coordinates
// x = 0 left ... x = 127 right
// y = 0 top  ... y =  63 bottom
#define SCREEN_W 128
#define SCREEN_H 96

// there is no gfxInit()
// init what you need: color=1; cls(); lcd(screen);

// used by all zf_gfx functions
// 0 turns pixels off, 1 turns pixels on (suggested default)
extern unsigned char color;

// if color is set to 1: sets all screen pixels to off
// if color is set to 0: sets all screen pixels to on
void cls();

// draws vector graphic
void point(unsigned char x, unsigned char y);
void lineFrom(unsigned char x, unsigned char y);
void lineTo(unsigned char x, unsigned char y); // from last lineFrom() or last lineTo()
void rect(unsigned char x, unsigned char y, unsigned char w, unsigned char h);

// draws sprite
// with top left corner at x y
// sprite pattern bits if color is set to 1: 0 means pixel off, 1 means pixel on
// sprite pattern bits if color is set to 0: 1 means pixel off, 0 means pixel on
void sprite(const unsigned char* spritePattern, unsigned char x, unsigned char y);
// sprite pattern bits if color is set to 1: 0 means transparent, 1 means pixel on
// sprite pattern bits if color is set to 0: 0 means transparent, 1 means pixel off
void spriteTransparent(const unsigned char* spritePattern, unsigned char x, unsigned char y);

// sprite pattern example
// ---------
// |1111111| <- 7x3 pixel image
// |1000001|
// |1111111|
// ---------
// ->  bits: 11111111 00000111 11111???
// -> bytes:      255        7      255
// ->  code: const unsigned char spBox[] = {7,            // width
//                                          3,            // height
//                                          255, 7, 255}; // pixel values (last byte can contain unused bits)

// overwrites a screen block (8x8 pixels)
// on grid at blockX blockY
// block pattern bits if color is set to 1: 0 means pixel off, 1 means pixel on
// block pattern bits if color is set to 0: 1 means pixel off, 0 means pixel on
void block(const unsigned char* blockPattern, unsigned char blockX, unsigned char blockY);

// block coordinates
// blockX = 0 left ... blockX = 15 right
// blockY = 0 top  ... blockY =  7 bottom

// block pattern example
// ----------
// |11111111| <- 8x8 pixel image
// |10000001|
// |10000001|
// |10000001|
// |10000001|
// |10000001|
// |10000001|
// |11111111|
// ----------
// ->  bits: 11111111 10000001 10000001 10000001 10000001 10000001 10000001 11111111
// -> bytes:      255      129      129      129      129      129      129      255
// ->  code: const unsigned char bpBox[] = {255, 129, 129, 129, 129, 129, 129, 255}; // pixel values

// the bitmap all zf_gfx functions draw onto
// each byte represents 8 horizontal pixels
// 0 means pixel off, 1 means pixel on
extern unsigned char screen[(SCREEN_W / 8) * SCREEN_H];

#endif // ZF_GFX_H
