
# Bill of Materials for Z-Fighter

## Mainboard (rev. 2) [Mouser](https://www.mouser.com/ProjectManager/ProjectDetail.aspx?AccessID=55fcf50861)

## Accessory Board [Mouser](https://www.mouser.com/ProjectManager/ProjectDetail.aspx?AccessID=e552b3f8e6)

## Additional materials

ST7920 128x64 Graphic LCD [Link](https://www.buydisplay.com/3-3v-5v-graphic-display-128x64-serial-lcd-display-st7920)

'Extra Tall' 26P GPIO connector (Accessory board connector) [Link](https://thepihut.com/products/extra-tall-gpio-connector-for-the-raspberry-pi) - Install this piece on the accessory board after the vertical 26P shrouded header and 20mm standoffs are installed on the main board. The accessory board should be mounted on the standoffs to determine the correct length of the header pins. The header pins must then be trimmed to length before soldering to prevent strain to the solder joints or PCB. The use of safety glasses is encouraged.

DSA profile 2U keycaps (2 ct.) [Link](https://pimpmykeyboard.com/dsa-2-space-pack-of-4/)

DSA profile 1U keycaps (6 ct.) [Link](https://pimpmykeyboard.com/dsa-1-space-pack-of-10/)

Cherry PCB snap-in 2U stabilizers (2 ct.) [Amazon](https://www.amazon.com/dp/B085T8QZJC/ref=cm_sw_r_tw_dp_V3VNQRQ0CPQBPXNV3A6B?_encoding=UTF8&psc=1)

Right angle single row 2.54mm male header (20P, LCD connector) [Amazon](https://www.amazon.com/dp/B01461DQ6S/ref=cm_sw_r_tw_dp_GKV8K1RT5GKDB1A8GHAV) - Must be installed as close to the board as possible. Following installation, the plastic housing must be removed for a comfortable fit between the LCD module and accessory board.

Right angle single row 2.54mm female header (20P, LCD connector) [Amazon](https://www.amazon.com/dp/B07P1R9CGT/ref=cm_sw_r_tw_dp_7SZQVEK1GGS1AR1WVH0K?_encoding=UTF8&psc=1)

M3 standoffs (20mm, 4 ct.) [Amazon](https://www.amazon.com/dp/B07PK23VC4/ref=cm_sw_r_tw_dp_NGRJ3TRHWGEE7J0RGDNS?_encoding=UTF8&psc=1)

M3 nuts and bolts [Amazon](https://www.amazon.com/dp/B078V3YCF6/ref=cm_sw_r_tw_dp_TQ4HJWWVDEA1XZR15HDK?_encoding=UTF8&psc=1)

M3 rubber feet (D12 x 10 x H7mm) [Amazon](https://www.amazon.com/dp/B07LF1J7ZB/ref=cm_sw_r_tw_dp_JDTK9C1A8TC8FPBZZV7F?_encoding=UTF8&psc=1)

## Optional oscillator for second serial I/O port

A second full-size (DIP-14) oscillator can optionally be installed in addition to the system clock oscillator to conveniently configure the speed of serial I/O channel B. Z-Fighter does not have a counter/timer IC to act as a baud rate generator, so the SIO/0's clock divider is used. Typically, both SIO/0 channels are set to x64 clock mode. A 614.4 KHz oscillator is useful for connecting to devices that use the common speed of 9600 bps. A 2 MHz oscillator could theoretically be used to generate a speed of 31250 bps and drive a MIDI interface!

## Optional internal CompactFlash to IDE installation

It is possible to mount a common style of [CF to IDE adapter](https://www.amazon.com/dp/B081336VP9/ref=cm_sw_r_tw_dp_JFMTNXX912AVZNW4FQQ4) inside the Z-Fighter enclosure between the mainboard and accessory board.

To accomplish this, a [wire wrap style right angle 40P shrouded header](https://www.mouser.com/ProductDetail/?qs=n1d6TrdN4SAGWp%252BEF8S8fg%3D%3D) is used. Install this header after the entire assembly (mainboard, accessory board, LCD module) is complete to find a suitable height for the box header. When installed correctly, a CompactFlash card installed in the CF to IDE adapter should float approximately 2mm above the Z80 CPU. Again, the header pins must be trimmed to length before soldering to prevent strain to the solder joints or PCB. Safety glasses are recommended.

 For a comfortable fit, the LEDs and headers with shunts/jumpers should be removed from the CF to IDE adapter and replaced with wire links across pins 1 and 2 on JP1 and JP2.
