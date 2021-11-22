// Bitmap text implementation for Z-Fighter
// by Tangent 2021

#include <zf_text.h>
#include <zf_gfx.h>

void print(unsigned char string[], unsigned char x, unsigned char y)
{
    unsigned char i = 0;
    while (string[i] != '\0')
        {
            if(string[i] == '\n')
                {
                    x = 0;
                    y++;
                    i++;
                }
            unsigned char j = string[i]-32;
            block(charSet+(j<<3), x, y);
            x++;
            i++;
        }
}

void printChar(unsigned char character, unsigned char x, unsigned char y)
    {
        block(charSet+(character-32)*8, x, y);
    }

const unsigned char charSet [] =
    {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x10, 0x10, 0x10, 0x00, 0x10, 0x00,
    0x00, 0x24, 0x24, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x24, 0x7E, 0x24, 0x24, 0x7E, 0x24, 0x00,
    0x10, 0x3C, 0x40, 0x38, 0x04, 0x78, 0x10, 0x00, 0x00, 0x62, 0x64, 0x08, 0x10, 0x26, 0x46, 0x00,
    0x10, 0x28, 0x10, 0x2A, 0x44, 0x44, 0x3A, 0x00, 0x00, 0x10, 0x10, 0x20, 0x00, 0x00, 0x00, 0x00,
    0x08, 0x10, 0x10, 0x10, 0x10, 0x10, 0x08, 0x00, 0x10, 0x08, 0x08, 0x08, 0x08, 0x08, 0x10, 0x00,
    0x00, 0x54, 0x38, 0x7C, 0x38, 0x54, 0x00, 0x00, 0x00, 0x10, 0x10, 0x7C, 0x10, 0x10, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x10, 0x10, 0x20, 0x00, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x30, 0x00, 0x00, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x00,
    0x00, 0x3C, 0x46, 0x4A, 0x52, 0x62, 0x3C, 0x00, 0x00, 0x18, 0x28, 0x08, 0x08, 0x08, 0x08, 0x00,
    0x00, 0x3C, 0x42, 0x02, 0x3C, 0x40, 0x7E, 0x00, 0x00, 0x3C, 0x42, 0x0C, 0x02, 0x42, 0x3C, 0x00,
    0x00, 0x40, 0x48, 0x48, 0x7E, 0x08, 0x08, 0x00, 0x00, 0x7E, 0x40, 0x7C, 0x02, 0x42, 0x3C, 0x00,
    0x00, 0x3C, 0x40, 0x7C, 0x42, 0x42, 0x3C, 0x00, 0x00, 0x7E, 0x02, 0x04, 0x08, 0x10, 0x10, 0x00,
    0x00, 0x3C, 0x42, 0x3C, 0x42, 0x42, 0x3C, 0x00, 0x00, 0x3C, 0x42, 0x42, 0x3E, 0x02, 0x3C, 0x00,
    0x00, 0x00, 0x10, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x10, 0x10, 0x20, 0x00,
    0x00, 0x08, 0x10, 0x20, 0x10, 0x08, 0x00, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x3C, 0x00, 0x00, 0x00,
    0x00, 0x20, 0x10, 0x08, 0x10, 0x20, 0x00, 0x00, 0x00, 0x38, 0x44, 0x08, 0x10, 0x00, 0x10, 0x00,
    0x00, 0x3C, 0x02, 0x3A, 0x4A, 0x4A, 0x3C, 0x00, 0x00, 0x3C, 0x42, 0x42, 0x7E, 0x42, 0x42, 0x00,
    0x00, 0x7C, 0x42, 0x7C, 0x42, 0x42, 0x7C, 0x00, 0x00, 0x3C, 0x42, 0x40, 0x40, 0x42, 0x3C, 0x00,
    0x00, 0x78, 0x44, 0x42, 0x42, 0x44, 0x78, 0x00, 0x00, 0x7E, 0x40, 0x78, 0x40, 0x40, 0x7E, 0x00,
    0x00, 0x7E, 0x40, 0x78, 0x40, 0x40, 0x40, 0x00, 0x00, 0x3C, 0x40, 0x4E, 0x42, 0x42, 0x3C, 0x00,
    0x00, 0x42, 0x42, 0x7E, 0x42, 0x42, 0x42, 0x00, 0x00, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x00,
    0x00, 0x02, 0x02, 0x02, 0x02, 0x42, 0x3C, 0x00, 0x00, 0x42, 0x44, 0x78, 0x44, 0x42, 0x42, 0x00,
    0x00, 0x40, 0x40, 0x40, 0x40, 0x40, 0x7E, 0x00, 0x00, 0x42, 0x66, 0x5A, 0x42, 0x42, 0x42, 0x00,
    0x00, 0x42, 0x62, 0x52, 0x4A, 0x46, 0x42, 0x00, 0x00, 0x3C, 0x42, 0x42, 0x42, 0x42, 0x3C, 0x00,
    0x00, 0x7C, 0x42, 0x42, 0x7C, 0x40, 0x40, 0x00, 0x00, 0x3C, 0x42, 0x42, 0x4A, 0x44, 0x3A, 0x00,
    0x00, 0x7C, 0x42, 0x42, 0x7C, 0x42, 0x42, 0x00, 0x00, 0x3C, 0x40, 0x3C, 0x02, 0x42, 0x3C, 0x00,
    0x00, 0xFE, 0x10, 0x10, 0x10, 0x10, 0x10, 0x00, 0x00, 0x42, 0x42, 0x42, 0x42, 0x42, 0x3C, 0x00,
    0x00, 0x42, 0x42, 0x42, 0x42, 0x24, 0x18, 0x00, 0x00, 0x42, 0x42, 0x42, 0x42, 0x5A, 0x24, 0x00,
    0x00, 0x42, 0x24, 0x18, 0x18, 0x24, 0x42, 0x00, 0x00, 0x82, 0x44, 0x28, 0x10, 0x10, 0x10, 0x00,
    0x00, 0x7E, 0x04, 0x08, 0x10, 0x20, 0x7E, 0x00, 0x38, 0x20, 0x20, 0x20, 0x20, 0x20, 0x38, 0x00,
    0x00, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x00, 0x1C, 0x04, 0x04, 0x04, 0x04, 0x04, 0x1C, 0x00,
    0x00, 0x10, 0x28, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7E, 0x00,
    0x00, 0x20, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x04, 0x3C, 0x44, 0x3C, 0x00,
    0x00, 0x40, 0x40, 0x78, 0x44, 0x44, 0x78, 0x00, 0x00, 0x00, 0x3C, 0x40, 0x40, 0x40, 0x3C, 0x00,
    0x00, 0x04, 0x04, 0x3C, 0x44, 0x44, 0x3C, 0x00, 0x00, 0x00, 0x38, 0x44, 0x7C, 0x40, 0x3C, 0x00,
    0x00, 0x18, 0x24, 0x20, 0x70, 0x20, 0x20, 0x00, 0x00, 0x00, 0x3C, 0x44, 0x3C, 0x04, 0x38, 0x00,
    0x00, 0x40, 0x40, 0x78, 0x44, 0x44, 0x44, 0x00, 0x00, 0x10, 0x00, 0x10, 0x10, 0x10, 0x10, 0x00,
    0x00, 0x08, 0x00, 0x08, 0x08, 0x48, 0x30, 0x00, 0x00, 0x40, 0x44, 0x48, 0x70, 0x48, 0x44, 0x00,
    0x00, 0x10, 0x10, 0x10, 0x10, 0x10, 0x08, 0x00, 0x00, 0x00, 0x68, 0x54, 0x54, 0x44, 0x44, 0x00,
    0x00, 0x00, 0x78, 0x44, 0x44, 0x44, 0x44, 0x00, 0x00, 0x00, 0x38, 0x44, 0x44, 0x44, 0x38, 0x00,
    0x00, 0x00, 0x78, 0x44, 0x78, 0x40, 0x40, 0x00, 0x00, 0x00, 0x3C, 0x44, 0x3C, 0x04, 0x04, 0x00,
    0x00, 0x00, 0x78, 0x44, 0x40, 0x40, 0x40, 0x00, 0x00, 0x00, 0x38, 0x40, 0x38, 0x04, 0x78, 0x00,
    0x00, 0x10, 0x10, 0x7C, 0x10, 0x10, 0x10, 0x00, 0x00, 0x00, 0x44, 0x44, 0x44, 0x44, 0x38, 0x00,
    0x00, 0x00, 0x44, 0x44, 0x44, 0x28, 0x10, 0x00, 0x00, 0x00, 0x44, 0x44, 0x54, 0x54, 0x28, 0x00,
    0x00, 0x00, 0x44, 0x28, 0x10, 0x28, 0x44, 0x00, 0x00, 0x00, 0x44, 0x44, 0x3C, 0x04, 0x38, 0x00,
    0x00, 0x00, 0x7C, 0x08, 0x10, 0x20, 0x7C, 0x00, 0x18, 0x20, 0x20, 0x40, 0x20, 0x20, 0x18, 0x00,
    0x10, 0x10, 0x10, 0x00, 0x10, 0x10, 0x10, 0x00, 0x18, 0x04, 0x04, 0x02, 0x04, 0x04, 0x18, 0x00,
    0x20, 0x54, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
    };