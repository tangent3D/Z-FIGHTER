// cf menu application for z-fighter
// by xrrawva 2023

#include <stdlib.h>
#include <zf_gfx.h>
#include <zf_lcd.h>
#include <zf_text.h>
#include "fat16.h"
#include "sound.h"
#include "ui.h"
#define TRUE 1
#define FALSE 0

void renderMenu(unsigned char i, unsigned char n)
{
    color=1;
    cls();
    print((unsigned char*)"FILENAME.ART",2,1); // TODO

    fat16GetFileNameByExtension("BIN",i);
    char text[17];
  //text[ 0]=' ';
    text[ 1]=' ';
    text[ 2]=' ';
    text[ 3]='/';
  //text[ 4]=' ';
    text[ 5]=' ';
    text[ 6]=' ';
    text[ 7]=' ';
    text[ 8]=fat16GetFileNameResult[0];
    text[ 9]=fat16GetFileNameResult[1];
    text[10]=fat16GetFileNameResult[2];
    text[11]=fat16GetFileNameResult[3];
    text[12]=fat16GetFileNameResult[4];
    text[13]=fat16GetFileNameResult[5];
    text[14]=fat16GetFileNameResult[6];
    text[15]=fat16GetFileNameResult[7];
    text[16]='\0';

    color=0;
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
    print((unsigned char*)"LOADING...",0,0);
    lcd(screen);

    unsigned char fat16InitError=fat16Init();
    if(fat16InitError){
        print((unsigned char*)"ERROR",0,2);
        if     (fat16InitError==1)print((unsigned char*)"OEM NAME",0,3);
        else if(fat16InitError==2)print((unsigned char*)"SECTOR SIZE     ",0,3);
        else if(fat16InitError==3)print((unsigned char*)"FAT COUNT",0,3);
        else if(fat16InitError==4)print((unsigned char*)"ROOT ENTRY COUNT",0,3);
        else print((unsigned char*)"UNKNOWN",0,3);
        lcd(screen);
        soundError();
        while(TRUE){}
    }

    unsigned char i=0;
    unsigned char n=fat16GetFileCountByExtension("BIN");
    if(n==0)
    {
        print((unsigned char*)"ERROR",0,2);
        print((unsigned char*)"NO .BIN-FILES",0,3);
        lcd(screen);
        soundError();
        while(TRUE){}
    }

    print((unsigned char*)"OK",0,2);
    lcd(screen);
    soundHello();

    renderMenu(i,n);
    while(TRUE)
    {
        if(keyOk(TRUE))
        {
            color=1;
            cls();
            print((unsigned char*)"LOADING...",0,0);
            lcd(screen);
            soundOk();

            //const unsigned int targetAddress=0x8000; // TODO
            void (*targetAddress)(void)=(void (*)())0x8000; // TODO
            if(fat16LoadFileByExtension("BIN",i,(unsigned char*)targetAddress))
            {
                print((unsigned char*)"ERROR",0,1);
                lcd(screen);
                soundError();
                while(TRUE){}
            }
            targetAddress();
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
