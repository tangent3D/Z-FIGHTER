@ECHO OFF

REM Compile Z-Fighter library source files to .lib

CALL %~dp0\..\toolchain\config.bat

REM Compile library for Embedded_Z80 target
ECHO Compiling Z-Fighter libs for Embedded_Z80 target...
zcc +z80 -SO3 -clib=sdcc_iy --max-allocs-per-node200000 -I%INC% -x -o zf_lib_z80 @zf_lib.lst

REM Compile library for CP/M target
ECHO Compiling Z-Fighter libs for CP/M target...
zcc +cpm -SO3 -clib=sdcc_iy --max-allocs-per-node200000 -I%INC% -x -o zf_lib_cpm @zf_lib.lst