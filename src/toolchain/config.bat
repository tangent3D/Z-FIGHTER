REM Path to your z88dk installation
SET Z88DK_DIR=C:\z88dk

REM Path to Tera Term executable:
SET TERA_TERM_DIR=C:\Program Files (x86)\teraterm

REM Paths to Z-Fighter libraries

SET LIBPATH=%~dp0\..\lib
SET INC=%~dp0\..\lib\src

SET ZCCCFG=%Z88DK_DIR%\lib\config
SET PATH=%Z88DK_DIR%\bin;%PATH%
SET PATH=%~dp0;%PATH%