// 8255A Programmable Peripheral Interface definitions for Z-Fighter
// (User parallel port)
// by Tangent 2021

#ifndef ZF_PPI_USER_H
#define ZF_PPI_USER_H

#define USERPORTA   0x80     // PA7-PA0
#define USERPORTB   0x81     // PB7-PB0
#define USERPORTC   0x82     // PC7-PC0
#define USERCTRL    0x83     // User PPI control port

// User port pinout (male side):
// ╔══════════════════    ═══════════════════╗
// ║ A0 A1 A2 A3 A4 A5 A6 A7 B0 B1 B2 B3 GND ║
// ║ C0 C1 C2 C3 C4 C5 C6 C7 B7 B6 B5 B4 VCC ║
// ╚═════════════════════════════════════════╝

// Write a control word to the PPI control register defining port direction settings (mode 0, Simple I/O):
// Any port programmed as an output port is initialized to all zeros when the control word is written.
// pa = Port A, pb = Port B, pcu/pcl = Port C upper/lower
// '0' = output, '1' = input
void ppiUserInit(char pa, char pb, char pcu, char pcl);

// BSR: Set or reset a bit of port C (C0-C7)
// bit: bit selection (0-7)
// state: '0' = off, '1' = on
void bitSet(char bit, char state);
    
// Read byte from PPI port, e.g. USERPORTA    
unsigned char ppiRead(char port);

// Write byte to PPI port, e.g. USERPORTB
void ppiWrite(char byte, char port);

// Read byte serially from a pin on port C (LSB first)
unsigned char serialRead(char dataPin, char clockPin);

// Write byte serially to a pin on port C (LSB first)
void serialWrite(char byte, char dataPin, char clockPin);

// Test a bit and return 0 or 1
unsigned char bitTest(char bit, char byte);

// Reverse order of all bits in a byte
unsigned char bitReverse(char byte);

#endif