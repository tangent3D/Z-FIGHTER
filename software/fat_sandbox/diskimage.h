#ifndef DISKIMAGE_H
#define DISKIMAGE_H

// returns NULL on success
// returns error message on failure
const char* diskImageLoad(const char* sourceFileName, int targetArraySize, unsigned char* targetArray);

#endif
