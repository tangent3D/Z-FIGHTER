// module implementation for z-fighter application "menu"
// by xrrawva 2023

#include <zf_buzzer.h>
#include <zf_sleep.h>
#include "sound.h"

#define SOUND_LENGTH_DIV 4

void soundHello()
{
    buzzer(NOTE_G4/2);
    buzzer(NOTE_A4/1);
    buzzer(NOTE_B4/2);
    sleep(200);
    buzzer(NOTE_B4/2);
}

void soundError()
{
    buzzer(NOTE_E4*2);
    sleep(200);
    buzzer(NOTE_E4*2);
}

void soundSelect()
{
    buzzer(NOTE_A4/6);
}

void soundOk()
{
    buzzer(NOTE_B4/4);
    sleep(50);
    buzzer(NOTE_B4/4);
}
