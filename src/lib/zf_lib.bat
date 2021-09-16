@ECHO OFF

REM Build Z-Fighter library source files to .lib for Embedded_Z80 target
CD /D %~dp0
CALL %~dp0\..\zf_build\zf_build.bat %~dp0\zf_lib.lst -x