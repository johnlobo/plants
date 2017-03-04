                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.5 #9498 (CYGWIN)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _initialize
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_setVideoMode
                             15 	.globl _cpct_drawStringM1
                             16 	.globl _cpct_memset
                             17 	.globl _cpct_disableFirmware
                             18 ;--------------------------------------------------------
                             19 ; special function registers
                             20 ;--------------------------------------------------------
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _DATA
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _INITIALIZED
                             29 ;--------------------------------------------------------
                             30 ; absolute external ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DABS (ABS)
                             33 ;--------------------------------------------------------
                             34 ; global & static initialisations
                             35 ;--------------------------------------------------------
                             36 	.area _HOME
                             37 	.area _GSINIT
                             38 	.area _GSFINAL
                             39 	.area _GSINIT
                             40 ;--------------------------------------------------------
                             41 ; Home
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _HOME
                             45 ;--------------------------------------------------------
                             46 ; code
                             47 ;--------------------------------------------------------
                             48 	.area _CODE
                             49 ;src/main.c:23: void initialize() {
                             50 ;	---------------------------------
                             51 ; Function initialize
                             52 ; ---------------------------------
   403D                      53 _initialize::
                             54 ;src/main.c:24: cpct_disableFirmware();
   403D CD 74 41      [17]   55 	call	_cpct_disableFirmware
                             56 ;src/main.c:25: cpct_setVideoMode(0);
   4040 2E 00         [ 7]   57 	ld	l,#0x00
   4042 C3 54 41      [10]   58 	jp  _cpct_setVideoMode
                             59 ;src/main.c:46: void main(void) {
                             60 ;	---------------------------------
                             61 ; Function main
                             62 ; ---------------------------------
   4045                      63 _main::
                             64 ;src/main.c:50: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
   4045 21 00 40      [10]   65 	ld	hl,#0x4000
   4048 E5            [11]   66 	push	hl
   4049 AF            [ 4]   67 	xor	a, a
   404A F5            [11]   68 	push	af
   404B 33            [ 6]   69 	inc	sp
   404C 26 C0         [ 7]   70 	ld	h, #0xC0
   404E E5            [11]   71 	push	hl
   404F CD 66 41      [17]   72 	call	_cpct_memset
                             73 ;src/main.c:53: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 96);
   4052 21 14 60      [10]   74 	ld	hl,#0x6014
   4055 E5            [11]   75 	push	hl
   4056 21 00 C0      [10]   76 	ld	hl,#0xC000
   4059 E5            [11]   77 	push	hl
   405A CD 85 41      [17]   78 	call	_cpct_getScreenPtr
   405D 4D            [ 4]   79 	ld	c,l
   405E 44            [ 4]   80 	ld	b,h
                             81 ;src/main.c:54: cpct_drawStringM1("Welcome to CPCtelera!", pvmem, 1, 0);
   405F 21 01 00      [10]   82 	ld	hl,#0x0001
   4062 E5            [11]   83 	push	hl
   4063 C5            [11]   84 	push	bc
   4064 21 72 40      [10]   85 	ld	hl,#___str_0
   4067 E5            [11]   86 	push	hl
   4068 CD 94 40      [17]   87 	call	_cpct_drawStringM1
   406B 21 06 00      [10]   88 	ld	hl,#6
   406E 39            [11]   89 	add	hl,sp
   406F F9            [ 6]   90 	ld	sp,hl
                             91 ;src/main.c:57: while (1);
   4070                      92 00102$:
   4070 18 FE         [12]   93 	jr	00102$
   4072                      94 ___str_0:
   4072 57 65 6C 63 6F 6D    95 	.ascii "Welcome to CPCtelera!"
        65 20 74 6F 20 43
        50 43 74 65 6C 65
        72 61 21
   4087 00                   96 	.db 0x00
                             97 	.area _CODE
                             98 	.area _INITIALIZER
                             99 	.area _CABS (ABS)
