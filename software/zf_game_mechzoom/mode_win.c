// module implementation for z-fighter game "mechzoom"
// by xrrawva 2021

#include <stdlib.h>
#include <zf_gfx.h>
#include <zf_lcd.h>
#include <zf_sleep.h>
#include "mode_game.h"
#include "mode_win.h"
#include "sound.h"
#include "tilemap.h"
#include "ui.h"
#define TRUE 1
#define FALSE 0

const unsigned char spEndscreenBase[]={128,64,0x24,0x40,0x22,0x24,0x8A,0x48,0xA4,0x8A,0x48,0x08,0x4A,0x48,0xA4,0xCA,0x48,0xA4,0x34,0x40,0x22,0x22,0x4A,0x24,0xA2,0x4A,0x28,0x08,0x5A,0x7E,0xA2,0xEA,0x24,0xA2,0x24,0xC0,0xAE,0xBF,0x3B,0xF3,0xBF,0x3B,0xF8,0x08,0x6B,0xE3,0xBF,0xBB,0xF3,0xBF,0x24,0x41,0xA8,0x00,0x00,0x00,0x00,0x00,0x08,0x08,0x48,0x11,0x80,0x90,0x00,0x00,0x24,0x42,0xAF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xCF,0xCF,0xF8,0xFF,0x9F,0xFF,0xFF,0x24,0x44,0xA0,0x00,0x00,0x00,0x00,0x00,0x01,0xA0,0x48,0x04,0x60,0x90,0x00,0x00,0x24,0x48,0xA0,0x00,0x00,0x00,0x00,0x00,0x03,0x90,0x50,0x02,0x30,0x90,0x00,0x00,0x34,0x51,0xA0,0x00,0x00,0x00,0x00,0x00,0x02,0x08,0x60,0x01,0x1F,0xD0,0x00,0x00,0x24,0xE0,0xA0,0x00,0x00,0x00,0x00,0x00,0x03,0x87,0xC0,0x00,0xA7,0xF0,0x00,0x00,0x24,0x40,0xA0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x43,0xF0,0x00,0x00,0x24,0x00,0xA0,0x07,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xD9,0x0F,0xFF,0xFF,0x24,0x00,0xA0,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x5D,0x08,0x00,0x00,0x24,0x00,0xA0,0x10,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x4D,0x08,0x00,0x00,0x34,0x01,0xA0,0x23,0xFF,0xFF,0xFF,0xFC,0x0F,0xFF,0xFF,0xFF,0xC1,0xFF,0xFF,0x03,0xE4,0x00,0xA0,0x45,0xFF,0xFF,0xFF,0xFC,0x0B,0xFF,0xFF,0xFF,0xE0,0x87,0xFF,0x02,0x04,0x00,0xA0,0x8B,0xFF,0xFF,0xFF,0xF8,0x17,0xFF,0xFF,0xB8,0x30,0x84,0x7E,0x05,0x04,0x00,0xA0,0x97,0xFF,0xFF,0xFF,0xF8,0x17,0xFF,0xFF,0xBB,0xB8,0x87,0x7E,0x05,0x04,0x00,0xA0,0x97,0xFF,0xDF,0xFF,0xF0,0x2F,0xFF,0xFF,0x58,0x35,0x0C,0x7C,0x0B,0x04,0x00,0xA0,0x97,0xFF,0xFF,0xFF,0xF0,0x2F,0xEF,0xFF,0xBD,0xD3,0xFE,0xFC,0x0B,0x04,0x01,0xA0,0x97,0xFF,0xFF,0xFF,0xE0,0x5F,0xFF,0xFF,0xBA,0x10,0xE0,0xF8,0x17,0x04,0x00,0xA0,0x97,0xFF,0xFF,0xFF,0xE0,0x5F,0xFF,0xFF,0xFB,0xF0,0xF8,0xFC,0x17,0x04,0x00,0xA0,0x97,0xFF,0xFF,0xFF,0xC0,0xBF,0xFF,0xFF,0xF9,0x08,0x8F,0xC2,0x2F,0x04,0xC0,0xA0,0x97,0xFF,0xFF,0xFF,0xC0,0xBF,0xFF,0xFF,0xF9,0x24,0xA4,0xC1,0x2F,0x04,0xC0,0xA0,0x97,0xFF,0xFF,0xFF,0x81,0x7F,0xFF,0xFE,0x6C,0x92,0x92,0xC1,0x5F,0x05,0x20,0xA0,0x97,0xFF,0xFF,0xEF,0x81,0x7F,0xFF,0xFF,0x3C,0x81,0x01,0x82,0x5F,0x05,0x21,0xA0,0x97,0xFF,0xFF,0xFF,0x02,0xFF,0xFE,0xFD,0x08,0x80,0x01,0x82,0xBF,0x05,0xE0,0xA0,0x97,0xFF,0xFF,0xFF,0x02,0xFF,0xFF,0xFD,0x07,0x80,0x03,0x04,0xB7,0x05,0xC0,0xA0,0x97,0xFB,0xFF,0xFE,0x05,0xFF,0xFF,0xFE,0x03,0xFF,0xF3,0x05,0x7F,0xFC,0x00,0xA0,0x97,0xFF,0xFF,0xFE,0x05,0xFF,0xFF,0xFA,0x03,0x00,0x0B,0xFD,0x7F,0x08,0x00,0xA0,0x97,0xFF,0xFF,0xFC,0x0B,0xEF,0xFF,0xFA,0x06,0x00,0x04,0x12,0xFF,0x10,0x00,0xA0,0x97,0xFF,0xFF,0xFC,0x0B,0xFF,0xFF,0xFE,0x06,0x00,0x04,0xD2,0xFF,0x20,0x09,0xA0,0x97,0xFF,0xFF,0xF8,0x17,0xFF,0xFF,0xFD,0xCE,0x00,0x04,0x95,0xFF,0x40,0x10,0xA0,0x8B,0xFF,0xFF,0xF8,0x17,0xFF,0xFF,0xFC,0x3F,0xE0,0x04,0x25,0xFF,0x80,0x30,0xA0,0x44,0x00,0x00,0x10,0x20,0x00,0x00,0x04,0x13,0xFD,0x57,0xC8,0x00,0x00,0x70,0xA0,0x23,0xFF,0xFF,0xF0,0x3F,0xFF,0xFF,0xF8,0x3F,0x1F,0xFE,0x0F,0xFF,0x00,0xB0,0xA0,0x10,0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x21,0x00,0x02,0x00,0x00,0x01,0xB8,0xA0,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x1C,0x40,0xFB,0x7E,0x00,0x00,0x03,0xB1,0xA0,0x07,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF3,0xFF,0xC8,0x47,0xFF,0xFF,0x01,0xA0,0xA0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x3C,0x80,0xC7,0x8A,0x1E,0x00,0x01,0xC0,0xA0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x23,0x81,0xE0,0x14,0x01,0xFC,0x01,0x80,0xA0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x20,0x81,0x20,0x28,0x00,0x86,0x01,0x08,0xA0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x20,0x93,0xD0,0x28,0x01,0x03,0x02,0x18,0xA0,0x00,0x01,0x90,0x02,0x03,0x80,0x00,0x20,0x9A,0x28,0x28,0x01,0x31,0x00,0x29,0xA0,0x00,0x11,0xA0,0x01,0x67,0x80,0x00,0x40,0x96,0x14,0x38,0x03,0x31,0x00,0x68,0x2F,0x40,0x09,0x20,0x01,0x6B,0x80,0x00,0xC0,0x96,0x0B,0xF8,0x07,0x03,0x00,0xA8,0x29,0x40,0x07,0xC0,0x00,0xB3,0x00,0x00,0x41,0x9E,0x07,0x0F,0xFF,0x06,0x01,0x28,0x2F,0x40,0x03,0x80,0x00,0x70,0x00,0x00,0xC1,0x2A,0x03,0x00,0x03,0xC4,0x01,0x28,0x20,0x00,0x01,0x80,0x00,0x60,0x00,0x00,0x41,0x2A,0x01,0x00,0x02,0x3F,0x01,0x28,0x3F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xC3,0xF1,0x01,0xFF,0xFE,0x09,0x01,0x28,0x40,0x00,0x81,0x80,0x04,0x60,0x00,0x2C,0xC2,0x99,0x01,0x00,0x0A,0x0A,0x05,0x28,0x80,0x09,0x01,0x80,0x48,0xA0,0x02,0x48,0xC2,0x49,0x01,0x00,0x92,0x12,0x09,0x29,0x00,0x02,0x03,0x80,0x10,0xA0,0x00,0xD0,0xC6,0x39,0x01,0x80,0x24,0x14,0x05,0x2A,0x00,0x04,0x02,0x80,0x20,0xB0,0x01,0xE0,0xC4,0x0D,0x00,0x80,0x44,0x24,0x0D,0x2C,0x00,0x08,0x02,0x80,0x40,0x90,0x02,0xC0,0xFC,0x1D,0x00,0x80,0x84,0x28,0x0D,0x28,0x00,0x10,0x06,0xC0,0x80,0x98,0x04,0x81,0x8C,0x25,0x3C,0x81,0x08,0x28,0x09,0x30,0x00,0x20,0x02,0x01,0x01,0xB0,0x0D,0x01,0x03,0x47,0x24,0x82,0x08,0x50,0x01,0x25,0x02,0x40,0x00,0x12,0x00,0x00,0x9E,0x01,0x25,0xE3,0x24,0xA4,0xF8,0x50,0x01,0x43,0x00,0x80,0x00,0x04,0x00,0x00,0x2C,0x03,0xFF,0x23,0x24,0x88,0x92,0x60,0x01,0x83,0x01,0x00,0x00,0x08,0x00,0x00,0x48,0x02,0x44,0x21,0xBD,0x90,0x56,0xE0,0x01,0x06,0x02,0x00,0x00,0x10,0x00,0x00,0xD0,0x02,0x67,0x20,0xE7,0x20,0x30,0xF8,0x02,0x06,0x04,0x00,0x00,0x20,0x00,0x01,0xE0,0x02,0x65,0xA0,0x00,0x40,0x1F,0xE6,0x04,0x1E,0x08,0x00,0x00,0x40,0x00,0x02,0xC0,0x02,0xA8,0xE0,0x00,0x80,0x1B,0x11,0x08,0x00,0x90,0x00,0x04,0x80,0x00,0x24,0x80,0x01,0x98,0x60,0x09,0x00,0x08,0x88,0x10,0x00,0x20,0x00,0x01,0x00,0x00,0x0D,0x00,0x01,0x10,0x00,0x02,0x00,0x0C,0xC4};
const unsigned char spEndscreenAlien[]={26,8,112,127,241,174,7,216,114,131,224,40,135,240,2,0,124,0,0,246,0,0,31,160,0,3,223,0};
const unsigned char spEndscreenMech[]={28,26,34,0,0,1,48,0,0,1,128,0,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,129,64,0,4,4,0,0,112,64,0,0};
const unsigned char spEndscreenJunk[]={52,16,0,0,0,0,0,0,112,0,0,0,0,0,3,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,48,0,96,0,0,0,2,56,15,0,24,0,0,7,224,96,3,128,0,0,91,12,0,72,0,0,5,216,0,30,128,0,0,252,128,2,56,0,0,11,248};

void modeWin()
{
    // close door
    for(unsigned char i=0;i<5;i++)
    {
        drawScreenGate(4-i);
        lcd(screen);
        sleep(50);
    }

    sleep(950);

    // open door
    for(unsigned char i=1;i<6;i++)
    {
        color=0;
        cls();
        drawScreenGate(i);
        lcd(screen);
        sleep(100);
    }

    showTextPage(//"1234567812345678\n"
                   "Congratulations,\n"
                   "after this\n"
                   "dangerous\n"
                   "journey you have\n"
                   "reached your\n"
                   "destination.");

    char str[]=//"1234567812345678\n"
                 "On the way you\n"
                 "have salvaged ?   \n"
                 "abandoned mechs,\n"
                 "destroyed ?   \n"
                 "space junk and\n"
                 "killed ?   \n"
                 "innocent aliens.";
    utoa(scoreMech,str+29,10);
    if     (scoreMech>99)str[32]=' ';
    else if(scoreMech> 9)str[31]=' ';
    else                 str[30]=' ';
    utoa(scoreJunk,str+61,10);
    if     (scoreJunk>99)str[64]=' ';
    else if(scoreJunk> 9)str[63]=' ';
    else                 str[62]=' ';
    utoa(scoreAlien,str+88,10);
    if     (scoreAlien>99)str[91]=' ';
    else if(scoreAlien> 9)str[90]=' ';
    else                  str[89]=' ';
    showTextPage((const char*)str);

    signed int score=scoreMech*16 + scoreJunk - scoreAlien*32;
    if(score<0)score=0;
    signed int scoreMax=scoreMaxMech*16 + scoreMaxJunk;
    if(scoreMax<0)scoreMax=0;
    char str2[]=//"1234567812345678\n"
                  "Max. Score:\n"
                  "?      \n"
                  " \n"
                  "Your Score:\n"
                  "?      ";
    utoa(scoreMax,str2+12,10);
    if     (scoreMax>9999)str2[17]=' ';
    else if(scoreMax> 999)str2[16]=' ';
    else if(scoreMax>  99)str2[15]=' ';
    else if(scoreMax>   9)str2[14]=' ';
    else                  str2[13]=' ';
    utoa(score,str2+34,10);
    if     (score>9999)str2[39]=' ';
    else if(score> 999)str2[38]=' ';
    else if(score>  99)str2[37]=' ';
    else if(score>   9)str2[36]=' ';
    else               str2[35]=' ';
    showTextPage(str2);
    fadeToBlack();

    color=1;
    sprite(spEndscreenBase,0,0);
    if(scoreMech<scoreMaxMech>>1)spriteTransparent(spEndscreenMech,96,28);
    color=0;
    if(scoreAlien<scoreMaxAlien>>1)spriteTransparent(spEndscreenAlien,32,14);
    if(scoreJunk<scoreMaxJunk>>1)spriteTransparent(spEndscreenJunk,31,16);
    lcd(screen);
    while(!keyOk(TRUE));
    soundOk();

    fadeToWhite();
    color=1;
    cls();
    lcd(screen);
    sleep(1000);
}

void drawScreenGate(unsigned char open)
{
    const unsigned char tilesetDoor[]={0,0,0,0,0,0,0,0,                 //  0 transparent
                                       0,0,0,0,0,0,0,0,                 //  1 blank
                                       0,0,0,0,255,255,255,0,           //  2 edge down
                                       14,29,59,119,111,95,63,127,      //  3 edge down 45
                                       0,0,0,0,0,0,2,6,                 //  4 edge down 45 extended
                                       255,254,252,248,240,224,192,128, //  5 edge up 45
                                       85,170,85,170,85,170,85,170,     //  6 shaded
                                       85,170,84,168,80,160,64,128,     //  7 shaded 45 top left
                                       0,0,0,0,0,0,255,255,             //  8 edge up
                                       0,0,0,0,0,0,1,3,                 //  9 shaded 45 bottom right extended
                                       7,14,29,58,117,234,213,170};     // 10 shaded 45 bottom right
    unsigned char tilemapDoorTop[16*8]={ 7, 9,10, 6, 6, 6, 6, 6, 1, 6, 6, 6, 6, 6, 1, 6,
                                         9,10, 6, 6, 6, 6, 6, 6, 1, 6, 6, 6, 6, 6, 1, 6,
                                        10, 6, 6, 6, 6, 6, 6, 6, 1, 6, 6, 6, 6, 6, 1, 6,
                                         6, 6, 6, 6, 6, 6, 6, 7, 4, 2, 2, 2, 2, 2, 2, 2,
                                         2, 2, 2, 2, 2, 2, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0,
                                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                         0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    unsigned char tilemapDoorBottom[16*8]={ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 5, 9, 8, 8, 8, 8, 8, 8,
                                            8, 8, 1, 8, 8, 8, 8, 8, 1,10, 6, 6, 6, 6, 6, 6,
                                            6, 6, 1, 6, 6, 6, 6, 6, 1, 6, 6, 6, 6, 6, 6, 7,
                                            6, 6, 1, 6, 6, 6, 6, 6, 1, 6, 6, 6, 6, 6, 7, 9,
                                            6, 6, 1, 6, 6, 6, 6, 6, 1, 6, 6, 6, 6, 7, 9,10};
    color=1;
    tileset=tilesetDoor;
    drawTilemapOverlay(tilemapDoorTop   ,-open);
    drawTilemapOverlay(tilemapDoorBottom, open);
    if(open==0)block(tilesetDoor+8,8,3);
}
