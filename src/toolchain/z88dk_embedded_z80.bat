@ECHO OFF

REM Compile a .c source file to an Embedded_Z80 binary with z88dk/zsdcc

CALL %~dp0\config.bat

REM Get/define filename of argument/source file to use as filename for output
SET mysource=%~n1

ECHO [Compiling %mysource%.c with z88dk for Embedded_Z80]

zcc +z80 -I%INC% -L%LIBPATH% -lzf_lib_embedded_z80 -o "%mysource%.com" %mysource%.c -compiler=sdcc