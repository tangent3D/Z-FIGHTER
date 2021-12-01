// randomizer implementation for z-fighter game "poker"
// by xrrawva 2021

#include <stdlib.h>
#include "rnd.h"

unsigned char rnd(unsigned char maxValue)
{
    unsigned char mask;
    if     (maxValue<(unsigned char)(1+ 1               ))mask=1;                    // 00000001
    else if(maxValue<(unsigned char)(1+ 1+2             ))mask=1+2;                  // 00000011
    else if(maxValue<(unsigned char)(1+ 1+2+4           ))mask=1+2+4;                // 00000111
    else if(maxValue<(unsigned char)(1+ 1+2+4+8         ))mask=1+2+4+8;              // 00001111
    else if(maxValue<(unsigned char)(1+ 1+2+4+8+16      ))mask=1+2+4+8+16;           // 00011111
    else if(maxValue<(unsigned char)(1+ 1+2+4+8+16+32   ))mask=1+2+4+8+16+32;        // 00111111
    else if(maxValue<(unsigned char)(1+ 1+2+4+8+16+32+64))mask=1+2+4+8+16+32+64;     // 01111111
    else                                                  mask=1+2+4+8+16+32+64+128; // 11111111

    unsigned char result;
    do
    {
        result=rand();
        result&=mask;
    }
    while(result>maxValue);
    return result;
}

void rndImprove(unsigned char unpredictableByte)
{
    srand(rand()+unpredictableByte);
}
