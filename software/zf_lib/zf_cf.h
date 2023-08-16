// CompactFlash definitions for Z-FIGHTER
// tangent.space 2023

#ifndef ZF_CF_H
#define ZF_CF_H

#include <zf_hardware.h>

unsigned char cfInit();

unsigned char cfIdentify();

extern unsigned char cfBuffer[512];

#endif
