// Hardware definitions for Z-Fighter
// by Tangent 2021

#ifndef ZF_HARDWARE_H
#define ZF_HARDWARE_H

#define ROMDISABLE_n    0x38

// 8255A Programmable Peripheral Interface (Accessory)
#define PPI_ACC         0x40
#define PORTA_ACC       PPI_ACC+1   // Connected to key switches
#define PORTB_ACC       PPI_ACC+2   // Connected to ST7920 LCD data bus
#define PORTC_ACC       PPI_ACC+3   // Connected to LCD control signals, backlight and buzzer
#define CTRL_ACC        PPI_ACC+4   // PPI control port

// BSR (Bit Set/Reset) control words (Accessory)
#define LCD_E_LO        0x00        // LCD E (Enable) low
#define LCD_E_HI        0x01        // LCD E (Enable) high
#define LCD_WR          0x02        // LCD R/#W low (Write)
#define LCD_RD          0x03        // LCD R/#W high (Read)
#define LCD_INST        0x04        // LCD RS low (Instruction)
#define LCD_DATA        0x05        // LCD RS high (Data)
#define LCD_BL_OFF      0x06        // LCD backlight off
#define LCD_BL_ON       0x07        // LCD backlight on
#define BUZZER_OFF      0x0E        // Electromagnetic buzzer off
#define BUZZER_ON       0x0F        // Electromagnetic buzzer on

// 8255A Programmable Peripheral Interface (User)
#define PPI_USER        0x80
#define PORTA           PPI_USER+1  // User port PA7-PA0
#define PORTB           PPI_USER+2  // User port PB7-PB0
#define PORTC           PPI_USER+3  // User port PC7-PC0
#define CTRL            PPI_USER+4  // User PPI control port

// Z80 SIO/0 Serial Input/Output Controller
#define SIO             0x00
#define SIO_A           SIO+0       // SIO channel A data port
#define SIO_B           SIO+1       // SIO channel B data port
#define SIO_AC          SIO+2       // SIO channel A control port
#define SIO_BC          SIO+3       // SIO channel B control port

// CompactFlash
#define CF0             0x10        // CF data I/O
#define CF1             CF0+1       // Error register (/RD), Feature (/WR)
#define CF2             CF0+2       // Sector count
#define CF3             CF0+3       // Sector address LBA 0 [0:7]
#define CF4             CF0+4       // Sector address LBA 1 [8:15]
#define CF5             CF0+5       // Sector address LBA 2 [16:23]
#define CF6             CF0+6       // Sector address LBA 3 [24:27 (LSB)]
#define CF7             CF0+7       // Status (/RD), Command (/WR)

#endif
