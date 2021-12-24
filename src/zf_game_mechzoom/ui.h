// module definitions for z-fighter game "mechzoom"
// by xrrawva 2021

#ifndef MECHZOOM_UI_H
#define MECHZOOM_UI_H

extern const unsigned char bpCursor[];

unsigned char keyOk(unsigned char release);
unsigned char keyBack(unsigned char release);
unsigned char keyUp(unsigned char release);
unsigned char keyDown(unsigned char release);
unsigned char keyLeft(unsigned char release);
unsigned char keyRight(unsigned char release);

void fadeToBlack();
void fadeToWhite();
void showTextPage(const char* text);

#endif // MECHZOOM_UI_H
