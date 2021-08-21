// graphics library definitions for z-fighter
// by tangent and xrrawva 2021

#ifndef ZF_GFX_H
#define ZF_GFX_H

// there is no init()
// init what you need: color = 1; cls();

// coordinates
// x = 0 left ... x = 127 right
// y = 0 top  ... y =  63 bottom
#define SCREEN_W 128
#define SCREEN_H 64

// foreground color used by all zf_gfx functions when called
// 0 means white, 1 means black (default)
extern unsigned char color;

// fills screen with background color (opposite of foreground color)
void cls();

// draws vector graphics
void point(unsigned char x, unsigned char y);
void lineFrom(unsigned char x, unsigned char y);
void lineTo(unsigned char x, unsigned char y); // from last lineFrom() or last lineTo()
void rect(unsigned char x, unsigned char y, unsigned char w, unsigned char h);

// draws sprite
// with top left corner at x y
// sprite bits: 0 means background color, 1 means foreground color
void sprite(const unsigned char* spriteObject, unsigned char x, unsigned char y);
// sprite bits: 0 means transparent, 1 means foreground color
void spriteTransparent(const unsigned char* spriteObject, unsigned char x, unsigned char y);

// sprite object example
//
// 1111111 7x3
// 1000001
// 1111111 = 11111111 00000111 11111???
//              (255)      (7)    (255)
//
//const unsigned char soBox[] = { 7,             // width
//                                3,             // height
//                                255, 7, 255 }; // pixel values (last byte can have unused bits)

// image all zf_gfx functions draw onto
// each byte represents 8 horizontal pixels
// 0 means white, 1 means black
extern unsigned char screen[(SCREEN_W / 8) * SCREEN_H];

// used by lineFrom() and lineTo()
extern unsigned char oldLineX;
extern unsigned char oldLineY;

#endif // ZF_GFX_H
