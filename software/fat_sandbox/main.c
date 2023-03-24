#include <stdio.h>
#include "sandbox.h"

unsigned char fat16SectorsPerCluster;
int fat16SectorsReserved;

unsigned char fat16Init()
{
    // ref: http://elm-chan.org/docs/fat_e.html

    // "You can set something else, but some FAT drivers may not recognize that volume."
    const int start=65536;
    if(disk[start+ 3]!='M')return 1;
    if(disk[start+ 4]!='S')return 1;
    if(disk[start+ 5]!='D')return 1;
    if(disk[start+ 6]!='O')return 1;
    if(disk[start+ 7]!='S')return 1;
    if(disk[start+ 8]!='5')return 1;
    if(disk[start+ 9]!='.')return 1;
    if(disk[start+10]!='0')return 1;

    // "many FAT drivers assume the sector size is 512 and do not check this field"
    int bytesPerSector=disk[start+11]+disk[start+12]*256;
    if(bytesPerSector!=512)return 2;

    fat16SectorsPerCluster=disk[start+13];

    fat16SectorsReserved=disk[start+14]+disk[start+15]*256;

    // "The value of this field should always be 2"
    if(disk[start+16]!=2)return 3;

    // "this field should be set to 512 on the FAT16 volume"
    int rootEntryCount=disk[start+17]+disk[start+18]*256;
    if(rootEntryCount!=512)return 4;

    int sectors=disk[start+19]+disk[start+20]*256;
    if(sectors==0)sectors=disk[start+32]+disk[start+33]*256+disk[start+34]*256*256+disk[start+35]*256*256*256;
    printf("// sectors=%d\n",sectors);

    int sectorsPerFat=disk[start+22]+disk[start+23]*256;
    printf("// sectorsPerFat=%d\n",sectorsPerFat);

    int sectorsHidden=disk[start+28]+disk[start+29]*256+disk[start+30]*256*256+disk[start+31]*256*256*256;
    printf("// sectorsHidden=%d\n",sectorsHidden);

    // "11-byte volume label"
    printf("// label=%c%c%c%c%c%c%c%c%c%c%c\n",disk[start+43],disk[start+44],disk[start+45],disk[start+46],disk[start+47],disk[start+48],disk[start+49],disk[start+50],disk[start+51],disk[start+52],disk[start+53]);

    // TODO

    return 0;
}

int main(int argc,char* args[])
{
    sandboxInit();

    unsigned char fat16InitError=fat16Init();
    if(fat16InitError){
        printf("fat16 init error %d: ",fat16InitError);
        if     (fat16InitError==1)printf("oem name not MSDOS5.0\n");
        else if(fat16InitError==2)printf("sector size not 512\n");
        else if(fat16InitError==3)printf("fat count not 2\n");
        else if(fat16InitError==4)printf("root entry count not 512\n");
        else printf("unknown\n");
        return 1;
    }
    printf("fat16SectorsPerCluster=%d\n",fat16SectorsPerCluster);
    printf("fat16SectorsReserved=%d\n",fat16SectorsReserved);

    show(0x0004E080);
    show(0x00053800);
    if(disk[0x0004E080]=='P')printf("beep\n");

    sandboxUninit();
    return 0;
}
