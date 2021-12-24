// module implementation for z-fighter game "mechzoom"
// by xrrawva 2021

#include <zf_buzzer.h>
#include <zf_sleep.h>
#include "sound.h"
#define TRUE 1
#define FALSE 0

#define SOUND_LENGTH_DIV 3
unsigned char mute=FALSE;

void buzzerOrMute(int pulseWidth, int waveCycles)
{
    if(!mute)buzzer(pulseWidth,waveCycles);
}

void soundSelect()
{
    buzzerOrMute(NOTE_G4/SOUND_LENGTH_DIV);
}

void soundOk()
{
    buzzerOrMute(NOTE_A4/SOUND_LENGTH_DIV);
    sleep(125/SOUND_LENGTH_DIV);
    buzzerOrMute(NOTE_A4/SOUND_LENGTH_DIV);
}

void soundBack()
{
    buzzerOrMute(NOTE_F4/SOUND_LENGTH_DIV);
}

void soundEnterMech()
{
    buzzerOrMute(NOTE_F3/SOUND_LENGTH_DIV*2);
    buzzerOrMute(NOTE_FS3/SOUND_LENGTH_DIV);
    buzzerOrMute(NOTE_G3/SOUND_LENGTH_DIV);
}

void soundLoseMech()
{
    buzzerOrMute(NOTE_G3/SOUND_LENGTH_DIV);
    buzzerOrMute(NOTE_FS3/SOUND_LENGTH_DIV);
    buzzerOrMute(NOTE_F3/SOUND_LENGTH_DIV*2);
}

void soundPlayerDeath()
{
    buzzerOrMute(NOTE_C3/SOUND_LENGTH_DIV);
}

void soundAlienDeath()
{
    buzzerOrMute(NOTE_C3/SOUND_LENGTH_DIV);
    sleep(125/SOUND_LENGTH_DIV);
    buzzerOrMute(NOTE_C3/SOUND_LENGTH_DIV);
}
