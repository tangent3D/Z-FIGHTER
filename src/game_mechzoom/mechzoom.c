// space shooter game for z-fighter
// by xrrawva 2021

//#include <zf_buzzer.h> // TODO: buzzer(NOTE_D6);
#include <zf_gfx.h>
#include <zf_keypad.h>
#include <zf_lcd.h>
#define TRUE 1
#define FALSE 0

void main()
{
    // init
    const unsigned char spriteMech[] = {8,8,223,77,231,30,15,37,216,144};

    unsigned char pX=1;
    unsigned char pY=1;

    unsigned char run=TRUE;
    while(run)
    {
        color = 0;
        cls();

        point(rnd(127),rnd(63));

        block(spriteMech+2,pX,pY);

        lcd(screen);

        unsigned char pYOld=pY;
        if(key(KEY_UP))pY--;
        if(key(KEY_DOWN))pY++;
        if(pY>7)pY=pYOld;

        unsigned char pXOld=pX;
        if(key(KEY_LEFT))pX--;
        if(key(KEY_RIGHT))pX++;
        if(pX>15)pX=pXOld;
    }

    color = 1;
    cls();
    lcd(screen);
}
