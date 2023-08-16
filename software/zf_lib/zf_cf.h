// CompactFlash definitions for Z-FIGHTER
// tangent.space 2023

#ifndef ZF_CF_H
#define ZF_CF_H

#include <zf_hardware.h>

// Initialize CF card for data transfers
unsigned char cfInit();

// Read a specified sector (28-bit LBA)
unsigned char cfRead(unsigned long sector);

// 512-byte sector buffer
extern unsigned char cfBuffer[512];

#endif
