; Serial boot loader ROM for Z-Fighter
; by Tangent 2023

; For use with z80com (https://github.com/tangent3D/z80com).
; Copies boot loader to top of RAM, jumps to it and disables ROM.
; Loads a .BIN serially through SIO Ch.A to 0000h.
; Uses RTS/CTS signals.
; Initializes stack pointer beneath boot loader.
; Performs CALL to 0000h. RET to boot loader is supported.

EXTERN ROMDISABLE_n
EXTERN SIO_A
EXTERN SIO_AC

RAMLOC      EQU     0FE00h        ; Destination address in RAM for boot loader (reserve 512 bytes)

    LD      SP,RAMLOC-1

COPY:
    LD      HL,0000h               ; Copy boot loader ROM to RAM
    LD      DE,RAMLOC              ; Destination address
    LD      BC,0FFFFh-RAMLOC       ; Number of bytes to copy
    LDIR                           ; Load, Increment and Repeat
    JP      LOADER                 ; Jump to boot loader in RAM

ORG         RAMLOC

LOADER:
    LD      A,0
    OUT     (ROMDISABLE_n),A       ; Disable ROM

    CALL    INITSIO                ; Initialize SIO Ch.A

    CALL    WAIT_CTS               ; Wait for /CTS

    LD      HL,GREETING            ; Write greeting messages
    CALL    STRING

    CALL    RXDATA                 ; Receive and load data to 0000h
    CALL    RTS_OFF                ; Deassert RTS when finished receiving data
    CALL    0000h                  ; CALL loaded data
    JP      LOADER                 ; Allow program to RET to boot loader

INITSIO:
    LD      C,SIO_AC               ; Load C with SIO Ch.A control port
    LD      HL,INITCFG             ; Load HL with base address of config table
    LD      B,11                   ; Load B with length of config table
    OTIR                           ; Output configuration table to (C)
    RET

STRING:
    LD      C,SIO_AC
ST1:
    LD      A,(HL)                 ; Load character to be sent into A
    OR      A                      ; Check if character = 0
    JP      Z,CRLF                 ; If so, insert CR,LF and exit routine
    CALL    TXCHAR                 ; Otherwise, transmit character
    INC     HL                     ; Increment HL to next character in string
    JP      ST1                    ; Repeat until string is terminated
CRLF:
    LD      A,0Dh                  ; Transmit CR
    CALL    TXCHAR
    LD      A,0Ah                  ; Transmit LF
    CALL    TXCHAR
    RET                            ; End of routine

TXCHAR:
    LD      C,SIO_AC
TX1:
    LD      D,0                    ; WR0, select WR0
    OUT     (C),D
    LD      B,1                    ; WR0, select RR1
    OUT     (C),B
    IN      B,(C)                  ; Read SIO RR1
    BIT     0,B                    ; Test RR1 D0 (All Sent)
    JP      Z,TX1                  ; Wait until All Sent
    OUT     (SIO_A),A              ; Transmit character
    RET

RXDATA:
    LD      HL,0000h               ; Point HL to bottom of address space
    CALL    RTS_ON                 ; Assert RTS to indicate readiness to z80com
READ:
    LD      A,0                    ; Check if CTS active
    OUT     (SIO_AC),A             ; WR0, select RR0
    IN      A,(SIO_AC)
    BIT     5,A
    RET     Z                      ; Exit loop if CTS inactive (host closed serial connection)

    LD      A,0                    ; WR0, select RR0
    OUT     (SIO_AC),A
    IN      A,(SIO_AC)             ; Read SIO RR0
    BIT     0,A                    ; Test RR0 D0 (Rx Character Available)
    JP      Z,READ                 ; Repeat routine if no character available

    IN      A,(SIO_A)              ; Read available character
    LD      (HL),A                 ; Load received character to (HL)
    INC     HL

    JP      READ                   ; Repeat routine until CTS inactive

INITCFG:
    DB      00011000b              ; WR0, Channel Reset
    DB      00010000b              ; WR0, Reset Ext/Status Interrupts
    DB      00101000b              ; WR0, Reset TxINT Pending
    DB      00000001b              ; WR0, select WR1
    DB      00000000b              ; WR1, Disable WAIT/READY, Disable Rx INT, Disable Tx INT
    DB      00000011b              ; WR0, select WR3
    DB      11000001b              ; WR3, Rx 8 Bits/Character, Auto Enables off, Rx Enable
    DB      00110100b              ; WR0, Error Reset, select R4
    DB      11000100b              ; WR4, x64 Clock Mode, 1 Stop Bit/Character, Parity Disable
    DB      00000101b              ; WR0, select WR5
    DB      01101000b              ; WR5, No DTR, TX 8 Bits/Character, No Send Break, Tx Enable, RTS off

RTS_OFF:
    LD      A,00000101b            ; WR0, select WR5
    OUT     (SIO_AC),A
    LD      A,01101000b            ; WR5, No DTR, TX 8 Bits/Character, No Send Break, Tx Enable, RTS off
    OUT     (SIO_AC),A
    RET

RTS_ON:
    LD      A,00000101b            ; WR0, select WR5
    OUT     (SIO_AC),A
    LD      A,01101010b            ; WR5, No DTR, TX 8 Bits/Character, No Send Break, Tx Enable, RTS on
    OUT     (SIO_AC),A
    RET

WAIT_CTS:
    LD      A,00000000b            ; WR0, select RR0
    OUT     (SIO_AC),A
    IN      A,(SIO_AC)
    BIT     5,A
    JP      Z,WAIT_CTS             ; Repeat until CTS is asserted
    RET

GREETING:
    DB      "[Z-FIGHTER Serial Boot Loader v0.3]",0

PAD:
    DEFS    8000h-PAD              ; Pad binary size to 32K
