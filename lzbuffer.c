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
    // buffer compression test
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

    return 0;
}
