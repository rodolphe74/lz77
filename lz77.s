* 6809 assembly program generated by cmoc 0.1.83


	SECTION	code


_dicSize	IMPORT
_dicBitSize	IMPORT
_aheadSize	IMPORT
_aheadBitSize	IMPORT
_dicBitSize	EXPORT
_dicSize	EXPORT
_aheadBitSize	EXPORT
_aheadSize	EXPORT
___va_arg	IMPORT
_abs	IMPORT
_adddww	IMPORT
_atoi	IMPORT
_atol	IMPORT
_atoui	IMPORT
_atoul	IMPORT
_bsearch	IMPORT
_cmpdww	IMPORT
_compress	EXPORT


*******************************************************************************

* FUNCTION compress(): defined at lz77.c:165
_compress	EQU	*
* Calling convention: Default
	PSHS	U
	LEAU	,S
	LEAS	-21,S
* Formal parameter(s):
*      4,U:    2 bytes: input: unsigned char *
*      6,U:    2 bytes: iSize: unsigned int
*      8,U:    2 bytes: output: unsigned char *
*     10,U:    2 bytes: oSize: unsigned int
* Local non-static variable(s):
*    -21,U:    5 bytes: t: struct tupleStruct
*    -16,U:    5 bytes: $V00087: struct tupleStruct
*    -11,U:    5 bytes: bf: struct bitFieldStruct
*     -6,U:    2 bytes: index: int
*     -4,U:    2 bytes: dicIndexStart: int
*     -2,U:    2 bytes: dicIndexStop: int
* Line lz77.c:168: function call: memset()
	LDD	10,U		variable `oSize', declared at lz77.c:165
	PSHS	B,A		argument 3 of memset(): unsigned int
	CLRA
	CLRB
	PSHS	B,A		argument 2 of memset(): int
	LDD	8,U		variable `output', declared at lz77.c:165
	PSHS	B,A		argument 1 of memset(): unsigned char *
	LBSR	_memset
	LEAS	6,S
* Line lz77.c:170: function call: initBitField()
	LDD	8,U		variable `output', declared at lz77.c:165
	PSHS	B,A		argument 2 of initBitField(): unsigned char *
	LEAX	-11,U		variable `bf', declared at lz77.c:169
	PSHS	X		argument 1 of initBitField(): struct bitFieldStruct *
	LBSR	_initBitField
	LEAS	4,S
* Line lz77.c:172: init of variable index
	CLRA
	CLRB
	STD	-6,U		variable index
* Line lz77.c:173: init of variable dicIndexStart
* optim: stripExtraClrA_B
* optim: stripExtraClrA_B
	STD	-4,U		variable dicIndexStart
* Line lz77.c:173: init of variable dicIndexStop
* optim: stripExtraClrA_B
* optim: stripExtraClrA_B
	STD	-2,U		variable dicIndexStop
* Line lz77.c:174: while
	LBRA	L00089		jump to while condition
L00088	EQU	*		while body
* Line lz77.c:176: assignment: =
* Line lz77.c:176: conditional expression
	LDD	-6,U		variable index
	SUBD	_dicSize+0,PCR	variable dicSize
	CMPD	#0
	BGE	L00092		 (optim: condBranchOverUncondBranch)
* optim: condBranchOverUncondBranch
* Useless label L00091 removed
	CLRA
	CLRB
	BRA	L00093		end of true expression of conditional
L00092	EQU	*
	LDD	-6,U		variable index
	SUBD	_dicSize+0,PCR	variable dicSize
L00093	EQU	*
	STD	-4,U
* Line lz77.c:177: assignment: =
	LDD	-6,U		variable index
	ADDD	#$FFFF		65535
	STD	-2,U
* Line lz77.c:180: init of variable t
	CLRA
	CLRB
	STD	-21,U		offset in variable t
* optim: stripExtraClrA_B
* optim: stripExtraClrA_B
	STD	-19,U		offset in variable t
* optim: stripExtraClrA_B
* optim: stripExtraClrA_B
	STB	-17,U		offset in variable t
* Line lz77.c:181: assignment: =
* Line lz77.c:181: function call: findInDic()
	LDX	_aheadSize+0,PCR	optim: transformPshsDPshsD
	PSHS	X		optim: transformPshsDPshsD
	LDY	-6,U		optim: transformPshsXPshsX
* optim: optimizePshsOps
	LDX	-2,U		optim: transformPshsDPshsD
	PSHS	Y,X		optim: optimizePshsOps
	LDY	-4,U		optim: transformPshsXPshsX
* optim: optimizePshsOps
	LDX	6,U		optim: transformPshsDPshsD
* optim: optimizePshsOps
	LDD	4,U		variable `input', declared at lz77.c:165
	PSHS	Y,X,B,A		optim: optimizePshsOps
	LEAX	-16,U		address of struct/union to be returned by findInDic()
	PSHS	X		hidden argument
	LBSR	_findInDic
	LEAS	14,S
	LEAX	-16,U		address of struct/union returned by findInDic()
	LDD	#5		size of struct tupleStruct
	PSHS	B,A		push size to _memcpy
	PSHS	X		source struct
	LEAX	-21,U		variable `t', declared at lz77.c:180
	PSHS	X
	LBSR	_memcpy		copy struct (preserves X)
	LEAS	6,S
* Line lz77.c:185: function call: writebits()
	LDB	_dicBitSize+0,PCR	variable `dicBitSize', declared at lz77.c:10
	CLRA			promoting byte argument to word
	PSHS	B,A		argument 3 of writebits(): unsigned char
	LDD	-21,U		member d of tupleStruct, via variable t
	PSHS	B,A		argument 2 of writebits(): unsigned int
	LEAX	-11,U		variable `bf', declared at lz77.c:169
	PSHS	X		argument 1 of writebits(): struct bitFieldStruct *
	LBSR	_writebits
	LEAS	6,S
* Line lz77.c:186: function call: writebits()
	LDB	_aheadBitSize+0,PCR	variable `aheadBitSize', declared at lz77.c:12
	CLRA			promoting byte argument to word
	PSHS	B,A		argument 3 of writebits(): unsigned char
	LDD	-19,U		member l of tupleStruct, via variable t
	PSHS	B,A		argument 2 of writebits(): unsigned int
	LEAX	-11,U		variable `bf', declared at lz77.c:169
	PSHS	X		argument 1 of writebits(): struct bitFieldStruct *
	LBSR	_writebits
	LEAS	6,S
* Line lz77.c:187: function call: writebits()
	CLRA
	LDB	#$08		decimal 8 signed
	PSHS	B,A		argument 3 of writebits(): int
	LDB	-17,U		member c of tupleStruct, via variable t
* optim: stripExtraClrA_B
	PSHS	B,A		argument 2 of writebits(): unsigned char
	LEAX	-11,U		variable `bf', declared at lz77.c:169
	PSHS	X		argument 1 of writebits(): struct bitFieldStruct *
	LBSR	_writebits
	LEAS	6,S
* Line lz77.c:189: assignment: +=
* optim: optimizeStackOperations4
* optim: optimizeStackOperations4
	CLRA
	LDB	#$01		decimal 1 signed
	ADDD	-19,U		optim: optimizeStackOperations4
	ADDD	-6,U		optim: pushDLoadAdd
* 
* 
	STD	-6,U
L00089	EQU	*		while condition at lz77.c:174
	LDD	-6,U		variable index
	CMPD	6,U		variable iSize
	LBLO	L00088
* optim: branchToNextLocation
* Useless label L00090 removed
* Line lz77.c:191: return with value
	LDD	-9,U		member currentIndex of bitFieldStruct, via variable bf
* Emitted no code to cast `unsigned int' to `int'
* optim: branchToNextLocation
* Useless label L00085 removed
	LEAS	,U
	PULS	U,PC
* END FUNCTION compress(): defined at lz77.c:165
funcend_compress	EQU *
funcsize_compress	EQU	funcend_compress-_compress
_delay	IMPORT
_divdwb	IMPORT
_divdww	IMPORT
_divmod16	IMPORT
_divmod8	IMPORT
_dwtoa	IMPORT
_enableCMOCFloatSupport	IMPORT
_exit	IMPORT
_findInDic	EXPORT


*******************************************************************************

* FUNCTION findInDic(): defined at lz77.c:89
_findInDic	EQU	*
* Calling convention: Default
	PSHS	U
	LEAU	,S
	LEAS	-19,S
* Formal parameter(s):
*      6,U:    2 bytes: input: unsigned char *
*      8,U:    2 bytes: inputSize: unsigned int
*     10,U:    2 bytes: startDicIndex: unsigned int
*     12,U:    2 bytes: stopDicIndex: unsigned int
*     14,U:    2 bytes: startAHead: unsigned int
*     16,U:    2 bytes: aHeadSize: unsigned int
* Local non-static variable(s):
*    -14,U:    5 bytes: t: struct tupleStruct
*     -9,U:    1 byte : match: unsigned char
*     -8,U:    2 bytes: i: int
*     -6,U:    2 bytes: j: int
*     -4,U:    2 bytes: k: int
*     -2,U:    2 bytes: maxK: int
* Line lz77.c:91: if
	LDD	14,U		variable startAHead
	CMPD	10,U		variable startDicIndex
	BNE	L00095		 (optim: condBranchOverUncondBranch)
* optim: condBranchOverUncondBranch
* Useless label L00094 removed
* Line lz77.c:91
* Line lz77.c:92: init of variable t
	CLRA
	CLRB
	STD	-19,U		offset in variable t
* optim: stripExtraClrA_B
* optim: stripExtraClrA_B
	STD	-17,U		offset in variable t
	LDD	14,U		variable startAHead
	LDX	6,U		pointer input
* optimizeLoadDX
	LDB	D,X		get r-value
	STB	-15,U		offset in variable t
* Line lz77.c:93: return struct/union by value
	LEAX	-19,U		variable `t', declared at lz77.c:92
	PSHS	X		source struct/union
	LDX	4,U		address of return value
	LDD	#5		size of struct tupleStruct
	LBSR	copyMem
	LEAS	2,S		discard copyMem argument
	LBRA	L00084		return (lz77.c:93)
L00095	EQU	*		else clause of if() started at lz77.c:91
* Useless label L00096 removed
* Line lz77.c:96: init of variable t
	CLRA
	CLRB
	STD	-14,U		offset in variable t
* optim: stripExtraClrA_B
* optim: stripExtraClrA_B
	STD	-12,U		offset in variable t
	LDD	14,U		variable startAHead
	LDX	6,U		pointer input
* optimizeLoadDX
	LDB	D,X		get r-value
	STB	-10,U		offset in variable t
* Line lz77.c:97: init of variable match
	CLR	-9,U		variable match
* Line lz77.c:98: init of variable i
	CLRA
	CLRB
	STD	-8,U		variable i
* Line lz77.c:98: init of variable j
* optim: stripExtraClrA_B
* optim: stripExtraClrA_B
	STD	-6,U		variable j
* Line lz77.c:98: init of variable k
* optim: stripExtraClrA_B
* optim: stripExtraClrA_B
	STD	-4,U		variable k
* Line lz77.c:99: init of variable maxK
* optim: stripExtraClrA_B
* optim: stripExtraClrA_B
	STD	-2,U		variable maxK
* Line lz77.c:100: while
	LBRA	L00098		jump to while condition
L00097	EQU	*		while body
* Line lz77.c:102: for init
* Line lz77.c:102: assignment: =
* optim: stripConsecutiveLoadsToSameReg
	LDD	14,U
	STD	-8,U
	LBRA	L00101		jump to for condition
L00100	EQU	*
* Line lz77.c:102: for body
* Line lz77.c:103: assignment: =
	CLR	-9,U		variable match
* Line lz77.c:104: for init
* Line lz77.c:104: assignment: =
* optim: stripConsecutiveLoadsToSameReg
	LDD	10,U
	STD	-6,U
	BRA	L00105		jump to for condition
L00104	EQU	*
* Line lz77.c:104: for body
* Line lz77.c:105: if
	LDD	14,U		variable startAHead
	LDX	6,U		pointer input
* optimizeLoadDX
	LDB	D,X		get r-value
	PSHS	B
	LDD	-6,U		variable j
	LDX	6,U		pointer input
* optimizeLoadDX
	LDB	D,X		get r-value
	CMPB	,S+		compare with LSB
	BNE	L00109		 (optim: condBranchOverUncondBranch)
* optim: condBranchOverUncondBranch
* Useless label L00108 removed
* Line lz77.c:105
* Line lz77.c:107: assignment: =
	LDB	#$01
	STB	-9,U		variable match
	BRA	L00107		break
L00109	EQU	*		else clause of if() started at lz77.c:105
* Useless label L00110 removed
* Useless label L00106 removed
* Line lz77.c:104: for increment(s)
	LDD	-6,U
	ADDD	#1
	STD	-6,U
L00105	EQU	*
* Line lz77.c:104: for condition
	LDD	-6,U		variable j
	CMPD	12,U		variable stopDicIndex
	BLS	L00104
* optim: branchToNextLocation
L00107	EQU	*		end for
* Line lz77.c:111: if
	LDB	-9,U		variable `match', declared at lz77.c:97
* optim: loadCmpZeroBeqOrBne
	LBEQ	L00112		 (optim: condBranchOverUncondBranch)
* optim: condBranchOverUncondBranch
* Useless label L00111 removed
* Line lz77.c:111
* Line lz77.c:112: assignment: =
	CLRA
	LDB	#$01		decimal 1 signed
	STD	-4,U
* Line lz77.c:113: while
	BRA	L00114		jump to while condition
L00113	EQU	*		while body
* Line lz77.c:114: if
* optim: optimizeStackOperations4
* optim: optimizeStackOperations4
	LDD	-6,U		variable j
	ADDD	-4,U		variable k
	CMPD	12,U		optim: optimizeStackOperations4
	BHS	L00115		 (optim: condBranchOverUncondBranch) (optim: condBranchOverUncondBranch)
* optim: condBranchOverUncondBranch
* Useless label L00116 removed
* Line lz77.c:114
* optim: condBranchOverUncondBranch
* Useless label L00117 removed
* Useless label L00118 removed
* Line lz77.c:115: post-increment
	LDX	-4,U		variable `k', declared at lz77.c:115
	LEAX	1,X
	STX	-4,U
L00114	EQU	*		while condition at lz77.c:113
	LDD	16,U		variable aHeadSize
	ADDD	#$FFFF		65535
* optim: optimize16BitCompares
* optim: optimize16BitCompares
	CMPD	-4,U		optim: optimize16BitCompares
	BLS	L00115		optim: optimize16BitCompares (optim: condBranchOverUncondBranch)
* optim: condBranchOverUncondBranch
* Useless label L00119 removed
	LDD	14,U		variable startAHead
	ADDD	-4,U		variable k
	LDX	6,U		pointer input
* optimizeLoadDX
	LDB	D,X		get r-value
	PSHS	B
	LDD	-6,U		variable j
	ADDD	-4,U		variable k
	LDX	6,U		pointer input
* optimizeLoadDX
	LDB	D,X		get r-value
	CMPB	,S+		compare with LSB
	BEQ	L00113
* optim: branchToNextLocation
L00115	EQU	*		after end of while starting at lz77.c:113
* Line lz77.c:118: if
	LDD	-4,U		variable k
	CMPD	-2,U		variable maxK
	BLE	L00103		 (optim: condBranchOverUncondBranch)
* optim: condBranchOverUncondBranch
* Useless label L00120 removed
* Line lz77.c:118
* Line lz77.c:120: if
	LDD	8,U		variable inputSize
	ADDD	#$FFFF		65535
	PSHS	B,A
	LDD	14,U		variable startAHead
	ADDD	-4,U		variable k
	CMPD	,S++
	BHI	L00103		 (optim: condBranchOverUncondBranch) (optim: condBranchOverUncondBranch)
* optim: condBranchOverUncondBranch
* Useless label L00122 removed
* Line lz77.c:120
* optim: condBranchOverUncondBranch
* Useless label L00123 removed
* Useless label L00124 removed
* Line lz77.c:122: assignment: =
	LDD	-8,U		variable i
	SUBD	-6,U		variable j
* optim: stripUselessPushPull
* optim: optimizeLeax
* optim: stripUselessPushPull
	STD	-14,U		optim: optimizeLeax
* Line lz77.c:123: assignment: =
	LDD	-4,U		variable `k', declared at lz77.c:98
* optim: stripUselessPushPull
* optim: optimizeLeax
* optim: stripUselessPushPull
	STD	-12,U		optim: optimizeLeax
* Line lz77.c:124: assignment: =
	LDD	14,U		variable startAHead
	ADDD	-4,U		variable k
	LDX	6,U		pointer input
* optimizeLoadDX
	LDB	D,X		get r-value
* optim: stripExtraPushPullB
* optim: optimizeLeax
* optim: stripExtraPushPullB
	STB	-10,U		optim: optimizeLeax
* Line lz77.c:125: assignment: =
* optim: stripConsecutiveLoadsToSameReg
	LDD	-4,U
	STD	-2,U
* Useless label L00121 removed
* Useless label L00125 removed
	BRA	L00103		break
L00112	EQU	*		else clause of if() started at lz77.c:111
* Useless label L00126 removed
* Useless label L00102 removed
* Line lz77.c:102: for increment(s)
	LDD	-8,U
	ADDD	#1
	STD	-8,U
L00101	EQU	*
* Line lz77.c:102: for condition
	LDD	14,U		variable startAHead
	ADDD	16,U		variable aHeadSize
* optim: optimize16BitCompares
* optim: optimize16BitCompares
	CMPD	-8,U		optim: optimize16BitCompares
	LBHI	L00100		optim: optimize16BitCompares
* optim: branchToNextLocation
L00103	EQU	*		end for
* Line lz77.c:131: post-increment
	LDX	10,U		variable `startDicIndex', declared at lz77.c:131
	LEAX	1,X
	STX	10,U
L00098	EQU	*		while condition at lz77.c:100
	LDD	10,U		variable startDicIndex
	CMPD	12,U		variable stopDicIndex
	LBLS	L00097
* optim: branchToNextLocation
* Useless label L00099 removed
* Line lz77.c:133: return struct/union by value
	LEAX	-14,U		variable `t', declared at lz77.c:96
	PSHS	X		source struct/union
	LDX	4,U		address of return value
	LDD	#5		size of struct tupleStruct
	LBSR	copyMem
	LEAS	2,S		discard copyMem argument
* optim: branchToNextLocation
L00084	EQU	*		end of findInDic()
	LEAS	,U
	PULS	U,PC
* END FUNCTION findInDic(): defined at lz77.c:89
funcend_findInDic	EQU *
funcsize_findInDic	EQU	funcend_findInDic-_findInDic
_initBitField	EXPORT


*******************************************************************************

* FUNCTION initBitField(): defined at lz77.c:33
_initBitField	EQU	*
* Calling convention: Default
	PSHS	U
	LEAU	,S
* Formal parameter(s):
*      4,U:    2 bytes: bf: struct bitFieldStruct *
*      6,U:    2 bytes: buf: unsigned char *
* Line lz77.c:35: assignment: =
	CLRA
	LDB	#$07		decimal 7 signed
* optim: stripExtraPushPullB
	LDX	4,U		variable bf
* optim: optimizeLeax
* optim: stripExtraPushPullB
	STB	4,X		optim: optimizeLeax
* Line lz77.c:36: assignment: =
* optim: stripExtraClrA_B
	CLRB
* optim: stripUselessPushPull
	LDX	4,U		variable bf
* optim: optimizeLeax
* optim: stripUselessPushPull
	STD	2,X		optim: optimizeLeax
* Line lz77.c:37: assignment: =
	LDD	6,U		variable `buf', declared at lz77.c:33
* optim: stripUselessPushPull
* optim: optimizeLdx
* optim: stripUselessPushPull
	STD	[4,U]		optim: optimizeLdx
* Useless label L00081 removed
	LEAS	,U
	PULS	U,PC
* END FUNCTION initBitField(): defined at lz77.c:33
funcend_initBitField	EQU *
funcsize_initBitField	EQU	funcend_initBitField-_initBitField
_initDefaultParameters	EXPORT


*******************************************************************************

* FUNCTION initDefaultParameters(): defined at lz77.c:17
_initDefaultParameters	EQU	*
* Calling convention: Default
* Line lz77.c:19: assignment: =
	LDD	#$0FFF		decimal 4095 signed
	STD	_dicSize+0,PCR
* Line lz77.c:20: assignment: =
	LDB	#$0C
	STB	_dicBitSize+0,PCR	variable dicBitSize
* Line lz77.c:21: assignment: =
	CLRA
	LDB	#$3F		decimal 63 signed
	STD	_aheadSize+0,PCR
* Line lz77.c:22: assignment: =
	LDB	#$06
	STB	_aheadBitSize+0,PCR	variable aheadBitSize
* Useless label L00079 removed
	RTS
* END FUNCTION initDefaultParameters(): defined at lz77.c:17
funcend_initDefaultParameters	EQU *
funcsize_initDefaultParameters	EQU	funcend_initDefaultParameters-_initDefaultParameters
_initParameters	EXPORT


*******************************************************************************

* FUNCTION initParameters(): defined at lz77.c:25
_initParameters	EQU	*
* Calling convention: Default
	PSHS	U
	LEAU	,S
* Formal parameter(s):
*      4,U:    2 bytes: dsz: unsigned int
*      7,U:    1 byte : bdsz: unsigned char
*      8,U:    2 bytes: asz: unsigned int
*     11,U:    1 byte : basz: unsigned char
* Line lz77.c:27: assignment: =
* optim: stripConsecutiveLoadsToSameReg
	LDD	4,U
	STD	_dicSize+0,PCR
* Line lz77.c:28: assignment: =
	LDB	7,U		variable `bdsz', declared at lz77.c:25
	STB	_dicBitSize+0,PCR
* Line lz77.c:29: assignment: =
* optim: stripConsecutiveLoadsToSameReg
	LDD	8,U
	STD	_aheadSize+0,PCR
* Line lz77.c:30: assignment: =
	LDB	11,U		variable `basz', declared at lz77.c:25
	STB	_aheadBitSize+0,PCR
* Useless label L00080 removed
	LEAS	,U
	PULS	U,PC
* END FUNCTION initParameters(): defined at lz77.c:25
funcend_initParameters	EQU *
funcsize_initParameters	EQU	funcend_initParameters-_initParameters
_isalnum	IMPORT
_isalpha	IMPORT
_isdigit	IMPORT
_isspace	IMPORT
_itoa10	IMPORT
_labs	IMPORT
_ltoa10	IMPORT
_memchr	IMPORT
_memcmp	IMPORT
_memcpy	IMPORT
_memichr	IMPORT
_memicmp	IMPORT
_memmove	IMPORT
_memset	IMPORT
_memset16	IMPORT
_mulwb	IMPORT
_mulww	IMPORT
_printf	IMPORT
_putchar	IMPORT
_putstr	IMPORT
_qsort	IMPORT
_rand	IMPORT
_readbits	EXPORT


*******************************************************************************

* FUNCTION readbits(): defined at lz77.c:66
_readbits	EQU	*
* Calling convention: Default
	PSHS	U
	LEAU	,S
	LEAS	-6,S
* Formal parameter(s):
*      4,U:    2 bytes: bf: struct bitFieldStruct *
*      7,U:    1 byte : bitCount: unsigned char
* Local non-static variable(s):
*     -6,U:    1 byte : mask: unsigned char
*     -5,U:    2 bytes: value: unsigned int
*     -3,U:    2 bytes: currentBit: unsigned int
*     -1,U:    1 byte : bitSet: unsigned char
* Line lz77.c:69: init of variable mask
	CLR	-6,U		variable mask
* Line lz77.c:70: init of variable value
	CLRA
	CLRB
	STD	-5,U		variable value
* Line lz77.c:71: init of variable currentBit
* optim: stripExtraClrA_B
* optim: stripExtraClrA_B
	STD	-3,U		variable currentBit
* Line lz77.c:72: init of variable bitSet
	CLR	-1,U		variable bitSet
* Line lz77.c:73: while
	LBRA	L00128		jump to while condition
L00127	EQU	*		while body
* Line lz77.c:74: assignment: =
	CLRA
	LDB	#$01		decimal 1 signed
	PSHS	B,A		left side of shift: used and popped by shiftLeft
	LDX	4,U		variable bf
	LDB	4,X		member bitLeft of bitFieldStruct
* optim: stripExtraClrA_B
	LBSR	shiftLeft
* Cast from `int' to byte: result already in B
	STB	-6,U
* Line lz77.c:75: assignment: =
* optim: storeLoad
	PSHS	B
	LDX	4,U		variable bf
	LDD	2,X		member currentIndex of bitFieldStruct
	PSHS	B,A		preserve array index
	LDX	4,U		variable bf
	LDD	,X		member buffer of bitFieldStruct
	ADDD	,S++		add stacked array index to array address in D
	TFR	D,X		put resulting address in X
	LDB	,X		get r-value
	ANDB	,S+
	PSHS	B		left side of shift: used and popped by shiftByteRightUnsigned
	LDX	4,U		variable bf
	LDB	4,X		member bitLeft of bitFieldStruct
	CLRA
	LBSR	shiftByteRightUnsigned
	CLRA
	STD	-3,U
* Line lz77.c:76: assignment: |=
* optim: storeLoad
	PSHS	B,A		left side of shift: used and popped by shiftLeft
	LDB	-1,U		variable `bitSet', declared at lz77.c:72
* optim: stripExtraClrA_B
	LBSR	shiftLeft
	PSHS	B,A
	LEAX	-5,U
	LDD	,S++
	ORA	,X
	ORB	1,X
	STD	,X
* Line lz77.c:77: post-decrement
	DEC	7,U
* Line lz77.c:78: post-increment
	INC	-1,U
* Line lz77.c:79: post-decrement
	LDX	4,U		variable bf
* optim: optimizeLeax
	DEC	4,X		optim: optimizeLeax
* Line lz77.c:80: if
	LDX	4,U		variable bf
	LDB	4,X		member bitLeft of bitFieldStruct
	CMPB	#0
	BGE	L00131		 (optim: condBranchOverUncondBranch)
* optim: condBranchOverUncondBranch
* Useless label L00130 removed
* Line lz77.c:80
* Line lz77.c:81: assignment: =
	CLRA
* LDB #$07 optim: optimizeStackOperations1
* PSHS B optim: optimizeStackOperations1
	LDX	4,U		variable bf
* optim: optimizeLeax
	LDB	#7		optim: optimizeStackOperations1
	STB	4,X		optim: optimizeLeax
* Line lz77.c:82: post-increment
	LDX	4,U		variable bf
	LEAX	2,X		member currentIndex of bitFieldStruct
	LDD	,X
	ADDD	#1
	STD	,X
L00131	EQU	*		else clause of if() started at lz77.c:80
* Useless label L00132 removed
L00128	EQU	*		while condition at lz77.c:73
	LDB	7,U		variable `bitCount', declared at lz77.c:66
* optim: loadCmpZeroBeqOrBne
	LBNE	L00127
* optim: branchToNextLocation
* Useless label L00129 removed
* Line lz77.c:85: return with value
	LDD	-5,U		variable `value', declared at lz77.c:70
* optim: branchToNextLocation
* Useless label L00083 removed
	LEAS	,U
	PULS	U,PC
* END FUNCTION readbits(): defined at lz77.c:66
funcend_readbits	EQU *
funcsize_readbits	EQU	funcend_readbits-_readbits
_readline	IMPORT
_readword	IMPORT
_sbrk	IMPORT
_sbrkmax	IMPORT
_setConsoleOutHook	IMPORT
_set_null_ptr_handler	IMPORT
_set_stack_overflow_handler	IMPORT
_sprintf	IMPORT
_sqrt16	IMPORT
_sqrt32	IMPORT
_srand	IMPORT
_strcat	IMPORT
_strchr	IMPORT
_strcmp	IMPORT
_strcpy	IMPORT
_stricmp	IMPORT
_strlen	IMPORT
_strlwr	IMPORT
_strncmp	IMPORT
_strncpy	IMPORT
_strstr	IMPORT
_strtol	IMPORT
_strtoul	IMPORT
_strupr	IMPORT
_subdww	IMPORT
_tolower	IMPORT
_toupper	IMPORT
_ultoa10	IMPORT
_uncompress	EXPORT


*******************************************************************************

* FUNCTION uncompress(): defined at lz77.c:221
_uncompress	EQU	*
* Calling convention: Default
	PSHS	U
	LEAU	,S
	LEAS	-12,S
* Formal parameter(s):
*      4,U:    2 bytes: input: unsigned char *
*      6,U:    2 bytes: iSize: unsigned int
*      8,U:    2 bytes: output: unsigned char *
*     10,U:    2 bytes: oSize: unsigned int
* Local non-static variable(s):
*    -12,U:    5 bytes: t: struct tupleStruct
*     -7,U:    5 bytes: bf: struct bitFieldStruct
*     -2,U:    2 bytes: outputIdx: int
* Line lz77.c:224: function call: initBitField()
	LDD	4,U		variable `input', declared at lz77.c:221
	PSHS	B,A		argument 2 of initBitField(): unsigned char *
	LEAX	-7,U		variable `bf', declared at lz77.c:223
	PSHS	X		argument 1 of initBitField(): struct bitFieldStruct *
	LBSR	_initBitField
	LEAS	4,S
* Line lz77.c:225: init of variable outputIdx
	CLRA
	CLRB
	STD	-2,U		variable outputIdx
* Line lz77.c:226: function call: memset()
	LDD	10,U		variable `oSize', declared at lz77.c:221
	PSHS	B,A		argument 3 of memset(): unsigned int
	CLRA
	CLRB
	PSHS	B,A		argument 2 of memset(): int
	LDD	8,U		variable `output', declared at lz77.c:221
	PSHS	B,A		argument 1 of memset(): unsigned char *
	LBSR	_memset
	LEAS	6,S
* Line lz77.c:228: while
	LBRA	L00134		jump to while condition
L00133	EQU	*		while body
* Line lz77.c:231: assignment: =
* Line lz77.c:231: function call: readbits()
	LDB	_dicBitSize+0,PCR	variable `dicBitSize', declared at lz77.c:10
	CLRA			promoting byte argument to word
	PSHS	B,A		argument 2 of readbits(): unsigned char
	LEAX	-7,U		variable `bf', declared at lz77.c:223
	PSHS	X		argument 1 of readbits(): struct bitFieldStruct *
	LBSR	_readbits
	LEAS	4,S
* optim: stripUselessPushPull
* optim: optimizeLeax
* optim: stripUselessPushPull
	STD	-12,U		optim: optimizeLeax
* Line lz77.c:232: assignment: =
* Line lz77.c:232: function call: readbits()
	LDB	_aheadBitSize+0,PCR	variable `aheadBitSize', declared at lz77.c:12
	CLRA			promoting byte argument to word
	PSHS	B,A		argument 2 of readbits(): unsigned char
	LEAX	-7,U		variable `bf', declared at lz77.c:223
	PSHS	X		argument 1 of readbits(): struct bitFieldStruct *
	LBSR	_readbits
	LEAS	4,S
* optim: stripUselessPushPull
* optim: optimizeLeax
* optim: stripUselessPushPull
	STD	-10,U		optim: optimizeLeax
* Line lz77.c:233: assignment: =
* Line lz77.c:233: function call: readbits()
	CLRA
	LDB	#$08		decimal 8 signed
	PSHS	B,A		argument 2 of readbits(): int
	LEAX	-7,U		variable `bf', declared at lz77.c:223
	PSHS	X		argument 1 of readbits(): struct bitFieldStruct *
	LBSR	_readbits
	LEAS	4,S
* Cast from `unsigned int' to byte: result already in B
* optim: stripExtraPushPullB
* optim: optimizeLeax
* optim: stripExtraPushPullB
	STB	-8,U		optim: optimizeLeax
* Line lz77.c:236: if
	LDD	-12,U		member d of tupleStruct, via variable t
* optim: loadCmpZeroBeqOrBne
	BEQ	L00137		 (optim: condBranchOverUncondBranch)
* optim: condBranchOverUncondBranch
* Useless label L00136 removed
* Line lz77.c:236
* Line lz77.c:237: function call: memcpy()
	LDD	-10,U		member l of tupleStruct, via variable t
	PSHS	B,A		argument 3 of memcpy(): unsigned int
* optim: optimizeStackOperations4
* optim: optimizeStackOperations4
* optim: optimizeStackOperations4
* optim: optimizeStackOperations4
	LDD	8,U		variable `output', declared at lz77.c:221
	ADDD	-2,U		optim: optimizeStackOperations4
	SUBD	-12,U		optim: optimizeStackOperations4
	PSHS	B,A		argument 2 of memcpy(): unsigned char *
* optim: optimizeStackOperations4
* optim: optimizeStackOperations4
	LDD	8,U		variable `output', declared at lz77.c:221
	ADDD	-2,U		optim: optimizeStackOperations4
	PSHS	B,A		argument 1 of memcpy(): unsigned char *
	LBSR	_memcpy
	LEAS	6,S
* Line lz77.c:238: assignment: +=
* optim: optimizeStackOperations4
* optim: optimizeStackOperations4
	LDD	-2,U
	ADDD	-10,U		optim: optimizeStackOperations4
	STD	-2,U
L00137	EQU	*		else clause of if() started at lz77.c:236
* Useless label L00138 removed
* Line lz77.c:241: assignment: =
	LDB	-8,U		member c of tupleStruct, via variable t
	PSHS	B
	LDD	-2,U		variable `outputIdx', declared at lz77.c:241
	ADDD	#1
	STD	-2,U
	SUBD	#1		post increment yields initial value
	LDX	8,U		pointer output
	LEAX	D,X		add offset
	LDB	,S+
	STB	,X
L00134	EQU	*		while condition at lz77.c:228
* optim: optimizeStackOperations4
* optim: optimizeStackOperations4
	LDD	-5,U		member currentIndex of bitFieldStruct, via variable bf
	CMPD	6,U		optim: optimizeStackOperations4
	LBLO	L00133
* optim: branchToNextLocation
* Useless label L00135 removed
* Line lz77.c:243: return with value
	LDD	-2,U		variable `outputIdx', declared at lz77.c:225
* optim: branchToNextLocation
* Useless label L00086 removed
	LEAS	,U
	PULS	U,PC
* END FUNCTION uncompress(): defined at lz77.c:221
funcend_uncompress	EQU *
funcsize_uncompress	EQU	funcend_uncompress-_uncompress
_utoa10	IMPORT
_vprintf	IMPORT
_vsprintf	IMPORT
_writebits	EXPORT


*******************************************************************************

* FUNCTION writebits(): defined at lz77.c:40
_writebits	EQU	*
* Calling convention: Default
	PSHS	U
	LEAU	,S
	LEAS	-2,S
* Formal parameter(s):
*      4,U:    2 bytes: bf: struct bitFieldStruct *
*      6,U:    2 bytes: value: unsigned int
*      9,U:    1 byte : bitCount: unsigned char
* Local non-static variable(s):
*     -2,U:    1 byte : i: unsigned char
*     -1,U:    1 byte : bitSet: unsigned char
* Line lz77.c:44: init of variable bitSet
	CLR	-1,U		variable bitSet
* Line lz77.c:45: while
	LBRA	L00140		jump to while condition
L00139	EQU	*		while body
* Line lz77.c:46: init of variable currentBit
	LDD	6,U		variable value
	CLRA			optim: andA_B0
	ANDB	#$01
* Cast from `unsigned int' to byte: result already in B
	STB	-2,U		variable currentBit
* Line lz77.c:47: assignment: |=
* optim: storeLoad
	PSHS	B		left side of shift: used and popped by shiftByteLeft
	LDX	4,U		variable bf
	LDB	4,X		member bitLeft of bitFieldStruct
* optim: stripExtraClrA_B
	LBSR	shiftByteLeft
	PSHS	B
	LDX	4,U		variable bf
	LDD	2,X		member currentIndex of bitFieldStruct
	PSHS	B,A		preserve array index
	LDX	4,U		variable bf
	LDD	,X		member buffer of bitFieldStruct
	ADDD	,S++		add stacked array index to array address in D
	TFR	D,X		put resulting address in X
	LDB	,X
	ORB	,S+
	STB	,X
* Line lz77.c:48: post-decrement
	LDX	4,U		variable bf
* optim: optimizeLeax
	DEC	4,X		optim: optimizeLeax
* Line lz77.c:49: if
	LDX	4,U		variable bf
	LDB	4,X		member bitLeft of bitFieldStruct
	CMPB	#0
	BGE	L00143		 (optim: condBranchOverUncondBranch)
* optim: condBranchOverUncondBranch
* Useless label L00142 removed
* Line lz77.c:49
* Line lz77.c:50: assignment: =
	CLRA
* LDB #$07 optim: optimizeStackOperations1
* PSHS B optim: optimizeStackOperations1
	LDX	4,U		variable bf
* optim: optimizeLeax
	LDB	#7		optim: optimizeStackOperations1
	STB	4,X		optim: optimizeLeax
* Line lz77.c:51: post-increment
	LDX	4,U		variable bf
	LEAX	2,X		member currentIndex of bitFieldStruct
	LDD	,X
	ADDD	#1
	STD	,X
L00143	EQU	*		else clause of if() started at lz77.c:49
* Useless label L00144 removed
* Line lz77.c:53: post-increment
	INC	-1,U
* Line lz77.c:54: assignment: =
	LDD	6,U		variable `value', declared at lz77.c:40
	LSRA
	RORB
	STD	6,U
L00140	EQU	*		while condition at lz77.c:45
	LDD	6,U		variable `value', declared at lz77.c:40
* optim: loadCmpZeroBeqOrBne
	LBNE	L00139
* optim: branchToNextLocation
* Useless label L00141 removed
* Line lz77.c:56: for init
* Line lz77.c:56: init of variable i
	CLR	-2,U		variable i
	BRA	L00146		jump to for condition
L00145	EQU	*
* Line lz77.c:56: for body
* Line lz77.c:57: assignment: |=
	CLRA
	CLRB
	PSHS	B,A		left side of shift: used and popped by shiftLeft
	LDX	4,U		variable bf
	LDB	4,X		member bitLeft of bitFieldStruct
* optim: stripExtraClrA_B
	LBSR	shiftLeft
* Cast from `int' to byte: result already in B
	PSHS	B
	LDX	4,U		variable bf
	LDD	2,X		member currentIndex of bitFieldStruct
	PSHS	B,A		preserve array index
	LDX	4,U		variable bf
	LDD	,X		member buffer of bitFieldStruct
	ADDD	,S++		add stacked array index to array address in D
	TFR	D,X		put resulting address in X
	LDB	,X
	ORB	,S+
	STB	,X
* Line lz77.c:58: post-decrement
	LDX	4,U		variable bf
* optim: optimizeLeax
	DEC	4,X		optim: optimizeLeax
* Line lz77.c:59: if
	LDX	4,U		variable bf
	LDB	4,X		member bitLeft of bitFieldStruct
	CMPB	#0
	BGE	L00150		 (optim: condBranchOverUncondBranch)
* optim: condBranchOverUncondBranch
* Useless label L00149 removed
* Line lz77.c:59
* Line lz77.c:60: assignment: =
	CLRA
* LDB #$07 optim: optimizeStackOperations1
* PSHS B optim: optimizeStackOperations1
	LDX	4,U		variable bf
* optim: optimizeLeax
	LDB	#7		optim: optimizeStackOperations1
	STB	4,X		optim: optimizeLeax
* Line lz77.c:61: post-increment
	LDX	4,U		variable bf
	LEAX	2,X		member currentIndex of bitFieldStruct
	LDD	,X
	ADDD	#1
	STD	,X
L00150	EQU	*		else clause of if() started at lz77.c:59
* Useless label L00151 removed
* Useless label L00147 removed
* Line lz77.c:56: for increment(s)
	INC	-2,U
L00146	EQU	*
* Line lz77.c:56: for condition
	LDB	9,U		variable bitCount
	SUBB	-1,U		variable bitSet
	PSHS	B
	LDB	-2,U		variable `i', declared at lz77.c:56
	CMPB	,S+		compare with LSB
	LBLO	L00145
* optim: branchToNextLocation
* Useless label L00148 removed
* Useless label L00082 removed
	LEAS	,U
	PULS	U,PC
* END FUNCTION writebits(): defined at lz77.c:40
funcend_writebits	EQU *
funcsize_writebits	EQU	funcend_writebits-_writebits
_zerodw	IMPORT


	ENDSECTION




	SECTION	initgl




*******************************************************************************

* Initialize global variables.


	ENDSECTION




	SECTION	rodata


string_literals_start	EQU	*
string_literals_end	EQU	*


*******************************************************************************

* READ-ONLY GLOBAL VARIABLES


	ENDSECTION




	SECTION	rwdata


* Statically-initialized global variables
* Statically-initialized local static variables


	ENDSECTION




	SECTION	bss


bss_start	EQU	*
* Uninitialized global variables
_dicBitSize	EQU	*
	RMB	1		dicBitSize
_dicSize	EQU	*
	RMB	2		dicSize
_aheadBitSize	EQU	*
	RMB	1		aheadBitSize
_aheadSize	EQU	*
	RMB	2		aheadSize
* Uninitialized local static variables
bss_end	EQU	*


	ENDSECTION




*******************************************************************************

* Importing 6 utility routine(s).
_memcpy	IMPORT
_memset	IMPORT
copyMem	IMPORT
shiftByteLeft	IMPORT
shiftByteRightUnsigned	IMPORT
shiftLeft	IMPORT


*******************************************************************************

	END
