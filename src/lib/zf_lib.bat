@ECHO OFF

REM Compile Z-Fighter library source files to .lib

CALL %~dp0\..\toolchain\config.bat

REM Compile library for Embedded_Z80 target
zcc +z80 -I%INC% -x -o zf_lib_embedded_z80 -compiler=sdcc @zf_lib.lst

REM Compile library for CP/M target
zcc +cpm -SO3 -clib=sdcc_iy --max-allocs-per-node200000 -I%INC% -x -o zf_lib_cpm @zf_lib.lst