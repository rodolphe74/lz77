#include <stdio.h>
#include <stdlib.h>
#include "lz77.h"

// #define INPUT_SIZE 16384
// #define OUTPUT_SIZE 16384

#define INPUT_SIZE 1024
#define OUTPUT_SIZE 1024


int main(int argc, char *argv[])
{
    // Bits test
    UCHAR buf[256] = {0};
    BitField bf;
    initBitField(&bf, buf);
    writebits(&bf, 38, 6);
    writebits(&bf, 4, 3);

    // tuples test
    // tuple t = {5, 2, 65};
    // tuple t = {31, 7, 65};
    // emittedTuple q;
    // toEmittedTuple(&t, &q);
    // printf("%d,%d,%d -> %d,%d\n", t.d, t.l, t.c, q.dl, q.c);
    // fromEmittedTuple(&q, &t);
    // printf("%d,%d -> %d,%d,%d\n", q.dl, q.c, t.d, t.l, t.c);

    // buffer compression test
    // CHAR in[INPUT_SIZE];
    UCHAR in[] = {'H', 'e', 'l', 'l', 'o', ' ', 'f', 'r', 'i', 'e', 'n', 'd', 's', ',', ' ', 'H', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd'};
    UCHAR out[OUTPUT_SIZE];
    UCHAR backToOriginal[OUTPUT_SIZE];

    INT osz = sizeof(in);
    INT csz = compress(in, osz, out, OUTPUT_SIZE);
    printf("csz=%d\n", csz);

    INT bsz = uncompress(out, csz, backToOriginal, OUTPUT_SIZE);
    printf("bsz=%d\n", bsz);

    if (osz != bsz) {
        printf("Messages differ!\n");
        return 1;
    }

    for (int i = 0; i < bsz; i++) {
        if (in[i] != backToOriginal[i]) {
            printf("Messages differ at %d\n", i);
            return 1;
        }
    }
    printf("All good!\n");

    // compress file test
    FILE *fin = fopen("/home/rodoc/develop/projects/lz77/fill.tiff", "rb");
    FILE *fout = fopen("/home/rodoc/develop/projects/lz77/fill.lz", "wb");
    compressFile(fin, fout);
    fclose(fin);
    fclose(fout);

    // uncompress file test
    FILE *fin2 = fopen("/home/rodoc/develop/projects/lz77/fill.lz", "rb");
    FILE *fout2 = fopen("/home/rodoc/develop/projects/lz77/fill.bck", "w+b");
    uncompressFile(fin2, fout2);
    fclose(fin2);
    fclose(fout2);
    return 0;
}
