; graphics library implementation for z-fighter
; by xrrawva 2021

EXTERN _screen_w
EXTERN _screen_h
EXTERN _color
EXTERN _screen
SCREEN_W equ _screen_w
SCREEN_H equ _screen_h
SECTION code_user

; void cls()
PUBLIC _cls
_cls:
    ld hl,_screen

    ld c,0
    ld a,(_color)
    cp 0
    jr nz,start
    ld c,255
start:

    ld a,0
    ld b,6
more:
    ld (hl),c
    inc hl
    dec a
    jr nz,more
    dec b
    jr nz,more

    RET

; void block(const unsigned char* blockPattern, unsigned char blockX, unsigned char blockY)
PUBLIC _block
_block:
    ; prepare reading parameters
    ld iy,2
    add iy,sp

    ; skip if off screen
    ld a,(iy+2) ;  a = blockX
    ld d,0      ; de = blockX
    ld e,a      ; "
    cp SCREEN_W/8
    jr nc,skipBlock
    ld a,(iy+3) ; a = blockY
    cp SCREEN_H/8
    jr nc,skipBlock

    ; hl = screenPointer
    ld h,0 ; = blockY
    ld l,a ; "
    add hl,hl ; <<= 7
    add hl,hl ; "
    add hl,hl ; "
    add hl,hl ; "
    add hl,hl ; "
    add hl,hl ; "
    add hl,hl ; "
    add hl,de ; += blockX
    ld de,_screen ; += (int)screen
    add hl,de     ; "

    ld d,(iy+1) ; de = blockPattern
    ld e,(iy)   ; "

    ld b,0          ; bc = SCREEN_W / 8
    ld c,SCREEN_W/8 ; "

    ; if(color)
    ld a,(_color)
    or a
    jr z,writeBlockInverted

    ; copy pattern non-inverted byte 1
    ld a,(de) ; *(unsigned char*)screenPointer = *blockPattern
    ld (hl),a ; "
    add hl,bc ; screenPointer += SCREEN_W / 8
    inc de    ; blockPattern++

    ; copy pattern non-inverted byte 2
    ld a,(de)
    ld (hl),a
    add hl,bc
    inc de

    ; copy pattern non-inverted byte 3
    ld a,(de)
    ld (hl),a
    add hl,bc
    inc de

    ; copy pattern non-inverted byte 4
    ld a,(de)
    ld (hl),a
    add hl,bc
    inc de

    ; copy pattern non-inverted byte 5
    ld a,(de)
    ld (hl),a
    add hl,bc
    inc de

    ; copy pattern non-inverted byte 6
    ld a,(de)
    ld (hl),a
    add hl,bc
    inc de

    ; copy pattern non-inverted byte 7
    ld a,(de)
    ld (hl),a
    add hl,bc
    inc de

    ; copy pattern non-inverted byte 8
    ld a,(de)
    ld (hl),a

skipBlock:
    RET
writeBlockInverted:

    ; copy pattern inverted byte 1
    ld a,(de) ; *(unsigned char*)screenPointer = ~(*blockPattern)
    cpl       ; 
    ld (hl),a ; "
    add hl,bc ; screenPointer += SCREEN_W / 8
    inc de    ; blockPattern++

    ; copy pattern inverted byte 2
    ld a,(de)
    cpl
    ld (hl),a
    add hl,bc
    inc de

    ; copy pattern inverted byte 3
    ld a,(de)
    cpl
    ld (hl),a
    add hl,bc
    inc de

    ; copy pattern inverted byte 4
    ld a,(de)
    cpl
    ld (hl),a
    add hl,bc
    inc de

    ; copy pattern inverted byte 5
    ld a,(de)
    cpl
    ld (hl),a
    add hl,bc
    inc de

    ; copy pattern inverted byte 6
    ld a,(de)
    cpl
    ld (hl),a
    add hl,bc
    inc de

    ; copy pattern inverted byte 7
    ld a,(de)
    cpl
    ld (hl),a
    add hl,bc
    inc de

    ; copy pattern inverted byte 8
    ld a,(de)
    cpl
    ld (hl),a
    
    RET
