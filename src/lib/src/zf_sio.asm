; Z80 SIO/0 Serial Input/Output controller implementation for Z-Fighter
; by Tangent 2021

SECTION code_user

PUBLIC _sioInit
_sioInit:
    LD      IY,2                   ; Bypass return address of function
    ADD     IY,SP
    LD      C,(IY)                 ; Load C with parameter (channel (control port))
    LD      HL,SIOCFG              ; Load HL with base address of config table
    LD      B,11                   ; Load B with length of config table
    OTIR                           ; Output configuration table to (C)
    RET

PUBLIC _sioRead
_sioRead:
    LD      IY,2                   ; Bypass return address of function
    ADD     IY,SP
    LD      C,(IY)                 ; Load C with parameter (channel (control port))
    LD      A,0                    ; WR0, select RR0
    OUT     (C),A
    IN      A,(C)                  ; Read SIO RR0
    BIT     0,A                    ; Test RR0 D0 (Rx Character Available)
    JR      Z,NOCHAR               ; Jump if no character available
    DEC     C                      ; Decrement C to point to channel data port
    DEC     C
    IN      L,(C)                  ; Receive character and return value
    RET
NOCHAR:
    LD      L,0                    ; Return '0' if no character available
    RET

PUBLIC _sioWait
_sioWait:
    LD      IY,2                   ; Bypass return address of function
    ADD     IY,SP
    LD      C,(IY)                 ; Load C with parameter (channel (control port))
WTLOOP:
    LD      A,0                    ; WR0, select RR0
    OUT     (C),A
    IN      A,(C)                  ; Read SIO RR0
    BIT     0,A                    ; Test RR0 D0 (Rx Character Available)
    JP      Z,WTLOOP               ; Wait until character available
    DEC     C                      ; Decrement C to point to channel data port
    DEC     C
    IN      L,(C)                  ; Receive character and return value
    RET

PUBLIC _sioWrite
_sioWrite:
    LD      IY,2                   ; Bypass return address of function
    ADD     IY,SP
    LD      C,(IY)                 ; Load C with parameter (channel (control port))
WRLOOP:
    LD      A,0                    ; WR0, select RR0
    OUT     (C),A                  
    IN      A,(C)                  ; Read SIO RR0
    BIT     2,A                    ; Test RR0 D2 (Tx Buffer Empty)
    JP      Z,WRLOOP               ; Wait until Tx buffer empty
    LD      A,1                    ; WR0, select R1
    OUT     (C),A
    IN      A,(C)                  ; Read SIO RR1
    BIT     0,A                    ; Test RR1 D0 (All Sent)
    JP      Z,WRLOOP               ; Wait until All Sent
    DEC     C                      ; Decrement C to point to channel data port
    DEC     C
    LD      A,(IY+1)               ; Load A with parameter (character)
    OUT     (C),A                  ; Transmit character
    RET

SIOCFG:
    DB      00011000b              ; WR0, Channel Reset
    DB      00010000b              ; WR0, Reset Ext/Status Interrupts
    DB      00101000b              ; WR0, Reset TxINT Pending   
    DB      00000001b              ; WR0, select WR1
    DB      00000000b              ; WR1, Disable WAIT/READY, Disable Rx INT, Disable Tx INT
    DB      00000011b              ; WR0, select R3
    DB      11000001b              ; WR3, Rx 8 Bits/Character, Auto Enables off, Rx Enable
    DB      00110100b              ; WR0, Error Reset, select R4
    DB      11000100b              ; WR4, x64 Clock Mode, 1 Stop Bit/Character, Parity Disable
    DB      00000101b              ; WR0, select R5
    DB      01101000b              ; WR5, No DTR, TX 8 Bits/Character, No Send Break, Tx Enable, RTS off