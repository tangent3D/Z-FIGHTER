// module definitions for z-fighter application "menu"
// by xrrawva 2023

#ifndef MENU_FAT16_H
#define MENU_FAT16_H

// must be called before all other fat16...() calls
// returns 0 on success
unsigned char fat16Init();

unsigned char fat16GetFileCountByExtension(const char* fileExtension);

extern char fat16GetFileNameResult[13];
void fat16GetFileName(unsigned char fileI);
void fat16GetFileNameByExtension(const char* fileExtension, unsigned char fileWithExtensionI);

// returns 0 on success
unsigned char fat16LoadFile(unsigned char fileI, unsigned char* targetAddress);
unsigned char fat16LoadFileByExtension(const char* fileExtension, unsigned char fileWithExtensionI, unsigned char* targetAddress);

#endif // MENU_FAT16_H
