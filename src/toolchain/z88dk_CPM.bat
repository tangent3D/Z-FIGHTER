@ECHO OFF

REM Compile a .c source file to a CP/M .COM executable with z88dk/zsdcc

CALL %~dp0\config.bat

REM Get/define filename of argument/source file to use as filename for output
SET mysource=%~n1

ECHO [Compiling %mysource%.c with z88dk for CP/M]

zcc +cpm -I%INC% -L%LIBPATH% -lzf_lib_cpm -o "%mysource%.com" %mysource%.c -compiler=sdcc

REM Send executable to Z-Fighter only if compilation succeeds
if %ERRORLEVEL% == 0 (
    echo [Compilation succeeded!]
    ZF_XMODEM %cd%\%mysource%.com %mysource%.com
) else if %ERRORLEVEL% == 1 (
    echo [Compilation failed!]
)