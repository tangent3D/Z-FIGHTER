// 8255A Programmable Peripheral Interface implementation for Z-Fighter
// (User parallel port)
// by Tangent 2021

#include <zf_ppi_user.h>

void ppiUserInit(char pa, char pb, char pcu, char pcl)
    {
    unsigned char cw  = 0x80;       // I/O mode control word

    if(pa == 1)                     // Port A input/output
        {
        cw = cw + 0x10;              
        }
    if(pb == 1)                     // Port B input/output
        {
        cw = cw + 0x02;             
        }
    if(pcu == 1)                    // Port C upper input/output
        {
        cw = cw + 0x08;             
        }
    if(pcl == 1)                    // Port C lower input/output
        {
        cw = cw + 0x01;             
        }

    ppiWrite(cw, USERCTRL);         // Write control word
    }


void bitSet(char bit, char state)
    {
    unsigned char cw = 0;           // BSR control word
    bit = bit << 1;                 // Shift bit value to D1-D3
    cw  = bit|state;                // Assemble control word
    ppiWrite(cw, USERCTRL);         // Write control word
    }


unsigned char serialRead(char dataPin, char clockPin)
    {
    unsigned char byte = 0;
    unsigned char bit = 0;

    for(char i = 0; i <= 7; i++)
        {
        byte = byte|bitTest(dataPin, ppiRead(USERPORTC));
        bitSet(clockPin, 1);
        bitSet(clockPin, 0);
        if(i != 7)
            {
            byte = byte << bit;
            }
        bit++;
        }

    return(byte);
    }

void serialWrite(char byte, char dataPin, char clockPin)
    {
    unsigned char bit = 0;

    for(char i = 0; i <= 7; i++)
        {
        bitSet(dataPin, bitTest(bit, byte));
        bitSet(clockPin, 1);
        bitSet(clockPin, 0);
        bit++;
        }
    }


unsigned char bitTest(char bit, char byte)
    {
    char bitMask = 0x01 << bit;
    byte = bitMask & byte;
    return(byte >> bit);
    }