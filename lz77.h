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
#endif

#define F_BUFFER_SZ 512
#define C_F_BUFFER_SZ 512*2
#define U_F_BUFFER_SZ 512*2

// MAX 5 bits : 31
#define DIC_SIZE 31

// MAX 3 bits : 7
#define AHEAD_SIZE 7

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

struct bitFieldStruct {
    UCHAR *buffer;
    UINT currentIndex;
    CHAR bitLeft;
};
typedef struct bitFieldStruct BitField;

void toEmittedTuple(const Tuple *t, EmittedTuple *q);
void fromEmittedTuple(const EmittedTuple *q, Tuple *t);
void initBitField(BitField *bf, UCHAR *buf);
void writebits(BitField *bf, UCHAR value, UCHAR bitCount);
UCHAR readbits(BitField bf, UCHAR bitCount);
INT compress(UCHAR *input, INT iSize, UCHAR *output, INT oSize);
INT uncompress(UCHAR *input, INT iSize, UCHAR *output, INT oSize);
#ifndef COMPILER_IS_CMOC
void compressFile(FILE *fin, FILE *fout);
void uncompressFile(FILE *fin, FILE *fout);
#endif
