// Z80 SIO/0 Serial Input/Output controller definitions for Z-Fighter
// by Tangent 2021

#ifndef ZF_SIO_H
#define ZF_SIO_H

#include <zf_hardware.h>

// FIXME
// #define SIO_A 0x02      // SIO channel A control port
// #define SIO_B 0x03      // SIO channel B control port

// Initialize specified channel with default configuration (8-N-1, no flow control).
void sioInit(unsigned char channel);

// Read specified channel. If no RX character is available, return 0.
unsigned char sioRead(unsigned char channel);

// Poll specified channel until RX character is available to read.
unsigned char sioWait(unsigned char channel);

// Wait until TX buffer is empty and write character to specified channel.
void sioWrite(unsigned char channel, unsigned char character);

// Write string to specified channel.
// unsigned char string[]="Hello, world!\n";
// sioPrint(SIO_A, string);
void sioPrint(unsigned char channel, unsigned char string[]);

#endif