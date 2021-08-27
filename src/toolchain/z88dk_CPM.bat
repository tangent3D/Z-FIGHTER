@ECHO OFF

REM Compile a C source file to a CP/M COM executable with z88dk/zsdcc

CALL %~dp0\config.bat

REM Get/define filename of argument/source file to use as filename for output.
REM CP/M allows filenames with a maximum of eight characters.
SET mysource=%~n1

REM Compile a source file e.g. 'mysource.C' or compile a list of source files e.g. 'mysource.LST' if existent
REM Add "-lm" to link in generic Z80 maths library if required
if exist %mysource%.lst (
ECHO [Compiling list file %mysource%.lst with z88dk for CP/M]
SET list=@%mysource%.lst
SET source=
) else (
ECHO [Compiling %mysource%.c with z88dk for CP/M]
SET source=%mysource%.c
SET list=
)

zcc +cpm -SO3 -clib=sdcc_iy --max-allocs-per-node200000 -I%INC% -L%LIBPATH% -lzf_lib_cpm -o "%mysource%.com" %source% -create-app %list%

REM Send executable to Z-Fighter only if compilation succeeds
if %ERRORLEVEL% == 0 (
    echo [Compilation succeeded!]
    ZF_XMODEM %cd%\%mysource%.com %mysource%.com
) else if %ERRORLEVEL% == 1 (b
    echo [Compilation failed!]
)

REM Clean up intermediate files
del %mysource%_CODE.bin >nul 2>&1
del %mysource%_DATA.bin >nul 2>&1
del %mysource%_BSS.bin >nul 2>&1
del %mysource%_UNASSIGNED.bin >nul 2>&1
