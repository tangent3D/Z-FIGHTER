@ECHO OFF

REM Transfer a .BIN to zf_loader via the COM port specified in zf_config.bat.

REM Inform user if no binary file is defined.
IF [%1] == [] GOTO error_file

CALL %~dp0\zf_config.bat

IF %transfer% == false EXIT

SET bin=%1
SET name=%~n1
SET ext=%~x1

REM Perform error checking for .bin file type
IF NOT %ext% == .bin GOTO error_type

REM Terminate any existing instances of plink
taskkill /IM "plink.exe" /T /F >nul 2>&1

ECHO Transferring %bin% to zf_loader.

IF %console_output% == true GOTO transfer_console

:transfer
MODE %COM_port%: BAUD=115200 PARITY=N DATA=8 STOP=1 OCTS=OFF DTR=OFF RTS=OFF >nul
COPY %bin% \\.\%COM_port% >nul
IF %start_terminal% == true GOTO start_terminal
EXIT

:transfer_console
REM Transfer a .BIN to Z-Fighter and immediately display its console output.
IF %console_in_new_window% == false plink -serial \\.\%COM_port% -sercfg 115200,8,n,1,N < %bin% EXIT
IF %console_in_new_window% == true START "Z-Fighter Console Output" cmd /c "plink -serial \\.\%COM_port% -sercfg 115200,8,n,1,N < %bin%" && EXIT 0
EXIT

:start_terminal
REM Open a terminal window for serial I/O with Z-Fighter following the transfer.
zf_terminal.bat
EXIT

:error_file
ECHO No binary file defined.
EXIT

:error_type
ECHO Only .BIN files are supported by zf_loader.
EXIT