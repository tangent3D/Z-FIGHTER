name=cf_test
export

default: libs bin send

libs:
	@make -s -f ../Makefile libs
bin:
	@make -s -f ../Makefile bin
send:
	@make -s -f ../Makefile send
	@z80com --port COM7 --dump
	@hd dump.bin
