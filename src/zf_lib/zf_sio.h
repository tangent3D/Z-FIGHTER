// Z80 SIO/0 Serial Input/Output controller definitions for Z-Fighter
// by Tangent 2021

#ifndef ZF_SIO_H
#define ZF_SIO_H

#include <zf_hardware.h>

// Define SIO channel. Subsequent serial I/O will occur on the channel specified.
// Default channel is SIO channel A.
// Example: channel = CH_B; // Subsequent serial I/O will occur on SIO channel B.
#define CH_A SIO_AC // SIO chanel A
#define CH_B SIO_BC // SIO channel B
extern unsigned char channel;

// Initialize specified channel with default configuration (8-N-1, no flow control).
void sioInit();

// Read specified channel. If no RX character is available, return 0.
unsigned char sioRead();

// Poll specified channel until RX character is available to read. Returns the read character.
unsigned char sioWait();

// Wait until TX buffer is empty and write character to specified channel.
void sioWrite(unsigned char character) __z88dk_fastcall;

// Write string to specified channel.
// Example: unsigned char string[]="Hello, world!\n";
//          sioPrint(string);
void sioPrint(unsigned char string[]);

#endif