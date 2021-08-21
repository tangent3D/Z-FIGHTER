@ECHO OFF

REM Compile Z-Fighter library source files to .lib

CALL %~dp0\..\toolchain\config.bat

REM Compile library for Embedded_Z80 target
zcc +z80 -x -o zf_lib_embedded_z80 -compiler=sdcc @zf_lib.lst

REM Compile library for CP/M target
zcc +cpm -x -o zf_lib_cpm -compiler=sdcc @zf_lib.lst