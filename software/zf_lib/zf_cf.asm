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
    CALL    cfWaitBusy
    LD      A,01h           ; Enable 8-bit data transfers
    OUT     (CF1),A         ; Write Feature
    LD      A,0EFh          ; Set Feature
    OUT     (CF7),A         ; Write Command
    CALL    cfWaitBusy
    LD      A,082h          ; Disable write cache
    OUT     (CF1),A         ; Write Feature
    LD      A,0EFh          ; Set Feature
    OUT     (CF7),A         ; Write Command
    RET

PUBLIC _cfIdentify          ; Retrieve information about card to sector buffer
_cfIdentify:
    CALL    cfWaitBusy
    CALL    cfWaitReady
    LD      A,0ECh          ; Identify Drive
    OUT     (CF7),A         ; Write Command
    CALL    cfWaitBusy
    CALL    cfWaitDRQ

    ; FIXME: Test error flags before read?

    LD      HL,_cfBuffer    ; Initialize read loop
    LD      BC,512
idLoop:
    IN      A,(CF0)
    LD      (HL),A
    INC     HL
    DEC     BC
    LD      A,C
    OR      B
    JP      NZ,idLoop
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

cfWaitDRQ:                  ; Wait until DRQ (Data Request) set:
    IN      A,(CF7)         ; Read Status register
    BIT     3,A
    JR      Z,cfWaitDRQ     ; Test DRQ set
    RET

SECTION data_user

PUBLIC _cfBuffer    
_cfBuffer:
    DS   512                ; Reserve 512 byte sector buffer

