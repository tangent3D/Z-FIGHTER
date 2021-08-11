// ST7920 LCD controller functions for Z-Fighter
// by Tangent 2021

#include "zf_lcd.h"

void lcd_bitmap(unsigned char *bitmap) __naked
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
                LD      A,LCD_DATA      // Set LCD D
                OUT     (CTRL),A

                LD      C,PORTB
                OUTI                    // OUT contents of HL to (C), DEC B
                CALL    ENABLE
                OR      B               // Check if loop is complete
                JR      NZ,DRLOOP

                LD      A,LCD_INST      // Reset LCD #I
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
            LD      A,LCD_EN_HI
            OUT     (CTRL),A
            LD      A,LCD_EN_LO
            OUT     (CTRL),A
            RET

        WAITBSY:
            LD      A,92h               // 8255 Simple I/O, PA,B in, PC out
            OUT     (CTRL),A
            LD      A,LCD_BL_ON         // Backlight ON
            OUT     (CTRL),A

            LD      A,LCD_RD            // Set LCD RD
            OUT     (CTRL),A
            LD      A,LCD_EN_HI         // Set LCD ENABLE
            OUT     (CTRL),A

            CHKFLAG:
                IN      A,(PORTB)
                BIT     7,A             // Check busy flag
                JR      NZ,CHKFLAG

        INITPPI:                        // Complete WAITBSY by initializing PPI
            LD      A,90h               // 8255 Simple I/O, PA in, PB,C out
            OUT     (CTRL),A
            LD      A,LCD_BL_ON         // Backlight ON
            OUT     (CTRL),A
            RET

        SWTCBUF:                        // Switch frame buffer using LCD vertical scroll
            LD      A,(BUFFER)
            CP      1
            JR      Z,SB1
            SB0:
                LD      D,0+040h        // Vertical scroll address = GDRAM top half
                CALL    EXTINST
                LD      A,1
                LD      (BUFFER),A
                JR      SB2
            SB1:
                LD      D,32+040h       // Vertical scroll address = GDRAM bottom half
                CALL    EXTINST
                LD      A,0
                LD      (BUFFER),A
            SB2:
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

//FIXME: Pass parameter via stack
unsigned char instruction;
void lcd_instruction(unsigned char i, unsigned char extended)
    {
        instruction = i;

        if (extended == 1)                  // Check basic or extended instruction
            {   
                __asm
                CALL    WAITBSY             // Wait until LCD is ready
                LD      A,36h               // Set extended instruction set
                OUT     (PORTB),A
                CALL    ENABLE

                CALL    WAITBSY             // Wait until LCD is ready
                LD      A,(_instruction)    // Send extended instruction
                OUT     (PORTB),A 
                CALL    ENABLE

                CALL    WAITBSY             // Wait until LCD is ready
                LD      A,30h               // Reset basic instruction set
                OUT     (PORTB),A
                CALL    ENABLE
                __endasm;
            }
        else                                
            {
                __asm
                CALL    WAITBSY             // Wait until LCD is ready
                LD      A,(_instruction)    // Send basic instruction
                OUT     (PORTB),A
                CALL    ENABLE
                __endasm;
            }
    }

//FIXME: Pass parameter via stack
unsigned char data;
void lcd_data(unsigned char d)
    {
        data = d;

        __asm 
        CALL    WAITBSY             // Wait until LCD is ready
        LD      A,LCD_DATA          // Set LCD D
        OUT     (CTRL),A

        LD      A,(_data)           // Send data
        OUT     (PORTB),A 
        CALL    ENABLE

        LD      A,LCD_INST          // Reset LCD #I
        OUT     (CTRL),A
        __endasm;
    }