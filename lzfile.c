#include <stdio.h>
#include <stdlib.h>
#include "lz77.h"
#include <time.h>
#include <string.h>

#define F "/home/rodoc/develop/projects/lz77/maupassant512"
#define E ".txt"
#define FILENAME F E

#define FILENAME_COMP F ".lz"
#define FILENAME_DECOMP F ".bck"
#define FILENAME_DECOMPU F "_u.bck"


int compareFiles(FILE *fp1, FILE *fp2)
{
    unsigned long pos;
    int c1, c2;
    for (pos = 0;; pos++) {
        c1 = getc(fp1);
        c2 = getc(fp2);
        if (c1 != c2 || c1 == EOF)
            break;
    }
    if (c1 == c2) {
        printf("files are identical and have %lu bytes\n", pos);
        return 0;  // files are identical
    } else if (c1 == EOF) {
        printf("file1 is included in file2, the first %lu bytes are identical\n", pos);
        return 1;
    } else if (c2 == EOF) {
        printf("file2 is included in file1, the first %lu bytes are identical\n", pos);
        return 2;
    } else {
        printf("file1 and file2 differ at position %lu: 0x%02X <> 0x%02X\n", pos, c1, c2);
        return 3;
    }
}

float getCompressionRatio(FILE *fp1, FILE *fp2)
{
    long sc = ftell(fp1);
    fseek(fp1, 0, SEEK_END);
    long s = ftell(fp1);
    fseek(fp1, sc, SEEK_SET);

    long tc = ftell(fp2);
    fseek(fp2, 0, SEEK_END);
    long t = ftell(fp2);
    fseek(fp2, tc, SEEK_SET);

    return s / (float)t;
}


int main(int argc, char *argv[])
{
    // UCHAR b[] = "GCATCGCAGAGAGTATACAGTACG";
    // UCHAR a[] = "GCAGAGAG";
    // int j = bruteForceSearch(a, 8, b, 24);
    // printf("j=%d\n", j);
    //
    // j = bruteForceSearchOptim(a, 8, b, 24);
    // printf("j=%d\n", j);
    //
    // j = karpRabinSearch(a, 8, b, 24);
    // printf("j=%d\n", j);
    //
    // exit(1);

    clock_t start, end;
    double timeUsed;
    FILE *f, *g;
    int compare = 0;

    initDefaultParameters();
    // initParameters(511, 9, 15, 4);

    // compress file test
    FILE *fin = fopen(FILENAME, "rb");
    FILE *fout = fopen(FILENAME_COMP, "wb");

    if (fin == NULL || fout == NULL) {
        perror("fopen");
        exit(1);
    }

    printf("\nTesting compression/decompression (buffered)\n");
    start = clock();
    compressFile(fin, fout);
    end = clock();
    timeUsed = ((double) (end - start)) / CLOCKS_PER_SEC;
    fclose(fin);
    fclose(fout);
    printf("Compression time %f\n", timeUsed);

    // // uncompress file test
    fin = fopen(FILENAME_COMP, "rb");
    fout = fopen(FILENAME_DECOMP, "w+b");

    if (fin == NULL || fout == NULL) {
        perror("fopen");
        exit(1);
    }
    start = clock();
    uncompressFile(fin, fout);
    end = clock();
    timeUsed = ((double) (end - start)) / CLOCKS_PER_SEC;
    fclose(fin);
    fclose(fout);
    printf("\nDecompression time %f\n", timeUsed);

    f = fopen(FILENAME, "rb");
    g = fopen(FILENAME_DECOMP, "rb");
    compare = compareFiles(f, g);
    if (compare == 0)
        printf("Buffered test is valid\n");




    fin = fopen(FILENAME_COMP, "rb");
    fout = fopen(FILENAME_DECOMPU, "w+b");

    if (fin == NULL || fout == NULL) {
        perror("fopen");
        exit(1);
    }

    start = clock();
    uncompressFileUnbuffered(fin, fout);
    end = clock();
    timeUsed = ((double) (end - start)) / CLOCKS_PER_SEC;
    fclose(fin);
    fclose(fout);
    printf("\nUnbuffered decompression time %f\n", timeUsed);

    f = fopen(FILENAME, "rb");
    g = fopen(FILENAME_DECOMPU, "rb");
    compare = compareFiles(f, g);
    if (compare == 0)
        printf("Unbuffered test is valid\n");
    fclose(f);
    fclose(g);


    f = fopen(FILENAME, "rb");
    g = fopen(FILENAME_COMP, "rb");
    printf("\nCompression ratio is %f\n", getCompressionRatio(f, g));
    fclose(f);
    fclose(g);

    return 0;
}

