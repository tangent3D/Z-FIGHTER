#include <zf_cf.h>
#include <zf_sio.h>
#include <zf_sleep.h>

void main()

{
    cfInit();
    //cfRead(0);
    //cfRead(250752+127); //last sector in fat partition and last sector on cf card
    //cfRead(0x10000/512);
    //cfRead(0x4E000/512);
    cfRead(668);

    sioDump(cfBuffer, 512);
    //sioDump(0x0, 65536);

    //sioDump(0, 65536);
}
