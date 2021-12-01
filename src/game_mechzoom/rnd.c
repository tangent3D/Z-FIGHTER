// randomizer implementation for z-fighter game "poker"
// by xrrawva 2021

#include <stdlib.h>
#include "rnd.h"

unsigned char rnd(unsigned char maxValue)
{
    unsigned char mask;
    if     (maxValue<1+ 1               )mask=1;
    else if(maxValue<1+ 1+2             )mask=1+2;
    else if(maxValue<1+ 1+2+4           )mask=1+2+4;
    else if(maxValue<1+ 1+2+4+8         )mask=1+2+4+8;
    else if(maxValue<1+ 1+2+4+8+16      )mask=1+2+4+8+16;
    else if(maxValue<1+ 1+2+4+8+16+32   )mask=1+2+4+8+16+32;
    else if(maxValue<1+ 1+2+4+8+16+32+64)mask=1+2+4+8+16+32+64;
    else                                 mask=1+2+4+8+16+32+64+128; // 255

    unsigned char result;
    do
    {
        result=rand();
        result&=mask;
    }
    while(result>maxValue);
    return result;
}

//void rndImprove(unsigned char unpredictableByte)
//{
//    srand(rand()+unpredictableByte);
//}
