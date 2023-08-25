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
    FILE *fin = fopen("/home/rodoc/develop/projects/lz77/maupassant.txt", "rb");
    FILE *fout = fopen("/home/rodoc/develop/projects/lz77/maupassant.lz", "wb");

    if (fin == NULL || fout == NULL) {
        perror("fopen");
        exit(1);
    }

    compressFile(fin, fout);
    fclose(fin);
    fclose(fout);

    // uncompress file test
    FILE *fin2 = fopen("/home/rodoc/develop/projects/lz77/maupassant.lz", "rb");
    FILE *fout2 = fopen("/home/rodoc/develop/projects/lz77/maupassant.bck", "w+b");

    if (fin2 == NULL || fout2 == NULL) {
        perror("fopen");
        exit(1);
    }

    uncompressFile(fin2, fout2);
    fclose(fin2);
    fclose(fout2);
    return 0;
}

