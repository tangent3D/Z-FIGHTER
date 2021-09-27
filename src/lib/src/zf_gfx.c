// graphics library implementation for z-fighter
// by xrrawva 2021

#include <zf_gfx.h>

//#define ZF_GFX_SKIP_PARAM_CHECKS // faster but undefined behavior for out of bounds parameters

__at (SCREEN_W) void* screen_w;
__at (SCREEN_H) void* screen_h;
unsigned char color = 1;
unsigned char screen[(SCREEN_W / 8) * SCREEN_H];
unsigned char oldLineX;
unsigned char oldLineY;

void cls()
{
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
}

void point(unsigned char x, unsigned char y)
{
#ifndef ZF_GFX_SKIP_PARAM_CHECKS
    // skip if off screen
    if(y > SCREEN_H - 1) return;
    if(x > SCREEN_W - 1) return;
#endif

    unsigned char xByte = x >> 3; // /8
    unsigned char xBit = x & (1 + 2 + 4); // %8
    unsigned char xBitSelector = 128 >> xBit;
    int screenPointer = y;
    screenPointer <<= 4; // *(SCREEN_W/8)
    screenPointer += xByte;
    screenPointer += (int)screen;

    if(color) *(unsigned char*)screenPointer |= xBitSelector;
    else *(unsigned char*)screenPointer &= ~xBitSelector;
}

// internally used by lineTo() for speed
void pointColor1(unsigned char x, unsigned char y)
{
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //              (copy)
    if(y > SCREEN_H - 1) return; //              (copy)
    if(x > SCREEN_W - 1) return; //              (copy)
#endif //                                        (copy)
    unsigned char xByte = x >> 3; //             (copy)
    unsigned char xBit = x & (1 + 2 + 4); //     (copy)
    unsigned char xBitSelector = 128 >> xBit; // (copy)
    int screenPointer = y; //                    (copy)
    screenPointer <<= 4; //                      (copy)
    screenPointer += xByte; //                   (copy)
    screenPointer += (int)screen; //             (copy)
    *(unsigned char*)screenPointer |= xBitSelector; // (different)
}

// internally used by lineTo() for speed
void pointColor0(unsigned char x, unsigned char y)
{
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //              (copy)
    if(y > SCREEN_H - 1) return; //              (copy)
    if(x > SCREEN_W - 1) return; //              (copy)
#endif //                                        (copy)
    unsigned char xByte = x >> 3; //             (copy)
    unsigned char xBit = x & (1 + 2 + 4); //     (copy)
    unsigned char xBitSelector = 128 >> xBit; // (copy)
    int screenPointer = y; //                    (copy)
    screenPointer <<= 4; //                      (copy)
    screenPointer += xByte; //                   (copy)
    screenPointer += (int)screen; //             (copy)
    *(unsigned char*)screenPointer &= ~xBitSelector; // (different)
}

void lineFrom(unsigned char x, unsigned char y)
{
    // remember x y for next lineTo() call
    oldLineY = y + ((256 - SCREEN_H) / 2); // centered to 128
    oldLineX = x + ((256 - SCREEN_W) / 2); // centered to 128
}

void lineTo(unsigned char x, unsigned char y)
{
    // center to 128
    y += ((256 - SCREEN_H) / 2);
    x += ((256 - SCREEN_W) / 2);

    // reorganize line direction for drawing loop
    unsigned char x0; // from (including)
    unsigned char y0; // from (including)
    unsigned char x1; // to   (including)
    unsigned char y1; // to   (including)
    // xDir is always 1
    signed char yDir; // 1 or -1
    unsigned char diffX; // always positive
    unsigned char diffY; // always positive
    if(oldLineX < x)
    {
        x1 = x;
        x0 = oldLineX;
        y0 = oldLineY;
        y1 = y;
    }
    else
    {
        x0 = x;
        x1 = oldLineX;
        y1 = oldLineY;
        y0 = y;
    }
    diffX = x1 - x0;
    if(y0 < y1)
    {
        diffY = y1 - y0;
        yDir = 1;
    }
    else
    {
        diffY = y0 - y1;
        yDir = -1;
    }

    // remember x y for next lineTo() call
    oldLineY = y;
    oldLineX = x;

    // undo center to 128
    y0 -= ((256 - SCREEN_H) / 2);
    x1 -= ((256 - SCREEN_W) / 2) - 1;
    y1 -= ((256 - SCREEN_H) / 2);
    x0 -= ((256 - SCREEN_W) / 2);

    // drawing loop
    int mulXYMax = 0; // catching-up sum to create slope
    int mulXYNow = 0; // catching-up sum to create slope
    x = x0;
    y = y0 - yDir;
    if(color)
    {
        do
        {
            y += yDir;
            mulXYMax += diffX;
            if(mulXYNow >= mulXYMax) pointColor1(x, y); // draw up/down only
            else
            {
                while(mulXYNow < mulXYMax)
                {
                    pointColor1(x, y); // draw
                    x++;
                    if(x == x1) return; // don't overshoot
                    mulXYNow += diffY;
                }
            }
        }
        while(y != y1);
    }
    else
    {
        do //                                 (copy)
        { //                                  (copy)
            y += yDir; //                     (copy)
            mulXYMax += diffX; //             (copy)
            if(mulXYNow >= mulXYMax) pointColor0(x, y); // (different)
            else //                           (copy)
            { //                              (copy)
                while(mulXYNow < mulXYMax) // (copy)
                { //                          (copy)
                    pointColor0(x, y); //                  (different)
                    x++; //                   (copy)
                    if(x == x1) return; //    (copy)
                    mulXYNow += diffY; //     (copy)
                } //                          (copy)
            } //                              (copy)
        } //                                  (copy)
        while(y != y1); //                    (copy)
    }
}

void rect(unsigned char x0, unsigned char y0, unsigned char w, unsigned char h)
{
#ifndef ZF_GFX_SKIP_PARAM_CHECKS
    if(h == 0) return;
    if(w == 0) return;
#endif

    unsigned char x1 = x0 + w - 1; // to (including)
    unsigned char y1 = y0 + h - 1; // to (including)

#ifndef ZF_GFX_SKIP_PARAM_CHECKS
    // snap onto screen
    if(x0 > (unsigned char)(-(256 - SCREEN_W) / 2)) x0 = 0;
    else if(x0 > SCREEN_W - 1) return;
    if(y0 > (unsigned char)(-(256 - SCREEN_H) / 2)) y0 = 0;
    else if(y0 > SCREEN_H - 1) return;
    if(x1 > (unsigned char)(-(256 - SCREEN_W) / 2)) return;
    else if(x1 > SCREEN_W - 1) x1 = SCREEN_W - 1;
    if(y1 > (unsigned char)(-(256 - SCREEN_H) / 2)) return;
    else if(y1 > SCREEN_H - 1) y1 = SCREEN_H - 1;
#endif

    unsigned char x0Byte = x0 >> 3; // /8
    unsigned char x0Bit = x0 & (1 + 2 + 4); // %8

    unsigned char x1Byte = x1 >> 3; // /8
    unsigned char x1Bit = x1 & (1 + 2 + 4); // %8

    // first row
    if(x0Bit == 0 && x0Byte != x1Byte)
    {
        // write as full byte row later
        x0Byte--;
    }
    else
    {
        // create row pattern
        unsigned char x0BitsSelector = 255 >> x0Bit;
        if(x0Byte == x1Byte) x0BitsSelector ^= (255 >> (x1Bit + 1));

        // write row pattern
        int screenPointer = y0;
        screenPointer <<= 4; // *(SCREEN_W/8)
        int screenPointerLast = y1;
        screenPointerLast <<= 4; // *(SCREEN_W/8)
        screenPointerLast += x0Byte;
        screenPointer += x0Byte;
        screenPointer += (int)screen;
        screenPointerLast += (int)screen;
        if(color)
        {
            while(screenPointer <= screenPointerLast)
            {
                *(unsigned char*)screenPointer |= x0BitsSelector;
                screenPointer += SCREEN_W / 8; // y++
            }
        }
        else
        {
            while(screenPointer <= screenPointerLast)
            {
                *(unsigned char*)screenPointer &= (~x0BitsSelector);
                screenPointer += SCREEN_W / 8; // y++
            }
        }
    }

    if(x0Byte != x1Byte)
    {
        // last row
        if(x1Bit == 7)
        {
            // write as full byte row later
            x1Byte++;
        }
        else
        {
            // create row pattern
            unsigned char x1BitsSelector = ~(255 >> (x1Bit + 1));

            // write row pattern
            int screenPointer = y0;
            screenPointer <<= 4; // *(SCREEN_W/8)
            int screenPointerLast = y1;
            screenPointerLast <<= 4; // *(SCREEN_W/8)
            screenPointerLast += x1Byte;
            screenPointer += x1Byte;
            screenPointer += (int)screen;
            screenPointerLast += (int)screen;
            if(color)
            {
                while(screenPointer <= screenPointerLast)
                {
                    *(unsigned char*)screenPointer |= x1BitsSelector;
                    screenPointer += SCREEN_W / 8; // y++
                }
            }
            else
            {
                while(screenPointer <= screenPointerLast)
                {
                    *(unsigned char*)screenPointer &= (~x1BitsSelector);
                    screenPointer += SCREEN_W / 8; // y++
                }
            }
        }

        // write full byte rows
        x0Byte++;
        x1Byte--;
        for(unsigned char xByte = x0Byte; xByte <= x1Byte; xByte++)
        {
            int screenPointer = y0;
            screenPointer <<= 4; // *(SCREEN_W/8)
            int screenPointerLast = y1;
            screenPointerLast <<= 4; // *(SCREEN_W/8)
            screenPointerLast += xByte;
            screenPointer += xByte;
            screenPointer += (int)screen;
            screenPointerLast += (int)screen;
            if(color)
            {
                while(screenPointer <= screenPointerLast)
                {
                    *(unsigned char*)screenPointer = 255;
                    screenPointer += SCREEN_W / 8; // y++
                }
            }
            else
            {
                while(screenPointer <= screenPointerLast)
                {
                    *(unsigned char*)screenPointer = 0;
                    screenPointer += SCREEN_W / 8; // y++
                }
            }
        }
    }
}

void sprite(const unsigned char* spritePattern, unsigned char x, unsigned char y)
{
    unsigned char w = *spritePattern;
    spritePattern++;
    unsigned char h = *spritePattern;
    spritePattern++;

    unsigned char wBytes = w >> 3; // /8
    unsigned char wBits = w & (1 + 2 + 4); // %8
    unsigned char spriteBitSelector = 128;
    unsigned char xStart = x;
    if(color)
    {
        for(unsigned char yy = 0; yy < h; yy++)
        {
#ifndef ZF_GFX_SKIP_PARAM_CHECKS
            if(y > SCREEN_H - 1)
            {
                // skip row
                for(unsigned char xx = 0; xx < wBits; xx++)
                {
                    spriteBitSelector >>= 1;
                    if(spriteBitSelector == 0) spriteBitSelector = 128;
                }
                spritePattern += wBytes;
            }
            else
            {
#endif
                // prepare point(x, y) replacement 1/2
                unsigned char xByte = x >> 3; // /8
                unsigned char xBit = x & (1 + 2 + 4); // %8
                unsigned char xBitSelector = 128 >> xBit;
                int screenPointer = y;
                screenPointer <<= 4; // *(SCREEN_W/8)
                screenPointer += xByte;
                screenPointer += (int)screen;
#ifndef ZF_GFX_SKIP_PARAM_CHECKS
                if(x > SCREEN_W - 1) screenPointer -= 32;
#endif

                // draw row
                for(unsigned char xx = 0; xx < w; xx++)
                {
                    // point(x, y) replacement
#ifndef ZF_GFX_SKIP_PARAM_CHECKS
                    if(x < SCREEN_W)
                    {
#endif
                        if(*spritePattern & spriteBitSelector) *(unsigned char*)screenPointer |= xBitSelector; // black because color=1
                        else *(unsigned char*)screenPointer &= (~xBitSelector); //                                white because color=1
#ifndef ZF_GFX_SKIP_PARAM_CHECKS
                    }
#endif

                    // prepare point(x, y) replacement 2/2
                    xBitSelector >>= 1;
                    if(xBitSelector == 0)
                    {
                        xBitSelector = 128;
                        screenPointer++;
                    }

                    spriteBitSelector >>= 1;
                    if(spriteBitSelector == 0)
                    {
                        spriteBitSelector = 128;
                        spritePattern++;
                    }
                    x++;
                }
#ifndef ZF_GFX_SKIP_PARAM_CHECKS
            }
#endif
            x = xStart;
            y++;
        }
    }
    else
    {
        for(unsigned char yy = 0; yy < h; yy++) //                         (copy)
        { //                                                               (copy)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
            if(y > SCREEN_H - 1) //                                        (copy)
            { //                                                           (copy)
                for(unsigned char xx = 0; xx < wBits; xx++) //             (copy)
                { //                                                       (copy)
                    spriteBitSelector >>= 1; //                            (copy)
                    if(spriteBitSelector == 0) spriteBitSelector = 128; // (copy)
                } //                                                       (copy)
                spritePattern += wBytes; //                                (copy)
            } //                                                           (copy)
            else //                                                        (copy)
            { //                                                           (copy)
#endif //                                                                  (copy)
                unsigned char xByte = x >> 3; //                           (copy)
                unsigned char xBit = x & (1 + 2 + 4); //                   (copy)
                unsigned char xBitSelector = 128 >> xBit; //               (copy)
                int screenPointer = y; //                                  (copy)
                screenPointer <<= 4; //                                    (copy)
                screenPointer += xByte; //                                 (copy)
                screenPointer += (int)screen; //                           (copy)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
                if(x > SCREEN_W - 1) screenPointer -= 32; //               (copy)
#endif //                                                                  (copy)
                for(unsigned char xx = 0; xx < w; xx++) //                 (copy)
                { //                                                       (copy)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
                    if(x < SCREEN_W) //                                    (copy)
                    { //                                                   (copy)
#endif //                                                                  (copy)
                        if(*spritePattern & spriteBitSelector) *(unsigned char*)screenPointer &= (~xBitSelector); // white because color=0 // (different)
                        else *(unsigned char*)screenPointer |= xBitSelector; //                                      black because color=0 // (different)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
                    } //                                                   (copy)
#endif //                                                                  (copy)
                    xBitSelector >>= 1; //                                 (copy)
                    if(xBitSelector == 0) //                               (copy)
                    { //                                                   (copy)
                        xBitSelector = 128; //                             (copy)
                        screenPointer++; //                                (copy)
                    } //                                                   (copy)
                    spriteBitSelector >>= 1; //                            (copy)
                    if(spriteBitSelector == 0) //                          (copy)
                    { //                                                   (copy)
                        spriteBitSelector = 128; //                        (copy)
                        spritePattern++; //                                (copy)
                    } //                                                   (copy)
                    x++; //                                                (copy)
                } //                                                       (copy)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
            } //                                                           (copy)
#endif //                                                                  (copy)
            x = xStart; //                                                 (copy)
            y++; //                                                        (copy)
        } //                                                               (copy)
    }
}

void spriteTransparent(const unsigned char* spritePattern, unsigned char x, unsigned char y)
{
    unsigned char w = *spritePattern; //                                   (copy)
    spritePattern++; //                                                    (copy)
    unsigned char h = *spritePattern; //                                   (copy)
    spritePattern++; //                                                    (copy)
    unsigned char wBytes = w >> 3; //                                      (copy)
    unsigned char wBits = w & (1 + 2 + 4); //                              (copy)
    unsigned char spriteBitSelector = 128; //                              (copy)
    unsigned char xStart = x; //                                           (copy)
    if(color)
    {
        for(unsigned char yy = 0; yy < h; yy++) //                         (copy)
        { //                                                               (copy)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
            if(y > SCREEN_H - 1) //                                        (copy)
            { //                                                           (copy)
                for(unsigned char xx = 0; xx < wBits; xx++) //             (copy)
                { //                                                       (copy)
                    spriteBitSelector >>= 1; //                            (copy)
                    if(spriteBitSelector == 0) spriteBitSelector = 128; // (copy)
                } //                                                       (copy)
                spritePattern += wBytes; //                                (copy)
            } //                                                           (copy)
            else //                                                        (copy)
            { //                                                           (copy)
#endif //                                                                  (copy)
                unsigned char xByte = x >> 3; //                           (copy)
                unsigned char xBit = x & (1 + 2 + 4); //                   (copy)
                unsigned char xBitSelector = 128 >> xBit; //               (copy)
                int screenPointer = y; //                                  (copy)
                screenPointer <<= 4; //                                    (copy)
                screenPointer += xByte; //                                 (copy)
                screenPointer += (int)screen; //                           (copy)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
                if(x > SCREEN_W - 1) screenPointer -= 32; //               (copy)
#endif //                                                                  (copy)
                for(unsigned char xx = 0; xx < w; xx++) //                 (copy)
                { //                                                       (copy)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
                    if(x < SCREEN_W) //                                    (copy)
                    { //                                                   (copy)
#endif //                                                                  (copy)
                        if(*spritePattern & spriteBitSelector) *(unsigned char*)screenPointer |= xBitSelector; //                                      black because color=1 // (different)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
                    } //                                                   (copy)
#endif //                                                                  (copy)
                    xBitSelector >>= 1; //                                 (copy)
                    if(xBitSelector == 0) //                               (copy)
                    { //                                                   (copy)
                        xBitSelector = 128; //                             (copy)
                        screenPointer++; //                                (copy)
                    } //                                                   (copy)
                    spriteBitSelector >>= 1; //                            (copy)
                    if(spriteBitSelector == 0) //                          (copy)
                    { //                                                   (copy)
                        spriteBitSelector = 128; //                        (copy)
                        spritePattern++; //                                (copy)
                    } //                                                   (copy)
                    x++; //                                                (copy)
                } //                                                       (copy)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
            } //                                                           (copy)
#endif //                                                                  (copy)
            x = xStart; //                                                 (copy)
            y++; //                                                        (copy)
        } //                                                               (copy)
    }
    else
    {
        for(unsigned char yy = 0; yy < h; yy++) //                         (copy)
        { //                                                               (copy)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
            if(y > SCREEN_H - 1) //                                        (copy)
            { //                                                           (copy)
                for(unsigned char xx = 0; xx < wBits; xx++) //             (copy)
                { //                                                       (copy)
                    spriteBitSelector >>= 1; //                            (copy)
                    if(spriteBitSelector == 0) spriteBitSelector = 128; // (copy)
                } //                                                       (copy)
                spritePattern += wBytes; //                                (copy)
            } //                                                           (copy)
            else //                                                        (copy)
            { //                                                           (copy)
#endif //                                                                  (copy)
                unsigned char xByte = x >> 3; //                           (copy)
                unsigned char xBit = x & (1 + 2 + 4); //                   (copy)
                unsigned char xBitSelector = 128 >> xBit; //               (copy)
                int screenPointer = y; //                                  (copy)
                screenPointer <<= 4; //                                    (copy)
                screenPointer += xByte; //                                 (copy)
                screenPointer += (int)screen; //                           (copy)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
                if(x > SCREEN_W - 1) screenPointer -= 32; //               (copy)
#endif //                                                                  (copy)
                for(unsigned char xx = 0; xx < w; xx++) //                 (copy)
                { //                                                       (copy)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
                    if(x < SCREEN_W) //                                    (copy)
                    { //                                                   (copy)
#endif //                                                                  (copy)
                        if(*spritePattern & spriteBitSelector) *(unsigned char*)screenPointer &= (~xBitSelector); // white because color=0 // (different)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
                    } //                                                   (copy)
#endif //                                                                  (copy)
                    xBitSelector >>= 1; //                                 (copy)
                    if(xBitSelector == 0) //                               (copy)
                    { //                                                   (copy)
                        xBitSelector = 128; //                             (copy)
                        screenPointer++; //                                (copy)
                    } //                                                   (copy)
                    spriteBitSelector >>= 1; //                            (copy)
                    if(spriteBitSelector == 0) //                          (copy)
                    { //                                                   (copy)
                        spriteBitSelector = 128; //                        (copy)
                        spritePattern++; //                                (copy)
                    } //                                                   (copy)
                    x++; //                                                (copy)
                } //                                                       (copy)
#ifndef ZF_GFX_SKIP_PARAM_CHECKS //                                        (copy)
            } //                                                           (copy)
#endif //                                                                  (copy)
            x = xStart; //                                                 (copy)
            y++; //                                                        (copy)
        } //                                                               (copy)
    }
}

// replaced by .asm
/*void block(const unsigned char* blockPattern, unsigned char blockX, unsigned char blockY)
{
#ifndef ZF_GFX_SKIP_PARAM_CHECKS
    // skip if off screen
    if(blockY > (unsigned char)(SCREEN_H / 8 - 1)) return;
    if(blockX > (unsigned char)(SCREEN_W / 8 - 1)) return;
#endif

    int screenPointer = blockY;
    screenPointer <<= 7;
    screenPointer += blockX;
    screenPointer += (int)screen;
    if(color)
    {
        *(unsigned char*)screenPointer = *blockPattern; // byte 1
        screenPointer += SCREEN_W / 8;
        blockPattern++;
        *(unsigned char*)screenPointer = *blockPattern; // byte 2
        screenPointer += SCREEN_W / 8;
        blockPattern++;
        *(unsigned char*)screenPointer = *blockPattern; // byte 3
        screenPointer += SCREEN_W / 8;
        blockPattern++;
        *(unsigned char*)screenPointer = *blockPattern; // byte 4
        screenPointer += SCREEN_W / 8;
        blockPattern++;
        *(unsigned char*)screenPointer = *blockPattern; // byte 5
        screenPointer += SCREEN_W / 8;
        blockPattern++;
        *(unsigned char*)screenPointer = *blockPattern; // byte 6
        screenPointer += SCREEN_W / 8;
        blockPattern++;
        *(unsigned char*)screenPointer = *blockPattern; // byte 7
        screenPointer += SCREEN_W / 8;
        blockPattern++;
        *(unsigned char*)screenPointer = *blockPattern; // byte 8
    }
    else
    {
        *(unsigned char*)screenPointer = ~(*blockPattern); // byte 1
        screenPointer += SCREEN_W / 8;
        blockPattern++;
        *(unsigned char*)screenPointer = ~(*blockPattern); // byte 2
        screenPointer += SCREEN_W / 8;
        blockPattern++;
        *(unsigned char*)screenPointer = ~(*blockPattern); // byte 3
        screenPointer += SCREEN_W / 8;
        blockPattern++;
        *(unsigned char*)screenPointer = ~(*blockPattern); // byte 4
        screenPointer += SCREEN_W / 8;
        blockPattern++;
        *(unsigned char*)screenPointer = ~(*blockPattern); // byte 5
        screenPointer += SCREEN_W / 8;
        blockPattern++;
        *(unsigned char*)screenPointer = ~(*blockPattern); // byte 6
        screenPointer += SCREEN_W / 8;
        blockPattern++;
        *(unsigned char*)screenPointer = ~(*blockPattern); // byte 7
        screenPointer += SCREEN_W / 8;
        blockPattern++;
        *(unsigned char*)screenPointer = ~(*blockPattern); // byte 8
    }
}*/
