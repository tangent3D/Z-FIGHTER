// 8255A Programmable Peripheral Interface definitions for Z-Fighter peripherals
// (Keys, LCD, buzzer)
// by Tangent 2021

#ifndef ZF_PPI_H
#define ZF_PPI_H

#define PORTA   40h         // Connected to key switches
#define PORTB   41h         // Connected to ST7920 LCD data bus
#define PORTC   42h         // Connected to LCD control signals, backlight and buzzer
#define CTRL    43h         // 8255 control port

// BSR (Bit Set/Reset) control words:
#define LCD_EN_LO   0x0     // LCD 'E' (Enable) high       
#define LCD_EN_HI   0x1     // LCD 'E' low
#define LCD_WR      0x2     // LCD R/#W low (Write)
#define LCD_RD      0x3     // LCD R/#W high (Read)
#define LCD_INST    0x4     // LCD RS low (Instruction)
#define LCD_DATA    0x5     // LCD RS high (Data)
#define LCD_BL_OFF  0x6     // Backlight off
#define LCD_BL_ON   0x7     // Backlight on
#define BUZZER_OFF  0xE     // Electromagnetic buzzer off
#define BUZZER_ON   0xF     // Electromagnetic buzzer on

// Initialize accessory board PPI to default state.
// Call this function before interfacing with peripherals.
// (Mode 0 (Simple I/O), port A input, ports B/C output)
void ppi_init();

#endif