@ECHO OFF

REM Open a simple terminal for serial input/output with Z-Fighter.

REM Load user settings from zf_config.
CALL %~dp0\zf_config.bat

REM Terminate any existing instances of plink.
taskkill /IM "plink.exe" /T /F >nul 2>&1

REM Test if specified COM port is available.
MODE %COM_port%: BAUD=115200 PARITY=N DATA=8 STOP=1 OCTS=OFF DTR=OFF RTS=OFF >nul
IF %errorlevel% NEQ 0 GOTO error_com_port

START "Z-Fighter Terminal" plink -serial \\.\%COM_port% -sercfg 115200,8,n,1,N
EXIT

:error_com_port
ECHO Cannot connect to %COM_port%.
PAUSE >nul