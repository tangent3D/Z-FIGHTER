; Hardware definitions for Z-Fighter
; Imported from <zf_hardware.h>
; by Tangent 2021

EXTERN      _romdisable_n
EXTERN      _porta_acc
EXTERN      _portb_acc
EXTERN      _portc_acc
EXTERN      _ctrl_acc
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
EXTERN      _porta
EXTERN      _portb
EXTERN      _portc
EXTERN      _ctrl
EXTERN      _sio
EXTERN      _sio_a
EXTERN      _sio_b
EXTERN      _sio_ac
EXTERN      _sio_bc
EXTERN      _cf0
EXTERN      _cf1
EXTERN      _cf2
EXTERN      _cf3
EXTERN      _cf4
EXTERN      _cf5
EXTERN      _cf6
EXTERN      _cf7

ROMDISABLE_n    EQU    _romdisable_n

PORTA_ACC       EQU     _porta_acc
PORTB_ACC       EQU     _portb_acc
PORTC_ACC       EQU     _portc_acc
CTRL_ACC        EQU     _ctrl_acc

LCD_E_LO        EQU     _lcd_e_lo
LCD_E_HI        EQU     _lcd_e_hi
LCD_WR          EQU     _lcd_wr
LCD_RD          EQU     _lcd_rd
LCD_INST        EQU     _lcd_inst
LCD_DATA        EQU     _lcd_data
LCD_BL_OFF      EQU     _lcd_bl_off
LCD_BL_ON       EQU     _lcd_bl_on
BUZZER_OFF      EQU     _buzzer_off
BUZZER_ON       EQU     _buzzer_on

PORTA           EQU     _porta
PORTB           EQU     _portb
PORTC           EQU     _portc
CTRL            EQU     _ctrl

SIO             EQU     _sio
SIO_A           EQU     _sio_a
SIO_B           EQU     _sio_b
SIO_AC          EQU     _sio_ac
SIO_BC          EQU     _sio_bc

CF0             EQU     _cf0
CF1             EQU     _cf1
CF2             EQU     _cf2
CF3             EQU     _cf3
CF4             EQU     _cf4
CF5             EQU     _cf5
CF6             EQU     _cf6
CF7             EQU     _cf7

PUBLIC          ROMDISABLE_n

PUBLIC          PORTA_ACC
PUBLIC          PORTB_ACC
PUBLIC          PORTC_ACC
PUBLIC          CTRL_ACC
PUBLIC          LCD_E_LO
PUBLIC          LCD_E_HI
PUBLIC          LCD_WR
PUBLIC          LCD_RD
PUBLIC          LCD_INST
PUBLIC          LCD_DATA
PUBLIC          LCD_BL_OFF
PUBLIC          LCD_BL_ON
PUBLIC          BUZZER_OFF
PUBLIC          BUZZER_ON
PUBLIC          PORTA
PUBLIC          PORTB
PUBLIC          PORTC
PUBLIC          CTRL
PUBLIC          SIO
PUBLIC          SIO_A
PUBLIC          SIO_B
PUBLIC          SIO_AC
PUBLIC          SIO_BC
PUBLIC          CF0
PUBLIC          CF1
PUBLIC          CF2
PUBLIC          CF3
PUBLIC          CF4
PUBLIC          CF5
PUBLIC          CF6
PUBLIC          CF7
