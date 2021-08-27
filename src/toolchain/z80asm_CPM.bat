@ECHO OFF

REM Assemble an ASM source file to a CP/M COM file with z88dk/z80asm
REM Inclusion of Z-Fighter library ASM source files is supported.

CALL %~dp0\config.bat

REM Get/define filename of argument/source file to use as filename for output.
REM CP/M allows filenames with a maximum of eight characters.
SET mysource=%~n1

zcc +cpm --no-crt -Ca-I=%INC% %mysource%.asm -lzf_lib_cpm -o %mysource%.com -create-app

REM Send executable to Z-Fighter only if assembly succeeds
if %ERRORLEVEL% == 0 (
    echo [Assembly succeeded!]
    ZF_XMODEM %cd%\%mysource%.com %mysource%.com
) else if %ERRORLEVEL% == 1 (b
    echo [Assembly failed!]
)