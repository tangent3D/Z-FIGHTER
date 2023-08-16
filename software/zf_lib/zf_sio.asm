; Z80 SIO/0 Serial Input/Output controller implementation for Z-Fighter
; tangent.space 2023

EXTERN SIO
EXTERN _channel

SECTION code_user

PUBLIC _sioInit
_sioInit:
    CALL    getChannel
    LD      HL,SIOCFG              ; Load HL with base address of config table
    LD      B,11                   ; Load B with length of config table
    OTIR                           ; Output configuration table to (C)
    RET

PUBLIC _sioWrite                   ; Uses FASTCALL. L = character
_sioWrite:
    CALL    getChannel
WRLOOP:
    LD      A,1                    ; WR0, select RR1
    OUT     (C),A
    IN      A,(C)                  ; Read SIO RR1
    BIT     0,A                    ; Test RR1 D0 (All Sent)
    JP      Z,WRLOOP               ; Wait until All Sent
    DEC     C                      ; Decrement C to point to channel data port
    DEC     C
    LD      A,L                    ; Load A with parameter (character)
    OUT     (C),A                  ; Transmit character
    RET

PUBLIC _sioWaitCTS
_sioWaitCTS:
    CALL    getChannel
WCLOOP:
    IN      A,(C)                  ; Read SIO RR0
    BIT     5,A                    ; Test RR0 D5 (CTS)
    JP      Z,WCLOOP               ; Wait until CTS set
    LD      A,00010000b            ; Reset ext/status interrupts (acknowledge CTS)
    OUT     (C),A
                                   ; Wait a while before proceeding!
    LD      B,1                    ; Amount of times to repeat wait loop
WAIT0:
    PUSH    BC
    LD      BC,65535
WAIT1:
    DEC     BC
    LD      A,C
    OR      B
    JP      NZ,WAIT1

    POP     BC
    DJNZ    WAIT0                  ; Repeat wait loop until loop count is exhausted

    RET

PUBLIC _sioSetRTS                  ; Uses FASTCALL. L = rts
_sioSetRTS:
    CALL    getChannel
    LD      A,00000101b            ; WR0, select WR5
    OUT     (C),A
    XOR     A                      ; Clear Carry flag
    LD      A,L                    ; Load A with parameter (rts)
    RLA                            ; Rotate value to bit 1
    OR      01101000b              ; OR with base configuration
    OUT     (C),A                  ; Set channel RTS state
    RET

; Subroutines

getChannel:
    LD      A,(_sioChannel)        ; Retrieve value of _channel
    ADD     A,SIO                  ; Add base I/O address of SIO
    ADD     2                      ; Add '2' for channel Control port
    LD      C,A                    ; Load specified channel Control port value in C
    RET

; Definitions

SIOCFG:
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

; Data

SECTION data_user

PUBLIC _sioChannel
_sioChannel:
    DB      0                      ; Desired SIO channel (0 = A, 1 = B)
