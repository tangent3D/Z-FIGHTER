// Hardware definitions for Z-Fighter
// Imported from <zf_hardware.h>
// by Tangent 2021

#include <zf_hardware.h>

// 8255A Programmable Peripheral Interface (Accessory)
__at (PORTA)        void *porta;
__at (PORTB)        void *portb;
__at (PORTC)        void *portc;
__at (CTRL)         void *ctrl;

// BSR (Bit Set/Reset) control words (Accessory)
__at (LCD_E_LO)     void *lcd_e_lo;
__at (LCD_E_HI)     void *lcd_e_hi;
__at (LCD_WR)       void *lcd_wr;
__at (LCD_RD)       void *lcd_rd;
__at (LCD_INST)     void *lcd_inst;
__at (LCD_DATA)     void *lcd_data;
__at (LCD_BL_OFF)   void *lcd_bl_off;
__at (LCD_BL_ON)    void *lcd_bl_on;
__at (BUZZER_OFF)   void *buzzer_off;
__at (BUZZER_ON)    void *buzzer_on;

// 8255A Programmable Peripheral Interface (User)
__at (USERPORTA)    void *userporta;
__at (USERPORTB)    void *userportb;
__at (USERPORTC)    void *userportc;
__at (USERCTRL)     void *userctrl;

// Z80 SIO/0 Serial Input/Output Controller
__at (SIO_A)        void *sio_a;
__at (SIO_B)        void *sio_b;
__at (SIO_AC)       void *sio_ac;
__at (SIO_BC)       void *sio_bc;