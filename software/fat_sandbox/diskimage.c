#include <stdio.h>
#include <stdlib.h>
#include "diskimage.h"

const char* diskImageLoad(const char* sourceFileName,int targetArraySize,unsigned char* targetArray)
{
    FILE* file=fopen(sourceFileName,"rb");
    if(file==NULL)return "can not open file";
    if(fread(targetArray,sizeof(unsigned char),targetArraySize,file)!=targetArraySize)return "can not read all bytes";
    if(fclose(file)!=0)return "can not close file";
    return NULL;
}
