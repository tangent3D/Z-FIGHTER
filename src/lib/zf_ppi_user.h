// 8255A Programmable Peripheral Interface definitions for Z-Fighter
// (User parallel port)
// by Tangent 2021

#ifndef ZF_PPI_H
#define ZF_PPI_H

#define USERPORTA   80h     // PA7-PA0
#define USERPORTB   81h     // PB7-PB0
#define USERPORTC   82h     // PC7-PC0
#define USERCTRL    83h     // User PPI control port

// User port pinout (male side):
// ╔══════════════════    ═══════════════════╗
// ║ A0 A1 A2 A3 A4 A5 A6 A7 B0 B1 B2 B3 GND ║
// ║ C0 C1 C2 C3 C4 C5 C6 C7 B7 B6 B5 B4 VCC ║
// ╚═════════════════════════════════════════╝

#endif