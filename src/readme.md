Z-FIGHTER uses a cross-platform build system using z88dk/zsdcc and GNU Make. 

### Getting Started
1. Install z88dk for your platform according to these [instructions](https://github.com/z88dk/z88dk/wiki/installation). If applicable, follow any additional instructions for zsdcc. If using Windows, install a port of GNU Make, e.g. [Make for Windows](http://gnuwin32.sourceforge.net/packages/make.htm) or MinGW. Add the location of `make.exe` to your PATH.
2. Navigate your shell to the Z-FIGHTER software directory (the location of this readme) and execute `make`. Z-FIGHTER's development library and software will immediately begin compiling![^1]
3. Create a text file named `.env` in this directory containing a definition for the `com_port` environment variable for Z-FIGHTER's build system specifying the address of your serial communications device, e.g. `com_port=COM1`, `com_port=/dev/ttyS1`, or `com_port=/dev/ttyUSB1`.[^2]
4. Optionally, install [PuTTY/Plink](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) and add the location of its installed binaries to your PATH.

### Preparing for Serial Communication with Z-FIGHTER
Z-FIGHTER's build system is configured to work with a boot loader ROM, `zf_serial_loader/zf_loader.rom`, to be burned to the SST39SF040 EEPROM on-board Z-FIGHTER. Once the ROM is installed using your EEPROM burner, functionality can be verified by connecting your serial communications device to Z-FIGHTER's SIO/0 **Ch.A** port (furthest from power port). If you followed step 4 above, navigate your shell to this directory and execute `make term` to open a simple terminal for serial I/O with Z-FIGHTER using `plink`.  Otherwise, configure your preferred terminal emulator for 115200 baud, 8-N-1 (8 data bits, no parity, 1 stop bit) and no flow control. Upon power-up or reset, Z-FIGHTER should transmit the text `[Z-Fighter Serial Boot Loader v0.1] Ready to load binary at 0000h.` Z-FIGHTER is ready to load a program into memory!

### Transferring Programs to Z-FIGHTER
No additional software is required to transfer programs to Z-FIGHTER. Navigate your shell to the `game` or `demo` directory of your choice and execute `make send`. A binary will be immediately loaded into Z-FIGHTER RAM and executed. Upon program exit or system reset, Z-FIGHTER will return to the boot loader, ready to load another program into memory.

### Make Targets
#### 'ram' (RAM Model) Target
Produces a '.bin' file intended to be loaded into Z-FIGHTER RAM. Programs have full use of the 64K memory space minus any space at the top of RAM reserved for a boot loader (e.g. 512 bytes for `zf_loader`.)

#### 'rom' (ROM Model) Target
Produces a 16K '.rom' file intended for burning to Z-FIGHTER's EEPROM for immediate execution.[^3] This target is configured to generate ROM files for Z-FIGHTER's default memory map (16K ROM, 48K RAM).[^4] Compression can be enabled when using this target by specifying `compress=true`.

#### 'cpm' (CP/M) Target
Produces a CP/M COM file for use with CP/M. Programs can be uploaded to Z-FIGHTER via serial using protocols like Xmodem and Telnet.

#### 'asm' (Standalone ASM Project) Target
Assembles a standalone ASM project using `z80asm`. The first module to be assembled must be specified with the `file` environment variable, e.g. `file=program.asm`. Additional source files can be included with `INCLUDE` and `INCBIN` directives. Code and data sections should be located with `ORG` directives. Reference to Z-FIGHTER library components is supported via `EXTERN` directives. The output file extension (default .bin) can optionally be specified with the `ext` environment variable, e.g. `ext=.com`.

An example of a project assembled with this target is [`zf_loader`](https://github.com/tangent3D/Z-FIGHTER/blob/main/src/zf_serial_loader/zf_loader.asm).

[^1]: If you've compiled z88dk from source and `z80.lib` is not found when linking, navigate to `z88dk/libsrc/_DEVELOPMENT` and execute `make` to build the z80 libraries separately.
[^2]: If `.env` file is not present, `com_port` will need to be specified on the command line or in your project's Makefile when `send` and `term` operations are performed.
[^3]:While this practice is not discouraged, it should be considered a stopgap measure until a system ROM that loads software into RAM from the CompactFlash card is created.
[^4]:Refer to [this](https://github.com/tangent3D/Z-FIGHTER/blob/main/SPLD/readme.md) page for information about modifying Z-FIGHTER's memory map.
