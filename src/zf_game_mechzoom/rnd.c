// module implementation for z-fighter game "mechzoom"
// by xrrawva 2021

#include <stdlib.h>
#include "rnd.h"

unsigned char rnd(unsigned char maxValue)
{
    unsigned char mask;
    if     (maxValue<(unsigned char)(1+ 1               ))mask=(unsigned char)(1                   ); // 00000001
    else if(maxValue<(unsigned char)(1+ 1+2             ))mask=(unsigned char)(1+2                 ); // 00000011
    else if(maxValue<(unsigned char)(1+ 1+2+4           ))mask=(unsigned char)(1+2+4               ); // 00000111
    else if(maxValue<(unsigned char)(1+ 1+2+4+8         ))mask=(unsigned char)(1+2+4+8             ); // 00001111
    else if(maxValue<(unsigned char)(1+ 1+2+4+8+16      ))mask=(unsigned char)(1+2+4+8+16          ); // 00011111
    else if(maxValue<(unsigned char)(1+ 1+2+4+8+16+32   ))mask=(unsigned char)(1+2+4+8+16+32       ); // 00111111
    else if(maxValue<(unsigned char)(1+ 1+2+4+8+16+32+64))mask=(unsigned char)(1+2+4+8+16+32+64    ); // 01111111
    else                                                  mask=(unsigned char)(1+2+4+8+16+32+64+128); // 11111111

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
