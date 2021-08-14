// WT-1205 50mA electromagnetic buzzer functions for Z-Fighter
// by Tangent 2021

#include "zf_buzzer.h"

void buzzer(int frequency, int duration)
    {
        (void)frequency;
        (void)duration;
        __asm
        LD      IY,2        // Bypass return address of function
        ADD     IY,SP
        LD      L,0(IY)     // Load HL with frequency
        LD      H,1(IY)      
        LD      C,2(IY)     // Load BC with duration
        LD      B,3(IY)      
        BLOOP:
            LD      A,BUZZER_ON
            OUT     (CTRL),A
            CALL    DELAY
            LD      A,BUZZER_OFF
            OUT     (CTRL),A
            CALL    DELAY
            DEC     BC
            LD      A,C
            OR      B
            JP      NZ,BLOOP
        DELAY:
            PUSH    BC
            LD      BC,HL
        DLOOP:
            DEC     BC
            LD      A,C
            OR      B
            JP      NZ,DLOOP
            POP     BC
            RET
        __endasm;
    }