#include <stdio.h>
#include <stdlib.h>
#include "lz77.h"
#include <time.h>

// #define INPUT_SIZE 16384
// #define OUTPUT_SIZE 16384

#define INPUT_SIZE 1024
#define OUTPUT_SIZE 1024


int main(int argc, char *argv[])
{
    // compress file test
    FILE *fin = fopen("./fill.tiff", "rb");
    FILE *fout = fopen("./fill.lz", "wb");

    if (fin == NULL || fout == NULL) {
        perror("fopen");
        exit(1);
    }

    compressFile(fin, fout);
    fclose(fin);
    fclose(fout);

    // uncompress file test
    FILE *fin2 = fopen("./fill.lz", "rb");
    FILE *fout2 = fopen("./fill.bck", "w+b");

    if (fin2 == NULL || fout2 == NULL) {
        perror("fopen");
        exit(1);
    }

    uncompressFile(fin2, fout2);
    fclose(fin2);
    fclose(fout2);
    return 0;
}
