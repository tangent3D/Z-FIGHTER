# Makefile for Z-FIGHTER projects
# by Tangent 2021

# Targets:
#
# bin 		Build Z-FIGHTER binary from .C and .ASM sources.
# lib		Build Z-FIGHTER library.
# dis 		Output diassembly of .BIN to console.
# send 		Transfer .BIN to zf_loader.
# term 		Open an interactive terminal for serial I/O with Z-FIGHTER. Uses plink (PuTTY). Press Ctrl+C to break.

# Environment variables:
#
# zf 		Absolute path to /Z-FIGHTER/src.
# name 		Desired of output binary. Defaults to project directory base name if unspecified.
# com_port 	COM port of your serial communications device, e.g. COM1, /dev/ttyS1, /dev/ttyUSB1.
# startup 	Use startup code. Default='true'
# compress 	Use compressed ROM model. Default='false'
# optimize 	Enable optimization. Default='false'
# con 		Transfer to zf_loader and maintain serial connection for console output from Z-FIGHTER. Uses plink (PuTTY). Press Ctrl+C to break. Default='false'
# dis 		Output disassembly. Skips transfer. Default='false'

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

# Compiler settings. Uses z88dk/SDCC.
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

# Assign base name of directory as program name if no name is specified.
ifeq ($(name),)
	name=$(notdir $(CURDIR))
endif

# Use compressed ROM model if specified. Otherwise, use uncompressed ROM model.
ifeq ($(compress),true)
	crt := -startup=2
else
	crt := -startup=1
endif

# Disable startup code if specified.
startup := $(startup)
ifeq ($(startup),false)
	crt := --no-crt
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

SRC = $(wildcard *.c)
ASM = $(wildcard *.asm)
HDR = $(wildcard *.h)
OBJ = $(SRC:.c=.o) $(ASM:.asm=_asm.o)

# Targets

%.o: %.c $(HDR)
	@$(cc) -c -o $@ $< -I$(zf)/lib

%_asm.o: %.asm $(HDR)
	@$(cc) -c -o $@ $< -I$(zf)/lib

# Build program binary for Z-FIGHTER.
bin: $(OBJ)
	@$(cc) -o $(output) $^ $(crt) $(pragma) $(inc) $(optimization) $(init) $(appmake) -m

# Build Z-FIGHTER library.
lib: $(OBJ)
	@$(cc) -o zf_lib $^ -x -I$(zf)/lib

# Disassemble and display output.
dis:
	@z88dk-dis -o 0x0000 -x $(name).map $(name).bin

# Send binary to Z-FIGHTER serial loader (zf_loader).
send:
# Exit if COM port (com_port) is not defined.
ifeq (,$(com_port))
	@echo Cannot send to zf_loader. COM port (com_port) not specified.
else
# Send binary to Z-FIGHTER and maintain serial connection.
ifeq ($(console),true)
	@echo Sending $(name).bin to Z-FIGHTER via $(com_port). Console ouput enabled.
	@plink -serial $(com_port) -sercfg 115200,8,n,1,N < $(name).bin
else
# Send binary to Z-FIGHTER and close serial connection.
	@echo Sending $(name).bin to Z-FIGHTER via $(com_port).
ifeq ($(OS),Windows_NT)
	@MODE $(com_port): BAUD=115200 PARITY=N DATA=8 STOP=1 OCTS=OFF DTR=OFF RTS=OFF >nul
	@COPY $(name).bin \\.\$(com_port) >nul 2>&1
else
	@stty -F $(com_port) 115200
	@cat $(name).bin > $(com_port)
endif
endif
endif

# Open an interactive terminal for serial I/O with Z-FIGHTER.
term:
	@echo Opening terminal for serial I/O with Z-FIGHTER.
	@plink -serial $(com_port) -sercfg 115200,8,n,1,N

# Clean up intermediate files.
clean:
ifeq ($(OS),Windows_NT)
	@DEL *.o *.map *_CODE.bin *_DATA.bin *_BSS.bin *_UNASSIGNED.bin *_disassembled.txt >nul 2>&1
else
	@$(RM) *.o *.map *_CODE.bin *_DATA.bin *_BSS.bin *_UNASSIGNED.bin *_disassembled.txt
endif