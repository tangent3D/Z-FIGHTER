// Z80 SIO/0 Serial Input/Output controller implementation for Z-Fighter
// tangent.space 2023

#include <zf_ppi.h>
#include <zf_sio.h>

void sioDump(unsigned char *baseAddr, unsigned long bytes)
{
    // Wait for serial port to open and signal readiness to device
    sioWaitCTS();
    sioSetRTS(1);

    for(unsigned long i = 0; i < bytes; i++)
    {
        sioWrite(*(baseAddr + i));
    }

    sioSetRTS(0);
}
