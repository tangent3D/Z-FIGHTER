@ECHO OFF

REM Compile a .c source file to an Embedded_Z80 ROM model binary with z88dk/zsdcc

CALL %~dp0\config.bat

REM Get/define filename of argument/source file to use as filename for output
SET mysource=%~n1

ECHO [Compiling %mysource%.c with z88dk for Embedded_Z80]

zcc +z80 -vn -SO3 -startup=1 -clib=sdcc_iy --max-allocs-per-node200000 -I%INC% -L%LIBPATH% -lzf_lib_embedded_z80 %mysource%.c -o "%mysource%" -lm -create-app

REM Concatenate output binaries
COPY /B %mysource%_CODE.bin + %mysource%_DATA.bin %mysource%.bin

REM Clean up outputs, REM if debugging
del %mysource%_CODE.bin >nul 2>&1
del %mysource%_DATA.bin >nul 2>&1
del %mysource%_BSS.bin >nul 2>&1
del %mysource%_UNASSIGNED.bin >nul 2>&1

if %ERRORLEVEL% == 0 (
    echo [Compilation succeeded!]
) else if %ERRORLEVEL% == 1 (
    echo [Compilation failed!]
)