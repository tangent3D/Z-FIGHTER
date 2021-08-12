// Keypad input functions for Z-Fighter
// by Tangent 2021

#include "zf_keys.h"

unsigned char keyGet() __naked
    {
        __asm
        IN      A,(PORTA)       // Read the current state of the keypad
        LD      L,A             // Return value
        RET
        __endasm;
    }

void keyWait(unsigned char key) __naked
    {
        (void)key;
        __asm 
        LD      IY,2            // Bypass return address of function
        ADD     IY,SP
        LD      D,(IY)          // Load parameter (key) into D          
        KWLOOP:
        IN      A,(PORTA)       // Read the current state of the keypad
        AND     D               // Check if key is pressed
        JR      NZ,KWLOOP       // Repeat loop until key is pressed
        RET
        __endasm;
    }
