// Z80 SIO/0 Serial Input/Output controller implementation for Z-Fighter
// by Tangent 2021

#include <zf_sio.h>

void sioPrint(unsigned char channel, unsigned char string[])
    {
        int i = 0;
        while (string[i] != '\0')
            {
            sioWrite(channel, string[i]);
            i++;
            }
    }