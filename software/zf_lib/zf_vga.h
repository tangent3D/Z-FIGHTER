// VGA Module definitions for Z-FIGHTER
// by Tangent 2022

#ifndef ZF_VGA_H
#define ZF_VGA_H

// Fill VGA module VRAM with a 128x96px bitmap (ex. 'screen' from zf_gfx).
void vga(unsigned char *bitmap) __z88dk_fastcall;

// Fill VGA module VRAM with a 128x64px bitmap
void vga64(unsigned char *bitmap) __z88dk_fastcall;

// Write a byte to VRAM at specified address (0 to 1535)
void vgaWrite(int address, unsigned char data);

// Button definitions
#define KEY_UP      1 		// bit 0
#define KEY_DOWN    2 		// bit 1
#define KEY_LEFT    4   	// bit 2
#define KEY_RIGHT   8   	// bit 3
#define KEY_A       16  	// bit 4
#define KEY_B       32  	// bit 5
#define KEY_C       64  	// bit 6
#define KEY_D       128 	// bit 7
#define KEY_ANY     255


// Horrible cludge based on _key from zf_keypad.asm
// Check if a specific JOY1 button is pressed (ex. 'KEY_UP')
unsigned char joy(unsigned char button) __z88dk_fastcall;

#endif