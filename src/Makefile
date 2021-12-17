# Makefile for Z-FIGHTER projects
# by Tangent 2021

# Targets:
# all (Build Z-FIGHTER binary from .C and .ASM sources.)
# dis (Output diassembly of .BIN to console.)
# transfer (Transfer .BIN to zf_loader.)
# terminal (Open an interactive terminal for serial I/O with Z-FIGHTER.)

# Environment variables:
# name (defaults to 'out' if unassigned.)
# com_port (COM port of your serial communications device, e.g. COM1, /dev/ttyS1, /dev/ttyUSB1.)
# startup (Use startup code. Default='true')
# compress (Use compressed ROM model. Default='false')
# optimize (Enable optimization. Default='false')
# console (Transfer to zf_loader and maintain serial connection for console output. Default='false')
# dis (Output disassembly. Skips transfer. Default='false')

# Import local environment variables from .env file.
ifneq (,$(wildcard $(zf)/.env))
	include $(zf)/.env
	export
endif

# Import project environment variables from .env file if existent.
ifneq (,$(wildcard ./.env))
    include .env
    export
endif

# Defaults
cc=		zcc +z80 -vn $\
		-clib=sdcc_iy -compiler=sdcc

pragma=	-pragma-define:CRT_ORG_CODE=0 $\
		-pragma-define:REGISTER_SP=-1 $\
		-pragma-define:CRT_ON_EXIT=0x10002 $\
		-pragma-define:CRT_ENABLE_STDIO=0 $\
		-pragma-define:CLIB_STDIO_HEAP_SIZE=0 $\

inc= 	-I$(zf)/lib $\
		-l$(zf)/lib/zf_lib $\
		-Ca-l$(zf)/lib/zf_lib -Ca-I=$(zf)/lib $\
		-Cl-l$(zf)/lib/zf_lib -Cl-I=$(zf)/lib

init=$(zf)/lib/zf_init.asm

# Assign base name of directory as name of output if no name is specified.
ifeq ($(name),)
	name=$(notdir $(CURDIR))
endif

# Use compressed ROM model if specified. Otherwise, use uncompressed ROM model.
ifeq ($(compress),true)
	su := -startup=2
else
	su := -startup=1
endif

# Disable startup code if specified.
startup := $(startup)
ifeq ($(startup),false)
	su := --no-crt
	pragma=
	output=$(name).bin
	appmake=
	init=
else
	output=$(name)
	appmake=-create-app
endif

# Enable optimization if specified.
ifeq ($(opt),true)
	optimization=-opt=-SO3 --max-allocs-per-node200000
endif

CFILES = $(wildcard *.c)
OFILES = $(CFILES:.c=.o)
ASMFILES = $(wildcard *.asm)
DEPS = $(wildcard *.h)
libsrc = $(wildcard $(zf)/lib/*.c $(zf)/lib/*.asm)

%.o: %.c
	$(cc) $(inc) $(optimization) -o $@ -c $^

all: $(OFILES)
	$(cc) $(pragma) $(inc) $(su) $^ -o $(name) $(appmake) -m

dis:
	@z88dk-dis -o 0x0000 -x $(name).map $(name).bin

# Compile Z-Fighter library. FIXME: Recompile from .o files?
lib: $(libsrc)
	$(cc) -I$(zf)/lib -x $^ -o zf_lib $(appmake)

transfer:
# Error if com_port is undefined.
ifeq (,$(com_port))
	@echo Cannot transfer to Z-FIGHTER. COM port not specified.
else
# Transfer to Z-FIGHTER and display console output. Press Ctrl+C to break.
ifeq ($(console),true)
	@echo Transferring $(name).bin to zf_loader and displaying console output.
	@plink -serial $(com_port) -sercfg 115200,8,n,1,N < $(name).bin
else
# Transfer to Z-FIGHTER and close serial connection.
	@echo Transferring $(name).bin to zf_loader.
ifeq ($(OS),Windows_NT)
	@MODE $(com_port): BAUD=115200 PARITY=N DATA=8 STOP=1 OCTS=OFF DTR=OFF RTS=OFF >nul
	@COPY $(name).bin \\.\$(com_port) >nul 2>&1
else
	@stty -F $(com_port) 115200
	@cat $(name).bin > $(com_port)
endif
endif
endif

# Open an interactive terminal for serial I/O with Z-FIGHTER. Press Ctrl+C to break.
terminal:
	@echo Opening terminal for serial I/O with Z-FIGHTER.
	@plink -serial $(com_port) -sercfg 115200,8,n,1,N

.PHONY: clean

# Clean up intermediate files.
clean:
ifeq ($(OS),Windows_NT)
	@DEL *.o *.map *_CODE.bin *_DATA.bin *_BSS.bin *_UNASSIGNED.bin *_disassembled.txt >nul 2>&1
else
	@$(RM) *.o *.map *_CODE.bin *_DATA.bin *_BSS.bin *_UNASSIGNED.bin *_disassembled.txt
endif