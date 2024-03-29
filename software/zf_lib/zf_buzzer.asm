; WT-1205 50mA electromagnetic buzzer implementation for Z-Fighter
; by Tangent 2021

EXTERN BUZZER_ON
EXTERN BUZZER_OFF 
EXTERN CTRL_ACC

SECTION code_user

PUBLIC _buzzer
_buzzer:
    DI                  ; Disable interrupts
    LD      IY,2        ; Bypass return address of function
    ADD     IY,SP
    LD      L,(IY)      ; Load HL with parameter (pulseWidth)
    LD      H,(IY+1)      
    LD      C,(IY+2)    ; Load BC with parameter (waveCycles)
    LD      B,(IY+3)      
BLOOP:
    LD      A,BUZZER_ON
    OUT     (CTRL_ACC),A
    CALL    DELAY
    LD      A,BUZZER_OFF
    OUT     (CTRL_ACC),A
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
    EI                  ; Enable interrupts
    RET