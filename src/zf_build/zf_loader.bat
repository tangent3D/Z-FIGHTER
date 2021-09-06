@ECHO OFF

REM Transfer a .BIN to zf_loader via the COM port specified in zf_config.bat.

REM Inform user if no binary file is defined.
IF [%1] == [] GOTO error_file

REM Load user settings from zf_config.
CALL %~dp0\zf_config.bat

IF %transfer% == false EXIT /B

SET bin=%1
SET name=%~n1
SET ext=%~x1

REM Perform error checking for .bin file type.
IF NOT %ext% == .bin GOTO error_type

ECHO Transferring %bin% to zf_loader.

REM Terminate any existing instances of plink.
taskkill /IM "plink.exe" /T /F >nul 2>&1

REM Test if specified COM port is available and configure it for
REM communication with Z-Fighter.
MODE %COM_port%: BAUD=115200 PARITY=N DATA=8 STOP=1 OCTS=OFF DTR=OFF RTS=OFF >nul
IF %errorlevel% NEQ 0 GOTO error_com_port

IF %console_output% == true goto transfer_console

:transfer
COPY %bin% \\.\%COM_port% >nul 2>&1
IF %start_terminal% == true GOTO start_terminal
EXIT /B

REM && EXIT 0
:transfer_console
REM Transfer a .BIN to Z-Fighter and immediately display its console output.
IF %console_new_window% == false plink -serial \\.\%COM_port% -sercfg 115200,8,n,1,N < %bin% EXIT /B
IF %console_new_window% == true START "Z-Fighter Console Output" cmd /c "plink -serial \\.\%COM_port% -sercfg 115200,8,n,1,N < %bin%" && EXIT /B 0

:start_terminal
REM Open a terminal window for serial I/O with Z-Fighter following the transfer.
zf_terminal.bat
EXIT /B

:error_file
ECHO Please provide a file to transfer to Z-Fighter.
GOTO :error_type

:error_type
ECHO Only .BIN files are supported.
PAUSE >nul
EXIT /B

:error_com_port
ECHO Cannot connect to %COM_port%.
PAUSE >nul
EXIT /B