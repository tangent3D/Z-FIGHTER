; VGA module implementation for Z-FIGHTER
; by Tangent 2022

EXTERN  PORTA
EXTERN  PORTB
EXTERN  PORTC
EXTERN  CTRL

SECTION code_user

PUBLIC _vga
_vga:
    LD      A,80h
    OUT     (CTRL),A            ; Initialize PPI
    LD      DE,0                ; Initialize destination address
    LD      BC,1536             ; Initialize byte counter
LOOP:
    LD      A,(HL)              ; Load byte in (HL) to port A
    OUT     (PORTA),A

    LD      A,E                 ; Load lower destination address to port B
    OUT     (PORTB),A

    LD      A,D                 ; Load upper destination address to port C
    OUT     (PORTC),A

    LD      A,7                 ; Toggle WRDY ("write ready" control signal)
    OUT     (CTRL),A
    DEC     A
    OUT     (CTRL),A

    INC     HL
    INC     DE

    DEC     BC                  ; Check byte counter
    LD      A,C
    OR      B
    JP      NZ,LOOP             ; Repeat until last byte is written

    RET

PUBLIC _vga64
_vga64:
    LD      A,80h
    OUT     (CTRL),A            ; Init PPI
    LD      DE,256              ; Initialize destination address
    LD      BC,1024             ; Initialize byte counter
LOOP64:
    LD      A,(HL)              ; Load byte in (HL) to port A
    OUT     (PORTA),A

    LD      A,E                 ; Load lower destination address to port B
    OUT     (PORTB),A

    LD      A,D                 ; Load upper destination address to port C
    OUT     (PORTC),A

    LD      A,7                 ; Toggle WRDY
    OUT     (CTRL),A
    DEC     A
    OUT     (CTRL),A

    INC     HL
    INC     DE

    DEC     BC                  ; Check byte counter
    LD      A,C
    OR      B
    JP      NZ,LOOP64

    RET

PUBLIC _vgaWrite
_vgaWrite:
    LD      A,80h
    OUT     (CTRL),A            ; Init PPI

    LD      IY,2                ; Bypass return address of function
    ADD     IY,SP

    LD      A,(IY+2)
    OUT     (PORTA),A           ; Load data to port A

    LD      A,(IY)
    OUT     (PORTB),A           ; Load lower destination address to port B

    LD      A,(IY+1)
    OUT     (PORTC),A           ; Load upper destination address to port C

    LD      A,7                 ; Toggle WRDY
    OUT     (CTRL),A
    DEC     A
    OUT     (CTRL),A

    RET

PUBLIC _joy
_joy:                           ; Uses FASTCALL. L = button
    LD      A,90h
    OUT     (CTRL),A            ; Init PPI, Port A = input

    LD      A,11                ; JOY1 EN2 on
    OUT     (CTRL),A

    IN      A,(PORTA)           ; Read upper half of buffer
    AND     0Fh                 ; Ignore upper nibble
    RLA
    RLA
    RLA
    RLA
    LD      B,A

    LD      A,10                ; JOY1 EN2 off
    OUT     (CTRL),A

    DEC     A                   ; JOY1 EN1 on
    OUT     (CTRL),A

    IN      A,(PORTA)           ; Read lower half of buffer
    AND     0Fh
    OR      B
    LD      B,A                 ; Store state of JOY1 in B

    LD      A,80h
    OUT     (CTRL),A            ; Init PPI, Port A = output

    LD      A,L                 ; Load parameter (button) into A
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