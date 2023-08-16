; CompactFlash implementation for Z-FIGHTER
; tangent.space 2023

EXTERN  CF0
EXTERN  CF1
EXTERN  CF2
EXTERN  CF3
EXTERN  CF4
EXTERN  CF5
EXTERN  CF6
EXTERN  CF7

SECTION code_user

PUBLIC _cfInit
_cfInit:
    CALL    cfWaitReady

    LD      A,04h
    OUT     (CF7),A

    CALL    cfWaitBusy

    LD      A,0E0h
    OUT     (CF6),A

    LD      A,01h           ; Enable 8-bit data transfers
    OUT     (CF1),A         ; Write Feature

    LD      A,0EFh          ; Set Feature
    OUT     (CF7),A         ; Write Command

    CALL    cfWaitBusy

    CALL    cfErrCk         ; Halt program execution if error detected

    RET

PUBLIC _cfRead              ; Read sector
_cfRead:
    LD      IY,2            ; Bypass return address of function
    ADD     IY,SP

    CALL    cfWaitBusy
    
    LD      A,(IY+0)        ; Set LBA with parameter (sector)
    OUT     (CF3),A
    LD      A,(IY+1)
    OUT     (CF4),A
    LD      A,(IY+2)
    OUT     (CF5),A
    LD      A,(IY+3)
    AND     0Fh             ; Mask 4 MSBs of LBA3 byte
    OR      0E0h            ; Set LBA mode, master
    OUT     (CF6),A

    LD      A,01h           ; 1 sector
    OUT     (CF2),A         ; Write to Sector count register
    LD      A,020h          ; Read Sector
    OUT     (CF7),A         ; Write to Command register

    CALL    cfErrCk
    CALL    cfWaitRead

    LD      HL,_cfBuffer    ; Initialize read loop
    LD      BC,512
rdLoop:
    IN      A,(CF0)
    LD      (HL),A
    INC     HL
    DEC     BC
    LD      A,C
    OR      B
    JP      NZ,rdLoop
    RET

cfWaitBusy:                 ; Wait until BSY reset:
    IN      A,(CF7)         ; Read Status register
    BIT     7,A
    JR      NZ,cfWaitBusy   ; Test BSY reset
    RET

cfWaitReady:                ; Wait until RDY set:
    IN      A,(CF7)         ; Read Status register
    BIT     6,A
    JR      Z,cfWaitReady   ; Test RDY set
    RET

cfWaitRead:
    IN      A,(CF7)         ; Read Status register
    CP      058h            ; Test DRDY, DSC, DRQ set
    JR      NZ,cfWaitRead
    RET

cfErrCk:
    IN      A,(CF7)
    BIT     0,A
    RET     Z

SECTION data_user

PUBLIC _cfBuffer
_cfBuffer:
    DS   512                ; Reserve 512 byte sector buffer
