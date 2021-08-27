// 8255A Programmable Peripheral Interface implementation for Z-Fighter
// (User parallel port)
// by Tangent 2021

#include <zf_ppi_user.h>

void ppiUserInit(unsigned char pa, unsigned char pb, unsigned char pcu, unsigned char pcl)
    {
    unsigned char cw  = 0x80;                                   // I/O mode control word

    if(pa == 1)                                                 // Port A input/output
        {
        cw = cw + 0x10;              
        }
    if(pb == 1)                                                 // Port B input/output
        {
        cw = cw + 0x02;             
        }
    if(pcu == 1)                                                // Port C upper input/output
        {
        cw = cw + 0x08;             
        }
    if(pcl == 1)                                                // Port C lower input/output
        {
        cw = cw + 0x01;             
        }

    ppiWrite(cw, USERCTRL);                                     // Write control word
    }


void ppiBitSet(unsigned char bit, unsigned char state)
    {
    unsigned char cw = 0;                                       // BSR control word
    bit = bit << 1;                                             // Shift bit value to D1-D3
    cw  = bit|state;                                            // Assemble control word
    ppiWrite(cw, USERCTRL);                                     // Write control word
    }

unsigned char serialRead(unsigned char dataPin, unsigned char clockPin, unsigned char bitOrder)
    {
    unsigned char byte = 0;

    for(unsigned char i = 0; i < 8; i++)                        // Repeat 8 times
        {
        ppiBitSet(clockPin, 1);                                 // Pulse specified clock pin
        ppiBitSet(clockPin, 0);

        byte = byte | bitTest(dataPin, ppiRead(USERPORTC));     // Assemble a byte by reading serially from specified data pin

        if(i != 7)
            {
            byte = byte << 1;
            }
        }

    if(bitOrder == LSB)                                         // Reverse the byte's bit order if reading LSB first
        {
        byte = byteReverse(byte);
        }

    return(byte);
    }

void serialWrite(unsigned char byte, unsigned char dataPin, unsigned char clockPin, unsigned char bitOrder)
    {
    unsigned char bit = 0;

    if(bitOrder == MSB)                                         // Reverse the byte's bit order if writing LSB first
        {
        byte = byteReverse(byte);
        }

    for(unsigned char i = 0; i < 8; i++)                        // Repeat 8 times
        {
        ppiBitSet(dataPin, bitTest(bit, byte));                 // Set specified data pin high or low according to its position in the byte
        ppiBitSet(clockPin, 1);                                 // Pulse the specified clock pin
        ppiBitSet(clockPin, 0);
        bit++;
        }
    }


unsigned char bitTest(unsigned char bit, unsigned char byte)
    {
    unsigned char bitMask = 0x01 << bit;
    byte = bitMask & byte;
    return(byte >> bit);
    }

unsigned char bcd2bin(unsigned char bcd)
    {
    unsigned char hiNibble = bcd >> 4;
    unsigned char loNibble = bcd & 0x0F;
    return((hiNibble * 10) + loNibble);
    }

unsigned char bin2bcd(unsigned char bin)
    {
    unsigned char tens = 0;
    unsigned char ones = 0;

    for(unsigned char i = 0; i < 8; i++)
        {
            if(tens >= 5)
                {
                tens = tens + 3;
                }
            if(ones >= 5)
                {
                ones = ones + 3;
                }

            tens = tens << 1;
            tens = tens + (ones >> 3);

            ones = ones << 1;
            ones = ones + (bin >> 7);
            ones = ones & 0x0F;

            bin = bin << 1;
        }   
        unsigned char bcd = (tens << 4) | ones;
        return(bcd);
    }