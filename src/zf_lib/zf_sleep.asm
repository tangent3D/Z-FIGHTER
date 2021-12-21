; Sleep implementation for Z-Fighter
; by Tangent 2021

SECTION code_user

PUBLIC _sleep                   ; Uses FASTCALL. HL = ms
_sleep:
    LD      BC,HL               ; Load parameter (ms) into BC
    PUSH    BC
MLOOP:
    POP     BC                  ; Pop 'ms' value from stack
    LD      A,C
    OR      B
    RET     Z                   ; Return from function if 'ms' = 0
    DEC     BC                  ; Decrease 'ms' by 1
    PUSH    BC                  ; Push 'ms' value to stack
    LD      B,179               ; Sleep for approximately 1 ms
MSLOOP:
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    DJNZ    MSLOOP              ; Decrement loop counter and repeat until 0
    JR      MLOOP               ; Jump back to main loop