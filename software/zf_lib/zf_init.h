// Hardware initialization definitions for Z-Fighter
// by Tangent 2021

#ifndef ZF_INIT_H
#define ZF_INIT_H

// Initialize Z-FIGHTER's accessory PPI for use with Z-FIGHTER's peripherals.
// This initialization code is included alongside the CRT startup code and is not typically required.
// When building for CP/M or with startup code disabled, call zf_init() before using Z-FIGHTER peripherals.
void zf_init();

#endif