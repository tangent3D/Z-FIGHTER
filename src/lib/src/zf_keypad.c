// Keypad input functions for Z-Fighter
// by Tangent 2021

#include <zf_ppi.h>
#include <zf_keypad.h>

unsigned char keyDown(unsigned char key) __naked
    {
        (void)key;
        __asm
        SECTION CODE_USER

        LD      IY,2                // Bypass return address of function
        ADD     IY,SP
        LD      D,(IY)              // Load parameter (key) into D    
        IN      A,(PORTA)           // Read the current state of the keypad
        AND     D                   // Compare input with specified key
        JR      NZ,0001$             
        LD      L,1                 // Return 1 if key is pressed
        RET
        0001$:
        LD      L,0                 // Return 0 if key is not pressed
        RET
        __endasm;
    }

void keyWait(unsigned char key) __naked
    {
        (void)key;
        __asm 
        SECTION CODE_USER

        LD      IY,2                // Bypass return address of function
        ADD     IY,SP
        LD      D,(IY)              // Load parameter (key) into D          
        0002$:
        IN      A,(PORTA)           // Read the current state of the keypad
        AND     D                   // Compare state of keys with specified key
        JR      NZ,0002$            // Repeat loop until specified key is pressed
        RET
        __endasm;
    }

void keyWaitAny() __naked
    {
        __asm
        SECTION CODE_USER
        
        IN      A,(PORTA)           // Read the current state of the keypad
        CP      0xFF                // Check if any key has been pressed
        JR      Z,_keyWaitAny       // Repeat loop until any key is pressed
        RET
        __endasm;
    }