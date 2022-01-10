Z-FIGHTER uses a cross-platform build system using z88dk/zsdcc and GNU Make. 

### Getting Started
1. Install z88dk for your platform according to these [instructions](https://github.com/z88dk/z88dk/wiki/installation). If applicable, follow any additional instructions for zsdcc. If using Windows, install a port of GNU Make, e.g. [Make for Windows](http://gnuwin32.sourceforge.net/packages/make.htm) or MinGW. Add the location of `make.exe` to your PATH.
2. Navigate your shell to the Z-FIGHTER software directory (the location of this readme) and execute `make`. Z-FIGHTER's development library and software will immediately begin compiling!
3. Create a text file named `.env` in this directory containing a definition for the `com_port` environment variable for Z-FIGHTER's build system according to the address of your serial communications device, e.g. `com_port=COM1`, `com_port=/dev/ttyS1`, or `com_port=/dev/ttyUSB1`.
4. Optionally, install [PuTTY/Plink](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) and add the location of its installed binaries to your PATH.

### Preparing for Serial Communication with Z-FIGHTER
Z-FIGHTER's build system is configured to work with a serial loader ROM, `zf_serial_loader/zf_loader.bin`, to be burned to the SST39SF040 EEPROM on-board Z-FIGHTER. Once the ROM is installed using your EEPROM burner, functionality can be verified by connecting your serial communications device to Z-FIGHTER's SIO/0 *Ch.A* port (furthest from power port). If you followed steps 3 and 4 above, navigate your shell to this directory and execute `make term` to open a simple terminal for serial I/O with Z-FIGHTER using `plink`.  Otherwise, configure your preferred terminal emulator for 115200 baud, 8-N-1 (8 data bits, no parity, 1 stop bit) and no flow control. Upon power-up or reset, Z-FIGHTER should transmit the text `[Z-Fighter Serial Boot Loader v0.1] Ready to load .BIN at 0000h.` Z-FIGHTER is ready to load a program into memory!

### Transferring Software to Z-FIGHTER
No additional software is required to transfer programs to Z-FIGHTER. Navigate your shell to the `game` or `demo` directory of your choice and execute `make send`. A binary will be immediately loaded into Z-FIGHTER's memory and executed. Upon program exit or system reset, Z-FIGHTER will return to the serial loader, ready to load another program into memory.
