@ECHO OFF

REM Compile a CP/M .COM executable with z88dk [compiler = sdcc]

REM Path to your z88dk installation
SET Z88DK_DIR=C:\z88dk

REM Path to Z-Fighter libraries
SET INC1=%~dp0\..

SET ZCCCFG=%Z88DK_DIR%\lib\config\
SET PATH=%Z88DK_DIR%\bin;%PATH%
SET PATH=%~dp0;%PATH%

REM Get filename of argument [C source]
SET mysource=%~n1

ECHO [Compiling %mysource%.c with z88dk for CP/M]

zcc +cpm -lm -I%INC1% -o "%mysource%.com" %mysource%.c -compiler=sdcc

REM Send executable to Z-Fighter only if compilation succeeds
if %ERRORLEVEL% == 0 (
    echo [Compilation succeeded!]
    ZF_XMODEM %cd%\%mysource%.com %mysource%.com
) else if %ERRORLEVEL% == 1 (
    echo [Compilation failed!]
)