// Sleep definitions for Z-Fighter
// by Tangent 2021

#ifndef ZF_SLEEP_H
#define ZF_SLEEP_H

// Sleep an approximate number of milliseconds.
// Assumes a system clock frequency of 7.3728 MHz.
void sleep(int ms) __z88dk_fastcall;

#endif