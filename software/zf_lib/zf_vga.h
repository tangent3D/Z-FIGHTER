// VGA Module definitions for Z-FIGHTER
// by Tangent 2022

#ifndef ZF_VGA_H
#define ZF_VGA_H

// Fill VGA module VRAM with a 128x96px bitmap (ex. 'screen' from zf_gfx).
void vga(unsigned char *bitmap) __z88dk_fastcall;

void vga64(unsigned char *bitmap) __z88dk_fastcall;

#endif