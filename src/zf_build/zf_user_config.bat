@ECHO OFF

REM Path to your z88dk installation.
SET Z88DK_DIR=C:\z88dk

REM COM port number of your serial communication interface.
SET COM_port=COM1

REM Use CRT startup code and zf_init code. Disable only when building
REM self-contained projects, e.g. zf_loader.asm.
SET use_startup=true

REM Optimize with maximum settings. Significantly increases compile time.
SET optimize=false

REM Build Z-Fighter libraries before building source.
REM Building of source only occurs following successful build of libraries.
SET build_lib=false

REM Disassemble output binary with z88dk-dis and open for inspection.
REM Skips transfer to zf_loader.
SET disassemble=false

REM Transfer output binary to zf_loader.
SET transfer=true

REM Following transfer to zf_loader, immediately display serial output from
REM Z-Fighter in console. Useful when writing debug text from Z-Fighter.
REM When true, overrides 'open_terminal' setting.
REM Does not support serial input from user.
SET console_output=true
SET console_new_window=false

REM Following transfer to zf_loader, open terminal in a new window
REM for serial input/output with Z-Fighter.
SET start_terminal=false

REM Clean up intermediate files following a sucessful build.
SET cleanup=true