#include <stdio.h>
#include "sandbox.h"

int main(int argc,char* args[])
{
    sandboxInit();

    show(0x0004E080);
    show(0x00053800);
    if(disk[0x0004E080]=='P')printf("beep\n");

    sandboxUninit();
    return 0;
}
