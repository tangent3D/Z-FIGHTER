// module implementation for z-fighter game "mechzoom"
// by xrrawva 2021

#include <zf_gfx.h>
#include <zf_lcd.h>
#include <zf_text.h>
#include "mode_pause.h"
#include "sound.h"
#include "ui.h"
#define TRUE 1
#define FALSE 0

void modePause()
{
    color=1;
    cls();
    print((unsigned char*)"Pause",5,3);
    lcd(screen);

    while(TRUE)
    {
        if(keyOk(TRUE))
        {
            soundOk();
            break;
        }
        if(keyBack(TRUE))
        {
            soundBack();
            break;
        }
    }
    color=0;
}
