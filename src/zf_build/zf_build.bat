@ECHO OFF

REM Build a source file to a 'ROM model' .BIN for Z-Fighter. Passes output to zf_loader.bat.
REM C sources will be compiled with z88dk/sdcc. ASM sources will be assembled with z80asm.
REM Programs can be run more than once with correct initial state.
REM Uses configuration options from zf_config.bat.

SET source=%1
SET name=%~n1
SET ext=%~x1

REM Perform error checking for source file type.
IF NOT %ext% == .c IF NOT %ext% == .asm GOTO error_type

CALL %~dp0\zf_config.bat

REM Define %startup%
SET startup=-startup=1
IF %ext% == .asm SET startup=--no-crt

REM Define %lib%
REM Configure z88dk to use "new" C library and sdcc as compiler
IF %ext% == .c SET lib=-clib=sdcc_iy

REM Define %pragma%
REM For use with zf_loader.
REM "Do not change stack location. Return to caller on exit."
IF %ext% == .c SET pragma=-pragma-define:REGISTER_SP=-1 -pragma-define:CRT_ON_EXIT=0x10002

REM Define %include%
IF %ext% == .c SET include=-I%INC% -L%LIBPATH%

REM Define %zf_lib%
REM Include Z-Fighter C library for z88dk projects.
IF %ext% == .c SET zf_lib=-lzf_lib_z80

REM Define %output%
SET output=%name%
IF %ext% == .asm SET output=%name%.bin

REM Define %list%
REM Check for a .lst file of same name and use it instead of source.
IF NOT %ext% == .asm (
    IF EXIST %name%.lst (
        SET list=@%name%.lst
        SET source=
        ECHO Using list file %name%.lst.
    )
)

REM Compile/assemble the source with z88dk/z80asm.
zcc +z80 -vn %startup% -opt=-SO3 --max-allocs-per-node200000 -Ca-I=%INC% %lib% %pragma% %include% %zf_lib% %source% -o %output% -m -create-app %list%

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
IF %disassemble% == true (
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

:transfer
REM Pass output as argument to zf_loader.bat
IF %transfer% == true zf_loader.bat %name%.bin

EXIT

:error_source
ECHO No source file.
EXIT

:error_type
ECHO Supported source types are .C and .ASM.
EXIT

:error_compile
EXIT

:error_unassigned
ECHO Error: %name%_UNASSIGNED.bin contains %unassigned% unassigned bytes.
