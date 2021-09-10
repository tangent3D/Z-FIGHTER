// ST7920 LCD controller definitions for Z-Fighter
// by Tangent 2021

#ifndef ZF_LCD_H
#define ZF_LCD_H

// Fill LCD GDRAM with a 128x64px bitmap (ex. 'screen' from zf_gfx)
// Contains primary LCD control routines used by other functions.
// Always turns the LCD backlight on.
void lcd(unsigned char *bitmap);

// Set LCD backlight on (1) or off (0).
// State of backlight will update upon next execution of lcd().
extern unsigned char backlight;

#endif