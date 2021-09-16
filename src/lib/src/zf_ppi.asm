; 8255A Programmable Peripheral Interface implementation for Z-Fighter peripherals
; (Keys, LCD, buzzer)
; by Tangent 2021

SECTION code_user

EXTERN CTRL

PUBLIC _ppiInit
_ppiInit:
    LD      A,90h           ; 8255 Simple I/O, PA in, PB,C out
    OUT     (CTRL),A
    RET