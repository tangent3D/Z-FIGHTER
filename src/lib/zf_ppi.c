// 8255A Programmable Peripheral Interface functions for Z-Fighter peripherals
// (Keys, LCD, buzzer)
// by Tangent 2021

#define	PORTA	40h		
#define	PORTB	41h
#define	PORTC	42h
#define CTRL	43h

void ppi_init()
	{
		__asm
		LD		A,90h				// 8255 Simple I/O, PA in, PB,C out
		OUT		(CTRL),A
		LD		A,7					// Backlight ON
		OUT		(CTRL),A
		__endasm;
	}
