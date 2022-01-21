// module implementation for z-fighter game "mechzoom"
// by xrrawva 2021

#include <zf_gfx.h>
#include <zf_keypad.h>
#include <zf_lcd.h>
#include <zf_text.h>
#include "sound.h"
#include "ui.h"
#define TRUE 1
#define FALSE 0

const unsigned char bpCursor[]={0,8,12,126,127,126,12,8};

unsigned char keyOkReleased=TRUE;
unsigned char keyBackReleased=TRUE;
unsigned char keyUpReleased=TRUE;
unsigned char keyDownReleased=TRUE;
unsigned char keyLeftReleased=TRUE;
unsigned char keyRightReleased=TRUE;

unsigned char keyOk(unsigned char release)
{
    unsigned char result=key(KEY_C)||key(KEY_D);
    if(keyOkReleased)
    {
        if(!result)keyOkReleased=FALSE;
        return FALSE;
    }
    else
    {
        if(result)keyOkReleased=release;
        return result;
    }
}

unsigned char keyBack(unsigned char release)
{
    unsigned char result=key(KEY_A)||key(KEY_B);
    if(keyBackReleased)
    {
        if(!result)keyBackReleased=FALSE;
        return FALSE;
    }
    else
    {
        if(result)keyBackReleased=release;
        return result;
    }
}

unsigned char keyUp(unsigned char release)
{
    unsigned char result=key(KEY_UP);
    if(keyUpReleased)
    {
        if(!result)keyUpReleased=FALSE;
        return FALSE;
    }
    else
    {
        if(result)keyUpReleased=release;
        return result;
    }
}

unsigned char keyDown(unsigned char release)
{
    unsigned char result=key(KEY_DOWN);
    if(keyDownReleased)
    {
        if(!result)keyDownReleased=FALSE;
        return FALSE;
    }
    else
    {
        if(result)keyDownReleased=release;
        return result;
    }
}

unsigned char keyLeft(unsigned char release)
{
    unsigned char result=key(KEY_LEFT);
    if(keyLeftReleased)
    {
        if(!result)keyLeftReleased=FALSE;
        return FALSE;
    }
    else
    {
        if(result)keyLeftReleased=release;
        return result;
    }
}

unsigned char keyRight(unsigned char release)
{
    unsigned char result=key(KEY_RIGHT);
    if(keyRightReleased)
    {
        if(!result)keyRightReleased=FALSE;
        return FALSE;
    }
    else
    {
        if(result)keyRightReleased=release;
        return result;
    }
}

void fadeToBlack()
{
    for(unsigned char i=0;i<16;i++)
    {
        unsigned char x=0;
        unsigned char y=0;
        unsigned char prevValue=255;
        unsigned char* screenPointer = screen;
        while(screenPointer<screen+SCREEN_H*SCREEN_W/8)
        {
            if(y&1)
            {
                unsigned char prevValueOld=prevValue;
                prevValue=*screenPointer;
                if(x==0)*screenPointer=255;
                else    *screenPointer=prevValueOld;
            }
            else
            {
                if(x==15)*screenPointer=255;
                else     *screenPointer=*(screenPointer+1);
            }
            screenPointer++;
            x++;
            if(x==16)
            {
                x=0;
                y++;
            }
        }
        lcd(screen);
    }
}

void fadeToWhite()
{
    for(unsigned char i=0;i<16;i++)
    {
        unsigned char x=0;
        unsigned char y=0;
        unsigned char prevValue=0;
        unsigned char* screenPointer = screen;
        while(screenPointer<screen+SCREEN_H*SCREEN_W/8)
        {
            if(y&1)
            {
                unsigned char prevValueOld=prevValue;
                prevValue=*screenPointer;
                if(x==0)*screenPointer=0;
                else    *screenPointer=prevValueOld;
            }
            else
            {
                if(x==15)*screenPointer=0;
                else     *screenPointer=*(screenPointer+1);
            }
            screenPointer++;
            x++;
            if(x==16)
            {
                x=0;
                y++;
            }
        }
        lcd(screen);
    }
}

void showTextPage(const char* text)
{
    keyOk(TRUE);
    fadeToBlack();

    // scroll in text
    unsigned char y=8;
    unsigned char scrollDelayCounter=0;
    while(y>0)
    {
        scrollDelayCounter++;
        if(scrollDelayCounter>10)
        {
            scrollDelayCounter=0;
            y--;
        }
        if(keyOk(TRUE))y=0;
        color=0;
        cls();
        print((unsigned char*)text,0,y);
        lcd(screen);
    }

    // wait for user
    block(bpCursor,15,7);
    lcd(screen);
    while(!keyOk(TRUE));
    print((unsigned char*)" ",15,7);
    lcd(screen);
    soundOk();
}
