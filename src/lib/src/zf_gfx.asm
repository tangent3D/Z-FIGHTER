SECTION code_user

EXTERN _color
EXTERN _screen
EXTERN SCREEN_W
EXTERN SCREEN_H

; void block(const unsigned char* blockPattern, unsigned char blockX, unsigned char blockY)
PUBLIC _block
_block:
    ; prepare reading parameters
    ld iy,2
    add iy,sp

    ; skip if off screen
    ld a,(iy+3) ;  a = blockX
    ld d,0      ; de = blockX
    ld e,a      ; "
    cp SCREEN_W/8
    jr nc,skipBlock
    ld a,(iy+2) ; a = blockY
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
