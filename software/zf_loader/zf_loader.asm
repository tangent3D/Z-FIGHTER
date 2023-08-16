; Serial boot loader ROM for Z-Fighter
; by Tangent 2023

; For use with z80com (https://github.com/tangent3D/z80com).
; Copies boot loader to top of RAM, jumps to it and disables ROM.
; Loads a .BIN serially through SIO Ch.A to 0000h.
; Z-FIGHTER JP3 must be set to 1-2 position.
; Initializes stack pointer beneath boot loader.
; Performs CALL to 0000h. RET to boot loader is supported.

EXTERN ROMDISABLE_n
EXTERN SIO_A
EXTERN SIO_AC

RAMLOC      EQU  0FF00h            ; Destination address in RAM for boot loader (reserve 256 bytes)

COPY:
    LD      HL,0000h               ; Copy boot loader ROM to RAM
    LD      DE,RAMLOC              ; Destination address
    LD      BC,0FFFFh-RAMLOC       ; Number of bytes to copy
    LDIR                           ; Load, Increment and Repeat
    JP      LOADER                 ; Jump to boot loader in RAM

ORG         RAMLOC

LOADER:
    LD      SP,RAMLOC-1            ; Initialize stack pointer below boot loader

    LD      A,0
    OUT     (ROMDISABLE_n),A       ; Disable ROM

    CALL    INIT_SIO               ; Initialize SIO Ch.A

    CALL    WAIT_CTS               ; Wait for CTS

    LD      HL,GREETING            ; Write greeting message
    CALL    TXSTRING

    CALL    RXDATA                 ; Receive and load data to 0000h

    CALL    0000h                  ; CALL loaded data
    JP      LOADER                 ; Allow program to RET to boot loader

; Subroutines

INIT_SIO:
    LD      C,SIO_AC               ; Load C with SIO Ch.A control port
    LD      HL,INITCFG             ; Load HL with base address of config table
    LD      B,11                   ; Load B with length of config table
    OTIR                           ; Output configuration table to (C)
    RET

WAIT_CTS:
    LD      A,00000000b            ; WR0, select RR0
    OUT     (SIO_AC),A
    IN      A,(SIO_AC)             ; Read SIO RR0
    BIT     5,A                    ; Test RR0 D5 (CTS)
    JP      Z,WAIT_CTS             ; Wait until CTS set

    CALL    INIT_SIO               ; Reset SIO (reset Ext/Status Interrupts)

    CALL    WAIT                   ; Wait a while before proceeding!

    RET

TXSTRING:
    LD      C,SIO_AC
TS1:
    LD      A,(HL)                 ; Load character to be sent into A
    OR      A                      ; Check for string terminator
    RET     Z                      ; Return from routine if character is string terminator
TS2:
    LD      B,1                    ; WR0, select RR1
    OUT     (C),B
    IN      B,(C)                  ; Read SIO RR1
    BIT     0,B                    ; Test RR1 D0 (All Sent)
    JP      Z,TS2                  ; Wait until All Sent
    OUT     (SIO_A),A              ; Transmit character
    INC     HL                     ; Increment HL to next character in string
    JP      TS1                    ; Repeat until string is terminated

RXDATA:
    LD      HL,0000h               ; Point HL to bottom of address space
    LD      A,00000101b            ; Assert RTS to indicate readiness to z80com:
    OUT     (SIO_AC),A             ; WR0, select WR5
    LD      A,01101010b            ; WR5, No DTR, TX 8 Bits/Character, No Send Break, Tx Enable, RTS on
    OUT     (SIO_AC),A
RX1:
    LD      A,0                    ; WR0, select RR0
    OUT     (SIO_AC),A
    IN      A,(SIO_AC)
    BIT     0,A                    ; Test RR0 D0 (Rx character available)
    JP      NZ,RX2                 ; Receive character if available
    BIT     5,A                    ; If not, check if CTS still active
    JP      Z,RX3                  ; Exit loop if CTS inactive (host closed serial connection)
    JP      RX1                    ; Repeat routine if no character available
RX2:
    IN      A,(SIO_A)              ; Read available character
    LD      (HL),A                 ; Load received character at memory address
    INC     HL
    JP      RX1                    ; Repeat routine until CTS inactive
RX3:
    LD      A,L                    ; Reset loader if no bytes have been loaded
    OR      H
    JP      Z,LOADER

    CALL    INIT_SIO               ; Reset SIO (disable RTS)
    RET                            ; Return to execute loaded data

WAIT:
    LD      B,1                    ; Amount of times to repeat wait loop
W1:
    PUSH    BC
    LD      BC,65535
W2:
    DEC     BC
    LD      A,C
    OR      B
    JP      NZ,W2

    POP     BC
    DJNZ    W1                    ; Repeat wait loop until loop count is exhausted

    RET

; Data

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

GREETING:
    DB      "[Z-FIGHTER Serial Boot Loader v0.4]",0Dh,0Ah,0
