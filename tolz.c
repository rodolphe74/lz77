#include "lz77.h"
// #include "beast00077.h"
// #include "nimoy0177.h"
#include "fouAPi0077.h"

// #define INPUT_SIZE 1024
// #define OUTPUT_SIZE 1024

// set 160*200*16
void _160()
{
asm
{
    LDA #$7B
    STA $E7DC
}
}


void _PALETTE(unsigned int *palette16)
{
asm {
    LDY :palette16
    CLRA
PALETTE_FOND
    PSHS A
    ASLA
    STA $E7DB
    LDD ,Y++       * couleur
    STB $E7DA
    STA $E7DA
    PULS A
    INCA
    CMPA #$10       * 16x
    BNE PALETTE_FOND
}
}

void _SWITCH_B()
{
asm {
    LDB    $E7C3
    ANDB   #$FE
    STB    $E7C3
}
}

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
        bitsMax[i] = (UCHAR) (rand() % 14 + 1);
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
    exit(0);


    _160();
    _PALETTE(fouAPi00.pal);

    int *screenStart = (int *)0x4000;
    UCHAR *screenStartChar = (UCHAR *)screenStart;
    // UCHAR *ptr = (UCHAR *) screenStart;
    // UCHAR *ptr2 = (UCHAR *) (screenStart + 4096);
    // uncompress(nimoy00.screen, nimoy00.len, (UCHAR *) screenStart, 16384);
    // for (int i = 0; i < 4000; i++) {
    //     ptr[i] = ((UCHAR) i) % 255;
    //     ptr[i + 4000] = ((UCHAR) i) % 255;
    // }

    // // Plan A
    // for (int i = 0; i < 4000; i++) {
    //     *(screenStart + i) = (int) ((1 << 4) | 2) << 8;  // A0  x+0, x+1
    //     *(screenStart + i) |= (int) ((3 << 4) | 4);      // A1  x+4, x+5
    // }
    //
    // // Plan B
    // _SWITCH_B();
    // for (int i = 0; i < 4000; i++) {
    //     *(screenStart + i) = (int) ((5 << 4) | 6) << 8;  // A0  x+0, x+1
    //     *(screenStart + i) |= (int) ((7 << 4) | 8);      // A1  x+4, x+5
    // }

    // // Plan A
    // for (int i = 0; i < 8000; i+=2) {
    //     *(screenStartChar + i) = (UCHAR) ((1 << 4) | 2);     // x+0, x+1
    //     *(screenStartChar + i + 1) = (UCHAR) ((3 << 4) | 4); // x+4, x+5
    // }
    //
    // // Plan B
    // _SWITCH_B();
    // for (int i = 0; i < 8000; i+=2) {
    //     *(screenStartChar + i) = (UCHAR) ((5 << 4) | 10);    // x+2, x+3
    //     *(screenStartChar + i + 1) = (UCHAR) ((7 << 4) | 8); // x+6, x+7
    // }



    uncompress(fouAPi00.mapA, fouAPi00.lenA, (UCHAR *) screenStartChar, 8000);
    _SWITCH_B();
    uncompress(fouAPi00.mapB, fouAPi00.lenB, (UCHAR *) screenStartChar, 8000);




    // UCHAR in[] = {'H', 'e', 'l', 'l', 'o', ' ', 'f', 'r', 'i', 'e', 'n', 'd', 's', ',', ' ', 'H', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd'};
    // UCHAR out[OUTPUT_SIZE];
    // UCHAR backToOriginal[OUTPUT_SIZE];
    //
    // INT osz = sizeof(in);
    // INT csz = compress(in, osz, out, OUTPUT_SIZE);
    // printf("csz=%d%c%c", csz, 10, 13);
    //
    // INT bsz = uncompress(out, csz, backToOriginal, OUTPUT_SIZE);
    // printf("bsz=%d%c%c", bsz, 10, 13);
    //
    // if (osz != bsz) {
    //     printf("Messages differ!%c%c", 10, 13);
    //     return 1;
    // }
    //
    // for (int i = 0; i < bsz; i++) {
    //     if (in[i] != backToOriginal[i]) {
    //         printf("Messages differ at %d%c%c", i, 10, 13);
    //         return 1;
    //     }
    // }
    // printf("All good!%c%c", 10, 13);
    return 0;
}

