; WT-1205 50mA electromagnetic buzzer implementation for Z-Fighter
; by Tangent 2021

SECTION code_user

INCLUDE "zf_io.asm"

PUBLIC _buzzer
_buzzer:
    LD      IY,2        ; Bypass return address of function
    ADD     IY,SP
    LD      L,(IY)      ; Load HL with parameter (pulseWidth)
    LD      H,(IY+1)      
    LD      C,(IY+2)    ; Load BC with parameter (waveCycles)
    LD      B,(IY+3)      
BLOOP:
    LD      A,BUZZER_ON
    OUT     (CTRL),A
    CALL    DELAY
    LD      A,BUZZER_OFF
    OUT     (CTRL),A
    CALL    DELAY
    DEC     BC
    LD      A,C
    OR      B
    JP      NZ,BLOOP
DELAY:
    PUSH    BC
    LD      BC,HL
DLOOP:
    DEC     BC
    LD      A,C
    OR      B
    JP      NZ,DLOOP
    POP     BC
    RET