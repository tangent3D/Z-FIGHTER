# Import .env file if exists
ifneq (,$(wildcard ./.env))
    include .env
    export
endif

# Conditional example
ifeq ($(testvar),true)
	testtext=true!
else
	testtext=false!
endif

sources=$(wildcard *.c)
list=$(wildcard *.lst)
INCLUDE=D:\depot\Z-FIGHTER\src\lib
	
#environment variable example!
COMPRESSION := $(COMPRESSION)

PRAGMA=	-pragma-define:CRT_ORG_CODE=0 $\
		-pragma-define:REGISTER_SP=-1 $\
		-pragma-define:CRT_ON_EXIT=0x10002 $\
		-pragma-define:CRT_ENABLE_STDIO=0 $\
		-pragma-define:CLIB_STDIO_HEAP_SIZE=0

build:
	@echo ${testtext}
#	zcc +z80 -vn -startup=1 -clib=sdcc_iy -compiler=sdcc -I${INCLUDE}\src ${PRAGMA} -l${INCLUDE}\zf_lib ${sources} -o test -m -create-app ${list}