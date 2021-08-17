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

unsigned char cw;

void ppiUserInit(char pa, char pb, char pcu, char pcl);

void bitSet(char bit, char state);
    
unsigned char ppiRead(char port);

void ppiWrite(char byte, char port);

unsigned char spiRead(char dataPin, char clockPin);

void spiWrite(char byte, char dataPin, char clockPin);

void ppiWriteControlWord();

unsigned char bitTest(char bit, char byte);

unsigned char bitReverse(char byte);

#endif

