#include <stdio.h>
#include "sandbox.h"

// fat16
const int start=65536; // TODO: why?
unsigned char sectorsPerCluster;
int reservedSectors;
int sectors;
int sectorsPerFat;
int sectorsHidden;
int fatStartSector;
int fatSectors;
int rootDirStartSector;
int rootDirSectors;
int dataStartSector;
int dataSectors;

// must be called before all other fat16...() calls
// returns 0 on success
unsigned char fat16Init()
{
    // ref: http://elm-chan.org/docs/fat_e.html

    // "You can set something else, but some FAT drivers may not recognize that volume."
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

    sectorsPerCluster=disk[start+13];

    reservedSectors=disk[start+14]+disk[start+15]*256;

    // "The value of this field should always be 2"
    if(disk[start+16]!=2)return 3;

    // "this field should be set to 512 on the FAT16 volume"
    int rootEntryCount=disk[start+17]+disk[start+18]*256;
    if(rootEntryCount!=512)return 4;

    sectors=disk[start+19]+disk[start+20]*256;
    if(sectors==0)sectors=disk[start+32]+disk[start+33]*256+disk[start+34]*256*256+disk[start+35]*256*256*256;

    sectorsPerFat=disk[start+22]+disk[start+23]*256;

    sectorsHidden=disk[start+28]+disk[start+29]*256+disk[start+30]*256*256+disk[start+31]*256*256*256;

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
    fat16GetFileNameResult[ 0]=disk[start+rootDirStartSector*512+32*fileI+ 0];
    fat16GetFileNameResult[ 1]=disk[start+rootDirStartSector*512+32*fileI+ 1];
    fat16GetFileNameResult[ 2]=disk[start+rootDirStartSector*512+32*fileI+ 2];
    fat16GetFileNameResult[ 3]=disk[start+rootDirStartSector*512+32*fileI+ 3];
    fat16GetFileNameResult[ 4]=disk[start+rootDirStartSector*512+32*fileI+ 4];
    fat16GetFileNameResult[ 5]=disk[start+rootDirStartSector*512+32*fileI+ 5];
    fat16GetFileNameResult[ 6]=disk[start+rootDirStartSector*512+32*fileI+ 6];
    fat16GetFileNameResult[ 7]=disk[start+rootDirStartSector*512+32*fileI+ 7];
    fat16GetFileNameResult[ 8]='.';
    fat16GetFileNameResult[ 9]=disk[start+rootDirStartSector*512+32*fileI+ 8];
    fat16GetFileNameResult[10]=disk[start+rootDirStartSector*512+32*fileI+ 9];
    fat16GetFileNameResult[11]=disk[start+rootDirStartSector*512+32*fileI+10];
    fat16GetFileNameResult[12]='\0';
}

void fat16LoadFile(unsigned char fileI, unsigned char* targetAddress)
{
    int remainingFileSize=disk[start+rootDirStartSector*512+32*fileI+28]+disk[start+rootDirStartSector*512+32*fileI+29]*256+disk[start+rootDirStartSector*512+32*fileI+30]*256*256+disk[start+rootDirStartSector*512+32*fileI+31]*256*256*256;
    if(remainingFileSize>1024)remainingFileSize=1024; // TODO: remove this line to load file completely
    int cluster=disk[start+rootDirStartSector*512+32*fileI+26]+disk[start+rootDirStartSector*512+32*fileI+27]*256;
    while(remainingFileSize>0)
    {
        if(cluster>0xfff6)return; // bad or end cluster before last byte
        int n=512*sectorsPerCluster;
        if(n>remainingFileSize)n=remainingFileSize;
        remainingFileSize-=n;
        for(int i=0;i<n;i++)
        {
            *targetAddress=disk[start+dataStartSector*512+cluster*sectorsPerCluster*512+i];
            targetAddress++;
        }
        cluster=disk[start+fatStartSector*512+cluster*2]+disk[start+fatStartSector*512+cluster*2+1]*256;
    }
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

void fat16LoadFileByExtension(const char* fileExtension, unsigned char fileWithExtensionI, unsigned char* targetAddress)
{
    for(unsigned char i=0;i<255;i++)
    {
        fat16GetFileName(i);
        if(fat16GetFileNameResult[9]==fileExtension[0]&&fat16GetFileNameResult[10]==fileExtension[1]&&fat16GetFileNameResult[11]==fileExtension[2])
        {
            fileWithExtensionI--;
            if(fileWithExtensionI==255)
            {
                fat16LoadFile(i,targetAddress);
                return;
            }
        }
    }
}

int main(int argc,char* args[])
{
    sandboxInit();
    show(0x0004E080);
    show(0x00053800);

    printf("\nfat16Init(): ");
    unsigned char fat16InitError=fat16Init();
    if(fat16InitError){
        printf("error %d: ",fat16InitError);
        if     (fat16InitError==1)printf("oem name not MSDOS5.0");
        else if(fat16InitError==2)printf("sector size not 512");
        else if(fat16InitError==3)printf("fat count not 2");
        else if(fat16InitError==4)printf("root entry count not 512");
        else printf("unknown");
        return 1;
    }
    printf("ok\n");

    printf("sectorsPerCluster=%d\n",sectorsPerCluster);
    printf("reservedSectors=%d\n",reservedSectors);
    printf("sectors=%d\n",sectors);
    printf("sectorsPerFat=%d\n",sectorsPerFat);
    printf("sectorsHidden=%d\n",sectorsHidden);
    printf("fatStartSector=%d\n",fatStartSector);
    printf("fatSectors=%d\n",fatSectors);
    printf("rootDirStartSector=%d\n",rootDirStartSector);
    printf("rootDirSectors=%d\n",rootDirSectors);
    printf("dataStartSector=%d\n",dataStartSector);
    printf("dataSectors=%d\n\n",dataSectors);

    for(int i=0;i<8;i++)
    {
        fat16GetFileName(i);
        printf("fat16GetFileName(%03d): %s\n",i,fat16GetFileNameResult);
    }
    unsigned char memory0[1024];
    fat16LoadFile(4,memory0);
    printf("fat16LoadFile(04,...): ");for(int i=0;i<16;i++)printf("%c",memory0[i]);
    printf("\n\n");

    printf("fat16GetFileCountByExtension(\"BIN\"): %d\n",fat16GetFileCountByExtension("BIN"));
    for(int i=0;i<8;i++)
    {
        fat16GetFileNameByExtension("BIN",i);
        printf("fat16GetFileNameByExtension(\"BIN\",%03d): %s\n",i,fat16GetFileNameResult);
    }
    unsigned char memory1[1024];
    fat16LoadFileByExtension("BIN",0,memory1);
    printf("fat16LoadFileByExtension(\"BIN\",00,...): ");for(int i=0;i<16;i++)printf("%c",memory1[i]);
    printf("\n\n");

    sandboxUninit();
    return 0;
}
