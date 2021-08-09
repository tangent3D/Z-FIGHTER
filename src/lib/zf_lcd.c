// ST7920 LCD controller functions for Z-Fighter
// by Tangent 2021

void lcd_update(unsigned char *bitmap) __naked
    {
        (void)*bitmap;

        __asm
        
        INIT:
            POP     BC
            POP     HL
            LD      (UPRBMP),HL         // Store address of bitmap argument
            LD      DE,512
            ADD     HL,DE
            LD      (LWRBMP),HL         // Store address of bitmap argument + 512
            PUSH    HL
            PUSH    BC

            LD      A,(BUFFER)          // Init Y as 32 if buffer = 1
            CP      1
            JR      NZ,MAIN
            LD      A,32+80h
            LD      (Y),A

        MAIN:
        LD      B,32
        MNLOOP:
            PUSH    BC

            LD      A,(Y)               // Set Y and X addresses
            LD      D,A
            CALL    EXTINST
            LD      D,0+080h
            CALL    EXTINST

            LD      HL,(UPRBMP)         // Write row on upper half of screen
            LD      DE,(PTR)
            ADD     HL,DE
            CALL    DATAROW

            LD      HL,(LWRBMP)         // Write row on lower half of screen
            LD      DE,(PTR)
            ADD     HL,DE
            CALL    DATAROW

            LD      DE,(PTR)            // Increase value of bitmap pointer by 16
            ADD     DE,16
            LD      (PTR),DE

            LD      A,(Y)               // Increment Y address by 1
            INC     A
            LD      (Y),A

            POP     BC
            DJNZ    MNLOOP

            CALL    SWTCBUF             // Switch frame buffer

            LD      HL,0                // Initialize variables
            LD      (PTR),HL
            LD      A,0+80h
            LD      (Y),A
            LD      HL,0
            LD      (LWRBMP),HL

            RET

        DATAROW:
            LD      B,16
            DRLOOP:
                CALL    WAITBSY
                LD      A,5             // Set LCD D
                OUT     (CTRL),A

                LD      C,PORTB
                OUTI                    // OUT contents of HL to (C), DEC B
                CALL    ENABLE
                OR      B               // Check if loop is complete
                JR      NZ,DRLOOP

                LD      A,4             // Reset LCD #I
                OUT     (CTRL),A
                RET

        INST:
            CALL    WAITBSY
            LD      C,PORTB
            OUT     (C),D               // Send basic instruction
            CALL    ENABLE
            RET

        EXTINST:
            CALL    WAITBSY
            LD      A,36h               // Set extended instruction set
            OUT     (PORTB),A
            CALL    ENABLE

            CALL    WAITBSY
            LD      C,PORTB
            OUT     (C),D               // Send extended instruction
            CALL    ENABLE

            CALL    WAITBSY
            LD      A,30h               // Reset basic instruction set
            OUT     (PORTB),A
            CALL    ENABLE
            RET

        ENABLE:
            LD      A,1
            OUT     (CTRL),A
            LD      A,0
            OUT     (CTRL),A
            RET

        WAITBSY:
            LD      A,92h               // 8255 Simple I/O, PA,B in, PC out
            OUT     (CTRL),A
            LD      A,7                 // Backlight ON
            OUT     (CTRL),A

            LD      A,3                 // Set LCD RD
            OUT     (CTRL),A
            LD      A,1                 // Set LCD ENABLE
            OUT     (CTRL),A

            CHKFLAG:
                IN      A,(PORTB)
                BIT     7,A             // Check busy flag
                JR      NZ,CHKFLAG

            LD      A,90h               // 8255 Simple I/O, PA in, PB,C out
            OUT     (CTRL),A
            LD      A,7                 // Backlight ON
            OUT     (CTRL),A
            RET

        SWTCBUF:
            LD      A,(BUFFER)
            CP      1
            JR      Z,SB1
            SB0:
                LD      D,0+040h        // Vertical scroll address = GDRAM top half
                CALL    EXTINST
                LD      A,1
                LD      (BUFFER),A
                JR      SB3
            SB1:
                LD      D,32+040h       // Vertical scroll address = GDRAM bottom half
                CALL    EXTINST
                LD      A,0
                LD      (BUFFER),A
            SB3:
                LD      D,3
                CALL    EXTINST         // Enable vertical scroll position
                RET

        UPRBMP:
            DW      0

        LWRBMP:
            DW      0

        PTR:
            DW      0

        Y:
            DB      0+080h

        BUFFER:
            DB      0

        __endasm;
    }