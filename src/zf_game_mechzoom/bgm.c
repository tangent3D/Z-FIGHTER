// module implementation for z-fighter game "mechzoom"
// by xrrawva 2021

#include <zf_buzzer.h>
#include "bgm.h"
#include "rnd.h"
#include "ui.h"
#define FALSE 0
#define TRUE 1

#define SUBSOUND_N 4      // setting
#define SUBSOUND_LENGTH 3 // setting

#define PATTERN_N 4          // setting
#define PATTERN_SONG_END 255 // enum

#define STYLE_PAUSE 0 // enum
#define STYLE_SHORT 1 // enum
#define STYLE_LONG  2 // enum
#define STYLE_FADE  3 // enum
#define STYLE_UP    4 // enum
#define STYLE_DOWN  5 // enum
#define STYLE_RND   6 // enum

#define NOTE_XX 0,0 // enum

unsigned char buzzerParamsBad(unsigned int noteParam0, unsigned int noteParam1)
{
    // hardware buzzer wt-1205 "rated frequency hz 2400"
    // c6:  3520   hz =  143 noteParam0
    // (ignored)

    // "the generally accepted standard hearing range for humans is 20 to 20 000 hz"
    // c0:    27.5 hz = 9328 noteParam0
    // c9: 14080   hz =   18 noteParam0
    if(noteParam0<  18)return TRUE;
    if(noteParam0>9328)return TRUE;

    if(noteParam1<    1)return TRUE;
    if(noteParam1>32000)return TRUE;

    return FALSE;
}

void bgmPlaySubsound(unsigned char style, unsigned char step, unsigned int noteParam0, unsigned int noteParam1)
{
    unsigned int fillerPause=0;
    if(style==STYLE_PAUSE)
    {
        noteParam1=0;
        fillerPause=250>>SUBSOUND_LENGTH;
    }
    else if(style==STYLE_SHORT)
    {
        if(step==0)
        {
            noteParam1>>=SUBSOUND_LENGTH;
        }
        else
        {
            noteParam1=0;
            fillerPause=250>>SUBSOUND_LENGTH;
        }
    }
    else if(style==STYLE_LONG)
    {
        noteParam1>>=SUBSOUND_LENGTH;
    }
    else if(style==STYLE_FADE)
    {
        noteParam1>>=SUBSOUND_LENGTH+step;
        fillerPause=((unsigned char)250-((unsigned char)250>>step))>>SUBSOUND_LENGTH;
        if(buzzerParamsBad(noteParam0,noteParam1))
        {
            noteParam1=0;
            fillerPause=250>>SUBSOUND_LENGTH;
        }
    }
    else if(style==STYLE_UP)
    {
        noteParam0>>=step;
        noteParam1<<=step;
        if(buzzerParamsBad(noteParam0,noteParam1))
        {
            noteParam1=0;
            fillerPause=250>>SUBSOUND_LENGTH;
        }
    }
    else if(style==STYLE_DOWN)
    {
        noteParam0<<=step;
        noteParam1>>=step;
        if(buzzerParamsBad(noteParam0,noteParam1))
        {
            noteParam1=0;
            fillerPause=250>>SUBSOUND_LENGTH;
        }
    }
    else if(style==STYLE_RND)
    {
        // param0 rnd
        unsigned char noteN=49;
        int note[]={NOTE_C3,NOTE_CS3,NOTE_D3,NOTE_DS3,NOTE_E3,NOTE_F3,NOTE_FS3,NOTE_G3,NOTE_GS3,NOTE_A3,NOTE_AS3,NOTE_B3,NOTE_C4,NOTE_CS4,NOTE_D4,NOTE_DS4,NOTE_E4,NOTE_F4,NOTE_FS4,NOTE_G4,NOTE_GS4,NOTE_A4,NOTE_AS4,NOTE_B4,NOTE_C5,NOTE_CS5,NOTE_D5,NOTE_DS5,NOTE_E5,NOTE_F5,NOTE_FS5,NOTE_G5,NOTE_GS5,NOTE_A5,NOTE_AS5,NOTE_B5,NOTE_C6,NOTE_CS6,NOTE_D6,NOTE_DS6,NOTE_E6,NOTE_F6,NOTE_FS6,NOTE_G6,NOTE_GS6,NOTE_A6,NOTE_AS6,NOTE_B6,NOTE_C7};
        unsigned char i=rnd(noteN);
        noteParam0=note[(i<<1)  ];
        noteParam1=note[(i<<1)+1];

        // param1 fade
        noteParam1>>=SUBSOUND_LENGTH+step;
        fillerPause=((unsigned char)250-((unsigned char)250>>step))>>SUBSOUND_LENGTH;
        if(buzzerParamsBad(noteParam0,noteParam1))
        {
            noteParam1=0;
            fillerPause=250>>SUBSOUND_LENGTH;
        }
    }

    if(noteParam0>0&&noteParam1>0)buzzer(noteParam0,noteParam1);
    if(fillerPause>0)sleep(fillerPause);
}

void bgmPlayUntilKeyOk()
{
    const unsigned char patternStyle[]={0,0,0,0,  // 0
                                        1,1,1,0,  // 1
                                        2,2,2,0,  // 2
                                        3,3,3,0,  // 3
                                        4,4,4,0,  // 4
                                        5,5,5,0,  // 5
                                        6,6,6,0}; // 6
    const int patternNote[]={NOTE_XX,NOTE_XX,NOTE_XX,NOTE_XX,  // 0
                             NOTE_C5,NOTE_D5,NOTE_E5,NOTE_F5,  // 1
                             NOTE_C5,NOTE_D5,NOTE_E5,NOTE_F5,  // 2
                             NOTE_C5,NOTE_D5,NOTE_E5,NOTE_F5,  // 3
                             NOTE_C5,NOTE_D5,NOTE_E5,NOTE_F5,  // 4
                             NOTE_C5,NOTE_D5,NOTE_E5,NOTE_F5,  // 5
                             NOTE_C5,NOTE_D5,NOTE_E5,NOTE_F5}; // 6
    const unsigned char songCh0Pattern[]={0,1,2,3,4,5,6,0,1,2,3,4,5,6,PATTERN_SONG_END};
    const unsigned char songCh1Pattern[]={0,0,0,0,0,0,0,1,1,1,1,1,1,1};
    unsigned char       subsoundI=0;
    unsigned char       patternI=0;
    unsigned char       songI=0;
    while(!keyOk(TRUE))
    {
        if(mute)continue;

        unsigned char pattern=songCh0Pattern[songI];
        if(pattern==PATTERN_SONG_END)
        {
            songI=0;
            pattern=songCh0Pattern[songI];
        }
        unsigned char style=patternStyle[pattern];
        pattern<<=1;
        unsigned int noteParam0=patternNote[pattern];
        unsigned int noteParam1=patternNote[pattern+1];

        bgmPlaySubsound(style,subsoundI,noteParam0,noteParam1);

        pattern=songCh1Pattern[songI];
        style=patternStyle[pattern];
        pattern<<=1;
        noteParam0=patternNote[pattern];
        noteParam1=patternNote[pattern+1];

        bgmPlaySubsound(style,subsoundI,noteParam0,noteParam1);

        subsoundI++;
        if(subsoundI==SUBSOUND_N)
        {
            subsoundI=0;
            patternI++;
            if(patternI==PATTERN_N)
            {
                patternI=0;
                songI++;
            }
        }
    }
}
