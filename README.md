# lz77
Low memory footprint lz77 implementation

Finality is a TO8 decompression (achieving ratio 1.57 on following 16000 bytes image sample).

![alt text](uncompressto8.gif)


Image Contained C header can be created with [DitherToMo](https://github.com/rodolphe74/DitherToMo).

```shell
./mapc1677 ../images/nimoy.jpg
```


C loader looks like:

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


[CMOC](http://perso.b2b2c.ca/~sarrazip/dev/cmoc.html) compilation & [SAPFS](https://github.com/nils-eilers/sap2) virtual floppy creation (in ToMakefile):
```shell
CC=cmoc
RM=rm -rf
SAPFS=sapfs

CFLAGS= -O2 --thomto -DCOMPILER_IS_CMOC

LDFLAGS= -lcmoc-crt-thm

all: tolz tolzbuf floppy

lz77.o: lz77.c
	$(CC) $(CFLAGS) -c $<
	$(CC) -S $(CFLAGS) $<

tolz: lz77.o tolz.c
	$(CC) $(CFLAGS) -o$@.bin  $^ $(LDFLAGS)
	$(CC) -S $(CFLAGS)  $^

tolzbuf: lz77.o tolzbuf.c
	$(CC) $(CFLAGS) -o$@.bin  $^ $(LDFLAGS)
	$(CC) -S $(CFLAGS)  $^

floppy:
	$(SAPFS) -c floppy.sap
	$(SAPFS) -a floppy.sap *.bin
	$(SAPFS) -t floppy.sap

clean:
	$(RM) *.o *.a *.bin
```
