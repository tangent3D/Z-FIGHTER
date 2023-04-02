// cf menu application for z-fighter
// by xrrawva 2023

#include <stdlib.h>
#include <zf_gfx.h>
#include <zf_lcd.h>
#include <zf_text.h>
#include "sound.h"
#include "ui.h"
#define TRUE 1
#define FALSE 0

void renderMenu(unsigned char i, unsigned char n)
{
    color=1;
    cls();
    print((unsigned char*)"FILENAME.ART",2,1); // TODO
    color=0;

    char text[17];
    text[ 0]=' ';
    text[ 1]=' ';
    text[ 2]=' ';
    text[ 3]='/';
    text[ 4]=' ';
    text[ 5]=' ';
    text[ 6]=' ';
    text[ 7]=' ';
    text[ 8]='?';
    text[ 9]='?';
    text[10]='?';
    text[11]='?';
    text[12]='?';
    text[13]='?';
    text[14]='?';
    text[15]='?';
    text[16]='\0';

    print((unsigned char*)text,0,7);

    utoa(i+1,text,10);
    print((unsigned char*)text,0,7);
    utoa(n+1,text,10);
    print((unsigned char*)text,4,7);
    lcd(screen);
}

void main()
{
    color=1;
    cls();
    print((unsigned char*)"HELLO",0,0);
    lcd(screen);
    //soundHello(); // TODO

    unsigned char i=0;
    unsigned char n=255;

    renderMenu(i,n);
    while(TRUE)
    {
        if(keyOk(TRUE))
        {
            color=1;
            cls();
            print((unsigned char*)"LOADING...",0,0);
            lcd(screen);

            //soundOk();
            // TODO
            print((unsigned char*)"ERROR",0,1);
            lcd(screen);
            soundError();
            while(TRUE)
            {
            }
        }
        else if(keyPrev(TRUE))
        {
            soundSelect();
            i--;
            if(i>=n)i=n-1;
            renderMenu(i,n);
        }
        else if(keyNext(TRUE))
        {
            soundSelect();
            i++;
            if(i>=n)i=0;
            renderMenu(i,n);
        }
    }
}
