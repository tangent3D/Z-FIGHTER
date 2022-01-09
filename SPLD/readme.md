An Atmel ATF22V10C-15PU SPLD is responsible for producing all chip select logic for Z-FIGHTER.

By default, Z-FIGHTER's memory map is configured as 16K ROM (0000h-3FFFh) and 48K RAM (4000h-FFFFh) for compatibility with Grant Searle's CP/M Bios BIOS and Z-FIGHTER's serial loader. ROM is disabled when an I/O write is executed on port 38h. RAM will thereafter use the entire 64K memory map until system reset.

A 3-position DIP switch is used to manually page the 512K ROM affording the user eight bootable 64K ROMs to be installed on the system. This DIP switch is likewise connected to the SPLD allowing for custom memory maps per ROM. Memory maps can be configured in chunks of 8K, e.g. 8K ROM/56K RAM.

Fuse maps can be compiled using WinCUPL or [GALasm](https://github.com/daveho/GALasm).