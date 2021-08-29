; Serial boot loader ROM for Z-Fighter
; by Tangent 2021

; Copies boot loader to top of RAM, jumps to it and disables ROM.
; Loads a .BIN serially through SIO Ch.A to 0000h.
; Does not use flow control. Does not perform error checking.
; Initializes stack pointer beneath boot loader.
; Performs CALL to 0000h. RET to boot loader is supported.
    
INCLUDE "zf_io.asm"

BL          EQU     512            ; Amount of bytes to reserve for boot loader
RAMLOC      EQU     0FFFFh-BL      ; Destination address in RAM for boot loader

COPY:
    LD      HL,0000h               ; Copy boot loader ROM to RAM
    LD      DE,RAMLOC              ; Destination address
    LD      BC,BL                  ; Number of bytes to copy
    LDIR                           ; Load, Increment and Repeat
    JP      LOADER                 ; Jump to boot loader in RAM

ORG         RAMLOC

LOADER:
    LD      A,0
    OUT     (38h),A                ; Disable ROM

    LD      C,SIO_AC               ; Load C with SIO Ch.A control port
    CALL    INITSIO                ; Initialize SIO Ch.A
    LD      C,SIO_BC               ; Load C with SIO Ch.B control port
    CALL    INITSIO                ; Initialize SIO Ch.B

    LD      HL,GREETING            ; Write greeting messages
    CALL    STRING
    LD      HL,REQUEST
    CALL    STRING

    CALL    RXDATA                 ; Receive and load data to 0000h

    LD      HL,CONFIRM             ; Write confirmation message
    CALL    STRING

    LD      C,SIO_AC               ; Load C with SIO Ch.A control port
    CALL    STOPSIO                ; Reset SIO Ch.A
    LD      C,SIO_BC               ; Load C with SIO Ch.B control port
    CALL    STOPSIO                ; Reset SIO Ch.B

    LD      SP,RAMLOC-1            ; Initialize stack pointer below boot loader

    CALL    DELAY
    CALL    0000h                  ; CALL loaded data

    CALL    DELAY
    JP      LOADER                 ; Allow program to RET to boot loader

INITSIO:
    LD      HL,SIOCFG              ; Load HL with base address of config table
    LD      B,11                   ; Load B with length of config table
    OTIR                           ; Output configuration table to (C)
    RET

STOPSIO:
    LD      HL,SIOCFG2             ; Load HL with base address of config table
    LD      B,4                    ; Load B with length of config table
    OTIR                           ; Output configuration table to (C)
    RET

STRING:
    LD      C,SIO_AC
ST1:
    LD      A,(HL)                 ; Load character to be sent into A
    CP      255                    ; Check if character = 255
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
    LD      D,0                    ; WR0, select RR0
    OUT     (C),D                  
    IN      B,(C)                  ; Read SIO RR0
    BIT     2,B                    ; Test RR0 D2 (Tx Buffer Empty)
    JP      Z,TX1                  ; Wait until Tx buffer empty
    LD      B,1                    ; WR0, select R1
    OUT     (C),B
    IN      B,(C)                  ; Read SIO RR1
    BIT     0,B                    ; Test RR1 D0 (All Sent)
    JP      Z,TX1                  ; Wait until All Sent
    OUT     (SIO_A),A              ; Transmit character
    RET

RXCHAR:
    LD      A,0                    ; WR0, select RR0
    OUT     (SIO_AC),A
    IN      A,(SIO_AC)             ; Read SIO RR0
    BIT     0,A                    ; Test RR0 D0 (Rx Character Available)
    JP      Z,RXCHAR               ; Wait until character available
    IN      A,(SIO_A)              ; Receive character
    RET

RXDATA:
    LD      HL,0000h               ; Point HL to bottom of address space
    LD      C,SIO_A                ; Load C with SIO Ch.A data port
RD1:
    CALL    RXCHAR                 ; Poll SIO until a character is received
    LD      (HL),A                 ; Load first received byte into (HL)
    INC     HL                     ; Increment HL
RD2:
    LD      B,255                  ; Load timeout counter and receive remaining data
RD3:
    LD      A,0                    ; WR0, select RR0
    OUT     (SIO_AC),A
    IN      A,(SIO_AC)             ; Read SIO RR0
    DEC     B                      ; Decrement timeout counter
    RET     Z                      ; Exit routine if timeout occurs
    BIT     0,A                    ; Test RR0 D0 (Rx Character Available)
    JP      Z,RD3                  ; Wait until character is available
    INI                            ; Load (HL) with (C), INC HL
    JP      RD2                    ; Repeat until timeout occurs

DELAY:                             ; Short delay
    LD      B,255
DL:                  
    DJNZ    DL                     ; Repeat delay loop until B = 0
    RET

SIOCFG:
    DB      00011000b              ; WR0, Channel Reset
    DB      00010000b              ; WR0, Reset Ext/Status Interrupts
    DB      00101000b              ; WR0, Reset TxINT Pending   
    DB      00110100b              ; WR0, Error Reset, select R4
    DB      11000100b              ; WR4, x64 Clock Mode, 1 Stop Bit/Character, Parity Disable
    DB      00000011b              ; WR0, select R3
    DB      11000001b              ; WR3, Rx 8 Bits/Character, Auto Enables off, Rx Enable
    DB      00000101b              ; WR0, select R5
    DB      01101000b              ; WR5, No DTR, TX 8 Bits/Character, No Send Break, Tx Enable, RTS off (D1)
    DB      00000001b              ; WR0, select WR1
    DB      00000000b              ; WR1, Disable WAIT/READY, Disable Rx INT, Disable Tx INT

SIOCFG2:
    DB      1                      ; WR0, select R3
    DB      0                      ; WR3, Rx Disable
    DB      5                      ; WR0, select R5
    DB      0                      ; WR5, Tx Disable

GREETING:
    DB      "[Z-Fighter Serial Boot Loader v0.1]",255

REQUEST:
    DB      "Ready to load .BIN at 0000h.",255

CONFIRM:
    DB      "Transfer complete.",255