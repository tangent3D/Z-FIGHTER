@ECHO OFF

REM Assemble an ASM source file to an Embedded_Z80 binary z88dk/z80asm
REM Inclusion of Z-Fighter library ASM source files is supported.

CALL %~dp0\config.bat

REM Get/define filename of argument/source file to use as filename for output.
REM CP/M allows filenames with a maximum of eight characters.
SET mysource=%~n1

zcc +z80 --no-crt -Ca-I=%INC% %mysource%.asm -o %mysource%.bin

if %ERRORLEVEL% == 0 (
REM Concatenate output binaries
COPY /B %mysource%_CODE.bin + %mysource%_DATA.bin %mysource%.bin >nul 2>&1    
)

REM Clean up outputs, REM if debugging
del %mysource%_CODE.bin >nul 2>&1
del %mysource%_DATA.bin >nul 2>&1
del %mysource%_BSS.bin >nul 2>&1
del %mysource%_UNASSIGNED.bin >nul 2>&1