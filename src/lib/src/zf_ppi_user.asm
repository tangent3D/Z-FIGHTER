; 8255A Programmable Peripheral Interface implementation for Z-Fighter
; (User parallel port)
; by Tangent 2021

SECTION code_user

PUBLIC _ppiRead
_ppiRead:
    LD      IY,2                    ; Bypass the return address of the function
    ADD     IY,SP
    LD      C,(IY)                  ; Load parameter (port) in to C
    IN      L,(C)                   ; Read and return the specified port
    RET

PUBLIC _ppiWrite
_ppiWrite:
    LD      IY,2                    ; Bypass the return address of the function
    ADD     IY,SP
    LD      A,(IY)                  ; Load parameter (byte) into A
    LD      C,(IY+1)                ; Load parameter (port) into C
    OUT     (C),A                   ; Write byte to the specified port
    RET

PUBLIC _byteReverse
_byteReverse:
    LD      IY,2                    ; Bypass the return address of the function
    ADD     IY,SP
    LD      L,(IY)                  ; Load parameter (byte) into L
    LD      B,8                     ; Reverse all bits in byte
BRLOOP:
    RL      L
    RRA
    DJNZ    BRLOOP
    LD      L,A
    RET