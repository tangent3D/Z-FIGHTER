#ifndef SANDBOX_H
#define SANDBOX_H

extern const char*    diskImageFileName;
extern const int      diskImageFileSize;
extern unsigned char* disk;

void sandboxInit();
void sandboxUninit();
void show(int address);

#endif
