#include <zf_vga.h>
#include <zf_gfx.h>
#include <zf_text.h>
#include <stdlib.h>
#include <zf_sio.h>

void main()
{
	unsigned char str[4];
	// channel = CH_A;
	// sioInit();

	for(;;)
	{	
		cls();
		utoa(joyTest(), str, 10);
		// sioPrint(str);
		print(str, 0, 0);
		vga(screen);
	}
}