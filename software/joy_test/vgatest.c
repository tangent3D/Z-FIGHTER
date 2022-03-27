#include <zf_vga.h>
#include <zf_gfx.h>
#include <zf_text.h>

void main()
{
	for(;;)
	{	
		print(joyTest(), 0, 0);
		vga(screen);
	}
}