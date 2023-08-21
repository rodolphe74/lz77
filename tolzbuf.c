#include "lz77.h"
#define INPUT_SIZE 128
#define OUTPUT_SIZE 128

int main(/*int argc, char *argv[]*/)
{
#define VAL_COUNT 256
    BitField bf;
    UCHAR bitsMax[VAL_COUNT];
    UINT values[VAL_COUNT];
    UINT retrievedValues[VAL_COUNT];
    UCHAR buffer[VAL_COUNT * 15];
    memset(buffer, 0, VAL_COUNT * 15);
    initBitField(&bf, buffer);
    printf("randomizing %d values%c%c", VAL_COUNT, 10, 13);
    for (int i = 0; i < VAL_COUNT; i++) {
        bitsMax[i] = (UCHAR)(rand() % 14 + 1);
        values[i] = rand() % (1 << bitsMax[i]);
        // printf("randomized %d on %d%c%c", values[i], bitsMax[i], 10, 13);
    }
    printf("\n");
    printf("writing %d values%c%c", VAL_COUNT, 10, 13);
    for (int i = 0; i < VAL_COUNT; i++) {
        // printf("write %d on %d bits%c%c", values[i], bitsMax[i], 10, 13);
        writebits(&bf, values[i], bitsMax[i]);
    }
    initBitField(&bf, buffer);
    printf("reading %d values%c%c", VAL_COUNT, 10, 13);
    for (int i = 0; i < VAL_COUNT; i++) {
        UINT v = readbits(&bf, bitsMax[i]);
        // printf("read %d on %d bits%c%c", v, bitsMax[i], 10, 13);
        retrievedValues[i] = v;
    }
    printf("comparing %d values%c%c", VAL_COUNT, 10, 13);
    int ja = 1;
    for (int i = 0; i < VAL_COUNT; i++) {
        if (values[i] != retrievedValues[i]) {
            ja = 0;
            break;
        }
    }
    if (ja) printf("schön%c%c", 10, 13);



    UCHAR in[] = {'H', 'e', 'l', 'l', 'o', ' ', 'f', 'r', 'i', 'e', 'n', 'd', 's', ',', ' ', 'H', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd'};
    UCHAR out[OUTPUT_SIZE];
    UCHAR backToOriginal[OUTPUT_SIZE];

    INT osz = sizeof(in);
    INT csz = compress(in, osz, out, OUTPUT_SIZE);
    printf("csz=%d%c%c", csz, 10, 13);

    INT bsz = uncompress(out, csz, backToOriginal, OUTPUT_SIZE);
    printf("bsz=%d%c%c", bsz, 10, 13);

    if (osz != bsz) {
        printf("Messages differ!%c%c", 10, 13);
        return 1;
    }

    for (int i = 0; i < bsz; i++) {
        if (in[i] != backToOriginal[i]) {
            printf("Messages differ at %d%c%c", i, 10, 13);
            return 1;
        }
    }
    printf("All good!%c%c", 10, 13);

    return 0;
}


