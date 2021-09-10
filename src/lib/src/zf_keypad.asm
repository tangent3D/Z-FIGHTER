; Keypad input implementation for Z-Fighter
; by Tangent 2021

SECTION code_user

INCLUDE "zf_io.asm"

PUBLIC _key
_key:
    LD      IY,2                ; Bypass return address of function
    ADD     IY,SP
    LD      C,PORTA             ; Load C with address of keypad
    IN      B,(C)               ; Read current state of keypad
    LD      A,(IY)              ; Load parameter (key) into A
    CP      255                 ; Check if testing any key
    JR      Z,KEYANY            ; If so, jump to test for any key
    AND     B                   ; Compare input with specified key
    JR      NZ,NOPRESS          ; Jump if specified key is not pressed 
PRESS:
    LD      L,1                 ; Return 1 if key is pressed
    RET
NOPRESS:
    LD      L,0                 ; Return 0 if key is not pressed
    RET
KEYANY:
    CP      B                   ; Test if any key is pressed
    JR      Z,NOPRESS           ; Jump if no key is pressed
    JR      PRESS               ; Otherwise, jump if any key is pressed

PUBLIC _keyWait
_keyWait:
    LD      IY,2                ; Bypass return address of function
    ADD     IY,SP
    LD      C,PORTA             ; Load C with address of keypad
    LD      A,(IY)              ; Load parameter (key) into A
    CP      255                 ; Check if testing any key
    JR      Z,WAITANY           ; If so, jump to test for any key
WAITKEY:
    IN      B,(C)               ; Read current state of keypad
    AND     B                   ; Compare input with specified key
    JR      NZ,WAITKEY          ; Repeat until key is pressed
    RET
WAITANY:
    IN      B,(C)               ; Read current state of keypad
    CP      B                   ; Test if any key is pressed 
    JR      Z,WAITANY          ; Repeat until any key is pressed
    RET
