; Hardware definitions for Z-Fighter
; Imported from <zf_hardware.h>
; by Tangent 2021

; Reference symbols in <zf_hardware.c>
EXTERN      _porta
EXTERN      _portb
EXTERN      _portc
EXTERN      _ctrl
EXTERN      _lcd_e_lo
EXTERN      _lcd_e_hi
EXTERN      _lcd_wr
EXTERN      _lcd_rd
EXTERN      _lcd_inst
EXTERN      _lcd_data
EXTERN      _lcd_bl_off
EXTERN      _lcd_bl_on
EXTERN      _buzzer_off
EXTERN      _buzzer_on
EXTERN      _userporta
EXTERN      _userportb
EXTERN      _userportc
EXTERN      _userctrl
EXTERN      _sio_a
EXTERN      _sio_b
EXTERN      _sio_ac 
EXTERN      _sio_bc

; 8255A Programmable Peripheral Interface (Accessory)
PORTA       EQU     _porta
PORTB       EQU     _portb
PORTC       EQU     _portc
CTRL        EQU     _ctrl

; BSR (Bit Set/Reset) control words (Accessory)
LCD_E_LO    EQU     _lcd_e_lo
LCD_E_HI    EQU     _lcd_e_hi
LCD_WR      EQU     _lcd_wr
LCD_RD      EQU     _lcd_rd
LCD_INST    EQU     _lcd_inst
LCD_DATA    EQU     _lcd_data
LCD_BL_OFF  EQU     _lcd_bl_off
LCD_BL_ON   EQU     _lcd_bl_on
BUZZER_OFF  EQU     _buzzer_off
BUZZER_ON   EQU     _buzzer_on

; 8255A Programmable Peripheral Interface (User)
USERPORTA   EQU     _porta
USERPORTB   EQU     _portb
USERPORTC   EQU     _portc
USERCTRL    EQU     _ctrl

; Z80 SIO/0 Serial Input/Output Controller
SIO_A       EQU     _sio_a
SIO_B       EQU     _sio_b
SIO_AC      EQU     _sio_ac
SIO_BC      EQU     _sio_bc

; Set definitions publicly visible
PUBLIC      SIO_A
PUBLIC      SIO_B
PUBLIC      SIO_AC
PUBLIC      SIO_BC
PUBLIC      PORTA
PUBLIC      PORTB
PUBLIC      PORTC
PUBLIC      CTRL
PUBLIC      LCD_E_LO
PUBLIC      LCD_E_HI
PUBLIC      LCD_WR
PUBLIC      LCD_RD
PUBLIC      LCD_INST
PUBLIC      LCD_DATA
PUBLIC      LCD_BL_OFF
PUBLIC      LCD_BL_ON 
PUBLIC      BUZZER_OFF
PUBLIC      BUZZER_ON
PUBLIC      USERPORTA
PUBLIC      USERPORTB
PUBLIC      USERPORTC 
PUBLIC      USERCTRL
PUBLIC      SIO_A
PUBLIC      SIO_B
PUBLIC      SIO_AC
PUBLIC      SIO_BC