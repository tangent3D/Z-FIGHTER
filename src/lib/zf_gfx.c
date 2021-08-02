// v0.0 by xrrawva

#include "zf_gfx.h"

//#define ZF_GFX_FAST

void cls()
{
#ifndef ZF_GFX_FAST

    unsigned char c;
    if(color) c = 0;
    else c = 255;

    int i = 0;
    for(unsigned char y = 0; y < SCREEN_H; y++)
    {
        for(unsigned char xByte = 0; xByte < SCREEN_W / 8; xByte++)
        {
            screen[i] = c;
            i++;
        }
    }

#else

    unsigned char* screenPointer = screen;
    if(color)
    {
        while(screenPointer < screen + SCREEN_H * SCREEN_W / 8)
        {
            *screenPointer = 0;
            screenPointer++;
        }
    }
    else
    {
        while(screenPointer < screen + SCREEN_H * SCREEN_W / 8)
        {
            *screenPointer = 255;
            screenPointer++;
        }
    }

#endif
}

void point(unsigned char x, unsigned char y)
{
#ifndef ZF_GFX_FAST

    if(x > SCREEN_W - 1) return;
    if(y > SCREEN_H - 1) return;

    unsigned char xByte = x / 8;
    unsigned char xBit = x % 8;
    unsigned char xBitSelector = 128 >> xBit;
    int screenI = y * (SCREEN_W / 8) + xByte;
    unsigned char screenByte = screen[screenI];
    if(color)
    {
        screenByte = screenByte | xBitSelector;
    }
    else
    {
        screenByte = screenByte & (~xBitSelector);
    }
    screen[screenI] = screenByte;

#else

    if(x > SCREEN_W - 1) return;
    if(y > SCREEN_H - 1) return;

    unsigned char xByte = x >> 3;
    unsigned char xBit = x - xByte;
    unsigned char xBitSelector = 128 >> xBit;

    int screenPointer = y;
    screenPointer <<= 4; // *=(SCREEN_W/8)
    screenPointer += xByte;
    screenPointer += screen;

    unsigned char screenByte = *(unsigned char*)screenPointer;
    if(color)
    {
        screenByte = screenByte | xBitSelector;
    }
    else
    {
        screenByte = screenByte & (~xBitSelector);
    }
    *(unsigned char*)screenPointer = screenByte;

#endif
}

void lineTo(unsigned char x, unsigned char y)
{
#ifndef ZF_GFX_FAST

    // TODO

#else

    // TODO

#endif
}

void rect(unsigned char x, unsigned char y, unsigned char w, unsigned char h)
{
#ifndef ZF_GFX_FAST

    // TODO
    unsigned char xStart = x;
    for(unsigned char yy = 0; yy < h; yy++)
    {
        for(unsigned char xx = 0; xx < w; xx++)
        {
            point(x, y);
            x++;
        }
        x = xStart;
        y++;
    }

#else

    // TODO

#endif
}

void sprite(const unsigned char* spriteObject, unsigned char x, unsigned char y)
{
#ifndef ZF_GFX_FAST

    unsigned char w = spriteObject[0];
    unsigned char h = spriteObject[1];
    unsigned char* spritePointer = spriteObject + 2;
    unsigned char spriteBitSelector = 128;

    unsigned char colorStart1 = color;
    unsigned char colorStart0 = 1 - color;

    unsigned char xStart = x;
    for(unsigned char yy = 0; yy < h; yy++)
    {
        for(unsigned char xx = 0; xx < w; xx++)
        {
            if(*spritePointer & spriteBitSelector) color = colorStart1;
            else color = colorStart0;
            point(x, y);

            spriteBitSelector >>= 1;
            if(!spriteBitSelector)
            {
                spritePointer++;
                spriteBitSelector = 128;
            }

            x++;
        }
        x = xStart;
        y++;
    }
    color = colorStart1;

#else

    // TODO

#endif
}

void spriteTransparent(const unsigned char* spriteObject, unsigned char x, unsigned char y)
{
#ifndef ZF_GFX_FAST

    unsigned char w = spriteObject[0];
    unsigned char h = spriteObject[1];
    unsigned char* spritePointer = spriteObject + 2;
    unsigned char spriteBitSelector = 128;

    unsigned char xStart = x;
    for(unsigned char yy = 0; yy < h; yy++)
    {
        for(unsigned char xx = 0; xx < w; xx++)
        {
            if(*spritePointer & spriteBitSelector) point(x, y);

            spriteBitSelector >>= 1;
            if(!spriteBitSelector)
            {
                spritePointer++;
                spriteBitSelector = 128;
            }

            x++;
        }
        x = xStart;
        y++;
    }

#else

    // TODO

#endif
}
