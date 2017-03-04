;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (CYGWIN)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _initialize
	.globl _cpct_getScreenPtr
	.globl _cpct_setVideoMode
	.globl _cpct_drawStringM1
	.globl _cpct_memset
	.globl _cpct_disableFirmware
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:23: void initialize() {
;	---------------------------------
; Function initialize
; ---------------------------------
_initialize::
;src/main.c:24: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:25: cpct_setVideoMode(0);
	ld	l,#0x00
	jp  _cpct_setVideoMode
;src/main.c:46: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:50: cpct_memset(CPCT_VMEM_START, 0, 0x4000);
	ld	hl,#0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xC0
	push	hl
	call	_cpct_memset
;src/main.c:53: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 20, 96);
	ld	hl,#0x6014
	push	hl
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,l
	ld	b,h
;src/main.c:54: cpct_drawStringM1("Welcome to CPCtelera!", pvmem, 1, 0);
	ld	hl,#0x0001
	push	hl
	push	bc
	ld	hl,#___str_0
	push	hl
	call	_cpct_drawStringM1
	ld	hl,#6
	add	hl,sp
	ld	sp,hl
;src/main.c:57: while (1);
00102$:
	jr	00102$
___str_0:
	.ascii "Welcome to CPCtelera!"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)