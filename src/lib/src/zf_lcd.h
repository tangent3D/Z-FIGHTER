// ST7920 LCD controller definitions for Z-Fighter
// by Tangent 2021

#ifndef ZF_LCD_H
#define ZF_LCD_H

// Fill LCD GDRAM with a 128x64px bitmap (ex. 'screen' from zf_gfx)
// Contains primary LCD control routines used by other functions.
// Always turns the LCD backlight on.
void lcdBitmap(unsigned char *bitmap);

// Turn LCD backlight on (1) or off (0).
void lcdBacklight(unsigned char state);

// Write LCD instruction (byte, 0 = basic instruction, 1 = extended instruction)
void lcdInst(unsigned char i, unsigned char extended);

// Write LCD data (byte)
void lcdData(unsigned char d);

#endif