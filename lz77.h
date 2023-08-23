#ifndef COMPILER_IS_CMOC
#pragma once
#include <stdio.h>
#include <stdint.h>
#define INT int16_t
#define UINT uint16_t
#define UCHAR unsigned char
#define CHAR char
#else
#include <cmoc.h>
#define INT int
#define UINT unsigned int
#define UCHAR unsigned char
#define CHAR char
#endif

#define F_BUFFER_SZ 512
#define C_F_BUFFER_SZ 512*2
#define U_F_BUFFER_SZ 512*2

// MAX 5 bits : 31
#define DIC_SIZE 31
#define DIC_BIT_SIZE 5
// #define DIC_SIZE 7
// #define DIC_BIT_SIZE 3

// MAX 3 bits : 7
#define AHEAD_SIZE 7
#define AHEAD_BIT_SIZE 3
// #define AHEAD_SIZE 15
// #define AHEAD_BIT_SIZE 4


#define CHAR_BIT_SIZE 8

struct tupleStruct {
    UCHAR d;
    UCHAR l;
    UCHAR c;
};
typedef struct tupleStruct Tuple;

struct emittedTupleStruct {
    UCHAR dl;
    UCHAR c;
};
typedef struct emittedTupleStruct EmittedTuple;

#ifndef COMPILER_IS_CMOC
struct FileStruct
{
    // struct used in file decompression
    FILE *f;
    int init;
    UCHAR currentChar;
};
typedef struct FileStruct File;

struct bitFieldStruct {
    // struct used on array compression/decompression (buffer)
    // or file decompression (struct file)
    union {
        UCHAR *buffer;
        File file;
    };
    UINT currentIndex;
    CHAR bitLeft;
};
#else
struct bitFieldStruct {
    UCHAR *buffer;
    UINT currentIndex;
    CHAR bitLeft;
};
#endif
typedef struct bitFieldStruct BitField;

void toEmittedTuple(const Tuple *t, EmittedTuple *q);
void fromEmittedTuple(const EmittedTuple *q, Tuple *t);
void initBitField(BitField *bf, UCHAR *buf);
void writebits(BitField *bf, UINT value, UCHAR bitCount);
UINT readbits(BitField *bf, UCHAR bitCount);
INT compress(UCHAR *input, INT iSize, UCHAR *output, INT oSize);
INT uncompress(UCHAR *input, INT iSize, UCHAR *output, INT oSize);
#ifndef COMPILER_IS_CMOC
void initBitFieldFile(BitField *bf, FILE *file);
UINT readbitsFile(BitField *bf, UCHAR bitCount, UINT *valueRead);
void finalizeWritebitsFile(BitField *bf, FILE *fout);
void compressFile(FILE *fin, FILE *fout);
void uncompressFile(FILE *fin, FILE *fout);
#endif
