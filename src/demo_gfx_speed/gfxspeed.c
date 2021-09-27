// graphics library benchmark program for z-fighter
// by xrrawva 2021

#include <zf_buzzer.h>
#include <zf_gfx.h>
#include <zf_lcd.h>

void main()
{
    // init z-fighter
    backlight = 1;

    // black screen
    color = 0;
    cls();
    lcd(screen);

    // init test
    const unsigned char spTestB[] = {30, 30, 192, 0, 0, 3, 128, 0, 0, 15, 0, 0, 0, 62, 0, 0, 0, 220, 0, 0, 3, 56, 0, 0, 12, 112, 0, 0, 48, 224, 0, 0, 193, 192, 0, 3, 3, 128, 0, 12, 7, 0, 0, 48, 14, 0, 0, 192, 28, 0, 3, 0, 56, 0, 12, 0, 112, 0, 48, 0, 224, 0, 192, 1, 192, 3, 0, 3, 128, 12, 0, 7, 0, 48, 0, 14, 0, 192, 0, 28, 3, 0, 0, 56, 12, 0, 0, 112, 48, 0, 0, 224, 192, 0, 1, 195, 0, 0, 3, 140, 0, 0, 7, 48, 0, 0, 14, 255, 255, 255, 255, 255, 255, 255, 240};
    const unsigned char spTestW[] = {30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 0, 0, 0, 192, 0, 0, 3, 128, 0, 0, 15, 0, 0, 0, 62, 0, 0, 0, 252, 0, 0, 3, 248, 0, 0, 15, 240, 0, 0, 63, 224, 0, 0, 255, 192, 0, 3, 255, 128, 0, 15, 255, 0, 0, 63, 254, 0, 0, 255, 252, 0, 3, 255, 248, 0, 15, 255, 240, 0, 63, 255, 224, 0, 255, 255, 192, 3, 255, 255, 128, 15, 255, 255, 0, 63, 255, 254, 0, 255, 255, 252, 3, 255, 255, 248, 15, 255, 255, 240, 0, 0, 0, 0, 0, 0, 0, 0};
    const unsigned char bpBox[] = {255, 129, 129, 129, 129, 129, 129, 255};

    unsigned char repeats;
    unsigned char xyStep;
    const unsigned char x1 = 150;
    const unsigned char y1 = 100;

    // test: cls
    repeats = 250;
    buzzer(NOTE_C6);
    for(unsigned char i = 0; i < repeats; i++)
    {
        color = 1;
        cls();
        color = 0;
        cls();
    }
    buzzer(NOTE_D6);

    // test: point
    repeats = 2;
    xyStep = 1;
    buzzer(NOTE_C6);
    for(unsigned char i = 0; i < repeats; i++)
        for(unsigned char x = 0; x < x1; x += xyStep)
            for(unsigned char y = 0; y < y1; y += xyStep)
            {
                color = 1;
                point(x, y);
                color = 0;
                point(x, y);
            }
    buzzer(NOTE_D6);

    // test: line
    repeats = 1;
    xyStep = 6;
    buzzer(NOTE_C6);
    for(unsigned char i = 0; i < repeats; i++)
        for(unsigned char x = 0; x < x1; x += xyStep)
            for(unsigned char y = 0; y < y1; y += xyStep)
            {
                color = 1;
                lineFrom(64, 32);
                lineTo(x, y);
                color = 0;
                lineFrom(64, 32);
                lineTo(x, y);
            }
    buzzer(NOTE_D6);

    // test: rect
    repeats = 3;
    xyStep = 5;
    buzzer(NOTE_C6);
    for(unsigned char i = 0; i < repeats; i++)
        for(unsigned char x = 0; x < x1; x += xyStep)
            for(unsigned char y = 0; y < y1; y += xyStep)
            {
                color = 1;
                rect(x, y, 30, 30);
                color = 0;
                rect(x, y, 30, 30);
            }
    buzzer(NOTE_D6);

    // test: sprite
    repeats = 1;
    xyStep = 15;
    buzzer(NOTE_C6);
    for(unsigned char i = 0; i < repeats; i++)
        for(unsigned char x = 0; x < x1; x += xyStep)
            for(unsigned char y = 0; y < y1; y += xyStep)
            {
                color = 1;
                sprite(spTestB, x, y);
                color = 0;
                sprite(spTestW, x, y);
            }
    buzzer(NOTE_D6);

    // test: spriteTransparent
    repeats = 1;
    xyStep = 13;
    buzzer(NOTE_C6);
    for(unsigned char i = 0; i < repeats; i++)
        for(unsigned char x = 0; x < x1; x += xyStep)
            for(unsigned char y = 0; y < y1; y += xyStep)
            {
                color = 1;
                spriteTransparent(spTestB, x, y);
                color = 0;
                spriteTransparent(spTestW, x, y);
            }
    buzzer(NOTE_D6);

    // test: putBlock
    repeats = 50;
    buzzer(NOTE_C6);
    for(unsigned char i = 0; i < repeats; i++)
        for(unsigned char x = 0; x < 20; x++)
            for(unsigned char y = 0; y < 10; y++)
            {
                color = 1;
                block(bpBox, x, y);
                color = 0;
                block(bpBox, x, y);
            }
    buzzer(NOTE_D6);

    // white screen
    color = 1;
    cls();
    lcd(screen);
}
