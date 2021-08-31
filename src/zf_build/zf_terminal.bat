@ECHO OFF

REM Open a simple terminal for serial input/output with Z-Fighter.

CALL %~dp0\zf_config.bat

START "Z-Fighter Terminal" plink -serial \\.\%COM_port% -sercfg 115200,8,n,1,N