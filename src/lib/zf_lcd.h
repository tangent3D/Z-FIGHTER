// ST7920 LCD controller functions for Z-Fighter
// by Tangent 2021

#ifndef ZF_LCD_H
#define ZF_LCD_H

// Fill LCD GDRAM with a 128x64px bitmap (ex. 'screen' from zf_gfx)
// Contains primary LCD control routines used by other functions
void lcd_bitmap(unsigned char *bitmap);

// Write LCD instruction (byte, 0 = basic instruction, 1 = extended instruction)
void lcd_instruction(unsigned char i, unsigned char extended);

// Write LCD data (byte)
void lcd_data(unsigned char d);

#endif