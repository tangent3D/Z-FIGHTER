@ECHO OFF
SET Z88DK_DIR=D:\Dropbox\Projects\Z-FIGHTER\DevTools\z88dk\
SET ZCCCFG=%Z88DK_DIR%lib\config\
SET PATH=%Z88DK_DIR%bin;%PATH%
SET PATH=D:\Dropbox\Projects\Z-FIGHTER\DevTools;%PATH%

SET mysrc=%1

ECHO [Compiling %mysrc%.c with z88dk for generic Z80]

zcc +z80 -vn -O3 -clib=new %mysrc%.c -o %mysrc% -lm -create-app -compiler=sdcc