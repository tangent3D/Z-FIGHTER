// ST7920 LCD controller functions for Z-Fighter
// by Tangent 2021

void lcd_update(unsigned char arr[]);
void lcd_instruction(unsigned char i, unsigned char extended);
void lcd_data(unsigned char d);
void lcd_wait_busy();
void lcd_switch_buffer();

unsigned char buffer = 0;
void lcd_update(unsigned char arr[])
	{	
		int upperScreenPointer = 0;
		int lowerScreenPointer = 512;

		unsigned char x = 0;
		unsigned char y = 0;

		if (buffer == 1)
			{
				y = 32;
			}

		for (unsigned char a=0; a<=31; a++)
			{
				lcd_instruction(y+0x80, 1);
				lcd_instruction(x+0x80, 1);
				for (int i=0; i<=15; i++)
					{
						lcd_data(arr[upperScreenPointer]);
						upperScreenPointer++;
					}
				for (unsigned char i=0; i<=15; i++)
					{
						lcd_data(arr[lowerScreenPointer]);
						lowerScreenPointer++;
					}
				y++;

			}

		lcd_switch_buffer();
	}

unsigned char instruction;
void lcd_instruction(unsigned char i, unsigned char extended)
	{
		instruction = i;

		if (extended == 1)					// Check basic or extended instruction
			{	
				lcd_wait_busy();
				__asm
				LD 		A,36h				// Set extended instruction set
				OUT 	(PORTB),A
				CALL 	_lcd_enable
				__endasm;

				lcd_wait_busy();
				__asm
				LD  	A,(_instruction)	// Send extended instruction
				OUT 	(PORTB),A 
				CALL 	_lcd_enable
				__endasm;

				lcd_wait_busy();
				__asm
				LD  	A,30h				// Reset basic instruction set
				OUT 	(PORTB),A
				CALL	_lcd_enable
				__endasm;
			}
		else								
			{
				lcd_wait_busy();
				__asm
				LD		A,(_instruction)	// Send basic instruction
				OUT 	(PORTB),A
				CALL	_lcd_enable
				__endasm;
			}
	}

unsigned char data;
void lcd_data(unsigned char d)
	{
		data = d;
		// lcd_wait_busy();			// Disable for speed boost (possibly unstable)

		__asm 
		LD  	A,5 				// Set LCD D
		OUT 	(CTRL),A

		LD 		A,(_data)			// Send data
		OUT 	(PORTB),A 
		CALL	 _lcd_enable

		LD  	A,4 				// Reset LCD #I
		OUT 	(CTRL),A
		__endasm;
	}

void lcd_enable()
	{
		__asm
		LD		A,1		
		OUT		(CTRL),A
		LD	 	A,0
		OUT 	(CTRL),A
		__endasm;
	}

void lcd_wait_busy()
	{
		__asm 
		LD  	A,92h 				// 8255 Simple I/O, PA,B in, PC out
		OUT 	(CTRL),A
		LD 		A,7					// Backlight ON
		OUT 	(CTRL),A

		LD 		A,3					// Set LCD RD
		OUT 	(CTRL),A
		LD		A,1		 			// Set LCD Enable
		OUT		(CTRL),A	

		0001$:
			IN 		A,(PORTB)
			BIT 	7,A 			// Check busy flag
			JR 		NZ,0001$

		LD	 	A,0					// Reset LCD Enable
		OUT 	(CTRL),A
		LD		A,2 				// Reset LCD #WR
		OUT		(CTRL),A

		CALL	_ppi_init
		__endasm;
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
				lcd_instruction(0+0x40, 1);		// Vertical scroll address = GDRAM bottom half
				buffer = 1;
			}

		lcd_instruction(0x03, 1);				// Enable vertical scroll position
	}