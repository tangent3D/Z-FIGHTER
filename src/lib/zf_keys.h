// Keypad input functions for Z-Fighter
// by Tangent 2021

#ifndef ZF_KEYS_H
#define ZF_KEYS_H

#include "zf_ppi.h"

// Key definitions
#define KEY_UP		1
#define KEY_DOWN	2
#define KEY_LEFT	4
#define KEY_RIGHT	8
#define KEY_A		16
#define KEY_B		32
#define KEY_C		64
#define KEY_D		128

/* 
Keypad layout:
+-----+-----+-----+-----+-----+
|     |  U  |     |  A  |  B  |
|     |     |     |     |     |
|  L  +-----+  R  +-----+-----+
|     |  D  |     |  C  |  D  |
|     |     |     |     |     |
+-----+-----+-----+-----+-----+
*/

unsigned char keyGet() __naked
	{
		__asm
		IN 		A,(PORTA)	// Read the current state of the keypad
		LD		L,A 		// Return value
		RET
		__endasm;
	}

void keyWait() __naked
	{
		__asm 

		RET
		__endasm;
	}

#endif