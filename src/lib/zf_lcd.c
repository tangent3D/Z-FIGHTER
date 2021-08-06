// ST7920 LCD controller functions for Z-Fighter
// by Tangent 2021

#define	PORTA	40h		
#define	PORTB	41h
#define	PORTC	42h
#define CTRL	43h

void ppi_init();
void lcd_init();
void lcd_update(unsigned char arr[]);
void lcd_instruction(int i, int extended);
void lcd_data(int d);
void lcd_wait_busy();
void lcd_switch_buffer();

void lcd_init()
	{
		ppi_init();

		lcd_instruction(0x03, 1); // Enable vertical scroll position (used as frame buffer)
		// TODO: Clear GDRAM before turning G. display on?
	}

int buffer = 1;
void lcd_update(unsigned char arr[])
	{	
		int upperScreenPointer = 0;
		int lowerScreenPointer = 512;

		int x = 0;
		int y = 0;

		if (buffer == 1)
			{
				y = 32;
			}

		for (int a=0; a<=31; a++)
			{
				lcd_instruction(y+0x80, 1);
				lcd_instruction(x+0x80, 1);
				for (int i=0; i<=15; i++)
					{
						lcd_data(arr[upperScreenPointer]);
						upperScreenPointer++;
					}
				for (int i=0; i<=15; i++)
					{
						lcd_data(arr[lowerScreenPointer]);
						lowerScreenPointer++;
					}
				y++;

			}

		lcd_switch_buffer();
	}

int instruction;
void lcd_instruction(int i, int extended)
	{
		instruction = i;

		if (extended == 1)				// Check basic or extended instruction
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

				lcd_wait_busy();			// Disable for speed boost (unstable?)
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
		lcd_wait_busy();			// Disable for speed boost (unstable?)

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
		if (buffer == 1)
			{
				lcd_instruction(32+0x40, 1);	// Vertical scroll address = GDRAM top half
				buffer = 0;
			}
		else
			{
				lcd_instruction(0+0x40, 1);	// Vertical scroll address = GDRAM bottom half
				buffer = 1;
			}
	}