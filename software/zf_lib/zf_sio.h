// Z80 SIO/0 Serial Input/Output controller definitions for Z-Fighter
// by Tangent 2021

#ifndef ZF_SIO_H
#define ZF_SIO_H

#include <zf_hardware.h>

// Define SIO channel. 'channel' variable is initialized as '0'.
// channel = 0; // Subsequent data I/O and configuration will occur on SIO channel A.
// channel = 1; // Subsequent data I/O and configuration will occur on SIO channel B.
extern unsigned char sioChannel;

// Initialize specified channel with typical configuration (115200 baud, 8-N-1).
void sioInit();

// Set channel RTS state.
// sioRTS(0); // Channel RTS reset
// sioRTS(1); // Channel RTS set
void sioSetRTS(unsigned char rts) __z88dk_fastcall;

// Wait until channel CTS set.
void sioWaitCTS();

// Write character to specified channel when ready.
void sioWrite(unsigned char character) __z88dk_fastcall;

// Wait for CTS and dump specified number of bytes beginning at specified base address.
void sioDump(unsigned char *baseAddr, unsigned long bytes);

#endif
