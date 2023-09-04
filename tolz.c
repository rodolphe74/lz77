#include "lz77.h"
// #include "images/beast00077.h"
// #include "images/nimoy0077.h"
// #include "images/fouAPi0077.h"
#include "images/arton50077.h"
// #include "images/arton40077.h"
// #include "images/artonb0077.h"

// #define INPUT_SIZE 1024
// #define OUTPUT_SIZE 1024

#define STRUCT_NAME arton500

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
    _PALETTE(STRUCT_NAME.pal);

    int *screenStart = (int *)0x4000;
    UCHAR *screenStartChar = (UCHAR *)screenStart;


    // Trying to understand thomson 160 frame buffer :

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


    // Understood:
    initParameters(511, 9, 15, 4);
    uncompress(STRUCT_NAME.mapA, STRUCT_NAME.lenA, (UCHAR *) screenStartChar, 8000);
    _SWITCH_B();
    uncompress(STRUCT_NAME.mapB, STRUCT_NAME.lenB, (UCHAR *) screenStartChar, 8000);

    return 0;
}


