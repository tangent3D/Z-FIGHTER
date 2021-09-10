// Keypad definitions for Z-Fighter
// by Tangent 2021

// Always #include <zf_ppi.h> and call ppiInit() before
// interfacing with Z-Fighter accessory board peripherals.

#ifndef ZF_KEYPAD_H
#define ZF_KEYPAD_H

// Key definitions
#define KEY_UP      1   // Port A bit 0
#define KEY_DOWN    2   //        bit 1
#define KEY_LEFT    4   //        bit 2
#define KEY_RIGHT   8   //        bit 3
#define KEY_A       16  //        bit 4
#define KEY_B       32  //        bit 5
#define KEY_C       64  //        bit 6
#define KEY_D       128 //        bit 7
#define KEY_ANY     255

// Keypad layout:
// +-----+-----+-----+-----+-----+
// |     |  U  |     |  A  |  B  |
// |     |     |     |     |     |
// |  L  +-----+  R  +-----+-----+
// |     |  D  |     |  C  |  D  |
// |     |     |     |     |     |
// +-----+-----+-----+-----+-----+

// Check if a specific key is pressed (ex. 'KEY_UP')
unsigned char key(unsigned char key);

// Wait until a specific key is pressed 
void keyWait(unsigned char key);

#endif
