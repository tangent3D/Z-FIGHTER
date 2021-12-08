; Initialization instructions for Z-Fighter
; by Tangent 2021

EXTERN CTRL_ACC

SECTION code_crt_init

; Code in this section will execute just before _main is called.
; Code in this section must fall through and not contain any RETs.

ZF_INIT:
    LD      A,90h           ; Set accessory PPI Simple I/O, PA in, PB,C out
    OUT     (CTRL_ACC),A
