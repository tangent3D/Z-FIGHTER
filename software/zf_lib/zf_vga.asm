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
    OUT     (CTRL),A    ; Init PPI
    LD      DE,0        ; Initialize destination address
    LD      BC,1536     ; Initialize byte counter
LOOP:
    LD      A,(HL)      ; Load byte in (HL) to port A
    OUT     (PORTA),A

    LD      A,E         ; Load lower destination address to port B
    OUT     (PORTB),A

    LD      A,D         ; Load upper destination address to port C
    OUT     (PORTC),A

    LD      A,9         ; Toggle WRDY
    OUT     (CTRL),A
    DEC     A
    OUT     (CTRL),A

    INC     HL
    INC     DE

    DEC     BC          ; Check byte counter
    LD      A,C
    OR      B
    JP      NZ,LOOP

    RET


PUBLIC _vga64
_vga64:
    LD      A,80h
    OUT     (CTRL),A    ; Init PPI
    LD      DE,256      ; Initialize destination address
    LD      BC,1024     ; Initialize byte counter
LOOP64:
    LD      A,(HL)      ; Load byte in (HL) to port A
    OUT     (PORTA),A

    LD      A,E         ; Load lower destination address to port B
    OUT     (PORTB),A

    LD      A,D         ; Load upper destination address to port C
    OUT     (PORTC),A

    LD      A,9         ; Toggle WRDY
    OUT     (CTRL),A
    LD      A,8
    OUT     (CTRL),A

    INC     HL
    INC     DE

    DEC     BC          ; Check byte counter
    LD      A,C
    OR      B
    JP      NZ,LOOP64

    RET

PUBLIC _joyTest
_joyTest:
    LD      A,90h
    OUT     (CTRL),A    ; Init PPI, Port A = input

    LD      A,11
    OUT     (CTRL),A    ; C5 = on

    IN      A,(PORTA)   ; Read and return state of Joystick 1
    LD      L,A

    LD      A,10
    OUT     (CTRL),A    ; C5 = off


    LD      A,80h
    OUT     (CTRL),A    ; Init PPI, Port A = output

    RET