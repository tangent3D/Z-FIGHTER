name = fat_sandbox
objects = $(addsuffix .o, $(basename $(wildcard *.c)))

default: ${objects}
	del $(name).exe
	gcc ${objects} -o $(name).exe
	run0.bat

%.o: %.c
	gcc -Wall -c $< -o $@

clean:
	del $(subst /,\,${objects})
