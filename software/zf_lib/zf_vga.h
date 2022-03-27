// VGA Module definitions for Z-FIGHTER
// by Tangent 2022

#ifndef ZF_VGA_H
#define ZF_VGA_H

// Fill VGA module VRAM with a 128x96px bitmap (ex. 'screen' from zf_gfx).
void vga(unsigned char *bitmap) __z88dk_fastcall;

void vga64(unsigned char *bitmap) __z88dk_fastcall;

// Key definitions
#define BTN_UP      1   // Port A bit 0
#define BTN_DOWN    1   //        bit 1
#define BTN_LEFT    1   //        bit 2
#define BTN_RIGHT   1   //        bit 3
#define BTN_A       1   //        bit 4
#define BTN_B       1   //        bit 5
#define BTN_ANY     1

unsigned char joy(unsigned char port, unsigned char button);

unsigned char joyTest();

#endif