@ECHO OFF

IF [%1] == [] GOTO error_file

SET source=%1
SET name=%~n1
SET ext=%~x1

IF NOT %ext% == .c IF NOT %ext% == .asm IF NOT %ext% == .lst GOTO error_type

REM Embedded_Z80 uncompressed ROM model
SET startup=-startup=1
REM Stack pointer unchanged on startup. Return to caller on exit. Disable stdio. No stdio heap.
SET pragma=-pragma-define:CRT_ORG_CODE=0 -pragma-define:REGISTER_SP=-1 -pragma-define:CRT_ON_EXIT=0x10002 -pragma-define:CRT_ENABLE_STDIO=0 -pragma-define:CLIB_STDIO_HEAP_SIZE=0
SET optimization=-opt=-SO3 --max-allocs-per-node200000
SET output=%name%
SET appmake=-create-app


CALL %~dp0\zf_user_config.bat

SET ZCCCFG=%Z88DK_DIR%\lib\config
SET PATH=%Z88DK_DIR%\bin;%PATH%
SET PATH=%~dp0;%PATH%
SET LIBPATH=%~dp0\..\lib
SET LIB=-l%LIBPATH%\zf_lib
SET INC=%~dp0\..\lib\src
SET asmopt=-Ca-l%LIBPATH%\zf_lib -Ca-I=%INC%
SET linkopt=-Cl-l%LIBPATH%\zf_lib -Cl-I=%INC%
SET init=%INC%\zf_init.asm

IF %optimize% == false SET optimization=

IF %build_lib% == true IF NOT %name% == zf_lib (
    SETLOCAL
    CALL %~dp0\..\lib\zf_lib.bat
    ENDLOCAL
)

IF %name% == zf_lib (
    SET arg=-x
    SET lib=
    SET asmopt=
    SET linkopt=
    SET disassemble=false
    SET transfer=false
)

IF %use_startup% == false (
    SET startup=--no-crt
    SET init=
    SET appmake=
    SET output=%name%.bin
)

:build
IF NOT %ext% == .lst ECHO Building %name%%ext% with z88dk/sdcc.

IF %ext% == .lst (
    ECHO Building list file %name%%ext% with z88dk/sdcc.
    SET list=@%source%
    SET source=
)

zcc +z80 -vn %startup% %optimization% %asmopt% %linkopt% -clib=sdcc_iy -compiler=sdcc -I%INC% %pragma% %include% %lib% %arg% %init% %source% -o %output% -m %appmake% %list%

:check_errors
IF %errorlevel% NEQ 0 GOTO error_compile

IF EXIST %name%_UNASSIGNED.bin (
    FOR %%i in (%name%_UNASSIGNED.bin) do (
        IF %%~z%i GTR 0 (
            SET unassigned=%%~z%i
            GOTO error_unassigned
        )
    )
)

:disassemble
IF %disassemble% == true (
    SET transfer=false
    z88dk-dis -o 0x0000 -x %name%.map %name%.bin > %name%_disassembled.txt
    %name%_disassembled.txt
)

:cleanup
IF %cleanup% == true (
    DEL %name% >nul 2>&1
    DEL %name%.rom >nul 2>&1
    DEL %name%_CODE.bin >nul 2>&1
    DEL %name%_DATA.bin >nul 2>&1
    DEL %name%_BSS.bin >nul 2>&1
    DEL %name%_UNASSIGNED.bin >nul 2>&1
    DEL %name%.map >nul 2>&1
    DEL %name%_disassembled.txt >nul 2>&1
)

:transfer
IF %transfer% == true zf_loader.bat %name%.bin
EXIT /B

:error_file
ECHO Please provide a source file.
GOTO :error_type

:error_type
ECHO Supported source files are .C, .ASM and .LST.
PAUSE >nul
EXIT /B

:error_compile
ECHO Build failed.
PAUSE >nul
EXIT /B

:error_unassigned
ECHO Error: %name%_UNASSIGNED.bin contains %unassigned% unassigned bytes.
PAUSE >nul
EXIT /B
