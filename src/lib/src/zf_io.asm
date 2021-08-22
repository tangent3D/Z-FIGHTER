; I/O definitions for Z-Fighter
; by Tangent 2021

; 8255A Programmable Peripheral Interface (Accessory)
PORTA		EQU		40h		; Connected to key switches
PORTB       EQU		41h  	; Connected to ST7920 LCD data bus
PORTC       EQU		42h		; Connected to LCD control signals, backlight and buzzer
CTRL        EQU		43h		; PPI control port

; BSR (Bit Set/Reset) control words (Accessory)
LCD_EN_LO   EQU		00h     ; LCD 'E' (Enable) high       
LCD_EN_HI   EQU		01h     ; LCD 'E' low
LCD_WR      EQU		02h     ; LCD R/#W low (Write)
LCD_RD      EQU		03h     ; LCD R/#W high (Read)
LCD_INST    EQU		04h     ; LCD RS low (Instruction)
LCD_DATA    EQU		05h     ; LCD RS high (Data)
LCD_BL_OFF  EQU		06h     ; Backlight off
LCD_BL_ON   EQU		07h     ; Backlight on
BUZZER_OFF  EQU		0Eh     ; Electromagnetic buzzer off
BUZZER_ON   EQU		0Fh     ; Electromagnetic buzzer on

; 8255A Programmable Peripheral Interface (User)
USERPORTA	EQU		80h		; User port PA7-PA0
USERPORTB   EQU		81h		; User port PB7-PB0
USERPORTC   EQU		82h		; User port PC7-PC0
USERCTRL    EQU		83h		; User PPI control port