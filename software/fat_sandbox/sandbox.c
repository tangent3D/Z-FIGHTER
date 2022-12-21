#include <stdio.h>
#include <stdlib.h>
#include "diskimage.h"
#include "sandbox.h"

const char*    diskImageFileName="poker.img";
const int      diskImageFileSize=127926272;
unsigned char* disk=NULL;

void sandboxInit()
{
    printf("loading %s: ",diskImageFileName);
    disk=malloc(diskImageFileSize);
    const char* message=diskImageLoad(diskImageFileName,diskImageFileSize,disk);
    if(message==NULL){printf("ok\n");                           }
    else             {printf("%s\n",message);free(disk);exit(1);}
}

void sandboxUninit()
{
    if(disk!=NULL){free(disk);disk=NULL;}
}

void show(int address)
{
    printf("0x%x: ",address);
    for(int i=address;i<address+32;i++)
    {
        if(i>=diskImageFileSize)break;
        if(disk[i]<32||disk[i]==127||disk[i]==255)printf("[%u]",disk[i]);
        else                                      printf("%c",disk[i]);
    }
    printf("\n");
}
