#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include "lz77.h"

#define VAL_COUNT 1024

int main(int argc, char *argv[])
{
    // Testing bitfield array
    srand(time(NULL));
    BitField bf;
    UCHAR bitsMax[VAL_COUNT];
    UINT values[VAL_COUNT];
    UINT retrievedValues[VAL_COUNT];
    UCHAR buffer[VAL_COUNT * 15] = {0};
    initBitField(&bf, buffer);
    printf("randomizing %d values%c%c", VAL_COUNT, 10, 13);
    for (int i = 0; i < VAL_COUNT; i++) {
        bitsMax[i] = (UCHAR) (rand() % 14 + 1);
        values[i] = rand() % (1 << bitsMax[i]);
        // printf("randomized %d on %d\n", values[i], bitsMax[i]);
    }
    printf("\nArray test%c%c", 10, 13);
    printf("writing %d values%c%c", VAL_COUNT, 10, 13);
    for (int i = 0; i < VAL_COUNT; i++) {
        // printf("write %d on %d bits\n", values[i], bitsMax[i]);
        writebits(&bf, values[i], bitsMax[i]);
    }
    initBitField(&bf, buffer);
    printf("reading %d values%c%c", VAL_COUNT, 10, 13);
    for (int i = 0; i < VAL_COUNT; i++) {
        UINT v = readbits(&bf, bitsMax[i]);
        // printf("read %d on %d bits\n", v, bitsMax[i]);
        retrievedValues[i] = v;
    }
    int ja = 1;
    printf("comparing %d values%c%c", VAL_COUNT, 10, 13);
    for (int i = 0; i < VAL_COUNT; i++) {
        if (values[i] != retrievedValues[i]) {
            ja = 0;
            break;
        }
    }
    if (ja) printf("schön\n");


    // Testing bitfield file
    printf("\nFile test%c%c", 10, 13);
    FILE *fout = fopen("test.bf", "wb");
    printf("writing %d values%c%c", VAL_COUNT, 10, 13);
    memset(buffer, 0, sizeof(buffer));
    initBitField(&bf, buffer);
    for (int i = 0; i < VAL_COUNT; i++) {
        writebits(&bf, values[i], bitsMax[i]);
        // printf("write %d on %d bits\n", values[i], bitsMax[i]);
    }
    printf("File size:%d\n", bf.currentIndex);
    fwrite(bf.buffer, 1, bf.currentIndex, fout);
    fclose(fout);

    FILE *fin = fopen("test.bf", "rb");
    memset(buffer, 0, sizeof(buffer));
    initBitFieldFile(&bf, fin);
    printf("reading %d values%c%c", VAL_COUNT, 10, 13);
    UINT o = 1;
    for (int i = 0; i < VAL_COUNT && o; i++) {
        o = readbitsFile(&bf, bitsMax[i], &retrievedValues[i]);
        // printf("read %d on %d bits\n", retrievedValues[i], bitsMax[i]);
    }
    fclose(fin);

    ja = 1;
    printf("comparing %d values%c%c", VAL_COUNT, 10, 13);
    for (int i = 0; i < VAL_COUNT; i++) {
        if (values[i] != retrievedValues[i]) {
            ja = 0;
            break;
        }
    }
    if (ja) printf("wiederschön\n");
}

