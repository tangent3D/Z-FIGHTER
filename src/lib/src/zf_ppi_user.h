// 8255A Programmable Peripheral Interface definitions for Z-Fighter
// (User parallel port)
// by Tangent 2021

#ifndef ZF_PPI_USER_H
#define ZF_PPI_USER_H

#define USERPORTA   0x80     // PA7-PA0
#define USERPORTB   0x81     // PB7-PB0
#define USERPORTC   0x82     // PC7-PC0
#define USERCTRL    0x83     // User PPI control port

#define MSB         0
#define LSB         1

// User port pinout (male side):
// ╔══════════════════    ═══════════════════╗
// ║ A0 A1 A2 A3 A4 A5 A6 A7 B0 B1 B2 B3 GND ║
// ║ C0 C1 C2 C3 C4 C5 C6 C7 B7 B6 B5 B4 VCC ║
// ╚═════════════════════════════════════════╝

// Write a control word to the PPI control register defining port direction settings (mode 0, Simple I/O):
// Call this function before interfacing with devices on the User parallel port.
// Any port programmed as an output port is initialized to all zeroes when the control word is written.
// pa = Port A, pb = Port B, pcu/pcl = Port C upper/lower
// '0' = output, '1' = input
void ppiUserInit(unsigned char pa, unsigned char pb, unsigned char pcu, unsigned char pcl);

// 8255 BSR (Bit Set/Reset): Set or reset a bit of port C (C0-C7)
// bit: bit selection (0-7)
// state: '0' = off, '1' = on
void ppiBitSet(unsigned char bit, unsigned char state);
    
// Read byte from a PPI port (USERPORTA/B/C)
unsigned char ppiRead(char port);

// Write byte to a PPI port (USERPORTA/B/C, USERCTRL)
void ppiWrite(unsigned char byte, unsigned char port);

// Read byte serially from a pin on port C, pulsing clock pin high after each bit
// bitOrder: 'MSB' when reading most significant bit first, 'LSB' when reading least significant bit first
unsigned char serialRead(unsigned char dataPin, unsigned char clockPin, unsigned char bitOrder);

// Write byte serially to a pin on port C, pulsing clock pin high after each bit
// bitOrder: 'MSB' when writing most significant bit first, 'LSB' when writing least significant bit first
void serialWrite(unsigned char byte, unsigned char dataPin, unsigned char clockPin, unsigned char bitOrder);

// Test a bit in a byte and return 0 or 1
unsigned char bitTest(char bit, char byte);

// Reverse order of all bits in a byte
unsigned char byteReverse(char byte);

// Convert a BCD (binary-coded decimal) value to binary
unsigned char bcd2bin(unsigned char bcd);

// Convert a two-digit (<100) binary value to BCD
unsigned char bin2bcd(unsigned char bin);

#endif