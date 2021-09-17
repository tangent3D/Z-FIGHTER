// Z80 SIO/0 Serial Input/Output controller implementation for Z-Fighter
// by Tangent 2021

#include <zf_sio.h>

unsigned char channel = CH_A;

void sioPrint(unsigned char string[])
    {
        int i = 0;
        while (string[i] != '\0')
            {
            sioWrite(string[i]);
            i++;
            }
    }