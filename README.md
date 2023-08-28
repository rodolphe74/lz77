# lz77
Low memory footprint lz77 implementation

Finality is a TO8 decompression (achieving ratio 1.57 on following 16000 bytes image sample).

![alt text](uncompressto8.gif)


Image Contained C header can be created with [DitherToMo](https://github.com/rodolphe74/DitherToMo).

```shell
./mapc1677 ../images/nimoy.jpg
```

C loader looks like

```c
#include "lz77.h"
#include "nimoy0077.h"

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
    _PALETTE(beast000.pal);

    // starting address of TO8 screen memory
    int *screenStart = (int *)0x4000;
    UCHAR *screenStartChar = (UCHAR *)screenStart;

    // lz77 Dictionnary and window size (hardcoded in DitherToMo)
    initParameters(511, 9, 15, 4);

    // Decompression of Mode 160 planes
    uncompress(beast000.mapA, beast000.lenA, (UCHAR *) screenStartChar, 8000);
    _SWITCH_B();
    uncompress(beast000.mapB, beast000.lenB, (UCHAR *) screenStartChar, 8000);

    return 0;
}
```
