// 8255A Programmable Peripheral Interface implementation for Z-Fighter
// (User parallel port)
// by Tangent 2021

#include <zf_ppi_user.h>
#include <zf_util.h>

void ppiUserInit(unsigned char pa, unsigned char pb, unsigned char pcu, unsigned char pcl)
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


void bitSet(unsigned char bit, unsigned char state)
    {
    unsigned char cw = 0;           // BSR control word
    bit = bit << 1;                 // Shift bit value to D1-D3
    cw  = bit|state;                // Assemble control word
    ppiWrite(cw, USERCTRL);         // Write control word
    }

unsigned char serialRead(unsigned char dataPin, unsigned char clockPin, unsigned char bitOrder)
    {
    unsigned char byte = 0;

    for(unsigned char i = 0; i <= 7; i++)
        {
        bitSet(clockPin, 1);
        bitSet(clockPin, 0);

        byte = byte << 1;

        byte = byte | bitTest(dataPin, ppiRead(USERPORTC));
        }

    if(bitOrder == LSB)
        {
        byte = byteReverse(byte);
        }

    return(byte);
    }

void serialWrite(unsigned char byte, unsigned char dataPin, unsigned char clockPin, unsigned char bitOrder)
    {
    unsigned char bit = 0;

    if(bitOrder == MSB)
        {
        byte = byteReverse(byte);
        }

    for(unsigned char i = 0; i <= 7; i++)
        {
        bitSet(dataPin, bitTest(bit, byte));
        bitSet(clockPin, 1);
        bitSet(clockPin, 0);
        bit++;
        }
    }


unsigned char bitTest(unsigned char bit, unsigned char byte)
    {
    unsigned char bitMask = 0x01 << bit;
    byte = bitMask & byte;
    return(byte >> bit);
    }