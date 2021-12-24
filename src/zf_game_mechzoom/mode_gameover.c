// module implementation for z-fighter game "mechzoom"
// by xrrawva 2021

#include <zf_gfx.h>
#include <zf_lcd.h>
#include "mode_gameover.h"
#include "rnd.h"
#include "sound.h"
#include "ui.h"
#define TRUE 1
#define FALSE 0

unsigned char getPoint(unsigned char x, unsigned char y)
{
    unsigned char xByte=x>>3; // /8
    unsigned char xBit=x&(1+2+4); // %8
    unsigned char xBitSelector=128>>xBit;
    int screenPointer=y;
    screenPointer<<=4; // *(SCREEN_W/8)
    screenPointer+=xByte;
    screenPointer+=(int)screen;
    if(*(unsigned char*)screenPointer&xBitSelector)return 1;
    else                                           return 0;
}

void modeGameOver()
{
    const unsigned char bpExplosion[]={133,110,60,255,62,124,110,137};
    color=1;
    block(bpExplosion,playerX,playerY);
    lcd(screen);

    unsigned char soundInterval=1;
    unsigned char soundCountdown=soundInterval;
    unsigned char allowExit=0;
    while(allowExit!=255)
    {
        if(soundInterval<8)
        {
            soundCountdown--;
            if(soundCountdown==0)
            {
                soundCountdown=soundInterval;
                soundInterval++;
                soundPlayerDeath();
            }
        }

        if(allowExit<30)
        {
            allowExit++;
            keyOk(TRUE);
            keyBack(TRUE);
        }
        else
        {
            if(keyOk(TRUE)||keyBack(TRUE))allowExit=255;
        }

        unsigned char xCenter=(playerX<<3)+4;
        unsigned char yCenter=(playerY<<3)+4;
        for(unsigned char i=0;i<200;i++)
        {
            unsigned char x0=rnd(127);
            unsigned char y0=rnd(63);
            unsigned char x1=x0;
            if(x1<xCenter)x1--;
            else          x1++;
            unsigned char y1=y0;
            if(y1<yCenter)y1--;
            else          y1++;
            color=getPoint(x0,y0);
            point(x1,y1);
        }
        lcd(screen);
    }
}
