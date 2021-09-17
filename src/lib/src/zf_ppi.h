// 8255A Programmable Peripheral Interface definitions for Z-Fighter
// (User parallel port)
// by Tangent 2021

#ifndef ZF_PPI_H
#define ZF_PPI_H

#include <zf_hardware.h>

// User port pinout (male side):
// ╔══════════════════    ═══════════════════╗
// ║ A0 A1 A2 A3 A4 A5 A6 A7 B0 B1 B2 B3 GND ║
// ║ C0 C1 C2 C3 C4 C5 C6 C7 B7 B6 B5 B4 VCC ║
// ╚═════════════════════════════════════════╝

// Before I/O, the PPI must be initialized by writing a control word to its control port.
// '0' will set a port as output, '1' will set a port as input.
// Example: ctrl = 0b1001000; // I/O Mode 0, port A = input, port B = output, port Cu/Cl output.
//
// D7:      Always '1' for I/O mode.
// D6-D5:   Group A Mode Selection:      00 = Mode 1
//                                       01 = Mode 0
//                                       1x = Mode 2
// D4:      Port A
// D3:      Port Cu (PC7-PC4)
// D2:      Group B Mode Selection:      0 = Mode 0
//                                       1 = Mode 1
// D1:      Port B
// D0:      Port Cl (PC3-PC0)

// Special Function Registers (SFR) for 8-bit I/O ports:
// Example: pa = foo;   // Write to port A
//          bar = pb;   // Read from port B
            
__sfr __at PORTA pa;
__sfr __at PORTB pb;
__sfr __at PORTC pc;
__sfr __at CTRL  ctrl;

// BSR (Bit Set/Reset) control words:
// Always use these values as definitions for pins on port C.
// Write the value of the bit to the control port to RESET a pin on port C.
// Write the value of the bit +1 to SET a pin on port C.
// Example: ctrl = c0+1; // SET port C pin 1.

#define c0 0x00
#define c1 0x02
#define c2 0x04
#define c3 0x06
#define c4 0x08
#define c5 0x0A
#define c6 0x0C
#define c7 0x0E

// Define bit order for serial read/write functions. Default is MSB first.
// Subsequent calls of serialRead and serialWrite will use bit order specified.
// Example: bitOrder = LSB;
extern unsigned char bitOrder;

#define MSB 0
#define LSB 1

// Read byte serially from a pin on port C, pulsing clock pin high after each bit.
// Connect 'MISO' to an input port on port C. Connect 'CLK' to an output pin on port C.
// Example: serialRead(c0,c4);	// Read a byte serially from port C pin 0.
unsigned char serialRead(unsigned char dataPin, unsigned char clockPin);

// Write byte serially to a pin on port C, pulsing clock pin high after each bit.
// Connect 'MOSI' to an output port on port C. Connect 'CLK' to an output pin on port C.
// Example: serialWrite(c4,c0);	// Write a byte serially from port C pin 4.
void serialWrite(unsigned char byte, unsigned char dataPin, unsigned char clockPin);

// Test a bit (0-7) in a byte and return 0 if bit is reset or 1 if bit is set.
unsigned char bitTest(char bit, char byte);

// Reverse order of all bits in a byte.
unsigned char byteReverse(char byte) __z88dk_fastcall;

// Convert a BCD (binary-coded decimal) value to binary.
unsigned char bcd2bin(unsigned char bcd);

// Convert a two-digit (<100) binary value to BCD.
unsigned char bin2bcd(unsigned char bin);

#endif