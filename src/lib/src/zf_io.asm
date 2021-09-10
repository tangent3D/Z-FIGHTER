; I/O definitions for Z-Fighter
; by Tangent 2021

; 8255A Programmable Peripheral Interface (Accessory)
PORTA       EQU     40h     ; Connected to key switches
PORTB       EQU     41h     ; Connected to ST7920 LCD data bus
PORTC       EQU     42h     ; Connected to LCD control signals, backlight and buzzer
CTRL        EQU     43h     ; PPI control port

; BSR (Bit Set/Reset) control words (Accessory)
LCD_EN_LO   EQU     00h     ; LCD 'E' (Enable) high       
LCD_EN_HI   EQU     01h     ; LCD 'E' low
LCD_WR      EQU     02h     ; LCD R/#W low (Write)
LCD_RD      EQU     03h     ; LCD R/#W high (Read)
LCD_INST    EQU     04h     ; LCD RS low (Instruction)
LCD_DATA    EQU     05h     ; LCD RS high (Data)
LCD_BKLGHT  EQU     06h     ; LCD backlight
BUZZER      EQU     0Eh     ; Electromagnetic buzzer

; 8255A Programmable Peripheral Interface (User)
USERPORTA   EQU     80h     ; User port PA7-PA0
USERPORTB   EQU     81h     ; User port PB7-PB0
USERPORTC   EQU     82h     ; User port PC7-PC0
USERCTRL    EQU     83h     ; User PPI control port

; Z80 SIO/0 Serial Input/Output Controller
SIO_A       EQU     00h     ; SIO channel A data port
SIO_B       EQU     01h     ; SIO channel B data port
SIO_AC      EQU     02h     ; SIO channel A control port
SIO_BC      EQU     03h     ; SIO channel B control port