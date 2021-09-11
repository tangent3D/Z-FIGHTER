// graphics library demo for z-fighter
// by xrrawva 2021

#include <zf_gfx.h>
#include <zf_keypad.h>
#include <zf_lcd.h>
#include <zf_ppi.h>

// sprites
const unsigned char spPlantB[] = {31, 31, 0, 14, 0, 0, 0, 35, 192, 0, 1, 140, 96, 0, 28, 160, 56, 0, 33, 192, 8, 0, 134, 224, 16, 1, 48, 188, 16, 4, 65, 116, 32, 8, 131, 164, 32, 33, 6, 68, 64, 66, 24, 132, 129, 28, 99, 201, 4, 104, 190, 138, 17, 145, 49, 20, 38, 36, 66, 24, 72, 72, 104, 16, 160, 145, 240, 33, 129, 98, 112, 66, 2, 132, 32, 4, 5, 4, 128, 0, 12, 63, 0, 0, 24, 79, 0, 0, 16, 66, 0, 0, 0, 136, 0, 0, 15, 224, 0, 80, 19, 128, 0, 64, 16, 144, 216, 143, 34, 17, 96, 7, 199, 0, 129, 255, 255, 241, 31, 255, 248, 2, 0};
const unsigned char spPlantW[] = {31, 31, 0, 0, 0, 0, 0, 28, 0, 0, 0, 115, 128, 0, 3, 95, 192, 0, 30, 63, 240, 0, 121, 31, 224, 0, 207, 67, 224, 3, 190, 131, 192, 7, 124, 67, 192, 30, 249, 131, 128, 61, 231, 3, 0, 227, 156, 6, 3, 135, 1, 4, 14, 14, 14, 8, 24, 24, 60, 0, 48, 48, 16, 0, 64, 96, 0, 0, 0, 129, 128, 0, 1, 3, 192, 0, 2, 3, 0, 0, 0, 0, 0, 0, 0, 48, 0, 0, 0, 60, 0, 0, 0, 112, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 15, 0, 0, 0, 28, 0, 0, 0, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
const unsigned char spDinoB[] = {31, 31, 0, 0, 7, 128, 0, 0, 16, 192, 0, 0, 96, 64, 0, 0, 128, 64, 0, 2, 18, 64, 0, 12, 36, 192, 1, 208, 0, 128, 1, 224, 1, 0, 28, 12, 126, 0, 16, 14, 16, 1, 192, 35, 192, 1, 2, 128, 0, 2, 3, 0, 0, 24, 70, 0, 0, 16, 68, 96, 0, 195, 207, 32, 1, 3, 192, 160, 12, 28, 205, 64, 16, 17, 229, 128, 192, 24, 225, 1, 4, 8, 224, 4, 60, 9, 64, 8, 156, 12, 128, 34, 30, 8, 0, 72, 31, 144, 1, 32, 26, 64, 2, 64, 121, 0, 4, 96, 231, 192, 4, 48, 66, 64, 7, 24, 243, 192, 1, 192, 28, 0, 0};
const unsigned char spDinoW[] = {31, 31, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 31, 128, 0, 0, 127, 128, 0, 1, 237, 128, 0, 3, 219, 0, 0, 15, 255, 0, 0, 31, 254, 0, 3, 243, 128, 0, 15, 241, 224, 0, 63, 192, 0, 0, 253, 0, 0, 1, 252, 0, 0, 7, 184, 0, 0, 15, 184, 0, 0, 60, 48, 192, 0, 252, 63, 64, 3, 224, 50, 128, 15, 224, 0, 0, 63, 224, 0, 0, 251, 240, 0, 3, 195, 240, 0, 7, 3, 240, 0, 28, 1, 240, 0, 48, 0, 96, 0, 192, 1, 128, 1, 128, 6, 0, 3, 128, 24, 0, 3, 192, 61, 128, 0, 224, 12, 0, 0, 0, 0, 0, 0};

void main()
{
    // init z-fighter
    ppiInit();

    // init stars
    unsigned char starX = 0;

    // init objects
    #define OBJECT_N 5
    unsigned char objectXSubpixel[OBJECT_N];
    unsigned char objectX[OBJECT_N];
    unsigned char objectY[OBJECT_N];
    unsigned char objectSpeed[OBJECT_N];
    {
        unsigned char y = 4;
        for(unsigned char i = 0; i < OBJECT_N; i++)
        {
            objectXSubpixel[i] = 0;
            objectX[i] = (((y << 4) + y) ^ 93) & (255 - 128); // random
            objectY[i] = 4 + y; // in drawing order
            objectSpeed[i] = 64 + y * 2; // to match perspective
            y += 32 / OBJECT_N;
        }
    }

    // main loop
    unsigned char frame = 255;
    while(!key(KEY_ANY))
    {
        // simulate
        // --------
        frame++;

        // move stars
        if(frame & (1)) starX--;

        // move objects
        {
            unsigned char* thisObjectSpeed = objectSpeed;
            unsigned char* thisObjectXSubpixel = objectXSubpixel;
            unsigned char* thisObjectX = objectX;
            unsigned char* nObjectX = objectX + OBJECT_N;
            while(thisObjectX < nObjectX)
            {
                // load object
                unsigned char x = *thisObjectX;
                unsigned char speed = *thisObjectSpeed;
                unsigned char xSubpixel = *thisObjectXSubpixel;

                // change object
                xSubpixel += speed;
                if(xSubpixel > 63)
                {
                    xSubpixel -= 64;
                    x--;
                }
                if(xSubpixel > 63)
                {
                    xSubpixel -= 64;
                    x--;
                }
                if(xSubpixel > 63)
                {
                    xSubpixel -= 64;
                    x--;
                }
                if(x > 127 && x < 255 - 32) x -= 127 - 32; // loop without popping-in/-out

                // save object
                *thisObjectX = x;
                thisObjectX++;
                *thisObjectXSubpixel = xSubpixel;
                thisObjectXSubpixel++;
                thisObjectSpeed++;
            }
        }

        // render
        // ------
        color = 1;
        cls();

        // stars
        {
            unsigned char x = starX;
            unsigned char y = 0;
            while(y < 32)
            {
                x += (133 ^ y) - 201;
                if(x > 127) x -= 128;
                point(x, y);
                y += 8; // change this to change number of stars
            }
        }

        // grid lines horizontal
        {
            #define COMPLEXITY_MINUS_ONE 1-1
            unsigned char y = 32;
            unsigned char yStep = 1;
            while(y < 64)
            {
                lineFrom(0, y);
                lineTo(127, y);
                y += yStep;
                yStep += yStep;
                yStep >>= COMPLEXITY_MINUS_ONE;
                yStep += COMPLEXITY_MINUS_ONE;
            }
        }

        // grid lines vertical
        {
            #define COMPLEXITY 2
            unsigned char x0Step = 64 >> COMPLEXITY;
            unsigned char x0 = (255 - frame) % x0Step;
            unsigned char x1 = (x0 << 1) - 64;
            while(x0 < 128)
            {
                lineFrom(x0, 32);
                lineTo(x1, 63);
                x0 += x0Step;
                x1 += 128 >> COMPLEXITY; // x1Step
            }
        }

        // skyline
        {
            unsigned char x = 0;
            #define BUILDING_N 8
            for(unsigned char i = 0; i < BUILDING_N; i++)
            {
                x += 155 ^ i;
                unsigned char y = x & 15;
                rect(x - frame, 32 - y, 8, y);
            }
        }

        // objects
        {
            unsigned char* thisObjectX = objectX;
            unsigned char* thisObjectY = objectY;
            unsigned char* nObjectX = objectX + OBJECT_N;
            while(thisObjectX < nObjectX)
            {
                unsigned char x = *thisObjectX;
                unsigned char y = *thisObjectY;
                if(y & 9)
                {
                    color = 1;
                    spriteTransparent(spPlantB, x, y);
                    color = 0;
                    spriteTransparent(spPlantW, x, y);
                }
                else
                {
                    color = 1;
                    spriteTransparent(spDinoB, x, y);
                    color = 0;
                    spriteTransparent(spDinoW, x, y);
                }
                thisObjectX++;
                thisObjectY++;
            }
        }

        lcd(screen);
    }

    // exit
    color = 1;
    cls();
    lcd(screen);
}
