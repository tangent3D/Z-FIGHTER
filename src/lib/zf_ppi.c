// 8255A Programmable Peripheral Interface functions for Z-Fighter peripherals
// (Keys, LCD, buzzer)
// by Tangent 2021

#include "zf_ppi.h"

void ppi_init()
    {
        __asm
        LD      A,90h           // 8255 Simple I/O, PA in, PB,C out
        OUT     (CTRL),A
        __endasm;
    }