// Keypad definitions for Z-Fighter
// by Tangent 2021

#ifndef ZF_KEYS_H
#define ZF_KEYS_H

#include "zf_ppi.h"

// Key definitions
#define KEY_UP		1 	// Port A bit 0
#define KEY_DOWN	2 	//   ''   bit 1
#define KEY_LEFT	4 	// 	 ''   bit 2
#define KEY_RIGHT	8 	// 	 ''   bit 3
#define KEY_A		16  // 	 ''   bit 4
#define KEY_B		32 	// 	 ''   bit 5
#define KEY_C		64  //	 ''   bit 6
#define KEY_D		128 // 	 ''   bit 7

// Keys are pulled high with pull-up resistors and
// are in a logic '1' state when not depressed.

// Keypad layout:
// +-----+-----+-----+-----+-----+
// |     |  U  |     |  A  |  B  |
// |     |     |     |     |     |
// |  L  +-----+  R  +-----+-----+
// |     |  D  |     |  C  |  D  |
// |     |     |     |     |     |
// +-----+-----+-----+-----+-----+

// Return the current state of the keypad keys
unsigned char keyGet();

// Wait until a specific key is pressed (ex. 'KEY_UP')
void keyWait(unsigned char key);

#endif