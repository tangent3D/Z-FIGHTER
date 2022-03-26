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
    OUT     (CTRL),A    ;Init PPI
    LD      DE,0        ;Initialize destination address
    LD      BC,1536     ;Initialize byte counter
LOOP:
    LD      A,(HL)
    OUT     (PORTA),A

    LD      A,E
    OUT     (PORTB),A

    LD      A,D
    OUT     (PORTC),A

    LD      A,9
    OUT     (CTRL),A
    LD      A,8
    OUT     (CTRL),A

    INC     HL
    INC     DE

    DEC     BC
    LD      A,C
    OR      B
    JP      NZ,LOOP

RET