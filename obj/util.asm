;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.5 #9498 (CYGWIN)
;--------------------------------------------------------
	.module util
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _checkKeys
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_isKeyPressed
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
;src/util.c:4: u8 checkKeys(const cpct_keyID* k, u8 numk) {
;	---------------------------------
; Function checkKeys
; ---------------------------------
_checkKeys::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/util.c:7: if (cpct_isAnyKeyPressed()) {
	call	_cpct_isAnyKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00105$
;src/util.c:8: for(i=1; i <= numk; i++, k++) {
	ld	bc,#0x0101
	ld	e,4 (ix)
	ld	d,5 (ix)
00107$:
	ld	a,6 (ix)
	sub	a, b
	jr	C,00105$
;src/util.c:9: if (cpct_isKeyPressed(*k))
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	push	bc
	push	de
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a,l
	or	a, a
	jr	Z,00108$
;src/util.c:10: return i;
	ld	l,c
	jr	00109$
00108$:
;src/util.c:8: for(i=1; i <= numk; i++, k++) {
	inc	b
	ld	c,b
	inc	de
	inc	de
	jr	00107$
00105$:
;src/util.c:13: return 0;
	ld	l,#0x00
00109$:
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
