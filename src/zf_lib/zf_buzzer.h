// WT-1205 50mA electromagnetic buzzer definitions for Z-Fighter
// by Tangent and xrrawva 2021

#ifndef ZF_BUZZER_H
#define ZF_BUZZER_H

// Note definitions (pulseWidth, waveCycles):
// As defined here, waveCycles values will produce a tone for ~125ms (1/8 second).
// For sustained notes, add a multiplier to the end of a note.
// For rests, z80_delay_ms() functions from z80.h can be used.
// Usage:       buzzer(NOTE_C4)     // Produce a middle C tone for ~125ms
//              buzzer(NOTE_C4*4)   // Produce a middle C tone for ~500ms
#define NOTE_C3     1171, 16
#define NOTE_CS3    1105, 17
#define NOTE_D3     1042, 18
#define NOTE_DS3    984, 19
#define NOTE_E3     928, 20
#define NOTE_F3     876, 21
#define NOTE_FS3    826, 23
#define NOTE_G3     780, 24
#define NOTE_GS3    736, 25
#define NOTE_A3     694, 27
#define NOTE_AS3    655, 29
#define NOTE_B3     618, 30
#define NOTE_C4     583, 32
#define NOTE_CS4    550, 34
#define NOTE_D4     519, 36
#define NOTE_DS4    490, 38
#define NOTE_E4     462, 41
#define NOTE_F4     436, 43
#define NOTE_FS4    411, 46
#define NOTE_G4     388, 48
#define NOTE_GS4    366, 51
#define NOTE_A4     345, 54
#define NOTE_AS4    326, 57
#define NOTE_B4     307, 61
#define NOTE_C5     289, 65
#define NOTE_CS5    273, 69
#define NOTE_D5     257, 73
#define NOTE_DS5    243, 77
#define NOTE_E5     229, 82
#define NOTE_F5     216, 87
#define NOTE_FS5    204, 92
#define NOTE_G5     192, 98
#define NOTE_GS5    181, 104
#define NOTE_A5     171, 110
#define NOTE_AS5    161, 116
#define NOTE_B5     152, 123
#define NOTE_C6     143, 131
#define NOTE_CS6    135, 139
#define NOTE_D6     127, 148
#define NOTE_DS6    120, 156
#define NOTE_E6     113, 166
#define NOTE_F6     106, 177
#define NOTE_FS6    100, 187
#define NOTE_G6     94, 199
#define NOTE_GS6    89, 211
#define NOTE_A6     84, 223
#define NOTE_AS6    79, 237
#define NOTE_B6     74, 253
#define NOTE_C7     70, 268

// Produce a 50% duty cycle square wave with the buzzer:
// pulseWidth: Duration of buzzer 'on' and 'off' states
// waveCycles: Amount of square waves to generate
void buzzer(int pulseWidth, int waveCycles);

#endif
