// module implementation for z-fighter application "menu"
// by xrrawva 2023

#include <string.h>
#include "fat16.h"

// read 1 byte from cf
unsigned char disk(unsigned long address)
{
    return 0; // TODO
}

// fat16
const unsigned long start=65536; // TODO: why?
unsigned char sectorsPerCluster;
unsigned int reservedSectors;
unsigned long sectors;
unsigned int sectorsPerFat;
unsigned long sectorsHidden;
unsigned int fatStartSector;
unsigned long fatSectors;
unsigned long rootDirStartSector;
unsigned char rootDirSectors;
unsigned long dataStartSector;
unsigned long dataSectors;

unsigned char fat16Init()
{
    // ref: http://elm-chan.org/docs/fat_e.html

    // "You can set something else, but some FAT drivers may not recognize that volume."
    if(disk(start+ 3)!='M')return 1;
    if(disk(start+ 4)!='S')return 1;
    if(disk(start+ 5)!='D')return 1;
    if(disk(start+ 6)!='O')return 1;
    if(disk(start+ 7)!='S')return 1;
    if(disk(start+ 8)!='5')return 1;
    if(disk(start+ 9)!='.')return 1;
    if(disk(start+10)!='0')return 1;

    // "many FAT drivers assume the sector size is 512 and do not check this field"
    unsigned int bytesPerSector=disk(start+11)+disk(start+12)*256;
    if(bytesPerSector!=512)return 2;

    sectorsPerCluster=disk(start+13);

    reservedSectors=disk(start+14)+disk(start+15)*256;

    // "The value of this field should always be 2"
    if(disk(start+16)!=2)return 3;

    // "this field should be set to 512 on the FAT16 volume"
    unsigned int rootEntryCount=disk(start+17)+disk(start+18)*256;
    if(rootEntryCount!=512)return 4;

    sectors=disk(start+19)+disk(start+20)*256;
    if(sectors==0)sectors=disk(start+32)+disk(start+33)*256+disk(start+34)*(unsigned long)256*256+disk(start+35)*(unsigned long)256*256*256;

    sectorsPerFat=disk(start+22)+disk(start+23)*256;

    sectorsHidden=disk(start+28)+disk(start+29)*256+disk(start+30)*(unsigned long)256*256+disk(start+31)*(unsigned long)256*256*256;

    fatStartSector=reservedSectors;
    fatSectors=sectorsPerFat*2;
    rootDirStartSector=fatStartSector+fatSectors;
    rootDirSectors=33;
    dataStartSector=rootDirStartSector+rootDirSectors-9; // TODO: why 9?
    dataSectors=sectors-dataStartSector;

    return 0;
}

char fat16GetFileNameResult[13];
void fat16GetFileName(unsigned char fileI)
{
    fat16GetFileNameResult[ 0]=disk(start+rootDirStartSector*512+32*fileI+ 0); // TODO: shift instead of multiply everywhere?
    fat16GetFileNameResult[ 1]=disk(start+rootDirStartSector*512+32*fileI+ 1);
    fat16GetFileNameResult[ 2]=disk(start+rootDirStartSector*512+32*fileI+ 2);
    fat16GetFileNameResult[ 3]=disk(start+rootDirStartSector*512+32*fileI+ 3);
    fat16GetFileNameResult[ 4]=disk(start+rootDirStartSector*512+32*fileI+ 4);
    fat16GetFileNameResult[ 5]=disk(start+rootDirStartSector*512+32*fileI+ 5);
    fat16GetFileNameResult[ 6]=disk(start+rootDirStartSector*512+32*fileI+ 6);
    fat16GetFileNameResult[ 7]=disk(start+rootDirStartSector*512+32*fileI+ 7);
    fat16GetFileNameResult[ 8]='.';
    fat16GetFileNameResult[ 9]=disk(start+rootDirStartSector*512+32*fileI+ 8);
    fat16GetFileNameResult[10]=disk(start+rootDirStartSector*512+32*fileI+ 9);
    fat16GetFileNameResult[11]=disk(start+rootDirStartSector*512+32*fileI+10);
    fat16GetFileNameResult[12]='\0';
}

unsigned char fat16LoadFile(unsigned char fileI, unsigned char* targetAddress)
{
    unsigned long remainingFileSize=disk(start+rootDirStartSector*512+32*fileI+28)+disk(start+rootDirStartSector*512+32*fileI+29)*256+disk(start+rootDirStartSector*512+32*fileI+30)*(unsigned long)256*256+disk(start+rootDirStartSector*512+32*fileI+31)*(unsigned long)256*256*256;
    unsigned int cluster=disk(start+rootDirStartSector*512+32*fileI+26)+disk(start+rootDirStartSector*512+32*fileI+27)*256;
    while(remainingFileSize>0)
    {
        if(cluster>0xfff6)return 1; // bad or end cluster before last byte
        unsigned int n=512*sectorsPerCluster;
        if(n>remainingFileSize)n=remainingFileSize;
        remainingFileSize-=n;
        for(unsigned int i=0;i<n;i++)
        {
            *targetAddress=disk(start+dataStartSector*512+cluster*sectorsPerCluster*512+i);
            targetAddress++;
        }
        cluster=disk(start+fatStartSector*512+cluster*2)+disk(start+fatStartSector*512+cluster*2+1)*256;
    }
    return 0;
}

unsigned char fat16GetFileCountByExtension(const char* fileExtension)
{
    unsigned char result=0;
    for(unsigned char i=0;i<255;i++)
    {
        fat16GetFileName(i);
        if(fat16GetFileNameResult[9]==fileExtension[0]&&fat16GetFileNameResult[10]==fileExtension[1]&&fat16GetFileNameResult[11]==fileExtension[2])result++;
    }
    return result;
}

void fat16GetFileNameByExtension(const char* fileExtension, unsigned char fileWithExtensionI)
{
    for(unsigned char i=0;i<255;i++)
    {
        fat16GetFileName(i);
        if(fat16GetFileNameResult[9]==fileExtension[0]&&fat16GetFileNameResult[10]==fileExtension[1]&&fat16GetFileNameResult[11]==fileExtension[2])
        {
            fileWithExtensionI--;
            if(fileWithExtensionI==255)return;
        }
    }
}

unsigned char fat16LoadFileByExtension(const char* fileExtension, unsigned char fileWithExtensionI, unsigned char* targetAddress)
{
    for(unsigned char i=0;i<255;i++)
    {
        fat16GetFileName(i);
        if(fat16GetFileNameResult[9]==fileExtension[0]&&fat16GetFileNameResult[10]==fileExtension[1]&&fat16GetFileNameResult[11]==fileExtension[2])
        {
            fileWithExtensionI--;
            if(fileWithExtensionI==255)
            {
                return fat16LoadFile(i,targetAddress);
            }
        }
    }
    return 128;
}

unsigned char fat16LoadFileByName(const char* fileName, unsigned char* targetAddress)
{
    for(unsigned char i=0;i<255;i++)
    {
        fat16GetFileName(i);
        if(strcmp(fat16GetFileNameResult,fileName)==0)
        {
            return fat16LoadFile(i,targetAddress);
        }
    }
    return 128;
}
