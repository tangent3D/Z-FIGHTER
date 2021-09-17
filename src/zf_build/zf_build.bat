@ECHO OFF

REM Build a source file to a 'ROM model' .BIN for Z-Fighter. Passes output to zf_loader.bat.
REM C sources will be compiled with z88dk/sdcc. ASM sources will be assembled with z80asm.
REM Programs can be run more than once with correct initial state.
REM Uses configuration options from zf_config.bat.

REM Inform user if no source file is defined.
IF [%1] == [] GOTO error_file

SET source=%1
SET name=%~n1
SET ext=%~x1
SET arg=%2

REM Perform error checking for source file type.
IF NOT %ext% == .c IF NOT %ext% == .asm IF NOT %ext% == .lst GOTO error_type

REM Load user settings from zf_config.
CALL %~dp0\zf_user_config.bat

REM Paths to Z-Fighter libraries. Automatically obtained from repository's directory structure.
SET LIBPATH=%~dp0\..\lib
SET INC=%~dp0\..\lib\src
SET ZCCCFG=%Z88DK_DIR%\lib\config
SET PATH=%Z88DK_DIR%\bin;%PATH%
SET PATH=%~dp0;%PATH%

REM If specified, build Z-Fighter libraries before building source.
IF %build_lib% == true IF NOT %name% == zf_lib (
    SETLOCAL
    CALL %~dp0\..\lib\zf_lib.bat
    ENDLOCAL
)

REM Inform user of filename and build tool.
IF NOT %ext% == .asm ECHO Compiling %name%%ext% with z88dk/sdcc.
IF %ext% == .asm ECHO Assembling %name%%ext% with z80asm.

REM Define %startup%
SET startup=-startup=1

REM Define %optimization%
IF %optimize% == true SET optimization=-opt=-SO3 --max-allocs-per-node200000
IF %optimize% == false SET optimization=

REM Define %pragma%
REM For use with zf_loader.
REM "Do not change stack location. Return to caller on exit."
SET pragma=-pragma-define:REGISTER_SP=-1 -pragma-define:CRT_ON_EXIT=0x10002

REM Define assembler and linker options.
SET asmopt=-Ca-l%LIBPATH%\zf_lib -Ca-I=%INC%
SET linkopt=-Cl-l%LIBPATH%\zf_lib -Cl-I=%INC%

SET output=%name%

SET appmake=-create-app

IF %ext% == .asm IF %asm_use_crt% == false (
    SET startup=--no-crt
    SET init=
    SET output=%name%.bin
    SET appmake=
)

REM Replace source with list when using a .lst file.
REM Also, check for a .lst file of same name as source and use it instead of source.
IF %ext% == .lst (
    SET list=@%source%
    SET source=
)
IF EXIST %name%.lst (
    SET list=@%name%.lst
    SET source=
    ECHO Using list file %name%.lst.
)

:build
REM Compile/assemble the source with z88dk/z80asm.
zcc +z80 -vn %startup% %optimization% %asmopt% %linkopt% -clib=sdcc_iy -I%INC% %pragma% %include% %arg% -L%LIBPATH% -l%LIBPATH%\zf_lib %source% %INC%\zf_init.asm -o %output% -m %appmake% %list%

IF %errorlevel% NEQ 0 GOTO error_compile

REM Check if any unassigned bytes.
IF EXIST %name%_UNASSIGNED.bin (
    FOR %%i in (%name%_UNASSIGNED.bin) do (
        IF %%~z%i GTR 0 (
            SET unassigned=%%~z%i
            GOTO error_unassigned
        )
    )
)

REM Disassemble the output binary and open the resulting text file.
IF %disassemble% == true IF NOT %name% == zf_lib (
SET transfer=false
z88dk-dis -o 0x0000 -x %name%.map %name%.bin > %name%_disassembled.txt
%name%_disassembled.txt
)

REM Delete unused files
DEL %name% >nul 2>&1
DEL %name%.rom >nul 2>&1
DEL %name%_CODE.bin >nul 2>&1
DEL %name%_DATA.bin >nul 2>&1
DEL %name%_BSS.bin >nul 2>&1
DEL %name%_UNASSIGNED.bin >nul 2>&1
DEL %name%.map >nul 2>&1
DEL %name%_disassembled.txt >nul 2>&1

REM Skip transfer to zf_loader when building Z-Fighter libraries.
IF %name% == zf_lib EXIT /B

:transfer
REM Pass output as argument to zf_loader.bat
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
