; Keypad input implementation for Z-Fighter
; by Tangent 2021

SECTION code_user

INCLUDE "zf_io.asm"

PUBLIC _key
_key:
    LD      IY,2                ; Bypass return address of function
    ADD     IY,SP
    LD      D,(IY)              ; Load parameter (key) into D    
    IN      A,(PORTA)           ; Read current state of keypad
    AND     D                   ; Compare input with specified key
    JR      NZ,KD1             
    LD      L,1                 ; Return 1 if key is pressed
    RET
KD1:
    LD      L,0                 ; Return 0 if key is not pressed
    RET

PUBLIC _keyAny 
_keyAny:
    IN      A,(PORTA)           ; Read current state of keypad
    CP      255                 ; Compare input with 255
    JR      NZ,KA1
    LD      L,0                 ; Return 0 if no key is pressed
    RET                         
KA1:
    LD      L,1                 ; Return 1 if any key is pressed
    RET


PUBLIC _keyWait
_keyWait:
    LD      IY,2                ; Bypass return address of function
    ADD     IY,SP
    LD      D,(IY)              ; Load parameter (key) into D          
KW1:
    IN      A,(PORTA)           ; Read current state of keypad
    AND     D                   ; Compare state of keys with specified key
    JR      NZ,KW1              ; Repeat loop until specified key is pressed
    RET

PUBLIC _keyWaitAny
_keyWaitAny:
    IN      A,(PORTA)           ; Read current state of keypad
    CP      255                 ; Check if any key has been pressed
    JR      Z,_keyWaitAny       ; Repeat loop until any key is pressed
    RET