// 8255A Programmable Peripheral Interface definitions for Z-Fighter
// (Keys, LCD, buzzer)
// by Tangent 2021

#ifndef ZF_PPI_H
#define ZF_PPI_H

// Initialize accessory board PPI to default state.
// Call this function before interfacing with peripherals.
// (Mode 0 (Simple I/O), port A input, ports B/C output)
void ppiInit();

#endif