; ST7920 LCD controller implementation for Z-Fighter
; by Tangent 2021

SECTION code_user

INCLUDE "zf_io.asm"

PUBLIC _lcd
_lcd:
INIT:
    LD      IY,2                ; Bypass return address of function
    ADD     IY,SP
    LD      L,(IY)              ; Load parameter (bitmap) into HL
    LD      H,(IY+1)

    LD      (UPRBMP),HL         ; Store address of bitmap argument
    LD      DE,512
    ADD     HL,DE
    LD      (LWRBMP),HL         ; Store address of bitmap argument + 512

    LD      A,(BUFFER)          ; Init Y as 32 if buffer = 1
    CP      1
    JR      NZ,MAIN
    LD      A,32+80h
    LD      (Y),A

MAIN:
    LD      B,32
MNLOOP:
    PUSH    BC

    LD      A,(Y)               ; Set Y and X addresses
    LD      D,A
    CALL    EXTINST
    LD      D,0+080h
    CALL    EXTINST

    LD      HL,(UPRBMP)         ; Write row on upper half of screen
    LD      DE,(PTR)
    ADD     HL,DE
    CALL    DATAROW

    LD      HL,(LWRBMP)         ; Write row on lower half of screen
    LD      DE,(PTR)
    ADD     HL,DE
    CALL    DATAROW

    LD      DE,(PTR)            ; Increase value of bitmap pointer by 16
    ADD     DE,16
    LD      (PTR),DE

    LD      A,(Y)               ; Increment Y address by 1
    INC     A
    LD      (Y),A

    POP     BC
    DJNZ    MNLOOP

    CALL    SWTCBUF             ; Switch frame buffer

    LD      HL,0                ; Initialize variables
    LD      (PTR),HL
    LD      A,0+80h
    LD      (Y),A
    LD      HL,0
    LD      (LWRBMP),HL

    RET                         ; End of function

DATAROW:
    LD      B,16
DRLOOP:
    CALL    WAITBSY
    LD      A,LCD_DATA          ; Set LCD D
    OUT     (CTRL),A

    LD      C,PORTB
    OUTI                        ; OUT contents of HL to (C), DEC B
    CALL    ENABLE
    OR      B                   ; Check if loop is complete
    JR      NZ,DRLOOP

    LD      A,LCD_INST          ; Reset LCD #I
    OUT     (CTRL),A
    RET

INST:
    CALL    WAITBSY
    LD      C,PORTB
    OUT     (C),D               ; Send basic instruction
    CALL    ENABLE
    RET

EXTINST:
    CALL    WAITBSY
    LD      A,36h               ; Set extended instruction set
    OUT     (PORTB),A
    CALL    ENABLE

    CALL    WAITBSY
    LD      C,PORTB
    OUT     (C),D               ; Send extended instruction
    CALL    ENABLE

    CALL    WAITBSY
    LD      A,30h               ; Reset basic instruction set
    OUT     (PORTB),A
    CALL    ENABLE
    RET

ENABLE:
    LD      A,LCD_EN+1
    OUT     (CTRL),A
    DEC     A
    OUT     (CTRL),A
    RET

WAITBSY:
    PUSH    BC
    LD      A,(_backlight)      ; Read desired state of backlight
    ADD     LCD_BKLGHT          ; Add address of backlight
    LD      B,A                 ; Store backlight control word in B
    LD      C,CTRL              ; Load C with address of PPI control register
    LD      A,92h               ; 8255 Simple I/O, PA,B in, PC out
    OUT     (CTRL),A            ; Write PPI control word
    OUT     (C),B               ; Write backlight control word
    LD      A,LCD_RD            ; Set LCD RD
    OUT     (CTRL),A
    LD      A,LCD_EN+1          ; Set LCD ENABLE
    OUT     (CTRL),A
CHKFLAG:
    IN      A,(PORTB)           ; Read LCD data bus
    AND     128                 ; Check busy flag
    JR      NZ,CHKFLAG          ; Repeat until busy flag is reset
INITPPI:                        ; Complete routine by initializing PPI
    LD      A,90h               ; 8255 Simple I/O, PA in, PB,C out
    OUT     (CTRL),A            ; Write PPI control word
BKLGHT:       
    OUT     (C),B               ; Write backlight control word
    POP     BC
    RET

SWTCBUF:                        ; Switch frame buffer using LCD vertical scroll
    LD      A,(BUFFER)
    CP      1
    JR      Z,SB1
SB0:
    LD      D,0+040h            ; Vertical scroll address = GDRAM top half
    CALL    EXTINST
    LD      A,1
    LD      (BUFFER),A
    JR      SB2
SB1:
    LD      D,32+040h           ; Vertical scroll address = GDRAM bottom half
    CALL    EXTINST
    LD      A,0
    LD      (BUFFER),A
SB2:
    LD      D,3
    CALL    EXTINST             ; Enable vertical scroll position
    RET

SECTION bss_user

PUBLIC _backlight
_backlight:
    DB      0

UPRBMP:
    DW      0

LWRBMP:
    DW      0

PTR:
    DW      0

BUFFER:
    DB      0

SECTION data_user

Y:
    DB      0+080h