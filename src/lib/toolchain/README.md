### Description
Included here are some helpful batch files and a Tera Term macro for cross-development for Z-Fighter and other Grant Searle CP/M BIOS computers. 

### Requirements
Tera Term [[homepage](https://ttssh2.osdn.jp/index.html.en)]
z88dk [[homepage](https://z88dk.org/site/)]
XMODEM installation on CP/M storage device (ex. CompactFlash card)

### Setup
- Install `XMODEM.COM` on CP/M computer's A: drive. Refer to the *INSTALLING APPLICATIONS* instructions on [Grant Searle's page](http://searle.x10host.com/cpm/index.html).
- Set `Z88DK_DIR` in `z88dk_CPM.bat` to the location of your z88dk installation on your host machine.
- Set `TERA_TERM_DIR` in `zf_xmodem.bat` to the location of your Tera Term installation on your host machine.
- Ensure that `hardware` or `RTS/CTS` flow control is set in Tera Term's `Setup > Serial Port...` settings. Store these values to `TERATERM.INI` with `Setup > Save setup...`.

### Usage
- `z88dk_CPM.bat` accepts a C source file, compiles it to a CP/M .COM executable with z88dk, calls `zf_xmodem.bat` to transfer the file from the host machine to the CP/M computer and immediately executes it.
- `zf_xmodem.bat` can be used independently to easily transfer any file via XMODEM from your host machine using a Tera Term Macro. It accepts a full path to the file on your host machine that you wish to transfer. `zf_xmodem.ttl` automatically attempts to execute the received file by calling its base name. If this is not desired, comment out line 42 in `zf_xmodem.ttl`.