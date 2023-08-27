#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "lz77.h"

// #define INPUT_SIZE 16384
// #define OUTPUT_SIZE 16384

#define INPUT_SIZE 1024
#define OUTPUT_SIZE 1024


int main(int argc, char *argv[])
{
    // initDefaultParameters();
    initParameters(511, 9, 15, 4);

    // sample buffer compression test
    UCHAR in[] = {'!', '!', '!', '!', '!', '!', '!', '!', '!', 'H', 'e', 'l', 'l', 'o', ' ', 'f', 'r', 'i', 'e', 'n', 'd', 's', ',', ' ', 'H', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd', '!', '!', '!', '!', '!', '!', '!', '!', '!'};
    UCHAR out[OUTPUT_SIZE] = { 0 };
    UCHAR backToOriginal[OUTPUT_SIZE] = { 0 };

    INT osz = sizeof(in);
    INT cidx = compress(in, osz, out, OUTPUT_SIZE);
    printf("csz=%d\n", cidx);

    INT bidx = uncompress(out, cidx, backToOriginal, OUTPUT_SIZE);
    printf("bsz=%d\n", bidx);
    printf("osz=%d\n", osz);

    if (osz != bidx) {
        printf("Messages differ!\n");
        return 1;
    }

    for (int i = 0; i < bidx; i++) {
        // printf("%d<>%d\n", in[i], backToOriginal[i]);
        if (in[i] != backToOriginal[i]) {
            printf("Messages differ at %d\n", i);
            return 1;
        }
    }
    printf("All good!\n");

    // randomize buffer test
#define MAX_BUFFER_SIZE 18000
#define BUFFER_COUNT 256
    for (int i = 0; i < BUFFER_COUNT; i++) {
        size_t sz = rand() % MAX_BUFFER_SIZE + 1;
        UCHAR *buf = malloc(sz);
        UCHAR *cbuf = malloc(sz * 3);
        UCHAR *back = malloc(sz * 3);
        UCHAR u;
        memset(buf, 0, sz);
        memset(cbuf, 0, sz * 3);
        memset(back, 0, sz * 3);
        for (int j = 0; j < sz; j++) {
            if (j%8==0)
                u = rand() % 254 + 1;
            buf[j] = u;
        }
        cidx = compress(buf, sz, cbuf, sz * 2);
        printf("sz:%lu cidx:%d\n", sz, cidx);
        bidx = uncompress(cbuf, cidx, back, sz * 2);
        // INT _csz = compress(_in, _osz, _out, OUTPUT_SIZE);
        printf("bidx:%d\n", bidx);
        if (sz != bidx) {
            printf("Messages sizes differ!\n");
            return 1;
        }
        for (int k = 0; k < bidx; k++) {
            if (buf[k] != back[k]) {
                printf("%d<>%d\n", buf[i], back[k]);
                printf("Messages differ at %d (%lu)\n", k, sz);

                for (int l = 0; l < sz; l++)
                    printf("%d,", buf[l]);
                printf("\n");
                for (int l = 0; l < sz; l++)
                    printf("%d,", back[l]);

                return 1;
            }
        }
        printf("test %d (%f) all good!\n", i, (float) sz / (float) cidx);
        free(buf);
        free(cbuf);
        free(back);
    }

    return 0;
}
