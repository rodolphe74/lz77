#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "lz77.h"

#define VAL_COUNT 1024

int main(int argc, char *argv[])
{
    // Testing bitfield
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
}

