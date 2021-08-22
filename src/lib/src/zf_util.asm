; Utility functions for Z-Fighter
; by Tangent 2021
; TODO: Reduce amount of instructions

SECTION code_user

PUBLIC _sleep1000
_sleep1000:
    LD      BC,63565
SL1:
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    DEC     BC
    LD      A,C
    OR      B
    JP      NZ,SL1
    RET

PUBLIC _sleep500
_sleep500:
    LD      BC,61439
SL2:
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    DEC     BC
    LD      A,C
    OR      B
    JP      NZ,SL2
    ret

PUBLIC _sleep250
_sleep250:
    LD      BC,57596
SL3:
    NOP
    NOP
    DEC     BC
    LD      A,C
    OR      B
    JP      NZ,SL3
    ret

PUBLIC _sleep125
_sleep125:
    LD      BC,38396
SL4:
    DEC     BC
    LD      A,C
    OR      B
    JP      NZ,SL4
    ret