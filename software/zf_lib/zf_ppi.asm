; 8255A Programmable Peripheral Interface implementation for Z-Fighter
; (User parallel port)
; by Tangent 2021

SECTION code_user

PUBLIC _byteReverse                 
_byteReverse:                       ; Uses FASTCALL. L = byte
    LD      A,L                     ; Load A with parameter (byte)
    LD      B,8
BRLOOP:
    RL      L                       ; Reverse all bits in A
    RRA
    DJNZ    BRLOOP
    LD      L,A                     ; Return reversed byte
    RET