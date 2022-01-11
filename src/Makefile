# Makefile for Z-FIGHTER projects
# by Tangent 2021

# Targets:
#
# bin       Build Z-FIGHTER binary from .C and .ASM sources.
# libs      Build Z-FIGHTER library.
# send      Transfer .BIN to zf_loader.
# term      Open an interactive terminal for serial I/O with Z-FIGHTER. Uses plink (PuTTY).
# clean     Recursively clean intermediate binaries, assembly listings and symbol tables.
# cleaner   Recursively clean everything.

# Environment variables:
#
# name      Desired name of output binary. Defaults to current directory base name if unspecified.
# com_port  COM port of your serial communications device, e.g. COM1, /dev/ttyS1, /dev/ttyUSB1.
# startup   Use startup code. Default='true'
# compress  Use compressed ROM model with +z80 target. Default='false'
# opt       Enable optimization. Default='false'
# cpm       Build CP/M COM file with +cpm target. 

# Get path to this Makefile.
makefile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
zf_dir := $(dir $(makefile_path))

# Import local environment variables from .env file.
ifneq (,$(wildcard $(zf_dir).env))
	include $(zf_dir).env
	export
endif

# Assign base name of directory as program name if no name is specified.
name?:=             $(notdir $(CURDIR))

# Compiler settings. Uses z88dk/SDCC.
cc=                 zcc

target=             +z80

options=            -vn -clib=sdcc_iy -compiler=sdcc

pragma=             -pragma-define:CRT_ORG_CODE=0 $\
					-pragma-define:REGISTER_SP=-1 $\
					-pragma-define:CRT_ON_EXIT=0x10002 $\
					-pragma-define:CRT_ENABLE_STDIO=0 $\
					-pragma-define:CLIB_STDIO_HEAP_SIZE=0 $\

inc=                -I$(zf_dir)zf_lib $\
					-l$(zf_dir)zf_lib/zf_lib $\
					-Ca-l$(zf_dir)zf_lib/zf_lib -Ca-I=$(zf_dir)zf_lib $\
					-Cl-l$(zf_dir)zf_lib/zf_lib -Cl-I=$(zf_dir)zf_lib

init=               $(zf_dir)zf_lib/zf_init.asm
appmake=            -create-app
map=                -gen-map-file
output= 			$(name)

# Use maximum optimization if specified.
ifeq ($(opt),true)
	optimization=   -SO3 --max-allocs-per-node200000
endif

# Use +z80 compressed ROM model if specified. Otherwise, use uncompressed ROM model.
ifeq ($(compress),true)
	crt=            -startup=2
else
	crt=            -startup=1
endif

# Disable startup code if specified.
ifeq ($(startup),false)
	output:=		$(name).bin
	init=
	appmake=
	map=
endif

# Build +cpm COM file if specified.
ifeq ($(cpm),true)
	target=         +cpm
	output:=		$(name).com
	crt=
	pragma=
	appmake= 		-create-app
endif

ifeq ($(startup),false)
	crt= 			--no-crt
endif

SUBDIRS := $(wildcard zf_*/.)
.PHONY: all $(SUBDIRS)
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
	@$(cc) $(target) $(options) $(optimization) -c -I$(zf_dir)zf_lib --list --c-code-in-asm -o $@ $<

%_asm.o: %.asm $(HDR)
	@echo Making $<.
	@$(cc) $(target) $(options) -c -o $@ $< -I$(zf_dir)zf_lib --list

# Build a binary from source files.
bin: $(OBJ)
	@$(cc) $(target) $(options) $(crt) $(pragma) $(inc) $(init) $(appmake) $(map) -o $(output) $^

# Build a library from source files.
lib: $(OBJ)
	@$(cc) $(target) $(options) -x -o $(output) $^

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

ext_clean   :=  *_CODE.bin *_DATA.bin *_BSS.bin *_UNASSIGNED.bin *.lis *.map *.def *.err *.ticks_history.txt
ext_cleaner :=  zf_lib.lib *.bin *.rom  *.com *.o

# Recursively clean intermediate binaries, assembly listings and symbol tables.
clean:
ifeq ($(OS),Windows_NT)
	@DEL /S /Q $(ext_clean) >nul 2>&1
else
	@rm -f $(foreach ext,$(ext_clean),./**/$(ext))
endif

# Recursively clean everything.
cleaner: clean
ifeq ($(OS),Windows_NT)
	@DEL /S /Q $(ext_cleaner) >nul 2>&1
else
	@rm -f $(foreach ext,$(ext_cleaner),./**/$(ext))
endif