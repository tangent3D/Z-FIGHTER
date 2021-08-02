// ST7920 LCD controller functions for Z-Fighter
// by Tangent 2021

#include <stdbool.h>

#define	PORTA	40h		
#define	PORTB	41h
#define	PORTC	42h
#define CTRL	43h

void ppi_init();
void lcd_init();
void lcd_update(unsigned char arr[]);
void lcd_instruction(int i, bool extended);
void lcd_data(int d);
void lcd_wait_busy();
void lcd_switch_buffer();
void test();

void lcd_init()
	{
		ppi_init();
		// TODO: Clear GDRAM before turning G. display on?
	}

bool buffer = 1;
void lcd_update(unsigned char arr[])
	{	
		int x = 0;
		int y = 0;
		int byte = 0;

		if (buffer == 1)
			{
				x = 0;
				y = 32;
			}

		for (int c=0; c<=1; c++)							// Repeat for each half of screen
			{
				for (int b=0; b<=31; b++)					// 32 rows per half of screen
				{
					lcd_instruction(y+0x80, true);
				 	lcd_instruction(x+0x80, true);
					for (int a=0; a<=15; a++)				// Put row of 16 bytes of data to GDRAM
						{
							lcd_data(arr[byte]);			
							byte++;						
						}
					y++;									// Increment Y address after each row
				}
				if (buffer == 1)
					{
						y = 32;
					}
				else
					{	
						y = 0;
					}
				x=8;										// Set X address to bottom half of screen
			}

		lcd_switch_buffer();
	}

int instruction;
void lcd_instruction(int i, bool extended)
	{
		instruction = i;

		if (extended == true)				// Check basic or extended instruction
			{	
				lcd_wait_busy();
				#asm
				LD 		A,36h				// Set extended instruction set
				OUT 	(PORTB),A
				CALL 	_lcd_enable
				#endasm

				lcd_wait_busy();
				#asm
				LD  	A,(_instruction)	// Send extended instruction
				OUT 	(PORTB),A 
				CALL 	_lcd_enable
				#endasm

				lcd_wait_busy();
				#asm
				LD  	A,30h				// Reset basic instruction set
				OUT 	(PORTB),A
				call 	_lcd_enable
				#endasm
			}
		else								
			{
				lcd_wait_busy();
				#asm
				LD		A,(_instruction)	// Send basic instruction
				OUT 	(PORTB),A
				CALL	_lcd_enable
				#endasm
			}
	}

int data;
void lcd_data(int d)
	{
		data = d;
		lcd_wait_busy();

		#asm 
		LD  	A,5 				// Set LCD D
		OUT 	(CTRL),A

		LD 		A,(_data)			// Send data
		OUT 	(PORTB),A 
		CALL	 _lcd_enable

		LD  	A,4 				// Reset LCD #I
		OUT 	(CTRL),A
		#endasm
	}

void ppi_init()
	{
		#asm
		LD		A,90h				// 8255 Simple I/O, PA in, PB,C out
		OUT		(CTRL),A
		LD		A,7					// Backlight ON
		OUT		(CTRL),A
		#endasm
	}

void lcd_enable()
	{
		#asm
		LD		A,1		
		OUT		(CTRL),A
		LD	 	A,0
		OUT 	(CTRL),A
		#endasm
	}

void lcd_wait_busy()
	{
		#asm 
		LD  	A,92h 				// 8255 Simple I/O, PA,B in, PC out
		OUT 	(CTRL),A
		LD 		A,7					// Backlight ON
		OUT 	(CTRL),A

		LD 		A,3					// Set LCD RD
		OUT 	(CTRL),A
		LD		A,1		 			// Set LCD Enable
		OUT		(CTRL),A	

		BUSYLOOP:
			IN 		A,(PORTB)
			BIT 	7,A 			// Check busy flag
			JR 		NZ,BUSYLOOP

		LD	 	A,0					// Reset LCD Enable
		OUT 	(CTRL),A
		LD		A,2 				// Reset LCD #WR
		OUT		(CTRL),A
		#endasm

		ppi_init();					// Reset PPI
	}

void lcd_switch_buffer()
	{
		if (buffer == 0)
			{
				lcd_instruction(0+0x40, true);	// Vertical scroll address = GDRAM top half
			}
		else
			{
				lcd_instruction(32+0x40, true);	// Vertical scroll address = GDRAM bottom half
			}
		buffer = !buffer;
	}