@ECHO OFF

CALL %~dp0\..\zf_user_config.bat

SET PATH=%Z88DK_DIR%\bin;%PATH%

COPY %Z88DK_DIR%\lib\z80_crt0.hdr "%Z88DK_DIR%\libsrc\_DEVELOPMENT" >nul 2>nul
COPY config_cpu.m4 "%Z88DK_DIR%\libsrc\_DEVELOPMENT\target\z80\config" >nul 2>nul

CD /D %Z88DK_DIR%\libsrc\_DEVELOPMENT\
CALL Winmake.bat z80

DEL "%Z88DK_DIR%\libsrc\_DEVELOPMENT\z80_crt0.hdr" >nul 2>nul

