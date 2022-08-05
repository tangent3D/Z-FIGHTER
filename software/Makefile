# Makefile for Z-FIGHTER projects
# by Tangent 2021

# Uses z88dk/zsdcc, GNU Make

# Targets:
# ram       Build RAM model Z-FIGHTER binary from C/ASM source(s).
# rom       Build ROM model Z-FIGHTER binary from C/ASM source(s).
# cpm       Build CP/M COM file from C/ASM source(s).
# asm       Assemble a standalone ASM project.
# libs      Build Z-FIGHTER library.
# lib       Build a library from source files.
# send      Transfer output to zf_loader. To be used with 'ram' target.
# term      Open an interactive terminal for serial I/O with Z-FIGHTER. Uses plink (PuTTY).
# clean     Recursively clean intermediate binaries, assembly listings and symbol tables.
# cleaner   Recursively clean everything.

# Environment variables:
# name      Desired name of output. Defaults to current directory base name if unspecified.
# com_port  COM port of serial communications device, e.g. COM1, /dev/ttyS1, /dev/ttyUSB1.
# compress  Use compressed ROM model with +z80 target. Enable with 'true'
# opt       Enable optimization. Enable with 'true'
# int       Enable IM1 ISR. Enable with 'true'
# nmi       Enable NMI ISR. Enable with 'true'

# ASM (asm) target environment variables:
# file      First module to assemble, e.g. "file=program.asm" (required)
# ext       Desired extension of output, e.g. "ext=.com" (optional, defaults to .bin)

# Get path to this Makefile.
makefile_path :=    $(abspath $(lastword $(MAKEFILE_LIST)))
zf_dir :=           $(dir $(makefile_path))

# Import local environment variables from .env file.
ifneq (,$(wildcard $(zf_dir).env))
	include $(zf_dir).env
	export
endif

# Assign base name of directory as output name if no name is specified.
name ?=             $(notdir $(CURDIR))

# Use .bin extension for ASM project output if no extension is specified.
ext ?=              .bin

# Use z88dk/zsdcc newlib.
clib =              -clib=sdcc_iy

# Pragmas for RAM model ('ram') target (don't move stack pointer, return to caller on exit).
pragma_ram =        -pragma-define:REGISTER_SP=-1 $\
                    -pragma-define:CRT_ON_EXIT=0x10002

# Pragmas for ROM model ('rom') target (originate DATA section at 4000h).
pragma_rom =        -pragma-define:CRT_ORG_DATA=0x4000

# Pragmas for interrupts.
# Enables IM1 ISR. User must implement _z80_rst_38h routine which must preserve register values and exit with EI; RETI.
# Disables interrupts during startup code. Enables interrupts before _main is called.
pragma_int =        -pragma-define:CRT_ENABLE_RST=0x80 $\
                    -pragma-define:CRT_ENABLE_EIDI=0x03

# Pragma for NMI.
# Enables NMI ISR. User must implement _z80_nmi routine which must preserve register values and exit with RETN.
pragma_nmi =        -pragma-define:CRT_ENABLE_NMI=1

# Include Z-FIGHTER library in all targets.
inc =               -I$(zf_dir)zf_lib $\
                    -l$(zf_dir)zf_lib/zf_lib

# Path to Z-FIGHTER peripheral initialization code for use in +z80 CRT startup code.
init =              $(zf_dir)zf_lib/zf_init.asm

# Use maximum optimization if specified.
ifeq ($(opt),true)
	optimization =  -SO3 --max-allocs-per-node200000
endif

# Use compressed ROM model if specified. Otherwise, use uncompressed ROM model.
ifeq ($(compress),true)
	crt =           -startup=2
else
	crt =           -startup=1
endif

# Disable interrupts and IM1 ISR unless specified.
ifneq ($(int),true)
	pragma_int = -pragma-define:CRT_ENABLE_EIDI=0x0
endif

# Disable NMI ISR unless specified.
ifneq ($(nmi),true)
	pragma_nmi =
endif


SUBDIRS := $(wildcard zf_*/.)
.PHONY: all $(SUBDIRS)
.PHONY: asm
.PHONY: libs
.PHONY: send
.PHONY: term
.PHONY: clean
.PHONY: cleaner

# Call Makefiles in all /zf_* directories.
all: libs $(SUBDIRS)
$(SUBDIRS):
	@$(MAKE) -s --directory=$@

# Get sources and define rules.
SRC = $(wildcard *.c)
ASM = $(wildcard *.asm)
HDR = $(wildcard *.h)
OBJ = $(SRC:.c=.o) $(ASM:.asm=_asm.o)

%.o: %.c $(HDR)
	@echo Making $<.
	@zcc +z80 $(clib) $(optimization) $(inc) --c-code-in-asm --list -c -o $@ $<

%_asm.o: %.asm $(HDR)
	@echo Making $<.
	@zcc +z80 $(inc) --list -c -o $@ $<

# Build RAM model binary from source files.
ram: $(OBJ)
	@zcc +z80 $(clib) -startup=0 $(pragma_ram) $(pragma_int) $(pragma_nmi) $(inc) $(init) -m -o $(name) $^ -create-app --list -gen-symbol-file

# Build ROM model binary from source files.
rom: $(OBJ)
	@zcc +z80 $(clib) $(crt) $(pragma_rom) $(pragma_int) $(pragma_nmi) $(inc) $(init) -m -o $(name) $^ -create-app --list -Cz--romsize=16384

# Build CP/M COM file from source files. Uses newlib.
cpm: $(OBJ)
	@zcc +cpm $(clib) $(inc) -m -o $(name).com $^ -create-app

# Assemble a standalone ASM project.
asm:
	@z80asm -b -m $(inc) -o$(name)$(ext) $(file)

# Build a library from source files.
lib: $(OBJ)
	@zcc +z80 $(clib) -x -o $(name) $^

# Make Z-FIGHTER library from another Makefile.
libs:
	@$(MAKE) -s --directory=$(zf_dir)zf_lib/.

# Send binary to Z-FIGHTER serial loader (zf_loader).
send:
# Exit if COM port (com_port) is not defined.
ifeq (,$(com_port))
	@echo Cannot send to zf_loader. COM port (com_port) not specified.
else
	@echo Sending $(name).bin to Z-FIGHTER via $(com_port).
ifeq ($(OS),Windows_NT)
	@MODE $(com_port): BAUD=115200 PARITY=N DATA=8 STOP=1 OCTS=OFF DTR=OFF RTS=OFF >nul
	@COPY $(name).bin \\.\$(com_port) >nul 2>&1
else
	@stty -F $(com_port) 115200
	@cat $(name).bin > $(com_port)
endif
endif

# Open an interactive terminal for serial I/O with Z-FIGHTER.
term:
ifeq (,$(com_port))
	@echo Cannot open terminal. COM port (com_port) not specified.
else
	@echo Opening terminal for serial I/O with Z-FIGHTER.
	@plink -serial $(com_port) -sercfg 115200,8,n,1,N
endif

ext_clean =    *_CODE.bin *_DATA.bin *_BSS.bin *_UNASSIGNED.bin *.lis *.map *.def *.err *.ticks_history.txt *.sym
ext_cleaner =  zf_lib.lib *.bin *.rom *.com *.COM *.o

# Clean intermediate binaries, assembly listings and symbol tables.
clean:
ifeq ($(OS),Windows_NT)
	@DEL /S /Q $(ext_clean) >nul 2>&1
else
	@rm -f $(ext_clean)
	@rm -f $(foreach ext,$(ext_clean),./**/$(ext))
endif

# Clean everything.
cleaner: clean
ifeq ($(OS),Windows_NT)
	@DEL /S /Q $(ext_cleaner) >nul 2>&1
else
	@rm -f $(ext_cleaner)
	@rm -f $(foreach ext,$(ext_cleaner),./**/$(ext))
endif
