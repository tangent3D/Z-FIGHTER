// module implementation for z-fighter application "menu"
// by xrrawva 2023

#include <zf_keypad.h>
#include "ui.h"
#define TRUE 1
#define FALSE 0

unsigned char keyOkReleased=TRUE;
unsigned char keyPrevReleased=TRUE;
unsigned char keyNextReleased=TRUE;

unsigned char keyOk(unsigned char release)
{
    unsigned char result=key(KEY_A)||key(KEY_B)||key(KEY_C)||key(KEY_D);
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

unsigned char keyPrev(unsigned char release)
{
    unsigned char result=key(KEY_UP)||key(KEY_LEFT);
    if(keyPrevReleased)
    {
        if(!result)keyPrevReleased=FALSE;
        return FALSE;
    }
    else
    {
        if(result)keyPrevReleased=release;
        return result;
    }
}

unsigned char keyNext(unsigned char release)
{
    unsigned char result=key(KEY_DOWN)||key(KEY_RIGHT);
    if(keyNextReleased)
    {
        if(!result)keyNextReleased=FALSE;
        return FALSE;
    }
    else
    {
        if(result)keyNextReleased=release;
        return result;
    }
}
