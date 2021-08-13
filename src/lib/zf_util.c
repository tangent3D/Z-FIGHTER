// Utility functions for Z-Fighter
// by Tangent 2021

#include "zf_util.h"

// TODO: Reduce amount of instructions
void sleepSec() __naked
    {
        __asm
        LD      BC,63565
        0003$:
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        DEC     BC
        LD      A,C
        OR      B
        JP      NZ,0003$
        ret
        __endasm;
    }

// TODO: Reduce amount of instructions
void sleepHlfSec() __naked
    {
        __asm
        LD      BC,61439
        0004$:
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        DEC     BC
        LD      A,C
        OR      B
        JP      NZ,0004$
        ret
        __endasm;
    }

void sleepQtrSec() __naked
    {
        __asm
        LD      BC,57596
        0005$:
        NOP
        NOP
        DEC     BC
        LD      A,C
        OR      B
        JP      NZ,0005$
        ret
        __endasm;
    }

void sleepEgtSec() __naked
    {
        __asm
        LD      BC,38396
        0006$:
        DEC     BC
        LD      A,C
        OR      B
        JP      NZ,0006$
        ret
        __endasm;
    }