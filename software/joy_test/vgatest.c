#include <zf_vga.h>
#include <zf_gfx.h>
#include <zf_text.h>
#include <stdlib.h>

void main()
{
	unsigned char str[4];

	for(;;)
	{	
		utoa(joyTest(), str, 10);
		print(str, 0, 0);
		vga(screen);
	}
}