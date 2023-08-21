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
