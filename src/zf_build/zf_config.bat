@ECHO OFF

REM Path to your z88dk installation
SET Z88DK_DIR=C:\z88dk

REM Paths to Z-Fighter libraries
SET LIBPATH=%~dp0\..\lib
SET INC=%~dp0\..\lib\src

SET ZCCCFG=%Z88DK_DIR%\lib\config
SET PATH=%Z88DK_DIR%\bin;%PATH%
SET PATH=%~dp0;%PATH%

REM COM port number of your serial communication interface.
SET COM_port=COM1

REM Disassemble output binary with z88dk-dis and open for inspection.
REM Uses .MAP file. Skips transfer to zf_loader.
SET disassemble=false

REM Transfer output binary to zf_loader.
SET transfer=true

REM Following transfer to zf_loader, immediately display serial output from
REM Z-Fighter in console. Useful when writing debug text from Z-Fighter.
REM When true, overrides 'open_terminal' setting.
REM Does not support serial input from user.
SET console_output=true
SET console_in_new_window=false

REM Following transfer to zf_loader, open terminal in a new window
REM for serial input/output with Z-Fighter.
SET start_terminal=false