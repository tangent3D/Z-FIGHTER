// WT-1205 50mA electromagnetic buzzer definitions for Z-Fighter
// by Tangent 2021

#ifndef ZF_BUZZER_H
#define ZF_BUZZER_H

#include "zf_ppi.h"

#define NOTE_C3     1171, 70/2
#define NOTE_CS3    1105, 74/2
#define NOTE_D3     1042, 79/2
#define NOTE_DS3    984, 84/2
#define NOTE_E3     928, 89/2
#define NOTE_F3     876, 94/2
#define NOTE_FS3    826, 100/2
#define NOTE_G3     780, 106/2
#define NOTE_GS3    736, 113/2
#define NOTE_A3     694, 120/2
#define NOTE_AS3    655, 127/2
#define NOTE_B3     618, 135/2
#define NOTE_C4     583, 143/2
#define NOTE_CS4    550, 152/2
#define NOTE_D4     519, 161/2
#define NOTE_DS4    490, 171/2
#define NOTE_E4     462, 181/2
#define NOTE_F4     436, 192/2
#define NOTE_FS4    411, 204/2
#define NOTE_G4     388, 216/2
#define NOTE_GS4    366, 229/2
#define NOTE_A4     345, 243/2
#define NOTE_AS4    326, 257/2
#define NOTE_B4     307, 273/2
#define NOTE_C5     289, 289/2
#define NOTE_CS5    273, 307/2
#define NOTE_D5     257, 326/2
#define NOTE_DS5    243, 345/2
#define NOTE_E5     229, 366/2
#define NOTE_F5     216, 388/2
#define NOTE_FS5    204, 411/2
#define NOTE_G5     192, 436/2
#define NOTE_GS5    181, 462/2
#define NOTE_A5     171, 490/2
#define NOTE_AS5    161, 519/2
#define NOTE_B5     152, 550/2
#define NOTE_C6     143, 583/2
#define NOTE_CS6    135, 618/2
#define NOTE_D6     127, 655/2
#define NOTE_DS6    120, 694/2
#define NOTE_E6     113, 736/2
#define NOTE_F6     106, 780/2
#define NOTE_FS6    100, 826/2
#define NOTE_G6     94, 876/2
#define NOTE_GS6    89, 928/2
#define NOTE_A6     84, 984/2
#define NOTE_AS6    79, 1042/2
#define NOTE_B6     74, 1105/2
#define NOTE_C7     70, 1171/2

void buzzer(int frequency, int duration);

#endif