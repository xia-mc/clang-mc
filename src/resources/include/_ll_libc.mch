#once

#include "_ll_std"

// -- Begin function cabs
cabs:                                   // @cabs
// %bb.0:
	mov	r4, [r0]
	mov	r3, r0
add	r3, 4
	mov	r1, r0
add	r1, 8
	mov	r2, [r1]
add	r0, 12
	mov	r1, [r0]
	mov	r5, [r3]
	mov	r0, r2
	mov	r3, r1
	call	__muldf3
	mov	r6, rax
	mov	r7, t0
	mov	r0, r4
	mov	r1, r5
	mov	r2, r4
	mov	r3, r5
	call	__muldf3
	mov	r1, t0
	mov	r0, rax
	mov	r2, r6
	mov	r3, r7
	call	__adddf3
	mov	r1, t0
	mov	r0, rax
	jmp	sqrt
// -- End function
// -- Begin function creal
creal:                                  // @creal
// %bb.0:
	mov	rax, [r0]
add	r0, 4
	mov	t0, [r0]
	ret
// -- End function
// -- Begin function cimag
cimag:                                  // @cimag
// %bb.0:
	mov	r1, r0
add	r1, 8
	mov	rax, [r1]
add	r0, 12
	mov	t0, [r0]
	ret
// -- End function
// -- Begin function cabsf
cabsf:                                  // @cabsf
// %bb.0:
	mov	r2, [r0]
add	r0, 4
	mov	r0, [r0]
	mov	r1, r0
	call	__mulsf3
	mov	r3, rax
	mov	r0, r2
	mov	r1, r2
	call	__mulsf3
	mov	r0, rax
	mov	r1, r3
	call	__addsf3
	mov	r0, rax
	call	__extendsfdf2
	mov	r1, t0
	mov	r0, rax
	call	sqrt
	mov	r1, t0
	mov	r0, rax
	call	__truncdfsf2
	ret
// -- End function
// -- Begin function crealf
crealf:                                 // @crealf
// %bb.0:
	mov	rax, [r0]
	ret
// -- End function
// -- Begin function cimagf
cimagf:                                 // @cimagf
// %bb.0:
add	r0, 4
	mov	rax, [r0]
	ret
// -- End function
// -- Begin function cabsl
cabsl:                                  // @cabsl
// %bb.0:
	mov	r4, [r0]
	mov	r3, r0
add	r3, 4
	mov	r1, r0
add	r1, 8
	mov	r2, [r1]
add	r0, 12
	mov	r1, [r0]
	mov	r5, [r3]
	mov	r0, r2
	mov	r3, r1
	call	__muldf3
	mov	r6, rax
	mov	r7, t0
	mov	r0, r4
	mov	r1, r5
	mov	r2, r4
	mov	r3, r5
	call	__muldf3
	mov	r1, t0
	mov	r0, rax
	mov	r2, r6
	mov	r3, r7
	call	__adddf3
	mov	r1, t0
	mov	r0, rax
	jmp	sqrt
// -- End function
// -- Begin function creall
creall:                                 // @creall
// %bb.0:
	mov	rax, [r0]
add	r0, 4
	mov	t0, [r0]
	ret
// -- End function
// -- Begin function cimagl
cimagl:                                 // @cimagl
// %bb.0:
	mov	r1, r0
add	r1, 8
	mov	rax, [r1]
add	r0, 12
	mov	t0, [r0]
	ret
// -- End function
// -- Begin function conj
conj:                                   // @conj
// %bb.0:
	mov	r4, [r1]
	mov	r2, r1
add	r2, 4
	mov	r3, r1
add	r3, 8
	mov	r5, [r3]
add	r1, 12
	mov	r6, [r1]
	mov	r7, [r2]
	mov	r2, 0
	mov	r3, -2147483648
	mov	t1, r0
	mov	r0, r5
	mov	r1, r6
	call	__muldf3
	mov	r3, t0
	mov	r0, r4
	mov	r1, r7
	mov	r2, rax
	call	__adddf3
	mov	r1, -2147483648
	mov	r2, rax
	mov	r3, t0
	mov	r0, r6
	call	__bit_xor
	mov	r0, t1
add	r0, 8
	mov	[t1], r2
	mov	r1, t1
add	r1, 4
	mov	[r1], r3
	mov	[r0], r5
add	t1, 12
	mov	[t1], rax
	ret
// -- End function
// -- Begin function conjf
conjf:                                  // @conjf
// %bb.0:
	mov	r2, [r1]
add	r1, 4
	mov	r3, [r1]
	mov	r1, -2147483648
	mov	r4, r0
	mov	r0, r3
	call	__mulsf3
	mov	r0, r2
	mov	r1, rax
	call	__addsf3
	mov	r1, -2147483648
	mov	r2, rax
	mov	r0, r3
	call	__bit_xor
	mov	[r4], r2
add	r4, 4
	mov	[r4], rax
	ret
// -- End function
// -- Begin function conjl
conjl:                                  // @conjl
// %bb.0:
	mov	r4, [r1]
	mov	r2, r1
add	r2, 4
	mov	r3, r1
add	r3, 8
	mov	r5, [r3]
add	r1, 12
	mov	r6, [r1]
	mov	r7, [r2]
	mov	r2, 0
	mov	r3, -2147483648
	mov	t1, r0
	mov	r0, r5
	mov	r1, r6
	call	__muldf3
	mov	r3, t0
	mov	r0, r4
	mov	r1, r7
	mov	r2, rax
	call	__adddf3
	mov	r1, -2147483648
	mov	r2, rax
	mov	r3, t0
	mov	r0, r6
	call	__bit_xor
	mov	r0, t1
add	r0, 8
	mov	[t1], r2
	mov	r1, t1
add	r1, 4
	mov	[r1], r3
	mov	[r0], r5
add	t1, 12
	mov	[t1], rax
	ret
// -- End function
// -- Begin function isupper
isupper:                                // @isupper
// %bb.0:
add	r0, -91
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function islower
islower:                                // @islower
// %bb.0:
add	r0, -123
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function isalpha
isalpha:                                // @isalpha
// %bb.0:
	mov	r1, -33
	call	__bit_and
add	rax, -91
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function isdigit
isdigit:                                // @isdigit
// %bb.0:
add	r0, -58
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function isxdigit
isxdigit:                               // @isxdigit
// %bb.0:
	mov	r2, r0
add	r0, -58
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -33
	mov	r3, rax
	mov	r0, r2
	call	__bit_and
add	rax, -71
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function isalnum
isalnum:                                // @isalnum
// %bb.0:
	mov	r1, -33
	mov	r2, r0
	call	__bit_and
add	rax, -91
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
add	r2, -58
	mov	r1, 31
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_or
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function isspace
isspace:                                // @isspace
// %bb.0:
	mov	r2, r0
add	r0, -9
	mov	r1, -2147483648
	mov	r3, 1
	call	__bit_xor
	mov	r4, -2147483646
	jl	rax, r4, .LBB18_4
	jmp	.LBB18_1
.LBB18_1:
	mov	r0, r2
add	r0, -12
	call	__bit_xor
	jl	rax, r4, .LBB18_4
	jmp	.LBB18_2
.LBB18_2:
	mov	r0, 32
	je	r2, r0, .LBB18_4
	jmp	.LBB18_3
.LBB18_3:
	mov	r1, 11
	mov	r0, r2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
.LBB18_4:
	mov	rax, r3
	ret
// -- End function
// -- Begin function isblank
isblank:                                // @isblank
// %bb.0:
	mov	r1, 32
	mov	r2, r0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r1, 9
	mov	r3, rax
	mov	r0, r2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function iscntrl
iscntrl:                                // @iscntrl
// %bb.0:
	mov	r2, r0
add	r0, -128
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	r3, rax
	mov	r0, r2
	call	__bit_xor
add	rax, 2147483616
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 127
	mov	r4, rax
	mov	r0, r2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	r0, r3
	mov	r1, rax
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function isprint
isprint:                                // @isprint
// %bb.0:
add	r0, -127
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function isgraph
isgraph:                                // @isgraph
// %bb.0:
add	r0, -127
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function ispunct
ispunct:                                // @ispunct
// %bb.0:
	mov	r2, r0
add	r0, -127
	mov	r1, -2147483648
	mov	r3, 0
	call	__bit_xor
	mov	r0, 2147483554
	jl	rax, r0, .LBB23_2
	jmp	.LBB23_1
.LBB23_1:
	mov	r1, 95
	mov	r0, r2
	call	__bit_and
add	rax, -65
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
add	r2, -48
	mov	r1, 31
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
.LBB23_2:
	mov	rax, r3
	ret
// -- End function
// -- Begin function tolower
tolower:                                // @tolower
// %bb.0:
	mov	r2, r0
add	r0, -91
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483622
	jl	rax, r0, .LBB24_2
	jmp	.LBB24_1
.LBB24_1:
add	r2, 32
.LBB24_2:
	mov	rax, r2
	ret
// -- End function
// -- Begin function toupper
toupper:                                // @toupper
// %bb.0:
	mov	r2, r0
add	r0, -123
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483622
	jl	rax, r0, .LBB25_2
	jmp	.LBB25_1
.LBB25_1:
add	r2, -32
.LBB25_2:
	mov	rax, r2
	ret
// -- End function
// -- Begin function imaxabs
imaxabs:                                // @imaxabs
// %bb.0:
	mov	r2, r1
	mov	r1, -2147483648
	mov	r3, r0
	mov	r0, r2
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	r4, rax
	mov	r0, r3
	add	r0, r0
	mov	r1, 0
	sub	r1, r0
add	r4, 1
	mov	r5, 0
	mov	r0, r4
	call	__bit_and
	mov	r6, rax
	add	r6, r3
	mov	r0, r3
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	rax, r2
	add	rax, r2
	sub	r5, rax
	mov	r0, r4
	mov	r1, r5
	call	__bit_and
	add	r2, rax
	mov	rax, r6
	mov	t0, r2
	ret
// -- End function
// -- Begin function imaxdiv
imaxdiv:                                // @imaxdiv
// %bb.0:
	mov	r5, r3
	mov	r6, r2
	mov	r7, r1
	mov	t1, r0
	mov	r0, r7
	mov	r1, r6
	mov	r2, r5
	mov	r3, r4
	call	__divdi3
	mov	r1, t0
	mov	r0, t1
add	r0, 4
	mov	[r0], r1
	mov	[t1], rax
	mov	r0, rax
	call	__muldi3
	mov	r3, t0
	mov	r0, r7
	mov	r1, r6
	mov	r2, rax
	call	__subdi3
	mov	r0, t1
add	r0, 8
add	t1, 12
	mov	[t1], t0
	mov	[r0], rax
	ret
// -- End function
// -- Begin function strtoimax
strtoimax:                              // @strtoimax
// %bb.0:
	jmp	strtoll
// -- End function
// -- Begin function strtoumax
strtoumax:                              // @strtoumax
// %bb.0:
	jmp	strtoull
// -- End function
// -- Begin function setlocale
setlocale:                              // @setlocale
// %bb.0:
	mov	r2, r1
	mov	r1, -2147483648
	mov	r4, 0
	call	__bit_xor
	mov	r0, -2147483643
	jg	rax, r0, .LBB30_25
	jmp	.LBB30_1
.LBB30_1:
	mov	r4, mcasm_static_eb6422b321c3a10bba2c8ff81023d04b
	jz	r2, .LBB30_25
	jmp	.LBB30_2
.LBB30_2:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	jz	r3, .LBB30_25
	jmp	.LBB30_3
.LBB30_3:
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r6, rax
	mov	r5, r3
	jnz	r6, .LBB30_6
	jmp	.LBB30_4
.LBB30_4:
	mov	r5, [r2]
	mov	r0, 67
	je	r5, r0, .LBB30_25
	jmp	.LBB30_5
.LBB30_5:
	mov	r1, 255
	mov	r0, r5
	call	__bit_and
	jz	rax, .LBB30_13
	jmp	.LBB30_6
.LBB30_6:                               // %.preheader.i.preheader
	mov	r7, 0
.LBB30_7:                               // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, mcasm_static_ed53d212bdc419f3bb968190f0e37111
	add	r0, r7
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	mov	r0, r5
	call	__bit_and
	jne	rax, r4, .LBB30_10
	jmp	.LBB30_8
.LBB30_8:                               //   in Loop: Header=BB30_7 Depth=1
add	r7, 1
	mov	r0, r7
	add	r0, r2
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	jnz	r5, .LBB30_7
	jmp	.LBB30_9
.LBB30_9:                               // %strcmp.exitsplit
	mov	r0, mcasm_static_ed53d212bdc419f3bb968190f0e37111
	add	r0, r7
	mov	r5, 0
	jmp	.LBB30_11
.LBB30_10:                              // %.preheader.i.strcmp.exit_crit_edge
	mov	r0, mcasm_static_ed53d212bdc419f3bb968190f0e37111
	add	r0, r7
.LBB30_11:                              // %strcmp.exit
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
	mov	r0, r5
	call	__bit_and
	mov	r4, mcasm_static_eb6422b321c3a10bba2c8ff81023d04b
	je	rax, r7, .LBB30_25
	jmp	.LBB30_12
.LBB30_12:
	mov	r5, mcasm_static_867d57c621efda06cd5862d5d6cfbefb
	jnz	r6, .LBB30_18
	jmp	.LBB30_13
.LBB30_13:                              // %.thread24
	mov	r3, [r2]
	mov	r1, 1230196560
	mov	r5, mcasm_static_867d57c621efda06cd5862d5d6cfbefb
	jne	r3, r1, .LBB30_18
	jmp	.LBB30_14
.LBB30_14:                              // %.preheader5.i2.preheader
	mov	r3, -2139062144
.LBB30_15:                              // %.preheader5.i2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r3, .LBB30_24
	jmp	.LBB30_16
.LBB30_16:                              //   in Loop: Header=BB30_15 Depth=1
add	r2, 4
add	r5, 4
	mov	r1, [r2]
	mov	r0, [r5]
	je	r1, r0, .LBB30_15
	jmp	.LBB30_17
.LBB30_17:
	mov	r3, r1
.LBB30_18:
	mov	r1, 255
	mov	r0, r3
	call	__bit_and
	mov	r4, 0
	mov	r6, 0
	jz	rax, .LBB30_23
	jmp	.LBB30_19
.LBB30_19:                              // %.preheader.i1.preheader
add	r2, 1
.LBB30_20:                              // %.preheader.i1
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	mov	r0, r3
	call	__bit_and
	jne	rax, r6, .LBB30_22
	jmp	.LBB30_21
.LBB30_21:                              //   in Loop: Header=BB30_20 Depth=1
	mov	r1, 2
add	r5, 1
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
add	r2, 1
	mov	r0, 0
	jnz	r3, .LBB30_20
	jmp	.LBB30_22
.LBB30_22:
	call	__bit_and
	mov	r6, rax
.LBB30_23:                              // %strcmp.exit3
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, r6
	mov	r1, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB30_25
	jmp	.LBB30_24
.LBB30_24:                              // %strcmp.exit3.thread
	mov	r4, mcasm_static_eb6422b321c3a10bba2c8ff81023d04b
.LBB30_25:                              // %strcmp.exit.thread
	mov	rax, r4
	ret
// -- End function
// -- Begin function localeconv
localeconv:                             // @localeconv
// %bb.0:
	mov	rax, mcasm_static_428200a628ce0e4b2ece3b899c3b423a
	ret
// -- End function
// -- Begin function fabs
fabs:                                   // @fabs
// %bb.0:
	mov	r2, 0
	mov	r3, 0
	mov	r4, r1
	mov	r5, r0
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	r2, rax
	mov	r0, r4
	call	__bit_xor
	mov	r1, rax
	mov	r0, r2
	call	__bit_not
add	rax, 1
	sub	r1, r4
	mov	r0, rax
	call	__bit_and
	add	r4, rax
	mov	rax, r5
	mov	t0, r4
	ret
// -- End function
// -- Begin function fabsf
fabsf:                                  // @fabsf
// %bb.0:
	mov	r1, 0
	mov	r2, r0
	call	__ltsf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	r3, rax
	mov	r0, r2
	call	__bit_xor
	mov	r1, rax
	mov	r0, r3
	call	__bit_not
	sub	r1, r2
add	rax, 1
	mov	r0, rax
	call	__bit_and
	add	rax, r2
	ret
// -- End function
// -- Begin function fabsl
fabsl:                                  // @fabsl
// %bb.0:
	mov	r2, 0
	mov	r3, 0
	mov	r4, r1
	mov	r5, r0
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	r2, rax
	mov	r0, r4
	call	__bit_xor
	mov	r1, rax
	mov	r0, r2
	call	__bit_not
add	rax, 1
	sub	r1, r4
	mov	r0, rax
	call	__bit_and
	add	r4, rax
	mov	rax, r5
	mov	t0, r4
	ret
// -- End function
// -- Begin function trunc
trunc:                                  // @trunc
// %bb.0:
	call	__fixdfsi
	mov	r0, rax
	call	__floatsidf
	ret
// -- End function
// -- Begin function truncf
truncf:                                 // @truncf
// %bb.0:
	call	__fixsfsi
	mov	r0, rax
	call	__floatsisf
	ret
// -- End function
// -- Begin function truncl
truncl:                                 // @truncl
// %bb.0:
	call	__fixdfsi
	mov	r0, rax
	call	__floatsidf
	ret
// -- End function
// -- Begin function floor
floor:                                  // @floor
// %bb.0:
	mov	r2, r0
	call	__fixdfsi
	mov	r4, rax
	mov	r0, r4
	call	__floatsidf
	mov	r3, t0
	mov	r0, r2
	mov	r2, rax
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	add	r4, rax
add	r4, 1
	mov	r0, r4
	call	__floatsidf
	ret
// -- End function
// -- Begin function floorf
floorf:                                 // @floorf
// %bb.0:
	call	__extendsfdf2
	mov	r2, rax
	mov	r1, t0
	call	__fixsfsi
	mov	r4, rax
	mov	r0, r4
	call	__floatsidf
	mov	r3, t0
	mov	r0, r2
	mov	r2, rax
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	add	r4, rax
add	r4, 1
	mov	r0, r4
	call	__floatsisf
	ret
// -- End function
// -- Begin function floorl
floorl:                                 // @floorl
// %bb.0:
	mov	r2, r0
	call	__fixdfsi
	mov	r4, rax
	mov	r0, r4
	call	__floatsidf
	mov	r3, t0
	mov	r0, r2
	mov	r2, rax
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	add	r4, rax
add	r4, 1
	mov	r0, r4
	call	__floatsidf
	ret
// -- End function
// -- Begin function ceil
ceil:                                   // @ceil
// %bb.0:
	mov	r2, r0
	call	__fixdfsi
	mov	r4, rax
	mov	r0, r4
	call	__floatsidf
	mov	r3, t0
	mov	r0, r2
	mov	r2, rax
	call	__gtdf2
	mov	r1, -2147483648
	mov	r2, -2147483648
	mov	r0, rax
	call	__bit_xor
	sub	r2, rax
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	add	r4, rax
	mov	r0, r4
	call	__floatsidf
	ret
// -- End function
// -- Begin function ceilf
ceilf:                                  // @ceilf
// %bb.0:
	call	__extendsfdf2
	mov	r2, rax
	mov	r1, t0
	call	__fixsfsi
	mov	r4, rax
	mov	r0, r4
	call	__floatsidf
	mov	r3, t0
	mov	r0, r2
	mov	r2, rax
	call	__gtdf2
	mov	r1, -2147483648
	mov	r2, -2147483648
	mov	r0, rax
	call	__bit_xor
	sub	r2, rax
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	add	r4, rax
	mov	r0, r4
	call	__floatsisf
	ret
// -- End function
// -- Begin function ceill
ceill:                                  // @ceill
// %bb.0:
	mov	r2, r0
	call	__fixdfsi
	mov	r4, rax
	mov	r0, r4
	call	__floatsidf
	mov	r3, t0
	mov	r0, r2
	mov	r2, rax
	call	__gtdf2
	mov	r1, -2147483648
	mov	r2, -2147483648
	mov	r0, rax
	call	__bit_xor
	sub	r2, rax
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	add	r4, rax
	mov	r0, r4
	call	__floatsidf
	ret
// -- End function
// -- Begin function round
round:                                  // @round
// %bb.0:
	mov	r2, 0
	mov	r3, 0
	call	__ltdf2
	mov	r2, -1
	jg	rax, r2, .LBB44_2
	jmp	.LBB44_1
.LBB44_1:
	mov	r2, 0
	mov	r3, -1075838976
	call	__adddf3
	mov	r2, rax
	mov	r1, t0
	mov	r0, r2
	call	__fixdfsi
	mov	r4, rax
	mov	r0, r4
	call	__floatsidf
	mov	r3, t0
	mov	r0, r2
	mov	r2, rax
	call	__gtdf2
	mov	r1, -2147483648
	mov	r2, -2147483648
	mov	r0, rax
	call	__bit_xor
	sub	r2, rax
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	add	rax, r4
	jmp	.LBB44_3
.LBB44_2:
	mov	r2, 0
	mov	r3, 1071644672
	call	__adddf3
	mov	r2, rax
	mov	r1, t0
	mov	r0, r2
	call	__fixdfsi
	mov	r4, rax
	mov	r0, r4
	call	__floatsidf
	mov	r3, t0
	mov	r0, r2
	mov	r2, rax
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	add	rax, r4
add	rax, 1
.LBB44_3:
	mov	r0, rax
	call	__floatsidf
	ret
// -- End function
// -- Begin function roundf
roundf:                                 // @roundf
// %bb.0:
	call	__extendsfdf2
	mov	r1, 0
	mov	r5, rax
	mov	r4, t0
	call	__ltsf2
	mov	r0, -1
	jg	rax, r0, .LBB45_2
	jmp	.LBB45_1
.LBB45_1:
	mov	r2, 0
	mov	r3, -1075838976
	mov	r0, r5
	mov	r1, r4
	call	__adddf3
	mov	r2, rax
	mov	r1, t0
	mov	r0, r2
	call	__fixdfsi
	mov	r4, rax
	mov	r0, r4
	call	__floatsidf
	mov	r3, t0
	mov	r0, r2
	mov	r2, rax
	call	__gtdf2
	mov	r1, -2147483648
	mov	r2, -2147483648
	mov	r0, rax
	call	__bit_xor
	sub	r2, rax
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	add	rax, r4
	jmp	.LBB45_3
.LBB45_2:
	mov	r2, 0
	mov	r3, 1071644672
	mov	r0, r5
	mov	r1, r4
	call	__adddf3
	mov	r2, rax
	mov	r1, t0
	mov	r0, r2
	call	__fixdfsi
	mov	r4, rax
	mov	r0, r4
	call	__floatsidf
	mov	r3, t0
	mov	r0, r2
	mov	r2, rax
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	add	rax, r4
add	rax, 1
.LBB45_3:
	mov	r0, rax
	call	__floatsisf
	ret
// -- End function
// -- Begin function roundl
roundl:                                 // @roundl
// %bb.0:
	mov	r2, 0
	mov	r3, 0
	call	__ltdf2
	mov	r2, -1
	jg	rax, r2, .LBB46_2
	jmp	.LBB46_1
.LBB46_1:
	mov	r2, 0
	mov	r3, -1075838976
	call	__adddf3
	mov	r2, rax
	mov	r1, t0
	mov	r0, r2
	call	__fixdfsi
	mov	r4, rax
	mov	r0, r4
	call	__floatsidf
	mov	r3, t0
	mov	r0, r2
	mov	r2, rax
	call	__gtdf2
	mov	r1, -2147483648
	mov	r2, -2147483648
	mov	r0, rax
	call	__bit_xor
	sub	r2, rax
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	add	rax, r4
	jmp	.LBB46_3
.LBB46_2:
	mov	r2, 0
	mov	r3, 1071644672
	call	__adddf3
	mov	r2, rax
	mov	r1, t0
	mov	r0, r2
	call	__fixdfsi
	mov	r4, rax
	mov	r0, r4
	call	__floatsidf
	mov	r3, t0
	mov	r0, r2
	mov	r2, rax
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	add	rax, r4
add	rax, 1
.LBB46_3:
	mov	r0, rax
	call	__floatsidf
	ret
// -- End function
// -- Begin function sqrt
sqrt:                                   // @sqrt
// %bb.0:
	mov	r2, 0
	mov	r3, 0
	mov	r4, r1
	mov	r5, r0
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB47_2
	jmp	.LBB47_1
.LBB47_1:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 33
	mov	r4, 2146959360
	mov	r5, 0
	jmp	.LBB47_4
.LBB47_2:
	mov	r1, 2147483647
	mov	r0, r4
	call	__bit_and
	mov	r1, 2146435072
	mov	r2, rax
	mov	r0, r2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r7, rax
	mov	r1, -2147483648
	mov	r6, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -1048576
	sub	r0, rax
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	mov	r0, r5
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	sub	rax, r3
add	r7, 1
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r1, 2146435072
	mov	r7, rax
	mov	r0, r4
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	t1, rax
	mov	r0, t1
	call	__bit_not
	mov	t2, rax
	mov	r0, r5
	mov	r1, r2
	call	__bit_or
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
add	t2, 1
	mov	r2, rax
	mov	r0, t1
	mov	r1, t2
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r2
	mov	r1, rax
	call	__bit_or
	add	r7, r3
	mov	r0, rax
	mov	r1, r7
	call	__bit_or
	jnz	rax, .LBB47_4
	jmp	.LBB47_3
.LBB47_3:
	mov	r2, 0
	mov	r3, 1072693248
	mov	r0, r5
	mov	r1, r4
	call	__gtdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	sub	r6, rax
	mov	r1, 31
	mov	r0, r6
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
add	r0, 1
	mov	r1, r4
add	r1, -1072693248
	call	__bit_and
	mov	r3, rax
	mov	r1, r5
	call	__bit_and
add	r3, 1072693248
	mov	r2, rax
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	call	__divdf3
	mov	r0, r2
	mov	r1, r3
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r5, rax
	mov	r4, t0
.LBB47_4:
	mov	rax, r5
	mov	t0, r4
	ret
// -- End function
// -- Begin function sqrtf
sqrtf:                                  // @sqrtf
// %bb.0:
	call	__extendsfdf2
	mov	r1, t0
	mov	r0, rax
	call	sqrt
	mov	r1, t0
	mov	r0, rax
	call	__truncdfsf2
	ret
// -- End function
// -- Begin function sqrtl
sqrtl:                                  // @sqrtl
// %bb.0:
	jmp	sqrt
// -- End function
// -- Begin function sin
sin:                                    // @sin
// %bb.0:
	mov	r4, r1
	mov	r1, 2147483647
	mov	r5, r0
	mov	r0, r4
	call	__bit_and
	mov	r0, 2146435072
	jl	rax, r0, .LBB50_2
	jmp	.LBB50_1
.LBB50_1:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 33
	mov	t0, 2146959360
	mov	rax, 0
	jmp	.LBB50_9
.LBB50_2:
	mov	r2, 1413754136
	mov	r3, 1074340347
	mov	r0, r5
	mov	r1, r4
	call	__gtdf2
	mov	r0, 1
	jl	rax, r0, .LBB50_4
	jmp	.LBB50_3
.LBB50_3:                               // %.preheader5.preheader
	mov	r6, 0
	jmp	.LBB50_6
.LBB50_4:                               // %.loopexit6
	mov	r3, -1073143301
	mov	r0, r5
	mov	r1, r4
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB50_8
	jmp	.LBB50_5
.LBB50_5:                               // %.preheader.preheader
	mov	r6, 0
	jmp	.LBB50_7
.LBB50_6:                               // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, 1413754136
	mov	r3, -1072094725
	mov	r0, r5
	mov	r1, r4
	call	__adddf3
	mov	r3, 1074340347
	mov	r5, rax
	mov	r4, t0
	mov	r0, r5
	mov	r1, r4
	call	__gtdf2
	jg	rax, r6, .LBB50_6
	jmp	.LBB50_4
.LBB50_7:                               // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, 1413754136
	mov	r3, 1075388923
	mov	r0, r5
	mov	r1, r4
	call	__adddf3
	mov	r3, -1073143301
	mov	r5, rax
	mov	r4, t0
	mov	r0, r5
	mov	r1, r4
	call	__ltdf2
	jl	rax, r6, .LBB50_7
	jmp	.LBB50_8
.LBB50_8:                               // %.loopexit
	mov	r0, r5
	mov	r1, r4
	mov	r2, r5
	mov	r3, r4
	call	__muldf3
	mov	r2, 0
	mov	r3, -1072168960
	mov	r6, rax
	mov	r7, t0
	mov	r0, r6
	mov	r1, r7
	call	__divdf3
	mov	r3, 1072693248
	mov	r1, t0
	mov	r0, rax
	call	__adddf3
	mov	t1, rax
	mov	t2, t0
	mov	r0, r6
	mov	r1, r7
	mov	r2, r6
	mov	r3, r7
	call	__muldf3
	mov	r2, 0
	mov	r3, 1079902208
	mov	t3, rax
	mov	t4, t0
	mov	r0, t3
	mov	r1, t4
	call	__divdf3
	mov	r3, t0
	mov	r0, t1
	mov	r1, t2
	mov	r2, rax
	call	__adddf3
	mov	t1, rax
	mov	t2, t0
	mov	r0, r6
	mov	r1, r7
	mov	r2, t3
	mov	r3, t4
	call	__muldf3
	mov	r2, 0
	mov	r3, -1061965824
	mov	t3, rax
	mov	t4, t0
	mov	r0, t3
	mov	r1, t4
	call	__divdf3
	mov	r3, t0
	mov	r0, t1
	mov	r1, t2
	mov	r2, rax
	call	__adddf3
	mov	t1, rax
	mov	t2, t0
	mov	r0, r6
	mov	r1, r7
	mov	r2, t3
	mov	r3, t4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1091970560
	mov	r1, t0
	mov	r0, rax
	call	__divdf3
	mov	r3, t0
	mov	r0, t1
	mov	r1, t2
	mov	r2, rax
	call	__adddf3
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	mov	r2, rax
	call	__muldf3
.LBB50_9:
	ret
// -- End function
// -- Begin function sinf
sinf:                                   // @sinf
// %bb.0:
	call	__extendsfdf2
	mov	r1, t0
	mov	r0, rax
	call	sin
	mov	r1, t0
	mov	r0, rax
	call	__truncdfsf2
	ret
// -- End function
// -- Begin function sinl
sinl:                                   // @sinl
// %bb.0:
	jmp	sin
// -- End function
// -- Begin function cos
cos:                                    // @cos
// %bb.0:
	mov	r4, r1
	mov	r1, 2147483647
	mov	r5, r0
	mov	r0, r4
	call	__bit_and
	mov	r0, 2146435072
	jl	rax, r0, .LBB53_2
	jmp	.LBB53_1
.LBB53_1:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 33
	mov	t0, 2146959360
	mov	rax, 0
	jmp	.LBB53_9
.LBB53_2:
	mov	r2, 1413754136
	mov	r3, 1074340347
	mov	r0, r5
	mov	r1, r4
	call	__gtdf2
	mov	r0, 1
	jl	rax, r0, .LBB53_4
	jmp	.LBB53_3
.LBB53_3:                               // %.preheader5.preheader
	mov	r6, 0
	jmp	.LBB53_6
.LBB53_4:                               // %.loopexit6
	mov	r3, -1073143301
	mov	r0, r5
	mov	r1, r4
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB53_8
	jmp	.LBB53_5
.LBB53_5:                               // %.preheader.preheader
	mov	r6, 0
	jmp	.LBB53_7
.LBB53_6:                               // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, 1413754136
	mov	r3, -1072094725
	mov	r0, r5
	mov	r1, r4
	call	__adddf3
	mov	r3, 1074340347
	mov	r5, rax
	mov	r4, t0
	mov	r0, r5
	mov	r1, r4
	call	__gtdf2
	jg	rax, r6, .LBB53_6
	jmp	.LBB53_4
.LBB53_7:                               // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, 1413754136
	mov	r3, 1075388923
	mov	r0, r5
	mov	r1, r4
	call	__adddf3
	mov	r3, -1073143301
	mov	r5, rax
	mov	r4, t0
	mov	r0, r5
	mov	r1, r4
	call	__ltdf2
	jl	rax, r6, .LBB53_7
	jmp	.LBB53_8
.LBB53_8:                               // %.loopexit
	mov	r0, r5
	mov	r1, r4
	mov	r2, r5
	mov	r3, r4
	call	__muldf3
	mov	r2, 0
	mov	r3, -1075838976
	mov	r4, rax
	mov	r5, t0
	mov	r0, r4
	mov	r1, r5
	call	__muldf3
	mov	r3, 1072693248
	mov	r1, t0
	mov	r0, rax
	call	__adddf3
	mov	r6, rax
	mov	r7, t0
	mov	r0, r4
	mov	r1, r5
	mov	r2, r4
	mov	r3, r5
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077411840
	mov	t1, rax
	mov	t2, t0
	mov	r0, t1
	mov	r1, t2
	call	__divdf3
	mov	r3, t0
	mov	r0, r6
	mov	r1, r7
	mov	r2, rax
	call	__adddf3
	mov	r6, rax
	mov	r7, t0
	mov	r0, r4
	mov	r1, r5
	mov	r2, t1
	mov	r3, t2
	call	__muldf3
	mov	r2, 0
	mov	r3, -1064927232
	mov	t1, rax
	mov	t2, t0
	mov	r0, t1
	mov	r1, t2
	call	__divdf3
	mov	r3, t0
	mov	r0, r6
	mov	r1, r7
	mov	r2, rax
	call	__adddf3
	mov	r6, rax
	mov	r7, t0
	mov	r0, r4
	mov	r1, r5
	mov	r2, t1
	mov	r3, t2
	call	__muldf3
	mov	r2, 0
	mov	r3, 1088663552
	mov	r1, t0
	mov	r0, rax
	call	__divdf3
	mov	r3, t0
	mov	r0, r6
	mov	r1, r7
	mov	r2, rax
	call	__adddf3
.LBB53_9:
	ret
// -- End function
// -- Begin function cosf
cosf:                                   // @cosf
// %bb.0:
	call	__extendsfdf2
	mov	r1, t0
	mov	r0, rax
	call	cos
	mov	r1, t0
	mov	r0, rax
	call	__truncdfsf2
	ret
// -- End function
// -- Begin function cosl
cosl:                                   // @cosl
// %bb.0:
	jmp	cos
// -- End function
// -- Begin function tan
tan:                                    // @tan
// %bb.0:
	mov	r5, r1
	mov	r6, r0
	call	cos
	mov	r7, rax
	mov	t1, t0
	mov	r2, 0
	mov	r3, 0
	mov	r4, 0
	mov	r0, r7
	mov	r1, t1
	call	__nedf2
	jnz	rax, .LBB56_2
	jmp	.LBB56_1
.LBB56_1:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 34
	mov	r0, r6
	mov	r1, r5
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	t0, rax
add	t0, 2146435072
	jmp	.LBB56_3
.LBB56_2:
	mov	r0, r6
	mov	r1, r5
	call	sin
	mov	r1, t0
	mov	r0, rax
	mov	r2, r7
	mov	r3, t1
	call	__divdf3
	mov	r4, rax
.LBB56_3:
	mov	rax, r4
	ret
// -- End function
// -- Begin function tanf
tanf:                                   // @tanf
// %bb.0:
	mov	r5, r0
	call	__extendsfdf2
	mov	t1, rax
	mov	t2, t0
	mov	r0, t1
	mov	r1, t2
	call	cos
	mov	r6, rax
	mov	r7, t0
	mov	r2, 0
	mov	r3, 0
	mov	r4, 0
	mov	r0, r6
	mov	r1, r7
	call	__nedf2
	jnz	rax, .LBB57_2
	jmp	.LBB57_1
.LBB57_1:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	r1, 0
	mov	[r0], 34
	mov	r0, r5
	call	__ltsf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, rax
add	r1, 2146435072
	jmp	.LBB57_3
.LBB57_2:
	mov	r0, t1
	mov	r1, t2
	call	sin
	mov	r1, t0
	mov	r0, rax
	mov	r2, r6
	mov	r3, r7
	call	__divdf3
	mov	r4, rax
	mov	r1, t0
.LBB57_3:
	mov	r0, r4
	call	__truncdfsf2
	ret
// -- End function
// -- Begin function tanl
tanl:                                   // @tanl
// %bb.0:
	mov	r5, r1
	mov	r6, r0
	call	cos
	mov	r7, rax
	mov	t1, t0
	mov	r2, 0
	mov	r3, 0
	mov	r4, 0
	mov	r0, r7
	mov	r1, t1
	call	__nedf2
	jnz	rax, .LBB58_2
	jmp	.LBB58_1
.LBB58_1:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 34
	mov	r0, r6
	mov	r1, r5
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	t0, rax
add	t0, 2146435072
	jmp	.LBB58_3
.LBB58_2:
	mov	r0, r6
	mov	r1, r5
	call	sin
	mov	r1, t0
	mov	r0, rax
	mov	r2, r7
	mov	r3, t1
	call	__divdf3
	mov	r4, rax
.LBB58_3:
	mov	rax, r4
	ret
// -- End function
// -- Begin function exp
exp:                                    // @exp
// %bb.0:
	mov	r4, r1
	mov	r5, r0
	mov	r2, 0
	mov	r3, 1082533888
	mov	r6, 0
	call	__gtdf2
	mov	r0, 1
	jl	rax, r0, .LBB59_2
	jmp	.LBB59_1
.LBB59_1:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 34
	mov	r6, 2146435072
	mov	r7, 0
	jmp	.LBB59_5
.LBB59_2:
	mov	r3, -1064876032
	mov	r0, r5
	mov	r1, r4
	call	__ltdf2
	mov	r7, 0
	jl	rax, r6, .LBB59_5
	jmp	.LBB59_3
.LBB59_3:                               // %.preheader.preheader
	mov	r6, 1072693248
	mov	t1, 1
	mov	t4, 40
	mov	t2, 0
	mov	t3, 1072693248
.LBB59_4:                               // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, t1
	call	__floatunsidf
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	mov	r2, rax
	call	__divdf3
	mov	r3, t0
	mov	r0, t2
	mov	r1, t3
	mov	r2, rax
	call	__muldf3
	mov	t2, rax
	mov	t3, t0
	mov	r0, r7
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__adddf3
add	t1, 1
	mov	r7, rax
	mov	r6, t0
	jne	t1, t4, .LBB59_4
	jmp	.LBB59_5
.LBB59_5:                               // %.loopexit
	mov	rax, r7
	mov	t0, r6
	ret
// -- End function
// -- Begin function expf
expf:                                   // @expf
// %bb.0:
	call	__extendsfdf2
	mov	r1, 1144078336
	mov	r4, rax
	mov	r5, t0
	call	__gtsf2
	mov	r1, 1
	jl	rax, r1, .LBB60_2
	jmp	.LBB60_1
.LBB60_1:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 34
	mov	rax, 2139095040
	jmp	.LBB60_6
.LBB60_2:
	mov	r1, -1002815488
	call	__ltsf2
	mov	r0, rax
	mov	rax, 0
	jl	r0, rax, .LBB60_6
	jmp	.LBB60_3
.LBB60_3:                               // %.preheader.preheader
	mov	r7, 1072693248
	mov	t1, 0
	mov	r6, 1
	mov	t4, 40
	mov	t2, 0
	mov	t3, 1072693248
.LBB60_4:                               // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r6
	call	__floatunsidf
	mov	r3, t0
	mov	r0, r4
	mov	r1, r5
	mov	r2, rax
	call	__divdf3
	mov	r3, t0
	mov	r0, t2
	mov	r1, t3
	mov	r2, rax
	call	__muldf3
	mov	t2, rax
	mov	t3, t0
	mov	r0, t1
	mov	r1, r7
	mov	r2, t2
	mov	r3, t3
	call	__adddf3
add	r6, 1
	mov	t1, rax
	mov	r7, t0
	jne	r6, t4, .LBB60_4
	jmp	.LBB60_5
.LBB60_5:
	mov	r0, t1
	mov	r1, r7
	call	__truncdfsf2
.LBB60_6:
	ret
// -- End function
// -- Begin function expl
expl:                                   // @expl
// %bb.0:
	mov	r4, r1
	mov	r5, r0
	mov	r2, 0
	mov	r3, 1082533888
	mov	r6, 0
	call	__gtdf2
	mov	r0, 1
	jl	rax, r0, .LBB61_2
	jmp	.LBB61_1
.LBB61_1:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 34
	mov	r6, 2146435072
	mov	r7, 0
	jmp	.LBB61_5
.LBB61_2:
	mov	r3, -1064876032
	mov	r0, r5
	mov	r1, r4
	call	__ltdf2
	mov	r7, 0
	jl	rax, r6, .LBB61_5
	jmp	.LBB61_3
.LBB61_3:                               // %.preheader.preheader
	mov	r6, 1072693248
	mov	t1, 1
	mov	t4, 40
	mov	t2, 0
	mov	t3, 1072693248
.LBB61_4:                               // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, t1
	call	__floatunsidf
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	mov	r2, rax
	call	__divdf3
	mov	r3, t0
	mov	r0, t2
	mov	r1, t3
	mov	r2, rax
	call	__muldf3
	mov	t2, rax
	mov	t3, t0
	mov	r0, r7
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__adddf3
add	t1, 1
	mov	r7, rax
	mov	r6, t0
	jne	t1, t4, .LBB61_4
	jmp	.LBB61_5
.LBB61_5:                               // %.loopexit
	mov	rax, r7
	mov	t0, r6
	ret
// -- End function
// -- Begin function log
log:                                    // @log
// %bb.0:
	mov	r2, 0
	mov	r3, 0
	mov	r5, r1
	mov	r6, r0
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB62_2
	jmp	.LBB62_1
.LBB62_1:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 33
	mov	r5, 2146959360
	mov	r6, 0
	jmp	.LBB62_12
.LBB62_2:
	mov	r0, r6
	mov	r1, r5
	call	__nedf2
	jnz	rax, .LBB62_4
	jmp	.LBB62_3
.LBB62_3:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 34
	mov	r5, -1048576
	mov	r6, 0
	jmp	.LBB62_12
.LBB62_4:
	mov	r1, 2147483647
	mov	r0, r5
	call	__bit_and
	mov	r0, 2146435071
	jg	rax, r0, .LBB62_12
	jmp	.LBB62_5
.LBB62_5:
	mov	r3, 1073741824
	mov	r4, 0
	mov	r0, r6
	mov	r1, r5
	call	__gtdf2
	mov	r0, 1
	jl	rax, r0, .LBB62_7
	jmp	.LBB62_6
.LBB62_6:                               // %.preheader4.preheader
	mov	r7, 0
	jmp	.LBB62_9
.LBB62_7:                               // %.loopexit5
	mov	r3, 1071644672
	mov	r7, 0
	mov	r0, r6
	mov	r1, r5
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB62_11
	jmp	.LBB62_8
.LBB62_8:                               // %.preheader.preheader
	jmp	.LBB62_10
.LBB62_9:                               // %.preheader4
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, 0
	mov	r3, 1071644672
	mov	r0, r6
	mov	r1, r5
	call	__muldf3
	mov	r6, rax
	mov	r5, t0
	mov	r3, 1073741824
add	r4, 1
	mov	r0, r6
	mov	r1, r5
	call	__gtdf2
	jg	rax, r7, .LBB62_9
	jmp	.LBB62_7
.LBB62_10:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r6
	mov	r1, r5
	mov	r2, r6
	mov	r3, r5
	call	__adddf3
	mov	r6, rax
	mov	r5, t0
	mov	r2, 0
	mov	r3, 1071644672
add	r4, -1
	mov	r0, r6
	mov	r1, r5
	call	__ltdf2
	jl	rax, r7, .LBB62_10
	jmp	.LBB62_11
.LBB62_11:                              // %.loopexit
	mov	r3, -1074790400
	mov	r0, r6
	mov	r1, r5
	call	__adddf3
	mov	r3, 1072693248
	mov	r7, rax
	mov	t1, t0
	call	__adddf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__divdf3
	mov	r0, rax
	mov	r1, t0
	mov	r2, r0
	mov	r3, r1
	call	__muldf3
	mov	r2, 0
	mov	r3, 0
	mov	r5, rax
	mov	r6, t0
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r2, r5
	mov	r3, r6
	call	__muldf3
	mov	r2, 0
	mov	r3, 1074266112
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1075052544
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1075576832
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1075970048
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1076232192
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1076494336
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1076756480
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1076953088
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077084160
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077215232
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077346304
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077477376
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077608448
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077739520
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077870592
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077968896
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078034432
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078099968
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078165504
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078231040
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078296576
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078362112
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078427648
	mov	t2, rax
	mov	t3, t0
	mov	r0, t2
	mov	r1, t3
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078493184
	mov	r1, t0
	mov	r0, rax
	call	__divdf3
	mov	r3, t0
	mov	r0, r7
	mov	r1, t1
	mov	r2, rax
	call	__adddf3
	mov	r5, rax
	mov	r6, t0
	mov	r0, r4
	call	__floatsidf
	mov	r2, -17155601
	mov	r3, 1072049730
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r4, rax
	mov	r7, t0
	mov	r0, r5
	mov	r1, r6
	mov	r2, r5
	mov	r3, r6
	call	__adddf3
	mov	r1, t0
	mov	r0, rax
	mov	r2, r4
	mov	r3, r7
	call	__adddf3
	mov	r6, rax
	mov	r5, t0
.LBB62_12:
	mov	rax, r6
	mov	t0, r5
	ret
// -- End function
// -- Begin function logf
logf:                                   // @logf
// %bb.0:
	call	__extendsfdf2
	mov	r1, t0
	mov	r0, rax
	call	log
	mov	r1, t0
	mov	r0, rax
	call	__truncdfsf2
	ret
// -- End function
// -- Begin function logl
logl:                                   // @logl
// %bb.0:
	jmp	log
// -- End function
// -- Begin function pow
pow:                                    // @pow
// %bb.0:
	mov	r4, r3
	mov	r5, r2
	mov	r6, r1
	mov	r7, r0
	mov	r0, r5
	mov	r1, r4
	call	__fixdfsi
	mov	t1, rax
	mov	r0, t1
	call	__floatsidf
	mov	r3, t0
	mov	r0, r5
	mov	r2, rax
	call	__nedf2
	jnz	rax, .LBB65_7
	jmp	.LBB65_1
.LBB65_1:
	mov	r5, 1072693248
	mov	r4, 0
	jz	t1, .LBB65_6
	jmp	.LBB65_2
.LBB65_2:
	mov	r0, -1
	mov	t2, t1
	jg	t1, r0, .LBB65_4
	jmp	.LBB65_3
.LBB65_3:
	mov	t2, 0
	sub	t2, t1
.LBB65_4:
.LBB65_5:                               // =>This Inner Loop Header: Depth=1
	mov	r1, 1
	mov	r0, t2
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	t3, rax
	mov	r0, r7
	mov	r1, r6
	mov	r2, r4
	mov	r3, r5
	call	__muldf3
	mov	r2, rax
	mov	r3, t0
	sub	r5, r3
	mov	r0, t3
	call	__bit_not
	mov	r0, rax
add	r0, 1
	mov	r1, r5
	call	__bit_and
	mov	r5, rax
	sub	r4, r2
	add	r5, r3
	mov	r1, r4
	call	__bit_and
	mov	r4, rax
	add	r4, r2
	mov	r0, r7
	mov	r1, r6
	mov	r2, r7
	mov	r3, r6
	call	__muldf3
	mov	r1, 1
	mov	r7, rax
	mov	r6, t0
	mov	r0, t2
	call	__bit_shr
	mov	t2, rax
	jnz	t2, .LBB65_5
	jmp	.LBB65_6
.LBB65_6:                               // %.loopexit
	mov	r1, -2147483648
	mov	r0, t1
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, 0
	mov	r1, 1072693248
	mov	r6, rax
	mov	r2, r4
	mov	r3, r5
	call	__divdf3
	mov	r2, rax
	mov	r1, t0
	sub	r1, r5
	mov	r0, r6
	call	__bit_not
	mov	r0, rax
add	r0, 1
	call	__bit_and
	mov	r6, rax
	sub	r2, r4
	add	r6, r5
	mov	r1, r2
	call	__bit_and
	mov	t1, rax
	add	t1, r4
	jmp	.LBB65_14
.LBB65_7:
	mov	r2, 0
	mov	r3, 0
	mov	t1, 0
	mov	r0, r7
	mov	r1, r6
	call	__ledf2
	jg	rax, t1, .LBB65_9
	jmp	.LBB65_8
.LBB65_8:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 33
	mov	r6, 2146959360
	jmp	.LBB65_14
.LBB65_9:
	mov	r0, r7
	mov	r1, r6
	call	log
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	mov	r2, rax
	call	__muldf3
	mov	r4, rax
	mov	r5, t0
	mov	r2, 0
	mov	r3, 1082533888
	mov	r6, 0
	mov	r0, r4
	mov	r1, r5
	call	__gtdf2
	mov	r0, 1
	jl	rax, r0, .LBB65_11
	jmp	.LBB65_10
.LBB65_10:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 34
	mov	r6, 2146435072
	jmp	.LBB65_14
.LBB65_11:
	mov	r3, -1064876032
	mov	r0, r4
	mov	r1, r5
	call	__ltdf2
	jl	rax, r6, .LBB65_14
	jmp	.LBB65_12
.LBB65_12:                              // %.preheader.preheader
	mov	r6, 1072693248
	mov	r7, 1
	mov	t4, 40
	mov	t2, 0
	mov	t3, 1072693248
.LBB65_13:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r7
	call	__floatunsidf
	mov	r3, t0
	mov	r0, r4
	mov	r1, r5
	mov	r2, rax
	call	__divdf3
	mov	r3, t0
	mov	r0, t2
	mov	r1, t3
	mov	r2, rax
	call	__muldf3
	mov	t2, rax
	mov	t3, t0
	mov	r0, t1
	mov	r1, r6
	mov	r2, t2
	mov	r3, t3
	call	__adddf3
add	r7, 1
	mov	t1, rax
	mov	r6, t0
	jne	r7, t4, .LBB65_13
	jmp	.LBB65_14
.LBB65_14:                              // %.loopexit4
	mov	rax, t1
	mov	t0, r6
	ret
// -- End function
// -- Begin function powf
powf:                                   // @powf
// %bb.0:
	mov	r3, r1
	call	__extendsfdf2
	mov	r2, rax
	mov	r1, t0
	mov	r0, r3
	call	__extendsfdf2
	mov	r3, t0
	mov	r0, r2
	mov	r2, rax
	call	pow
	mov	r1, t0
	mov	r0, rax
	call	__truncdfsf2
	ret
// -- End function
// -- Begin function powl
powl:                                   // @powl
// %bb.0:
	jmp	pow
// -- End function
// -- Begin function fmod
fmod:                                   // @fmod
// %bb.0:
	mov	r6, r3
	mov	r7, r2
	mov	r4, r1
	mov	r5, r0
	mov	r2, 0
	mov	r3, 0
	mov	t1, 0
	mov	r0, r7
	mov	r1, r6
	call	__nedf2
	jnz	rax, .LBB68_2
	jmp	.LBB68_1
.LBB68_1:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 33
	mov	t0, 2146959360
	jmp	.LBB68_3
.LBB68_2:
	mov	r0, r5
	mov	r1, r4
	mov	r2, r7
	mov	r3, r6
	call	__divdf3
	mov	r1, t0
	mov	r0, rax
	call	__fixdfsi
	mov	r0, rax
	call	__floatsidf
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	mov	r2, rax
	call	__subdf3
	mov	t1, rax
.LBB68_3:
	mov	rax, t1
	ret
// -- End function
// -- Begin function fmodf
fmodf:                                  // @fmodf
// %bb.0:
	mov	r2, r1
	mov	r1, 0
	mov	r4, r0
	mov	r0, r2
	call	__nesf2
	jnz	rax, .LBB69_2
	jmp	.LBB69_1
.LBB69_1:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 33
	mov	rax, 2143289344
	jmp	.LBB69_3
.LBB69_2:
	mov	r0, r2
	call	__extendsfdf2
	mov	r2, rax
	mov	r3, t0
	mov	r0, r4
	call	__extendsfdf2
	mov	r4, rax
	mov	r5, t0
	mov	r0, r4
	mov	r1, r5
	call	__divdf3
	mov	r1, t0
	mov	r0, rax
	call	__fixdfsi
	mov	r0, rax
	call	__floatsidf
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r3, t0
	mov	r0, r4
	mov	r1, r5
	mov	r2, rax
	call	__subdf3
	mov	r1, t0
	mov	r0, rax
	call	__truncdfsf2
.LBB69_3:
	ret
// -- End function
// -- Begin function fmodl
fmodl:                                  // @fmodl
// %bb.0:
	mov	r6, r3
	mov	r7, r2
	mov	r4, r1
	mov	r5, r0
	mov	r2, 0
	mov	r3, 0
	mov	t1, 0
	mov	r0, r7
	mov	r1, r6
	call	__nedf2
	jnz	rax, .LBB70_2
	jmp	.LBB70_1
.LBB70_1:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 33
	mov	t0, 2146959360
	jmp	.LBB70_3
.LBB70_2:
	mov	r0, r5
	mov	r1, r4
	mov	r2, r7
	mov	r3, r6
	call	__divdf3
	mov	r1, t0
	mov	r0, rax
	call	__fixdfsi
	mov	r0, rax
	call	__floatsidf
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r3, t0
	mov	r0, r5
	mov	r1, r4
	mov	r2, rax
	call	__subdf3
	mov	t1, rax
.LBB70_3:
	mov	rax, t1
	ret
// -- End function
// -- Begin function copysign
copysign:                               // @copysign
// %bb.0:
	mov	r4, r1
	mov	r1, -2147483648
	mov	r5, r0
	mov	r0, r3
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r2, 0
	mov	r3, 0
	mov	r6, rax
	mov	r0, r5
	mov	r1, r4
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	r2, rax
	mov	r0, r4
	call	__bit_xor
	mov	r3, rax
	mov	r0, r2
	mov	r1, r6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	sub	r3, r4
	mov	r0, rax
	mov	r1, r3
	call	__bit_and
	add	r4, rax
	mov	rax, r5
	mov	t0, r4
	ret
// -- End function
// -- Begin function copysignf
copysignf:                              // @copysignf
// %bb.0:
	mov	r3, r1
	mov	r1, -2147483648
	mov	r2, r0
	mov	r0, r3
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 0
	mov	r3, rax
	mov	r0, r2
	call	__ltsf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	r4, rax
	mov	r0, r2
	call	__bit_xor
	mov	r5, rax
	mov	r0, r4
	mov	r1, r3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	sub	r5, r2
	mov	r0, rax
	mov	r1, r5
	call	__bit_and
	add	rax, r2
	ret
// -- End function
// -- Begin function copysignl
copysignl:                              // @copysignl
// %bb.0:
	mov	r4, r1
	mov	r1, -2147483648
	mov	r5, r0
	mov	r0, r3
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r2, 0
	mov	r3, 0
	mov	r6, rax
	mov	r0, r5
	mov	r1, r4
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	r2, rax
	mov	r0, r4
	call	__bit_xor
	mov	r3, rax
	mov	r0, r2
	mov	r1, r6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	sub	r3, r4
	mov	r0, rax
	mov	r1, r3
	call	__bit_and
	add	r4, rax
	mov	rax, r5
	mov	t0, r4
	ret
// -- End function
// -- Begin function fmin
fmin:                                   // @fmin
// %bb.0:
	mov	r5, r3
	mov	r4, r2
	mov	r7, r1
	mov	r6, r0
	mov	r2, r6
	mov	r3, r7
	call	__unorddf2
	mov	r0, rax
	mov	rax, r4
	mov	r2, r5
	jnz	r0, .LBB74_3
	jmp	.LBB74_1
.LBB74_1:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r4
	mov	r3, r5
	call	__unorddf2
	mov	r0, rax
	mov	rax, r6
	mov	r2, r7
	jnz	r0, .LBB74_3
	jmp	.LBB74_2
.LBB74_2:
	mov	r0, r6
	mov	r1, r7
	mov	r2, r4
	mov	r3, r5
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
add	r0, 1
	sub	r7, r5
	mov	r1, r7
	call	__bit_and
	mov	r2, rax
	sub	r6, r4
	add	r2, r5
	mov	r1, r6
	call	__bit_and
	add	rax, r4
.LBB74_3:
	mov	t0, r2
	ret
// -- End function
// -- Begin function fminf
fminf:                                  // @fminf
// %bb.0:
	mov	r2, r1
	mov	r3, r0
	mov	r1, r3
	call	__unordsf2
	mov	r0, rax
	mov	rax, r2
	jnz	r0, .LBB75_3
	jmp	.LBB75_1
.LBB75_1:
	mov	r0, r2
	mov	r1, r2
	call	__unordsf2
	mov	r0, rax
	mov	rax, r3
	jnz	r0, .LBB75_3
	jmp	.LBB75_2
.LBB75_2:
	mov	r0, r3
	mov	r1, r2
	call	__ltsf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	sub	r3, r2
add	rax, 1
	mov	r0, rax
	mov	r1, r3
	call	__bit_and
	add	rax, r2
.LBB75_3:
	ret
// -- End function
// -- Begin function fminl
fminl:                                  // @fminl
// %bb.0:
	mov	r5, r3
	mov	r4, r2
	mov	r7, r1
	mov	r6, r0
	mov	r2, r6
	mov	r3, r7
	call	__unorddf2
	mov	r0, rax
	mov	rax, r4
	mov	r2, r5
	jnz	r0, .LBB76_3
	jmp	.LBB76_1
.LBB76_1:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r4
	mov	r3, r5
	call	__unorddf2
	mov	r0, rax
	mov	rax, r6
	mov	r2, r7
	jnz	r0, .LBB76_3
	jmp	.LBB76_2
.LBB76_2:
	mov	r0, r6
	mov	r1, r7
	mov	r2, r4
	mov	r3, r5
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
add	r0, 1
	sub	r7, r5
	mov	r1, r7
	call	__bit_and
	mov	r2, rax
	sub	r6, r4
	add	r2, r5
	mov	r1, r6
	call	__bit_and
	add	rax, r4
.LBB76_3:
	mov	t0, r2
	ret
// -- End function
// -- Begin function fmax
fmax:                                   // @fmax
// %bb.0:
	mov	r5, r3
	mov	r4, r2
	mov	r7, r1
	mov	r6, r0
	mov	r2, r6
	mov	r3, r7
	call	__unorddf2
	mov	r0, rax
	mov	rax, r4
	mov	r2, r5
	jnz	r0, .LBB77_3
	jmp	.LBB77_1
.LBB77_1:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r4
	mov	r3, r5
	call	__unorddf2
	mov	r0, rax
	mov	rax, r6
	mov	r2, r7
	jnz	r0, .LBB77_3
	jmp	.LBB77_2
.LBB77_2:
	mov	r0, r6
	mov	r1, r7
	mov	r2, r4
	mov	r3, r5
	call	__gtdf2
	mov	r1, -2147483648
	mov	r2, -2147483648
	mov	r0, rax
	call	__bit_xor
	sub	r2, rax
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
add	r0, 1
	sub	r7, r5
	mov	r1, r7
	call	__bit_and
	mov	r2, rax
	sub	r6, r4
	add	r2, r5
	mov	r1, r6
	call	__bit_and
	add	rax, r4
.LBB77_3:
	mov	t0, r2
	ret
// -- End function
// -- Begin function fmaxf
fmaxf:                                  // @fmaxf
// %bb.0:
	mov	r2, r1
	mov	r3, r0
	mov	r1, r3
	call	__unordsf2
	mov	r0, rax
	mov	rax, r2
	jnz	r0, .LBB78_3
	jmp	.LBB78_1
.LBB78_1:
	mov	r0, r2
	mov	r1, r2
	call	__unordsf2
	mov	r0, rax
	mov	rax, r3
	jnz	r0, .LBB78_3
	jmp	.LBB78_2
.LBB78_2:
	mov	r0, r3
	mov	r1, r2
	call	__gtsf2
	mov	r1, -2147483648
	mov	r4, -2147483648
	mov	r0, rax
	call	__bit_xor
	sub	r4, rax
	mov	r1, 31
	mov	r0, r4
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	sub	r3, r2
add	rax, 1
	mov	r0, rax
	mov	r1, r3
	call	__bit_and
	add	rax, r2
.LBB78_3:
	ret
// -- End function
// -- Begin function fmaxl
fmaxl:                                  // @fmaxl
// %bb.0:
	mov	r5, r3
	mov	r4, r2
	mov	r7, r1
	mov	r6, r0
	mov	r2, r6
	mov	r3, r7
	call	__unorddf2
	mov	r0, rax
	mov	rax, r4
	mov	r2, r5
	jnz	r0, .LBB79_3
	jmp	.LBB79_1
.LBB79_1:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r4
	mov	r3, r5
	call	__unorddf2
	mov	r0, rax
	mov	rax, r6
	mov	r2, r7
	jnz	r0, .LBB79_3
	jmp	.LBB79_2
.LBB79_2:
	mov	r0, r6
	mov	r1, r7
	mov	r2, r4
	mov	r3, r5
	call	__gtdf2
	mov	r1, -2147483648
	mov	r2, -2147483648
	mov	r0, rax
	call	__bit_xor
	sub	r2, rax
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
add	r0, 1
	sub	r7, r5
	mov	r1, r7
	call	__bit_and
	mov	r2, rax
	sub	r6, r4
	add	r2, r5
	mov	r1, r6
	call	__bit_and
	add	rax, r4
.LBB79_3:
	mov	t0, r2
	ret
// -- End function
// -- Begin function signal
signal:                                 // @signal
// %bb.0:
	mov	r2, r1
	mov	r3, r0
add	r0, -7
	mov	r1, -2147483648
	mov	r4, -1
	call	__bit_xor
	mov	r0, 2147483642
	jl	rax, r0, .LBB80_2
	jmp	.LBB80_1
.LBB80_1:
	mov	r1, 2
	mov	r0, r3
	call	__bit_shl
	mov	r0, mcasm_static_587a65ffaedd8d46cf598fc6494fd1ec
	add	r0, rax
	mov	r4, [r0]
	mov	[r0], r2
.LBB80_2:
	mov	rax, r4
	ret
// -- End function
// -- Begin function raise
raise:                                  // @raise
// %bb.0:
	mov	r2, r0
add	r0, -7
	mov	r1, -2147483648
	mov	r3, -1
	call	__bit_xor
	mov	r0, 2147483642
	jl	rax, r0, .LBB81_7
	jmp	.LBB81_1
.LBB81_1:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shl
	mov	r0, mcasm_static_587a65ffaedd8d46cf598fc6494fd1ec
	add	r0, rax
	mov	r1, [r0]
	mov	r0, 1
	mov	r3, 0
	je	r1, r0, .LBB81_7
	jmp	.LBB81_2
.LBB81_2:
	jnz	r1, .LBB81_6
	jmp	.LBB81_3
.LBB81_3:
	jne	r2, r0, .LBB81_7
	jmp	.LBB81_4
.LBB81_4:
	call abort
.LBB81_5:                               // =>This Inner Loop Header: Depth=1
	jmp	.LBB81_5
.LBB81_6:
	mov	r0, r2
	calld	r1
.LBB81_7:
	mov	rax, r3
	ret
// -- End function
// -- Begin function printf
printf:                                 // @printf
// %bb.0:
sub	rsp, 32
	mov	t0, rsp
	mov	t1, rsp
	mov	t2, rsp
	mov	t3, rsp
	mov	t4, rsp
	mov	t5, rsp
add	t0, 4
	mov	[t0], r2
add	t1, 8
	mov	[t1], r3
add	t2, 12
	mov	[t2], r4
add	t3, 16
	mov	[t3], r5
add	t4, 20
	mov	[t4], r6
add	t5, 24
	mov	[t5], r7
	mov	[rsp+1], r1
	mov	[rsp+7], rsp
	mov	r1, rsp
	call	vprintf
add	rsp, 32
	ret
// -- End function
// -- Begin function putchar
putchar:                                // @putchar
// %bb.0:
	mov	r1, 255
	mov	r3, r0
	call	__bit_and
	mov	r6, mcasm_static_77cddc3e58d09d60125d4f48b8ea755c
	mov	r4, [r6]
	mov	r0, 10
	mov	r2, rax
	jne	r2, r0, .LBB83_2
	jmp	.LBB83_1
.LBB83_1:
	mov	r0, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	add	r4, r0
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r4, rax
	mov	r5, [r4]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	r0, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	mov	[r4], rax
	call	puts
	mov	[r6], 0
	jmp	.LBB83_5
.LBB83_2:
	mov	r1, -2147483648
	mov	r0, r4
	call	__bit_xor
	mov	r0, -2147482625
	jl	rax, r0, .LBB83_4
	jmp	.LBB83_3
.LBB83_3:
	mov	r0, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	add	r4, r0
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r6, rax
	mov	r4, [r6]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r4
	mov	r1, rax
	call	__bit_and
	mov	r7, rax
	mov	r0, 0
	mov	r4, 0
	mov	r1, r5
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	r0, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	mov	[r6], rax
	call	puts
.LBB83_4:
	mov	r5, r4
add	r5, 1
	mov	r6, mcasm_static_77cddc3e58d09d60125d4f48b8ea755c
	mov	r0, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	add	r0, r4
	mov	r1, 3
	mov	[r6], r5
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r1, 255
	mov	r4, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, 255
	mov	r3, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r6, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
.LBB83_5:                               // %__stdout_linebuf_putc.exit
	mov	rax, r2
	ret
// -- End function
// -- Begin function __ll_puts_char0
__ll_puts_char0:                        // @__ll_puts_char0
// %bb.0:
	inline data modify storage std:vm s0 set value {a: -1}
	inline execute store result storage std:vm s0.a int 1 run scoreboard players get r0 vm_regs
	inline function _ll_shared:z/__ll_puts_char0_0 with storage std:vm s0
	ret
// -- End function
// -- Begin function __ll_puts_char1
__ll_puts_char1:                        // @__ll_puts_char1
// %bb.0:
	inline data modify storage std:vm s0 set value {a: -1}
	inline execute store result storage std:vm s0.a int 1 run scoreboard players get r0 vm_regs
	inline function _ll_shared:z/__ll_puts_char1_0 with storage std:vm s0
	ret
// -- End function
// -- Begin function puts
puts:                                   // @puts
// %bb.0:
	jnz	r0, .LBB86_2
	jmp	.LBB86_1
.LBB86_1:
	call	abort
.LBB86_2:
	mov	rax, 1
	inline data modify storage std:vm s0 set value {a: -1}
	inline execute store result storage std:vm s0.a int 1 run scoreboard players get r0 vm_regs
	inline function _ll_shared:z/puts_0 with storage std:vm s0
	ret
// -- End function
// -- Begin function snprintf
snprintf:                               // @snprintf
// %bb.0:
sub	rsp, 24
	mov	t0, rsp
	mov	t1, rsp
	mov	t2, rsp
	mov	t3, rsp
add	t0, 4
	mov	[t0], r4
add	t1, 8
	mov	[t1], r5
add	t2, 12
	mov	[t2], r6
add	t3, 16
	mov	[t3], r7
	mov	[rsp+1], r3
	mov	[rsp+5], rsp
	mov	r3, rsp
	call	vsnprintf
add	rsp, 24
	ret
// -- End function
// -- Begin function sprintf
sprintf:                                // @sprintf
// %bb.0:
sub	rsp, 28
	mov	t0, r1
	mov	r1, rsp
	mov	t1, rsp
	mov	t2, rsp
	mov	t3, rsp
	mov	t4, rsp
add	r1, 4
	mov	[r1], r3
add	t1, 8
	mov	[t1], r4
add	t2, 12
	mov	[t2], r5
add	t3, 16
	mov	[t3], r6
add	t4, 20
	mov	[t4], r7
	mov	[rsp+1], r2
	mov	r1, -1
	mov	[rsp+6], rsp
	mov	r2, t0
	mov	r3, rsp
	call	vsnprintf
add	rsp, 28
	ret
// -- End function
// -- Begin function __stdout_linebuf_flush
__stdout_linebuf_flush:                 // @__stdout_linebuf_flush
// %bb.0:
	mov	r5, mcasm_static_77cddc3e58d09d60125d4f48b8ea755c
	mov	r0, [r5]
	jz	r0, .LBB89_2
	jmp	.LBB89_1
.LBB89_1:
	mov	r1, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	add	r0, r1
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r4, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r4
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r4, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	r0, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	mov	[r3], rax
	call	puts
	mov	[r5], 0
.LBB89_2:
	mov	rax, 0
	ret
// -- End function
// -- Begin function __stdout_linebuf_putc
__stdout_linebuf_putc:                  // @__stdout_linebuf_putc
// %bb.0:
	mov	r1, 255
	mov	r3, r0
	call	__bit_and
	mov	r6, mcasm_static_77cddc3e58d09d60125d4f48b8ea755c
	mov	r4, [r6]
	mov	r0, 10
	mov	r2, rax
	jne	r2, r0, .LBB90_2
	jmp	.LBB90_1
.LBB90_1:
	mov	r0, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	add	r4, r0
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r4, rax
	mov	r5, [r4]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	r0, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	mov	[r4], rax
	call	puts
	mov	[r6], 0
	jmp	.LBB90_5
.LBB90_2:
	mov	r1, -2147483648
	mov	r0, r4
	call	__bit_xor
	mov	r0, -2147482625
	jl	rax, r0, .LBB90_4
	jmp	.LBB90_3
.LBB90_3:
	mov	r0, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	add	r4, r0
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r6, rax
	mov	r4, [r6]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r4
	mov	r1, rax
	call	__bit_and
	mov	r7, rax
	mov	r0, 0
	mov	r4, 0
	mov	r1, r5
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	r0, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	mov	[r6], rax
	call	puts
.LBB90_4:
	mov	r5, r4
add	r5, 1
	mov	r6, mcasm_static_77cddc3e58d09d60125d4f48b8ea755c
	mov	r0, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	add	r0, r4
	mov	r1, 3
	mov	[r6], r5
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r1, 255
	mov	r4, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, 255
	mov	r3, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r6, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
.LBB90_5:
	mov	rax, r2
	ret
// -- End function
// -- Begin function __stdout_linebuf_write
__stdout_linebuf_write:                 // @__stdout_linebuf_write
// %bb.0:
sub	rsp, 56
	mov	[rsp+13], x0
	mov	[rsp+12], x1
	mov	[rsp+11], x2
	mov	[rsp+10], x3
	mov	[rsp+9], x4
	mov	[rsp+8], x5
	mov	[rsp+7], x6
	mov	[rsp+6], x7
	mov	[rsp+5], x8
	mov	[rsp+4], x9
	mov	[rsp+3], x10
	mov	[rsp+2], x11
	mov	[rsp+1], x12
	mov	[rsp], x13
	mov	r2, r1
	mov	r3, r0
	jz	r2, .LBB91_42
	jmp	.LBB91_1
.LBB91_1:                               // %.preheader8.preheader
	mov	t7, 3
	mov	x0, -2147483644
	mov	x1, 10
	mov	x2, -2139062144
	mov	x3, -2147483645
	mov	x4, mcasm_static_77cddc3e58d09d60125d4f48b8ea755c
	mov	x5, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	mov	x6, -2147483632
	mov	x7, -2147482625
	mov	x8, -2147483633
.LBB91_2:                               // %.preheader8
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB91_4 Depth 2
                                        //     Child Loop BB91_9 Depth 2
                                        //     Child Loop BB91_13 Depth 2
                                        //     Child Loop BB91_19 Depth 2
                                        //       Child Loop BB91_21 Depth 3
                                        //       Child Loop BB91_30 Depth 3
                                        //       Child Loop BB91_27 Depth 3
                                        //       Child Loop BB91_28 Depth 3
                                        //       Child Loop BB91_34 Depth 3
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r4, r2
	mov	r5, r3
	jz	rax, .LBB91_7
	jmp	.LBB91_3
.LBB91_3:                               // %.preheader5.preheader
                                        //   in Loop: Header=BB91_2 Depth=1
	mov	r6, r3
add	r6, 1
	mov	r5, r3
	mov	r4, r2
.LBB91_4:                               // %.preheader5
                                        //   Parent Loop BB91_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x9, 0
	jz	r4, .LBB91_15
	jmp	.LBB91_5
.LBB91_5:                               //   in Loop: Header=BB91_4 Depth=2
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x9, r5
	je	rax, x1, .LBB91_15
	jmp	.LBB91_6
.LBB91_6:                               //   in Loop: Header=BB91_4 Depth=2
	mov	r1, 3
add	r5, 1
	mov	r0, r6
	call	__bit_and
add	r6, 1
add	r4, -1
	jnz	rax, .LBB91_4
	jmp	.LBB91_7
.LBB91_7:                               // %.loopexit9.i
                                        //   in Loop: Header=BB91_2 Depth=1
	mov	r1, -2147483648
	mov	r0, r4
	call	__bit_xor
	jl	rax, x0, .LBB91_11
	jmp	.LBB91_8
.LBB91_8:                               // %.preheader.preheader
                                        //   in Loop: Header=BB91_2 Depth=1
.LBB91_9:                               // %.preheader
                                        //   Parent Loop BB91_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r6, [r5]
	mov	r1, 168430090
	mov	r0, r6
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, r6
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x2, .LBB91_12
	jmp	.LBB91_10
.LBB91_10:                              //   in Loop: Header=BB91_9 Depth=2
add	r4, -4
	mov	r1, -2147483648
add	r5, 4
	mov	r0, r4
	call	__bit_xor
	jg	rax, x3, .LBB91_9
	jmp	.LBB91_11
.LBB91_11:                              // %.loopexit6.i
                                        //   in Loop: Header=BB91_2 Depth=1
	mov	x9, 0
	jz	r4, .LBB91_15
	jmp	.LBB91_12
.LBB91_12:                              // %.loopexit5.i.preheader
                                        //   in Loop: Header=BB91_2 Depth=1
.LBB91_13:                              // %.loopexit5.i
                                        //   Parent Loop BB91_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x9, r5
	je	rax, x1, .LBB91_15
	jmp	.LBB91_14
.LBB91_14:                              //   in Loop: Header=BB91_13 Depth=2
add	r4, -1
add	r5, 1
	mov	x9, 0
	jnz	r4, .LBB91_13
	jmp	.LBB91_15
.LBB91_15:                              // %memchr.exit
                                        //   in Loop: Header=BB91_2 Depth=1
	mov	x10, r2
	jz	x9, .LBB91_17
	jmp	.LBB91_16
.LBB91_16:                              //   in Loop: Header=BB91_2 Depth=1
	mov	x10, x9
	sub	x10, r3
.LBB91_17:                              //   in Loop: Header=BB91_2 Depth=1
	jz	x10, .LBB91_39
	jmp	.LBB91_18
.LBB91_18:                              //   in Loop: Header=BB91_2 Depth=1
	mov	r6, [x4]
.LBB91_19:                              //   Parent Loop BB91_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB91_21 Depth 3
                                        //       Child Loop BB91_30 Depth 3
                                        //       Child Loop BB91_27 Depth 3
                                        //       Child Loop BB91_28 Depth 3
                                        //       Child Loop BB91_34 Depth 3
	mov	r5, 1023
	sub	r5, r6
	mov	r4, x10
	sub	r4, r5
	mov	r1, 31
	mov	r0, r4
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r4
	call	__bit_and
	mov	r4, rax
	add	r4, r5
	mov	r5, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	mov	r1, -2147483648
	add	r5, r6
	mov	r0, r4
	call	__bit_xor
	mov	t1, r3
	mov	r7, r4
	jl	rax, x6, .LBB91_32
	jmp	.LBB91_20
.LBB91_20:                              //   in Loop: Header=BB91_19 Depth=2
	mov	r1, 3
	mov	r0, r5
	call	__bit_and
	mov	r7, rax
	mov	x12, 8
	sub	x12, r7
	mov	t6, 0
	mov	x13, 1
	mov	t2, r3
.LBB91_21:                              //   Parent Loop BB91_2 Depth=1
                                        //     Parent Loop BB91_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	x11, x13
	mov	t1, r5
	mov	r0, r3
	add	r0, t6
	mov	r1, 2
	add	t1, t6
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t3, rax
	mov	r0, t1
	call	__bit_and
	mov	r1, -4
	mov	t4, rax
	call	__bit_and
	mov	t1, rax
	mov	t5, [t1]
	mov	r1, 3
	mov	r0, t4
	call	__bit_shl
	mov	r0, 255
	mov	t4, rax
	mov	r1, t4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t5, rax
	mov	r0, t3
	call	__bit_and
	mov	r0, rax
	mov	r1, t4
	call	__bit_shl
	mov	r0, t5
	mov	r1, rax
	call	__bit_or
	mov	[t1], rax
add	t6, 1
add	t2, 1
add	x13, 1
	jne	x12, t6, .LBB91_21
	jmp	.LBB91_22
.LBB91_22:                              //   in Loop: Header=BB91_19 Depth=2
	mov	r1, -8
	mov	r0, r7
	call	__bit_or
	mov	r7, rax
	mov	t1, r3
	add	t1, t6
	mov	r1, 3
	add	r7, r4
	mov	r0, t1
	call	__bit_and
	mov	r0, rax
	jnz	r0, .LBB91_29
	jmp	.LBB91_23
.LBB91_23:                              //   in Loop: Header=BB91_19 Depth=2
	mov	r1, -2147483648
	add	r5, t6
	mov	r0, r7
	call	__bit_xor
	jl	rax, x6, .LBB91_25
	jmp	.LBB91_24
.LBB91_24:                              // %.preheader.i.preheader
                                        //   in Loop: Header=BB91_19 Depth=2
	jmp	.LBB91_27
.LBB91_25:                              // %.preheader118
                                        //   in Loop: Header=BB91_19 Depth=2
	jmp	.LBB91_28
.LBB91_26:                              //   in Loop: Header=BB91_19 Depth=2
	jg	r7, t7, .LBB91_25
	jmp	.LBB91_32
.LBB91_27:                              // %.preheader.i
                                        //   Parent Loop BB91_2 Depth=1
                                        //     Parent Loop BB91_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r0, [t1]
	mov	r1, t1
add	r1, 4
	mov	[r5], r0
	mov	r0, [r1]
	mov	r1, r5
add	r1, 4
	mov	t0, t1
add	t0, 8
	mov	t2, r5
	mov	[r1], r0
	mov	r0, [t0]
add	t2, 8
	mov	r1, t1
add	r1, 12
	mov	t0, r5
add	t0, 12
	mov	[t2], r0
add	t1, 16
	mov	r0, [r1]
add	r5, 16
add	r7, -16
	mov	r1, -2147483648
	mov	[t0], r0
	mov	r0, r7
	call	__bit_xor
	jg	rax, x8, .LBB91_27
	jmp	.LBB91_26
.LBB91_28:                              //   Parent Loop BB91_2 Depth=1
                                        //     Parent Loop BB91_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r0, [t1]
add	t1, 4
	mov	[r5], r0
add	r7, -4
	mov	r1, -2147483648
add	r5, 4
	mov	r0, r7
	call	__bit_xor
	jg	rax, x3, .LBB91_28
	jmp	.LBB91_32
.LBB91_29:                              //   in Loop: Header=BB91_19 Depth=2
	call	__bit_shl
	mov	r6, rax
	mov	t3, 8
	sub	t3, r0
	mov	r0, t2
	call	__bit_and
	mov	x12, r3
	sub	x12, rax
	add	t6, x12
	mov	t4, [t6]
add	x12, 4
.LBB91_30:                              //   Parent Loop BB91_2 Depth=1
                                        //     Parent Loop BB91_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r0, x12
	add	r0, x11
	mov	t5, [r0]
	mov	x13, r5
	mov	r1, 31
	add	x13, x11
	mov	r0, r6
	call	__bit_and
	mov	r0, t4
	mov	r1, rax
	call	__bit_shl
	mov	t4, rax
	mov	r0, r6
	call	__bit_not
	mov	r1, 31
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
	mov	t6, rax
	mov	r0, t5
	call	__bit_shr
	mov	r0, rax
	mov	r1, t6
	call	__bit_shr
	mov	r0, t4
	mov	r1, rax
	call	__bit_or
	mov	[x13], rax
add	r7, -4
	mov	r1, -2147483648
add	x11, 4
	mov	r0, t3
	call	__bit_xor
	mov	t6, rax
	mov	r0, r7
	call	__bit_xor
	mov	t4, t5
	jge	rax, t6, .LBB91_30
	jmp	.LBB91_31
.LBB91_31:                              //   in Loop: Header=BB91_19 Depth=2
	mov	r1, -4
	mov	r0, t1
	call	__bit_or
	mov	r1, 3
	mov	r6, rax
	mov	r0, t2
	call	__bit_and
	mov	t1, r3
	sub	t1, rax
	add	t1, r6
	add	t1, x11
add	t1, 4
	add	r5, x11
	jmp	.LBB91_33
.LBB91_32:                              // %.loopexit8.i
                                        //   in Loop: Header=BB91_19 Depth=2
	jz	r7, .LBB91_36
	jmp	.LBB91_33
.LBB91_33:                              // %.preheader115
                                        //   in Loop: Header=BB91_19 Depth=2
	mov	t3, t1
	mov	t4, r5
.LBB91_34:                              //   Parent Loop BB91_2 Depth=1
                                        //     Parent Loop BB91_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
add	r7, -1
	mov	r1, 2
add	t3, 1
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	mov	r1, 3
add	t4, 1
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	t1, rax
	call	__bit_and
	mov	r5, rax
	mov	t2, [r5]
	mov	r1, 3
	mov	r0, t1
	call	__bit_shl
	mov	r0, 255
	mov	t1, rax
	mov	r1, t1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t2, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, t1
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r5, t4
	mov	t1, t3
	jnz	r7, .LBB91_34
	jmp	.LBB91_35
.LBB91_35:                              // %memcpy.exit.loopexit
                                        //   in Loop: Header=BB91_19 Depth=2
	mov	r6, [x4]
.LBB91_36:                              // %memcpy.exit
                                        //   in Loop: Header=BB91_19 Depth=2
	add	r6, r4
	mov	r1, -2147483648
	mov	[x4], r6
	mov	r0, r6
	call	__bit_xor
	jl	rax, x7, .LBB91_38
	jmp	.LBB91_37
.LBB91_37:                              //   in Loop: Header=BB91_19 Depth=2
	add	r6, x5
	mov	r1, 3
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r7, rax
	mov	r6, [r7]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, 0
	mov	r6, 0
	mov	r1, r5
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r0, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	mov	[r7], rax
	call	puts
	mov	[x4], 0
.LBB91_38:                              //   in Loop: Header=BB91_19 Depth=2
	add	r3, r4
	sub	x10, r4
	sub	r2, r4
	jnz	x10, .LBB91_19
	jmp	.LBB91_39
.LBB91_39:                              // %.loopexit
                                        //   in Loop: Header=BB91_2 Depth=1
	jz	x9, .LBB91_41
	jmp	.LBB91_40
.LBB91_40:                              //   in Loop: Header=BB91_2 Depth=1
	mov	r0, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	add	r0, [x4]
add	r3, 1
	mov	r1, 3
add	r2, -1
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r6, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	r0, mcasm_static_2cc1d183fff04c49451880a295cfbfa8
	mov	[r5], rax
	call	puts
	mov	[x4], 0
.LBB91_41:                              //   in Loop: Header=BB91_2 Depth=1
	jnz	r2, .LBB91_2
	jmp	.LBB91_42
.LBB91_42:                              // %.loopexit9
	mov	rax, 0
	mov	x13, [rsp]
	mov	x12, [rsp+1]
	mov	x11, [rsp+2]
	mov	x10, [rsp+3]
	mov	x9, [rsp+4]
	mov	x8, [rsp+5]
	mov	x7, [rsp+6]
	mov	x6, [rsp+7]
	mov	x5, [rsp+8]
	mov	x4, [rsp+9]
	mov	x3, [rsp+10]
	mov	x2, [rsp+11]
	mov	x1, [rsp+12]
	mov	x0, [rsp+13]
add	rsp, 56
	ret
// -- End function
// -- Begin function vprintf
vprintf:                                // @vprintf
// %bb.0:
sub	rsp, 520
	mov	r3, r1
	mov	r2, r0
	mov	[rsp+129], r3
	mov	r1, 512
	mov	[rsp+128], r3
	mov	r0, rsp
	call	vsnprintf
	mov	r1, rax
	mov	r0, 0
	mov	r5, -1
	jl	r1, r0, .LBB92_41
	jmp	.LBB92_1
.LBB92_1:
	mov	r0, 511
	jg	r1, r0, .LBB92_3
	jmp	.LBB92_2
.LBB92_2:                               // %.thread
	mov	r0, rsp
	call	__stdout_linebuf_write
	mov	r5, r1
	jmp	.LBB92_41
.LBB92_3:
add	r1, 1
	mov	r0, r1
	call	malloc
	mov	r4, rax
	jnz	r4, .LBB92_5
	jmp	.LBB92_4
.LBB92_4:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 12
	jmp	.LBB92_41
.LBB92_5:
	mov	r3, [rsp+129]
	mov	[rsp+128], r3
	mov	r0, r4
	call	vsnprintf
	mov	r0, -1
	mov	r5, rax
	jg	r5, r0, .LBB92_23
	jmp	.LBB92_6
.LBB92_6:
	mov	r0, 16384
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB92_8
	jmp	.LBB92_7
.LBB92_7:
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	r2, r4
add	r2, -1
	mov	r5, [r2]
	mov	r6, 0
	mov	r3, 0
	mov	rax, 0
	jmp	.LBB92_13
.LBB92_8:
	mov	r0, 16386
	mov	r3, [r0]
	mov	r2, r4
add	r2, -1
	mov	r5, [r2]
	mov	r0, r3
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r6, 0
	jz	r3, .LBB92_13
	jmp	.LBB92_9
.LBB92_9:
	jge	r3, r2, .LBB92_13
	jmp	.LBB92_10
.LBB92_10:                              // %.preheader.i.preheader
.LBB92_11:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r6, r3
	mov	r0, r6
add	r0, 1
	mov	r3, [r0]
	mov	r0, r3
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	r3, .LBB92_13
	jmp	.LBB92_12
.LBB92_12:                              // %.preheader.i
                                        //   in Loop: Header=BB92_11 Depth=1
	jl	r3, r2, .LBB92_11
	jmp	.LBB92_13
.LBB92_13:                              // %.loopexit.i
	jne	r3, r2, .LBB92_15
	jmp	.LBB92_14
.LBB92_14:
	call	abort
.LBB92_15:
	mov	r0, 16386
	jz	r6, .LBB92_19
	jmp	.LBB92_16
.LBB92_16:
	mov	r0, [r6]
	mov	r1, r0
	add	r1, r6
	jne	r1, r2, .LBB92_18
	jmp	.LBB92_17
.LBB92_17:
	add	r0, r5
	mov	[r6], r0
	mov	r2, r6
	jmp	.LBB92_20
.LBB92_18:
add	r6, 1
	mov	r0, r6
.LBB92_19:
	mov	[r0], r2
	mov	[r4], r3
.LBB92_20:
	mov	r1, 1
	mov	r5, -1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB92_41
	jmp	.LBB92_21
.LBB92_21:
	mov	r0, [r2]
	mov	r1, r0
	add	r1, r2
	jne	r1, r3, .LBB92_41
	jmp	.LBB92_22
.LBB92_22:
	add	r0, [r3]
	mov	[r2], r0
add	r3, 1
	mov	r0, [r3]
add	r2, 1
	mov	[r2], r0
	jmp	.LBB92_41
.LBB92_23:
	mov	r0, r4
	mov	r1, r5
	call	__stdout_linebuf_write
	je	r4, rsp, .LBB92_41
	jmp	.LBB92_24
.LBB92_24:
	mov	r0, 16384
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB92_26
	jmp	.LBB92_25
.LBB92_25:
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	r2, r4
add	r2, -1
	mov	r6, [r2]
	mov	r7, 0
	mov	r3, 0
	mov	rax, 0
	jmp	.LBB92_31
.LBB92_26:
	mov	r0, 16386
	mov	r3, [r0]
	mov	r2, r4
add	r2, -1
	mov	r6, [r2]
	mov	r0, r3
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r7, 0
	jz	r3, .LBB92_31
	jmp	.LBB92_27
.LBB92_27:
	jge	r3, r2, .LBB92_31
	jmp	.LBB92_28
.LBB92_28:                              // %.preheader.i5.preheader
.LBB92_29:                              // %.preheader.i5
                                        // =>This Inner Loop Header: Depth=1
	mov	r7, r3
	mov	r0, r7
add	r0, 1
	mov	r3, [r0]
	mov	r0, r3
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	r3, .LBB92_31
	jmp	.LBB92_30
.LBB92_30:                              // %.preheader.i5
                                        //   in Loop: Header=BB92_29 Depth=1
	jl	r3, r2, .LBB92_29
	jmp	.LBB92_31
.LBB92_31:                              // %.loopexit.i4
	jne	r3, r2, .LBB92_33
	jmp	.LBB92_32
.LBB92_32:
	call	abort
.LBB92_33:
	mov	r0, 16386
	jz	r7, .LBB92_37
	jmp	.LBB92_34
.LBB92_34:
	mov	r0, [r7]
	mov	r1, r0
	add	r1, r7
	jne	r1, r2, .LBB92_36
	jmp	.LBB92_35
.LBB92_35:
	add	r0, r6
	mov	[r7], r0
	mov	r2, r7
	jmp	.LBB92_38
.LBB92_36:
add	r7, 1
	mov	r0, r7
.LBB92_37:
	mov	[r0], r2
	mov	[r4], r3
.LBB92_38:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB92_41
	jmp	.LBB92_39
.LBB92_39:
	mov	r0, [r2]
	mov	r1, r0
	add	r1, r2
	jne	r1, r3, .LBB92_41
	jmp	.LBB92_40
.LBB92_40:
	add	r0, [r3]
	mov	[r2], r0
add	r3, 1
	mov	r0, [r3]
add	r2, 1
	mov	[r2], r0
.LBB92_41:                              // %free.exit
	mov	rax, r5
add	rsp, 520
	ret
// -- End function
// -- Begin function vsnprintf
vsnprintf:                              // @vsnprintf
// %bb.0:
sub	rsp, 104
	mov	[rsp+25], x0
	mov	[rsp+24], x1
	mov	[rsp+23], x2
	mov	[rsp+22], x3
	mov	[rsp+21], x4
	mov	[rsp+20], x5
	mov	[rsp+19], x6
	mov	[rsp+18], x7
	mov	[rsp+17], x8
	mov	[rsp+16], x9
	mov	[rsp+15], x10
	mov	[rsp+14], x11
	mov	[rsp+13], x12
	mov	[rsp+12], x13
	mov	[rsp+11], x14
	mov	[rsp+10], x15
	mov	t1, r2
	mov	r2, rsp
	mov	r4, rsp
	mov	[rsp+8], r3
	mov	[rsp+5], r0
add	r2, 4
	mov	[r2], r1
add	r4, 8
	mov	[r4], 0
	mov	t6, 2
	mov	t7, 3
	mov	x0, 37
	mov	x1, 42
	mov	x2, 32
	mov	x3, 35
	mov	x4, -1
	mov	x6, 46
	mov	x7, 1
	mov	x9, -2147483638
	mov	x12, 109
	mov	x15, -2139062144
	mov	x14, 43
	mov	x13, 41
	mov	x10, 45
.LBB93_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB93_44 Depth 2
                                        //       Child Loop BB93_40 Depth 3
                                        //         Child Loop BB93_36 Depth 4
                                        //           Child Loop BB93_16 Depth 5
                                        //             Child Loop BB93_24 Depth 6
                                        //             Child Loop BB93_8 Depth 6
                                        //     Child Loop BB93_58 Depth 2
                                        //     Child Loop BB93_64 Depth 2
                                        //     Child Loop BB93_183 Depth 2
                                        //     Child Loop BB93_185 Depth 2
                                        //     Child Loop BB93_187 Depth 2
                                        //     Child Loop BB93_198 Depth 2
                                        //     Child Loop BB93_209 Depth 2
                                        //     Child Loop BB93_220 Depth 2
                                        //     Child Loop BB93_176 Depth 2
                                        //     Child Loop BB93_159 Depth 2
                                        //     Child Loop BB93_246 Depth 2
                                        //     Child Loop BB93_260 Depth 2
	mov	r1, 2
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	rax, x0, .LBB93_3
	jmp	.LBB93_2
.LBB93_2:                               //   in Loop: Header=BB93_1 Depth=1
	jz	rax, .LBB93_273
	jmp	.LBB93_4
.LBB93_3:                               // %.preheader55.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r6, 0
	mov	r2, 32
	mov	r3, t1
	mov	t4, 0
	mov	t5, 0
	mov	x11, 0
	mov	r7, 0
	jmp	.LBB93_44
.LBB93_4:                               //   in Loop: Header=BB93_1 Depth=1
	mov	r3, rax
	mov	r0, rsp
	mov	r1, rsp
add	r0, 4
add	r1, 8
	mov	r4, [r1]
	mov	r0, [r0]
	mov	r2, r4
add	r2, 1
	jz	r0, .LBB93_7
	jmp	.LBB93_5
.LBB93_5:                               //   in Loop: Header=BB93_1 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r5, rax
	mov	r0, r2
	call	__bit_xor
	jge	rax, r5, .LBB93_7
	jmp	.LBB93_6
.LBB93_6:                               //   in Loop: Header=BB93_1 Depth=1
	add	r4, [rsp+5]
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r4, rax
	mov	r6, [r4]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r1, 255
	mov	r5, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, 255
	mov	r3, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r6, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r4], rax
.LBB93_7:                               //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	t1, 1
add	r0, 8
	mov	[r0], r2
	jmp	.LBB93_1
.LBB93_8:                               // %.preheader
                                        //   Parent Loop BB93_1 Depth=1
                                        //     Parent Loop BB93_44 Depth=2
                                        //       Parent Loop BB93_40 Depth=3
                                        //         Parent Loop BB93_36 Depth=4
                                        //           Parent Loop BB93_16 Depth=5
                                        // =>          This Inner Loop Header: Depth=6
add	r3, 1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	je	t2, x10, .LBB93_8
	jmp	.LBB93_9
.LBB93_9:                               // %.preheader
                                        //   in Loop: Header=BB93_16 Depth=5
	jg	t2, x13, .LBB93_12
	jmp	.LBB93_10
.LBB93_10:                              // %.preheader
                                        //   in Loop: Header=BB93_36 Depth=4
	je	t2, x2, .LBB93_33
	jmp	.LBB93_11
.LBB93_11:                              // %.preheader
                                        //   in Loop: Header=BB93_40 Depth=3
	je	t2, x3, .LBB93_37
	jmp	.LBB93_53
.LBB93_12:                              // %.preheader
                                        //   in Loop: Header=BB93_16 Depth=5
	je	t2, x1, .LBB93_45
	jmp	.LBB93_13
.LBB93_13:                              // %.preheader
                                        //   in Loop: Header=BB93_16 Depth=5
	mov	r0, 48
	je	t2, r0, .LBB93_41
	jmp	.LBB93_14
.LBB93_14:                              // %.preheader
                                        //   in Loop: Header=BB93_16 Depth=5
	jne	t2, x14, .LBB93_53
	jmp	.LBB93_15
.LBB93_15:                              // %.loopexit27.outer.loopexit
                                        //   in Loop: Header=BB93_16 Depth=5
	mov	x11, 1
	mov	r7, 1
.LBB93_16:                              // %.loopexit27.outer
                                        //   Parent Loop BB93_1 Depth=1
                                        //     Parent Loop BB93_44 Depth=2
                                        //       Parent Loop BB93_40 Depth=3
                                        //         Parent Loop BB93_36 Depth=4
                                        // =>        This Loop Header: Depth=5
                                        //             Child Loop BB93_24 Depth 6
                                        //             Child Loop BB93_8 Depth 6
	mov	r4, r3
add	r4, 1
	mov	r1, 2
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	jg	t2, x1, .LBB93_20
	jmp	.LBB93_17
.LBB93_17:                              // %.loopexit27.outer
                                        //   in Loop: Header=BB93_36 Depth=4
	je	t2, x2, .LBB93_35
	jmp	.LBB93_18
.LBB93_18:                              // %.loopexit27.outer
                                        //   in Loop: Header=BB93_40 Depth=3
	je	t2, x3, .LBB93_39
	jmp	.LBB93_19
.LBB93_19:                              // %.loopexit27.outer
                                        //   in Loop: Header=BB93_1 Depth=1
	je	t2, x1, .LBB93_47
	jmp	.LBB93_55
.LBB93_20:                              // %.loopexit27.outer
                                        //   in Loop: Header=BB93_16 Depth=5
	je	t2, x14, .LBB93_23
	jmp	.LBB93_21
.LBB93_21:                              // %.loopexit27.outer
                                        //   in Loop: Header=BB93_16 Depth=5
	je	t2, x10, .LBB93_32
	jmp	.LBB93_22
.LBB93_22:                              // %.loopexit27.outer
                                        //   in Loop: Header=BB93_44 Depth=2
	mov	r0, 48
	je	t2, r0, .LBB93_43
	jmp	.LBB93_55
.LBB93_23:                              // %.loopexit27.preheader
                                        //   in Loop: Header=BB93_16 Depth=5
.LBB93_24:                              // %.loopexit27
                                        //   Parent Loop BB93_1 Depth=1
                                        //     Parent Loop BB93_44 Depth=2
                                        //       Parent Loop BB93_40 Depth=3
                                        //         Parent Loop BB93_36 Depth=4
                                        //           Parent Loop BB93_16 Depth=5
                                        // =>          This Inner Loop Header: Depth=6
add	r4, 1
	mov	r1, 2
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	je	t2, x14, .LBB93_24
	jmp	.LBB93_25
.LBB93_25:                              // %.loopexit27
                                        //   in Loop: Header=BB93_16 Depth=5
	jg	t2, x13, .LBB93_28
	jmp	.LBB93_26
.LBB93_26:                              // %.loopexit27
                                        //   in Loop: Header=BB93_36 Depth=4
	je	t2, x2, .LBB93_34
	jmp	.LBB93_27
.LBB93_27:                              // %.loopexit27
                                        //   in Loop: Header=BB93_40 Depth=3
	je	t2, x3, .LBB93_38
	jmp	.LBB93_54
.LBB93_28:                              // %.loopexit27
                                        //   in Loop: Header=BB93_16 Depth=5
	je	t2, x1, .LBB93_46
	jmp	.LBB93_29
.LBB93_29:                              // %.loopexit27
                                        //   in Loop: Header=BB93_16 Depth=5
	mov	r0, 48
	je	t2, r0, .LBB93_42
	jmp	.LBB93_30
.LBB93_30:                              // %.loopexit27
                                        //   in Loop: Header=BB93_16 Depth=5
	jne	t2, x10, .LBB93_54
	jmp	.LBB93_31
.LBB93_31:                              // %.preheader.preheader.loopexit
                                        //   in Loop: Header=BB93_16 Depth=5
	mov	x11, 1
.LBB93_32:                              // %.preheader.preheader
                                        //   in Loop: Header=BB93_16 Depth=5
	mov	r3, r4
	jmp	.LBB93_8
.LBB93_33:                              // %.loopexit28.backedge.loopexit
                                        //   in Loop: Header=BB93_36 Depth=4
	mov	t5, 1
	mov	r7, 1
	jmp	.LBB93_36
.LBB93_34:                              // %.loopexit28.backedge.loopexit2
                                        //   in Loop: Header=BB93_36 Depth=4
	mov	t5, 1
	mov	r3, r4
	mov	x11, 1
	jmp	.LBB93_36
.LBB93_35:                              // %.loopexit28.backedge.loopexit7
                                        //   in Loop: Header=BB93_36 Depth=4
	mov	t5, 1
	mov	r3, r4
.LBB93_36:                              // %.loopexit28
                                        //   Parent Loop BB93_1 Depth=1
                                        //     Parent Loop BB93_44 Depth=2
                                        //       Parent Loop BB93_40 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB93_16 Depth 5
                                        //             Child Loop BB93_24 Depth 6
                                        //             Child Loop BB93_8 Depth 6
	jmp	.LBB93_16
.LBB93_37:                              // %.loopexit29.backedge.loopexit
                                        //   in Loop: Header=BB93_40 Depth=3
	mov	r6, 1
	mov	r7, 1
	jmp	.LBB93_40
.LBB93_38:                              // %.loopexit29.backedge.loopexit3
                                        //   in Loop: Header=BB93_40 Depth=3
	mov	r6, 1
	mov	r3, r4
	mov	x11, 1
	jmp	.LBB93_40
.LBB93_39:                              // %.loopexit29.backedge.loopexit8
                                        //   in Loop: Header=BB93_40 Depth=3
	mov	r6, 1
	mov	r3, r4
.LBB93_40:                              // %.loopexit29
                                        //   Parent Loop BB93_1 Depth=1
                                        //     Parent Loop BB93_44 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB93_36 Depth 4
                                        //           Child Loop BB93_16 Depth 5
                                        //             Child Loop BB93_24 Depth 6
                                        //             Child Loop BB93_8 Depth 6
	jmp	.LBB93_36
.LBB93_41:                              // %.preheader55.backedge.loopexit
                                        //   in Loop: Header=BB93_44 Depth=2
	mov	t4, 1
	mov	r2, t2
	mov	r7, 1
	jmp	.LBB93_44
.LBB93_42:                              // %.preheader55.backedge.loopexit4
                                        //   in Loop: Header=BB93_44 Depth=2
	mov	t4, 1
	mov	r3, r4
	mov	r2, t2
	mov	x11, 1
	jmp	.LBB93_44
.LBB93_43:                              // %.preheader55.backedge.loopexit9
                                        //   in Loop: Header=BB93_44 Depth=2
	mov	t4, 1
	mov	r3, r4
	mov	r2, t2
.LBB93_44:                              // %.preheader55
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB93_40 Depth 3
                                        //         Child Loop BB93_36 Depth 4
                                        //           Child Loop BB93_16 Depth 5
                                        //             Child Loop BB93_24 Depth 6
                                        //             Child Loop BB93_8 Depth 6
	jmp	.LBB93_40
.LBB93_45:                              // %.loopexit31.loopexit
                                        //   in Loop: Header=BB93_1 Depth=1
add	r3, -1
	mov	r7, 1
	jmp	.LBB93_48
.LBB93_46:                              // %.loopexit31.loopexit5
                                        //   in Loop: Header=BB93_1 Depth=1
add	r4, -1
	mov	x11, 1
	mov	r3, r4
	jmp	.LBB93_48
.LBB93_47:                              // %.loopexit31.loopexit10
                                        //   in Loop: Header=BB93_1 Depth=1
.LBB93_48:                              // %.loopexit31
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	r1, r0
add	r1, 4
	mov	[rsp+8], r1
	mov	r0, [r0]
	mov	r4, r0
	jg	r0, x4, .LBB93_50
	jmp	.LBB93_49
.LBB93_49:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r4, 0
	sub	r4, r0
.LBB93_50:                              //   in Loop: Header=BB93_1 Depth=1
	mov	t1, 1
	mov	r1, 0
	jl	r0, r1, .LBB93_52
	jmp	.LBB93_51
.LBB93_51:                              //   in Loop: Header=BB93_1 Depth=1
	mov	t1, r7
.LBB93_52:                              //   in Loop: Header=BB93_1 Depth=1
add	r3, 2
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	mov	r7, t1
	jmp	.LBB93_59
.LBB93_53:                              // %.loopexit.loopexit
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r7, 1
	jmp	.LBB93_56
.LBB93_54:                              // %.loopexit.loopexit1
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x11, 1
	mov	r3, r4
	jmp	.LBB93_56
.LBB93_55:                              // %.loopexit.loopexit6
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r3, r4
.LBB93_56:                              // %.loopexit
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, t2
add	r0, -48
	call	__bit_and
	mov	r1, -2147483648
	mov	r4, 0
	mov	r0, rax
	call	__bit_xor
	mov	r0, -2147483639
	jg	rax, r0, .LBB93_59
	jmp	.LBB93_57
.LBB93_57:                              // %.preheader53.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
.LBB93_58:                              // %.preheader53
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	t2, -48
	mov	r1, 255
	mul	r4, 10
	mov	r0, t2
	call	__bit_and
add	r3, 1
	mov	r1, 2
	add	r4, rax
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	mov	r0, t2
add	r0, -48
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jl	rax, x9, .LBB93_58
	jmp	.LBB93_59
.LBB93_59:                              // %.loopexit54
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, t2
	call	__bit_and
	mov	r5, -1
	jne	rax, x6, .LBB93_65
	jmp	.LBB93_60
.LBB93_60:                              //   in Loop: Header=BB93_1 Depth=1
	mov	t1, r3
add	t1, 1
	mov	r1, 2
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	jne	t2, x1, .LBB93_62
	jmp	.LBB93_61
.LBB93_61:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	r1, r0
add	r1, 4
	mov	[rsp+8], r1
	mov	r5, [r0]
	mov	r1, -2147483648
add	r3, 2
	mov	r0, r5
	call	__bit_xor
	mov	r1, 2147483647
	mov	r0, rax
	call	__bit_xor
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
add	r5, 1
	mov	r0, rax
	mov	r1, r5
	call	__bit_and
	mov	r5, rax
	mov	r1, 2
add	r5, -1
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	jmp	.LBB93_65
.LBB93_62:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, t2
add	r0, -48
	call	__bit_and
	mov	r1, -2147483648
	mov	r5, 0
	mov	r0, rax
	call	__bit_xor
	mov	r3, t1
	mov	r0, -2147483639
	jg	rax, r0, .LBB93_65
	jmp	.LBB93_63
.LBB93_63:                              // %.preheader51.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r3, t1
.LBB93_64:                              // %.preheader51
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	t2, -48
	mov	r1, 255
	mul	r5, 10
	mov	r0, t2
	call	__bit_and
add	r3, 1
	mov	r1, 2
	add	r5, rax
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	mov	r0, t2
add	r0, -48
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jl	rax, x9, .LBB93_64
	jmp	.LBB93_65
.LBB93_65:                              // %.loopexit52
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, t2
add	r0, -104
	mov	r1, 254
	call	__bit_and
	mov	r1, 7
	mov	t1, rax
	call	__bit_shl
	mov	t3, rax
	mov	r1, 1
	mov	x8, 1
	mov	r0, t1
	call	__bit_shr
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t3, 5
	mov	x5, 0
	jg	rax, t3, .LBB93_68
	jmp	.LBB93_66
.LBB93_66:                              // %.loopexit52
                                        //   in Loop: Header=BB93_1 Depth=1
	jz	rax, .LBB93_70
	jmp	.LBB93_67
.LBB93_67:                              // %.loopexit52
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	t1, r3
	je	rax, t6, .LBB93_71
	jmp	.LBB93_74
.LBB93_68:                              // %.loopexit52
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 6
	je	rax, r0, .LBB93_72
	jmp	.LBB93_69
.LBB93_69:                              // %.loopexit52
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	t1, r3
	mov	r0, 9
	je	rax, r0, .LBB93_73
	jmp	.LBB93_74
.LBB93_70:                              //   in Loop: Header=BB93_1 Depth=1
	mov	t1, r3
add	t1, 1
	mov	r1, 2
	mov	x8, 2
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	mov	t3, 1
	mov	x5, 2
	mov	r0, 104
	je	t2, r0, .LBB93_73
	jmp	.LBB93_74
.LBB93_71:                              //   in Loop: Header=BB93_1 Depth=1
	mov	t1, r3
add	t1, 1
	mov	r1, 2
	mov	x8, 2
	mov	r0, t1
	call	__bit_shr
	mov	t2, rax
	mov	r1, 3
	mov	x5, 3
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	mov	t3, 4
	mov	r0, 108
	je	t2, r0, .LBB93_73
	jmp	.LBB93_74
.LBB93_72:                              //   in Loop: Header=BB93_1 Depth=1
	mov	t3, 6
.LBB93_73:                              //   in Loop: Header=BB93_1 Depth=1
	add	r3, x8
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	mov	t1, r3
	mov	x5, t3
.LBB93_74:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, t2
	call	__bit_and
	jz	rax, .LBB93_273
	jmp	.LBB93_75
.LBB93_75:                              //   in Loop: Header=BB93_1 Depth=1
add	t1, 1
	mov	r0, t2
	call	__bit_and
	jg	rax, x12, .LBB93_82
	jmp	.LBB93_76
.LBB93_76:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 98
	jg	rax, r0, .LBB93_79
	jmp	.LBB93_77
.LBB93_77:                              //   in Loop: Header=BB93_1 Depth=1
	je	rax, x0, .LBB93_238
	jmp	.LBB93_78
.LBB93_78:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 88
	je	rax, r0, .LBB93_121
	jmp	.LBB93_263
.LBB93_79:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 99
	je	rax, r0, .LBB93_151
	jmp	.LBB93_80
.LBB93_80:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 100
	je	rax, r0, .LBB93_89
	jmp	.LBB93_81
.LBB93_81:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 105
	je	rax, r0, .LBB93_89
	jmp	.LBB93_263
.LBB93_82:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 114
	jg	rax, r0, .LBB93_86
	jmp	.LBB93_83
.LBB93_83:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 110
	je	rax, r0, .LBB93_224
	jmp	.LBB93_84
.LBB93_84:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 111
	je	rax, r0, .LBB93_136
	jmp	.LBB93_85
.LBB93_85:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 112
	je	rax, r0, .LBB93_223
	jmp	.LBB93_263
.LBB93_86:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 115
	je	rax, r0, .LBB93_179
	jmp	.LBB93_87
.LBB93_87:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 117
	je	rax, r0, .LBB93_106
	jmp	.LBB93_88
.LBB93_88:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 120
	je	rax, r0, .LBB93_121
	jmp	.LBB93_263
.LBB93_89:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	[rsp+9], r0
	jg	x5, t7, .LBB93_93
	jmp	.LBB93_90
.LBB93_90:                              //   in Loop: Header=BB93_1 Depth=1
	je	x5, x7, .LBB93_96
	jmp	.LBB93_91
.LBB93_91:                              //   in Loop: Header=BB93_1 Depth=1
	je	x5, t6, .LBB93_97
	jmp	.LBB93_92
.LBB93_92:                              //   in Loop: Header=BB93_1 Depth=1
	je	x5, t7, .LBB93_98
	jmp	.LBB93_102
.LBB93_93:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 4
	je	x5, r0, .LBB93_99
	jmp	.LBB93_94
.LBB93_94:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 5
	je	x5, r0, .LBB93_100
	jmp	.LBB93_95
.LBB93_95:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 6
	je	x5, r0, .LBB93_101
	jmp	.LBB93_102
.LBB93_96:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 128
	mov	r0, rax
	call	__bit_xor
	mov	r2, rax
add	r2, -128
	mov	r1, 31
	mov	r0, r2
	call	__bit_sar
	jmp	.LBB93_103
.LBB93_97:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r0, [r0]
	mov	r1, 65535
	call	__bit_and
	mov	r1, 32768
	mov	r0, rax
	call	__bit_xor
	mov	r2, rax
add	r2, -32768
	mov	r1, 31
	mov	r0, r2
	call	__bit_sar
	jmp	.LBB93_103
.LBB93_98:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r2, [r0]
	mov	r1, 31
	mov	r0, r2
	call	__bit_sar
	jmp	.LBB93_103
.LBB93_99:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r2, [r0]
add	r0, 8
	mov	[rsp+9], r0
	mov	rax, [r1]
	jmp	.LBB93_103
.LBB93_100:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r2, [r0]
	mov	r1, 31
	mov	r0, r2
	call	__bit_sar
	jmp	.LBB93_103
.LBB93_101:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r2, [r0]
	mov	r1, 31
	mov	r0, r2
	call	__bit_sar
	jmp	.LBB93_103
.LBB93_102:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r2, [r0]
	mov	r1, 31
	mov	r0, r2
	call	__bit_sar
.LBB93_103:                             //   in Loop: Header=BB93_1 Depth=1
	jg	rax, x4, .LBB93_105
	jmp	.LBB93_104
.LBB93_104:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 0
	mov	r1, 0
	mov	r3, rax
	call	__subdi3
	mov	r2, t0
	mov	r0, rsp
	mov	r1, rsp
	mov	r3, rsp
	mov	r6, rsp
add	r0, 16
	mov	[r0], r5
add	r1, 12
	mov	[r1], r4
add	r3, 8
	mov	[r3], t4
add	r6, 4
	mov	[r6], t5
	mov	r3, 1
	mov	r4, 10
	mov	r5, 0
	mov	r6, 0
	mov	[rsp], x11
	mov	r0, rsp
	mov	r1, rax
	call	format_integer
	jmp	.LBB93_1
.LBB93_105:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
	mov	r1, rsp
	mov	r3, rsp
	mov	r6, rsp
add	r0, 16
	mov	[r0], r5
add	r1, 12
	mov	[r1], r4
add	r3, 8
	mov	[r3], t4
add	r6, 4
	mov	[r6], t5
	mov	r3, 0
	mov	r4, 10
	mov	r5, 0
	mov	r6, 0
	mov	[rsp], x11
	mov	r0, rsp
	mov	r1, r2
	mov	r2, rax
	call	format_integer
	jmp	.LBB93_1
.LBB93_106:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	[rsp+9], r0
	jg	x5, t7, .LBB93_110
	jmp	.LBB93_107
.LBB93_107:                             //   in Loop: Header=BB93_1 Depth=1
	je	x5, x7, .LBB93_113
	jmp	.LBB93_108
.LBB93_108:                             //   in Loop: Header=BB93_1 Depth=1
	je	x5, t6, .LBB93_114
	jmp	.LBB93_109
.LBB93_109:                             //   in Loop: Header=BB93_1 Depth=1
	je	x5, t7, .LBB93_115
	jmp	.LBB93_119
.LBB93_110:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 4
	je	x5, r0, .LBB93_116
	jmp	.LBB93_111
.LBB93_111:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 5
	je	x5, r0, .LBB93_117
	jmp	.LBB93_112
.LBB93_112:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 6
	je	x5, r0, .LBB93_118
	jmp	.LBB93_119
.LBB93_113:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, rax
	mov	r2, 0
	jmp	.LBB93_120
.LBB93_114:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r0, [r0]
	mov	r1, 65535
	call	__bit_and
	mov	r1, rax
	mov	r2, 0
	jmp	.LBB93_120
.LBB93_115:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r1, [r0]
	mov	r2, 0
	jmp	.LBB93_120
.LBB93_116:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r2, r0
add	r2, 4
	mov	[rsp+9], r2
	mov	r1, [r0]
add	r0, 8
	mov	[rsp+9], r0
	mov	r2, [r2]
	jmp	.LBB93_120
.LBB93_117:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r1, [r0]
	mov	r2, 0
	jmp	.LBB93_120
.LBB93_118:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r0, [r0]
	mov	r1, 31
	call	__bit_sar
	mov	r1, r0
	mov	r2, rax
	jmp	.LBB93_120
.LBB93_119:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r1, [r0]
	mov	r2, 0
.LBB93_120:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
	mov	r3, rsp
	mov	r6, rsp
	mov	t0, rsp
add	r0, 16
	mov	[r0], r5
add	r3, 12
	mov	[r3], r4
add	r6, 8
	mov	[r6], t4
add	t0, 4
	mov	[t0], 0
	mov	r3, 0
	mov	r4, 10
	mov	r5, 0
	mov	r6, 0
	mov	[rsp], 0
	mov	r0, rsp
	call	format_integer
	jmp	.LBB93_1
.LBB93_121:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	[rsp+9], r0
	jg	x5, t7, .LBB93_125
	jmp	.LBB93_122
.LBB93_122:                             //   in Loop: Header=BB93_1 Depth=1
	je	x5, x7, .LBB93_128
	jmp	.LBB93_123
.LBB93_123:                             //   in Loop: Header=BB93_1 Depth=1
	je	x5, t6, .LBB93_129
	jmp	.LBB93_124
.LBB93_124:                             //   in Loop: Header=BB93_1 Depth=1
	je	x5, t7, .LBB93_130
	jmp	.LBB93_134
.LBB93_125:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 4
	je	x5, r0, .LBB93_131
	jmp	.LBB93_126
.LBB93_126:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 5
	je	x5, r0, .LBB93_132
	jmp	.LBB93_127
.LBB93_127:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 6
	je	x5, r0, .LBB93_133
	jmp	.LBB93_134
.LBB93_128:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	t3, rax
	mov	r2, 0
	jmp	.LBB93_135
.LBB93_129:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r0, [r0]
	mov	r1, 65535
	call	__bit_and
	mov	t3, rax
	mov	r2, 0
	jmp	.LBB93_135
.LBB93_130:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	t3, [r0]
	mov	r2, 0
	jmp	.LBB93_135
.LBB93_131:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	t3, [r0]
add	r0, 8
	mov	[rsp+9], r0
	mov	r2, [r1]
	jmp	.LBB93_135
.LBB93_132:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	t3, [r0]
	mov	r2, 0
	jmp	.LBB93_135
.LBB93_133:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	t3, [r0]
	mov	r1, 31
	mov	r0, t3
	call	__bit_sar
	mov	r2, rax
	jmp	.LBB93_135
.LBB93_134:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	t3, [r0]
	mov	r2, 0
.LBB93_135:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, t2
	call	__bit_and
	mov	r1, 88
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_and
	mov	r0, rsp
	mov	r1, rsp
	mov	r3, rsp
	mov	t0, rsp
add	r0, 16
	mov	[r0], r5
add	r1, 12
	mov	[r1], r4
add	r3, 8
	mov	[r3], t4
add	t0, 4
	mov	[t0], 0
	mov	r3, 0
	mov	r4, 16
	mov	[rsp], 0
	mov	r0, rsp
	mov	r1, t3
	mov	r5, rax
	call	format_integer
	jmp	.LBB93_1
.LBB93_136:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	[rsp+9], r0
	jg	x5, t7, .LBB93_140
	jmp	.LBB93_137
.LBB93_137:                             //   in Loop: Header=BB93_1 Depth=1
	je	x5, x7, .LBB93_143
	jmp	.LBB93_138
.LBB93_138:                             //   in Loop: Header=BB93_1 Depth=1
	je	x5, t6, .LBB93_144
	jmp	.LBB93_139
.LBB93_139:                             //   in Loop: Header=BB93_1 Depth=1
	je	x5, t7, .LBB93_145
	jmp	.LBB93_149
.LBB93_140:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 4
	je	x5, r0, .LBB93_146
	jmp	.LBB93_141
.LBB93_141:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 5
	je	x5, r0, .LBB93_147
	jmp	.LBB93_142
.LBB93_142:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 6
	je	x5, r0, .LBB93_148
	jmp	.LBB93_149
.LBB93_143:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, rax
	mov	r2, 0
	jmp	.LBB93_150
.LBB93_144:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r0, [r0]
	mov	r1, 65535
	call	__bit_and
	mov	r1, rax
	mov	r2, 0
	jmp	.LBB93_150
.LBB93_145:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r1, [r0]
	mov	r2, 0
	jmp	.LBB93_150
.LBB93_146:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r2, r0
add	r2, 4
	mov	[rsp+9], r2
	mov	r1, [r0]
add	r0, 8
	mov	[rsp+9], r0
	mov	r2, [r2]
	jmp	.LBB93_150
.LBB93_147:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r1, [r0]
	mov	r2, 0
	jmp	.LBB93_150
.LBB93_148:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r0, [r0]
	mov	r1, 31
	call	__bit_sar
	mov	r1, r0
	mov	r2, rax
	jmp	.LBB93_150
.LBB93_149:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+9]
	mov	r1, r0
add	r1, 4
	mov	[rsp+9], r1
	mov	r1, [r0]
	mov	r2, 0
.LBB93_150:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
	mov	r3, rsp
	mov	t0, rsp
	mov	t2, rsp
add	r0, 16
	mov	[r0], r5
add	r3, 12
	mov	[r3], r4
add	t0, 8
	mov	[t0], t4
add	t2, 4
	mov	[t2], 0
	mov	r3, 0
	mov	r4, 8
	mov	r5, 0
	mov	[rsp], 0
	mov	r0, rsp
	call	format_integer
	jmp	.LBB93_1
.LBB93_151:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	r1, r0
add	r1, 4
	mov	[rsp+8], r1
	mov	r2, [r0]
	mov	r6, r4
add	r6, -1
	jnz	r7, .LBB93_166
	jmp	.LBB93_152
.LBB93_152:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, -2147483648
	mov	r0, r4
	call	__bit_xor
	mov	r0, -2147483647
	sub	r0, rax
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r6
	call	__bit_and
	mov	r0, rsp
	mov	r1, rsp
add	r0, 4
add	r1, 8
	mov	r6, [r1]
	mov	r4, [r0]
	mov	r5, rax
	mov	r3, r6
	jz	r5, .LBB93_162
	jmp	.LBB93_153
.LBB93_153:                             //   in Loop: Header=BB93_1 Depth=1
	jz	r4, .LBB93_158
	jmp	.LBB93_154
.LBB93_154:                             //   in Loop: Header=BB93_1 Depth=1
	mov	t3, [rsp+5]
	mov	r3, r6
	mov	r1, -2147483648
add	r3, 1
	mov	r0, r4
	call	__bit_xor
	mov	r7, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r7, .LBB93_156
	jmp	.LBB93_155
.LBB93_155:                             //   in Loop: Header=BB93_1 Depth=1
	add	r6, t3
	mov	r1, 3
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r6, rax
	mov	t2, [r6]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	mov	t2, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
.LBB93_156:                             //   in Loop: Header=BB93_1 Depth=1
	je	r5, x7, .LBB93_162
	jmp	.LBB93_157
.LBB93_157:                             // %.preheader41.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r6, r3
	jmp	.LBB93_159
.LBB93_158:                             //   in Loop: Header=BB93_1 Depth=1
add	r5, 1
	add	r6, r5
	jmp	.LBB93_165
.LBB93_159:                             // %.preheader41
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, -2147483648
add	r3, 1
	mov	r0, r4
	call	__bit_xor
	mov	r7, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r7, .LBB93_161
	jmp	.LBB93_160
.LBB93_160:                             //   in Loop: Header=BB93_159 Depth=2
	add	r6, t3
	mov	r1, 3
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r6, rax
	mov	t2, [r6]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	mov	t2, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
.LBB93_161:                             //   in Loop: Header=BB93_159 Depth=2
add	r5, -1
	mov	r6, r3
	jg	r5, x7, .LBB93_159
	jmp	.LBB93_162
.LBB93_162:                             // %.loopexit42
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r6, r3
add	r6, 1
	jz	r4, .LBB93_165
	jmp	.LBB93_163
.LBB93_163:                             // %.loopexit42
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r1, -2147483648
	mov	r0, r4
	call	__bit_xor
	mov	r4, rax
	mov	r0, r6
	call	__bit_xor
	jge	rax, r4, .LBB93_165
	jmp	.LBB93_164
.LBB93_164:                             //   in Loop: Header=BB93_1 Depth=1
	add	r3, [rsp+5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r1, 255
	mov	r4, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, 255
	mov	r2, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r5, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
.LBB93_165:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 8
	mov	[r0], r6
	jmp	.LBB93_1
.LBB93_166:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
	mov	r1, rsp
add	r0, 4
add	r1, 8
	mov	r3, [r1]
	mov	r5, [r0]
	mov	r7, r3
add	r7, 1
	jz	r5, .LBB93_169
	jmp	.LBB93_167
.LBB93_167:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, -2147483648
	mov	r0, r5
	call	__bit_xor
	mov	t2, rax
	mov	r0, r7
	call	__bit_xor
	jge	rax, t2, .LBB93_169
	jmp	.LBB93_168
.LBB93_168:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, r3
	add	r0, [rsp+5]
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	t3, rax
	mov	t4, [t3]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r1, 255
	mov	t2, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, 255
	mov	r2, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t4, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t4
	mov	r1, rax
	call	__bit_or
	mov	[t3], rax
.LBB93_169:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 8
	mov	r1, -2147483648
	mov	[r0], r7
	mov	r0, r4
	call	__bit_xor
	mov	r0, -2147483647
	sub	r0, rax
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r6
	call	__bit_and
	mov	r2, rax
	jz	r2, .LBB93_1
	jmp	.LBB93_170
.LBB93_170:                             //   in Loop: Header=BB93_1 Depth=1
	jz	r5, .LBB93_175
	jmp	.LBB93_171
.LBB93_171:                             //   in Loop: Header=BB93_1 Depth=1
	mov	t2, [rsp+5]
	mov	r1, -2147483648
add	r3, 2
	mov	r0, r5
	call	__bit_xor
	mov	r4, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r4, .LBB93_173
	jmp	.LBB93_172
.LBB93_172:                             //   in Loop: Header=BB93_1 Depth=1
	add	r7, t2
	mov	r1, 3
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	mov	r7, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
.LBB93_173:                             //   in Loop: Header=BB93_1 Depth=1
	je	r2, x7, .LBB93_271
	jmp	.LBB93_174
.LBB93_174:                             // %.preheader43.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r4, r3
	jmp	.LBB93_176
.LBB93_175:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r2, 1
	add	r3, r2
add	r0, 8
	mov	[r0], r3
	jmp	.LBB93_1
.LBB93_176:                             // %.preheader43
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, -2147483648
add	r3, 1
	mov	r0, r5
	call	__bit_xor
	mov	r6, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r6, .LBB93_178
	jmp	.LBB93_177
.LBB93_177:                             //   in Loop: Header=BB93_176 Depth=2
	add	r4, t2
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r4, rax
	mov	r7, [r4]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	mov	r7, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r4], rax
.LBB93_178:                             //   in Loop: Header=BB93_176 Depth=2
add	r2, -1
	mov	r4, r3
	jg	r2, x7, .LBB93_176
	jmp	.LBB93_271
.LBB93_179:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	r1, r0
add	r1, 4
	mov	[rsp+8], r1
	mov	r3, [r0]
	mov	r0, r3
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, mcasm_static_598e24c02d9f3705d04dcdf782aa5836
	sub	r1, r3
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	add	r2, r3
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r6, r2
	jz	rax, .LBB93_184
	jmp	.LBB93_180
.LBB93_180:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, r2
	jz	rax, .LBB93_188
	jmp	.LBB93_181
.LBB93_181:                             // %.preheader1.i.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r6, r2
add	r6, 1
	mov	r3, r2
	jmp	.LBB93_183
.LBB93_182:                             //   in Loop: Header=BB93_183 Depth=2
	mov	r1, 2
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r6, 1
	jz	rax, .LBB93_188
	jmp	.LBB93_183
.LBB93_183:                             // %.preheader1.i
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	r3, 1
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	jnz	rax, .LBB93_182
	jmp	.LBB93_184
.LBB93_184:                             // %.loopexit.i.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	t2, r6
add	t2, -4
add	r6, -1
.LBB93_185:                             // %.loopexit.i
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	t2, 4
	mov	r1, [t2]
	mov	r0, 16843008
	sub	r0, r1
	mov	r3, r6
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r6, 4
	je	rax, x15, .LBB93_185
	jmp	.LBB93_186
.LBB93_186:                             // %.preheader.i.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	t3, 0
.LBB93_187:                             // %.preheader.i
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, t2
	add	r0, t3
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r3, 1
add	t3, 1
	jnz	rax, .LBB93_187
	jmp	.LBB93_188
.LBB93_188:                             // %strlen.exit
                                        //   in Loop: Header=BB93_1 Depth=1
	sub	r3, r2
	mov	r6, r5
	sub	r6, r3
	mov	r1, 31
	mov	r0, r6
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r6
	call	__bit_and
	mov	r0, 0
	jl	r5, r0, .LBB93_190
	jmp	.LBB93_189
.LBB93_189:                             //   in Loop: Header=BB93_1 Depth=1
	add	r3, rax
.LBB93_190:                             //   in Loop: Header=BB93_1 Depth=1
	jnz	r7, .LBB93_202
	jmp	.LBB93_191
.LBB93_191:                             //   in Loop: Header=BB93_1 Depth=1
	jle	r4, r3, .LBB93_202
	jmp	.LBB93_192
.LBB93_192:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
	mov	r1, rsp
add	r0, 4
	mov	r5, [r0]
add	r1, 8
	mov	t2, [r1]
	mov	t5, r4
	sub	t5, r3
	jz	r5, .LBB93_197
	jmp	.LBB93_193
.LBB93_193:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x11, [rsp+5]
	mov	r6, t2
	mov	r1, -2147483648
add	r6, 1
	mov	r0, r5
	call	__bit_xor
	mov	t3, rax
	mov	r0, r6
	call	__bit_xor
	jge	rax, t3, .LBB93_195
	jmp	.LBB93_194
.LBB93_194:                             //   in Loop: Header=BB93_1 Depth=1
	add	t2, x11
	mov	r1, 3
	mov	r0, t2
	call	__bit_and
	mov	r1, -4
	mov	t3, rax
	call	__bit_and
	mov	t2, rax
	mov	t4, [t2]
	mov	r1, 3
	mov	r0, t3
	call	__bit_shl
	mov	r0, 255
	mov	t3, rax
	mov	r1, t3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t4
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	mov	t4, rax
	mov	r1, t3
	call	__bit_shl
	mov	r0, t4
	mov	r1, rax
	call	__bit_or
	mov	[t2], rax
.LBB93_195:                             //   in Loop: Header=BB93_1 Depth=1
	jl	t5, t6, .LBB93_201
	jmp	.LBB93_196
.LBB93_196:                             // %.preheader49.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
add	t5, 1
	mov	t2, r6
	jmp	.LBB93_198
.LBB93_197:                             //   in Loop: Header=BB93_1 Depth=1
	add	t2, t5
	mov	r6, t2
	jmp	.LBB93_201
.LBB93_198:                             // %.preheader49
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, -2147483648
add	r6, 1
	mov	r0, r5
	call	__bit_xor
	mov	t3, rax
	mov	r0, r6
	call	__bit_xor
	jge	rax, t3, .LBB93_200
	jmp	.LBB93_199
.LBB93_199:                             //   in Loop: Header=BB93_198 Depth=2
	add	t2, x11
	mov	r1, 3
	mov	r0, t2
	call	__bit_and
	mov	r1, -4
	mov	t3, rax
	call	__bit_and
	mov	t2, rax
	mov	t4, [t2]
	mov	r1, 3
	mov	r0, t3
	call	__bit_shl
	mov	r0, 255
	mov	t3, rax
	mov	r1, t3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t4
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	mov	t4, rax
	mov	r1, t3
	call	__bit_shl
	mov	r0, t4
	mov	r1, rax
	call	__bit_or
	mov	[t2], rax
.LBB93_200:                             //   in Loop: Header=BB93_198 Depth=2
add	t5, -1
	mov	t2, r6
	jg	t5, t6, .LBB93_198
	jmp	.LBB93_201
.LBB93_201:                             // %.loopexit50
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 8
	mov	[r0], r6
.LBB93_202:                             //   in Loop: Header=BB93_1 Depth=1
	jz	r3, .LBB93_212
	jmp	.LBB93_203
.LBB93_203:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, rsp
	mov	r0, rsp
add	r1, 4
	mov	r5, [r1]
add	r0, 8
	mov	t2, [r0]
	jz	r5, .LBB93_208
	jmp	.LBB93_204
.LBB93_204:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x11, [rsp+5]
	mov	r6, t2
	mov	r1, -2147483648
add	r6, 1
	mov	r0, r5
	call	__bit_xor
	mov	t3, rax
	mov	r0, r6
	call	__bit_xor
	jge	rax, t3, .LBB93_206
	jmp	.LBB93_205
.LBB93_205:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	add	t2, x11
	mov	r1, 3
	mov	t3, rax
	mov	r0, t2
	call	__bit_and
	mov	r1, -4
	mov	t4, rax
	call	__bit_and
	mov	t2, rax
	mov	t5, [t2]
	mov	r1, 3
	mov	r0, t4
	call	__bit_shl
	mov	r0, 255
	mov	t4, rax
	mov	r1, t4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t5, rax
	mov	r0, t3
	call	__bit_and
	mov	r0, rax
	mov	r1, t4
	call	__bit_shl
	mov	r0, t5
	mov	r1, rax
	call	__bit_or
	mov	[t2], rax
.LBB93_206:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 8
	mov	[r0], r6
	je	r3, x7, .LBB93_212
	jmp	.LBB93_207
.LBB93_207:                             // %.preheader47.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
add	r2, 1
	mov	x8, r3
add	x8, -1
	mov	t2, r6
	jmp	.LBB93_209
.LBB93_208:                             //   in Loop: Header=BB93_1 Depth=1
	add	t2, r3
	mov	[r0], t2
	jmp	.LBB93_212
.LBB93_209:                             // %.preheader47
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, -2147483648
add	t2, 1
	mov	r0, r5
	call	__bit_xor
	mov	t3, rax
	mov	r0, t2
	call	__bit_xor
	jge	rax, t3, .LBB93_211
	jmp	.LBB93_210
.LBB93_210:                             //   in Loop: Header=BB93_209 Depth=2
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	add	r6, x11
	mov	r1, 3
	mov	t3, rax
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	t4, rax
	call	__bit_and
	mov	r6, rax
	mov	t5, [r6]
	mov	r1, 3
	mov	r0, t4
	call	__bit_shl
	mov	r0, 255
	mov	t4, rax
	mov	r1, t4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t5, rax
	mov	r0, t3
	call	__bit_and
	mov	r0, rax
	mov	r1, t4
	call	__bit_shl
	mov	r0, t5
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
.LBB93_211:                             //   in Loop: Header=BB93_209 Depth=2
	mov	r0, rsp
add	r0, 8
	mov	[r0], t2
add	x8, -1
add	r2, 1
	mov	r6, t2
	jnz	x8, .LBB93_209
	jmp	.LBB93_212
.LBB93_212:                             // %.loopexit48
                                        //   in Loop: Header=BB93_1 Depth=1
	jz	r7, .LBB93_1
	jmp	.LBB93_213
.LBB93_213:                             // %.loopexit48
                                        //   in Loop: Header=BB93_1 Depth=1
	jle	r4, r3, .LBB93_1
	jmp	.LBB93_214
.LBB93_214:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, rsp
	mov	r0, rsp
add	r1, 4
	mov	r2, [r1]
add	r0, 8
	mov	r5, [r0]
	sub	r4, r3
	jz	r2, .LBB93_219
	jmp	.LBB93_215
.LBB93_215:                             //   in Loop: Header=BB93_1 Depth=1
	mov	t2, [rsp+5]
	mov	r3, r5
	mov	r1, -2147483648
add	r3, 1
	mov	r0, r2
	call	__bit_xor
	mov	r6, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r6, .LBB93_217
	jmp	.LBB93_216
.LBB93_216:                             //   in Loop: Header=BB93_1 Depth=1
	add	r5, t2
	mov	r1, 3
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r5, rax
	mov	r7, [r5]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	mov	r7, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
.LBB93_217:                             //   in Loop: Header=BB93_1 Depth=1
	jl	r4, t6, .LBB93_272
	jmp	.LBB93_218
.LBB93_218:                             // %.preheader45.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
add	r4, 1
	mov	r5, r3
	jmp	.LBB93_220
.LBB93_219:                             //   in Loop: Header=BB93_1 Depth=1
	add	r5, r4
	mov	[r0], r5
	jmp	.LBB93_1
.LBB93_220:                             // %.preheader45
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, -2147483648
add	r3, 1
	mov	r0, r2
	call	__bit_xor
	mov	r6, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r6, .LBB93_222
	jmp	.LBB93_221
.LBB93_221:                             //   in Loop: Header=BB93_220 Depth=2
	add	r5, t2
	mov	r1, 3
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r5, rax
	mov	r7, [r5]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	mov	r7, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
.LBB93_222:                             //   in Loop: Header=BB93_220 Depth=2
add	r4, -1
	mov	r5, r3
	jg	r4, t6, .LBB93_220
	jmp	.LBB93_272
.LBB93_223:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	r1, r0
add	r1, 4
	mov	[rsp+8], r1
	mov	r1, [r0]
	mov	r0, rsp
	mov	r2, rsp
	mov	r3, rsp
	mov	r6, rsp
add	r0, 16
	mov	[r0], r5
add	r2, 12
	mov	[r2], r4
add	r3, 8
	mov	[r3], t4
add	r6, 4
	mov	[r6], 0
	mov	r2, 0
	mov	r3, 0
	mov	r4, 16
	mov	r5, 0
	mov	r6, 1
	mov	[rsp], 0
	mov	r0, rsp
	call	format_integer
	jmp	.LBB93_1
.LBB93_224:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 8
	mov	r2, [r0]
	jg	x5, t7, .LBB93_228
	jmp	.LBB93_225
.LBB93_225:                             //   in Loop: Header=BB93_1 Depth=1
	je	x5, x7, .LBB93_231
	jmp	.LBB93_226
.LBB93_226:                             //   in Loop: Header=BB93_1 Depth=1
	je	x5, t6, .LBB93_232
	jmp	.LBB93_227
.LBB93_227:                             //   in Loop: Header=BB93_1 Depth=1
	je	x5, t7, .LBB93_233
	jmp	.LBB93_237
.LBB93_228:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 4
	je	x5, r0, .LBB93_234
	jmp	.LBB93_229
.LBB93_229:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 5
	je	x5, r0, .LBB93_235
	jmp	.LBB93_230
.LBB93_230:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 6
	je	x5, r0, .LBB93_236
	jmp	.LBB93_237
.LBB93_231:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	r1, r0
add	r1, 4
	mov	[rsp+8], r1
	mov	r0, [r0]
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r4, rax
	mov	r5, [r4]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r1, 255
	mov	r3, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, 255
	mov	r2, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r5, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r4], rax
	jmp	.LBB93_1
.LBB93_232:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	r1, r0
add	r1, 4
	mov	[rsp+8], r1
	mov	r0, [r0]
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r4, rax
	mov	r5, [r4]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r1, 65535
	mov	r3, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, 65535
	mov	r2, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r1, 65535
	mov	r5, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r4], rax
	jmp	.LBB93_1
.LBB93_233:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	r1, r0
add	r1, 4
	mov	[rsp+8], r1
	mov	r0, [r0]
	mov	[r0], r2
	jmp	.LBB93_1
.LBB93_234:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	r1, r0
add	r1, 4
	mov	[rsp+8], r1
	mov	r0, [r0]
	mov	[r0], r2
add	r0, 4
	mov	[r0], 0
	jmp	.LBB93_1
.LBB93_235:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	r1, r0
add	r1, 4
	mov	[rsp+8], r1
	mov	r0, [r0]
	mov	[r0], r2
	jmp	.LBB93_1
.LBB93_236:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	r1, r0
add	r1, 4
	mov	[rsp+8], r1
	mov	r0, [r0]
	mov	[r0], r2
	jmp	.LBB93_1
.LBB93_237:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+8]
	mov	r1, r0
add	r1, 4
	mov	[rsp+8], r1
	mov	r0, [r0]
	mov	[r0], r2
	jmp	.LBB93_1
.LBB93_238:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
	mov	r1, rsp
add	r0, 4
add	r1, 8
	mov	r6, [r1]
	mov	r5, [r0]
	mov	r3, r6
	jnz	r7, .LBB93_249
	jmp	.LBB93_239
.LBB93_239:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r3, r6
	jl	r4, t6, .LBB93_249
	jmp	.LBB93_240
.LBB93_240:                             //   in Loop: Header=BB93_1 Depth=1
	jz	r5, .LBB93_245
	jmp	.LBB93_241
.LBB93_241:                             //   in Loop: Header=BB93_1 Depth=1
	mov	t5, [rsp+5]
	mov	r3, r6
	mov	r1, -2147483648
add	r3, 1
	mov	r0, r5
	call	__bit_xor
	mov	t2, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, t2, .LBB93_243
	jmp	.LBB93_242
.LBB93_242:                             //   in Loop: Header=BB93_1 Depth=1
	add	r6, t5
	mov	r1, 3
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	r6, rax
	mov	t3, [r6]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r1, 255
	mov	t2, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, 255
	mov	t4, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, t4
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
.LBB93_243:                             //   in Loop: Header=BB93_1 Depth=1
	jl	r4, t7, .LBB93_249
	jmp	.LBB93_244
.LBB93_244:                             // %.preheader39.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x8, r4
add	x8, 1
	mov	r6, r3
	jmp	.LBB93_246
.LBB93_245:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
	add	r6, r4
add	r0, 8
	mov	[r0], r6
	jmp	.LBB93_1
.LBB93_246:                             // %.preheader39
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, -2147483648
add	r3, 1
	mov	r0, r5
	call	__bit_xor
	mov	t2, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, t2, .LBB93_248
	jmp	.LBB93_247
.LBB93_247:                             //   in Loop: Header=BB93_246 Depth=2
	add	r6, t5
	mov	r1, 3
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	r6, rax
	mov	t3, [r6]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r1, 255
	mov	t2, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, 255
	mov	t4, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, t4
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
.LBB93_248:                             //   in Loop: Header=BB93_246 Depth=2
add	x8, -1
	mov	r6, r3
	jg	x8, t7, .LBB93_246
	jmp	.LBB93_249
.LBB93_249:                             // %.loopexit40
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r2, r3
add	r2, 1
	jz	r5, .LBB93_252
	jmp	.LBB93_250
.LBB93_250:                             // %.loopexit40
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r1, -2147483648
	mov	r0, r5
	call	__bit_xor
	mov	r6, rax
	mov	r0, r2
	call	__bit_xor
	jge	rax, r6, .LBB93_252
	jmp	.LBB93_251
.LBB93_251:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, r3
	add	r0, [rsp+5]
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	t2, rax
	mov	t3, [t2]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r0, 37
	mov	t3, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[t2], rax
.LBB93_252:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 8
	mov	[r0], r2
	jz	r7, .LBB93_1
	jmp	.LBB93_253
.LBB93_253:                             //   in Loop: Header=BB93_1 Depth=1
	jl	r4, t6, .LBB93_1
	jmp	.LBB93_254
.LBB93_254:                             //   in Loop: Header=BB93_1 Depth=1
	jz	r5, .LBB93_259
	jmp	.LBB93_255
.LBB93_255:                             //   in Loop: Header=BB93_1 Depth=1
	mov	t2, [rsp+5]
	mov	r1, -2147483648
add	r3, 2
	mov	r0, r5
	call	__bit_xor
	mov	r6, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r6, .LBB93_257
	jmp	.LBB93_256
.LBB93_256:                             //   in Loop: Header=BB93_1 Depth=1
	add	r2, t2
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r2, rax
	mov	r7, [r2]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	mov	r7, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
.LBB93_257:                             //   in Loop: Header=BB93_1 Depth=1
	jl	r4, t7, .LBB93_270
	jmp	.LBB93_258
.LBB93_258:                             // %.preheader37.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
add	r4, 1
	mov	r2, r3
	jmp	.LBB93_260
.LBB93_259:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
	add	r3, r4
add	r0, 8
	mov	[r0], r3
	jmp	.LBB93_1
.LBB93_260:                             // %.preheader37
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, -2147483648
add	r3, 1
	mov	r0, r5
	call	__bit_xor
	mov	r6, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r6, .LBB93_262
	jmp	.LBB93_261
.LBB93_261:                             //   in Loop: Header=BB93_260 Depth=2
	add	r2, t2
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r2, rax
	mov	r7, [r2]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	mov	r7, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
.LBB93_262:                             //   in Loop: Header=BB93_260 Depth=2
add	r4, -1
	mov	r2, r3
	jg	r4, t7, .LBB93_260
	jmp	.LBB93_270
.LBB93_263:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
	mov	r1, rsp
add	r0, 4
	mov	r4, [r0]
add	r1, 8
	mov	r2, [r1]
	jnz	r4, .LBB93_265
	jmp	.LBB93_264
.LBB93_264:                             // %._crit_edge
                                        //   in Loop: Header=BB93_1 Depth=1
add	r2, 2
	jmp	.LBB93_269
.LBB93_265:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r3, r2
	mov	r1, -2147483648
add	r3, 1
	mov	r0, r4
	call	__bit_xor
	mov	r5, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r5, .LBB93_267
	jmp	.LBB93_266
.LBB93_266:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, r2
	add	r0, [rsp+5]
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 37
	mov	r7, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
.LBB93_267:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, -2147483648
add	r2, 2
	mov	r0, r4
	call	__bit_xor
	mov	r4, rax
	mov	r0, r2
	call	__bit_xor
	jge	rax, r4, .LBB93_269
	jmp	.LBB93_268
.LBB93_268:                             //   in Loop: Header=BB93_1 Depth=1
	add	r3, [rsp+5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r1, 255
	mov	r4, rax
	mov	r0, t2
	call	__bit_and
	mov	r0, 255
	mov	r6, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r5, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
.LBB93_269:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 8
	mov	[r0], r2
	jmp	.LBB93_1
.LBB93_270:                             // %.loopexit38
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 8
	mov	[r0], r3
	jmp	.LBB93_1
.LBB93_271:                             // %.loopexit44
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 8
	mov	[r0], r3
	jmp	.LBB93_1
.LBB93_272:                             // %.loopexit46
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 8
	mov	[r0], r3
	jmp	.LBB93_1
.LBB93_273:
	mov	r0, rsp
	mov	r1, rsp
add	r0, 4
	mov	r3, [r0]
add	r1, 8
	mov	r2, [r1]
	jz	r3, .LBB93_275
	jmp	.LBB93_274
.LBB93_274:
add	r3, -1
	mov	r4, r2
	sub	r4, r3
	mov	r1, 31
	mov	r0, r4
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r4
	call	__bit_and
	add	r3, rax
	add	r3, [rsp+5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
.LBB93_275:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r1, 2147483647
	mov	r0, rax
	call	__bit_xor
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
add	r2, 1
	mov	r0, rax
	mov	r1, r2
	call	__bit_and
add	rax, -1
	mov	x15, [rsp+10]
	mov	x14, [rsp+11]
	mov	x13, [rsp+12]
	mov	x12, [rsp+13]
	mov	x11, [rsp+14]
	mov	x10, [rsp+15]
	mov	x9, [rsp+16]
	mov	x8, [rsp+17]
	mov	x7, [rsp+18]
	mov	x6, [rsp+19]
	mov	x5, [rsp+20]
	mov	x4, [rsp+21]
	mov	x3, [rsp+22]
	mov	x2, [rsp+23]
	mov	x1, [rsp+24]
	mov	x0, [rsp+25]
add	rsp, 104
	ret
// -- End function
// -- Begin function format_integer
format_integer:                         // @format_integer
// %bb.0:
sub	rsp, 96
	mov	[rsp+23], x0
	mov	[rsp+22], x1
	mov	[rsp+21], x2
	mov	[rsp+20], x3
	mov	[rsp+19], x4
	mov	[rsp+18], x5
	mov	[rsp+17], x6
	mov	[rsp+16], x7
	mov	x4, [rsp+28]
	mov	t4, r4
	mov	t6, r3
	mov	t2, r2
	mov	t3, r1
	mov	r4, r0
	mov	r0, t3
	mov	r1, t2
	call	__bit_or
	mov	r3, rax
	mov	r0, r3
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r2, rax
	jnz	r3, .LBB94_2
	jmp	.LBB94_1
.LBB94_1:
	mov	x3, 0
	jz	x4, .LBB94_6
	jmp	.LBB94_2
.LBB94_2:
	mov	r0, r5
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	x3, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	x5, mcasm_static_85b8e4757d3715073866f6059f6b5134
	mov	r1, mcasm_static_73fa1e3cc366bdb06702f35e09026afd
	sub	r1, x5
add	rax, 1
	mov	r0, rax
	call	__bit_and
	jnz	r2, .LBB94_4
	jmp	.LBB94_3
.LBB94_3:
	add	x5, rax
	mov	x3, 0
	mov	t1, t3
	mov	x0, t2
	jmp	.LBB94_5
.LBB94_4:
	mov	r1, 3
	mov	r0, rsp
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	t1, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t1, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB94_6
.LBB94_5:                               // =>This Inner Loop Header: Depth=1
	mov	r3, 0
	mov	r0, t1
	mov	r1, x0
	mov	r2, t4
	call	__udivdi3
	mov	t5, rax
	mov	t7, t0
	mov	r0, t5
	mov	r1, t7
	call	__muldi3
	mov	r3, t0
	mov	r0, t1
	mov	r1, x0
	mov	r2, rax
	call	__subdi3
	mov	r0, rax
	add	r0, x5
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	mov	r0, rsp
	add	r0, x3
	mov	r1, 3
add	x3, 1
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	x1, rax
	mov	x2, [x1]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, x0
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	t1, t4
	mov	r1, 31
	mov	r2, rax
	mov	r0, t1
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_xor
add	rax, -1
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
add	rax, 1
	mov	t1, t5
	mov	x0, t7
	jnz	rax, .LBB94_5
	jmp	.LBB94_6
.LBB94_6:                               // %.loopexit22
	mov	t1, 45
	mov	r2, 0
	mov	t5, 0
	jnz	t6, .LBB94_9
	jmp	.LBB94_7
.LBB94_7:
	mov	r0, [rsp+24]
	mov	t1, 43
	jnz	r0, .LBB94_9
	jmp	.LBB94_8
.LBB94_8:
	mov	r0, [rsp+25]
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	t5, rax
	mov	r0, t5
	call	__bit_not
add	rax, 1
	mov	r1, -32
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
add	t1, 32
.LBB94_9:
	mov	x6, 0
	mov	x5, 0
	mov	t6, 0
	mov	r3, 0
	jz	r6, .LBB94_17
	jmp	.LBB94_10
.LBB94_10:
	mov	r0, 8
	jne	t4, r0, .LBB94_14
	jmp	.LBB94_11
.LBB94_11:
	jz	x3, .LBB94_13
	jmp	.LBB94_12
.LBB94_12:
	mov	r0, rsp
	add	r0, x3
add	r0, -1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, 48
	mov	r2, 0
	je	rax, r0, .LBB94_17
	jmp	.LBB94_13
.LBB94_13:
	mov	r2, 48
	mov	x6, 1
	mov	t6, 1
	jmp	.LBB94_17
.LBB94_14:
	mov	r0, t3
	mov	r1, t2
	call	__bit_or
	jz	rax, .LBB94_17
	jmp	.LBB94_15
.LBB94_15:
	mov	r0, 16
	jne	t4, r0, .LBB94_17
	jmp	.LBB94_16
.LBB94_16:
	mov	r0, r5
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	x6, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 32
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
add	r3, 88
	mov	r2, 48
	mov	t6, 2
	mov	x5, 1
.LBB94_17:
	mov	x1, x4
	sub	x1, x3
	jg	x4, x3, .LBB94_19
	jmp	.LBB94_18
.LBB94_18:
	mov	x1, 0
.LBB94_19:
	mov	r0, -1
	mov	x2, x1
	jg	x4, r0, .LBB94_21
	jmp	.LBB94_20
.LBB94_20:
	mov	x2, 0
.LBB94_21:
	mov	r6, [rsp+27]
	mov	r5, 0
	jg	x4, r0, .LBB94_23
	jmp	.LBB94_22
.LBB94_22:
	mov	r5, [rsp+26]
.LBB94_23:
	mov	t2, x2
	add	t2, x3
	mov	r0, t5
	call	__bit_not
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	rax, t2
	add	rax, t6
	mov	t4, r6
	sub	t4, rax
	mov	x0, t4
	jg	r6, rax, .LBB94_25
	jmp	.LBB94_24
.LBB94_24:
	mov	x0, 0
.LBB94_25:
	mov	r0, r5
	mov	r1, r7
	call	__bit_or
	mov	t7, r4
add	t7, 4
	mov	t6, r4
add	t6, 8
	jnz	rax, .LBB94_35
	jmp	.LBB94_26
.LBB94_26:
	mov	r0, 1
	jl	x0, r0, .LBB94_35
	jmp	.LBB94_27
.LBB94_27:
	mov	r0, [t7]
	mov	r6, [t6]
	jz	r0, .LBB94_29
	jmp	.LBB94_28
.LBB94_28:                              // %.preheader20.preheader
	mov	x4, 1
	mov	x7, t4
	mov	t2, r6
	jmp	.LBB94_31
.LBB94_29:
	add	r6, x0
	mov	[t6], r6
	jmp	.LBB94_35
.LBB94_30:                              //   in Loop: Header=BB94_31 Depth=1
	mov	r0, [t7]
add	x7, -1
	mov	r6, t2
.LBB94_31:                              // %.preheader20
                                        // =>This Inner Loop Header: Depth=1
add	t2, 1
	jz	r0, .LBB94_34
	jmp	.LBB94_32
.LBB94_32:                              // %.preheader20
                                        //   in Loop: Header=BB94_31 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	t3, rax
	mov	r0, t2
	call	__bit_xor
	jge	rax, t3, .LBB94_34
	jmp	.LBB94_33
.LBB94_33:                              //   in Loop: Header=BB94_31 Depth=1
	add	r6, [r4]
	mov	r1, 3
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	r6, rax
	mov	t3, [r6]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r0, 255
	mov	t2, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	mov	t3, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
	mov	t2, 1
	add	t2, [t6]
.LBB94_34:                              //   in Loop: Header=BB94_31 Depth=1
	mov	[t6], t2
	jg	x7, x4, .LBB94_30
	jmp	.LBB94_35
.LBB94_35:                              // %.loopexit21
	jnz	t5, .LBB94_40
	jmp	.LBB94_36
.LBB94_36:
	mov	r0, [t7]
	jz	r0, .LBB94_39
	jmp	.LBB94_37
.LBB94_37:
	mov	r6, [t6]
	mov	t2, r6
	mov	r1, -2147483648
add	t2, 1
	call	__bit_xor
	mov	t3, rax
	mov	r0, t2
	call	__bit_xor
	jge	rax, t3, .LBB94_39
	jmp	.LBB94_38
.LBB94_38:
	add	r6, [r4]
	mov	r1, 3
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	r6, rax
	mov	t3, [r6]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r1, 255
	mov	t2, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, 255
	mov	t1, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
.LBB94_39:
	add	[t6], 1
.LBB94_40:
	jz	x6, .LBB94_45
	jmp	.LBB94_41
.LBB94_41:
	mov	r0, [t7]
	jz	r0, .LBB94_44
	jmp	.LBB94_42
.LBB94_42:
	mov	r6, [t6]
	mov	t1, r6
	mov	r1, -2147483648
add	t1, 1
	call	__bit_xor
	mov	t2, rax
	mov	r0, t1
	call	__bit_xor
	jge	rax, t2, .LBB94_44
	jmp	.LBB94_43
.LBB94_43:
	add	r6, [r4]
	mov	r1, 3
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	t1, rax
	call	__bit_and
	mov	r6, rax
	mov	t2, [r6]
	mov	r1, 3
	mov	r0, t1
	call	__bit_shl
	mov	r0, 255
	mov	t1, rax
	mov	r1, t1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t2, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, rax
	mov	r1, t1
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
.LBB94_44:
	add	[t6], 1
.LBB94_45:
	jz	x5, .LBB94_50
	jmp	.LBB94_46
.LBB94_46:
	mov	r0, [t7]
	jz	r0, .LBB94_49
	jmp	.LBB94_47
.LBB94_47:
	mov	r2, [t6]
	mov	r6, r2
	mov	r1, -2147483648
add	r6, 1
	call	__bit_xor
	mov	t1, rax
	mov	r0, r6
	call	__bit_xor
	jge	rax, t1, .LBB94_49
	jmp	.LBB94_48
.LBB94_48:
	add	r2, [r4]
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r2, rax
	mov	t1, [r2]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r1, 255
	mov	r6, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, 255
	mov	r3, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
.LBB94_49:
	add	[t6], 1
.LBB94_50:
	jnz	r7, .LBB94_61
	jmp	.LBB94_51
.LBB94_51:
	jz	r5, .LBB94_61
	jmp	.LBB94_52
.LBB94_52:
	mov	r0, 1
	jl	x0, r0, .LBB94_61
	jmp	.LBB94_53
.LBB94_53:
	mov	r0, [t7]
	mov	r2, [t6]
	jz	r0, .LBB94_55
	jmp	.LBB94_54
.LBB94_54:                              // %.preheader18.preheader
	mov	r6, 1
	mov	t1, t4
	mov	r3, r2
	jmp	.LBB94_57
.LBB94_55:
	add	r2, x0
	mov	[t6], r2
	jmp	.LBB94_61
.LBB94_56:                              //   in Loop: Header=BB94_57 Depth=1
	mov	r0, [t7]
add	t1, -1
	mov	r2, r3
.LBB94_57:                              // %.preheader18
                                        // =>This Inner Loop Header: Depth=1
add	r3, 1
	jz	r0, .LBB94_60
	jmp	.LBB94_58
.LBB94_58:                              // %.preheader18
                                        //   in Loop: Header=BB94_57 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r5, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r5, .LBB94_60
	jmp	.LBB94_59
.LBB94_59:                              //   in Loop: Header=BB94_57 Depth=1
	add	r2, [r4]
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r2, rax
	mov	r5, [r2]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	r5, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r3, 1
	add	r3, [t6]
.LBB94_60:                              //   in Loop: Header=BB94_57 Depth=1
	mov	[t6], r3
	jg	t1, r6, .LBB94_56
	jmp	.LBB94_61
.LBB94_61:                              // %.loopexit19
	mov	r6, 1
	jl	x2, r6, .LBB94_70
	jmp	.LBB94_62
.LBB94_62:
	mov	r0, [t7]
	mov	r2, [t6]
	jz	r0, .LBB94_64
	jmp	.LBB94_63
.LBB94_63:                              // %.preheader16.preheader
	mov	t1, 1
	mov	r3, r2
	jmp	.LBB94_66
.LBB94_64:
	add	r2, x2
	mov	[t6], r2
	jmp	.LBB94_70
.LBB94_65:                              //   in Loop: Header=BB94_66 Depth=1
	mov	r0, [t7]
add	x1, -1
	mov	r2, r3
.LBB94_66:                              // %.preheader16
                                        // =>This Inner Loop Header: Depth=1
add	r3, 1
	jz	r0, .LBB94_69
	jmp	.LBB94_67
.LBB94_67:                              // %.preheader16
                                        //   in Loop: Header=BB94_66 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r5, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r5, .LBB94_69
	jmp	.LBB94_68
.LBB94_68:                              //   in Loop: Header=BB94_66 Depth=1
	add	r2, [r4]
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r2, rax
	mov	r5, [r2]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	r5, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r3, 1
	add	r3, [t6]
.LBB94_69:                              //   in Loop: Header=BB94_66 Depth=1
	mov	[t6], r3
	jg	x1, t1, .LBB94_65
	jmp	.LBB94_70
.LBB94_70:                              // %.loopexit17
	jl	x3, r6, .LBB94_79
	jmp	.LBB94_71
.LBB94_71:
	mov	r0, [t7]
	mov	r2, [t6]
	jz	r0, .LBB94_73
	jmp	.LBB94_72
.LBB94_72:                              // %.preheader14.preheader
	mov	t1, rsp
add	t1, -1
	mov	t2, 1
	mov	r3, r2
	jmp	.LBB94_75
.LBB94_73:
	add	r2, x3
	mov	[t6], r2
	jmp	.LBB94_79
.LBB94_74:                              //   in Loop: Header=BB94_75 Depth=1
	mov	r0, [t7]
add	x3, -1
	mov	r2, r3
.LBB94_75:                              // %.preheader14
                                        // =>This Inner Loop Header: Depth=1
add	r3, 1
	jz	r0, .LBB94_78
	jmp	.LBB94_76
.LBB94_76:                              // %.preheader14
                                        //   in Loop: Header=BB94_75 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r5, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r5, .LBB94_78
	jmp	.LBB94_77
.LBB94_77:                              //   in Loop: Header=BB94_75 Depth=1
	mov	r0, t1
	add	r0, x3
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	add	r2, [r4]
	mov	r1, 3
	mov	r3, rax
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r2, rax
	mov	r6, [r2]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r6, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r3, 1
	add	r3, [t6]
.LBB94_78:                              //   in Loop: Header=BB94_75 Depth=1
	mov	[t6], r3
	jg	x3, t2, .LBB94_74
	jmp	.LBB94_79
.LBB94_79:                              // %.loopexit15
	jz	r7, .LBB94_89
	jmp	.LBB94_80
.LBB94_80:                              // %.loopexit15
	mov	r0, 1
	jl	x0, r0, .LBB94_89
	jmp	.LBB94_81
.LBB94_81:
	mov	r0, [t7]
	mov	r2, [t6]
	jz	r0, .LBB94_83
	jmp	.LBB94_82
.LBB94_82:                              // %.preheader.preheader
	mov	r6, 1
	mov	r3, r2
	jmp	.LBB94_85
.LBB94_83:
	add	r2, x0
	mov	[t6], r2
	jmp	.LBB94_89
.LBB94_84:                              //   in Loop: Header=BB94_85 Depth=1
	mov	r0, [t7]
add	t4, -1
	mov	r2, r3
.LBB94_85:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	r3, 1
	jz	r0, .LBB94_88
	jmp	.LBB94_86
.LBB94_86:                              // %.preheader
                                        //   in Loop: Header=BB94_85 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r5, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r5, .LBB94_88
	jmp	.LBB94_87
.LBB94_87:                              //   in Loop: Header=BB94_85 Depth=1
	add	r2, [r4]
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r2, rax
	mov	r5, [r2]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	mov	r5, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r3, 1
	add	r3, [t6]
.LBB94_88:                              //   in Loop: Header=BB94_85 Depth=1
	mov	[t6], r3
	jg	t4, r6, .LBB94_84
	jmp	.LBB94_89
.LBB94_89:                              // %.loopexit
	mov	x7, [rsp+16]
	mov	x6, [rsp+17]
	mov	x5, [rsp+18]
	mov	x4, [rsp+19]
	mov	x3, [rsp+20]
	mov	x2, [rsp+21]
	mov	x1, [rsp+22]
	mov	x0, [rsp+23]
add	rsp, 96
	ret
// -- End function
// -- Begin function vsprintf
vsprintf:                               // @vsprintf
// %bb.0:
	mov	r3, r1
	mov	r1, -1
	mov	r4, r2
	mov	r2, r3
	mov	r3, r4
	jmp	vsnprintf
// -- End function
// -- Begin function abort
abort:                                  // @abort
// %bb.0:
	call abort
.LBB96_1:                               // =>This Inner Loop Header: Depth=1
	jmp	.LBB96_1
// -- End function
// -- Begin function atexit
atexit:                                 // @atexit
// %bb.0:
	mov	rax, 0
	ret
// -- End function
// -- Begin function abs
abs:                                    // @abs
// %bb.0:
	mov	r1, -1
	mov	rax, r0
	jg	rax, r1, .LBB98_2
	jmp	.LBB98_1
.LBB98_1:
	mov	r0, 0
	sub	r0, rax
	mov	rax, r0
.LBB98_2:
	ret
// -- End function
// -- Begin function atoi
atoi:                                   // @atoi
// %bb.0:
	mov	r1, 0
	mov	r2, 10
	jmp	strtol
// -- End function
// -- Begin function atol
atol:                                   // @atol
// %bb.0:
	mov	r1, 0
	mov	r2, 10
	jmp	strtol
// -- End function
// -- Begin function atoll
atoll:                                  // @atoll
// %bb.0:
	mov	r1, 0
	mov	r2, 10
	jmp	strtoll
// -- End function
// -- Begin function div
div:                                    // @div
// %bb.0:
	mov	r3, r1
	div	r3, r2
	mov	[r0], r3
	mul	r3, r2
	sub	r1, r3
add	r0, 4
	mov	[r0], r1
	ret
// -- End function
// -- Begin function ldiv
ldiv:                                   // @ldiv
// %bb.0:
	mov	r3, r1
	div	r3, r2
	mov	[r0], r3
	mul	r3, r2
	sub	r1, r3
add	r0, 4
	mov	[r0], r1
	ret
// -- End function
// -- Begin function lldiv
lldiv:                                  // @lldiv
// %bb.0:
	mov	r5, r3
	mov	r6, r2
	mov	r7, r1
	mov	t1, r0
	mov	r0, r7
	mov	r1, r6
	mov	r2, r5
	mov	r3, r4
	call	__divdi3
	mov	r1, t0
	mov	r0, t1
add	r0, 4
	mov	[r0], r1
	mov	[t1], rax
	mov	r0, rax
	call	__muldi3
	mov	r3, t0
	mov	r0, r7
	mov	r1, r6
	mov	r2, rax
	call	__subdi3
	mov	r0, t1
add	r0, 8
add	t1, 12
	mov	[t1], t0
	mov	[r0], rax
	ret
// -- End function
// -- Begin function gcvt
gcvt:                                   // @gcvt
// %bb.0:
sub	rsp, 1032
	mov	[rsp+257], x0
	mov	r4, r3
	mov	r5, r1
	mov	r6, r0
	jz	r4, .LBB105_115
	jmp	.LBB105_1
.LBB105_1:
	mov	r0, 0
	jg	r2, r0, .LBB105_3
	jmp	.LBB105_2
.LBB105_2:
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB105_115
.LBB105_3:
	mov	r0, 112
	sub	r0, r2
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, r2
add	r1, -112
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
add	r3, -1048064
	mov	r1, 31
	mov	r0, r3
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r3
	call	__bit_and
	mov	r7, rax
	mov	r3, rsp
	mov	t1, r7
	mov	r0, 625
add	t1, 1048576
	jl	r2, r0, .LBB105_6
	jmp	.LBB105_4
.LBB105_4:
	mov	r0, t1
	call	malloc
	mov	r3, rax
	jnz	r3, .LBB105_6
	jmp	.LBB105_5
.LBB105_5:
	mov	r0, r6
	mov	r1, r5
	mov	r3, r4
	call	gcvt_fast
	jmp	.LBB105_115
.LBB105_6:
	mov	x0, r2
add	r2, -1
add	r7, 1048176
	mov	r0, r6
	mov	r1, r5
	call	d2exp_buffered_n
	mov	r2, rax
	mov	r1, -2147483648
add	r7, 399
	mov	r0, r2
	call	__bit_xor
	mov	t2, rax
	mov	r0, t1
	call	__bit_xor
	jl	t2, rax, .LBB105_8
	jmp	.LBB105_7
.LBB105_7:
	mov	r2, r7
.LBB105_8:
	add	r2, r3
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	r2, rax
	mov	t3, [r2]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r0, 255
	mov	t2, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	t3, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r2], rax
	mov	r0, r3
	call	__bit_and
	mov	t3, rax
	jz	t3, .LBB105_10
	jmp	.LBB105_9
.LBB105_9:
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	mov	r2, x0
	jmp	.LBB105_11
.LBB105_10:
	mov	t2, [r3]
	mov	r0, 5136718
	mov	r2, x0
	je	t2, r0, .LBB105_25
	jmp	.LBB105_11
.LBB105_11:
	mov	r1, 255
	mov	r0, t2
	call	__bit_and
	mov	t5, 0
	mov	t4, mcasm_static_8f5f61b9dd74a8b851ea22679f5c2124
	jz	rax, .LBB105_16
	jmp	.LBB105_12
.LBB105_12:                             // %.preheader.i.preheader
	mov	t5, r3
add	t5, 1
	mov	t6, t2
.LBB105_13:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, t4
	call	__bit_shr
	mov	r1, 3
	mov	t7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t7, rax
	mov	r0, t6
	call	__bit_and
	jne	rax, t7, .LBB105_15
	jmp	.LBB105_14
.LBB105_14:                             //   in Loop: Header=BB105_13 Depth=1
	mov	r1, 2
add	t4, 1
	mov	r0, t5
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t6, rax
add	t5, 1
	mov	r0, 0
	jnz	t6, .LBB105_13
	jmp	.LBB105_15
.LBB105_15:
	call	__bit_and
	mov	t5, rax
.LBB105_16:                             // %strcmp.exit
	mov	r1, 2
	mov	r0, t4
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	t5, rax, .LBB105_25
	jmp	.LBB105_17
.LBB105_17:
	jnz	t3, .LBB105_19
	jmp	.LBB105_18
.LBB105_18:
	mov	t2, [r3]
	mov	r0, 7233902
	je	t2, r0, .LBB105_25
	jmp	.LBB105_19
.LBB105_19:
	mov	r0, t2
	call	__bit_and
	mov	t5, 0
	mov	t4, mcasm_static_a8afc04a7a6766e4df1229dbe668b6f4
	jz	rax, .LBB105_24
	jmp	.LBB105_20
.LBB105_20:                             // %.preheader.i4.preheader
	mov	t5, r3
add	t5, 1
	mov	t6, t2
.LBB105_21:                             // %.preheader.i4
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, t4
	call	__bit_shr
	mov	r1, 3
	mov	t7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t7, rax
	mov	r0, t6
	call	__bit_and
	jne	rax, t7, .LBB105_23
	jmp	.LBB105_22
.LBB105_22:                             //   in Loop: Header=BB105_21 Depth=1
	mov	r1, 2
add	t4, 1
	mov	r0, t5
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t6, rax
add	t5, 1
	mov	r0, 0
	jnz	t6, .LBB105_21
	jmp	.LBB105_23
.LBB105_23:
	call	__bit_and
	mov	t5, rax
.LBB105_24:                             // %strcmp.exit6
	mov	r1, 2
	mov	r0, t4
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	t5, rax, .LBB105_43
	jmp	.LBB105_25
.LBB105_25:                             // %strcmp.exit.thread
	mov	r5, r4
	mov	r1, 3
add	r5, 1
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	t1, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
	mov	r6, r4
	mov	r1, 3
add	r6, 2
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r5, rax
	mov	t1, [r5]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 97
	mov	t1, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r5, r4
	mov	r1, 3
add	r5, 3
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r6, rax
	mov	t1, [r6]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	t1, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r6], rax
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r5, rax
	mov	r7, [r5]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r7, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[r5], rax
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483023
	jl	rax, r0, .LBB105_115
	jmp	.LBB105_26
.LBB105_26:
	mov	r0, 16384
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB105_28
	jmp	.LBB105_27
.LBB105_27:
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	r5, r3
add	r5, -1
	mov	r6, [r5]
	mov	r7, 0
	mov	r2, 0
	mov	rax, 0
	jmp	.LBB105_33
.LBB105_28:
	mov	r0, 16386
	mov	r2, [r0]
	mov	r5, r3
add	r5, -1
	mov	r6, [r5]
	mov	r0, r2
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r7, 0
	jz	r2, .LBB105_33
	jmp	.LBB105_29
.LBB105_29:
	jge	r2, r5, .LBB105_33
	jmp	.LBB105_30
.LBB105_30:                             // %.preheader.i7.preheader
.LBB105_31:                             // %.preheader.i7
                                        // =>This Inner Loop Header: Depth=1
	mov	r7, r2
	mov	r0, r7
add	r0, 1
	mov	r2, [r0]
	mov	r0, r2
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	r2, .LBB105_33
	jmp	.LBB105_32
.LBB105_32:                             // %.preheader.i7
                                        //   in Loop: Header=BB105_31 Depth=1
	jl	r2, r5, .LBB105_31
	jmp	.LBB105_33
.LBB105_33:                             // %.loopexit.i
	jne	r2, r5, .LBB105_35
	jmp	.LBB105_34
.LBB105_34:
	call	abort
.LBB105_35:
	mov	r0, 16386
	jz	r7, .LBB105_39
	jmp	.LBB105_36
.LBB105_36:
	mov	r0, [r7]
	mov	r1, r0
	add	r1, r7
	jne	r1, r5, .LBB105_38
	jmp	.LBB105_37
.LBB105_37:
	add	r0, r6
	mov	[r7], r0
	mov	r5, r7
	jmp	.LBB105_40
.LBB105_38:
add	r7, 1
	mov	r0, r7
.LBB105_39:
	mov	[r0], r5
	mov	[r3], r2
.LBB105_40:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB105_115
	jmp	.LBB105_41
.LBB105_41:
	mov	r0, [r5]
	mov	r1, r0
	add	r1, r5
	jne	r1, r2, .LBB105_115
	jmp	.LBB105_42
.LBB105_42:
	add	r0, [r2]
	mov	[r5], r0
add	r2, 1
	mov	r0, [r2]
add	r5, 1
	mov	[r5], r0
	jmp	.LBB105_115
.LBB105_43:
	mov	t4, mcasm_static_a0949d77eedfc21443ba62399564a4b6
	mov	t6, t2
	mov	t5, r3
	jnz	t3, .LBB105_49
	jmp	.LBB105_44
.LBB105_44:
	mov	t2, [r3]
	mov	r1, 1768320585
	mov	t6, t2
	mov	t5, r3
	jne	t2, r1, .LBB105_49
	jmp	.LBB105_45
.LBB105_45:                             // %.preheader5.i10.preheader
	mov	t6, -2139062144
	mov	t5, r3
.LBB105_46:                             // %.preheader5.i10
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t6, .LBB105_63
	jmp	.LBB105_47
.LBB105_47:                             //   in Loop: Header=BB105_46 Depth=1
add	t5, 4
add	t4, 4
	mov	r1, [t5]
	mov	r0, [t4]
	je	r1, r0, .LBB105_46
	jmp	.LBB105_48
.LBB105_48:
	mov	t6, r1
.LBB105_49:
	mov	r1, 255
	mov	r0, t6
	call	__bit_and
	mov	t7, 0
	jz	rax, .LBB105_54
	jmp	.LBB105_50
.LBB105_50:                             // %.preheader.i8.preheader
add	t5, 1
.LBB105_51:                             // %.preheader.i8
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, t4
	call	__bit_shr
	mov	r1, 3
	mov	t7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t7, rax
	mov	r0, t6
	call	__bit_and
	jne	rax, t7, .LBB105_53
	jmp	.LBB105_52
.LBB105_52:                             //   in Loop: Header=BB105_51 Depth=1
	mov	r1, 2
add	t4, 1
	mov	r0, t5
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t6, rax
add	t5, 1
	mov	r0, 0
	jnz	t6, .LBB105_51
	jmp	.LBB105_53
.LBB105_53:
	call	__bit_and
	mov	t7, rax
.LBB105_54:                             // %strcmp.exit11
	mov	r1, 2
	mov	r0, t4
	call	__bit_shr
	mov	r1, 3
	mov	t5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	t7, rax, .LBB105_63
	jmp	.LBB105_55
.LBB105_55:
	jnz	t3, .LBB105_57
	jmp	.LBB105_56
.LBB105_56:
	mov	t2, [r3]
	mov	r0, 6712937
	je	t2, r0, .LBB105_63
	jmp	.LBB105_57
.LBB105_57:
	mov	r0, t2
	call	__bit_and
	mov	t5, 0
	mov	t4, mcasm_static_1b6fc06155ce3ed37ce64d51699793b6
	jz	rax, .LBB105_62
	jmp	.LBB105_58
.LBB105_58:                             // %.preheader.i12.preheader
	mov	t5, r3
add	t5, 1
	mov	t6, t2
.LBB105_59:                             // %.preheader.i12
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, t4
	call	__bit_shr
	mov	r1, 3
	mov	t7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t7, rax
	mov	r0, t6
	call	__bit_and
	jne	rax, t7, .LBB105_61
	jmp	.LBB105_60
.LBB105_60:                             //   in Loop: Header=BB105_59 Depth=1
	mov	r1, 2
add	t4, 1
	mov	r0, t5
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t6, rax
add	t5, 1
	mov	r0, 0
	jnz	t6, .LBB105_59
	jmp	.LBB105_61
.LBB105_61:
	call	__bit_and
	mov	t5, rax
.LBB105_62:                             // %strcmp.exit15
	mov	r1, 2
	mov	r0, t4
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	t5, rax, .LBB105_81
	jmp	.LBB105_63
.LBB105_63:                             // %strcmp.exit11.thread
	mov	r5, r4
	mov	r1, 3
add	r5, 1
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 105
	mov	t1, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
	mov	r6, r4
	mov	r1, 3
add	r6, 2
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r5, rax
	mov	t1, [r5]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	t1, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r5, r4
	mov	r1, 3
add	r5, 3
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r6, rax
	mov	t1, [r6]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 102
	mov	t1, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r6], rax
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r5, rax
	mov	r7, [r5]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r7, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[r5], rax
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483023
	jl	rax, r0, .LBB105_115
	jmp	.LBB105_64
.LBB105_64:
	mov	r0, 16384
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB105_66
	jmp	.LBB105_65
.LBB105_65:
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	r5, r3
add	r5, -1
	mov	r6, [r5]
	mov	r7, 0
	mov	r2, 0
	mov	rax, 0
	jmp	.LBB105_71
.LBB105_66:
	mov	r0, 16386
	mov	r2, [r0]
	mov	r5, r3
add	r5, -1
	mov	r6, [r5]
	mov	r0, r2
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r7, 0
	jz	r2, .LBB105_71
	jmp	.LBB105_67
.LBB105_67:
	jge	r2, r5, .LBB105_71
	jmp	.LBB105_68
.LBB105_68:                             // %.preheader.i19.preheader
.LBB105_69:                             // %.preheader.i19
                                        // =>This Inner Loop Header: Depth=1
	mov	r7, r2
	mov	r0, r7
add	r0, 1
	mov	r2, [r0]
	mov	r0, r2
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	r2, .LBB105_71
	jmp	.LBB105_70
.LBB105_70:                             // %.preheader.i19
                                        //   in Loop: Header=BB105_69 Depth=1
	jl	r2, r5, .LBB105_69
	jmp	.LBB105_71
.LBB105_71:                             // %.loopexit.i18
	jne	r2, r5, .LBB105_73
	jmp	.LBB105_72
.LBB105_72:
	call	abort
.LBB105_73:
	mov	r0, 16386
	jz	r7, .LBB105_77
	jmp	.LBB105_74
.LBB105_74:
	mov	r0, [r7]
	mov	r1, r0
	add	r1, r7
	jne	r1, r5, .LBB105_76
	jmp	.LBB105_75
.LBB105_75:
	add	r0, r6
	mov	[r7], r0
	mov	r5, r7
	jmp	.LBB105_78
.LBB105_76:
add	r7, 1
	mov	r0, r7
.LBB105_77:
	mov	[r0], r5
	mov	[r3], r2
.LBB105_78:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB105_115
	jmp	.LBB105_79
.LBB105_79:
	mov	r0, [r5]
	mov	r1, r0
	add	r1, r5
	jne	r1, r2, .LBB105_115
	jmp	.LBB105_80
.LBB105_80:
	add	r0, [r2]
	mov	[r5], r0
add	r2, 1
	mov	r0, [r2]
add	r5, 1
	mov	[r5], r0
	jmp	.LBB105_115
.LBB105_81:
	mov	t4, mcasm_static_55b62ded264696f3118881eef65fa1ea
	mov	t6, t2
	mov	t5, r3
	jnz	t3, .LBB105_87
	jmp	.LBB105_82
.LBB105_82:
	mov	t2, [r3]
	mov	r1, 1718503725
	mov	t6, t2
	mov	t5, r3
	jne	t2, r1, .LBB105_87
	jmp	.LBB105_83
.LBB105_83:                             // %.preheader5.i23.preheader
	mov	t6, -2139062144
	mov	t5, r3
.LBB105_84:                             // %.preheader5.i23
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t6, .LBB105_105
	jmp	.LBB105_85
.LBB105_85:                             //   in Loop: Header=BB105_84 Depth=1
add	t5, 4
add	t4, 4
	mov	r1, [t5]
	mov	r0, [t4]
	je	r1, r0, .LBB105_84
	jmp	.LBB105_86
.LBB105_86:
	mov	t6, r1
.LBB105_87:
	mov	r1, 255
	mov	r0, t6
	call	__bit_and
	mov	t7, 0
	jz	rax, .LBB105_92
	jmp	.LBB105_88
.LBB105_88:                             // %.preheader.i21.preheader
add	t5, 1
.LBB105_89:                             // %.preheader.i21
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, t4
	call	__bit_shr
	mov	r1, 3
	mov	t7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t7, rax
	mov	r0, t6
	call	__bit_and
	jne	rax, t7, .LBB105_91
	jmp	.LBB105_90
.LBB105_90:                             //   in Loop: Header=BB105_89 Depth=1
	mov	r1, 2
add	t4, 1
	mov	r0, t5
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t6, rax
add	t5, 1
	mov	r0, 0
	jnz	t6, .LBB105_89
	jmp	.LBB105_91
.LBB105_91:
	call	__bit_and
	mov	t7, rax
.LBB105_92:                             // %strcmp.exit24
	mov	r1, 2
	mov	r0, t4
	call	__bit_shr
	mov	r1, 3
	mov	t5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	t7, rax, .LBB105_105
	jmp	.LBB105_93
.LBB105_93:
	mov	t4, mcasm_static_94e5ac23d4a7da1069e2e6c8214725a5
	mov	t5, r3
	jnz	t3, .LBB105_99
	jmp	.LBB105_94
.LBB105_94:
	mov	t2, [r3]
	mov	r1, 1718511917
	mov	t5, r3
	jne	t2, r1, .LBB105_99
	jmp	.LBB105_95
.LBB105_95:                             // %.preheader5.i27.preheader
	mov	t2, -2139062144
	mov	t5, r3
.LBB105_96:                             // %.preheader5.i27
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t2, .LBB105_105
	jmp	.LBB105_97
.LBB105_97:                             //   in Loop: Header=BB105_96 Depth=1
add	t5, 4
add	t4, 4
	mov	r1, [t5]
	mov	r0, [t4]
	je	r1, r0, .LBB105_96
	jmp	.LBB105_98
.LBB105_98:
	mov	t2, r1
.LBB105_99:
	mov	r1, 255
	mov	r0, t2
	call	__bit_and
	mov	t3, 0
	jz	rax, .LBB105_104
	jmp	.LBB105_100
.LBB105_100:                            // %.preheader.i25.preheader
add	t5, 1
.LBB105_101:                            // %.preheader.i25
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, t4
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t3, rax
	mov	r0, t2
	call	__bit_and
	jne	rax, t3, .LBB105_103
	jmp	.LBB105_102
.LBB105_102:                            //   in Loop: Header=BB105_101 Depth=1
	mov	r1, 2
add	t4, 1
	mov	r0, t5
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
add	t5, 1
	mov	r0, 0
	jnz	t2, .LBB105_101
	jmp	.LBB105_103
.LBB105_103:
	call	__bit_and
	mov	t3, rax
.LBB105_104:                            // %strcmp.exit28
	mov	r1, 2
	mov	r0, t4
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	t3, rax, .LBB105_107
	jmp	.LBB105_105
.LBB105_105:                            // %strcmp.exit24.thread
	mov	r5, r4
	mov	r1, 3
add	r5, 1
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 45
	mov	t1, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
	mov	r6, r4
	mov	r1, 3
add	r6, 2
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r5, rax
	mov	t1, [r5]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 105
	mov	t1, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r5, r4
	mov	r1, 3
add	r5, 3
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r6, rax
	mov	t1, [r6]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	t1, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
	mov	r6, r4
	mov	r1, 3
add	r6, 4
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r5, rax
	mov	t1, [r5]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 102
	mov	t1, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r5], rax
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r7, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[r6], rax
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483023
	jl	rax, r0, .LBB105_115
	jmp	.LBB105_106
.LBB105_106:
	mov	r0, r3
	call	free
	jmp	.LBB105_115
.LBB105_107:
	mov	r0, r3
	mov	r1, rsp
	call	parse_exp10
	jnz	rax, .LBB105_113
	jmp	.LBB105_108
.LBB105_108:
	mov	r0, [rsp]
	mov	r1, -4
	jl	r0, r1, .LBB105_113
	jmp	.LBB105_109
.LBB105_109:
	jge	r0, r2, .LBB105_113
	jmp	.LBB105_110
.LBB105_110:
	call	__bit_not
	mov	t2, rax
	add	t2, r2
	mov	r1, -2147483648
	mov	r2, -2147483648
	mov	r0, t2
	call	__bit_xor
	sub	r2, rax
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, t2
	call	__bit_and
	mov	r0, r6
	mov	r1, r5
	mov	r2, rax
	call	d2fixed_buffered_n
	mov	r1, -2147483648
	mov	r2, rax
	mov	r0, r2
	call	__bit_xor
	mov	r5, rax
	mov	r0, t1
	call	__bit_xor
	jl	r5, rax, .LBB105_112
	jmp	.LBB105_111
.LBB105_111:
	mov	r2, r7
.LBB105_112:
	add	r2, r3
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r2, rax
	mov	r6, [r2]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r6, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r2, x0
.LBB105_113:
	mov	r0, r3
	call	trim_trailing_zeros_g
	call	strlen
add	rax, 1
	mov	r0, r4
	mov	r1, r3
	mov	r5, r2
	mov	r2, rax
	call	memcpy
	mov	r1, -2147483648
	mov	r0, r5
	call	__bit_xor
	mov	r0, -2147483023
	jl	rax, r0, .LBB105_115
	jmp	.LBB105_114
.LBB105_114:
	mov	r0, r3
	call	free
.LBB105_115:                            // %free.exit
	mov	rax, r4
	mov	x0, [rsp+257]
add	rsp, 1032
	ret
// -- End function
// -- Begin function parse_exp10
parse_exp10:                            // @parse_exp10
// %bb.0:
	mov	r2, r1
	mov	r1, 3
	mov	r3, r0
	call	__bit_and
	mov	r4, rax
	mov	r5, r3
	jz	r4, .LBB106_2
	jmp	.LBB106_1
.LBB106_1:                              // %.preheader12.preheader
	mov	r6, r3
add	r6, 1
	mov	t1, 101
	mov	r5, r3
	jmp	.LBB106_4
.LBB106_2:                              // %.loopexit9.i
	mov	r6, [r5]
	mov	r0, 16843008
	sub	r0, r6
	mov	r1, r6
	call	__bit_or
	mov	r1, -2139062144
	mov	r7, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r7, .LBB106_9
	jmp	.LBB106_3
.LBB106_3:                              // %.preheader5.i.preheader
	jmp	.LBB106_7
.LBB106_4:                              // %.preheader12
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB106_12
	jmp	.LBB106_5
.LBB106_5:                              // %.preheader12
                                        //   in Loop: Header=BB106_4 Depth=1
	je	rax, t1, .LBB106_27
	jmp	.LBB106_6
.LBB106_6:                              //   in Loop: Header=BB106_4 Depth=1
	mov	r1, 3
add	r5, 1
	mov	r0, r6
	call	__bit_and
add	r6, 1
	jz	rax, .LBB106_2
	jmp	.LBB106_4
.LBB106_7:                              // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 1701143909
	mov	r0, r6
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, r6
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r7, .LBB106_9
	jmp	.LBB106_8
.LBB106_8:                              //   in Loop: Header=BB106_7 Depth=1
add	r5, 4
	mov	r6, [r5]
	mov	r0, 16843008
	sub	r0, r6
	mov	r1, r6
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, r7, .LBB106_7
	jmp	.LBB106_9
.LBB106_9:                              // %.loopexit6.i.preheader
add	r5, -1
	mov	r7, 101
.LBB106_10:                             // %.loopexit6.i
                                        // =>This Inner Loop Header: Depth=1
add	r5, 1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	rax, r7, .LBB106_26
	jmp	.LBB106_11
.LBB106_11:                             // %.loopexit6.i
                                        //   in Loop: Header=BB106_10 Depth=1
	jnz	rax, .LBB106_10
	jmp	.LBB106_12
.LBB106_12:                             // %.loopexit
	jz	r4, .LBB106_14
	jmp	.LBB106_13
.LBB106_13:                             // %.preheader7.preheader
	mov	r4, r3
add	r4, 1
	mov	r6, 69
	jmp	.LBB106_16
.LBB106_14:                             // %.loopexit9.i2
	mov	r4, [r3]
	mov	r0, 16843008
	sub	r0, r4
	mov	r1, r4
	call	__bit_or
	mov	r1, -2139062144
	mov	r5, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r5, .LBB106_21
	jmp	.LBB106_15
.LBB106_15:                             // %.preheader5.i4.preheader
	jmp	.LBB106_19
.LBB106_16:                             // %.preheader7
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB106_37
	jmp	.LBB106_17
.LBB106_17:                             // %.preheader7
                                        //   in Loop: Header=BB106_16 Depth=1
	je	rax, r6, .LBB106_25
	jmp	.LBB106_18
.LBB106_18:                             //   in Loop: Header=BB106_16 Depth=1
	mov	r1, 3
add	r3, 1
	mov	r0, r4
	call	__bit_and
add	r4, 1
	jz	rax, .LBB106_14
	jmp	.LBB106_16
.LBB106_19:                             // %.preheader5.i4
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 1162167621
	mov	r0, r4
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, r4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r5, .LBB106_21
	jmp	.LBB106_20
.LBB106_20:                             //   in Loop: Header=BB106_19 Depth=1
add	r3, 4
	mov	r4, [r3]
	mov	r0, 16843008
	sub	r0, r4
	mov	r1, r4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, r5, .LBB106_19
	jmp	.LBB106_21
.LBB106_21:                             // %.loopexit6.i3.preheader
add	r3, -1
	mov	r5, 69
.LBB106_22:                             // %.loopexit6.i3
                                        // =>This Inner Loop Header: Depth=1
add	r3, 1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB106_36
	jmp	.LBB106_23
.LBB106_23:                             // %.loopexit6.i3
                                        //   in Loop: Header=BB106_22 Depth=1
	jne	rax, r5, .LBB106_22
	jmp	.LBB106_24
.LBB106_24:                             // %strchr.exit.loopexit
	jmp	.LBB106_28
.LBB106_25:                             // %strchr.exit.loopexit2
	jmp	.LBB106_28
.LBB106_26:                             // %strchr.exit.loopexit3
	mov	r3, r5
	jmp	.LBB106_28
.LBB106_27:                             // %strchr.exit.loopexit5
	mov	r3, r5
.LBB106_28:                             // %strchr.exit
	mov	r4, r3
add	r4, 1
	mov	r1, 2
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, 45
	je	rax, r0, .LBB106_31
	jmp	.LBB106_29
.LBB106_29:                             // %strchr.exit
	mov	r0, 43
	mov	r6, 1
	jne	rax, r0, .LBB106_32
	jmp	.LBB106_30
.LBB106_30:
add	r3, 2
	mov	r4, r3
	jmp	.LBB106_32
.LBB106_31:
add	r3, 2
	mov	r6, -1
	mov	r4, r3
.LBB106_32:
	mov	r1, 2
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	mov	r0, r5
add	r0, -58
	call	__bit_and
	mov	r1, -2147483648
	mov	r3, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, -2147483402
	jl	rax, r0, .LBB106_38
	jmp	.LBB106_33
.LBB106_33:                             // %.preheader.preheader
add	r4, 1
	mov	r3, 0
	mov	r7, -2147483638
.LBB106_34:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	t1, r3
add	r5, -48
	mov	r1, 255
	mul	t1, 10
	mov	r0, r5
	call	__bit_and
	mov	r3, rax
	mov	r1, 2
	add	r3, t1
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	mov	r0, r5
add	r0, -48
	call	__bit_and
	mov	r1, -2147483648
add	r4, 1
	mov	r0, rax
	call	__bit_xor
	jl	rax, r7, .LBB106_34
	jmp	.LBB106_35
.LBB106_35:
	mul	r3, r6
	mov	[r2], r3
	mov	r3, 0
	jmp	.LBB106_38
.LBB106_36:                             // %strchr.exit5.thread.loopexit
	mov	r3, -1
	jmp	.LBB106_38
.LBB106_37:                             // %strchr.exit5.thread.loopexit1
	mov	r3, -1
.LBB106_38:                             // %strchr.exit5.thread
	mov	rax, r3
	ret
// -- End function
// -- Begin function trim_trailing_zeros_g
trim_trailing_zeros_g:                  // @trim_trailing_zeros_g
// %bb.0:
	mov	r1, 3
	mov	r3, r0
	call	__bit_and
	mov	r4, rax
	mov	r2, r3
	jz	r4, .LBB107_2
	jmp	.LBB107_1
.LBB107_1:                              // %.preheader31.preheader
	mov	r5, r3
add	r5, 1
	mov	r7, 101
	mov	r2, r3
	jmp	.LBB107_4
.LBB107_2:                              // %.loopexit9.i
	mov	r5, [r2]
	mov	r0, 16843008
	sub	r0, r5
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r6, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB107_9
	jmp	.LBB107_3
.LBB107_3:                              // %.preheader5.i.preheader
	jmp	.LBB107_7
.LBB107_4:                              // %.preheader31
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB107_12
	jmp	.LBB107_5
.LBB107_5:                              // %.preheader31
                                        //   in Loop: Header=BB107_4 Depth=1
	je	rax, r7, .LBB107_37
	jmp	.LBB107_6
.LBB107_6:                              //   in Loop: Header=BB107_4 Depth=1
	mov	r1, 3
add	r2, 1
	mov	r0, r5
	call	__bit_and
add	r5, 1
	jz	rax, .LBB107_2
	jmp	.LBB107_4
.LBB107_7:                              // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 1701143909
	mov	r0, r5
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB107_9
	jmp	.LBB107_8
.LBB107_8:                              //   in Loop: Header=BB107_7 Depth=1
add	r2, 4
	mov	r5, [r2]
	mov	r0, 16843008
	sub	r0, r5
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, r6, .LBB107_7
	jmp	.LBB107_9
.LBB107_9:                              // %.loopexit6.i.preheader
add	r2, -1
	mov	r6, 101
.LBB107_10:                             // %.loopexit6.i
                                        // =>This Inner Loop Header: Depth=1
add	r2, 1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	rax, r6, .LBB107_36
	jmp	.LBB107_11
.LBB107_11:                             // %.loopexit6.i
                                        //   in Loop: Header=BB107_10 Depth=1
	jnz	rax, .LBB107_10
	jmp	.LBB107_12
.LBB107_12:                             // %.loopexit29
	mov	r2, r3
	jz	r4, .LBB107_14
	jmp	.LBB107_13
.LBB107_13:                             // %.preheader25.preheader
	mov	r5, r3
add	r5, 1
	mov	r7, 69
	mov	r2, r3
	jmp	.LBB107_16
.LBB107_14:                             // %.loopexit9.i5
	mov	r5, [r2]
	mov	r0, 16843008
	sub	r0, r5
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r6, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB107_21
	jmp	.LBB107_15
.LBB107_15:                             // %.preheader5.i7.preheader
	jmp	.LBB107_19
.LBB107_16:                             // %.preheader25
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB107_24
	jmp	.LBB107_17
.LBB107_17:                             // %.preheader25
                                        //   in Loop: Header=BB107_16 Depth=1
	je	rax, r7, .LBB107_35
	jmp	.LBB107_18
.LBB107_18:                             //   in Loop: Header=BB107_16 Depth=1
	mov	r1, 3
add	r2, 1
	mov	r0, r5
	call	__bit_and
add	r5, 1
	jz	rax, .LBB107_14
	jmp	.LBB107_16
.LBB107_19:                             // %.preheader5.i7
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 1162167621
	mov	r0, r5
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB107_21
	jmp	.LBB107_20
.LBB107_20:                             //   in Loop: Header=BB107_19 Depth=1
add	r2, 4
	mov	r5, [r2]
	mov	r0, 16843008
	sub	r0, r5
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, r6, .LBB107_19
	jmp	.LBB107_21
.LBB107_21:                             // %.loopexit6.i6.preheader
add	r2, -1
	mov	r6, 69
.LBB107_22:                             // %.loopexit6.i6
                                        // =>This Inner Loop Header: Depth=1
add	r2, 1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	rax, r6, .LBB107_34
	jmp	.LBB107_23
.LBB107_23:                             // %.loopexit6.i6
                                        //   in Loop: Header=BB107_22 Depth=1
	jnz	rax, .LBB107_22
	jmp	.LBB107_24
.LBB107_24:                             // %.loopexit
	mov	r5, r3
	jz	r4, .LBB107_29
	jmp	.LBB107_25
.LBB107_25:
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r2, r3
	jz	rax, .LBB107_33
	jmp	.LBB107_26
.LBB107_26:                             // %.preheader1.i.preheader
	mov	r5, r3
add	r5, 1
	mov	r2, r3
	jmp	.LBB107_28
.LBB107_27:                             //   in Loop: Header=BB107_28 Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r5, 1
	jz	rax, .LBB107_33
	jmp	.LBB107_28
.LBB107_28:                             // %.preheader1.i
                                        // =>This Inner Loop Header: Depth=1
add	r2, 1
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	jnz	rax, .LBB107_27
	jmp	.LBB107_29
.LBB107_29:                             // %.loopexit.i.preheader
	mov	r6, r5
add	r6, -1
	mov	r7, -2139062144
.LBB107_30:                             // %.loopexit.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [r5]
	mov	r0, 16843008
	sub	r0, r1
	mov	r2, r6
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r5, 4
add	r6, 4
	je	rax, r7, .LBB107_30
	jmp	.LBB107_31
.LBB107_31:                             // %.preheader.i.preheader
	mov	r7, -4
.LBB107_32:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r5
	add	r0, r7
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r2, 1
add	r7, 1
	jnz	rax, .LBB107_32
	jmp	.LBB107_33
.LBB107_33:                             // %strlen.exit
	jmp	.LBB107_38
.LBB107_34:                             // %strchr.exit.loopexit
	jmp	.LBB107_38
.LBB107_35:                             // %strchr.exit.loopexit4
	jmp	.LBB107_38
.LBB107_36:                             // %strchr.exit.loopexit5
	jmp	.LBB107_38
.LBB107_37:                             // %strchr.exit.loopexit7
.LBB107_38:                             // %strchr.exit
	jz	r4, .LBB107_40
	jmp	.LBB107_39
.LBB107_39:                             // %.preheader.preheader
	mov	r4, r3
add	r4, 1
	mov	r6, 46
	jmp	.LBB107_42
.LBB107_40:                             // %.loopexit9.i9
	mov	r4, [r3]
	mov	r0, 16843008
	sub	r0, r4
	mov	r1, r4
	call	__bit_or
	mov	r1, -2139062144
	mov	r5, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r5, .LBB107_47
	jmp	.LBB107_41
.LBB107_41:                             // %.preheader5.i12.preheader
	jmp	.LBB107_45
.LBB107_42:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB107_87
	jmp	.LBB107_43
.LBB107_43:                             // %.preheader
                                        //   in Loop: Header=BB107_42 Depth=1
	je	rax, r6, .LBB107_51
	jmp	.LBB107_44
.LBB107_44:                             //   in Loop: Header=BB107_42 Depth=1
	mov	r1, 3
add	r3, 1
	mov	r0, r4
	call	__bit_and
add	r4, 1
	jz	rax, .LBB107_40
	jmp	.LBB107_42
.LBB107_45:                             // %.preheader5.i12
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 774778414
	mov	r0, r4
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, r4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r5, .LBB107_47
	jmp	.LBB107_46
.LBB107_46:                             //   in Loop: Header=BB107_45 Depth=1
add	r3, 4
	mov	r4, [r3]
	mov	r0, 16843008
	sub	r0, r4
	mov	r1, r4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, r5, .LBB107_45
	jmp	.LBB107_47
.LBB107_47:                             // %.loopexit6.i10.preheader
add	r3, -1
	mov	r5, 46
.LBB107_48:                             // %.loopexit6.i10
                                        // =>This Inner Loop Header: Depth=1
add	r3, 1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	rax, r5, .LBB107_50
	jmp	.LBB107_49
.LBB107_49:                             // %.loopexit6.i10
                                        //   in Loop: Header=BB107_48 Depth=1
	jnz	rax, .LBB107_48
	jmp	.LBB107_50
.LBB107_50:
	mov	r0, rax
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r3
	call	__bit_and
	mov	r3, rax
	jmp	.LBB107_52
.LBB107_51:                             // %strchr.exit13.loopexit
.LBB107_52:                             // %strchr.exit13
	jz	r3, .LBB107_87
	jmp	.LBB107_53
.LBB107_53:                             // %strchr.exit13
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r4, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r4, .LBB107_87
	jmp	.LBB107_54
.LBB107_54:
add	r3, 1
	mov	r0, 1
	mov	r6, 0
	mov	t0, -3
	mov	r7, 48
	mov	r5, r2
.LBB107_55:                             // =>This Inner Loop Header: Depth=1
	mov	r1, -2147483648
	mov	r4, r5
	mov	t2, r0
	mov	t3, t0
	mov	t4, r6
	mov	r0, r3
	call	__bit_xor
	mov	r5, rax
	mov	r0, r4
	call	__bit_xor
	jle	rax, r5, .LBB107_57
	jmp	.LBB107_56
.LBB107_56:                             //   in Loop: Header=BB107_55 Depth=1
	mov	r5, r4
add	r5, -1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, t2
add	r0, -1
	mov	t0, t3
add	t0, -1
	mov	r6, t4
add	r6, -1
	je	rax, r7, .LBB107_55
	jmp	.LBB107_57
.LBB107_57:
	mov	r0, r4
	mov	r1, r3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r5, rax
add	r5, 1
	mov	r1, 3
	add	r4, r5
	mov	r0, r2
	call	__bit_and
	mov	r3, r2
	jz	rax, .LBB107_62
	jmp	.LBB107_58
.LBB107_58:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, r2
	jz	rax, .LBB107_66
	jmp	.LBB107_59
.LBB107_59:                             // %.preheader1.i14.preheader
	mov	r3, r2
add	r3, 1
	mov	r6, r2
	jmp	.LBB107_61
.LBB107_60:                             //   in Loop: Header=BB107_61 Depth=1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r3, 1
	jz	rax, .LBB107_66
	jmp	.LBB107_61
.LBB107_61:                             // %.preheader1.i14
                                        // =>This Inner Loop Header: Depth=1
add	r6, 1
	mov	r1, 3
	mov	r0, r6
	call	__bit_and
	jnz	rax, .LBB107_60
	jmp	.LBB107_62
.LBB107_62:                             // %.loopexit.i15.preheader
	mov	r7, r3
add	r7, -1
	mov	t1, -2139062144
.LBB107_63:                             // %.loopexit.i15
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [r3]
	mov	r0, 16843008
	sub	r0, r1
	mov	r6, r7
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r3, 4
add	r7, 4
	je	rax, t1, .LBB107_63
	jmp	.LBB107_64
.LBB107_64:                             // %.preheader.i16.preheader
	mov	t1, -4
.LBB107_65:                             // %.preheader.i16
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r3
	add	r0, t1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r6, 1
add	t1, 1
	jnz	rax, .LBB107_65
	jmp	.LBB107_66
.LBB107_66:                             // %strlen.exit17
	mov	r3, r6
	sub	r3, r2
	mov	r1, -2147483648
add	r3, 1
	mov	r0, r4
	call	__bit_xor
	mov	r7, rax
	mov	r0, r2
	call	__bit_xor
	jge	rax, r7, .LBB107_76
	jmp	.LBB107_67
.LBB107_67:
	mov	r7, r2
	add	r7, r3
	mov	r0, r7
	call	__bit_xor
	mov	t1, rax
	mov	r0, r4
	call	__bit_xor
	jge	rax, t1, .LBB107_76
	jmp	.LBB107_68
.LBB107_68:
	add	r4, r3
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB107_73
	jmp	.LBB107_69
.LBB107_69:
	mov	r0, r7
	mov	r1, r4
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB107_74
	jmp	.LBB107_70
.LBB107_70:                             // %.preheader.i19.preheader
	mov	r4, 0
	sub	r4, r2
	mov	r7, r2
	add	r7, r6
	add	t2, r5
	add	t3, r5
	mov	r5, -2147483645
.LBB107_71:                             // %.preheader.i19
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r7
	add	r0, r4
add	r0, -3
	mov	r0, [r0]
	mov	r1, t3
	add	r1, r6
	mov	[r1], r0
add	r4, -4
add	t2, -4
	mov	r3, r6
	add	r3, r4
add	r3, 1
	mov	r1, -2147483648
add	t3, -4
	mov	r0, r3
	call	__bit_xor
	jg	rax, r5, .LBB107_71
	jmp	.LBB107_72
.LBB107_72:                             // %.loopexit9.i20.loopexit
	add	r2, r3
	add	t2, r6
	mov	r4, t2
	mov	r7, r2
.LBB107_73:                             // %.loopexit9.i20
	jz	r3, .LBB107_87
	jmp	.LBB107_74
.LBB107_74:                             // %.preheader227
add	r7, -1
add	r4, -1
.LBB107_75:                             // =>This Inner Loop Header: Depth=1
	mov	r1, 2
add	r3, -1
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r2, rax
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r6, rax
	mov	t1, [r6]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
add	r7, -1
add	r4, -1
	jz	r3, .LBB107_87
	jmp	.LBB107_75
.LBB107_76:
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB107_84
	jmp	.LBB107_77
.LBB107_77:
	mov	r0, r4
	mov	r1, r2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB107_85
	jmp	.LBB107_78
.LBB107_78:
	mov	r1, -2147483648
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB107_80
	jmp	.LBB107_79
.LBB107_79:                             // %.preheader12.i.preheader
	add	r5, t4
	mov	r4, -2147483633
	mov	r0, r2
	jmp	.LBB107_82
.LBB107_80:                             // %.preheader237
	mov	r5, -2147483645
	jmp	.LBB107_83
.LBB107_81:
	add	r5, r2
	mov	r0, 3
	mov	r4, r5
	jg	r3, r0, .LBB107_80
	jmp	.LBB107_84
.LBB107_82:                             // %.preheader12.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [r0]
	mov	r6, r0
	add	r6, r5
	mov	r7, r0
add	r7, 4
	mov	[r6], r1
	mov	r1, [r7]
	mov	r7, r6
add	r7, 4
	mov	[r7], r1
	mov	r1, r0
add	r1, 8
	mov	r1, [r1]
	mov	r7, r6
add	r7, 8
add	r6, 12
	mov	[r7], r1
add	r0, 12
	mov	r0, [r0]
add	r2, 16
add	r3, -16
	mov	r1, -2147483648
	mov	[r6], r0
	mov	r0, r3
	call	__bit_xor
	mov	r0, r2
	jg	rax, r4, .LBB107_82
	jmp	.LBB107_81
.LBB107_83:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [r2]
add	r2, 4
	mov	[r4], r0
add	r3, -4
add	r4, 4
	mov	r0, r3
	call	__bit_xor
	jg	rax, r5, .LBB107_83
	jmp	.LBB107_84
.LBB107_84:                             // %.loopexit11.i
	jz	r3, .LBB107_87
	jmp	.LBB107_85
.LBB107_85:                             // %.preheader232
	mov	r7, r2
	mov	t1, r4
.LBB107_86:                             // =>This Inner Loop Header: Depth=1
add	r3, -1
	mov	r1, 2
add	r7, 1
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	mov	r1, 3
add	t1, 1
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r4, rax
	mov	r6, [r4]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r6, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r4], rax
	mov	r2, r7
	mov	r4, t1
	jnz	r3, .LBB107_86
	jmp	.LBB107_87
.LBB107_87:                             // %memmove.exit
	ret
// -- End function
// -- Begin function gcvt_fast
gcvt_fast:                              // @gcvt_fast
// %bb.0:
sub	rsp, 68
	mov	[rsp+16], x0
	mov	r4, r3
	mov	t2, r1
	mov	t1, r0
	jz	r4, .LBB108_69
	jmp	.LBB108_1
.LBB108_1:
	mov	r0, 0
	jg	r2, r0, .LBB108_3
	jmp	.LBB108_2
.LBB108_2:
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB108_69
.LBB108_3:
	mov	t6, r2
add	r2, -63
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r5, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r2
	call	__bit_and
	mov	r7, rax
	mov	r0, t1
	mov	r1, t2
	mov	r2, t1
	mov	r3, t2
	call	__unorddf2
	jz	rax, .LBB108_5
	jmp	.LBB108_4
.LBB108_4:
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	r0, r4
add	r0, 1
	mov	r1, 3
	mov	[r3], rax
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 97
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	r0, r4
add	r0, 2
	mov	r1, 3
	mov	[r3], rax
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	r0, r4
add	r0, 3
	mov	r1, 3
	mov	[r3], rax
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB108_69
.LBB108_5:
	mov	r1, 2147483647
	mov	r0, t2
	call	__bit_and
	mov	r2, -1
	mov	r3, 2146435071
	mov	t3, -1
	mov	r0, t1
	mov	r1, rax
	call	__gtdf2
	jl	rax, r5, .LBB108_9
	jmp	.LBB108_6
.LBB108_6:
	mov	r2, 0
	mov	r3, 0
	mov	r0, t1
	mov	r1, t2
	call	__ltdf2
	mov	r2, r4
	jg	rax, t3, .LBB108_8
	jmp	.LBB108_7
.LBB108_7:
	mov	r2, r4
	mov	r1, 3
add	r2, 1
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 45
	mov	r6, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
.LBB108_8:
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 105
	mov	r6, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	r0, r2
add	r0, 1
	mov	r1, 3
	mov	[r5], rax
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	r6, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	r0, r2
add	r0, 2
	mov	r1, 3
	mov	[r5], rax
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 102
	mov	r6, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
add	r2, 3
	mov	r1, 3
	mov	[r5], rax
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r2, rax
	mov	r5, [r2]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	jmp	.LBB108_69
.LBB108_9:
	mov	r2, 0
	mov	r3, 0
	mov	r0, t1
	mov	r1, t2
	call	__ltdf2
	mov	r6, r4
	jg	rax, t3, .LBB108_11
	jmp	.LBB108_10
.LBB108_10:
	mov	r6, r4
	mov	r1, 3
add	r6, 1
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 45
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[r3], rax
	mov	r0, t2
	call	__bit_xor
	mov	t2, rax
.LBB108_11:
	mov	r2, 0
	mov	r3, 0
	mov	r5, 0
	mov	r0, t1
	mov	r1, t2
	call	__eqdf2
	jz	rax, .LBB108_14
	jmp	.LBB108_12
.LBB108_12:
	mov	r3, 1076101120
	mov	r0, t1
	mov	r1, t2
	call	__gedf2
	jl	rax, r5, .LBB108_15
	jmp	.LBB108_13
.LBB108_13:                             // %.preheader29.preheader
	mov	t3, 0
	jmp	.LBB108_17
.LBB108_14:
	mov	r1, 3
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
add	r6, 1
	mov	r1, 3
	mov	[r3], rax
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB108_69
.LBB108_15:                             // %.loopexit30
add	r7, 63
	mov	r3, 1072693248
	mov	t7, 0
	mov	r0, t1
	mov	r1, t2
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB108_18
	jmp	.LBB108_16
.LBB108_16:                             // %.preheader27.preheader
	mov	t3, 0
	jmp	.LBB108_19
.LBB108_17:                             // %.preheader29
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, -1717986918
	mov	r3, 1069128089
	mov	r0, t1
	mov	r1, t2
	call	__muldf3
	mov	t1, rax
	mov	t2, t0
	mov	r2, 0
	mov	r3, 1076101120
add	r5, 1
	mov	r0, t1
	mov	r1, t2
	call	__ltdf2
	jl	rax, t3, .LBB108_15
	jmp	.LBB108_17
.LBB108_18:                             // %.loopexit28
	mov	x0, r7
add	x0, 1
	jmp	.LBB108_20
.LBB108_19:                             // %.preheader27
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, 0
	mov	r3, 1076101120
	mov	r0, t1
	mov	r1, t2
	call	__muldf3
	mov	t1, rax
	mov	t2, t0
	mov	r3, 1072693248
add	r5, -1
	mov	r0, t1
	mov	r1, t2
	call	__ltdf2
	jl	rax, t3, .LBB108_19
	jmp	.LBB108_18
.LBB108_20:                             // =>This Inner Loop Header: Depth=1
	mov	r0, t1
	mov	r1, t2
	call	__fixdfsi
	mov	r2, rax
	mov	r0, rsp
	mov	r3, r2
	add	r0, t7
	mov	r1, 3
add	r3, 48
	call	__bit_and
	mov	r1, -4
	mov	t3, rax
	call	__bit_and
	mov	t4, rax
	mov	t5, [t4]
	mov	r1, 3
	mov	r0, t3
	call	__bit_shl
	mov	r1, 255
	mov	t3, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, 255
	mov	r3, rax
	mov	r1, t3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t5, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, t3
	call	__bit_shl
	mov	r0, t5
	mov	r1, rax
	call	__bit_or
	mov	[t4], rax
	mov	r0, r2
	call	__floatsidf
	mov	r3, t0
	mov	r0, t1
	mov	r1, t2
	mov	r2, rax
	call	__subdf3
	mov	r2, 0
	mov	r3, 1076101120
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
add	t7, 1
	mov	t1, rax
	mov	t2, t0
	jne	x0, t7, .LBB108_20
	jmp	.LBB108_21
.LBB108_21:
	mov	r0, rsp
	add	r0, r7
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r0, rax
	call	__bit_sar
	mov	r0, 53
	jl	rax, r0, .LBB108_29
	jmp	.LBB108_22
.LBB108_22:                             // %.preheader26.preheader
	mov	t2, r7
add	t2, -1
	mov	t3, 57
	mov	t4, 1
.LBB108_23:                             // %.preheader26
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, rsp
	add	r2, t2
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	rax, t3, .LBB108_26
	jmp	.LBB108_24
.LBB108_24:                             //   in Loop: Header=BB108_23 Depth=1
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r2, rax
	mov	t1, [r2]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t1, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r0, t2
add	t2, -1
add	r0, 1
	mov	[r2], rax
	jg	r0, t4, .LBB108_23
	jmp	.LBB108_25
.LBB108_25:                             // %.preheader25.preheader
	mov	t3, 1
	mov	t4, r7
	jmp	.LBB108_27
.LBB108_26:
	mov	r1, 3
add	rax, 1
	mov	r0, r2
	mov	r3, rax
	call	__bit_and
	mov	r1, -4
	mov	t1, rax
	call	__bit_and
	mov	r2, rax
	mov	t2, [r2]
	mov	r1, 3
	mov	r0, t1
	call	__bit_shl
	mov	r1, 255
	mov	t1, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, 255
	mov	r3, rax
	mov	r1, t1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t2, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, t1
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	jmp	.LBB108_29
.LBB108_27:                             // %.preheader25
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, rsp
	mov	t5, t4
	add	r2, t5
	mov	r0, r2
add	r0, -1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r3, rax
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	t1, rax
	call	__bit_and
	mov	r2, rax
	mov	t2, [r2]
	mov	r1, 3
	mov	r0, t1
	call	__bit_shl
	mov	r0, 255
	mov	t1, rax
	mov	r1, t1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t2, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, t1
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
add	t4, -1
	jg	t5, t3, .LBB108_27
	jmp	.LBB108_28
.LBB108_28:
	mov	r1, 3
	mov	r0, rsp
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	t1, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 49
	mov	t1, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
add	r5, 1
.LBB108_29:
	mov	r0, 1
	mov	t3, r7
	je	t6, r0, .LBB108_35
	jmp	.LBB108_30
.LBB108_30:                             // %.preheader23.preheader
	mov	t4, r7
add	t4, -1
	mov	r3, 2
	mov	t1, 48
	mov	t3, 1
.LBB108_31:                             // %.preheader23
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, rsp
	add	r0, t4
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	rax, t1, .LBB108_33
	jmp	.LBB108_32
.LBB108_32:                             //   in Loop: Header=BB108_31 Depth=1
	mov	r0, t4
add	t4, -1
add	r0, 1
	jg	r0, r3, .LBB108_31
	jmp	.LBB108_35
.LBB108_33:
	mov	t3, t4
	mov	r0, -4
add	t3, 1
	jl	r5, r0, .LBB108_38
	jmp	.LBB108_34
.LBB108_34:
	jge	r5, r7, .LBB108_38
	jmp	.LBB108_52
.LBB108_35:                             // %.loopexit24
	mov	r0, -4
	jl	r5, r0, .LBB108_37
	jmp	.LBB108_36
.LBB108_36:                             // %.loopexit24
	jl	r5, r7, .LBB108_52
	jmp	.LBB108_37
.LBB108_37:
	mov	r1, 2
	mov	r0, rsp
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	mov	t1, r6
	mov	r1, 3
add	t1, 1
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r7, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
	mov	r6, t1
	jmp	.LBB108_42
.LBB108_38:
	mov	r1, 2
	mov	t5, 2
	mov	r0, rsp
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	mov	r3, r6
	mov	r1, 3
add	r3, 1
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	t1, rax
	mov	t2, [t1]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t2, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[t1], rax
	mov	r1, 3
add	r6, 2
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r7, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 46
	mov	r7, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jl	t3, t5, .LBB108_42
	jmp	.LBB108_39
.LBB108_39:                             // %.preheader21.preheader
	mov	t3, rsp
	mov	t2, 0
add	t3, 1
.LBB108_40:                             // %.preheader21
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, r6
	mov	r0, t3
	add	r0, t2
	mov	r1, 2
	add	r2, t2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r3, rax
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r2, rax
	mov	t1, [r2]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
add	t2, 1
	mov	[r2], rax
	jne	t4, t2, .LBB108_40
	jmp	.LBB108_41
.LBB108_41:                             // %.loopexit22.loopexit
	add	r6, t2
.LBB108_42:                             // %.loopexit22
	mov	r2, r6
	mov	r1, 3
add	r2, 1
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	t2, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 101
	mov	t1, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[r7], rax
	mov	r0, r5
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 2
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
add	r3, 43
	jg	r5, t2, .LBB108_44
	jmp	.LBB108_43
.LBB108_43:
	mov	r0, 0
	sub	r0, r5
	mov	r5, r0
.LBB108_44:
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r2, rax
	mov	t1, [r2]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r1, 255
	mov	r7, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, 255
	mov	r3, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r2, r6
	mov	r0, 10
add	r2, 2
	jl	r5, r0, .LBB108_46
	jmp	.LBB108_45
.LBB108_45:                             // %.preheader.preheader
	mov	t5, 0
	mov	t6, 99
	mov	r7, r5
	jmp	.LBB108_47
.LBB108_46:
	mov	r1, 3
add	r6, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r2, rax
	mov	r7, [r2]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	r7, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r3, r6
	jmp	.LBB108_51
.LBB108_47:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r3, r7
	mov	t1, r6
	add	t1, t5
	mov	r1, 10
add	t1, 2
	mov	r0, r3
	call	__udivsi3
	mov	r7, rax
	mov	r0, r7
	call	__umodsi3
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	t2, rax
	mov	r0, t1
	call	__bit_and
	mov	r1, -4
	mov	t3, rax
	call	__bit_and
	mov	t1, rax
	mov	t4, [t1]
	mov	r1, 3
	mov	r0, t3
	call	__bit_shl
	mov	r0, 255
	mov	t3, rax
	mov	r1, t3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t4, rax
	mov	r0, t2
	call	__bit_and
	mov	r0, rax
	mov	r1, t3
	call	__bit_shl
	mov	r0, t4
	mov	r1, rax
	call	__bit_or
	mov	[t1], rax
add	t5, 1
	jg	r3, t6, .LBB108_47
	jmp	.LBB108_48
.LBB108_48:
	add	r6, t5
add	t5, 1
	mov	r3, r6
	mov	r0, 3
add	r3, 2
	jl	t5, r0, .LBB108_51
	jmp	.LBB108_49
.LBB108_49:
	mov	r7, r2
	mov	t6, r6
.LBB108_50:                             // =>This Inner Loop Header: Depth=1
	mov	t1, r6
	mov	r1, 2
add	t1, 1
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	t2, rax
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t3, rax
	mov	r1, 3
add	r7, 1
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	t4, rax
	call	__bit_and
	mov	r2, rax
	mov	t5, [r2]
	mov	r1, 3
	mov	r0, t4
	call	__bit_shl
	mov	r0, 255
	mov	t4, rax
	mov	r1, t4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t5, rax
	mov	r0, t3
	call	__bit_and
	mov	r0, rax
	mov	r1, t4
	call	__bit_shl
	mov	r0, t5
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r2], rax
	mov	r0, t1
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	t1, rax
	mov	t3, [t1]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, t2
	call	__bit_and
	mov	r0, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[t1], rax
	mov	r1, -2147483648
add	t6, -1
	mov	r0, r6
	call	__bit_xor
	mov	t1, rax
	mov	r0, r7
	call	__bit_xor
	mov	r6, t6
	mov	r2, r7
	jl	rax, t1, .LBB108_50
	jmp	.LBB108_51
.LBB108_51:                             // %.loopexit
	mov	r1, 10
	mov	r0, r5
	call	__umodsi3
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r5, rax
	mov	r2, r3
	mov	r1, 3
add	r2, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r3, rax
	mov	r7, [r3]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r7, rax
	mov	r0, r5
	call	__bit_and
	mov	r0, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB108_68
.LBB108_52:
	mov	r0, 0
	jl	r5, r0, .LBB108_60
	jmp	.LBB108_53
.LBB108_53:                             // %.preheader100.preheader
.LBB108_54:                             // %.preheader100
                                        // =>This Inner Loop Header: Depth=1
	mov	t2, r0
	mov	r3, 48
	jge	t2, t3, .LBB108_56
	jmp	.LBB108_55
.LBB108_55:                             //   in Loop: Header=BB108_54 Depth=1
	mov	r0, rsp
	add	r0, t2
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
.LBB108_56:                             //   in Loop: Header=BB108_54 Depth=1
	mov	r2, r6
	mov	r1, 3
add	r2, 1
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r6, rax
	mov	t1, [r6]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r1, 255
	mov	r7, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, 255
	mov	r3, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
	mov	r0, t2
add	r0, 1
	mov	r6, r2
	jne	t2, r5, .LBB108_54
	jmp	.LBB108_57
.LBB108_57:
	mov	r0, r5
add	r0, 1
	jle	t3, r0, .LBB108_68
	jmp	.LBB108_58
.LBB108_58:
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 46
	mov	r7, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	t1, rsp
	mov	[r6], rax
	sub	t3, r5
	add	t1, r5
	mov	t2, 1
.LBB108_59:                             // =>This Inner Loop Header: Depth=1
	mov	r3, r2
	mov	r0, t1
	add	r0, t2
	mov	r1, 2
	add	r3, t2
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r5, rax
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r3, rax
	mov	r7, [r3]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r7, rax
	mov	r0, r5
	call	__bit_and
	mov	r0, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
add	t2, 1
	mov	[r3], rax
	je	t3, t2, .LBB108_67
	jmp	.LBB108_59
.LBB108_60:
	mov	r3, r6
	mov	r1, 3
add	r3, 1
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	t2, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t1, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
	mov	r2, r6
	mov	r1, 3
add	r2, 2
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r3, rax
	mov	t1, [r3]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 46
	mov	t1, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	je	r5, t2, .LBB108_63
	jmp	.LBB108_61
.LBB108_61:                             // %.preheader19.preheader
	mov	t1, 2
	jmp	.LBB108_65
.LBB108_62:                             // %.loopexit20.loopexit
	add	r6, t1
	mov	r2, r6
.LBB108_63:                             // %.loopexit20
	mov	r0, 1
	jl	t3, r0, .LBB108_68
	jmp	.LBB108_64
.LBB108_64:                             // %.preheader17.preheader
	mov	r3, rsp
	mov	r5, r2
	jmp	.LBB108_66
.LBB108_65:                             // %.preheader19
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r6
	add	r0, t1
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r7, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	r7, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	r0, t1
add	r0, -1
	mov	[r3], rax
	mov	r1, r5
	call	__bit_xor
add	t1, 1
	je	rax, t2, .LBB108_62
	jmp	.LBB108_65
.LBB108_66:                             // %.preheader17
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	mov	r1, 3
add	r2, 1
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r5, rax
	mov	t1, [r5]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
add	t3, -1
add	r3, 1
	mov	r5, r2
	jz	t3, .LBB108_68
	jmp	.LBB108_66
.LBB108_67:                             // %.loopexit16.loopexit
	add	r2, t2
.LBB108_68:                             // %.loopexit16
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r2, rax
	mov	r5, [r2]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
.LBB108_69:
	mov	rax, r4
	mov	x0, [rsp+16]
add	rsp, 68
	ret
// -- End function
// -- Begin function itoa
itoa:                                   // @itoa
// %bb.0:
sub	rsp, 16
	mov	r5, r2
	mov	r2, r1
	mov	r3, r5
add	r3, -37
	mov	r1, -2147483648
	mov	r4, r0
	mov	r0, r3
	call	__bit_xor
	mov	r0, 2147483612
	jg	rax, r0, .LBB109_2
	jmp	.LBB109_1
.LBB109_1:
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r4, rax
	mov	r2, [r4]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	mov	r5, rax
	mov	r0, 0
	mov	r2, 0
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r4], rax
	jmp	.LBB109_20
.LBB109_2:
	mov	r0, -1
	jg	r4, r0, .LBB109_5
	jmp	.LBB109_3
.LBB109_3:
	mov	r0, 10
	jne	r5, r0, .LBB109_5
	jmp	.LBB109_4
.LBB109_4:
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 45
	mov	r6, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r0, 0
	sub	r0, r4
	mov	r3, 1
	mov	r4, r0
	jmp	.LBB109_7
.LBB109_5:
	mov	r0, 10
	mov	r3, 0
	je	r5, r0, .LBB109_7
	jmp	.LBB109_6
.LBB109_6:                              // %.preheader8.preheader
	mov	t3, 0
	mov	t4, mcasm_static_73fa1e3cc366bdb06702f35e09026afd
	jmp	.LBB109_16
.LBB109_7:
	mov	r5, rsp
add	r5, 15
	mov	r1, 3
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	t1, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[r7], rax
	mov	r0, r4
	call	__bit_xor
	mov	r0, -2147483548
	jl	rax, r0, .LBB109_10
	jmp	.LBB109_8
.LBB109_8:                              // %.preheader.preheader
	mov	t5, mcasm_static_86aa16fa46c1f241ea4bc7c9265a2c2a
	mov	t6, -2147473649
	mov	r6, r4
.LBB109_9:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 100
	mov	r0, r6
	call	__udivsi3
	mov	r4, rax
	mov	r0, r4
	mul	r0, 2147483548
	add	r0, r6
	mov	r1, 1
	call	__bit_shl
	mov	r7, rax
	add	r7, t5
	mov	r0, r7
add	r0, 1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, r5
add	r0, -1
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	t3, rax
	mov	t4, [t3]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r0, 255
	mov	t2, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t4, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t4
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[t3], rax
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r5, -2
	mov	r1, 3
	mov	r7, rax
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	t1, rax
	call	__bit_and
	mov	t2, rax
	mov	t3, [t2]
	mov	r1, 3
	mov	r0, t1
	call	__bit_shl
	mov	r0, 255
	mov	t1, rax
	mov	r1, t1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, r7
	call	__bit_and
	mov	r0, rax
	mov	r1, t1
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[t2], rax
	mov	r0, r6
	call	__bit_xor
	mov	r6, r4
	jg	rax, t6, .LBB109_9
	jmp	.LBB109_10
.LBB109_10:                             // %.loopexit5
	mov	r0, 9
	add	r3, r2
	jg	r4, r0, .LBB109_12
	jmp	.LBB109_11
.LBB109_11:
	mov	r1, 48
	mov	r0, r4
	call	__bit_or
	mov	r0, r5
add	r0, -1
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r1, 255
	mov	r4, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, 255
	mov	t2, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	t3, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, t2
	call	__bit_and
	mov	r0, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
	jmp	.LBB109_13
.LBB109_12:
	mov	r7, r5
	mov	r1, 1
add	r7, -1
	mov	r0, r4
	call	__bit_shl
	mov	r6, mcasm_static_86aa16fa46c1f241ea4bc7c9265a2c2a
	add	r6, rax
	mov	r0, r6
add	r0, 1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	r7, rax
	mov	t3, [r7]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r0, 255
	mov	t2, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[r7], rax
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, r5
add	r0, -2
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	t1, rax
	mov	t2, [t1]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t2, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[t1], rax
	mov	t3, -2
	mov	r0, 100
	mov	t1, 0
	je	r4, r0, .LBB109_15
	jmp	.LBB109_13
.LBB109_13:
	add	t3, r5
add	t3, 1
	mov	t1, 0
.LBB109_14:                             // =>This Inner Loop Header: Depth=1
	mov	r0, r3
	add	r0, t1
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r5, rax
	mov	r7, [r5]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r1, 255
	mov	r4, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, 255
	mov	r6, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r7, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r0, t3
	add	r0, t1
	mov	r1, 2
add	t1, 1
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	jnz	r6, .LBB109_14
	jmp	.LBB109_15
.LBB109_15:                             // %.loopexit
	add	r3, t1
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB109_20
.LBB109_16:                             // %.preheader8
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r4
	mov	r1, r5
	call	__udivsi3
	mov	r3, rax
	mov	r1, r3
	mul	r1, r5
	sub	r0, r1
	add	r0, t4
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	mov	r0, r2
	add	r0, t3
	mov	r1, 3
add	t3, 1
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	t1, rax
	mov	t2, [t1]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t2, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[t1], rax
	mov	r0, r4
	call	__bit_xor
	mov	r6, rax
	mov	r0, r5
	call	__bit_xor
	mov	r4, r3
	jle	rax, r6, .LBB109_16
	jmp	.LBB109_17
.LBB109_17:
	mov	r0, r2
	add	r0, t3
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r4, rax
	mov	r5, [r4]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r5, rax
	mov	r0, 0
	mov	t2, 0
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	r0, 1
	mov	[r4], rax
	je	t3, r0, .LBB109_20
	jmp	.LBB109_18
.LBB109_18:                             // %.preheader6.preheader
add	t3, -1
.LBB109_19:                             // %.preheader6
                                        // =>This Inner Loop Header: Depth=1
	mov	r5, r2
	add	r5, t2
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, r2
	add	r4, t3
	mov	r1, 2
	mov	r3, rax
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r6, rax
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r5, rax
	mov	t1, [r5]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r5], rax
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r4, rax
	mov	r6, [r4]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r6, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
add	t2, 1
add	t3, -1
	mov	[r4], rax
	jl	t2, t3, .LBB109_19
	jmp	.LBB109_20
.LBB109_20:                             // %.loopexit7
	mov	rax, r2
add	rsp, 16
	ret
// -- End function
// -- Begin function labs
labs:                                   // @labs
// %bb.0:
	mov	r1, -1
	mov	rax, r0
	jg	rax, r1, .LBB110_2
	jmp	.LBB110_1
.LBB110_1:
	mov	r0, 0
	sub	r0, rax
	mov	rax, r0
.LBB110_2:
	ret
// -- End function
// -- Begin function llabs
llabs:                                  // @llabs
// %bb.0:
	mov	r2, r1
	mov	r1, -2147483648
	mov	r3, r0
	mov	r0, r2
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	r4, rax
	mov	r0, r3
	add	r0, r0
	mov	r1, 0
	sub	r1, r0
add	r4, 1
	mov	r5, 0
	mov	r0, r4
	call	__bit_and
	mov	r6, rax
	add	r6, r3
	mov	r0, r3
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	rax, r2
	add	rax, r2
	sub	r5, rax
	mov	r0, r4
	mov	r1, r5
	call	__bit_and
	add	r2, rax
	mov	rax, r6
	mov	t0, r2
	ret
// -- End function
// -- Begin function malloc
malloc:                                 // @malloc
// %bb.0:
	mov	r1, 16384
	mov	r2, [r1]
	mov	r3, 1296125004
	je	r2, r3, .LBB112_2
	jmp	.LBB112_1
.LBB112_1:
	mov	[r1], 1296125004
	mov	r1, 16385
	mov	[r1], 16387
	mov	r2, 16386
add	r0, 3
	mov	r1, 2
	mov	[r2], 0
	call	__bit_shr
	mov	r2, rax
	mov	r0, 1
	sub	r0, r2
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	r2, -1
add	rax, 1
	mov	r0, rax
	mov	r1, r2
	call	__bit_and
	mov	r2, rax
	mov	r4, r2
add	r4, 1
add	r2, 2
	jmp	.LBB112_17
.LBB112_2:
	mov	r1, 16386
	mov	t2, [r1]
add	r0, 3
	mov	r1, 2
	call	__bit_shr
	mov	r2, rax
	mov	r0, 1
	sub	r0, r2
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	r2, -1
add	rax, 1
	mov	r0, rax
	mov	r1, r2
	call	__bit_and
	mov	r2, rax
	mov	r4, r2
add	r4, 1
add	r2, 2
	jz	t2, .LBB112_17
	jmp	.LBB112_3
.LBB112_3:                              // %.preheader.preheader
	mov	r0, 0
.LBB112_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	t1, t2
	mov	r5, [t1]
	mov	r7, t1
add	r7, 1
	mov	t2, [r7]
	mov	r1, -2147483648
	mov	r3, r0
	mov	r0, r4
	call	__bit_xor
	mov	r6, rax
	mov	r0, r5
	call	__bit_xor
	jle	rax, r6, .LBB112_12
	jmp	.LBB112_5
.LBB112_5:
add	r4, 3
	mov	r0, r4
	call	__bit_xor
	mov	r4, rax
	mov	r0, r5
	call	__bit_xor
	jge	rax, r4, .LBB112_9
	jmp	.LBB112_6
.LBB112_6:
	jnz	r3, .LBB112_8
	jmp	.LBB112_7
.LBB112_7:
	mov	r0, 16386
	mov	[r0], t2
	mov	r6, r7
	jmp	.LBB112_20
.LBB112_8:
add	r3, 1
	mov	[r3], t2
	mov	r6, r7
	jmp	.LBB112_20
.LBB112_9:
	mov	r0, t1
	add	r0, r2
	sub	r5, r2
	mov	[r0], r5
	mov	r1, r0
add	r1, 1
	mov	[r1], t2
	mov	[t1], r2
	jnz	r3, .LBB112_11
	jmp	.LBB112_10
.LBB112_10:
	mov	r1, 16386
	mov	[r1], r0
	mov	r6, r7
	jmp	.LBB112_20
.LBB112_11:
add	r3, 1
	mov	[r3], r0
	mov	r6, r7
	jmp	.LBB112_20
.LBB112_12:                             //   in Loop: Header=BB112_4 Depth=1
	mov	r0, t1
	jnz	t2, .LBB112_4
	jmp	.LBB112_13
.LBB112_13:
	mov	r0, 16385
	mov	t2, [r0]
	mov	r0, r5
	add	r0, t1
	jne	t2, r0, .LBB112_17
	jmp	.LBB112_14
.LBB112_14:
	mov	r0, t2
add	r0, -8388609
	mov	r6, 0
	call	__bit_xor
	mov	r0, 2139111426
	jl	rax, r0, .LBB112_20
	jmp	.LBB112_15
.LBB112_15:
	mov	r4, r2
	mov	r0, 8388608
	sub	r0, t2
	sub	r4, r5
	call	__bit_xor
	mov	r5, rax
	mov	r0, r4
	call	__bit_xor
	jg	rax, r5, .LBB112_20
	jmp	.LBB112_16
.LBB112_16:
	mov	r0, r3
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r4, r3
add	r4, 1
	mov	r0, rax
	call	__bit_not
	mov	r1, 16385
	sub	r1, r3
add	rax, 1
	mov	r3, 16385
	mov	r0, rax
	call	__bit_and
	add	rax, r4
	mov	[rax], 0
	mov	r0, t1
	add	r0, r2
	mov	[r3], r0
	mov	[t1], r2
	mov	r6, r7
	jmp	.LBB112_20
.LBB112_17:
	mov	r0, 16385
	mov	r3, [r0]
	mov	r0, r3
add	r0, -8388609
	mov	r1, -2147483648
	mov	r6, 0
	call	__bit_xor
	mov	r0, 2139111426
	jl	rax, r0, .LBB112_20
	jmp	.LBB112_18
.LBB112_18:
	mov	r0, 8388608
	sub	r0, r3
	jge	r4, r0, .LBB112_20
	jmp	.LBB112_19
.LBB112_19:
	mov	r0, r3
	add	r0, r2
	mov	r1, 16385
	mov	[r1], r0
	mov	[r3], r2
add	r3, 1
	mov	r6, r3
.LBB112_20:
	mov	rax, r6
	ret
// -- End function
// -- Begin function free
free:                                   // @free
// %bb.0:
	mov	r3, r0
	jz	r3, .LBB113_18
	jmp	.LBB113_1
.LBB113_1:
	mov	r0, 16384
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB113_3
	jmp	.LBB113_2
.LBB113_2:
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	r4, r3
add	r4, -1
	mov	r5, [r4]
	mov	r6, 0
	mov	r2, 0
	mov	rax, 0
	jmp	.LBB113_8
.LBB113_3:
	mov	r0, 16386
	mov	r2, [r0]
	mov	r4, r3
add	r4, -1
	mov	r5, [r4]
	mov	r0, r2
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r6, 0
	jz	r2, .LBB113_8
	jmp	.LBB113_4
.LBB113_4:
	jge	r2, r4, .LBB113_8
	jmp	.LBB113_5
.LBB113_5:                              // %.preheader.preheader
.LBB113_6:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r6, r2
	mov	r0, r6
add	r0, 1
	mov	r2, [r0]
	mov	r0, r2
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	r2, .LBB113_8
	jmp	.LBB113_7
.LBB113_7:                              // %.preheader
                                        //   in Loop: Header=BB113_6 Depth=1
	jl	r2, r4, .LBB113_6
	jmp	.LBB113_8
.LBB113_8:                              // %.loopexit
	jne	r2, r4, .LBB113_10
	jmp	.LBB113_9
.LBB113_9:
	call	abort
.LBB113_10:
	mov	r0, 16386
	jz	r6, .LBB113_14
	jmp	.LBB113_11
.LBB113_11:
	mov	r0, [r6]
	mov	r1, r0
	add	r1, r6
	jne	r1, r4, .LBB113_13
	jmp	.LBB113_12
.LBB113_12:
	add	r0, r5
	mov	[r6], r0
	mov	r4, r6
	jmp	.LBB113_15
.LBB113_13:
add	r6, 1
	mov	r0, r6
.LBB113_14:
	mov	[r0], r4
	mov	[r3], r2
.LBB113_15:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB113_18
	jmp	.LBB113_16
.LBB113_16:
	mov	r0, [r4]
	mov	r1, r0
	add	r1, r4
	jne	r1, r2, .LBB113_18
	jmp	.LBB113_17
.LBB113_17:
	add	r0, [r2]
	mov	[r4], r0
add	r2, 1
	mov	r0, [r2]
add	r4, 1
	mov	[r4], r0
.LBB113_18:
	ret
// -- End function
// -- Begin function realloc
realloc:                                // @realloc
// %bb.0:
sub	rsp, 12
	mov	[rsp+2], x0
	mov	[rsp+1], x1
	mov	[rsp], x2
	mov	r2, r0
	jnz	r2, .LBB114_2
	jmp	.LBB114_1
.LBB114_1:
	mov	r0, r1
	call	malloc
	jmp	.LBB114_92
.LBB114_2:
	mov	r0, 16384
	mov	r0, [r0]
	jnz	r1, .LBB114_20
	jmp	.LBB114_3
.LBB114_3:
	mov	r1, 1296125004
	je	r0, r1, .LBB114_5
	jmp	.LBB114_4
.LBB114_4:
	mov	r0, 16384
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	r4, r2
add	r4, -1
	mov	r5, [r4]
	mov	r6, 0
	mov	r3, 0
	mov	rax, 0
	jmp	.LBB114_10
.LBB114_5:
	mov	r0, 16386
	mov	r3, [r0]
	mov	r4, r2
add	r4, -1
	mov	r5, [r4]
	mov	r0, r3
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r6, 0
	jz	r3, .LBB114_10
	jmp	.LBB114_6
.LBB114_6:
	jge	r3, r4, .LBB114_10
	jmp	.LBB114_7
.LBB114_7:                              // %.preheader.preheader
.LBB114_8:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r6, r3
	mov	r0, r6
add	r0, 1
	mov	r3, [r0]
	mov	r0, r3
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	r3, .LBB114_10
	jmp	.LBB114_9
.LBB114_9:                              // %.preheader
                                        //   in Loop: Header=BB114_8 Depth=1
	jl	r3, r4, .LBB114_8
	jmp	.LBB114_10
.LBB114_10:                             // %.loopexit
	jne	r3, r4, .LBB114_12
	jmp	.LBB114_11
.LBB114_11:
	call	abort
.LBB114_12:
	mov	r0, 16386
	jz	r6, .LBB114_16
	jmp	.LBB114_13
.LBB114_13:
	mov	r0, [r6]
	mov	r1, r0
	add	r1, r6
	jne	r1, r4, .LBB114_15
	jmp	.LBB114_14
.LBB114_14:
	add	r0, r5
	mov	[r6], r0
	mov	r4, r6
	jmp	.LBB114_17
.LBB114_15:
add	r6, 1
	mov	r0, r6
.LBB114_16:
	mov	[r0], r4
	mov	[r2], r3
.LBB114_17:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 0
	jz	r0, .LBB114_92
	jmp	.LBB114_18
.LBB114_18:
	mov	r0, [r4]
	mov	r1, r0
	add	r1, r4
	jne	r1, r3, .LBB114_92
	jmp	.LBB114_19
.LBB114_19:
	add	r0, [r3]
	mov	[r4], r0
add	r3, 1
	mov	r0, [r3]
add	r4, 1
	mov	[r4], r0
	jmp	.LBB114_92
.LBB114_20:
	mov	r3, 1296125004
	je	r0, r3, .LBB114_22
	jmp	.LBB114_21
.LBB114_21:
	mov	r0, 16384
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
.LBB114_22:
	mov	t6, r2
add	t6, -1
	mov	r5, [t6]
	mov	t3, r1
	mov	r0, r1
add	r0, 3
	mov	r1, 2
	call	__bit_shr
	mov	r3, rax
	mov	r0, 1
	sub	r0, r3
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	r3, -1
add	rax, 1
	mov	r0, rax
	mov	r1, r3
	call	__bit_and
	mov	r4, rax
	mov	r3, r4
add	r3, 1
	mov	r1, -2147483648
add	r4, 2
	mov	r0, r3
	call	__bit_xor
	mov	r6, rax
	mov	r0, r5
	call	__bit_xor
	jg	rax, r6, .LBB114_73
	jmp	.LBB114_23
.LBB114_23:
	mov	r0, 16385
	mov	r0, [r0]
	mov	t1, r5
	add	t1, t6
	mov	r7, r4
	sub	r7, r5
	je	t1, r0, .LBB114_27
	jmp	.LBB114_24
.LBB114_24:
	mov	r0, 16386
	mov	r0, [r0]
	mov	r6, 0
	jz	r0, .LBB114_32
	jmp	.LBB114_25
.LBB114_25:
	jge	r0, t1, .LBB114_32
	jmp	.LBB114_26
.LBB114_26:                             // %.preheader29.preheader
	jmp	.LBB114_30
.LBB114_27:
	mov	r0, t1
add	r0, -8388609
	call	__bit_xor
	mov	r0, 2139111426
	jl	rax, r0, .LBB114_39
	jmp	.LBB114_28
.LBB114_28:
	mov	r0, 8388608
	sub	r0, t1
	jg	r7, r0, .LBB114_39
	jmp	.LBB114_29
.LBB114_29:
	add	r3, r2
	mov	r0, 16385
	mov	[r0], r3
	mov	r0, r2
add	r0, -1
	mov	[r0], r4
	mov	rax, r2
	jmp	.LBB114_92
.LBB114_30:                             // %.preheader29
                                        // =>This Inner Loop Header: Depth=1
	mov	r6, r0
add	r0, 1
	mov	r0, [r0]
	jz	r0, .LBB114_32
	jmp	.LBB114_31
.LBB114_31:                             // %.preheader29
                                        //   in Loop: Header=BB114_30 Depth=1
	jl	r0, t1, .LBB114_30
	jmp	.LBB114_32
.LBB114_32:                             // %.loopexit30
	jne	r0, t1, .LBB114_39
	jmp	.LBB114_33
.LBB114_33:
	mov	t1, [t1]
	mov	r1, -2147483648
	mov	r0, r7
	call	__bit_xor
	mov	t2, rax
	mov	r0, t1
	call	__bit_xor
	jl	rax, t2, .LBB114_39
	jmp	.LBB114_34
.LBB114_34:
	mov	r0, r5
	add	r0, r2
	mov	t3, [r0]
	mov	r0, r7
add	r0, 2
	call	__bit_xor
	mov	t2, rax
	mov	r0, t1
	call	__bit_xor
	jge	rax, t2, .LBB114_38
	jmp	.LBB114_35
.LBB114_35:
	add	t1, r5
	mov	[t6], t1
	jnz	r6, .LBB114_37
	jmp	.LBB114_36
.LBB114_36:
	mov	r0, 16386
	mov	[r0], t3
	mov	rax, r2
	jmp	.LBB114_92
.LBB114_37:
add	r6, 1
	mov	[r6], t3
	mov	rax, r2
	jmp	.LBB114_92
.LBB114_38:
	add	r3, r2
	sub	t1, r7
	mov	[r3], t1
	mov	r0, r3
add	r0, 1
	mov	[r0], t3
	mov	r0, r6
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r5, r6
add	r5, 1
	mov	r0, rax
	call	__bit_not
	mov	r1, 16385
	sub	r1, r6
add	rax, 1
	mov	r0, rax
	call	__bit_and
	add	rax, r5
	mov	[rax], r3
	mov	r0, r2
add	r0, -1
	mov	[r0], r4
	mov	rax, r2
	jmp	.LBB114_92
.LBB114_39:
	mov	r0, t3
	call	malloc
	mov	r4, rax
	mov	rax, 0
	jz	r4, .LBB114_92
	jmp	.LBB114_40
.LBB114_40:
	mov	r6, r0
	mov	r1, 2
	mov	r7, r4
	mov	r0, r5
	call	__bit_shl
	mov	r3, rax
	sub	r3, r6
add	r3, -4
	mov	r1, 31
	mov	r0, r3
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r3
	call	__bit_and
	mov	t1, rax
	add	t1, r6
	mov	r1, -2147483648
	mov	r0, t1
	call	__bit_xor
	mov	r0, -2147483632
	mov	r6, r2
	mov	r3, r7
	jl	rax, r0, .LBB114_53
	jmp	.LBB114_41
.LBB114_41:
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r5, rax
	mov	t5, 8
	sub	t5, r5
	mov	t7, 0
	mov	r7, r2
.LBB114_42:                             // =>This Inner Loop Header: Depth=1
	mov	r6, r4
	mov	r0, r2
	add	r0, t7
	mov	r1, 2
	add	r6, t7
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t2, rax
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	t3, rax
	call	__bit_and
	mov	r6, rax
	mov	t4, [r6]
	mov	r1, 3
	mov	r0, t3
	call	__bit_shl
	mov	r0, 255
	mov	t3, rax
	mov	r1, t3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t4, rax
	mov	r0, t2
	call	__bit_and
	mov	r0, rax
	mov	r1, t3
	call	__bit_shl
	mov	r0, t4
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
add	t7, 1
add	r7, 1
	jne	t5, t7, .LBB114_42
	jmp	.LBB114_43
.LBB114_43:
	mov	r1, -8
	mov	r0, r5
	call	__bit_or
	mov	r5, rax
	mov	r6, r2
	add	r6, t7
	mov	r1, 3
	add	r5, t1
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	jnz	r0, .LBB114_50
	jmp	.LBB114_44
.LBB114_44:
	mov	r7, r4
	mov	r1, -2147483648
	add	r7, t7
	mov	r0, r5
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB114_46
	jmp	.LBB114_45
.LBB114_45:                             // %.preheader.i.preheader
	add	r4, t7
	add	t7, r2
	mov	r6, 0
	mov	r7, -2147483633
	jmp	.LBB114_48
.LBB114_46:                             // %.preheader162
	mov	r4, -2147483645
	mov	t1, r5
	jmp	.LBB114_49
.LBB114_47:
	add	r4, r6
	add	t7, r6
	mov	r0, 3
	mov	r7, r4
	mov	r6, t7
	mov	t1, r5
	jg	r5, r0, .LBB114_46
	jmp	.LBB114_53
.LBB114_48:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, t7
	add	r0, r6
	mov	r1, [r0]
	mov	t0, r4
	add	t0, r6
	mov	[t0], r1
	mov	r1, r0
add	r1, 4
	mov	r1, [r1]
	mov	t1, t0
add	t1, 4
	mov	[t1], r1
	mov	r1, r0
add	r1, 8
	mov	r1, [r1]
	mov	t1, t0
add	t1, 8
	mov	[t1], r1
add	r0, 12
	mov	r0, [r0]
add	t0, 12
	mov	[t0], r0
add	r5, -16
	mov	r1, -2147483648
add	r6, 16
	mov	r0, r5
	call	__bit_xor
	jg	rax, r7, .LBB114_48
	jmp	.LBB114_47
.LBB114_49:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [r6]
add	r6, 4
	mov	[r7], r0
add	t1, -4
add	r7, 4
	mov	r0, t1
	call	__bit_xor
	jg	rax, r4, .LBB114_49
	jmp	.LBB114_53
.LBB114_50:
	call	__bit_shl
	mov	t1, rax
	mov	t2, 8
	sub	t2, r0
	mov	r0, r7
	call	__bit_and
	mov	x1, r2
	sub	x1, rax
	mov	r0, x1
	add	r0, t7
	mov	t3, [r0]
add	x1, 4
	mov	x0, 0
.LBB114_51:                             // =>This Inner Loop Header: Depth=1
	mov	x2, r4
	mov	r0, t7
	add	r0, x0
	add	r0, x1
	mov	t4, [r0]
	add	x2, x0
	mov	r1, 31
	add	x2, t7
	mov	r0, t1
	call	__bit_and
	mov	r0, t3
	mov	r1, rax
	call	__bit_shl
	mov	t3, rax
	mov	r0, t1
	call	__bit_not
	mov	r1, 31
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
	mov	t5, rax
	mov	r0, t4
	call	__bit_shr
	mov	r0, rax
	mov	r1, t5
	call	__bit_shr
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[x2], rax
add	r5, -4
	mov	r1, -2147483648
add	x0, 4
	mov	r0, t2
	call	__bit_xor
	mov	t5, rax
	mov	r0, r5
	call	__bit_xor
	mov	t3, t4
	jge	rax, t5, .LBB114_51
	jmp	.LBB114_52
.LBB114_52:
	mov	r1, -4
	mov	r0, r6
	call	__bit_or
	mov	t1, rax
	mov	r1, 3
	add	t1, x0
	mov	r0, r7
	call	__bit_and
	mov	r6, r2
	sub	r6, rax
	add	r6, t1
	add	r6, t7
	add	r4, t7
	add	r4, x0
add	r6, 4
	mov	r7, r4
	jmp	.LBB114_54
.LBB114_53:                             // %.loopexit8.i
	mov	r5, t1
	jz	t1, .LBB114_56
	jmp	.LBB114_54
.LBB114_54:                             // %.preheader159
	mov	t2, r6
	mov	t3, r7
.LBB114_55:                             // =>This Inner Loop Header: Depth=1
add	r5, -1
	mov	r1, 2
add	t2, 1
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	mov	r1, 3
add	t3, 1
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r4
	call	__bit_and
	mov	r0, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
	mov	r7, t3
	mov	r6, t2
	jnz	r5, .LBB114_55
	jmp	.LBB114_56
.LBB114_56:                             // %memcpy.exit
	mov	r0, 16384
	mov	r1, [r0]
	mov	r4, 1296125004
	je	r1, r4, .LBB114_58
	jmp	.LBB114_57
.LBB114_57:
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	r5, [t6]
	mov	r6, 0
	mov	r4, 0
	mov	rax, 0
	jmp	.LBB114_63
.LBB114_58:
	mov	r0, 16386
	mov	r4, [r0]
	mov	r5, [t6]
	mov	r0, r4
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r6, 0
	jz	r4, .LBB114_63
	jmp	.LBB114_59
.LBB114_59:
	jge	r4, t6, .LBB114_63
	jmp	.LBB114_60
.LBB114_60:                             // %.preheader27.preheader
.LBB114_61:                             // %.preheader27
                                        // =>This Inner Loop Header: Depth=1
	mov	r6, r4
	mov	r0, r6
add	r0, 1
	mov	r4, [r0]
	mov	r0, r4
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	r4, .LBB114_63
	jmp	.LBB114_62
.LBB114_62:                             // %.preheader27
                                        //   in Loop: Header=BB114_61 Depth=1
	jl	r4, t6, .LBB114_61
	jmp	.LBB114_63
.LBB114_63:                             // %.loopexit28
	jne	r4, t6, .LBB114_65
	jmp	.LBB114_64
.LBB114_64:
	call	abort
.LBB114_65:
	mov	r0, 16386
	jz	r6, .LBB114_69
	jmp	.LBB114_66
.LBB114_66:
	mov	r0, [r6]
	mov	r1, r0
	add	r1, r6
	jne	r1, t6, .LBB114_68
	jmp	.LBB114_67
.LBB114_67:
	add	r0, r5
	mov	[r6], r0
	mov	t6, r6
	jmp	.LBB114_70
.LBB114_68:
add	r6, 1
	mov	r0, r6
.LBB114_69:
	mov	[r0], t6
	mov	[r2], r4
.LBB114_70:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, r3
	jz	r0, .LBB114_92
	jmp	.LBB114_71
.LBB114_71:
	mov	r0, [t6]
	mov	r1, r0
	add	r1, t6
	jne	r1, r4, .LBB114_92
	jmp	.LBB114_72
.LBB114_72:
	add	r0, [r4]
	mov	[t6], r0
add	r4, 1
	mov	r0, [r4]
add	t6, 1
	mov	[t6], r0
	jmp	.LBB114_92
.LBB114_73:
	sub	r5, r4
	mov	r0, r5
	call	__bit_xor
	mov	r1, -2147483646
	mov	r0, rax
	mov	rax, r2
	jl	r0, r1, .LBB114_92
	jmp	.LBB114_74
.LBB114_74:
	add	r3, r2
	mov	r0, r2
add	r0, -1
	mov	[r0], r4
	add	r4, r2
	mov	[r3], r5
	mov	rax, r2
	jz	r4, .LBB114_92
	jmp	.LBB114_75
.LBB114_75:
	mov	r0, 16384
	mov	r1, [r0]
	mov	r6, 1296125004
	je	r1, r6, .LBB114_77
	jmp	.LBB114_76
.LBB114_76:
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	r5, [r3]
	mov	r7, 0
	mov	r6, 0
	mov	rax, 0
	jmp	.LBB114_82
.LBB114_77:
	mov	r0, 16386
	mov	r6, [r0]
	mov	r0, r6
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r7, 0
	jz	r6, .LBB114_82
	jmp	.LBB114_78
.LBB114_78:
	jge	r6, r3, .LBB114_82
	jmp	.LBB114_79
.LBB114_79:                             // %.preheader25.preheader
.LBB114_80:                             // %.preheader25
                                        // =>This Inner Loop Header: Depth=1
	mov	r7, r6
	mov	r0, r7
add	r0, 1
	mov	r6, [r0]
	mov	r0, r6
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	r6, .LBB114_82
	jmp	.LBB114_81
.LBB114_81:                             // %.preheader25
                                        //   in Loop: Header=BB114_80 Depth=1
	jl	r6, r3, .LBB114_80
	jmp	.LBB114_82
.LBB114_82:                             // %.loopexit26
	jne	r6, r3, .LBB114_84
	jmp	.LBB114_83
.LBB114_83:
	call	abort
.LBB114_84:
	mov	r0, 16386
	jz	r7, .LBB114_88
	jmp	.LBB114_85
.LBB114_85:
	mov	r0, [r7]
	mov	r1, r0
	add	r1, r7
	jne	r1, r3, .LBB114_87
	jmp	.LBB114_86
.LBB114_86:
	add	r0, r5
	mov	[r7], r0
	mov	r3, r7
	jmp	.LBB114_89
.LBB114_87:
add	r7, 1
	mov	r0, r7
.LBB114_88:
	mov	[r0], r3
	mov	[r4], r6
.LBB114_89:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, r2
	jz	r0, .LBB114_92
	jmp	.LBB114_90
.LBB114_90:
	mov	r0, [r3]
	mov	r1, r0
	add	r1, r3
	mov	rax, r2
	jne	r1, r6, .LBB114_92
	jmp	.LBB114_91
.LBB114_91:
	add	r0, [r6]
	mov	[r3], r0
add	r6, 1
	mov	r0, [r6]
add	r3, 1
	mov	[r3], r0
	mov	rax, r2
.LBB114_92:
	mov	x2, [rsp]
	mov	x1, [rsp+1]
	mov	x0, [rsp+2]
add	rsp, 12
	ret
// -- End function
// -- Begin function calloc
calloc:                                 // @calloc
// %bb.0:
	mov	r2, r1
	mov	r5, r0
	jz	r5, .LBB115_2
	jmp	.LBB115_1
.LBB115_1:
	mov	r1, 0
	mov	r3, 0
	mov	r4, 0
	mov	r0, r5
	call	__muldi3
	mov	r0, t0
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jnz	rax, .LBB115_18
	jmp	.LBB115_2
.LBB115_2:
	mul	r2, r5
	mov	r0, r2
	call	malloc
	mov	r3, rax
	mov	r4, 0
	jz	r3, .LBB115_18
	jmp	.LBB115_3
.LBB115_3:
	mov	r1, 3
	mov	r4, r3
	mov	r0, r4
	call	__bit_and
	jz	rax, .LBB115_8
	jmp	.LBB115_4
.LBB115_4:                              // %.preheader2.preheader
	mov	t2, r3
add	t2, 1
	mov	t1, 0
.LBB115_5:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
	je	r2, t1, .LBB115_18
	jmp	.LBB115_6
.LBB115_6:                              //   in Loop: Header=BB115_5 Depth=1
	mov	r0, r3
	add	r0, t1
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r7, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	r0, t2
	add	r0, t1
	mov	r1, 3
	mov	[r6], rax
	call	__bit_and
add	t1, 1
	jnz	rax, .LBB115_5
	jmp	.LBB115_7
.LBB115_7:                              // %.loopexit7.i.loopexit
	add	r3, t1
	sub	r2, t1
.LBB115_8:                              // %.loopexit7.i
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB115_15
	jmp	.LBB115_9
.LBB115_9:
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB115_11
	jmp	.LBB115_10
.LBB115_10:                             // %.preheader.i.preheader
	mov	r5, -2147483633
	jmp	.LBB115_13
.LBB115_11:                             // %.preheader33
	mov	r5, -2147483645
	jmp	.LBB115_14
.LBB115_12:
	mov	r0, 3
	jg	r2, r0, .LBB115_11
	jmp	.LBB115_15
.LBB115_13:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r3
add	r0, 4
	mov	[r3], 0
	mov	r1, r3
add	r1, 8
	mov	[r0], 0
	mov	r0, r3
add	r0, 12
	mov	[r1], 0
add	r3, 16
add	r2, -16
	mov	r1, -2147483648
	mov	[r0], 0
	mov	r0, r2
	call	__bit_xor
	jg	rax, r5, .LBB115_13
	jmp	.LBB115_12
.LBB115_14:                             // =>This Inner Loop Header: Depth=1
	mov	[r3], 0
add	r2, -4
add	r3, 4
	mov	r0, r2
	call	__bit_xor
	jg	rax, r5, .LBB115_14
	jmp	.LBB115_15
.LBB115_15:                             // %.loopexit5.i
	jz	r2, .LBB115_18
	jmp	.LBB115_16
.LBB115_16:                             // %.preheader.preheader
	mov	r7, r3
.LBB115_17:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	r2, -1
	mov	r1, 3
add	r7, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r3, rax
	mov	r6, [r3]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r6, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r3, r7
	jnz	r2, .LBB115_17
	jmp	.LBB115_18
.LBB115_18:                             // %memset.exit
	mov	rax, r4
	ret
// -- End function
// -- Begin function d2fixed_buffered_n
d2fixed_buffered_n:                     // @d2fixed_buffered_n
// %bb.0:                               // %memcpy.exit
sub	rsp, 112
	mov	[rsp+27], x0
	mov	[rsp+26], x1
	mov	[rsp+25], x2
	mov	[rsp+24], x3
	mov	[rsp+23], x4
	mov	[rsp+22], x5
	mov	[rsp+21], x6
	mov	[rsp+20], x7
	mov	[rsp+19], x8
	mov	[rsp+18], x9
	mov	[rsp+17], x10
	mov	[rsp+16], x11
	mov	[rsp+15], x12
	mov	[rsp+14], x13
	mov	[rsp+13], x14
	mov	[rsp+12], x15
	mov	t4, r1
	mov	r1, 1048575
	mov	r5, r3
	mov	r6, r2
	mov	r7, r0
	mov	r0, t4
	call	__bit_and
	mov	r1, 20
	mov	t1, rax
	call	__bit_shr
	mov	r1, 2047
	mov	r3, 2047
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	jne	r2, r3, .LBB116_6
	jmp	.LBB116_1
.LBB116_1:
	mov	r0, r7
	mov	r1, t1
	call	__bit_or
	jz	rax, .LBB116_3
	jmp	.LBB116_2
.LBB116_2:                              // %memcpy.exit38.loopexit175
	mov	r2, r5
add	r2, 1
	mov	r1, 3
	mov	r4, 3
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	r7, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
	mov	r1, 3
add	r5, 2
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r2, rax
	mov	r6, [r2]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 97
	mov	r6, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r2], rax
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB116_183
.LBB116_3:
	mov	r0, -1
	mov	r4, 8
	jg	t4, r0, .LBB116_5
	jmp	.LBB116_4
.LBB116_4:
	mov	r1, 3
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r4, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r4
	mov	r1, rax
	call	__bit_and
	mov	r0, 45
	mov	r4, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r4, 9
.LBB116_5:                              // %memcpy.exit38.loopexit
	mov	r1, 31
	mov	r0, t4
	call	__bit_shr
	add	r5, rax
	mov	r2, r5
	mov	r1, 3
add	r2, 1
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 73
	mov	r7, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
	mov	r3, r5
	mov	r1, 3
add	r3, 2
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r2, rax
	mov	r7, [r2]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	r7, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r2, r5
	mov	r1, 3
add	r2, 3
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r3, rax
	mov	r7, [r3]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 102
	mov	r7, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r3, r5
	mov	r1, 3
add	r3, 4
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r2, rax
	mov	r7, [r2]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 105
	mov	r7, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r2, r5
	mov	r1, 3
add	r2, 5
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r3, rax
	mov	r7, [r3]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	r7, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r3, r5
	mov	r1, 3
add	r3, 6
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r2, rax
	mov	r7, [r2]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 105
	mov	r7, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r1, 3
add	r5, 7
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r6, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 116
	mov	r6, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r3], rax
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 121
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB116_183
.LBB116_6:
	mov	r0, r7
	mov	r1, t1
	call	__bit_or
	jnz	rax, .LBB116_26
	jmp	.LBB116_7
.LBB116_7:
	jnz	r2, .LBB116_26
	jmp	.LBB116_8
.LBB116_8:
	mov	r0, -1
	mov	r2, 0
	jg	t4, r0, .LBB116_10
	jmp	.LBB116_9
.LBB116_9:
	mov	r1, 3
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r4, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r4
	mov	r1, rax
	call	__bit_and
	mov	r0, 45
	mov	r4, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r2, 1
.LBB116_10:
	mov	r4, r2
	mov	r7, r5
	add	r7, r2
	mov	r1, 3
add	r4, 1
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	t1, rax
	mov	t2, [t1]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t2, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[t1], rax
	jz	r6, .LBB116_183
	jmp	.LBB116_11
.LBB116_11:
	mov	r1, 2
	mov	r0, r2
	call	__bit_or
	add	r4, r5
	mov	r1, 3
	mov	r2, rax
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r4, rax
	mov	t1, [r4]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 46
	mov	t1, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	add	r5, r2
	mov	r1, 3
	mov	[r4], rax
	mov	r0, r5
	call	__bit_and
	mov	r3, r6
	jz	rax, .LBB116_15
	jmp	.LBB116_12
.LBB116_12:                             // %.preheader78.preheader
add	r7, 3
	mov	r0, r5
	mov	r3, r6
.LBB116_13:                             // %.preheader78
                                        // =>This Inner Loop Header: Depth=1
	jz	r3, .LBB116_25
	jmp	.LBB116_14
.LBB116_14:                             //   in Loop: Header=BB116_13 Depth=1
add	r3, -1
	mov	r5, r0
	mov	r1, 3
add	r5, 1
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	t1, rax
	mov	t2, [t1]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t2, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[t1], rax
	mov	r0, r7
	call	__bit_and
add	r7, 1
	mov	r0, r5
	jnz	rax, .LBB116_13
	jmp	.LBB116_15
.LBB116_15:                             // %.loopexit7.i
	mov	r1, -2147483648
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB116_22
	jmp	.LBB116_16
.LBB116_16:
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB116_18
	jmp	.LBB116_17
.LBB116_17:                             // %.preheader.i.preheader
	mov	r4, -2147483633
	jmp	.LBB116_20
.LBB116_18:                             // %.preheader432
	mov	r4, -2147483645
	jmp	.LBB116_21
.LBB116_19:
	mov	r0, 3
	jg	r3, r0, .LBB116_18
	jmp	.LBB116_22
.LBB116_20:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r5
add	r0, 4
	mov	[r5], 808464432
	mov	r1, r5
add	r1, 8
	mov	[r0], 808464432
	mov	r0, r5
add	r0, 12
	mov	[r1], 808464432
add	r5, 16
add	r3, -16
	mov	r1, -2147483648
	mov	[r0], 808464432
	mov	r0, r3
	call	__bit_xor
	jg	rax, r4, .LBB116_20
	jmp	.LBB116_19
.LBB116_21:                             // =>This Inner Loop Header: Depth=1
	mov	[r5], 808464432
add	r3, -4
add	r5, 4
	mov	r0, r3
	call	__bit_xor
	jg	rax, r4, .LBB116_21
	jmp	.LBB116_22
.LBB116_22:                             // %.loopexit5.i
	jz	r3, .LBB116_25
	jmp	.LBB116_23
.LBB116_23:                             // %.preheader.preheader
	mov	t1, r5
.LBB116_24:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	r3, -1
	mov	r1, 3
add	t1, 1
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r5, rax
	mov	r7, [r5]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	r7, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r5, t1
	jnz	r3, .LBB116_24
	jmp	.LBB116_25
.LBB116_25:                             // %memset.exit
	add	r2, r6
	mov	r4, r2
	jmp	.LBB116_183
.LBB116_26:
	mov	r1, 1048576
	mov	r0, t1
	call	__bit_or
	jz	r2, .LBB116_28
	jmp	.LBB116_27
.LBB116_27:
	mov	t1, rax
.LBB116_28:
	mov	t2, -1074
	jz	r2, .LBB116_30
	jmp	.LBB116_29
.LBB116_29:
add	r2, -1075
	mov	t2, r2
.LBB116_30:
	mov	r0, -1
	mov	r4, 0
	jg	t4, r0, .LBB116_32
	jmp	.LBB116_31
.LBB116_31:
	mov	r1, 3
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r4, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r4
	mov	r1, rax
	call	__bit_and
	mov	r0, 45
	mov	r4, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r4, 1
.LBB116_32:
	mov	r0, -52
	mov	[rsp+5], t2
	jl	t2, r0, .LBB116_76
	jmp	.LBB116_33
.LBB116_33:
	mov	r1, -2147483648
	mov	r2, -2147483648
	mov	t2, [rsp+5]
	mov	r0, t2
	call	__bit_xor
	sub	r2, rax
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	x9, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, t2
	call	__bit_and
	mov	t4, rax
	mov	r0, t4
	mul	r0, 78913
	mov	r1, 18
	call	__bit_shr
add	rax, 25
	mov	r1, 65535
	mov	r0, rax
	call	__bit_and
	mul	rax, 58255
	mov	r1, 19
	mov	r0, rax
	call	__bit_shr
	mov	t5, rax
	mov	r3, t4
	sub	r3, t2
add	r3, 128
	mov	x10, r5
add	x10, -4
	mov	t2, 0
	mov	x11, -2147483645
	mov	x13, mcasm_static_5e6e12c67207ca8d73d385863abbfac5
	mov	x14, 99999999
	mov	x12, 10
	mov	t6, t5
.LBB116_34:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB116_38 Depth 2
                                        //     Child Loop BB116_66 Depth 2
                                        //     Child Loop BB116_47 Depth 2
                                        //     Child Loop BB116_50 Depth 2
add	t6, -1
	mov	r0, t4
	mov	r1, t6
	mov	r2, rsp
	call	ryu_fill_pow10_split_exp
	mov	r0, r7
	mov	r1, t1
	call	ryu_mul_shift_mod1e9_exact
	mov	t7, rax
	jnz	t2, .LBB116_39
	jmp	.LBB116_35
.LBB116_35:                             //   in Loop: Header=BB116_34 Depth=1
	jnz	t7, .LBB116_53
	jmp	.LBB116_36
.LBB116_36:                             //   in Loop: Header=BB116_34 Depth=1
	mov	r0, 2
	jl	t5, r0, .LBB116_76
	jmp	.LBB116_37
.LBB116_37:                             // %.preheader98.preheader
                                        //   in Loop: Header=BB116_34 Depth=1
.LBB116_38:                             // %.preheader98
                                        //   Parent Loop BB116_34 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	t6, t5
add	t6, -2
	mov	r0, t4
	mov	r1, t6
	mov	r2, rsp
	call	ryu_fill_pow10_split_exp
	mov	r0, r7
	mov	r1, t1
	call	ryu_mul_shift_mod1e9_exact
	mov	t7, rax
	jz	t7, .LBB116_75
	jmp	.LBB116_52
.LBB116_39:                             //   in Loop: Header=BB116_34 Depth=1
	mov	r2, r5
	add	r2, r4
	jz	t7, .LBB116_41
	jmp	.LBB116_40
.LBB116_40:                             // %memcpy.exit40
                                        //   in Loop: Header=BB116_34 Depth=1
	mov	x4, r2
	mov	r1, 10000
add	x4, 7
	mov	r0, t7
	call	__udivsi3
	mov	x0, rax
	mov	r0, x0
	mul	r0, -10000
	add	r0, t7
	mov	r1, 100
	call	__udivsi3
	mov	x1, rax
	mov	t0, x1
	mul	t0, -100
	add	t0, r0
	mov	r1, 1
	mov	r0, t0
	call	__bit_shl
	mov	r0, rax
	add	r0, x13
	mov	x2, r0
	mov	r1, 2
add	x2, 1
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	mov	x3, r2
	mov	r1, 3
add	x3, 8
	mov	r0, x4
	call	__bit_and
	mov	r1, -4
	mov	x6, rax
	call	__bit_and
	mov	x4, rax
	mov	x7, [x4]
	mov	r1, 3
	mov	r0, x6
	call	__bit_shl
	mov	r0, 255
	mov	x6, rax
	mov	r1, x6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x6
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x4], rax
	mov	r0, x2
	call	__bit_shr
	mov	r1, 3
	mov	x4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x2, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x4, rax
	call	__bit_and
	mov	x3, rax
	mov	x5, [x3]
	mov	r1, 3
	mov	r0, x4
	call	__bit_shl
	mov	r0, 255
	mov	x4, rax
	mov	r1, x4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	x3, r2
	mov	r1, 1
add	x3, 5
	mov	r0, x1
	call	__bit_shl
	mov	r0, rax
	add	r0, x13
	mov	x1, r0
	mov	r1, 2
add	x1, 1
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	x2, r2
	mov	r1, 3
add	x2, 6
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x5, rax
	call	__bit_and
	mov	x3, rax
	mov	x6, [x3]
	mov	r1, 3
	mov	r0, x5
	call	__bit_shl
	mov	r0, 255
	mov	x5, rax
	mov	r1, x5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x3], rax
	mov	r0, x1
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -4
	mov	x3, rax
	call	__bit_and
	mov	x2, rax
	mov	x4, [x2]
	mov	r1, 3
	mov	r0, x3
	call	__bit_shl
	mov	r0, 255
	mov	x3, rax
	mov	r1, x3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 100000000
	mov	[x2], rax
	mov	r0, t7
	call	__udivsi3
	mov	t7, rax
	mov	r0, t7
	mul	r0, -10000
	add	r0, x0
	mov	r1, 100
	call	__udivsi3
	mov	x0, rax
	mov	t0, x0
	mul	t0, -100
	add	t0, r0
	mov	r1, 1
	mov	r0, t0
	call	__bit_shl
	mov	r0, rax
	mov	x3, r2
	add	r0, x13
add	x3, 3
	mov	x1, r0
	mov	r1, 2
add	x1, 1
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	x2, r2
	mov	r1, 3
add	x2, 4
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x5, rax
	call	__bit_and
	mov	x3, rax
	mov	x6, [x3]
	mov	r1, 3
	mov	r0, x5
	call	__bit_shl
	mov	r0, 255
	mov	x5, rax
	mov	r1, x5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x3], rax
	mov	r0, x1
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -4
	mov	x3, rax
	call	__bit_and
	mov	x2, rax
	mov	x4, [x2]
	mov	r1, 3
	mov	r0, x3
	call	__bit_shl
	mov	r0, 255
	mov	x3, rax
	mov	r1, x3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x2], rax
	mov	r0, x0
	call	__bit_shl
	mov	r0, rax
	add	r0, x13
	mov	x1, r2
add	x1, 1
	mov	x0, r0
	mov	r1, 2
add	x0, 1
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, -4
	mov	x3, rax
	call	__bit_and
	mov	x1, rax
	mov	x4, [x1]
	mov	r1, 3
	mov	r0, x3
	call	__bit_shl
	mov	r0, 255
	mov	x3, rax
	mov	r1, x3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	mov	x1, r2
	mov	r1, 2
add	x1, 2
	mov	r0, x0
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, -4
	mov	x2, rax
	call	__bit_and
	mov	x1, rax
	mov	x3, [x1]
	mov	r1, 3
	mov	r0, x2
	call	__bit_shl
	mov	r0, 255
	mov	x2, rax
	mov	r1, x2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	mov	r1, 3
add	t7, 48
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	r2, rax
	mov	x1, [r2]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r0, 255
	mov	x0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, t7
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	jmp	.LBB116_51
.LBB116_41:                             //   in Loop: Header=BB116_34 Depth=1
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	x0, 9
	mov	t7, r2
	jz	rax, .LBB116_46
	jmp	.LBB116_42
.LBB116_42:                             // %.preheader95.preheader
                                        //   in Loop: Header=BB116_34 Depth=1
	mov	t7, r2
add	t7, 1
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	x1, rax
	mov	x2, [x1]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r0, 255
	mov	x0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x2, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[x1], rax
	mov	r0, t7
	call	__bit_and
	mov	x0, 8
	jz	rax, .LBB116_46
	jmp	.LBB116_43
.LBB116_43:                             // %.preheader95.1
                                        //   in Loop: Header=BB116_34 Depth=1
	mov	x1, r2
add	x1, 2
	mov	r0, t7
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	t7, rax
	mov	x2, [t7]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r0, 255
	mov	x0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x2, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[t7], rax
	mov	r0, x1
	call	__bit_and
	mov	x0, 7
	mov	t7, x1
	jz	rax, .LBB116_46
	jmp	.LBB116_44
.LBB116_44:                             // %.preheader95.2
                                        //   in Loop: Header=BB116_34 Depth=1
	mov	t7, r2
add	t7, 3
	mov	r0, x1
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	x1, rax
	mov	x2, [x1]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r0, 255
	mov	x0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x2, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[x1], rax
	mov	r0, t7
	call	__bit_and
	mov	x0, 6
	jz	rax, .LBB116_46
	jmp	.LBB116_45
.LBB116_45:                             // %.preheader95.3
                                        //   in Loop: Header=BB116_34 Depth=1
add	r2, 4
	mov	r0, t7
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	t7, rax
	mov	x1, [t7]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r0, 255
	mov	x0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x1, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[t7], rax
	mov	x0, 5
	mov	t7, r2
.LBB116_46:                             // %.thread.preheader
                                        //   in Loop: Header=BB116_34 Depth=1
.LBB116_47:                             // %.thread
                                        //   Parent Loop BB116_34 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	[t7], 808464432
add	x0, -4
	mov	r1, -2147483648
add	t7, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x11, .LBB116_47
	jmp	.LBB116_48
.LBB116_48:                             // %.loopexit5.i45
                                        //   in Loop: Header=BB116_34 Depth=1
	jz	x0, .LBB116_51
	jmp	.LBB116_49
.LBB116_49:                             // %.preheader94.preheader
                                        //   in Loop: Header=BB116_34 Depth=1
	mov	t2, 0
.LBB116_50:                             // %.preheader94
                                        //   Parent Loop BB116_34 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, t7
	add	r0, t2
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	x1, rax
	mov	x2, [x1]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
add	t2, 1
	mov	[x1], rax
	jne	x0, t2, .LBB116_50
	jmp	.LBB116_51
.LBB116_51:                             // %memset.exit47
                                        //   in Loop: Header=BB116_34 Depth=1
add	r4, 9
	jmp	.LBB116_74
.LBB116_52:                             // %.loopexit99.loopexit
                                        //   in Loop: Header=BB116_34 Depth=1
add	t5, -1
.LBB116_53:                             // %.loopexit99
                                        //   in Loop: Header=BB116_34 Depth=1
	mov	r1, -2147483648
	mov	r0, t7
	call	__bit_xor
	mov	r0, -1147483648
	jl	rax, r0, .LBB116_55
	jmp	.LBB116_54
.LBB116_54:
	call	abort
.LBB116_55:                             //   in Loop: Header=BB116_34 Depth=1
	mov	t2, 9
	mov	r2, r5
	add	r2, r4
	jg	t7, x14, .LBB116_65
	jmp	.LBB116_56
.LBB116_56:                             //   in Loop: Header=BB116_34 Depth=1
	mov	t2, 8
	mov	r0, 9999999
	jg	t7, r0, .LBB116_65
	jmp	.LBB116_57
.LBB116_57:                             //   in Loop: Header=BB116_34 Depth=1
	mov	t2, 7
	mov	r0, 999999
	jg	t7, r0, .LBB116_65
	jmp	.LBB116_58
.LBB116_58:                             //   in Loop: Header=BB116_34 Depth=1
	mov	t2, 6
	mov	r0, 99999
	jg	t7, r0, .LBB116_65
	jmp	.LBB116_59
.LBB116_59:                             //   in Loop: Header=BB116_34 Depth=1
	mov	t2, 5
	mov	r0, 9999
	jg	t7, r0, .LBB116_65
	jmp	.LBB116_60
.LBB116_60:                             //   in Loop: Header=BB116_34 Depth=1
	mov	t2, 4
	mov	r0, 999
	jg	t7, r0, .LBB116_64
	jmp	.LBB116_61
.LBB116_61:                             //   in Loop: Header=BB116_34 Depth=1
	mov	t2, 3
	mov	r0, 99
	jg	t7, r0, .LBB116_64
	jmp	.LBB116_62
.LBB116_62:                             //   in Loop: Header=BB116_34 Depth=1
	mov	t2, 2
	mov	r0, 9
	jg	t7, r0, .LBB116_64
	jmp	.LBB116_63
.LBB116_63:                             //   in Loop: Header=BB116_34 Depth=1
	mov	t2, 1
.LBB116_64:                             //   in Loop: Header=BB116_34 Depth=1
	mov	x0, 0
	jmp	.LBB116_68
.LBB116_65:                             //   in Loop: Header=BB116_34 Depth=1
	mov	t3, x10
	add	t3, r4
	add	t3, t2
	mov	x15, 0
.LBB116_66:                             // %memcpy.exit48
                                        //   Parent Loop BB116_34 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 10000
	mov	x0, t7
	mov	r0, x0
	call	__udivsi3
	mov	t7, rax
	mov	r0, t7
	mul	r0, -10000
	add	r0, x0
	mov	r1, 100
	call	__udivsi3
	mov	x2, rax
	mov	t0, x2
	mul	t0, -100
	add	t0, r0
	mov	r1, 1
	mov	r0, t0
	call	__bit_shl
	mov	x1, t3
	add	x1, x15
	mov	r0, rax
	mov	x5, x1
	add	r0, x13
add	x5, 2
	mov	x3, r0
	mov	r1, 2
add	x3, 1
	call	__bit_shr
	mov	r1, 3
	mov	x4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	x4, x1
	mov	r1, 3
add	x4, 3
	mov	r0, x5
	call	__bit_and
	mov	r1, -4
	mov	x7, rax
	call	__bit_and
	mov	x5, rax
	mov	x8, [x5]
	mov	r1, 3
	mov	r0, x7
	call	__bit_shl
	mov	r0, 255
	mov	x7, rax
	mov	r1, x7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x8
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x8, rax
	mov	r0, x6
	call	__bit_and
	mov	r0, rax
	mov	r1, x7
	call	__bit_shl
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x5], rax
	mov	r0, x3
	call	__bit_shr
	mov	r1, 3
	mov	x5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x3, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, -4
	mov	x5, rax
	call	__bit_and
	mov	x4, rax
	mov	x6, [x4]
	mov	r1, 3
	mov	r0, x5
	call	__bit_shl
	mov	r0, 255
	mov	x5, rax
	mov	r1, x5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x4], rax
	mov	r0, x2
	call	__bit_shl
	mov	r0, rax
	add	r0, x13
	mov	x2, r0
	mov	r1, 2
add	x2, 1
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	x3, x1
	mov	r1, 3
add	x3, 1
	mov	r0, x1
	call	__bit_and
	mov	r1, -4
	mov	x5, rax
	call	__bit_and
	mov	x1, rax
	mov	x6, [x1]
	mov	r1, 3
	mov	r0, x5
	call	__bit_shl
	mov	r0, 255
	mov	x5, rax
	mov	r1, x5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x1], rax
	mov	r0, x2
	call	__bit_shr
	mov	r1, 3
	mov	x1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x1, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x2, rax
	call	__bit_and
	mov	x3, rax
	mov	x4, [x3]
	mov	r1, 3
	mov	r0, x2
	call	__bit_shl
	mov	r0, 255
	mov	x2, rax
	mov	r1, x2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
add	x15, -4
	jg	x0, x14, .LBB116_66
	jmp	.LBB116_67
.LBB116_67:                             // %.loopexit97.loopexit
                                        //   in Loop: Header=BB116_34 Depth=1
	mov	x0, 0
	sub	x0, x15
.LBB116_68:                             // %.loopexit97
                                        //   in Loop: Header=BB116_34 Depth=1
	mov	r0, 100
	jl	t7, r0, .LBB116_70
	jmp	.LBB116_69
.LBB116_69:                             // %memcpy.exit50
                                        //   in Loop: Header=BB116_34 Depth=1
	mov	x2, r5
	mov	r1, 65532
	add	x2, r4
	mov	r0, t7
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shr
	mul	rax, 5243
	mov	r1, 17
	mov	r0, rax
	call	__bit_shr
	mov	x1, rax
	mov	r0, x1
	mul	r0, -100
	add	r0, t7
	mov	r1, 65535
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_shl
	add	x2, t2
	sub	x2, x0
	mov	r0, rax
	mov	x3, x2
	add	r0, x13
add	x3, -2
	mov	t7, r0
	mov	r1, 2
add	t7, 1
	call	__bit_shr
	mov	r1, 3
	mov	x4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	r1, 3
add	x2, -1
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x5, rax
	call	__bit_and
	mov	x3, rax
	mov	x6, [x3]
	mov	r1, 3
	mov	r0, x5
	call	__bit_shl
	mov	r0, 255
	mov	x5, rax
	mov	r1, x5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x3], rax
	mov	r0, t7
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t7, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -4
	mov	x3, rax
	call	__bit_and
	mov	x2, rax
	mov	x4, [x2]
	mov	r1, 3
	mov	r0, x3
	call	__bit_shl
	mov	r0, 255
	mov	x3, rax
	mov	r1, x3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, t7
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x2], rax
	mov	r0, x0
	call	__bit_or
	mov	x0, rax
	mov	t7, x1
.LBB116_70:                             //   in Loop: Header=BB116_34 Depth=1
	jl	t7, x12, .LBB116_72
	jmp	.LBB116_71
.LBB116_71:                             // %memcpy.exit51.loopexit
                                        //   in Loop: Header=BB116_34 Depth=1
	mov	r2, r5
	mov	r1, 1
	add	r2, r4
	mov	r0, t7
	call	__bit_shl
	add	r2, t2
	sub	r2, x0
	mov	r0, rax
	mov	x0, r2
	add	r0, x13
add	x0, -2
	mov	t7, r0
	mov	r1, 2
add	t7, 1
	call	__bit_shr
	mov	r1, 3
	mov	x1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	mov	r1, 3
add	r2, -1
	mov	r0, x0
	call	__bit_and
	mov	r1, -4
	mov	x2, rax
	call	__bit_and
	mov	x0, rax
	mov	x3, [x0]
	mov	r1, 3
	mov	r0, x2
	call	__bit_shl
	mov	r0, 255
	mov	x2, rax
	mov	r1, x2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x0], rax
	mov	r0, t7
	call	__bit_shr
	mov	r1, 3
	mov	x0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x0]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t7, rax
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	r2, rax
	mov	x1, [r2]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r0, 255
	mov	x0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, t7
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	jmp	.LBB116_73
.LBB116_72:                             //   in Loop: Header=BB116_34 Depth=1
	mov	r1, 48
	mov	r0, t7
	call	__bit_or
	mov	r1, 3
	mov	t7, rax
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	r2, rax
	mov	x1, [r2]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r1, 255
	mov	x0, rax
	mov	r0, t7
	call	__bit_and
	mov	r0, 255
	mov	t7, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, t7
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
.LBB116_73:                             // %memcpy.exit51
                                        //   in Loop: Header=BB116_34 Depth=1
	add	r4, t2
.LBB116_74:                             //   in Loop: Header=BB116_34 Depth=1
	mov	t2, 1
	mov	r0, t5
	mov	t5, t6
	jg	r0, t2, .LBB116_34
	jmp	.LBB116_77
.LBB116_75:                             //   in Loop: Header=BB116_38 Depth=2
add	t5, -1
	jg	t5, x9, .LBB116_38
	jmp	.LBB116_76
.LBB116_76:                             // %.loopexit100
	mov	r0, r5
	add	r0, r4
	mov	r1, 3
add	r4, 1
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	t4, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t4
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t4, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, t4
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
.LBB116_77:                             // %.loopexit102
	jz	r6, .LBB116_79
	jmp	.LBB116_78
.LBB116_78:
	mov	r0, r5
	add	r0, r4
	mov	r1, 3
add	r4, 1
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	t4, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t4
	mov	r1, rax
	call	__bit_and
	mov	r0, 46
	mov	t4, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, t4
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
.LBB116_79:
	mov	r0, -1
	mov	t2, [rsp+5]
	jg	t2, r0, .LBB116_168
	jmp	.LBB116_80
.LBB116_80:
	mov	r0, -52
	jl	t2, r0, .LBB116_82
	jmp	.LBB116_81
.LBB116_81:
	mov	r1, 9
	mov	r0, r6
	call	__udivsi3
	mov	t4, rax
	mov	t6, 0
	jmp	.LBB116_100
.LBB116_82:
	mov	r0, t2
	call	__bit_not
	mul	rax, 78913
	mov	r1, 18
	mov	r0, rax
	call	__bit_shr
add	rax, -15
	mov	r1, 65535
	mov	r0, rax
	call	__bit_and
	mul	rax, 58255
	mov	r1, 19
	mov	r0, rax
	call	__bit_shr
	mov	r2, rax
	mov	r0, 1
	sub	r0, r2
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	r2, -1
add	rax, 1
	mov	r0, rax
	mov	r1, r2
	call	__bit_and
	mov	r1, 9
	mov	r3, rax
	mov	r0, r6
	call	__udivsi3
	mov	t4, rax
	jge	t4, r3, .LBB116_98
	jmp	.LBB116_83
.LBB116_83:
	mov	r3, r5
	add	r3, r4
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r2, r6
	jz	rax, .LBB116_87
	jmp	.LBB116_84
.LBB116_84:                             // %.preheader81.preheader
	add	r5, r4
add	r5, 1
	mov	r0, r3
	mov	r2, r6
.LBB116_85:                             // %.preheader81
                                        // =>This Inner Loop Header: Depth=1
	jz	r2, .LBB116_97
	jmp	.LBB116_86
.LBB116_86:                             //   in Loop: Header=BB116_85 Depth=1
add	r2, -1
	mov	r3, r0
	mov	r1, 3
add	r3, 1
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	t1, rax
	mov	t2, [t1]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t2, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[t1], rax
	mov	r0, r5
	call	__bit_and
add	r5, 1
	mov	r0, r3
	jnz	rax, .LBB116_85
	jmp	.LBB116_87
.LBB116_87:                             // %.loopexit7.i52
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB116_94
	jmp	.LBB116_88
.LBB116_88:
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB116_90
	jmp	.LBB116_89
.LBB116_89:                             // %.preheader.i54.preheader
	mov	r5, -2147483633
	jmp	.LBB116_92
.LBB116_90:                             // %.preheader440
	mov	r5, -2147483645
	jmp	.LBB116_93
.LBB116_91:
	mov	r0, 3
	jg	r2, r0, .LBB116_90
	jmp	.LBB116_94
.LBB116_92:                             // %.preheader.i54
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r3
add	r0, 4
	mov	[r3], 808464432
	mov	r1, r3
add	r1, 8
	mov	[r0], 808464432
	mov	r0, r3
add	r0, 12
	mov	[r1], 808464432
add	r3, 16
add	r2, -16
	mov	r1, -2147483648
	mov	[r0], 808464432
	mov	r0, r2
	call	__bit_xor
	jg	rax, r5, .LBB116_92
	jmp	.LBB116_91
.LBB116_93:                             // =>This Inner Loop Header: Depth=1
	mov	[r3], 808464432
add	r2, -4
add	r3, 4
	mov	r0, r2
	call	__bit_xor
	jg	rax, r5, .LBB116_93
	jmp	.LBB116_94
.LBB116_94:                             // %.loopexit5.i53
	jz	r2, .LBB116_97
	jmp	.LBB116_95
.LBB116_95:                             // %.preheader80.preheader
	mov	t1, r3
.LBB116_96:                             // %.preheader80
                                        // =>This Inner Loop Header: Depth=1
add	r2, -1
	mov	r1, 3
add	t1, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r3, rax
	mov	r7, [r3]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	r7, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r3, t1
	jnz	r2, .LBB116_96
	jmp	.LBB116_97
.LBB116_97:                             // %memset.exit55
	add	r4, r6
	jmp	.LBB116_183
.LBB116_98:
	mov	t6, 0
	jz	r3, .LBB116_100
	jmp	.LBB116_99
.LBB116_99:
	mov	r0, r5
	add	r0, r4
	mov	r2, r3
	mul	r2, 9
	mov	r1, 48
	call	memset
	add	r4, r2
	mov	t6, r3
.LBB116_100:
	mov	r2, 0
	sub	r2, t2
	jge	t6, t4, .LBB116_102
	jmp	.LBB116_101
.LBB116_101:
	mov	r0, t6
	mul	r0, 9
add	r0, 9
	jg	r0, r2, .LBB116_103
	jmp	.LBB116_102
.LBB116_102:
	mov	r0, t4
	mul	r0, 9
	mov	r1, r0
	sub	r1, r6
add	r1, 9
	mov	[rsp+1], r1
	mov	r1, r4
	add	r1, r6
	call	__bit_not
	mov	t5, rax
	mov	r0, rsp
	mov	r3, rsp
	mov	t0, rsp
	mov	t7, rsp
	mov	t3, rsp
	add	t5, r1
	add	t5, r5
add	r0, 4
	mov	[rsp+4], r0
add	r3, 8
	mov	[rsp+3], r3
add	t0, 12
	mov	[rsp+2], t0
add	t7, 16
add	t3, 20
	mov	t2, -2147483645
	mov	x13, mcasm_static_5e6e12c67207ca8d73d385863abbfac5
	jmp	.LBB116_118
.LBB116_103:                            // %.loopexit90
	mul	t6, -9
	mov	r3, r5
	add	r3, r4
	mov	r1, 3
	add	t6, r6
	mov	r0, r3
	call	__bit_and
	mov	r2, t6
	jz	rax, .LBB116_107
	jmp	.LBB116_104
.LBB116_104:                            // %.preheader84.preheader
	add	r5, r4
add	r5, 1
	mov	r0, r3
	mov	r2, t6
.LBB116_105:                            // %.preheader84
                                        // =>This Inner Loop Header: Depth=1
	jz	r2, .LBB116_117
	jmp	.LBB116_106
.LBB116_106:                            //   in Loop: Header=BB116_105 Depth=1
add	r2, -1
	mov	r3, r0
	mov	r1, 3
add	r3, 1
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t1, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r7], rax
	mov	r0, r5
	call	__bit_and
add	r5, 1
	mov	r0, r3
	jnz	rax, .LBB116_105
	jmp	.LBB116_107
.LBB116_107:                            // %.loopexit7.i56
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB116_114
	jmp	.LBB116_108
.LBB116_108:
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB116_110
	jmp	.LBB116_109
.LBB116_109:                            // %.preheader.i58.preheader
	mov	r5, -2147483633
	jmp	.LBB116_112
.LBB116_110:                            // %.preheader450
	mov	r5, -2147483645
	jmp	.LBB116_113
.LBB116_111:
	mov	r0, 3
	jg	r2, r0, .LBB116_110
	jmp	.LBB116_114
.LBB116_112:                            // %.preheader.i58
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r3
add	r0, 4
	mov	[r3], 808464432
	mov	r1, r3
add	r1, 8
	mov	[r0], 808464432
	mov	r0, r3
add	r0, 12
	mov	[r1], 808464432
add	r3, 16
add	r2, -16
	mov	r1, -2147483648
	mov	[r0], 808464432
	mov	r0, r2
	call	__bit_xor
	jg	rax, r5, .LBB116_112
	jmp	.LBB116_111
.LBB116_113:                            // =>This Inner Loop Header: Depth=1
	mov	[r3], 808464432
add	r2, -4
add	r3, 4
	mov	r0, r2
	call	__bit_xor
	jg	rax, r5, .LBB116_113
	jmp	.LBB116_114
.LBB116_114:                            // %.loopexit5.i57
	jz	r2, .LBB116_117
	jmp	.LBB116_115
.LBB116_115:                            // %.preheader83.preheader
	mov	r7, r3
.LBB116_116:                            // %.preheader83
                                        // =>This Inner Loop Header: Depth=1
add	r2, -1
	mov	r1, 3
add	r7, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r3, rax
	mov	r6, [r3]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	r6, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r3, r7
	jnz	r2, .LBB116_116
	jmp	.LBB116_117
.LBB116_117:                            // %memset.exit59
	add	r4, t6
	jmp	.LBB116_183
.LBB116_118:                            // =>This Loop Header: Depth=1
                                        //     Child Loop BB116_127 Depth 2
                                        //     Child Loop BB116_130 Depth 2
	mov	x14, t6
add	t6, 1
	mov	x15, r2
	mov	r0, r2
	mov	r1, t6
	mov	r2, rsp
	call	ryu_fill_pow10_split_2_exp
	mov	r0, [rsp+4]
	mov	x0, [r0]
	mov	x2, [rsp+6]
	mov	r1, 0
	mov	r3, 0
	mov	r0, x0
	mov	r2, r7
	call	__muldi3
	mov	x3, rax
	mov	x4, t0
	mov	r0, x2
	call	__muldi3
	mov	r1, 31
	mov	r2, t0
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	add	x3, r2
	mov	r1, 31
	add	x1, x4
	mov	r0, x3
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 0
	mov	x3, rax
	mov	r0, x2
	mov	r2, t1
	call	__muldi3
	add	x3, t0
	add	x1, x3
	mov	r1, 31
	mov	r0, x1
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 0
	mov	x2, rax
	mov	r0, x0
	call	__muldi3
	mov	x4, rax
	mov	r2, t0
	mov	r1, 31
	add	x4, x1
	mov	r0, x3
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	add	x5, r2
	mov	r0, [rsp+3]
	mov	r0, [r0]
	mov	r1, [rsp+2]
	mov	x0, [r1]
	mov	r1, 0
	add	x5, x2
	mov	r2, r7
	call	__muldi3
	mov	x6, rax
	mov	x1, t0
	mov	r2, t1
	call	__muldi3
	mov	x7, rax
	mov	x8, t0
	mov	r0, x0
	mov	r2, r7
	call	__muldi3
	mov	x9, rax
	mov	x10, t0
	mov	r2, t1
	call	__muldi3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r2, x9
	mov	r3, x10
	call	__adddi3
	mov	x1, t0
	mov	r0, rax
	mov	r2, x7
	mov	r3, x8
	call	__adddi3
	mov	x7, rax
	mov	x0, t0
	mov	r0, x6
	mov	r2, x4
	mov	r3, x5
	call	__adddi3
	mov	r2, 0
	mov	r1, t0
	mov	r0, rax
	mov	r3, x7
	call	__adddi3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r3
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	r3, x5
	mov	r1, 31
	mov	x5, rax
	mov	r0, r3
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	r2, x4
	mov	r1, 31
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	x5, 1
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r0, [t7]
	mov	x5, [t3]
	mov	r1, 0
	mov	r3, 0
	mov	x4, rax
	mov	r2, r7
	call	__muldi3
	mov	x6, rax
	mov	x7, t0
	mov	r2, t1
	call	__muldi3
	mov	x8, rax
	mov	x9, t0
	mov	r0, x5
	mov	r2, r7
	call	__muldi3
	mov	x10, rax
	mov	x11, t0
	mov	r2, t1
	call	__muldi3
	mov	x5, rax
	mov	x12, t0
	mov	r0, x7
	mov	r2, x10
	mov	r3, x11
	call	__adddi3
	mov	x7, t0
	mov	r0, rax
	mov	r2, x8
	mov	r3, x9
	call	__adddi3
	mov	x8, rax
	mov	x9, t0
	mov	r0, x6
	mov	r2, x2
	mov	r3, x3
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x1
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x0
	call	__adddi3
	mov	r2, 0
	mov	x0, rax
	mov	x1, t0
	mov	r0, x0
	mov	r1, x1
	mov	r3, x8
	call	__adddi3
	mov	r1, 0
	mov	x2, t0
	mov	r0, x7
	mov	r2, x5
	mov	r3, x12
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x9
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x4
	call	__adddi3
	mov	r1, -512
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	call	__bit_and
	mov	r2, 0
	mov	r3, 1000000000
	mov	x5, rax
	mov	r1, x4
	call	__umoddi3
	mov	r1, 1073741823
	mov	r0, t0
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, x5
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x3
	mov	r3, x4
	call	__adddi3
	mov	r1, -512
	mov	x3, rax
	mov	r0, x0
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	x4, rax
	mov	r0, x2
	mov	r1, x3
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x2
	mov	r3, x3
	call	__adddi3
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, x4
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x0
	mov	r3, x1
	call	__adddi3
	je	x14, t4, .LBB116_131
	jmp	.LBB116_119
.LBB116_119:                            //   in Loop: Header=BB116_118 Depth=1
	mov	r2, r5
	add	r2, r4
	jz	rax, .LBB116_121
	jmp	.LBB116_120
.LBB116_120:                            // %memcpy.exit60
                                        //   in Loop: Header=BB116_118 Depth=1
	mov	x4, r2
	mov	r1, 10000
add	x4, 7
	mov	r0, rax
	mov	r3, rax
	call	__udivsi3
	mov	x0, rax
	mov	r0, x0
	mul	r0, -10000
	add	r0, r3
	mov	r1, 100
	call	__udivsi3
	mov	x1, rax
	mov	t0, x1
	mul	t0, -100
	add	t0, r0
	mov	r1, 1
	mov	r0, t0
	call	__bit_shl
	mov	r0, rax
	add	r0, x13
	mov	x2, r0
	mov	r1, 2
add	x2, 1
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	mov	x3, r2
	mov	r1, 3
add	x3, 8
	mov	r0, x4
	call	__bit_and
	mov	r1, -4
	mov	x6, rax
	call	__bit_and
	mov	x4, rax
	mov	x7, [x4]
	mov	r1, 3
	mov	r0, x6
	call	__bit_shl
	mov	r0, 255
	mov	x6, rax
	mov	r1, x6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x6
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x4], rax
	mov	r0, x2
	call	__bit_shr
	mov	r1, 3
	mov	x4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x2, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x4, rax
	call	__bit_and
	mov	x3, rax
	mov	x5, [x3]
	mov	r1, 3
	mov	r0, x4
	call	__bit_shl
	mov	r0, 255
	mov	x4, rax
	mov	r1, x4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	x3, r2
	mov	r1, 1
add	x3, 5
	mov	r0, x1
	call	__bit_shl
	mov	r0, rax
	add	r0, x13
	mov	x1, r0
	mov	r1, 2
add	x1, 1
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	x2, r2
	mov	r1, 3
add	x2, 6
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x5, rax
	call	__bit_and
	mov	x3, rax
	mov	x6, [x3]
	mov	r1, 3
	mov	r0, x5
	call	__bit_shl
	mov	r0, 255
	mov	x5, rax
	mov	r1, x5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x3], rax
	mov	r0, x1
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -4
	mov	x3, rax
	call	__bit_and
	mov	x2, rax
	mov	x4, [x2]
	mov	r1, 3
	mov	r0, x3
	call	__bit_shl
	mov	r0, 255
	mov	x3, rax
	mov	r1, x3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 100000000
	mov	[x2], rax
	mov	r0, r3
	call	__udivsi3
	mov	r3, rax
	mov	r0, r3
	mul	r0, -10000
	add	r0, x0
	mov	r1, 100
	call	__udivsi3
	mov	x0, rax
	mov	t0, x0
	mul	t0, -100
	add	t0, r0
	mov	r1, 1
	mov	r0, t0
	call	__bit_shl
	mov	r0, rax
	mov	x3, r2
	add	r0, x13
add	x3, 3
	mov	x1, r0
	mov	r1, 2
add	x1, 1
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	x2, r2
	mov	r1, 3
add	x2, 4
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x5, rax
	call	__bit_and
	mov	x3, rax
	mov	x6, [x3]
	mov	r1, 3
	mov	r0, x5
	call	__bit_shl
	mov	r0, 255
	mov	x5, rax
	mov	r1, x5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x3], rax
	mov	r0, x1
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -4
	mov	x3, rax
	call	__bit_and
	mov	x2, rax
	mov	x4, [x2]
	mov	r1, 3
	mov	r0, x3
	call	__bit_shl
	mov	r0, 255
	mov	x3, rax
	mov	r1, x3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x2], rax
	mov	r0, x0
	call	__bit_shl
	mov	r0, rax
	add	r0, x13
	mov	x1, r2
add	x1, 1
	mov	x0, r0
	mov	r1, 2
add	x0, 1
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, -4
	mov	x3, rax
	call	__bit_and
	mov	x1, rax
	mov	x4, [x1]
	mov	r1, 3
	mov	r0, x3
	call	__bit_shl
	mov	r0, 255
	mov	x3, rax
	mov	r1, x3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	mov	x1, r2
	mov	r1, 2
add	x1, 2
	mov	r0, x0
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, -4
	mov	x2, rax
	call	__bit_and
	mov	x1, rax
	mov	x3, [x1]
	mov	r1, 3
	mov	r0, x2
	call	__bit_shl
	mov	r0, 255
	mov	x2, rax
	mov	r1, x2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	mov	r1, 3
add	r3, 48
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	r2, rax
	mov	x1, [r2]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r0, 255
	mov	x0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	jmp	.LBB116_149
.LBB116_121:                            //   in Loop: Header=BB116_118 Depth=1
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	x0, 9
	mov	r3, r2
	jz	rax, .LBB116_126
	jmp	.LBB116_122
.LBB116_122:                            // %.preheader88.preheader
                                        //   in Loop: Header=BB116_118 Depth=1
	mov	r3, r2
add	r3, 1
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	x1, rax
	mov	x2, [x1]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r0, 255
	mov	x0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x2, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[x1], rax
	mov	r0, r3
	call	__bit_and
	mov	x0, 8
	jz	rax, .LBB116_126
	jmp	.LBB116_123
.LBB116_123:                            // %.preheader88.1
                                        //   in Loop: Header=BB116_118 Depth=1
	mov	x1, r2
add	x1, 2
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	r3, rax
	mov	x2, [r3]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r0, 255
	mov	x0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x2, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r3], rax
	mov	r0, x1
	call	__bit_and
	mov	x0, 7
	mov	r3, x1
	jz	rax, .LBB116_126
	jmp	.LBB116_124
.LBB116_124:                            // %.preheader88.2
                                        //   in Loop: Header=BB116_118 Depth=1
	mov	r3, r2
add	r3, 3
	mov	r0, x1
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	x1, rax
	mov	x2, [x1]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r0, 255
	mov	x0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x2, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[x1], rax
	mov	r0, r3
	call	__bit_and
	mov	x0, 6
	jz	rax, .LBB116_126
	jmp	.LBB116_125
.LBB116_125:                            // %.preheader88.3
                                        //   in Loop: Header=BB116_118 Depth=1
add	r2, 4
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	r3, rax
	mov	x1, [r3]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r0, 255
	mov	x0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x1, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	x0, 5
	mov	r3, r2
.LBB116_126:                            // %.thread73.preheader
                                        //   in Loop: Header=BB116_118 Depth=1
.LBB116_127:                            // %.thread73
                                        //   Parent Loop BB116_118 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	[r3], 808464432
add	x0, -4
	mov	r1, -2147483648
add	r3, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, t2, .LBB116_127
	jmp	.LBB116_128
.LBB116_128:                            // %.loopexit5.i65
                                        //   in Loop: Header=BB116_118 Depth=1
	jz	x0, .LBB116_149
	jmp	.LBB116_129
.LBB116_129:                            // %.preheader87.preheader
                                        //   in Loop: Header=BB116_118 Depth=1
	mov	x3, 0
.LBB116_130:                            // %.preheader87
                                        //   Parent Loop BB116_118 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, r3
	add	r0, x3
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	x1, rax
	mov	x2, [x1]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
add	x3, 1
	mov	[x1], rax
	je	x0, x3, .LBB116_149
	jmp	.LBB116_130
.LBB116_131:
	mov	t6, rax
	mul	t4, -9
	add	t4, r6
	mov	r1, 9
	mov	r0, 0
	mov	t2, [rsp+5]
	je	t4, r1, .LBB116_135
	jmp	.LBB116_132
.LBB116_132:
	mov	r0, 1
	mov	r2, [rsp+1]
	sub	r0, r2
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
add	r2, -1
	mov	r0, rax
	mov	r1, r2
	call	__bit_and
	mov	r2, rax
add	r2, 1
	mov	rax, t6
	mov	r1, 10
	jmp	.LBB116_134
.LBB116_133:
	mov	t6, rax
	mov	r0, rax
	mul	r0, -10
	add	r0, r3
	mov	r1, 5
	je	r0, r1, .LBB116_136
	jmp	.LBB116_135
.LBB116_134:                            // =>This Inner Loop Header: Depth=1
	mov	r3, rax
	mov	r0, r3
	call	__udivsi3
add	r2, -1
	jz	r2, .LBB116_133
	jmp	.LBB116_134
.LBB116_135:
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, -2147483643
	sub	r0, rax
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	jmp	.LBB116_142
.LBB116_136:
	mov	r0, r6
	call	__bit_not
	mov	r3, rax
	sub	r3, t2
	mov	r0, 1
	mov	r2, 2
	jl	r3, r0, .LBB116_142
	jmp	.LBB116_137
.LBB116_137:
	mov	r0, 59
	mov	r2, 1
	jg	r3, r0, .LBB116_142
	jmp	.LBB116_138
.LBB116_138:
	mov	r0, r7
	mov	r1, t1
	call	__bit_or
	jnz	rax, .LBB116_140
	jmp	.LBB116_139
.LBB116_139:
	call	abort
.LBB116_140:
	mov	r1, 31
	mov	r0, r3
	call	__bit_and
	mov	r2, rax
	mov	r1, 0
	sub	r1, r2
	mov	r6, 0
	mov	r0, r2
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	r3, -32
	mov	t2, rax
	mov	r0, r3
	call	__bit_shr
	mov	r0, -1
	mov	r3, rax
	mov	r1, r2
	call	__bit_shl
	mov	t3, 0
	sub	t3, r3
	mov	r3, rax
	mov	r0, t3
	call	__bit_not
	mov	r0, r3
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	sub	r0, r2
	mov	r1, 31
	mov	r2, rax
	call	__bit_and
	mov	r0, -1
	mov	r1, rax
	call	__bit_shr
	sub	r6, t2
	mov	r0, rax
	mov	r1, r6
	call	__bit_and
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, t3
	call	__bit_and
	mov	r0, rax
	mov	r1, r2
	call	__bit_or
	mov	r2, rax
	mov	r0, r3
	mov	r1, t3
	call	__bit_and
	mov	r1, rax
	mov	r0, r2
	call	__bit_not
	mov	r2, rax
	mov	r0, r1
	call	__bit_not
	mov	r3, rax
	mov	r0, t1
	mov	r1, r2
	call	__bit_and
	mov	r2, rax
	mov	r0, r7
	mov	r1, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r2
	call	__bit_or
	mov	r2, 2
	jz	rax, .LBB116_142
	jmp	.LBB116_141
.LBB116_141:
	mov	r2, 1
.LBB116_142:
	jz	t4, .LBB116_151
	jmp	.LBB116_143
.LBB116_143:
	mov	r6, t4
add	r6, -1
	mov	r3, 0
	mov	r7, t6
	jz	r6, .LBB116_146
	jmp	.LBB116_144
.LBB116_144:
	mov	x0, mcasm_static_5e6e12c67207ca8d73d385863abbfac5
	mov	r0, r7
.LBB116_145:                            // %memcpy.exit68
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 100
	call	__udivsi3
	mov	r7, rax
	mov	r1, r7
	mul	r1, -100
	add	r0, r1
	mov	r1, 1
	call	__bit_shl
	mov	r0, rax
	mov	t2, t5
	add	r0, x0
add	t2, -1
	mov	t1, r0
	mov	r1, 2
add	t1, 1
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t3, rax
	mov	r0, t2
	call	__bit_and
	mov	r1, -4
	mov	t6, rax
	call	__bit_and
	mov	t2, rax
	mov	t7, [t2]
	mov	r1, 3
	mov	r0, t6
	call	__bit_shl
	mov	r0, 255
	mov	t6, rax
	mov	r1, t6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t7, rax
	mov	r0, t3
	call	__bit_and
	mov	r0, rax
	mov	r1, t6
	call	__bit_shl
	mov	r0, t7
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[t2], rax
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t1, rax
	mov	r0, t5
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	t3, rax
	mov	t6, [t3]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r0, 255
	mov	t2, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t6, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t6
	mov	r1, rax
	call	__bit_or
	mov	[t3], rax
add	r3, 2
	mov	r1, -2147483648
add	t5, -2
	mov	r0, r6
	call	__bit_xor
	mov	t1, rax
	mov	r0, r3
	call	__bit_xor
	mov	r0, r7
	jl	rax, t1, .LBB116_145
	jmp	.LBB116_146
.LBB116_146:                            // %.loopexit
	mov	r6, r7
	mov	r1, -2147483648
	mov	r0, t4
	call	__bit_xor
	mov	r7, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r7, .LBB116_148
	jmp	.LBB116_147
.LBB116_147:
	mov	r7, r5
	mov	r1, 10
	add	r7, r4
	mov	r0, r6
	call	__umodsi3
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r6, rax
	mov	r0, r3
	call	__bit_not
	add	r7, t4
	add	r7, rax
	mov	r1, 3
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
.LBB116_148:
	add	r4, t4
	jmp	.LBB116_151
.LBB116_149:                            // %memset.exit67
                                        //   in Loop: Header=BB116_118 Depth=1
add	r4, 9
add	t5, 9
	mov	r2, x15
	jge	t6, t4, .LBB116_118
	jmp	.LBB116_150
.LBB116_150:                            // %memset.exit67
                                        //   in Loop: Header=BB116_118 Depth=1
	mov	r0, t6
	mul	r0, 9
add	r0, 9
	jg	r0, r2, .LBB116_103
	jmp	.LBB116_118
.LBB116_151:
	jz	r2, .LBB116_183
	jmp	.LBB116_152
.LBB116_152:
	jz	r4, .LBB116_154
	jmp	.LBB116_153
.LBB116_153:                            // %.preheader86.preheader
	mov	t2, r5
add	t2, -1
	mov	r3, 0
	mov	t3, 46
	mov	t4, 57
	mov	r6, r4
	mov	t5, r6
	jmp	.LBB116_155
.LBB116_154:
	mov	r1, 3
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r6, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 49
	mov	r6, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB116_162
.LBB116_155:                            // %.preheader86
                                        // =>This Inner Loop Header: Depth=1
	mov	r7, t2
	add	r7, r6
	mov	r1, 2
add	t5, -1
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	rax, t3, .LBB116_158
	jmp	.LBB116_156
.LBB116_156:                            // %.preheader86
                                        //   in Loop: Header=BB116_155 Depth=1
	je	rax, t4, .LBB116_163
	jmp	.LBB116_157
.LBB116_157:                            // %.preheader86
	mov	r0, 45
	je	rax, r0, .LBB116_159
	jmp	.LBB116_164
.LBB116_158:                            // %.preheader86._crit_edge27
                                        //   in Loop: Header=BB116_155 Depth=1
	mov	r3, t5
	jmp	.LBB116_167
.LBB116_159:                            // %.preheader86._crit_edge
	mov	r0, r6
.LBB116_160:
	add	r0, r5
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 49
	mov	r7, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	r0, 1
	mov	[r6], rax
	jl	r3, r0, .LBB116_162
	jmp	.LBB116_161
.LBB116_161:
	add	r3, r5
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	r7, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
add	r3, 1
	mov	r1, 3
	mov	[r6], rax
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r6, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 46
	mov	r6, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
.LBB116_162:
	add	r5, r4
	mov	r1, 3
add	r4, 1
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB116_183
.LBB116_163:                            //   in Loop: Header=BB116_155 Depth=1
	mov	r1, 3
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	r7, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
	mov	r2, 1
	jmp	.LBB116_167
.LBB116_164:
	mov	r1, 1
	mov	r3, rax
	mov	r0, rax
	call	__bit_and
	mov	r0, 2
	jne	r2, r0, .LBB116_166
	jmp	.LBB116_165
.LBB116_165:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB116_183
	jmp	.LBB116_166
.LBB116_166:
	add	r6, r5
add	r6, -1
	mov	r1, 3
	mov	r2, r3
add	r2, 1
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r1, 255
	mov	r3, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, 255
	mov	r2, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r6, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	jmp	.LBB116_183
.LBB116_167:                            //   in Loop: Header=BB116_155 Depth=1
	mov	r0, 0
	mov	r6, t5
	jz	t5, .LBB116_160
	jmp	.LBB116_155
.LBB116_168:
	mov	r3, r5
	add	r3, r4
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r2, r6
	jz	rax, .LBB116_172
	jmp	.LBB116_169
.LBB116_169:                            // %.preheader92.preheader
	add	r5, r4
add	r5, 1
	mov	r0, r3
	mov	r2, r6
.LBB116_170:                            // %.preheader92
                                        // =>This Inner Loop Header: Depth=1
	jz	r2, .LBB116_182
	jmp	.LBB116_171
.LBB116_171:                            //   in Loop: Header=BB116_170 Depth=1
add	r2, -1
	mov	r3, r0
	mov	r1, 3
add	r3, 1
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	t1, rax
	mov	t2, [t1]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t2, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[t1], rax
	mov	r0, r5
	call	__bit_and
add	r5, 1
	mov	r0, r3
	jnz	rax, .LBB116_170
	jmp	.LBB116_172
.LBB116_172:                            // %.loopexit7.i69
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB116_179
	jmp	.LBB116_173
.LBB116_173:
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB116_175
	jmp	.LBB116_174
.LBB116_174:                            // %.preheader.i71.preheader
	mov	r5, -2147483633
	jmp	.LBB116_177
.LBB116_175:                            // %.preheader481
	mov	r5, -2147483645
	jmp	.LBB116_178
.LBB116_176:
	mov	r0, 3
	jg	r2, r0, .LBB116_175
	jmp	.LBB116_179
.LBB116_177:                            // %.preheader.i71
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r3
add	r0, 4
	mov	[r3], 808464432
	mov	r1, r3
add	r1, 8
	mov	[r0], 808464432
	mov	r0, r3
add	r0, 12
	mov	[r1], 808464432
add	r3, 16
add	r2, -16
	mov	r1, -2147483648
	mov	[r0], 808464432
	mov	r0, r2
	call	__bit_xor
	jg	rax, r5, .LBB116_177
	jmp	.LBB116_176
.LBB116_178:                            // =>This Inner Loop Header: Depth=1
	mov	[r3], 808464432
add	r2, -4
add	r3, 4
	mov	r0, r2
	call	__bit_xor
	jg	rax, r5, .LBB116_178
	jmp	.LBB116_179
.LBB116_179:                            // %.loopexit5.i70
	jz	r2, .LBB116_182
	jmp	.LBB116_180
.LBB116_180:                            // %.preheader91.preheader
	mov	t1, r3
.LBB116_181:                            // %.preheader91
                                        // =>This Inner Loop Header: Depth=1
add	r2, -1
	mov	r1, 3
add	t1, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r3, rax
	mov	r7, [r3]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	r7, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r3, t1
	jnz	r2, .LBB116_181
	jmp	.LBB116_182
.LBB116_182:                            // %memset.exit72
	add	r4, r6
.LBB116_183:                            // %memcpy.exit38
	mov	rax, r4
	mov	x15, [rsp+12]
	mov	x14, [rsp+13]
	mov	x13, [rsp+14]
	mov	x12, [rsp+15]
	mov	x11, [rsp+16]
	mov	x10, [rsp+17]
	mov	x9, [rsp+18]
	mov	x8, [rsp+19]
	mov	x7, [rsp+20]
	mov	x6, [rsp+21]
	mov	x5, [rsp+22]
	mov	x4, [rsp+23]
	mov	x3, [rsp+24]
	mov	x2, [rsp+25]
	mov	x1, [rsp+26]
	mov	x0, [rsp+27]
add	rsp, 112
	ret
// -- End function
// -- Begin function ryu_fill_pow10_split_exp
ryu_fill_pow10_split_exp:               // @ryu_fill_pow10_split_exp
// %bb.0:
sub	rsp, 144
	mov	r3, r1
	mov	r5, r3
	mul	r5, -9
	add	r5, r0
add	r5, 128
	mov	r0, -1
	mov	r4, r2
	jg	r5, r0, .LBB117_2
	jmp	.LBB117_1
.LBB117_1:
	mov	[r4], 1
	mov	r0, r4
add	r0, 4
	mov	[r0], 0
	mov	r0, r4
add	r0, 8
	mov	r1, r4
add	r1, 12
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, r4
add	r0, 16
add	r4, 20
	mov	[r4], 0
	mov	[r0], 0
	jmp	.LBB117_19
.LBB117_2:
	mov	r6, rsp
	mov	r7, rsp
	mov	t1, rsp
	mov	t3, rsp
	mov	t2, rsp
	mov	t5, rsp
	mov	t4, rsp
	mov	t6, rsp
add	r6, 4
add	r7, 8
	mov	[r7], 0
	mov	[r6], 0
add	t1, 12
add	t3, 16
	mov	[t3], 0
	mov	[t1], 0
add	t2, 20
add	t5, 24
	mov	[t5], 0
	mov	[t2], 0
add	t4, 28
add	t6, 32
	mov	[t6], -2147483648
	mov	[t4], 0
	mov	r0, -255
	jz	r3, .LBB117_9
	jmp	.LBB117_3
.LBB117_3:
	mov	[rsp], -255
	mov	[r7], 0
	mov	[r6], 0
	mov	[t3], 0
	mov	[t1], 0
	mov	[t5], 0
	mov	[t2], 0
	mov	[t6], -2147483648
	mov	[t4], 0
	mov	[rsp+27], -276
	mov	[r7], -209245859
	mov	[r6], 606470823
	mov	[t3], -36215714
	mov	[t1], 18528969
	mov	[t5], 828902024
	mov	[t2], -124440528
	mov	[t6], -1989124287
	mov	[t4], 917808535
.LBB117_4:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	jz	rax, .LBB117_6
	jmp	.LBB117_5
.LBB117_5:                              //   in Loop: Header=BB117_4 Depth=1
	mov	r0, rsp
	mov	r1, rsp
	mov	r2, rsp
	call	ryu_dyadic256_quick_mul
	mov	r0, [t6]
	mov	[t6], r0
	mov	r0, [t4]
	mov	r1, [t5]
	mov	r2, [t2]
	mov	t0, [t3]
	mov	[t4], r0
	mov	[t5], r1
	mov	[t2], r2
	mov	[t3], t0
	mov	r0, [t1]
	mov	r1, [r7]
	mov	r2, [r6]
	mov	t0, [rsp+18]
	mov	[t1], r0
	mov	[r7], r1
	mov	[r6], r2
	mov	[rsp], t0
.LBB117_6:                              //   in Loop: Header=BB117_4 Depth=1
	mov	r1, 1
	mov	r0, r3
	call	__bit_shr
	mov	r3, rax
	jz	r3, .LBB117_8
	jmp	.LBB117_7
.LBB117_7:                              //   in Loop: Header=BB117_4 Depth=1
	mov	r0, rsp
	mov	r1, rsp
	mov	r2, rsp
	call	ryu_dyadic256_quick_mul
	mov	r0, [t6]
	mov	[t6], r0
	mov	r0, [t4]
	mov	r1, [t5]
	mov	r2, [t2]
	mov	t0, [t3]
	mov	[t4], r0
	mov	[t5], r1
	mov	[t2], r2
	mov	[t3], t0
	mov	r0, [t1]
	mov	r1, [r7]
	mov	r2, [r6]
	mov	t0, [rsp+18]
	mov	[t1], r0
	mov	[r7], r1
	mov	[r6], r2
	mov	[rsp+27], t0
	jmp	.LBB117_4
.LBB117_8:
	mov	r0, [r6]
	mov	r1, [r7]
	mov	r2, [t1]
	mov	[r6], r0
	mov	r0, [t3]
	mov	[r7], r1
	mov	[t1], r2
	mov	r1, [t6]
	mov	[t3], r0
	mov	r2, [t2]
	mov	r0, [rsp]
	mov	[t6], r1
	mov	r1, [t5]
	mov	r3, [t4]
	mov	[rsp+9], r0
	mov	r0, [rsp+9]
	mov	[t2], r2
	mov	[t5], r1
	mov	[t4], r3
.LBB117_9:
	add	r0, r5
	mov	[rsp+9], r0
	mov	r0, rsp
	mov	r1, rsp
	call	ryu_dyadic256_as_mantissa_type
	mov	r1, [r6]
	mov	r0, [rsp+27]
	mov	r2, 1
	mov	r3, 0
	call	__adddi3
	mov	r6, rax
	mov	r5, t0
	call	__bit_and
	mov	t1, [t1]
	mov	r7, [r7]
	mov	r0, -1
	jne	rax, r0, .LBB117_13
	jmp	.LBB117_10
.LBB117_10:
	mov	r0, r7
	mov	r1, t1
	call	__adddi3
	mov	r7, rax
	mov	t1, t0
	mov	r0, r7
	mov	r1, t1
	call	__bit_or
	jnz	rax, .LBB117_13
	jmp	.LBB117_11
.LBB117_11:
	mov	r1, [t2]
	mov	r0, [t3]
	call	__adddi3
	mov	r1, t0
	mov	[t2], r1
	mov	[t3], rax
	mov	r0, rax
	call	__bit_or
	mov	r7, 0
	mov	t1, 0
	jnz	rax, .LBB117_13
	jmp	.LBB117_12
.LBB117_12:
	mov	r1, [t4]
	mov	r0, [t5]
	call	__adddi3
	mov	[t4], t0
	mov	[t5], rax
.LBB117_13:
	mov	t2, [t2]
	mov	t4, [t4]
	mov	t5, [t5]
	mov	t3, [t3]
	mov	r0, t5
	mov	r1, t4
	call	__bit_or
	jnz	rax, .LBB117_17
	jmp	.LBB117_14
.LBB117_14:
	mov	r1, 1000000000
	mov	r0, t3
	call	__bit_xor
	mov	r0, rax
	mov	r1, t2
	call	__bit_or
	jnz	rax, .LBB117_16
	jmp	.LBB117_15
.LBB117_15:
	mov	r0, r7
	mov	r1, r6
	call	__bit_or
	mov	r2, rax
	mov	r0, t1
	mov	r1, r5
	call	__bit_or
	mov	r0, r2
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	t2, 0
	mov	t3, 1000000000
	mov	rax, 1000000000
	jz	r0, .LBB117_18
	jmp	.LBB117_17
.LBB117_16:
	mov	r0, t2
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, t3
add	r0, -1000000001
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, t3
	jnz	r0, .LBB117_18
	jmp	.LBB117_17
.LBB117_17:
	mov	r2, 1000000000
	mov	r0, t5
	mov	r1, t4
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t5
	mov	r3, t4
	call	__adddi3
	mov	r2, 1000000000
	mov	r3, 0
	mov	t4, rax
	mov	r0, t2
	mov	r1, t4
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t2
	mov	r3, t4
	call	__adddi3
	mov	r1, -512
	mov	t4, rax
	mov	r0, t3
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, rax
	mov	r1, t4
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t3
	mov	r3, t2
	call	__adddi3
	mov	t2, 0
.LBB117_18:
	mov	[r4], r6
	mov	r0, r4
add	r0, 4
	mov	[r0], r5
	mov	r0, r4
add	r0, 8
	mov	r1, r4
add	r1, 12
	mov	[r1], t1
	mov	[r0], r7
	mov	r0, r4
add	r0, 16
add	r4, 20
	mov	[r4], t2
	mov	[r0], rax
.LBB117_19:
add	rsp, 144
	ret
// -- End function
// -- Begin function ryu_mul_shift_mod1e9_exact
ryu_mul_shift_mod1e9_exact:             // @ryu_mul_shift_mod1e9_exact
// %bb.0:
sub	rsp, 72
	mov	[rsp+17], x0
	mov	[rsp+16], x1
	mov	[rsp+15], x2
	mov	[rsp+14], x3
	mov	[rsp+13], x4
	mov	[rsp+12], x5
	mov	[rsp+11], x6
	mov	[rsp+10], x7
	mov	[rsp+9], x8
	mov	t1, r3
	mov	t4, r2
	mov	t2, r1
	mov	t3, r0
	mov	x7, rsp
	mov	x8, rsp
	mov	x6, rsp
add	x7, 24
add	x8, 16
	mov	r1, t4
add	r1, 4
	mov	r0, [t4]
	mov	r5, [r1]
	mov	r1, 0
	mov	r3, 0
add	x6, 8
	mov	r2, t3
	call	__muldi3
	mov	r4, rax
	mov	r6, t0
	mov	r2, t2
	call	__muldi3
	mov	r7, rax
	mov	t5, t0
	mov	r0, r5
	mov	r2, t3
	call	__muldi3
	mov	t6, rax
	mov	t7, t0
	mov	r2, t2
	call	__muldi3
	mov	x0, rax
	mov	x1, t0
	mov	r0, r6
	mov	r2, t6
	mov	r3, t7
	call	__adddi3
	mov	r6, t0
	mov	r0, rax
	mov	r2, r7
	mov	r3, t5
	call	__adddi3
	mov	r5, rax
	mov	r7, t0
	mov	r0, rsp
add	r0, 4
	mov	[r0], r5
	mov	[rsp], r4
	mov	r0, r6
	mov	r2, x0
	mov	r3, x1
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, r7
	call	__adddi3
	mov	r0, t4
add	r0, 8
	mov	r1, t4
add	r1, 12
	mov	r0, [r0]
	mov	r6, [r1]
	mov	r1, 0
	mov	t6, rax
	mov	t7, t0
	mov	r2, t3
	call	__muldi3
	mov	r7, rax
	mov	t5, t0
	mov	r2, t2
	call	__muldi3
	mov	x3, rax
	mov	x4, t0
	mov	r0, r6
	mov	r2, t3
	call	__muldi3
	mov	x2, rax
	mov	x5, t0
	mov	r2, t2
	call	__muldi3
	mov	x0, rax
	mov	x1, t0
	mov	r0, t5
	mov	r2, x2
	mov	r3, x5
	call	__adddi3
	mov	x2, t0
	mov	r0, rax
	mov	r2, x3
	mov	r3, x4
	call	__adddi3
	mov	r3, 0
	mov	r6, rax
	mov	t5, t0
	mov	r0, t6
	mov	r1, t7
	mov	r2, r7
	call	__adddi3
	mov	r2, 0
	mov	r1, t0
	mov	r0, rax
	mov	r3, r6
	call	__adddi3
	mov	r7, rax
	mov	r6, t0
	mov	r0, rsp
add	r0, 12
	mov	[r0], r6
	mov	[x6], r7
	mov	r0, r6
	mov	r1, t7
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, r6
	sub	r0, t7
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, r7
	sub	r0, t6
	mov	r1, 31
	mov	x3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, x3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	mov	r1, 0
	add	x3, rax
	mov	r0, x2
	mov	r2, x0
	mov	r3, x1
	call	__adddi3
	mov	r1, 1
	mov	t6, rax
	mov	t7, t0
	mov	r0, x3
	call	__bit_and
	mov	r0, t4
add	r0, 16
add	t4, 20
	mov	r0, [r0]
	mov	x0, [t4]
	mov	r1, 0
	mov	r3, 0
	mov	t4, rax
	mov	r2, t3
	call	__muldi3
	mov	x1, rax
	mov	x2, t0
	mov	r2, t2
	call	__muldi3
	mov	x3, rax
	mov	x4, t0
	mov	r0, x0
	mov	r2, t3
	call	__muldi3
	mov	t3, rax
	mov	x5, t0
	mov	r2, t2
	call	__muldi3
	mov	t2, rax
	mov	x6, t0
	mov	r0, x2
	mov	r2, t3
	mov	r3, x5
	call	__adddi3
	mov	t3, t0
	mov	r0, rax
	mov	r2, x3
	mov	r3, x4
	call	__adddi3
	mov	r3, 0
	mov	x0, rax
	mov	x2, t0
	mov	r0, t6
	mov	r1, t7
	mov	r2, x1
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t5
	call	__adddi3
	mov	r2, 0
	mov	r1, t0
	mov	r0, rax
	mov	r3, x0
	call	__adddi3
	mov	x0, rax
	mov	t7, t0
	mov	r0, rsp
add	r0, 20
	mov	[r0], t7
	mov	r1, 0
	mov	[x8], x0
	mov	r0, t3
	mov	r2, t2
	mov	r3, x6
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x2
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t4
	call	__adddi3
	mov	t2, rax
	mov	r2, t0
	mov	r0, rsp
add	r0, 28
	mov	[r0], r2
	mov	[x7], t2
	mov	x1, t2
	mov	x2, r2
	jz	t1, .LBB118_17
	jmp	.LBB118_1
.LBB118_1:
	mov	r1, -2147483648
	mov	r0, t1
	call	__bit_xor
	mov	r0, -2147483393
	mov	x1, 0
	mov	x2, 0
	mov	x0, 0
	mov	t7, 0
	mov	r7, 0
	mov	r6, 0
	mov	r4, 0
	mov	r5, 0
	jg	rax, r0, .LBB118_17
	jmp	.LBB118_2
.LBB118_2:
	mov	r1, 6
	mov	r0, t1
	call	__bit_shr
	mov	r1, 63
	mov	r3, rax
	call	__bit_and
	mov	t3, rax
	mov	r1, 3
	mov	x3, 3
	mov	r0, r3
	call	__bit_shl
	mov	t5, rax
	add	t5, rsp
	mov	r4, [t5]
	mov	r0, t5
add	r0, 4
	mov	r5, [r0]
	jnz	t3, .LBB118_6
	jmp	.LBB118_3
.LBB118_3:
	mov	r0, 191
	jg	t1, r0, .LBB118_17
	jmp	.LBB118_4
.LBB118_4:
	mov	r0, t5
add	r0, 8
	mov	r1, t5
add	r1, 12
	mov	r6, [r1]
	mov	r7, [r0]
	mov	r0, 127
	jg	t1, r0, .LBB118_17
	jmp	.LBB118_5
.LBB118_5:
	mov	r0, t5
add	r0, 16
add	t5, 20
	mov	t7, [t5]
	mov	x0, [r0]
	jmp	.LBB118_17
.LBB118_6:
	mov	t6, 64
	mov	r1, 31
	sub	t6, t3
	mov	r0, t3
	call	__bit_and
	mov	r7, rax
	mov	r1, 0
	sub	r1, r7
	mov	r0, r7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	t4, t3
add	t4, -32
	mov	t7, rax
	mov	r0, t4
	call	__bit_shr
	mov	x0, rax
	mov	r0, r5
	mov	r1, r7
	call	__bit_shr
	sub	x1, x0
	mov	x0, rax
	mov	r0, x1
	call	__bit_not
	mov	r0, x0
	mov	r1, rax
	call	__bit_and
	mov	x2, rax
	mov	r0, r4
	mov	r1, r7
	call	__bit_shr
	mov	r4, rax
	mov	r0, 32
	sub	r0, r7
	mov	r1, 31
	mov	r7, 32
	call	__bit_and
	mov	r0, r5
	mov	r1, rax
	call	__bit_shl
	mov	r1, 0
	sub	r1, t7
	mov	r0, rax
	call	__bit_and
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r4, rax
	mov	r0, x0
	mov	r1, x1
	call	__bit_and
	mov	r5, rax
	je	r3, x3, .LBB118_8
	jmp	.LBB118_7
.LBB118_7:
	mov	r0, t5
add	r0, 8
	mov	r1, t5
add	r1, 12
	mov	t7, [r1]
	mov	x0, [r0]
	mov	r1, 31
	mov	r0, t6
	call	__bit_and
	mov	x1, rax
	mov	r1, 0
	sub	r1, x1
	mov	r0, x1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, t6
add	r0, -32
	mov	x2, rax
	call	__bit_shr
	mov	x3, rax
	mov	r0, x0
	mov	r1, x1
	call	__bit_shl
	mov	x4, 0
	sub	x4, x3
	mov	x3, rax
	mov	r0, x4
	call	__bit_not
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	x5, rax
	mov	r0, t7
	mov	r1, x1
	call	__bit_shl
	sub	r7, x1
	mov	r1, 31
	mov	t7, rax
	mov	r0, r7
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x2
	mov	r0, rax
	call	__bit_and
	mov	r0, t7
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_or
	mov	r7, rax
	mov	r0, x3
	mov	r1, x4
	call	__bit_and
	mov	t7, rax
	mov	r0, r7
	mov	r1, r5
	call	__bit_or
	mov	r5, rax
	mov	r0, t7
	mov	r1, r4
	call	__bit_or
	mov	r4, rax
.LBB118_8:
	mov	r0, 191
	mov	r7, 0
	mov	x0, 0
	mov	t7, 0
	jg	t1, r0, .LBB118_15
	jmp	.LBB118_9
.LBB118_9:
	mov	x1, r3
add	x1, 1
	mov	r1, 3
	mov	x6, 3
	mov	r0, x1
	call	__bit_shl
	mov	x2, rax
	add	x2, rsp
	mov	r6, [x2]
	mov	r0, x2
add	r0, 4
	mov	r7, [r0]
	mov	r1, 31
	mov	r0, t3
	call	__bit_and
	mov	x3, rax
	mov	r1, 0
	sub	r1, x3
	mov	r0, x3
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x4, rax
	mov	r0, t4
	call	__bit_shr
	mov	x5, rax
	mov	r0, 32
	sub	r0, x3
	mov	x0, 32
	call	__bit_and
	mov	r0, r7
	mov	r1, rax
	call	__bit_shl
	mov	r1, 0
	sub	r1, x4
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	r0, r6
	mov	r1, x3
	call	__bit_shr
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	r6, 0
	sub	r6, x5
	mov	r0, rax
	mov	r1, r6
	call	__bit_and
	mov	x4, rax
	mov	r0, r7
	mov	r1, x3
	call	__bit_shr
	mov	x3, rax
	mov	r0, r6
	call	__bit_not
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r7, rax
	mov	r0, x3
	mov	r1, r6
	call	__bit_and
	mov	r6, rax
	je	x1, x6, .LBB118_11
	jmp	.LBB118_10
.LBB118_10:
	mov	r0, x2
add	r0, 8
add	x2, 12
	mov	x2, [x2]
	mov	x3, [r0]
	mov	r1, 31
	mov	r0, t6
	call	__bit_and
	mov	x1, rax
	mov	r1, 0
	sub	r1, x1
	mov	r0, x1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, t6
add	r0, -32
	mov	x4, rax
	call	__bit_shr
	mov	x5, rax
	mov	r0, x3
	mov	r1, x1
	call	__bit_shl
	mov	x6, 0
	sub	x6, x5
	mov	x5, rax
	mov	r0, x6
	call	__bit_not
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	x7, rax
	mov	r0, x2
	mov	r1, x1
	call	__bit_shl
	sub	x0, x1
	mov	r1, 31
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r0, x3
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x4
	mov	r0, rax
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	mov	x0, rax
	mov	r0, x5
	mov	r1, x6
	call	__bit_and
	mov	x1, rax
	mov	r0, x0
	mov	r1, r6
	call	__bit_or
	mov	r6, rax
	mov	r0, x1
	mov	r1, r7
	call	__bit_or
	mov	r7, rax
	mov	r0, 127
	mov	x0, 0
	jg	t1, r0, .LBB118_15
	jmp	.LBB118_13
.LBB118_11:
	mov	x1, 0
	mov	r0, 127
	mov	x2, 0
	mov	x0, 0
	jg	t1, r0, .LBB118_17
	jmp	.LBB118_12
.LBB118_12:
	mov	r0, t5
add	r0, 16
	mov	t1, [r0]
	mov	r0, t5
add	r0, 20
	mov	t7, [r0]
	mov	r1, 31
	mov	r0, t3
	call	__bit_and
	mov	x0, rax
	mov	r1, 0
	sub	r1, x0
	mov	r0, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x2, rax
	mov	r0, t4
	call	__bit_shr
	mov	x3, rax
	mov	r0, t7
	mov	r1, x0
	call	__bit_shr
	mov	x4, 0
	sub	x4, x3
	mov	x3, rax
	mov	r0, x4
	call	__bit_not
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	x5, rax
	mov	r0, t1
	mov	r1, x0
	call	__bit_shr
	mov	r0, 32
	sub	r0, x0
	mov	r1, 31
	mov	t1, rax
	call	__bit_and
	mov	r0, t7
	mov	r1, rax
	call	__bit_shl
	sub	x1, x2
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_or
	mov	x0, rax
	mov	r0, x3
	mov	r1, x4
	call	__bit_and
	mov	t7, rax
	jmp	.LBB118_14
.LBB118_13:
	mov	r1, 31
	mov	r0, t3
	call	__bit_and
	mov	t1, rax
	mov	r1, 0
	sub	r1, t1
	mov	x1, 0
	mov	r0, t1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	t7, rax
	mov	r0, t4
	call	__bit_shr
	mov	x0, rax
	mov	r0, x2
	mov	r1, t1
	call	__bit_shr
	mov	x4, 0
	sub	x4, x0
	mov	x5, rax
	mov	r0, x4
	call	__bit_not
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	x0, rax
	mov	r0, x3
	mov	r1, t1
	call	__bit_shr
	mov	r0, 32
	sub	r0, t1
	mov	r1, 31
	mov	t1, rax
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_shl
	mov	r1, 0
	sub	r1, t7
	mov	r0, rax
	call	__bit_and
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	x0, rax
	mov	r0, x5
	mov	r1, x4
	call	__bit_and
	mov	t7, rax
	mov	r0, 1
	mov	x2, 0
	je	r3, r0, .LBB118_17
	jmp	.LBB118_14
.LBB118_14:
	mov	r0, t5
add	r0, 24
add	t5, 28
	mov	t1, [t5]
	mov	t5, [r0]
	mov	r1, 31
	mov	r0, t6
	call	__bit_and
	mov	x1, rax
	mov	r1, 0
	sub	r1, x1
	mov	x2, 0
	mov	r0, x1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	t6, -32
	mov	x3, rax
	mov	r0, t6
	call	__bit_shr
	mov	t6, rax
	mov	r0, t5
	mov	r1, x1
	call	__bit_shl
	mov	x4, 0
	sub	x4, t6
	mov	t6, rax
	mov	r0, x4
	call	__bit_not
	mov	r0, t6
	mov	r1, rax
	call	__bit_and
	mov	x5, rax
	mov	r0, t1
	mov	r1, x1
	call	__bit_shl
	mov	r0, 32
	sub	r0, x1
	mov	r1, 31
	mov	t1, rax
	call	__bit_and
	mov	r0, t5
	mov	r1, rax
	call	__bit_shr
	sub	x2, x3
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_or
	mov	t1, rax
	mov	r0, t6
	mov	r1, x4
	call	__bit_and
	mov	t5, rax
	mov	r0, t1
	mov	r1, t7
	call	__bit_or
	mov	t7, rax
	mov	r0, t5
	mov	r1, x0
	call	__bit_or
	mov	x0, rax
.LBB118_15:
	mov	r1, 31
	mov	r0, t3
	call	__bit_and
	mov	t1, rax
	mov	r1, 0
	sub	r1, t1
	mov	r0, t1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	t3, rax
	mov	r0, t4
	call	__bit_shr
	mov	t4, rax
	mov	r0, r2
	mov	r1, t1
	call	__bit_shr
	mov	t5, 0
	sub	t5, t4
	mov	t4, rax
	mov	r0, t5
	call	__bit_not
	mov	r0, t4
	mov	r1, rax
	call	__bit_and
	mov	t6, rax
	mov	r0, t2
	mov	r1, t1
	call	__bit_shr
	mov	r0, 32
	sub	r0, t1
	mov	r1, 31
	mov	t1, rax
	call	__bit_and
	mov	r0, r2
	mov	r1, rax
	call	__bit_shl
	mov	r1, 0
	sub	r1, t3
	mov	r0, rax
	call	__bit_and
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, t5
	call	__bit_and
	mov	r0, rax
	mov	r1, t6
	call	__bit_or
	mov	x1, rax
	mov	r0, t4
	mov	r1, t5
	call	__bit_and
	mov	x2, rax
	jz	r3, .LBB118_17
	jmp	.LBB118_16
.LBB118_16:
	mov	x1, 0
	mov	x2, 0
.LBB118_17:
	mov	r1, -512
	mov	r0, x1
	call	__bit_and
	mov	r2, 0
	mov	r3, 1000000000
	mov	t1, rax
	mov	r1, x2
	call	__umoddi3
	mov	r1, 1073741823
	mov	r0, t0
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, t1
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x1
	mov	r3, x2
	call	__adddi3
	mov	r1, -512
	mov	t1, rax
	mov	r0, x0
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	t2, rax
	mov	r0, t7
	mov	r1, t1
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t7
	mov	r3, t1
	call	__adddi3
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, t2
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x0
	mov	r3, t7
	call	__adddi3
	mov	r1, -512
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	t2, rax
	mov	r0, r6
	mov	r1, t1
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, r6
	mov	r3, t1
	call	__adddi3
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, t2
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, r7
	mov	r3, r6
	call	__adddi3
	mov	r1, -512
	mov	r6, rax
	mov	r0, r4
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	r7, rax
	mov	r0, r5
	mov	r1, r6
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, r5
	mov	r3, r6
	call	__adddi3
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, r7
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, r4
	mov	r3, r5
	call	__adddi3
	mov	x8, [rsp+9]
	mov	x7, [rsp+10]
	mov	x6, [rsp+11]
	mov	x5, [rsp+12]
	mov	x4, [rsp+13]
	mov	x3, [rsp+14]
	mov	x2, [rsp+15]
	mov	x1, [rsp+16]
	mov	x0, [rsp+17]
add	rsp, 72
	ret
// -- End function
// -- Begin function ryu_fill_pow10_split_2_exp
ryu_fill_pow10_split_2_exp:             // @ryu_fill_pow10_split_2_exp
// %bb.0:
sub	rsp, 144
	mov	r4, r2
	mov	r5, r1
	mov	r3, r0
	mov	t2, rsp
	mov	r6, rsp
	mov	t3, rsp
	mov	t4, rsp
	mov	t5, rsp
	mov	t6, rsp
	mov	r7, rsp
	mov	t7, rsp
	mov	[rsp+9], -255
add	t2, 8
	mov	[t2], 0
add	r6, 4
	mov	[r6], 0
add	t3, 16
	mov	[t3], 0
add	t4, 12
	mov	[t4], 0
add	t5, 24
	mov	[t5], 0
add	t6, 20
	mov	[t6], 0
add	r7, 32
	mov	[r7], -2147483648
add	t7, 28
	mov	[t7], 0
	mov	[rsp], -255
	mov	[t2], 0
	mov	[r6], 0
	mov	[t3], 0
	mov	[t4], 0
	mov	[t5], 0
	mov	[t6], 0
	mov	[r7], -2147483648
	mov	[t7], 0
	mov	[rsp+27], -226
	mov	[t2], 0
	mov	[r6], 0
	mov	[t3], 0
	mov	[t4], 0
	mov	[t5], 0
	mov	[t6], 0
	mov	[r7], -294967296
	mov	[t7], 0
.LBB119_1:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 1
	mov	r0, r5
	call	__bit_and
	jz	rax, .LBB119_3
	jmp	.LBB119_2
.LBB119_2:                              //   in Loop: Header=BB119_1 Depth=1
	mov	r0, rsp
	mov	r1, rsp
	mov	r2, rsp
	call	ryu_dyadic256_quick_mul
	mov	r0, [r7]
	mov	[r7], r0
	mov	r0, [t7]
	mov	r1, [t5]
	mov	r2, [t6]
	mov	t0, [t3]
	mov	[t7], r0
	mov	[t5], r1
	mov	[t6], r2
	mov	[t3], t0
	mov	r0, [t4]
	mov	r1, [t2]
	mov	r2, [r6]
	mov	t0, [rsp+18]
	mov	[t4], r0
	mov	[t2], r1
	mov	[r6], r2
	mov	[rsp], t0
.LBB119_3:                              //   in Loop: Header=BB119_1 Depth=1
	mov	r1, 1
	mov	r0, r5
	call	__bit_shr
	mov	r5, rax
	jz	r5, .LBB119_5
	jmp	.LBB119_4
.LBB119_4:                              //   in Loop: Header=BB119_1 Depth=1
	mov	r0, rsp
	mov	r1, rsp
	mov	r2, rsp
	call	ryu_dyadic256_quick_mul
	mov	r0, [r7]
	mov	[r7], r0
	mov	r0, [t7]
	mov	r1, [t5]
	mov	r2, [t6]
	mov	t0, [t3]
	mov	[t7], r0
	mov	[t5], r1
	mov	[t6], r2
	mov	[t3], t0
	mov	r0, [t4]
	mov	r1, [t2]
	mov	r2, [r6]
	mov	t0, [rsp+18]
	mov	[t4], r0
	mov	[t2], r1
	mov	[r6], r2
	mov	[rsp+27], t0
	jmp	.LBB119_1
.LBB119_5:
	mov	r0, [r6]
	mov	r1, [t2]
	mov	r2, [t4]
	mov	[r6], r0
	mov	r0, [t3]
	mov	[t2], r1
	mov	[t4], r2
	mov	r1, [r7]
	mov	[t3], r0
	mov	r0, [t6]
	mov	r2, [rsp]
	mov	[r7], r1
	mov	r1, [t5]
	mov	r5, [t7]
	mov	[rsp+9], r2
	mov	r2, [rsp+9]
	mov	[t6], r0
	mov	[t5], r1
	mov	[t7], r5
	sub	r2, r3
add	r2, 128
	mov	[rsp+9], r2
	mov	r0, rsp
	mov	r1, rsp
	call	ryu_dyadic256_as_mantissa_type
	mov	r7, [r6]
	mov	t1, [rsp+27]
	mov	r6, [t4]
	mov	r5, [t2]
	mov	t2, [t6]
	mov	t4, [t7]
	mov	t5, [t5]
	mov	t3, [t3]
	mov	r0, t5
	mov	r1, t4
	call	__bit_or
	jnz	rax, .LBB119_9
	jmp	.LBB119_6
.LBB119_6:
	mov	r1, 1000000000
	mov	r0, t3
	call	__bit_xor
	mov	r0, rax
	mov	r1, t2
	call	__bit_or
	jnz	rax, .LBB119_8
	jmp	.LBB119_7
.LBB119_7:
	mov	r0, r5
	mov	r1, t1
	call	__bit_or
	mov	r2, rax
	mov	r0, r6
	mov	r1, r7
	call	__bit_or
	mov	r0, r2
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	t2, 0
	mov	t3, 1000000000
	mov	rax, 1000000000
	jz	r0, .LBB119_10
	jmp	.LBB119_9
.LBB119_8:
	mov	r0, t2
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, t3
add	r0, -1000000001
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, t3
	jnz	r0, .LBB119_10
	jmp	.LBB119_9
.LBB119_9:
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, t5
	mov	r1, t4
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t5
	mov	r3, t4
	call	__adddi3
	mov	r2, 1000000000
	mov	r3, 0
	mov	t4, rax
	mov	r0, t2
	mov	r1, t4
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t2
	mov	r3, t4
	call	__adddi3
	mov	r1, -512
	mov	t4, rax
	mov	r0, t3
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, rax
	mov	r1, t4
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t3
	mov	r3, t2
	call	__adddi3
	mov	t2, 0
.LBB119_10:
	mov	[r4], t1
	mov	r0, r4
add	r0, 4
	mov	[r0], r7
	mov	r0, r4
add	r0, 8
	mov	r1, r4
add	r1, 12
	mov	[r1], r6
	mov	[r0], r5
	mov	r0, r4
add	r0, 16
add	r4, 20
	mov	[r4], t2
	mov	[r0], rax
add	rsp, 144
	ret
// -- End function
// -- Begin function ryu_dyadic256_quick_mul
ryu_dyadic256_quick_mul:                // @ryu_dyadic256_quick_mul
// %bb.0:
sub	rsp, 120
	mov	[rsp+29], x0
	mov	[rsp+28], x1
	mov	[rsp+27], x2
	mov	[rsp+26], x3
	mov	[rsp+25], x4
	mov	[rsp+24], x5
	mov	[rsp+23], x6
	mov	[rsp+22], x7
	mov	[rsp+21], x8
	mov	[rsp+20], x9
	mov	[rsp+19], x10
	mov	[rsp+18], x11
	mov	[rsp+17], x12
	mov	[rsp+16], x13
	mov	[rsp+15], x14
	mov	[rsp+14], x15
	mov	r3, [r2]
	add	r3, [r1]
	mov	[rsp], r3
add	r3, 256
	mov	[rsp+12], r0
	mov	[r0], r3
add	r0, 4
	mov	[rsp+11], r0
	mov	r0, r1
add	r0, 4
	mov	r3, r2
add	r3, 4
	mov	x3, [r3]
	mov	r3, r2
add	r3, 8
	mov	x2, [r3]
	mov	r3, r2
add	r3, 12
	mov	t7, [r3]
	mov	r3, r2
add	r3, 16
	mov	t6, [r3]
	mov	r3, r2
add	r3, 20
	mov	t4, [r3]
	mov	r3, r2
add	r3, 24
	mov	r7, [r3]
	mov	r3, r2
add	r3, 28
	mov	r4, [r3]
add	r2, 32
	mov	t1, [r2]
	mov	r5, [r0]
	mov	r0, r1
add	r0, 8
	mov	x6, [r0]
	mov	r0, r1
add	r0, 12
	mov	x1, [r0]
	mov	r0, r1
add	r0, 16
	mov	x0, [r0]
	mov	r0, r1
add	r0, 20
	mov	t5, [r0]
	mov	r0, r1
add	r0, 24
	mov	t3, [r0]
	mov	r0, r1
add	r0, 28
	mov	x14, [r0]
add	r1, 32
	mov	r6, [r1]
	mov	r1, 0
	mov	r3, 0
	mov	r0, x0
	mov	r2, r7
	call	__muldi3
	mov	t2, rax
	mov	x5, t0
	mov	r0, x6
	mov	r2, t1
	call	__muldi3
	mov	x7, rax
	mov	x8, t0
	mov	r0, r5
	mov	r2, r4
	call	__muldi3
	mov	x4, rax
	mov	x9, t0
	mov	r0, x6
	call	__muldi3
	mov	r3, t0
	mov	r0, x9
	mov	r2, rax
	call	__adddi3
	mov	x6, rax
	mov	r0, t0
	mov	r2, x7
	mov	r3, x8
	call	__adddi3
	mov	r3, 0
	mov	x7, rax
	mov	x8, t0
	mov	r0, r5
	mov	r2, t1
	call	__muldi3
	mov	r3, t0
	mov	r0, x6
	mov	r2, rax
	call	__adddi3
	mov	r3, 0
	mov	x6, rax
	mov	r2, t0
	mov	r0, x7
	mov	r1, x8
	call	__adddi3
	mov	r1, 0
	mov	x8, rax
	mov	x9, t0
	mov	r0, x1
	mov	r2, t4
	call	__muldi3
	mov	r5, rax
	mov	x7, t0
	mov	r0, x0
	call	__muldi3
	mov	r3, t0
	mov	r0, x7
	mov	r2, rax
	call	__adddi3
	mov	r3, 0
	mov	x7, rax
	mov	x11, t0
	mov	r0, x1
	mov	r2, r7
	call	__muldi3
	mov	r3, t0
	mov	r0, x7
	mov	r2, rax
	call	__adddi3
	mov	x10, rax
	mov	x7, t0
	mov	r0, x11
	mov	r2, t2
	mov	r3, x5
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x8
	mov	r3, x9
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x7
	call	__adddi3
	mov	x5, rax
	mov	x7, t0
	mov	r0, x7
	mov	r1, x9
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x7
	sub	r0, x9
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x5
	sub	r0, x8
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r3, 0
	mov	x9, rax
	mov	r0, x4
	mov	r1, x6
	mov	r2, r5
	call	__adddi3
	mov	r2, 0
	mov	r1, t0
	mov	r0, rax
	mov	r3, x10
	call	__adddi3
	mov	r5, rax
	mov	t2, t0
	mov	r0, t2
	mov	r1, x6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, t2
	sub	r0, x6
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, r5
	sub	r0, x4
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r3, 0
	mov	r0, x5
	mov	r1, x7
	mov	r2, rax
	call	__adddi3
	mov	x4, rax
	mov	x8, t0
	mov	r0, x8
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x8
	sub	r0, x7
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x4
	sub	r0, x5
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, 0
	mov	r3, 0
	mov	r0, rax
	mov	r2, x9
	call	__adddi3
	mov	x5, rax
	mov	x7, t0
	mov	[rsp+6], t3
	mov	r0, t3
	mov	r2, t6
	call	__muldi3
	mov	x6, rax
	mov	x9, t0
	mov	r0, t5
	mov	r2, t7
	call	__muldi3
	mov	x11, rax
	mov	x10, t0
	mov	r0, t3
	call	__muldi3
	mov	r3, t0
	mov	r0, x10
	mov	r2, rax
	call	__adddi3
	mov	r3, 0
	mov	x10, rax
	mov	x13, t0
	mov	r0, t5
	mov	r2, t6
	call	__muldi3
	mov	r3, t0
	mov	r0, x10
	mov	r2, rax
	call	__adddi3
	mov	x12, rax
	mov	x10, t0
	mov	r0, x13
	mov	r2, x6
	mov	r3, x9
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x10
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x4
	mov	r3, x8
	call	__adddi3
	mov	x6, rax
	mov	x9, t0
	mov	r0, x9
	mov	r1, x8
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x9
	sub	r0, x8
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x6
	sub	r0, x4
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r3, 0
	mov	r0, x5
	mov	r1, x7
	mov	r2, rax
	call	__adddi3
	mov	x8, rax
	mov	x10, t0
	mov	r0, x11
	mov	r1, x12
	mov	r2, r5
	mov	r3, t2
	call	__adddi3
	mov	x5, rax
	mov	x4, t0
	mov	r0, x4
	mov	r1, t2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x4
	sub	r0, t2
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x5
	sub	r0, r5
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r3, 0
	mov	r0, x6
	mov	r1, x9
	mov	r2, rax
	call	__adddi3
	mov	r5, rax
	mov	x7, t0
	mov	r0, x7
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x7
	sub	r0, x9
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, r5
	sub	r0, x6
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r3, 0
	mov	r0, x8
	mov	r1, x10
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	x8, rax
	mov	x9, t0
	mov	[rsp+3], r6
	mov	r0, r6
	mov	r2, x2
	call	__muldi3
	mov	t2, rax
	mov	x10, t0
	mov	[rsp+13], x14
	mov	r0, x14
	mov	r2, x3
	call	__muldi3
	mov	x6, rax
	mov	x11, t0
	mov	r0, r6
	call	__muldi3
	mov	r3, t0
	mov	r0, x11
	mov	r2, rax
	call	__adddi3
	mov	r3, 0
	mov	x3, rax
	mov	x11, t0
	mov	r0, x14
	mov	r2, x2
	call	__muldi3
	mov	r3, t0
	mov	r0, x3
	mov	r2, rax
	call	__adddi3
	mov	x3, rax
	mov	x2, t0
	mov	r0, x11
	mov	r2, t2
	mov	r3, x10
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x2
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, r5
	mov	r3, x7
	call	__adddi3
	mov	t2, rax
	mov	x2, t0
	mov	r0, x2
	mov	r1, x7
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x2
	sub	r0, x7
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, t2
	sub	r0, r5
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r3, 0
	mov	r0, x8
	mov	r1, x9
	mov	r2, rax
	call	__adddi3
	mov	r5, rax
	mov	x7, t0
	mov	r0, x5
	call	__bit_not
	mov	r2, rax
	mov	r0, x4
	call	__bit_not
	mov	r3, rax
	mov	r0, x3
	mov	r1, r3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	r3, x3
	mov	r1, 31
	mov	x3, rax
	mov	r0, r3
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	r2, x6
	mov	r1, 31
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	x3, 1
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r3, 0
	mov	r0, t2
	mov	r1, x2
	mov	r2, rax
	call	__adddi3
	mov	x3, rax
	mov	x4, t0
	mov	r0, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x4
	sub	r0, x2
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x3
	sub	r0, t2
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r3, 0
	mov	r0, r5
	mov	r1, x7
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	x8, rax
	mov	[rsp+1], x8
	mov	x9, t0
	mov	r0, x1
	mov	r6, r4
	mov	r2, r6
	call	__muldi3
	mov	r5, rax
	mov	x2, t0
	mov	t3, t1
	mov	r2, t3
	call	__muldi3
	mov	x6, rax
	mov	x7, t0
	mov	r0, x0
	mov	r2, r6
	call	__muldi3
	mov	x5, rax
	mov	x10, t0
	mov	r2, t3
	call	__muldi3
	mov	t2, rax
	mov	x1, t0
	mov	r0, x2
	mov	r2, x5
	mov	r3, x10
	call	__adddi3
	mov	x5, t0
	mov	r0, rax
	mov	r2, x6
	mov	r3, x7
	call	__adddi3
	mov	x2, t0
	mov	r0, r5
	mov	r1, rax
	mov	r2, x3
	mov	r3, x4
	call	__adddi3
	mov	r5, rax
	mov	x0, t0
	mov	r0, x0
	mov	r1, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x0
	sub	r0, x4
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, r5
	sub	r0, x3
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, 0
	mov	x3, rax
	mov	r0, x5
	mov	r2, t2
	mov	r3, x1
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x2
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x8
	mov	r3, x9
	call	__adddi3
	mov	r3, 0
	mov	x14, rax
	mov	x15, t0
	mov	r0, x14
	mov	r1, x15
	mov	r2, x3
	call	__adddi3
	mov	r1, 0
	mov	x10, rax
	mov	x11, t0
	mov	r0, t5
	mov	r2, t4
	call	__muldi3
	mov	t2, rax
	mov	x2, t0
	mov	r4, r7
	mov	r2, r4
	call	__muldi3
	mov	x4, rax
	mov	x6, t0
	mov	r0, [rsp+6]
	mov	r2, t4
	call	__muldi3
	mov	x5, rax
	mov	x7, t0
	mov	x8, r0
	mov	r2, r4
	mov	[rsp+5], r4
	call	__muldi3
	mov	x1, rax
	mov	x3, t0
	mov	r0, x2
	mov	r2, x5
	mov	r3, x7
	call	__adddi3
	mov	x5, t0
	mov	r0, rax
	mov	r2, x4
	mov	r3, x6
	call	__adddi3
	mov	x4, t0
	mov	r0, t2
	mov	r1, rax
	mov	r2, r5
	mov	r3, x0
	call	__adddi3
	mov	t2, rax
	mov	x2, t0
	mov	r0, x2
	mov	r1, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x2
	sub	r0, x0
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, t2
	sub	r0, r5
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, 0
	mov	r5, rax
	mov	r0, x5
	mov	r2, x1
	mov	r3, x3
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x4
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x10
	mov	r3, x11
	call	__adddi3
	mov	r3, 0
	mov	x0, rax
	mov	x1, t0
	mov	r0, x0
	mov	r1, x1
	mov	r2, r5
	call	__adddi3
	mov	r1, 0
	mov	x12, rax
	mov	x13, t0
	mov	r0, [rsp+13]
	mov	r2, t7
	call	__muldi3
	mov	x5, rax
	mov	x3, t0
	mov	r7, r0
	mov	r2, t6
	call	__muldi3
	mov	x6, rax
	mov	x7, t0
	mov	r0, [rsp+3]
	mov	r2, t7
	call	__muldi3
	mov	t7, rax
	mov	x4, t0
	mov	t1, r0
	mov	r2, t6
	call	__muldi3
	mov	r5, rax
	mov	t6, t0
	mov	r0, x3
	mov	r2, t7
	mov	r3, x4
	call	__adddi3
	mov	x4, t0
	mov	r0, rax
	mov	r2, x6
	mov	r3, x7
	call	__adddi3
	mov	x3, t0
	mov	r0, x5
	mov	r1, rax
	mov	r2, t2
	mov	r3, x2
	call	__adddi3
	mov	x5, rax
	mov	t7, t0
	mov	r0, t7
	mov	r1, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, t7
	sub	r0, x2
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x5
	sub	r0, t2
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, 0
	mov	t2, rax
	mov	r0, x4
	mov	r2, r5
	mov	r3, t6
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x3
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x12
	mov	r3, x13
	call	__adddi3
	mov	r3, 0
	mov	x4, rax
	mov	t6, t0
	mov	r0, x4
	mov	r1, t6
	mov	r2, t2
	call	__adddi3
	mov	r1, 0
	mov	x6, rax
	mov	x7, t0
	mov	r0, t5
	mov	[rsp+8], r6
	mov	r2, r6
	call	__muldi3
	mov	r5, rax
	mov	t2, t0
	mov	r2, t3
	call	__muldi3
	mov	t5, rax
	mov	x2, t0
	mov	r0, x8
	mov	r2, r6
	call	__muldi3
	mov	r3, t0
	mov	r0, t2
	mov	r2, rax
	call	__adddi3
	mov	t2, t0
	mov	r0, rax
	mov	r2, t5
	mov	r3, x2
	call	__adddi3
	mov	[rsp+2], t0
	mov	r0, r5
	mov	r1, rax
	mov	r2, x6
	mov	r3, x7
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	x2, rax
	mov	x3, t0
	mov	r0, r7
	mov	r2, t4
	call	__muldi3
	mov	r5, rax
	mov	t5, t0
	mov	r2, r4
	call	__muldi3
	mov	r6, rax
	mov	r7, t0
	mov	r0, t1
	mov	r2, t4
	call	__muldi3
	mov	r3, t0
	mov	r0, t5
	mov	r2, rax
	call	__adddi3
	mov	[rsp+4], t0
	mov	r0, rax
	mov	r2, r6
	mov	r3, r7
	call	__adddi3
	mov	r7, t0
	mov	r0, r5
	mov	r1, rax
	mov	r2, x2
	mov	r3, x3
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	t5, rax
	mov	t4, t0
	mov	r0, t1
	mov	r2, t3
	mov	[rsp+7], r2
	call	__muldi3
	mov	[rsp+10], rax
	mov	[rsp+9], t0
	mov	r0, x8
	call	__muldi3
	mov	t3, rax
	mov	r5, t0
	mov	r0, x15
	mov	r1, x9
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x15
	sub	r0, x9
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x14
	mov	r1, [rsp+1]
	sub	r0, r1
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r2, rax
	mov	r0, x11
	mov	r1, x15
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x11
	sub	r0, x15
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x10
	sub	r0, x14
	mov	r1, 31
	mov	r6, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r6
add	r3, 1
	mov	r0, r3
	mov	r1, rax
	call	__bit_and
	add	r6, rax
	mov	r1, 1
	mov	r0, r6
	call	__bit_and
	mov	r1, 0
	mov	r3, 0
	mov	r0, rax
	call	__adddi3
	mov	r2, rax
	mov	x8, t0
	mov	r0, x1
	mov	r1, x11
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x1
	sub	r0, x11
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x0
	sub	r0, x10
	mov	r1, 31
	mov	r6, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r6
add	r3, 1
	mov	r0, r3
	mov	r1, rax
	call	__bit_and
	add	r6, rax
	mov	r1, 1
	mov	r0, r6
	call	__bit_and
	mov	r3, 0
	mov	r0, r2
	mov	r1, x8
	mov	r2, rax
	call	__adddi3
	mov	r2, rax
	mov	x8, t0
	mov	r0, x13
	mov	r1, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x13
	sub	r0, x1
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x12
	sub	r0, x0
	mov	r1, 31
	mov	r6, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r6
add	r3, 1
	mov	r0, r3
	mov	r1, rax
	call	__bit_and
	add	r6, rax
	mov	r1, 1
	mov	r0, r6
	call	__bit_and
	mov	r3, 0
	mov	r0, r2
	mov	r1, x8
	mov	r2, rax
	call	__adddi3
	mov	r2, rax
	mov	x0, t0
	mov	r0, t6
	mov	r1, x13
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, t6
	sub	r0, x13
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x4
	sub	r0, x12
	mov	r1, 31
	mov	r6, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r6
add	r3, 1
	mov	r0, r3
	mov	r1, rax
	call	__bit_and
	add	r6, rax
	mov	r1, 1
	mov	r0, r6
	call	__bit_and
	mov	r3, 0
	mov	r0, r2
	mov	r1, x0
	mov	r2, rax
	call	__adddi3
	mov	r2, rax
	mov	x0, t0
	mov	r0, x7
	mov	r1, t6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x7
	sub	r0, t6
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x6
	sub	r0, x4
	mov	r1, 31
	mov	r6, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r6
add	r3, 1
	mov	r0, r3
	mov	r1, rax
	call	__bit_and
	add	r6, rax
	mov	r1, 1
	mov	r0, r6
	call	__bit_and
	mov	r3, 0
	mov	r0, r2
	mov	r1, x0
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	t6, rax
	mov	r6, t0
	mov	r0, t2
	mov	r2, t3
	mov	r3, r5
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, [rsp+2]
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t6
	mov	r3, r6
	call	__adddi3
	mov	r5, rax
	mov	t3, t0
	mov	r0, t3
	mov	r1, r6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, t3
	sub	r0, r6
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, r5
	sub	r0, t6
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	t2, rax
	mov	r0, x3
	mov	r1, x7
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x3
	sub	r0, x7
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x2
	sub	r0, x6
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r3, 0
	mov	r0, r5
	mov	r1, t3
	mov	r2, rax
	call	__adddi3
	mov	x1, rax
	mov	x4, t0
	mov	r0, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x4
	sub	r0, t3
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x1
	sub	r0, r5
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, 0
	mov	r3, 0
	mov	r5, rax
	mov	r0, t1
	mov	r2, [rsp+5]
	call	__muldi3
	mov	r3, t0
	mov	r0, [rsp+4]
	mov	r2, rax
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, r7
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x1
	mov	r3, x4
	call	__adddi3
	mov	t6, rax
	mov	x0, t0
	mov	r0, x0
	mov	r1, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x0
	sub	r0, x4
	mov	x4, [rsp+11]
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, t6
	sub	r0, x1
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	t3, rax
	mov	r0, t4
	mov	r1, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, t4
	sub	r0, x3
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, t5
	sub	r0, x2
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r3, 0
	mov	r0, t6
	mov	r1, x0
	mov	r2, rax
	call	__adddi3
	mov	x1, rax
	mov	x2, t0
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, x2
	sub	r0, x0
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, x1
	sub	r0, t6
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, 0
	mov	r3, 0
	mov	t6, rax
	mov	x0, [rsp+13]
	mov	r0, x0
	mov	r2, [rsp+8]
	call	__muldi3
	mov	r6, rax
	mov	r7, t0
	mov	r0, t1
	call	__muldi3
	mov	r3, t0
	mov	r0, r7
	mov	r2, rax
	call	__adddi3
	mov	r3, 0
	mov	r7, rax
	mov	t1, t0
	mov	r0, x0
	mov	r4, [rsp+12]
	mov	r2, [rsp+7]
	call	__muldi3
	mov	r3, t0
	mov	r0, r7
	mov	r2, rax
	call	__adddi3
	mov	x0, t0
	mov	r0, r6
	mov	r1, rax
	mov	r2, x1
	mov	r3, x2
	call	__adddi3
	mov	r7, rax
	mov	r6, t0
	mov	r0, r6
	mov	r1, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, r6
	sub	r0, x2
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, r7
	sub	r0, x1
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, 0
	mov	x1, rax
	mov	r0, t1
	mov	r2, [rsp+10]
	mov	r3, [rsp+9]
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x0
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t2
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, r5
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t3
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t6
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x1
	call	__adddi3
	mov	r5, rax
	mov	r3, t0
	mov	t2, r4
add	t2, 8
	mov	[t2], t7
	mov	[x4], x5
	mov	t3, r4
add	t3, 12
	mov	t6, r4
add	t6, 16
	mov	[t6], t4
	mov	[t3], t5
	mov	x0, r4
add	x0, 20
	mov	x1, r4
add	x1, 24
	mov	[x1], r6
	mov	[x0], r7
	mov	x2, r4
add	x2, 28
	mov	x3, r4
add	x3, 32
	mov	[x3], r3
	mov	[x2], r5
	mov	r0, t4
	mov	r1, t7
	call	__bit_or
	mov	r2, rax
	mov	r0, t5
	mov	r1, x5
	call	__bit_or
	mov	r0, rax
	mov	r1, r7
	call	__bit_or
	mov	t1, rax
	mov	r0, r2
	mov	r1, r6
	call	__bit_or
	mov	r0, rax
	mov	r1, r3
	call	__bit_or
	mov	r2, rax
	mov	r0, t1
	mov	r1, r5
	call	__bit_or
	mov	r0, 0
	jl	r3, r0, .LBB120_3
	jmp	.LBB120_1
.LBB120_1:
	mov	r0, rax
	mov	r1, r2
	call	__bit_or
	jz	rax, .LBB120_3
	jmp	.LBB120_2
.LBB120_2:
	mov	r0, [rsp]
add	r0, 255
	mov	r1, 1
	mov	[r4], r0
	mov	r0, r5
	call	__bit_shl
	mov	r1, 31
	mov	r2, rax
	mov	r0, r6
	call	__bit_shr
	mov	r0, r2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r2, rax
	mov	r0, r5
	call	__bit_shr
	mov	r1, 1
	mov	r4, rax
	mov	r0, r3
	call	__bit_shl
	mov	r0, rax
	mov	r1, r4
	call	__bit_or
	mov	r1, 1
	mov	r3, rax
	mov	r0, r7
	call	__bit_shl
	mov	r1, 31
	mov	r4, rax
	mov	r0, t4
	call	__bit_shr
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r4, rax
	mov	r0, r7
	call	__bit_shr
	mov	r1, 1
	mov	r5, rax
	mov	r0, r6
	call	__bit_shl
	mov	r0, rax
	mov	r1, r5
	call	__bit_or
	mov	r1, 1
	mov	r5, rax
	mov	r0, t5
	call	__bit_shl
	mov	r1, 31
	mov	r6, rax
	mov	r0, t7
	call	__bit_shr
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r6, rax
	mov	r0, t5
	call	__bit_shr
	mov	r1, 1
	mov	r7, rax
	mov	r0, t4
	call	__bit_shl
	mov	r0, rax
	mov	r1, r7
	call	__bit_or
	mov	r1, 31
	mov	r7, rax
	mov	r0, x5
	call	__bit_shr
	mov	r1, 1
	mov	t1, rax
	mov	r0, t7
	call	__bit_shl
	mov	r0, rax
	mov	r1, t1
	call	__bit_or
	mov	r1, 1
	mov	t1, rax
	mov	r0, x5
	call	__bit_shl
	mov	[x4], rax
	mov	[t2], t1
	mov	[t6], r7
	mov	[t3], r6
	mov	[x1], r5
	mov	[x0], r4
	mov	[x3], r3
	mov	[x2], r2
.LBB120_3:
	mov	x15, [rsp+14]
	mov	x14, [rsp+15]
	mov	x13, [rsp+16]
	mov	x12, [rsp+17]
	mov	x11, [rsp+18]
	mov	x10, [rsp+19]
	mov	x9, [rsp+20]
	mov	x8, [rsp+21]
	mov	x7, [rsp+22]
	mov	x6, [rsp+23]
	mov	x5, [rsp+24]
	mov	x4, [rsp+25]
	mov	x3, [rsp+26]
	mov	x2, [rsp+27]
	mov	x1, [rsp+28]
	mov	x0, [rsp+29]
add	rsp, 120
	ret
// -- End function
// -- Begin function ryu_dyadic256_as_mantissa_type
ryu_dyadic256_as_mantissa_type:         // @ryu_dyadic256_as_mantissa_type
// %bb.0:
sub	rsp, 88
	mov	[rsp+21], x0
	mov	[rsp+20], x1
	mov	[rsp+19], x2
	mov	[rsp+18], x3
	mov	[rsp+17], x4
	mov	[rsp+16], x5
	mov	[rsp+15], x6
	mov	[rsp+14], x7
	mov	[rsp+13], x8
	mov	[rsp+12], x9
	mov	[rsp+11], x10
	mov	[rsp+10], x11
	mov	[rsp+9], x12
	mov	[rsp+8], x13
	mov	r3, r1
	mov	r7, r3
add	r7, 4
add	r1, 8
	mov	r4, [r1]
	mov	r1, [r7]
	mov	r2, r3
add	r2, 12
	mov	r6, r3
add	r6, 16
	mov	r5, [r2]
	mov	r6, [r6]
	mov	r2, r0
	mov	r0, r5
	call	__bit_or
	mov	r5, rax
	mov	r0, r6
	mov	r1, r4
	call	__bit_or
	mov	r0, r3
add	r0, 20
	mov	r1, r3
add	r1, 24
	mov	r1, [r1]
	mov	r4, [r0]
	mov	r0, rax
	call	__bit_or
	mov	r6, rax
	mov	r0, r5
	mov	r1, r4
	call	__bit_or
	mov	r0, r3
add	r0, 28
	mov	r4, r3
add	r4, 32
	mov	r1, [r0]
	mov	r4, [r4]
	mov	r0, rax
	call	__bit_or
	mov	r5, rax
	mov	r0, r6
	mov	r1, r4
	call	__bit_or
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	jnz	rax, .LBB121_2
	jmp	.LBB121_1
.LBB121_1:
	mov	[r2], 0
	mov	r0, r2
add	r0, 28
	mov	[r0], 0
	mov	r0, r2
add	r0, 24
	mov	[r0], 0
	mov	r0, r2
add	r0, 20
	mov	[r0], 0
	mov	r0, r2
add	r0, 16
	mov	[r0], 0
	mov	r0, r2
add	r0, 12
	mov	[r0], 0
	mov	r0, r2
add	r0, 8
	mov	[r0], 0
add	r2, 4
	mov	[r2], 0
	jmp	.LBB121_41
.LBB121_2:
	mov	r5, [r3]
	mov	r0, 1
	jl	r5, r0, .LBB121_20
	jmp	.LBB121_3
.LBB121_3:
	mov	r0, r7
add	r0, 28
	mov	r0, [r0]
	mov	r1, rsp
	mov	r3, rsp
	mov	r4, rsp
	mov	r6, rsp
	mov	t0, rsp
	mov	t1, rsp
	mov	x5, rsp
add	r1, 28
	mov	[r1], r0
	mov	r0, r7
add	r0, 24
	mov	r0, [r0]
	mov	r1, r7
add	r1, 20
	mov	r1, [r1]
add	r3, 24
	mov	[r3], r0
add	r4, 20
	mov	[r4], r1
	mov	r0, r7
add	r0, 16
	mov	r0, [r0]
	mov	r1, r7
add	r1, 12
	mov	r1, [r1]
add	r6, 16
	mov	[r6], r0
add	t0, 12
	mov	[t0], r1
	mov	r0, r7
add	r0, 8
	mov	r0, [r0]
add	t1, 8
	mov	r1, r7
add	r1, 4
	mov	r1, [r1]
	mov	r3, [r7]
	mov	[t1], r0
add	x5, 4
	mov	[x5], r1
	mov	[rsp], r3
	mov	x11, r2
add	x11, 28
	mov	[x11], 0
	mov	x10, r2
add	x10, 24
	mov	[x10], 0
	mov	x9, r2
add	x9, 20
	mov	[x9], 0
	mov	x8, r2
add	x8, 16
	mov	[x8], 0
	mov	x6, r2
add	x6, 12
	mov	[x6], 0
	mov	x7, r2
add	x7, 8
	mov	[x7], 0
	mov	x4, r2
add	x4, 4
	mov	[x4], 0
	mov	r0, 255
	mov	[r2], 0
	jg	r5, r0, .LBB121_19
	jmp	.LBB121_4
.LBB121_4:
	mov	r1, 6
	mov	r0, r5
	call	__bit_shr
	mov	r1, 63
	mov	r3, rax
	call	__bit_and
	mov	r4, rax
	mov	r0, 3
	sub	r0, r3
	mov	r1, 3
	mov	x2, 3
	call	__bit_shl
	mov	t2, rax
	add	t2, rsp
	mov	t3, [t2]
	mov	r0, t2
add	r0, 4
	mov	t4, [r0]
	jnz	r4, .LBB121_8
	jmp	.LBB121_5
.LBB121_5:
	mov	[x11], t4
	mov	r0, 191
	mov	[x10], t3
	jg	r5, r0, .LBB121_19
	jmp	.LBB121_6
.LBB121_6:
	mov	r0, 2
	sub	r0, r3
	call	__bit_shl
	add	rax, rsp
	mov	r0, [rax]
add	rax, 4
	mov	r1, [rax]
	mov	[x9], r1
	mov	r1, 127
	mov	[x8], r0
	jg	r5, r1, .LBB121_19
	jmp	.LBB121_7
.LBB121_7:
	mov	r0, 1
	sub	r0, r3
	mov	r1, 3
	call	__bit_shl
	add	rax, rsp
	mov	r0, [rax]
add	rax, 4
	mov	r1, [rax]
	mov	[x6], r1
	mov	[x7], r0
	jmp	.LBB121_19
.LBB121_8:
	mov	r7, 64
	mov	r1, 31
	sub	r7, r4
	mov	r0, r4
	call	__bit_and
	mov	t5, rax
	mov	r1, 0
	sub	r1, t5
	mov	t1, 0
	mov	r0, t5
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r6, r4
add	r6, -32
	mov	t6, rax
	mov	r0, r6
	call	__bit_shr
	mov	t7, rax
	mov	r0, t3
	mov	r1, t5
	call	__bit_shl
	mov	x0, 0
	sub	x0, t7
	mov	t7, rax
	mov	r0, x0
	call	__bit_not
	mov	r0, t7
	mov	r1, rax
	call	__bit_and
	mov	x1, rax
	mov	r0, t4
	mov	r1, t5
	call	__bit_shl
	mov	t4, rax
	mov	r0, 32
	sub	r0, t5
	mov	r1, 31
	mov	t5, 32
	call	__bit_and
	mov	r0, t3
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, t6
	mov	r0, rax
	call	__bit_and
	mov	r0, t4
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	t3, rax
	mov	r0, t7
	mov	r1, x0
	call	__bit_and
	mov	t4, rax
	je	r3, x2, .LBB121_10
	jmp	.LBB121_9
.LBB121_9:
	mov	r0, t2
add	r0, -8
	mov	t6, [r0]
add	t2, -4
	mov	t2, [t2]
	mov	r1, 31
	mov	r0, r7
	call	__bit_and
	mov	t7, rax
	mov	r1, 0
	sub	r1, t7
	mov	r0, t7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, r7
add	r0, -32
	mov	x0, rax
	call	__bit_shr
	mov	x1, rax
	mov	r0, t2
	mov	r1, t7
	call	__bit_shr
	mov	x2, 0
	sub	x2, x1
	mov	x1, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	x3, rax
	mov	r0, t6
	mov	r1, t7
	call	__bit_shr
	sub	t5, t7
	mov	r1, 31
	mov	t6, rax
	mov	r0, t5
	call	__bit_and
	mov	r0, t2
	mov	r1, rax
	call	__bit_shl
	sub	t1, x0
	mov	r0, rax
	mov	r1, t1
	call	__bit_and
	mov	r0, t6
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	t1, rax
	mov	r0, x1
	mov	r1, x2
	call	__bit_and
	mov	t2, rax
	mov	r0, t1
	mov	r1, t4
	call	__bit_or
	mov	t4, rax
	mov	r0, t2
	mov	r1, t3
	call	__bit_or
	mov	t3, rax
.LBB121_10:
	mov	[x11], t3
	mov	r0, 191
	mov	[x10], t4
	jg	r5, r0, .LBB121_17
	jmp	.LBB121_11
.LBB121_11:
	mov	r0, 2
	sub	r0, r3
	mov	r1, 3
	mov	x1, 2
	call	__bit_shl
	mov	t5, rax
	add	t5, rsp
	mov	r0, t5
add	r0, 4
	mov	t3, [r0]
	mov	t4, [t5]
	mov	r1, 31
	mov	r0, r4
	call	__bit_and
	mov	t6, rax
	mov	r1, 0
	sub	r1, t6
	mov	t1, 0
	mov	r0, t6
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	t7, rax
	mov	r0, r6
	call	__bit_shr
	mov	x0, rax
	mov	r0, 32
	sub	r0, t6
	mov	t2, 32
	call	__bit_and
	mov	r0, t4
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, t7
	mov	r0, rax
	call	__bit_and
	mov	t7, rax
	mov	r0, t3
	mov	r1, t6
	call	__bit_shl
	mov	r0, rax
	mov	r1, t7
	call	__bit_or
	mov	t7, 0
	sub	t7, x0
	mov	r0, rax
	mov	r1, t7
	call	__bit_and
	mov	t3, rax
	mov	r0, t4
	mov	r1, t6
	call	__bit_shl
	mov	t4, rax
	mov	r0, t7
	call	__bit_not
	mov	r0, t4
	mov	r1, rax
	call	__bit_and
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	t3, rax
	mov	r0, t4
	mov	r1, t7
	call	__bit_and
	mov	t4, rax
	je	r3, x1, .LBB121_13
	jmp	.LBB121_12
.LBB121_12:
	mov	r0, t5
add	r0, -8
	mov	t6, [r0]
add	t5, -4
	mov	t5, [t5]
	mov	r1, 31
	mov	r0, r7
	call	__bit_and
	mov	t7, rax
	mov	r1, 0
	sub	r1, t7
	mov	r0, t7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, r7
add	r0, -32
	mov	x0, rax
	call	__bit_shr
	mov	x1, rax
	mov	r0, t5
	mov	r1, t7
	call	__bit_shr
	mov	x2, 0
	sub	x2, x1
	mov	x1, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	x3, rax
	mov	r0, t6
	mov	r1, t7
	call	__bit_shr
	sub	t2, t7
	mov	r1, 31
	mov	t6, rax
	mov	r0, t2
	call	__bit_and
	mov	r0, t5
	mov	r1, rax
	call	__bit_shl
	sub	t1, x0
	mov	r0, rax
	mov	r1, t1
	call	__bit_and
	mov	r0, t6
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	t1, rax
	mov	r0, x1
	mov	r1, x2
	call	__bit_and
	mov	t2, rax
	mov	r0, t1
	mov	r1, t4
	call	__bit_or
	mov	t4, rax
	mov	r0, t2
	mov	r1, t3
	call	__bit_or
	mov	t3, rax
.LBB121_13:
	mov	[x9], t3
	mov	r0, 127
	mov	[x8], t4
	jg	r5, r0, .LBB121_17
	jmp	.LBB121_14
.LBB121_14:
	mov	r0, 1
	sub	r0, r3
	mov	r1, 3
	mov	x0, 1
	call	__bit_shl
	mov	t4, rax
	add	t4, rsp
	mov	r0, t4
add	r0, 4
	mov	t2, [r0]
	mov	t3, [t4]
	mov	r1, 31
	mov	r0, r4
	call	__bit_and
	mov	t5, rax
	mov	r1, 0
	sub	r1, t5
	mov	r5, 0
	mov	r0, t5
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	t6, rax
	mov	r0, r6
	call	__bit_shr
	mov	t7, rax
	mov	r0, 32
	sub	r0, t5
	mov	t1, 32
	call	__bit_and
	mov	r0, t3
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, t6
	mov	r0, rax
	call	__bit_and
	mov	t6, rax
	mov	r0, t2
	mov	r1, t5
	call	__bit_shl
	mov	r0, rax
	mov	r1, t6
	call	__bit_or
	mov	t6, 0
	sub	t6, t7
	mov	r0, rax
	mov	r1, t6
	call	__bit_and
	mov	t2, rax
	mov	r0, t3
	mov	r1, t5
	call	__bit_shl
	mov	t3, rax
	mov	r0, t6
	call	__bit_not
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	t2, rax
	mov	r0, t3
	mov	r1, t6
	call	__bit_and
	mov	t3, rax
	je	r3, x0, .LBB121_16
	jmp	.LBB121_15
.LBB121_15:
	mov	r0, t4
add	r0, -8
	mov	t5, [r0]
add	t4, -4
	mov	t4, [t4]
	mov	r1, 31
	mov	r0, r7
	call	__bit_and
	mov	t6, rax
	mov	r1, 0
	sub	r1, t6
	mov	r0, t6
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	r7, -32
	mov	t7, rax
	mov	r0, r7
	call	__bit_shr
	mov	r7, rax
	mov	r0, t4
	mov	r1, t6
	call	__bit_shr
	mov	x0, 0
	sub	x0, r7
	mov	r7, rax
	mov	r0, x0
	call	__bit_not
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	x1, rax
	mov	r0, t5
	mov	r1, t6
	call	__bit_shr
	sub	t1, t6
	mov	r1, 31
	mov	t5, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, t4
	mov	r1, rax
	call	__bit_shl
	sub	r5, t7
	mov	r0, rax
	mov	r1, r5
	call	__bit_and
	mov	r0, t5
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r5, rax
	mov	r0, r7
	mov	r1, x0
	call	__bit_and
	mov	r7, rax
	mov	r0, r5
	mov	r1, t3
	call	__bit_or
	mov	t3, rax
	mov	r0, r7
	mov	r1, t2
	call	__bit_or
	mov	t2, rax
.LBB121_16:
	mov	[x6], t2
	mov	[x7], t3
.LBB121_17:
	jnz	r3, .LBB121_19
	jmp	.LBB121_18
.LBB121_18:
	mov	r3, [x5]
	mov	r5, [rsp]
	mov	r1, 31
	mov	r0, r4
	call	__bit_and
	mov	r4, rax
	mov	r1, 0
	sub	r1, r4
	mov	r7, 0
	mov	r0, r4
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	t1, rax
	mov	r0, r6
	call	__bit_shr
	mov	r6, rax
	mov	r0, r5
	mov	r1, r4
	call	__bit_shl
	mov	t2, 0
	sub	t2, r6
	mov	r6, rax
	mov	r0, t2
	call	__bit_not
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	t3, rax
	mov	r0, r3
	mov	r1, r4
	call	__bit_shl
	mov	r0, 32
	sub	r0, r4
	mov	r1, 31
	mov	r3, rax
	call	__bit_and
	mov	r0, r5
	mov	r1, rax
	call	__bit_shr
	sub	r7, t1
	mov	r0, rax
	mov	r1, r7
	call	__bit_and
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, t2
	call	__bit_and
	mov	r0, rax
	mov	r1, t3
	call	__bit_or
	mov	r3, rax
	mov	r0, r6
	mov	r1, t2
	call	__bit_and
	mov	[r2], rax
	mov	[x4], r3
.LBB121_19:
	jmp	.LBB121_41
.LBB121_20:
	mov	x7, rsp
	mov	x8, rsp
	mov	r0, rsp
	mov	r1, rsp
	mov	r3, rsp
	mov	r4, rsp
	mov	r6, rsp
	mov	t0, r7
add	t0, 28
	mov	t0, [t0]
	mov	t1, 0
	sub	t1, r5
add	x7, 28
	mov	[x7], t0
	mov	r5, r7
add	r5, 24
	mov	r5, [r5]
	mov	t0, r7
add	t0, 20
	mov	t0, [t0]
add	x8, 24
	mov	[x8], r5
add	r0, 20
	mov	[r0], t0
	mov	r0, r7
add	r0, 16
	mov	r0, [r0]
	mov	r5, r7
add	r5, 12
	mov	r5, [r5]
add	r1, 16
	mov	[r1], r0
add	r3, 12
	mov	[r3], r5
	mov	r0, r7
add	r0, 8
	mov	r0, [r0]
add	r4, 8
	mov	r1, r7
add	r1, 4
	mov	r1, [r1]
	mov	r3, [r7]
	mov	[r4], r0
add	r6, 4
	mov	[r6], r1
	mov	[rsp], r3
	mov	x5, r2
add	x5, 28
	mov	[x5], 0
	mov	x6, r2
add	x6, 24
	mov	[x6], 0
	mov	x9, r2
add	x9, 20
	mov	[x9], 0
	mov	x10, r2
add	x10, 16
	mov	[x10], 0
	mov	x11, r2
add	x11, 12
	mov	[x11], 0
	mov	x12, r2
add	x12, 8
	mov	[x12], 0
	mov	x13, r2
add	x13, 4
	mov	[x13], 0
	mov	r0, 255
	mov	[r2], 0
	jg	t1, r0, .LBB121_40
	jmp	.LBB121_21
.LBB121_21:
	mov	r1, 6
	mov	r0, t1
	call	__bit_shr
	mov	r1, 63
	mov	r3, rax
	call	__bit_and
	mov	r4, rax
	mov	r1, 3
	mov	x2, 3
	mov	r0, r3
	call	__bit_shl
	mov	r6, rax
	add	r6, rsp
	mov	t4, [r6]
	mov	r0, r6
add	r0, 4
	mov	t3, [r0]
	jnz	r4, .LBB121_27
	jmp	.LBB121_22
.LBB121_22:
	mov	[r2], t4
	mov	r0, 191
	mov	[x13], t3
	jg	t1, r0, .LBB121_25
	jmp	.LBB121_23
.LBB121_23:
	mov	r0, r6
	mov	r1, r6
add	r1, 12
	mov	r1, [r1]
add	r0, 8
	mov	r0, [r0]
	mov	[x11], r1
	mov	r1, 127
	mov	[x12], r0
	jg	t1, r1, .LBB121_25
	jmp	.LBB121_24
.LBB121_24:
	mov	r0, r6
add	r0, 16
add	r6, 20
	mov	r1, [r6]
	mov	r0, [r0]
	mov	[x9], r1
	mov	[x10], r0
.LBB121_25:
	jnz	r3, .LBB121_40
	jmp	.LBB121_26
.LBB121_26:
	mov	rax, [x7]
	mov	r2, [x8]
	jmp	.LBB121_39
.LBB121_27:
	mov	r7, 64
	mov	r1, 31
	sub	r7, r4
	mov	r0, r4
	call	__bit_and
	mov	t5, rax
	mov	r1, 0
	sub	r1, t5
	mov	t2, 0
	mov	r0, t5
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r5, r4
add	r5, -32
	mov	t6, rax
	mov	r0, r5
	call	__bit_shr
	mov	t7, rax
	mov	r0, t3
	mov	r1, t5
	call	__bit_shr
	mov	x0, 0
	sub	x0, t7
	mov	t7, rax
	mov	r0, x0
	call	__bit_not
	mov	r0, t7
	mov	r1, rax
	call	__bit_and
	mov	x1, rax
	mov	r0, t4
	mov	r1, t5
	call	__bit_shr
	mov	t4, rax
	mov	r0, 32
	sub	r0, t5
	mov	r1, 31
	mov	t5, 32
	call	__bit_and
	mov	r0, t3
	mov	r1, rax
	call	__bit_shl
	mov	r1, 0
	sub	r1, t6
	mov	r0, rax
	call	__bit_and
	mov	r0, t4
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	t3, rax
	mov	r0, t7
	mov	r1, x0
	call	__bit_and
	mov	t4, rax
	je	r3, x2, .LBB121_29
	jmp	.LBB121_28
.LBB121_28:
	mov	r0, r6
add	r0, 8
	mov	r1, r6
add	r1, 12
	mov	t6, [r1]
	mov	t7, [r0]
	mov	r1, 31
	mov	r0, r7
	call	__bit_and
	mov	x0, rax
	mov	r1, 0
	sub	r1, x0
	mov	r0, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, r7
add	r0, -32
	mov	x1, rax
	call	__bit_shr
	mov	x2, rax
	mov	r0, t7
	mov	r1, x0
	call	__bit_shl
	mov	x3, 0
	sub	x3, x2
	mov	x2, rax
	mov	r0, x3
	call	__bit_not
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	x4, rax
	mov	r0, t6
	mov	r1, x0
	call	__bit_shl
	sub	t5, x0
	mov	r1, 31
	mov	t6, rax
	mov	r0, t5
	call	__bit_and
	mov	r0, t7
	mov	r1, rax
	call	__bit_shr
	sub	t2, x1
	mov	r0, rax
	mov	r1, t2
	call	__bit_and
	mov	r0, t6
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	t2, rax
	mov	r0, x2
	mov	r1, x3
	call	__bit_and
	mov	t5, rax
	mov	r0, t2
	mov	r1, t4
	call	__bit_or
	mov	t4, rax
	mov	r0, t5
	mov	r1, t3
	call	__bit_or
	mov	t3, rax
.LBB121_29:
	mov	[r2], t3
	mov	r0, 191
	mov	[x13], t4
	jg	t1, r0, .LBB121_37
	jmp	.LBB121_30
.LBB121_30:
	mov	r2, r3
add	r2, 1
	mov	r1, 3
	mov	x2, 3
	mov	r0, r2
	call	__bit_shl
	mov	t3, rax
	add	t3, rsp
	mov	t5, [t3]
	mov	r0, t3
add	r0, 4
	mov	t6, [r0]
	mov	r1, 31
	mov	r0, r4
	call	__bit_and
	mov	t7, rax
	mov	r1, 0
	sub	r1, t7
	mov	t2, 0
	mov	r0, t7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x0, rax
	mov	r0, r5
	call	__bit_shr
	mov	x1, rax
	mov	r0, 32
	sub	r0, t7
	mov	t4, 32
	call	__bit_and
	mov	r0, t6
	mov	r1, rax
	call	__bit_shl
	mov	r1, 0
	sub	r1, x0
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
	mov	r0, t5
	mov	r1, t7
	call	__bit_shr
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	x0, 0
	sub	x0, x1
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	t5, rax
	mov	r0, t6
	mov	r1, t7
	call	__bit_shr
	mov	t6, rax
	mov	r0, x0
	call	__bit_not
	mov	r0, t6
	mov	r1, rax
	call	__bit_and
	mov	r0, t5
	mov	r1, rax
	call	__bit_or
	mov	t5, rax
	mov	r0, t6
	mov	r1, x0
	call	__bit_and
	mov	t6, rax
	je	r2, x2, .LBB121_32
	jmp	.LBB121_31
.LBB121_31:
	mov	r0, t3
add	r0, 8
add	t3, 12
	mov	r2, [t3]
	mov	t3, [r0]
	mov	r1, 31
	mov	r0, r7
	call	__bit_and
	mov	t7, rax
	mov	r1, 0
	sub	r1, t7
	mov	r0, t7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, r7
add	r0, -32
	mov	x0, rax
	call	__bit_shr
	mov	x1, rax
	mov	r0, t3
	mov	r1, t7
	call	__bit_shl
	mov	x2, 0
	sub	x2, x1
	mov	x1, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	x3, rax
	mov	r0, r2
	mov	r1, t7
	call	__bit_shl
	sub	t4, t7
	mov	r1, 31
	mov	t7, rax
	mov	r0, t4
	call	__bit_and
	mov	r0, t3
	mov	r1, rax
	call	__bit_shr
	sub	t2, x0
	mov	r0, rax
	mov	r1, t2
	call	__bit_and
	mov	r0, t7
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	t2, rax
	mov	r0, x1
	mov	r1, x2
	call	__bit_and
	mov	t4, rax
	mov	r0, t2
	mov	r1, t6
	call	__bit_or
	mov	t2, rax
	mov	r0, t4
	mov	r1, t5
	call	__bit_or
	mov	[x12], rax
	mov	r0, 127
	mov	[x11], t2
	jg	t1, r0, .LBB121_37
	jmp	.LBB121_34
.LBB121_32:
	mov	[x11], t6
	mov	r0, 127
	mov	[x12], t5
	jg	t1, r0, .LBB121_40
	jmp	.LBB121_33
.LBB121_33:
	mov	r0, r6
add	r0, 16
	mov	r2, [r0]
	mov	r0, r6
add	r0, 20
	mov	t1, [r0]
	mov	r1, 31
	mov	r0, r4
	call	__bit_and
	mov	t2, rax
	mov	r1, 0
	sub	r1, t2
	mov	t3, 0
	mov	r0, t2
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	t4, rax
	mov	r0, r5
	call	__bit_shr
	mov	t5, rax
	mov	r0, t1
	mov	r1, t2
	call	__bit_shr
	mov	t6, 0
	sub	t6, t5
	mov	t5, rax
	mov	r0, t6
	call	__bit_not
	mov	r0, t5
	mov	r1, rax
	call	__bit_and
	mov	t7, rax
	mov	r0, r2
	mov	r1, t2
	call	__bit_shr
	mov	r0, 32
	sub	r0, t2
	mov	r1, 31
	mov	r2, rax
	call	__bit_and
	mov	r0, t1
	mov	r1, rax
	call	__bit_shl
	sub	t3, t4
	mov	r0, rax
	mov	r1, t3
	call	__bit_and
	mov	r0, r2
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, t6
	call	__bit_and
	mov	r0, rax
	mov	r1, t7
	call	__bit_or
	mov	r2, rax
	mov	r0, t5
	mov	r1, t6
	call	__bit_and
	mov	t1, rax
	jmp	.LBB121_35
.LBB121_34:
	mov	r1, 31
	mov	r0, r4
	call	__bit_and
	mov	t1, rax
	mov	r1, 0
	sub	r1, t1
	mov	t2, 0
	mov	r0, t1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	t4, rax
	mov	r0, r5
	call	__bit_shr
	mov	t5, rax
	mov	r0, r2
	mov	r1, t1
	call	__bit_shr
	mov	t6, 0
	sub	t6, t5
	mov	t5, rax
	mov	r0, t6
	call	__bit_not
	mov	r0, t5
	mov	r1, rax
	call	__bit_and
	mov	t7, rax
	mov	r0, t3
	mov	r1, t1
	call	__bit_shr
	mov	r0, 32
	sub	r0, t1
	mov	r1, 31
	mov	t1, rax
	call	__bit_and
	mov	r0, r2
	mov	r1, rax
	call	__bit_shl
	sub	t2, t4
	mov	r0, rax
	mov	r1, t2
	call	__bit_and
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, t6
	call	__bit_and
	mov	r0, rax
	mov	r1, t7
	call	__bit_or
	mov	r2, rax
	mov	r0, t5
	mov	r1, t6
	call	__bit_and
	mov	r0, 1
	mov	t1, rax
	je	r3, r0, .LBB121_36
	jmp	.LBB121_35
.LBB121_35:
	mov	r0, r6
add	r0, 24
add	r6, 28
	mov	r6, [r6]
	mov	t2, [r0]
	mov	r1, 31
	mov	r0, r7
	call	__bit_and
	mov	t3, rax
	mov	r1, 0
	sub	r1, t3
	mov	t4, 0
	mov	r0, t3
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	r7, -32
	mov	t5, rax
	mov	r0, r7
	call	__bit_shr
	mov	r7, rax
	mov	r0, t2
	mov	r1, t3
	call	__bit_shl
	mov	t6, 0
	sub	t6, r7
	mov	r7, rax
	mov	r0, t6
	call	__bit_not
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	t7, rax
	mov	r0, r6
	mov	r1, t3
	call	__bit_shl
	mov	r0, 32
	sub	r0, t3
	mov	r1, 31
	mov	r6, rax
	call	__bit_and
	mov	r0, t2
	mov	r1, rax
	call	__bit_shr
	sub	t4, t5
	mov	r0, rax
	mov	r1, t4
	call	__bit_and
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, t6
	call	__bit_and
	mov	r0, rax
	mov	r1, t7
	call	__bit_or
	mov	r6, rax
	mov	r0, r7
	mov	r1, t6
	call	__bit_and
	mov	r7, rax
	mov	r0, r6
	mov	r1, t1
	call	__bit_or
	mov	t1, rax
	mov	r0, r7
	mov	r1, r2
	call	__bit_or
	mov	r2, rax
.LBB121_36:
	mov	[x9], t1
	mov	[x10], r2
.LBB121_37:
	jnz	r3, .LBB121_40
	jmp	.LBB121_38
.LBB121_38:
	mov	r2, [x8]
	mov	r3, [x7]
	mov	r1, 31
	mov	r0, r4
	call	__bit_and
	mov	r4, rax
	mov	r1, 0
	sub	r1, r4
	mov	r6, 0
	mov	r0, r4
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r7, rax
	mov	r0, r5
	call	__bit_shr
	mov	r5, rax
	mov	r0, r3
	mov	r1, r4
	call	__bit_shr
	mov	t1, 0
	sub	t1, r5
	mov	r5, rax
	mov	r0, t1
	call	__bit_not
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	t2, rax
	mov	r0, r2
	mov	r1, r4
	call	__bit_shr
	mov	r0, 32
	sub	r0, r4
	mov	r1, 31
	mov	r2, rax
	call	__bit_and
	mov	r0, r3
	mov	r1, rax
	call	__bit_shl
	sub	r6, r7
	mov	r0, rax
	mov	r1, r6
	call	__bit_and
	mov	r0, r2
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, t1
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_or
	mov	r2, rax
	mov	r0, r5
	mov	r1, t1
	call	__bit_and
.LBB121_39:
	mov	[x5], rax
	mov	[x6], r2
.LBB121_40:
.LBB121_41:
	mov	x13, [rsp+8]
	mov	x12, [rsp+9]
	mov	x11, [rsp+10]
	mov	x10, [rsp+11]
	mov	x9, [rsp+12]
	mov	x8, [rsp+13]
	mov	x7, [rsp+14]
	mov	x6, [rsp+15]
	mov	x5, [rsp+16]
	mov	x4, [rsp+17]
	mov	x3, [rsp+18]
	mov	x2, [rsp+19]
	mov	x1, [rsp+20]
	mov	x0, [rsp+21]
add	rsp, 88
	ret
// -- End function
// -- Begin function d2fixed_buffered
d2fixed_buffered:                       // @d2fixed_buffered
// %bb.0:
	call	d2fixed_buffered_n
	mov	r0, rax
	add	r0, r3
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r4, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r4
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r4, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	ret
// -- End function
// -- Begin function d2fixed
d2fixed:                                // @d2fixed
// %bb.0:
	mov	r3, r0
	mov	r0, 2000
	call	malloc
	mov	r4, rax
	mov	r0, r3
	mov	r3, r4
	call	d2fixed_buffered_n
	mov	r0, rax
	add	r0, r4
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	rax, r4
	ret
// -- End function
// -- Begin function d2exp_buffered_n
d2exp_buffered_n:                       // @d2exp_buffered_n
// %bb.0:                               // %memcpy.exit
sub	rsp, 104
	mov	[rsp+25], x0
	mov	[rsp+24], x1
	mov	[rsp+23], x2
	mov	[rsp+22], x3
	mov	[rsp+21], x4
	mov	[rsp+20], x5
	mov	[rsp+19], x6
	mov	[rsp+18], x7
	mov	[rsp+17], x8
	mov	[rsp+16], x9
	mov	[rsp+15], x10
	mov	[rsp+14], x11
	mov	[rsp+13], x12
	mov	[rsp+12], x13
	mov	[rsp+11], x14
	mov	[rsp+10], x15
	mov	r5, r1
	mov	r1, 1048575
	mov	r4, r3
	mov	r7, r0
	mov	r0, r5
	call	__bit_and
	mov	r1, 20
	mov	t1, rax
	call	__bit_shr
	mov	r1, 2047
	mov	r3, 2047
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	jne	r6, r3, .LBB124_6
	jmp	.LBB124_1
.LBB124_1:
	mov	r0, r7
	mov	r1, t1
	call	__bit_or
	jz	rax, .LBB124_3
	jmp	.LBB124_2
.LBB124_2:                              // %memcpy.exit63.loopexit184
	mov	r2, r4
add	r2, 1
	mov	r1, 3
	mov	t4, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	r6, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r1, 3
add	r4, 2
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r2, rax
	mov	r5, [r2]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 97
	mov	r5, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r2], rax
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r4, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r4
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	r4, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB124_201
.LBB124_3:
	mov	r0, -1
	mov	t4, 8
	jg	r5, r0, .LBB124_5
	jmp	.LBB124_4
.LBB124_4:
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r6, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 45
	mov	r6, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	t4, 9
.LBB124_5:                              // %memcpy.exit63.loopexit
	mov	r1, 31
	mov	r0, r5
	call	__bit_shr
	add	r4, rax
	mov	r2, r4
	mov	r1, 3
add	r2, 1
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 73
	mov	r6, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r3, r4
	mov	r1, 3
add	r3, 2
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r2, rax
	mov	r6, [r2]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	r6, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r2, r4
	mov	r1, 3
add	r2, 3
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r3, rax
	mov	r6, [r3]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 102
	mov	r6, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r3, r4
	mov	r1, 3
add	r3, 4
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r2, rax
	mov	r6, [r2]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 105
	mov	r6, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r2, r4
	mov	r1, 3
add	r2, 5
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r3, rax
	mov	r6, [r3]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 110
	mov	r6, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r3, r4
	mov	r1, 3
add	r3, 6
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r2, rax
	mov	r6, [r2]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 105
	mov	r6, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r1, 3
add	r4, 7
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 116
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r3], rax
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r4, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r4
	mov	r1, rax
	call	__bit_and
	mov	r0, 121
	mov	r4, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB124_201
.LBB124_6:
	mov	r0, r7
	mov	r1, t1
	call	__bit_or
	jnz	rax, .LBB124_27
	jmp	.LBB124_7
.LBB124_7:
	jnz	r6, .LBB124_27
	jmp	.LBB124_8
.LBB124_8:
	mov	r0, -1
	mov	r6, 0
	jg	r5, r0, .LBB124_10
	jmp	.LBB124_9
.LBB124_9:
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 45
	mov	r5, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r6, 1
.LBB124_10:
	mov	t4, r6
	mov	r7, r4
	add	r7, r6
	mov	r1, 3
add	t4, 1
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r5, rax
	mov	t1, [r5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t1, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	jz	r2, .LBB124_26
	jmp	.LBB124_11
.LBB124_11:
	mov	r1, 2
	mov	r0, r6
	call	__bit_or
	add	t4, r4
	mov	r1, 3
	mov	t5, rax
	mov	r0, t4
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	t1, rax
	mov	r5, [t1]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 46
	mov	r5, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	r5, r4
	add	r5, t5
	mov	r1, 3
	mov	[t1], rax
	mov	r0, r5
	call	__bit_and
	mov	r3, r2
	jz	rax, .LBB124_15
	jmp	.LBB124_12
.LBB124_12:                             // %.preheader101.preheader
add	r7, 3
	mov	r0, r5
	mov	r3, r2
.LBB124_13:                             // %.preheader101
                                        // =>This Inner Loop Header: Depth=1
	jz	r3, .LBB124_25
	jmp	.LBB124_14
.LBB124_14:                             //   in Loop: Header=BB124_13 Depth=1
add	r3, -1
	mov	r5, r0
	mov	r1, 3
add	r5, 1
	call	__bit_and
	mov	r1, -4
	mov	t1, rax
	call	__bit_and
	mov	t2, rax
	mov	t3, [t2]
	mov	r1, 3
	mov	r0, t1
	call	__bit_shl
	mov	r0, 255
	mov	t1, rax
	mov	r1, t1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t3, rax
	mov	r1, t1
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[t2], rax
	mov	r0, r7
	call	__bit_and
add	r7, 1
	mov	r0, r5
	jnz	rax, .LBB124_13
	jmp	.LBB124_15
.LBB124_15:                             // %.loopexit7.i
	mov	r1, -2147483648
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB124_22
	jmp	.LBB124_16
.LBB124_16:
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB124_18
	jmp	.LBB124_17
.LBB124_17:                             // %.preheader.i.preheader
	mov	r6, -2147483633
	jmp	.LBB124_20
.LBB124_18:                             // %.preheader418
	mov	r6, -2147483645
	jmp	.LBB124_21
.LBB124_19:
	mov	r0, 3
	jg	r3, r0, .LBB124_18
	jmp	.LBB124_22
.LBB124_20:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r5
add	r0, 4
	mov	[r5], 808464432
	mov	r1, r5
add	r1, 8
	mov	[r0], 808464432
	mov	r0, r5
add	r0, 12
	mov	[r1], 808464432
add	r5, 16
add	r3, -16
	mov	r1, -2147483648
	mov	[r0], 808464432
	mov	r0, r3
	call	__bit_xor
	jg	rax, r6, .LBB124_20
	jmp	.LBB124_19
.LBB124_21:                             // =>This Inner Loop Header: Depth=1
	mov	[r5], 808464432
add	r3, -4
add	r5, 4
	mov	r0, r3
	call	__bit_xor
	jg	rax, r6, .LBB124_21
	jmp	.LBB124_22
.LBB124_22:                             // %.loopexit5.i
	jz	r3, .LBB124_25
	jmp	.LBB124_23
.LBB124_23:                             // %.preheader.preheader
	mov	r6, r5
.LBB124_24:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	r3, -1
	mov	r1, 3
add	r6, 1
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r5, rax
	mov	t1, [r5]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t1, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r5, r6
	jnz	r3, .LBB124_24
	jmp	.LBB124_25
.LBB124_25:                             // %memset.exit
	add	t5, r2
	mov	t4, t5
.LBB124_26:                             // %memcpy.exit65
	add	r4, t4
	mov	r2, r4
	mov	r1, 3
add	r2, 1
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 101
	mov	r6, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r3, r4
	mov	r1, 3
add	r3, 2
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r2, rax
	mov	r6, [r2]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 43
	mov	r6, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r1, 3
add	r4, 3
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r3], rax
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r4, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r4
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	r4, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
add	t4, 4
	jmp	.LBB124_201
.LBB124_27:
	mov	r1, 1048576
	mov	r0, t1
	call	__bit_or
	jz	r6, .LBB124_29
	jmp	.LBB124_28
.LBB124_28:
	mov	t1, rax
.LBB124_29:
	mov	[rsp+3], r7
	mov	t2, -1074
	jz	r6, .LBB124_31
	jmp	.LBB124_30
.LBB124_30:
add	r6, -1075
	mov	t2, r6
.LBB124_31:
	mov	x10, 0
	mov	r0, -1
	mov	x12, 0
	jg	r5, r0, .LBB124_33
	jmp	.LBB124_32
.LBB124_32:
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 45
	mov	r5, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	x12, 1
.LBB124_33:
	mov	x9, r2
	mov	r0, -52
add	x9, 1
	mov	[rsp+2], r2
	mov	[rsp], t2
	jl	t2, r0, .LBB124_79
	jmp	.LBB124_34
.LBB124_34:
	mov	r1, -2147483648
	mov	r2, -2147483648
	mov	r0, t2
	call	__bit_xor
	sub	r2, rax
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r6, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, t2
	call	__bit_and
	mov	t6, rax
	mov	r0, t6
	mul	r0, 78913
	mov	r1, 18
	call	__bit_shr
add	rax, 25
	mov	r1, 65535
	mov	r0, rax
	call	__bit_and
	mul	rax, 58255
	mov	r1, 19
	mov	r0, rax
	call	__bit_shr
	mov	t7, rax
	mov	r3, t6
	sub	r3, t2
add	r3, 128
	mov	r2, 0
	mov	t2, -1147483648
	mov	t3, 99999999
	mov	x10, 10000
	mov	x11, mcasm_static_5e6e12c67207ca8d73d385863abbfac5
	mov	t4, 10
	mov	x15, -2147483645
	mov	r5, 0
	mov	r7, [rsp+3]
.LBB124_35:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB124_45 Depth 2
                                        //     Child Loop BB124_48 Depth 2
                                        //     Child Loop BB124_66 Depth 2
	mov	x14, t7
add	t7, -1
	mov	x13, r2
	mov	r0, t6
	mov	r1, t7
	mov	r2, rsp
	call	ryu_fill_pow10_split_exp
	mov	r0, r7
	mov	r1, t1
	call	ryu_mul_shift_mod1e9_exact
	mov	t5, rax
	jz	x13, .LBB124_50
	jmp	.LBB124_36
.LBB124_36:                             //   in Loop: Header=BB124_35 Depth=1
	mov	r2, x13
add	r2, 9
	mov	r1, -2147483648
	mov	x0, 9
	mov	r0, x9
	call	__bit_xor
	mov	x1, rax
	mov	r0, r2
	call	__bit_xor
	jg	rax, x1, .LBB124_76
	jmp	.LBB124_37
.LBB124_37:                             //   in Loop: Header=BB124_35 Depth=1
	mov	x0, r4
	add	x0, x12
	jz	t5, .LBB124_39
	jmp	.LBB124_38
.LBB124_38:                             // %memcpy.exit66
                                        //   in Loop: Header=BB124_35 Depth=1
	mov	x5, x0
	mov	r1, 10000
add	x5, 7
	mov	r0, t5
	call	__udivsi3
	mov	x1, rax
	mov	r0, x1
	mul	r0, -10000
	add	r0, t5
	mov	r1, 100
	call	__udivsi3
	mov	x2, rax
	mov	t0, x2
	mul	t0, -100
	add	t0, r0
	mov	r1, 1
	mov	r0, t0
	call	__bit_shl
	mov	r0, rax
	add	r0, x11
	mov	x3, r0
	mov	r1, 2
add	x3, 1
	call	__bit_shr
	mov	r1, 3
	mov	x4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	x4, x0
	mov	r1, 3
add	x4, 8
	mov	r0, x5
	call	__bit_and
	mov	r1, -4
	mov	x7, rax
	call	__bit_and
	mov	x5, rax
	mov	x8, [x5]
	mov	r1, 3
	mov	r0, x7
	call	__bit_shl
	mov	r0, 255
	mov	x7, rax
	mov	r1, x7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x8
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x8, rax
	mov	r0, x6
	call	__bit_and
	mov	r0, rax
	mov	r1, x7
	call	__bit_shl
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x5], rax
	mov	r0, x3
	call	__bit_shr
	mov	r1, 3
	mov	x5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x3, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, -4
	mov	x5, rax
	call	__bit_and
	mov	x4, rax
	mov	x6, [x4]
	mov	r1, 3
	mov	r0, x5
	call	__bit_shl
	mov	r0, 255
	mov	x5, rax
	mov	r1, x5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
	mov	x4, x0
	mov	r1, 1
add	x4, 5
	mov	r0, x2
	call	__bit_shl
	mov	r0, rax
	add	r0, x11
	mov	x2, r0
	mov	r1, 2
add	x2, 1
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	mov	x3, x0
	mov	r1, 3
add	x3, 6
	mov	r0, x4
	call	__bit_and
	mov	r1, -4
	mov	x6, rax
	call	__bit_and
	mov	x4, rax
	mov	x7, [x4]
	mov	r1, 3
	mov	r0, x6
	call	__bit_shl
	mov	r0, 255
	mov	x6, rax
	mov	r1, x6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x6
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x4], rax
	mov	r0, x2
	call	__bit_shr
	mov	r1, 3
	mov	x4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x2, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x4, rax
	call	__bit_and
	mov	x3, rax
	mov	x5, [x3]
	mov	r1, 3
	mov	r0, x4
	call	__bit_shl
	mov	r0, 255
	mov	x4, rax
	mov	r1, x4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 100000000
	mov	[x3], rax
	mov	r0, t5
	call	__udivsi3
	mov	t5, rax
	mov	r0, t5
	mul	r0, -10000
	add	r0, x1
	mov	r1, 100
	call	__udivsi3
	mov	x1, rax
	mov	t0, x1
	mul	t0, -100
	add	t0, r0
	mov	r1, 1
	mov	r0, t0
	call	__bit_shl
	mov	r0, rax
	mov	x4, x0
	add	r0, x11
add	x4, 3
	mov	x2, r0
	mov	r1, 2
add	x2, 1
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	mov	x3, x0
	mov	r1, 3
add	x3, 4
	mov	r0, x4
	call	__bit_and
	mov	r1, -4
	mov	x6, rax
	call	__bit_and
	mov	x4, rax
	mov	x7, [x4]
	mov	r1, 3
	mov	r0, x6
	call	__bit_shl
	mov	r0, 255
	mov	x6, rax
	mov	r1, x6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x6
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x4], rax
	mov	r0, x2
	call	__bit_shr
	mov	r1, 3
	mov	x4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x2, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x4, rax
	call	__bit_and
	mov	x3, rax
	mov	x5, [x3]
	mov	r1, 3
	mov	r0, x4
	call	__bit_shl
	mov	r0, 255
	mov	x4, rax
	mov	r1, x4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x3], rax
	mov	r0, x1
	call	__bit_shl
	mov	r0, rax
	add	r0, x11
	mov	x2, x0
add	x2, 1
	mov	x1, r0
	mov	r1, 2
add	x1, 1
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -4
	mov	x4, rax
	call	__bit_and
	mov	x2, rax
	mov	x5, [x2]
	mov	r1, 3
	mov	r0, x4
	call	__bit_shl
	mov	r0, 255
	mov	x4, rax
	mov	r1, x4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	[x2], rax
	mov	x2, x0
	mov	r1, 2
add	x2, 2
	mov	r0, x1
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -4
	mov	x3, rax
	call	__bit_and
	mov	x2, rax
	mov	x4, [x2]
	mov	r1, 3
	mov	r0, x3
	call	__bit_shl
	mov	r0, 255
	mov	x3, rax
	mov	r1, x3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x2], rax
	mov	r1, 3
add	t5, 48
	mov	r0, x0
	call	__bit_and
	mov	r1, -4
	mov	x1, rax
	call	__bit_and
	mov	x0, rax
	mov	x2, [x0]
	mov	r1, 3
	mov	r0, x1
	call	__bit_shl
	mov	r0, 255
	mov	x1, rax
	mov	r1, x1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, t5
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
	jmp	.LBB124_49
.LBB124_39:                             //   in Loop: Header=BB124_35 Depth=1
	mov	r1, 3
	mov	r0, x0
	call	__bit_and
	mov	x1, 9
	mov	t5, x0
	jz	rax, .LBB124_44
	jmp	.LBB124_40
.LBB124_40:                             // %.preheader117.preheader
                                        //   in Loop: Header=BB124_35 Depth=1
	mov	t5, x0
add	t5, 1
	mov	r0, x0
	call	__bit_and
	mov	r1, -4
	mov	x1, rax
	call	__bit_and
	mov	x2, rax
	mov	x3, [x2]
	mov	r1, 3
	mov	r0, x1
	call	__bit_shl
	mov	r0, 255
	mov	x1, rax
	mov	r1, x1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x3, rax
	mov	r1, x1
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[x2], rax
	mov	r0, t5
	call	__bit_and
	mov	x1, 8
	jz	rax, .LBB124_44
	jmp	.LBB124_41
.LBB124_41:                             // %.preheader117.1
                                        //   in Loop: Header=BB124_35 Depth=1
	mov	x2, x0
add	x2, 2
	mov	r0, t5
	call	__bit_and
	mov	r1, -4
	mov	x1, rax
	call	__bit_and
	mov	t5, rax
	mov	x3, [t5]
	mov	r1, 3
	mov	r0, x1
	call	__bit_shl
	mov	r0, 255
	mov	x1, rax
	mov	r1, x1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x3, rax
	mov	r1, x1
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[t5], rax
	mov	r0, x2
	call	__bit_and
	mov	x1, 7
	mov	t5, x2
	jz	rax, .LBB124_44
	jmp	.LBB124_42
.LBB124_42:                             // %.preheader117.2
                                        //   in Loop: Header=BB124_35 Depth=1
	mov	t5, x0
add	t5, 3
	mov	r0, x2
	call	__bit_and
	mov	r1, -4
	mov	x1, rax
	call	__bit_and
	mov	x2, rax
	mov	x3, [x2]
	mov	r1, 3
	mov	r0, x1
	call	__bit_shl
	mov	r0, 255
	mov	x1, rax
	mov	r1, x1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x3, rax
	mov	r1, x1
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[x2], rax
	mov	r0, t5
	call	__bit_and
	mov	x1, 6
	jz	rax, .LBB124_44
	jmp	.LBB124_43
.LBB124_43:                             // %.preheader117.3
                                        //   in Loop: Header=BB124_35 Depth=1
add	x0, 4
	mov	r0, t5
	call	__bit_and
	mov	r1, -4
	mov	x1, rax
	call	__bit_and
	mov	t5, rax
	mov	x2, [t5]
	mov	r1, 3
	mov	r0, x1
	call	__bit_shl
	mov	r0, 255
	mov	x1, rax
	mov	r1, x1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x2, rax
	mov	r1, x1
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[t5], rax
	mov	x1, 5
	mov	t5, x0
.LBB124_44:                             // %.thread.preheader
                                        //   in Loop: Header=BB124_35 Depth=1
.LBB124_45:                             // %.thread
                                        //   Parent Loop BB124_35 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	[t5], 808464432
add	x1, -4
	mov	r1, -2147483648
add	t5, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x15, .LBB124_45
	jmp	.LBB124_46
.LBB124_46:                             // %.loopexit5.i71
                                        //   in Loop: Header=BB124_35 Depth=1
	jz	x1, .LBB124_49
	jmp	.LBB124_47
.LBB124_47:                             // %.preheader116.preheader
                                        //   in Loop: Header=BB124_35 Depth=1
	mov	x4, 0
.LBB124_48:                             // %.preheader116
                                        //   Parent Loop BB124_35 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, t5
	add	r0, x4
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	x2, rax
	mov	x3, [x2]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r0, 255
	mov	x0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x3, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
add	x4, 1
	mov	[x2], rax
	jne	x1, x4, .LBB124_48
	jmp	.LBB124_49
.LBB124_49:                             // %memset.exit73
                                        //   in Loop: Header=BB124_35 Depth=1
add	x12, 9
	jmp	.LBB124_77
.LBB124_50:                             //   in Loop: Header=BB124_35 Depth=1
	mov	r2, 0
	jz	t5, .LBB124_77
	jmp	.LBB124_51
.LBB124_51:                             //   in Loop: Header=BB124_35 Depth=1
	mov	r1, -2147483648
	mov	r0, t5
	call	__bit_xor
	jl	rax, t2, .LBB124_53
	jmp	.LBB124_52
.LBB124_52:
	call	abort
.LBB124_53:                             //   in Loop: Header=BB124_35 Depth=1
	mov	x0, 9
	jg	t5, t3, .LBB124_62
	jmp	.LBB124_54
.LBB124_54:                             //   in Loop: Header=BB124_35 Depth=1
	mov	x0, 8
	mov	r0, 9999999
	jg	t5, r0, .LBB124_62
	jmp	.LBB124_55
.LBB124_55:                             //   in Loop: Header=BB124_35 Depth=1
	mov	x0, 7
	mov	r0, 999999
	jg	t5, r0, .LBB124_62
	jmp	.LBB124_56
.LBB124_56:                             //   in Loop: Header=BB124_35 Depth=1
	mov	x0, 6
	mov	r0, 99999
	jg	t5, r0, .LBB124_62
	jmp	.LBB124_57
.LBB124_57:                             //   in Loop: Header=BB124_35 Depth=1
	mov	x0, 5
	mov	r0, 9999
	jg	t5, r0, .LBB124_62
	jmp	.LBB124_58
.LBB124_58:                             //   in Loop: Header=BB124_35 Depth=1
	mov	x0, 4
	mov	r0, 999
	jg	t5, r0, .LBB124_62
	jmp	.LBB124_59
.LBB124_59:                             //   in Loop: Header=BB124_35 Depth=1
	mov	x0, 3
	mov	r0, 99
	jg	t5, r0, .LBB124_62
	jmp	.LBB124_60
.LBB124_60:                             //   in Loop: Header=BB124_35 Depth=1
	mov	x0, 2
	mov	r0, 9
	jg	t5, r0, .LBB124_62
	jmp	.LBB124_61
.LBB124_61:                             //   in Loop: Header=BB124_35 Depth=1
	mov	x0, 1
.LBB124_62:                             //   in Loop: Header=BB124_35 Depth=1
	mov	r5, t7
	mul	r5, 9
	add	r5, x0
add	r5, -1
	mov	r0, x9
	call	__bit_xor
	mov	r2, rax
	mov	r0, x0
	call	__bit_xor
	jg	rax, r2, .LBB124_76
	jmp	.LBB124_63
.LBB124_63:                             //   in Loop: Header=BB124_35 Depth=1
	mov	r0, [rsp+2]
	jz	r0, .LBB124_74
	jmp	.LBB124_64
.LBB124_64:                             //   in Loop: Header=BB124_35 Depth=1
	mov	r2, r4
	add	r2, x12
	mov	x3, 0
	mov	x1, r2
	add	x1, x0
	jl	t5, x10, .LBB124_68
	jmp	.LBB124_65
.LBB124_65:                             //   in Loop: Header=BB124_35 Depth=1
	mov	x10, x9
	mov	x13, 0
.LBB124_66:                             // %memcpy.exit74
                                        //   Parent Loop BB124_35 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 10000
	mov	x2, t5
	mov	r0, x2
	call	__udivsi3
	mov	t5, rax
	mov	r0, t5
	mul	r0, -10000
	add	r0, x2
	mov	r1, 100
	call	__udivsi3
	mov	x4, rax
	mov	t0, x4
	mul	t0, -100
	add	t0, r0
	mov	r1, 1
	mov	r0, t0
	call	__bit_shl
	mov	x3, x1
	add	x3, x13
	mov	r0, rax
	mov	x6, x3
	add	r0, x11
add	x6, -1
	mov	x5, r0
	mov	r1, 2
add	x5, 1
	call	__bit_shr
	mov	r1, 3
	mov	x7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, -4
	mov	x8, rax
	call	__bit_and
	mov	x6, rax
	mov	x9, [x6]
	mov	r1, 3
	mov	r0, x8
	call	__bit_shl
	mov	r0, 255
	mov	x8, rax
	mov	r1, x8
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x9
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x9, rax
	mov	r0, x7
	call	__bit_and
	mov	r0, rax
	mov	r1, x8
	call	__bit_shl
	mov	r0, x9
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x6], rax
	mov	r0, x5
	call	__bit_shr
	mov	r1, 3
	mov	x6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x5, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x6, rax
	call	__bit_and
	mov	x7, rax
	mov	x8, [x7]
	mov	r1, 3
	mov	r0, x6
	call	__bit_shl
	mov	r0, 255
	mov	x6, rax
	mov	r1, x6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x8
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x8, rax
	mov	r0, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x6
	call	__bit_shl
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x7], rax
	mov	r0, x4
	call	__bit_shl
	mov	r0, rax
	mov	x5, x3
	add	r0, x11
add	x5, -3
	mov	x4, r0
	mov	r1, 2
add	x4, 1
	call	__bit_shr
	mov	r1, 3
	mov	x6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r1, 3
add	x3, -2
	mov	r0, x5
	call	__bit_and
	mov	r1, -4
	mov	x7, rax
	call	__bit_and
	mov	x5, rax
	mov	x8, [x5]
	mov	r1, 3
	mov	r0, x7
	call	__bit_shl
	mov	r0, 255
	mov	x7, rax
	mov	r1, x7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x8
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x8, rax
	mov	r0, x6
	call	__bit_and
	mov	r0, rax
	mov	r1, x7
	call	__bit_shl
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x5], rax
	mov	r0, x4
	call	__bit_shr
	mov	r1, 3
	mov	x5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x5, rax
	call	__bit_and
	mov	x3, rax
	mov	x6, [x3]
	mov	r1, 3
	mov	r0, x5
	call	__bit_shl
	mov	r0, 255
	mov	x5, rax
	mov	r1, x5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
add	x13, -4
	jg	x2, t3, .LBB124_66
	jmp	.LBB124_67
.LBB124_67:                             // %.loopexit115.loopexit
                                        //   in Loop: Header=BB124_35 Depth=1
	mov	x3, 0
	sub	x3, x13
	mov	x9, x10
	mov	r7, [rsp+3]
	mov	x10, 10000
.LBB124_68:                             // %.loopexit115
                                        //   in Loop: Header=BB124_35 Depth=1
	mov	r0, 100
	jl	t5, r0, .LBB124_70
	jmp	.LBB124_69
.LBB124_69:                             // %memcpy.exit76.loopexit
                                        //   in Loop: Header=BB124_35 Depth=1
	mov	r1, 65532
	mov	r0, t5
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shr
	mul	rax, 5243
	mov	r1, 17
	mov	r0, rax
	call	__bit_shr
	mov	x2, rax
	mov	r0, x2
	mul	r0, -100
	add	r0, t5
	mov	r1, 65535
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_shl
	sub	x1, x3
	mov	r0, rax
	mov	x3, x1
	add	r0, x11
add	x3, -1
	mov	t5, r0
	mov	r1, 2
add	t5, 1
	call	__bit_shr
	mov	r1, 3
	mov	x4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x5, rax
	call	__bit_and
	mov	x3, rax
	mov	x6, [x3]
	mov	r1, 3
	mov	r0, x5
	call	__bit_shl
	mov	r0, 255
	mov	x5, rax
	mov	r1, x5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x3], rax
	mov	r0, t5
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t5, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, -4
	mov	x3, rax
	call	__bit_and
	mov	x1, rax
	mov	x4, [x1]
	mov	r1, 3
	mov	r0, x3
	call	__bit_shl
	mov	r0, 255
	mov	x3, rax
	mov	r1, x3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, t5
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	mov	t5, x2
.LBB124_70:                             // %memcpy.exit76
                                        //   in Loop: Header=BB124_35 Depth=1
	mov	x1, r2
add	x1, 1
	jl	t5, t4, .LBB124_72
	jmp	.LBB124_71
.LBB124_71:                             //   in Loop: Header=BB124_35 Depth=1
	mov	r1, 1
	mov	r0, t5
	call	__bit_shl
	mov	t5, rax
	add	t5, x11
	mov	r0, t5
add	r0, 1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, r2
add	r0, 2
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r1, -4
	mov	x3, rax
	call	__bit_and
	mov	x4, rax
	mov	x5, [x4]
	mov	r1, 3
	mov	r0, x3
	call	__bit_shl
	mov	r0, 255
	mov	x3, rax
	mov	r1, x3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[x4], rax
	mov	r0, x1
	call	__bit_and
	mov	r1, -4
	mov	x2, rax
	call	__bit_and
	mov	x1, rax
	mov	x3, [x1]
	mov	r1, 3
	mov	r0, x2
	call	__bit_shl
	mov	r0, 255
	mov	x2, rax
	mov	r1, x2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r0, 46
	mov	x3, rax
	mov	r1, x2
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x1], rax
	mov	r0, t5
	call	__bit_shr
	mov	r1, 3
	mov	x1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t5, rax
	jmp	.LBB124_73
.LBB124_72:                             //   in Loop: Header=BB124_35 Depth=1
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	r1, -4
	mov	x2, rax
	call	__bit_and
	mov	x1, rax
	mov	x3, [x1]
	mov	r1, 3
	mov	r0, x2
	call	__bit_shl
	mov	r0, 255
	mov	x2, rax
	mov	r1, x2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r0, 46
	mov	x3, rax
	mov	r1, x2
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 48
	mov	[x1], rax
	mov	r0, t5
	call	__bit_or
	mov	t5, rax
.LBB124_73:                             //   in Loop: Header=BB124_35 Depth=1
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	x1, rax
	call	__bit_and
	mov	r2, rax
	mov	x2, [r2]
	mov	r1, 3
	mov	r0, x1
	call	__bit_shl
	mov	r1, 255
	mov	x1, rax
	mov	r0, t5
	call	__bit_and
	mov	r0, 255
	mov	t5, rax
	mov	r1, x1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, t5
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	mov	r0, x0
add	r0, 1
	jmp	.LBB124_75
.LBB124_74:                             //   in Loop: Header=BB124_35 Depth=1
	mov	r0, r4
	add	r0, x12
	mov	r1, 3
add	t5, 48
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	x1, rax
	mov	x2, [x1]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r1, 255
	mov	r2, rax
	mov	r0, t5
	call	__bit_and
	mov	r0, 255
	mov	t5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, t5
	call	__bit_and
	mov	r0, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, 1
.LBB124_75:                             //   in Loop: Header=BB124_35 Depth=1
	add	x12, r0
	mov	r2, x0
	jmp	.LBB124_77
.LBB124_76:
	mov	r2, x0
	jmp	.LBB124_130
.LBB124_77:                             //   in Loop: Header=BB124_35 Depth=1
	jg	x14, r6, .LBB124_35
	jmp	.LBB124_78
.LBB124_78:
	mov	[rsp+1], r5
	mov	t6, 0
	mov	r0, [rsp]
	mov	x10, 0
	jl	r0, t6, .LBB124_80
	jmp	.LBB124_129
.LBB124_79:
	mov	r0, t2
	call	__bit_not
	mul	rax, 78913
	mov	r1, 18
	mov	r0, rax
	call	__bit_shr
add	rax, -15
	mov	r1, 65535
	mov	r0, rax
	call	__bit_and
	mul	rax, 58255
	mov	r1, 19
	mov	r0, rax
	call	__bit_shr
	mov	r2, rax
	mov	r0, 1
	sub	r0, r2
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	r2, -1
add	rax, 1
	mov	r0, rax
	mov	r1, r2
	call	__bit_and
	mov	t6, rax
	mov	r0, 0
	mov	[rsp+1], r0
	mov	r2, 0
.LBB124_80:
	mov	x11, rsp
	mov	x15, rsp
	mov	t3, rsp
	mov	r6, rsp
	mov	x7, rsp
	mov	r0, [rsp]
	sub	x10, r0
add	x11, 20
add	x15, 16
add	t3, 12
add	r6, 8
add	x7, 4
	mov	r7, 200
	mov	t4, -2147483645
	mov	x13, r2
.LBB124_81:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB124_117 Depth 2
                                        //     Child Loop BB124_96 Depth 2
                                        //     Child Loop BB124_99 Depth 2
	mov	t7, t6
	mov	[x11], 0
	mov	[x15], 0
	mov	[t3], 0
	mov	[r6], 0
	mov	[x7], 0
	mov	[rsp+4], 0
add	t6, 1
	jz	t7, .LBB124_83
	jmp	.LBB124_82
.LBB124_82:                             //   in Loop: Header=BB124_81 Depth=1
	mov	r0, t7
	mul	r0, 9
	jg	r0, x10, .LBB124_84
	jmp	.LBB124_83
.LBB124_83:                             //   in Loop: Header=BB124_81 Depth=1
	mov	r7, x12
	mov	x12, r4
	mov	t2, x9
	mov	x14, x10
	mov	r0, x10
	mov	r1, t6
	mov	r2, rsp
	call	ryu_fill_pow10_split_2_exp
	mov	r5, x7
	mov	t5, [x7]
	mov	x1, [rsp+4]
	mov	r1, 0
	mov	r3, 0
	mov	r0, t5
	mov	x10, [rsp+3]
	mov	r2, x10
	call	__muldi3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	call	__muldi3
	mov	r1, 31
	mov	r2, t0
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
	add	x2, r2
	mov	r1, 31
	add	x0, x3
	mov	r0, x2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 0
	mov	x2, rax
	mov	r0, x1
	mov	r2, t1
	call	__muldi3
	add	x2, t0
	add	x0, x2
	mov	r1, 31
	mov	r0, x0
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 0
	mov	x1, rax
	mov	r0, t5
	call	__muldi3
	mov	x3, rax
	mov	r2, t0
	mov	r1, 31
	add	x3, x0
	mov	r0, x2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	add	x4, r2
	mov	r4, r6
	mov	r0, [r6]
	mov	r6, t3
	mov	t5, [t3]
	mov	r1, 0
	add	x4, x1
	mov	r2, x10
	call	__muldi3
	mov	x5, rax
	mov	x0, t0
	mov	r2, t1
	call	__muldi3
	mov	x6, rax
	mov	x7, t0
	mov	r0, t5
	mov	r2, x10
	call	__muldi3
	mov	x8, rax
	mov	x9, t0
	mov	r2, t1
	call	__muldi3
	mov	x1, rax
	mov	x2, t0
	mov	r0, x0
	mov	r2, x8
	mov	r3, x9
	call	__adddi3
	mov	x0, t0
	mov	r0, rax
	mov	r2, x6
	mov	r3, x7
	call	__adddi3
	mov	x6, rax
	mov	t5, t0
	mov	r0, x5
	mov	r2, x3
	mov	r3, x4
	call	__adddi3
	mov	r2, 0
	mov	r1, t0
	mov	r0, rax
	mov	r3, x6
	call	__adddi3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r3
	mov	r1, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	r3, x4
	mov	r1, 31
	mov	x4, rax
	mov	r0, r3
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	r2, x3
	mov	r1, 31
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	x4, 1
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	add	r3, rax
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	mov	t3, x15
	mov	r0, [x15]
	mov	x15, x11
	mov	x4, [x11]
	mov	r1, 0
	mov	r3, 0
	mov	x3, rax
	mov	r2, x10
	call	__muldi3
	mov	x5, rax
	mov	x6, t0
	mov	r2, t1
	call	__muldi3
	mov	x7, rax
	mov	x8, t0
	mov	r0, x4
	mov	r2, x10
	call	__muldi3
	mov	x9, rax
	mov	x10, t0
	mov	r2, t1
	call	__muldi3
	mov	x4, rax
	mov	x11, t0
	mov	r0, x6
	mov	r2, x9
	mov	r3, x10
	call	__adddi3
	mov	x6, t0
	mov	r0, rax
	mov	r2, x7
	mov	r3, x8
	call	__adddi3
	mov	x7, rax
	mov	x8, t0
	mov	r0, x5
	mov	r2, x1
	mov	r3, x2
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x0
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t5
	call	__adddi3
	mov	r2, 0
	mov	x0, rax
	mov	t5, t0
	mov	r0, x0
	mov	r1, t5
	mov	r3, x7
	call	__adddi3
	mov	r1, 0
	mov	x1, t0
	mov	r0, x6
	mov	r2, x4
	mov	r3, x11
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x8
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x3
	call	__adddi3
	mov	r1, -512
	mov	x2, rax
	mov	x3, t0
	mov	r0, x2
	call	__bit_and
	mov	r2, 0
	mov	r3, 1000000000
	mov	x4, rax
	mov	r1, x3
	call	__umoddi3
	mov	r1, 1073741823
	mov	r0, t0
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, x4
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x2
	mov	r3, x3
	call	__adddi3
	mov	r1, -512
	mov	x2, rax
	mov	r0, x0
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	x3, rax
	mov	r0, x1
	mov	r1, x2
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x1
	mov	r3, x2
	call	__adddi3
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, x3
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x0
	mov	r3, t5
	call	__adddi3
	mov	t5, rax
	jz	x13, .LBB124_101
	jmp	.LBB124_85
.LBB124_84:                             //   in Loop: Header=BB124_81 Depth=1
	mov	r2, 0
	jz	x13, .LBB124_128
	jmp	.LBB124_86
.LBB124_85:                             //   in Loop: Header=BB124_81 Depth=1
	mov	r3, x13
add	r3, 9
	mov	r1, -2147483648
	mov	r2, 9
	mov	x9, t2
	mov	r0, x9
	call	__bit_xor
	mov	t7, rax
	mov	r0, r3
	call	__bit_xor
	mov	x10, x14
	mov	x11, x15
	mov	x15, t3
	mov	t3, r6
	mov	r6, r4
	mov	r4, x12
	mov	x12, r7
	mov	x7, r5
	mov	r7, 200
	mov	r5, mcasm_static_5e6e12c67207ca8d73d385863abbfac5
	jg	rax, t7, .LBB124_127
	jmp	.LBB124_88
.LBB124_86:                             //   in Loop: Header=BB124_81 Depth=1
	mov	r3, x13
add	r3, 9
	mov	r2, 9
	mov	r1, -2147483648
	mov	t5, 0
	mov	r0, x9
	call	__bit_xor
	mov	t7, rax
	mov	r0, r3
	call	__bit_xor
	jg	rax, t7, .LBB124_127
	jmp	.LBB124_87
.LBB124_87:                             //   in Loop: Header=BB124_81 Depth=1
	mov	r2, r4
	add	r2, x12
	jmp	.LBB124_90
.LBB124_88:                             //   in Loop: Header=BB124_81 Depth=1
	mov	r2, r4
	add	r2, x12
	jz	t5, .LBB124_90
	jmp	.LBB124_89
.LBB124_89:                             // %memcpy.exit77
                                        //   in Loop: Header=BB124_81 Depth=1
	mov	x3, r2
	mov	r1, 10000
add	x3, 7
	mov	r0, t5
	call	__udivsi3
	mov	t7, rax
	mov	r0, t7
	mul	r0, -10000
	add	r0, t5
	mov	r1, 100
	call	__udivsi3
	mov	x0, rax
	mov	t0, x0
	mul	t0, -100
	add	t0, r0
	mov	r1, 1
	mov	r0, t0
	call	__bit_shl
	mov	r0, rax
	add	r0, r5
	mov	x1, r0
	mov	r1, 2
add	x1, 1
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	x2, r2
	mov	r1, 3
add	x2, 8
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x5, rax
	call	__bit_and
	mov	x3, rax
	mov	x6, [x3]
	mov	r1, 3
	mov	r0, x5
	call	__bit_shl
	mov	r0, 255
	mov	x5, rax
	mov	r1, x5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x3], rax
	mov	r0, x1
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -4
	mov	x3, rax
	call	__bit_and
	mov	x2, rax
	mov	x4, [x2]
	mov	r1, 3
	mov	r0, x3
	call	__bit_shl
	mov	r0, 255
	mov	x3, rax
	mov	r1, x3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x2], rax
	mov	x2, r2
	mov	r1, 1
add	x2, 5
	mov	r0, x0
	call	__bit_shl
	mov	r0, rax
	add	r0, r5
	mov	x0, r0
	mov	r1, 2
add	x0, 1
	call	__bit_shr
	mov	r1, 3
	mov	x1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x3, rax
	mov	x1, r2
	mov	r1, 3
add	x1, 6
	mov	r0, x2
	call	__bit_and
	mov	r1, -4
	mov	x4, rax
	call	__bit_and
	mov	x2, rax
	mov	x5, [x2]
	mov	r1, 3
	mov	r0, x4
	call	__bit_shl
	mov	r0, 255
	mov	x4, rax
	mov	r1, x4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x2], rax
	mov	r0, x0
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, -4
	mov	x2, rax
	call	__bit_and
	mov	x1, rax
	mov	x3, [x1]
	mov	r1, 3
	mov	r0, x2
	call	__bit_shl
	mov	r0, 255
	mov	x2, rax
	mov	r1, x2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 100000000
	mov	[x1], rax
	mov	r0, t5
	call	__udivsi3
	mov	t5, rax
	mov	r0, t5
	mul	r0, -10000
	add	r0, t7
	mov	r1, 100
	call	__udivsi3
	mov	t7, rax
	mov	t0, t7
	mul	t0, -100
	add	t0, r0
	mov	r1, 1
	mov	r0, t0
	call	__bit_shl
	mov	r0, rax
	mov	x2, r2
	add	r0, r5
add	x2, 3
	mov	x0, r0
	mov	r1, 2
add	x0, 1
	call	__bit_shr
	mov	r1, 3
	mov	x1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x3, rax
	mov	x1, r2
	mov	r1, 3
add	x1, 4
	mov	r0, x2
	call	__bit_and
	mov	r1, -4
	mov	x4, rax
	call	__bit_and
	mov	x2, rax
	mov	x5, [x2]
	mov	r1, 3
	mov	r0, x4
	call	__bit_shl
	mov	r0, 255
	mov	x4, rax
	mov	r1, x4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x2], rax
	mov	r0, x0
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, -4
	mov	x2, rax
	call	__bit_and
	mov	x1, rax
	mov	x3, [x1]
	mov	r1, 3
	mov	r0, x2
	call	__bit_shl
	mov	r0, 255
	mov	x2, rax
	mov	r1, x2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x1], rax
	mov	r0, t7
	call	__bit_shl
	mov	r0, rax
	add	r0, r5
	mov	x0, r2
add	x0, 1
	mov	t7, r0
	mov	r1, 2
add	t7, 1
	call	__bit_shr
	mov	r1, 3
	mov	x1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, -4
	mov	x2, rax
	call	__bit_and
	mov	x0, rax
	mov	x3, [x0]
	mov	r1, 3
	mov	r0, x2
	call	__bit_shl
	mov	r0, 255
	mov	x2, rax
	mov	r1, x2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
	mov	x0, r2
	mov	r1, 2
add	x0, 2
	mov	r0, t7
	call	__bit_shr
	mov	r1, 3
	mov	x1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t7, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, -4
	mov	x1, rax
	call	__bit_and
	mov	x0, rax
	mov	x2, [x0]
	mov	r1, 3
	mov	r0, x1
	call	__bit_shl
	mov	r0, 255
	mov	x1, rax
	mov	r1, x1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, t7
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
	mov	r1, 3
add	t5, 48
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	t7, rax
	call	__bit_and
	mov	r2, rax
	mov	x0, [r2]
	mov	r1, 3
	mov	r0, t7
	call	__bit_shl
	mov	r0, 255
	mov	t7, rax
	mov	r1, t7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x0
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, t5
	call	__bit_and
	mov	r0, rax
	mov	r1, t7
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
	jmp	.LBB124_100
.LBB124_90:                             //   in Loop: Header=BB124_81 Depth=1
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	t5, 9
	jz	rax, .LBB124_95
	jmp	.LBB124_91
.LBB124_91:                             // %.preheader111.preheader
                                        //   in Loop: Header=BB124_81 Depth=1
	mov	x1, r4
	add	x1, x12
	mov	t7, x1
add	t7, 1
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	t5, rax
	call	__bit_and
	mov	r2, rax
	mov	x0, [r2]
	mov	r1, 3
	mov	r0, t5
	call	__bit_shl
	mov	r0, 255
	mov	t5, rax
	mov	r1, t5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x0
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x0, rax
	mov	r1, t5
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r2], rax
	mov	r0, t7
	call	__bit_and
	mov	t5, 8
	mov	r2, t7
	jz	rax, .LBB124_95
	jmp	.LBB124_92
.LBB124_92:                             // %.preheader111.1
                                        //   in Loop: Header=BB124_81 Depth=1
	mov	r2, x1
add	r2, 2
	mov	r0, t7
	call	__bit_and
	mov	r1, -4
	mov	t5, rax
	call	__bit_and
	mov	t7, rax
	mov	x0, [t7]
	mov	r1, 3
	mov	r0, t5
	call	__bit_shl
	mov	r0, 255
	mov	t5, rax
	mov	r1, t5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x0
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x0, rax
	mov	r1, t5
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[t7], rax
	mov	r0, r2
	call	__bit_and
	mov	t5, 7
	jz	rax, .LBB124_95
	jmp	.LBB124_93
.LBB124_93:                             // %.preheader111.2
                                        //   in Loop: Header=BB124_81 Depth=1
	mov	t7, x1
add	t7, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	t5, rax
	call	__bit_and
	mov	r2, rax
	mov	x0, [r2]
	mov	r1, 3
	mov	r0, t5
	call	__bit_shl
	mov	r0, 255
	mov	t5, rax
	mov	r1, t5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x0
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x0, rax
	mov	r1, t5
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r2], rax
	mov	r0, t7
	call	__bit_and
	mov	t5, 6
	mov	r2, t7
	jz	rax, .LBB124_95
	jmp	.LBB124_94
.LBB124_94:                             // %.preheader111.3
                                        //   in Loop: Header=BB124_81 Depth=1
add	x1, 4
	mov	r0, t7
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	t5, rax
	mov	t7, [t5]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t7
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t7, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, t7
	mov	r1, rax
	call	__bit_or
	mov	[t5], rax
	mov	t5, 5
	mov	r2, x1
.LBB124_95:                             // %.thread98.preheader
                                        //   in Loop: Header=BB124_81 Depth=1
.LBB124_96:                             // %.thread98
                                        //   Parent Loop BB124_81 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	[r2], 808464432
add	t5, -4
	mov	r1, -2147483648
add	r2, 4
	mov	r0, t5
	call	__bit_xor
	jg	rax, t4, .LBB124_96
	jmp	.LBB124_97
.LBB124_97:                             // %.loopexit5.i82
                                        //   in Loop: Header=BB124_81 Depth=1
	jz	t5, .LBB124_100
	jmp	.LBB124_98
.LBB124_98:                             // %.preheader110.preheader
                                        //   in Loop: Header=BB124_81 Depth=1
	mov	x2, 0
.LBB124_99:                             // %.preheader110
                                        //   Parent Loop BB124_81 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, r2
	add	r0, x2
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	t7, rax
	call	__bit_and
	mov	x0, rax
	mov	x1, [x0]
	mov	r1, 3
	mov	r0, t7
	call	__bit_shl
	mov	r0, 255
	mov	t7, rax
	mov	r1, t7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	x1, rax
	mov	r1, t7
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
add	x2, 1
	mov	[x0], rax
	jne	t5, x2, .LBB124_99
	jmp	.LBB124_100
.LBB124_100:                            // %memset.exit84
                                        //   in Loop: Header=BB124_81 Depth=1
add	x12, 9
	mov	r2, r3
	jmp	.LBB124_128
.LBB124_101:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r2, 0
	mov	x9, t2
	mov	x10, x14
	mov	x11, x15
	mov	x15, t3
	mov	t3, r6
	mov	r6, r4
	mov	r4, x12
	mov	x12, r7
	mov	x7, r5
	mov	r7, 200
	mov	x14, mcasm_static_5e6e12c67207ca8d73d385863abbfac5
	jz	t5, .LBB124_128
	jmp	.LBB124_102
.LBB124_102:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r1, -2147483648
	mov	r0, t5
	call	__bit_xor
	mov	r0, -1147483648
	jl	rax, r0, .LBB124_104
	jmp	.LBB124_103
.LBB124_103:
	call	abort
.LBB124_104:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r2, 9
	mov	r0, 99999999
	jg	t5, r0, .LBB124_113
	jmp	.LBB124_105
.LBB124_105:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r2, 8
	mov	r0, 9999999
	jg	t5, r0, .LBB124_113
	jmp	.LBB124_106
.LBB124_106:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r2, 7
	mov	r0, 999999
	jg	t5, r0, .LBB124_113
	jmp	.LBB124_107
.LBB124_107:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r2, 6
	mov	r0, 99999
	jg	t5, r0, .LBB124_113
	jmp	.LBB124_108
.LBB124_108:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r2, 5
	mov	r0, 9999
	jg	t5, r0, .LBB124_113
	jmp	.LBB124_109
.LBB124_109:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r2, 4
	mov	r0, 999
	jg	t5, r0, .LBB124_113
	jmp	.LBB124_110
.LBB124_110:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r2, 3
	mov	r0, 99
	jg	t5, r0, .LBB124_113
	jmp	.LBB124_111
.LBB124_111:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r2, 2
	mov	r0, 9
	jg	t5, r0, .LBB124_113
	jmp	.LBB124_112
.LBB124_112:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r2, 1
.LBB124_113:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r0, t7
	call	__bit_not
	mul	rax, 9
	add	rax, r2
add	rax, -1
	mov	[rsp+1], rax
	mov	r0, x9
	call	__bit_xor
	mov	r3, rax
	mov	r0, r2
	call	__bit_xor
	jg	rax, r3, .LBB124_127
	jmp	.LBB124_114
.LBB124_114:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r0, [rsp+2]
	jz	r0, .LBB124_125
	jmp	.LBB124_115
.LBB124_115:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r3, r4
	add	r3, x12
	mov	x0, 0
	mov	t2, 99999999
	mov	r0, 10000
	jl	t5, r0, .LBB124_119
	jmp	.LBB124_116
.LBB124_116:                            //   in Loop: Header=BB124_81 Depth=1
	mov	x8, r3
	add	x8, r2
	mov	x7, 0
.LBB124_117:                            // %memcpy.exit85
                                        //   Parent Loop BB124_81 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 10000
	mov	t7, t5
	mov	r0, t7
	call	__udivsi3
	mov	t5, rax
	mov	r0, t5
	mul	r0, -10000
	add	r0, t7
	mov	r1, 100
	call	__udivsi3
	mov	x1, rax
	mov	t0, x1
	mul	t0, -100
	add	t0, r0
	mov	r1, 1
	mov	r0, t0
	call	__bit_shl
	mov	x0, x8
	add	x0, x7
	mov	r0, rax
	mov	x3, x0
	add	r0, x14
add	x3, -1
	mov	x2, r0
	mov	r1, 2
add	x2, 1
	call	__bit_shr
	mov	r1, 3
	mov	x4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, -4
	mov	x5, rax
	call	__bit_and
	mov	x3, rax
	mov	x6, [x3]
	mov	r1, 3
	mov	r0, x5
	call	__bit_shl
	mov	r0, 255
	mov	x5, rax
	mov	r1, x5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x3], rax
	mov	r0, x2
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x2, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, -4
	mov	x3, rax
	call	__bit_and
	mov	x4, rax
	mov	x5, [x4]
	mov	r1, 3
	mov	r0, x3
	call	__bit_shl
	mov	r0, 255
	mov	x3, rax
	mov	r1, x3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x4], rax
	mov	r0, x1
	call	__bit_shl
	mov	r0, rax
	mov	x2, x0
	add	r0, x14
add	x2, -3
	mov	x1, r0
	mov	r1, 2
add	x1, 1
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x3, rax
	mov	r1, 3
add	x0, -2
	mov	r0, x2
	call	__bit_and
	mov	r1, -4
	mov	x4, rax
	call	__bit_and
	mov	x2, rax
	mov	x5, [x2]
	mov	r1, 3
	mov	r0, x4
	call	__bit_shl
	mov	r0, 255
	mov	x4, rax
	mov	r1, x4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x2], rax
	mov	r0, x1
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, -4
	mov	x2, rax
	call	__bit_and
	mov	x0, rax
	mov	x3, [x0]
	mov	r1, 3
	mov	r0, x2
	call	__bit_shl
	mov	r0, 255
	mov	x2, rax
	mov	r1, x2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
add	x7, -4
	jg	t7, t2, .LBB124_117
	jmp	.LBB124_118
.LBB124_118:                            // %.loopexit113.loopexit
                                        //   in Loop: Header=BB124_81 Depth=1
	mov	x0, 0
	sub	x0, x7
	mov	x7, r5
.LBB124_119:                            // %.loopexit113
                                        //   in Loop: Header=BB124_81 Depth=1
	mov	r0, 100
	jl	t5, r0, .LBB124_121
	jmp	.LBB124_120
.LBB124_120:                            // %memcpy.exit87.loopexit
                                        //   in Loop: Header=BB124_81 Depth=1
	mov	r1, 65532
	mov	r0, t5
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shr
	mul	rax, 5243
	mov	r1, 17
	mov	r0, rax
	call	__bit_shr
	mov	t7, rax
	mov	r0, t7
	mul	r0, -100
	add	r0, t5
	mov	r1, 65535
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_shl
	mov	t5, r3
	add	t5, r2
	sub	t5, x0
	mov	r0, rax
	mov	x1, t5
	add	r0, x14
add	x1, -1
	mov	x0, r0
	mov	r1, 2
add	x0, 1
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, -4
	mov	x3, rax
	call	__bit_and
	mov	x1, rax
	mov	x4, [x1]
	mov	r1, 3
	mov	r0, x3
	call	__bit_shl
	mov	r0, 255
	mov	x3, rax
	mov	r1, x3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x1], rax
	mov	r0, x0
	call	__bit_shr
	mov	r1, 3
	mov	x1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	x0, rax
	mov	r0, t5
	call	__bit_and
	mov	r1, -4
	mov	x1, rax
	call	__bit_and
	mov	t5, rax
	mov	x2, [t5]
	mov	r1, 3
	mov	r0, x1
	call	__bit_shl
	mov	r0, 255
	mov	x1, rax
	mov	r1, x1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[t5], rax
	mov	t5, t7
.LBB124_121:                            // %memcpy.exit87
                                        //   in Loop: Header=BB124_81 Depth=1
	mov	r0, 10
	jl	t5, r0, .LBB124_123
	jmp	.LBB124_122
.LBB124_122:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r1, 1
	mov	r0, t5
	call	__bit_shl
	mov	t5, rax
	add	t5, x14
	mov	r0, t5
add	r0, 1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, r3
add	r0, 2
	mov	r1, 3
	mov	t7, rax
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	x1, rax
	mov	x2, [x1]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r0, 255
	mov	x0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, t7
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, r3
add	r0, 1
	mov	r1, 3
	mov	[x1], rax
	call	__bit_and
	mov	r1, -4
	mov	t7, rax
	call	__bit_and
	mov	x0, rax
	mov	x1, [x0]
	mov	r1, 3
	mov	r0, t7
	call	__bit_shl
	mov	r0, 255
	mov	t7, rax
	mov	r1, t7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r0, 46
	mov	x1, rax
	mov	r1, t7
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x0], rax
	mov	r0, t5
	call	__bit_shr
	mov	r1, 3
	mov	t7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t5, rax
	jmp	.LBB124_124
.LBB124_123:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r0, r3
add	r0, 1
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	t7, rax
	call	__bit_and
	mov	x0, rax
	mov	x1, [x0]
	mov	r1, 3
	mov	r0, t7
	call	__bit_shl
	mov	r0, 255
	mov	t7, rax
	mov	r1, t7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r0, 46
	mov	x1, rax
	mov	r1, t7
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 48
	mov	[x0], rax
	mov	r0, t5
	call	__bit_or
	mov	t5, rax
.LBB124_124:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	t7, rax
	call	__bit_and
	mov	r3, rax
	mov	x0, [r3]
	mov	r1, 3
	mov	r0, t7
	call	__bit_shl
	mov	r1, 255
	mov	t7, rax
	mov	r0, t5
	call	__bit_and
	mov	r0, 255
	mov	t5, rax
	mov	r1, t7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x0
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, t5
	call	__bit_and
	mov	r0, rax
	mov	r1, t7
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r0, r2
add	r0, 1
	jmp	.LBB124_126
.LBB124_125:                            //   in Loop: Header=BB124_81 Depth=1
	mov	r0, r4
	add	r0, x12
	mov	r1, 3
add	x0, 48
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	t5, rax
	mov	t7, [t5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r1, 255
	mov	r3, rax
	mov	r0, x0
	call	__bit_and
	mov	r0, 255
	mov	x0, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t7, rax
	mov	r0, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, t7
	mov	r1, rax
	call	__bit_or
	mov	[t5], rax
	mov	r0, 1
.LBB124_126:                            //   in Loop: Header=BB124_81 Depth=1
	add	x12, r0
	jmp	.LBB124_128
.LBB124_127:
	mov	r7, [rsp+3]
	mov	r5, [rsp+1]
	jmp	.LBB124_130
.LBB124_128:                            //   in Loop: Header=BB124_81 Depth=1
	mov	x13, r2
	jne	t6, r7, .LBB124_81
	jmp	.LBB124_129
.LBB124_129:                            // %.loopexit114
	sub	x9, r2
	mov	r3, 0
	mov	x13, r2
	mov	t4, x9
	mov	t5, 0
	mov	r5, [rsp+1]
	jmp	.LBB124_134
.LBB124_130:
	mov	t4, x9
	sub	t4, x13
	mov	r3, 0
	mov	r0, t4
	call	__bit_xor
	mov	t6, rax
	mov	r0, r2
	call	__bit_xor
	jle	rax, t6, .LBB124_134
	jmp	.LBB124_131
.LBB124_131:
	mov	r3, [rsp+2]
	sub	r3, r2
add	r3, 1
	mov	r1, 10
.LBB124_132:                            // =>This Inner Loop Header: Depth=1
	mov	r0, t5
	call	__udivsi3
add	r3, 1
	mov	t5, rax
	jne	x13, r3, .LBB124_132
	jmp	.LBB124_133
.LBB124_133:
	mov	r3, t5
	mul	r3, -10
	add	r3, r0
	mov	r0, 5
	je	r3, r0, .LBB124_135
	jmp	.LBB124_134
.LBB124_134:
	mov	r1, -2147483648
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483643
	sub	r0, rax
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	jmp	.LBB124_149
.LBB124_135:
	sub	x9, r5
	mov	r0, [rsp]
	add	r0, x9
	mov	r3, 0
	sub	r3, r0
	mov	t3, 1
	jl	r3, t3, .LBB124_140
	jmp	.LBB124_136
.LBB124_136:
	mov	r0, 59
	mov	r2, 1
	jg	r3, r0, .LBB124_149
	jmp	.LBB124_137
.LBB124_137:
	mov	r0, r7
	mov	r1, t1
	call	__bit_or
	jnz	rax, .LBB124_139
	jmp	.LBB124_138
.LBB124_138:
	call	abort
.LBB124_139:
	mov	r1, 31
	mov	r0, r3
	call	__bit_and
	mov	r2, rax
	mov	r1, 0
	sub	r1, r2
	mov	t3, 0
	mov	r0, r2
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	r3, -32
	mov	t6, rax
	mov	r0, r3
	call	__bit_shr
	mov	r0, -1
	mov	r3, rax
	mov	r1, r2
	call	__bit_shl
	mov	t7, 0
	sub	t7, r3
	mov	r3, rax
	mov	r0, t7
	call	__bit_not
	mov	r0, r3
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	sub	r0, r2
	mov	r1, 31
	mov	r2, rax
	call	__bit_and
	mov	r0, -1
	mov	r1, rax
	call	__bit_shr
	sub	t3, t6
	mov	r0, rax
	mov	r1, t3
	call	__bit_and
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, t7
	call	__bit_and
	mov	r0, rax
	mov	r1, r2
	call	__bit_or
	mov	r2, rax
	mov	r0, r3
	mov	r1, t7
	call	__bit_and
	mov	r1, rax
	mov	r0, r2
	call	__bit_not
	mov	r2, rax
	mov	r0, r1
	call	__bit_not
	mov	r3, rax
	mov	r0, t1
	mov	r1, r2
	call	__bit_and
	mov	r2, rax
	mov	r0, r7
	mov	r1, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r2
	call	__bit_or
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	t3, rax
.LBB124_140:
	mov	r0, -1
	jg	x9, r0, .LBB124_147
	jmp	.LBB124_141
.LBB124_141:
	mov	r1, 1
	mov	r0, t3
	call	__bit_and
	jz	rax, .LBB124_147
	jmp	.LBB124_142
.LBB124_142:
	mov	r0, r7
	mov	r1, t1
	call	__bit_or
	jz	rax, .LBB124_144
	jmp	.LBB124_143
.LBB124_143:                            // %.preheader109.preheader
	mov	t3, 0
	sub	t3, x9
	mov	t2, -1
	jmp	.LBB124_145
.LBB124_144:
	call	abort
.LBB124_145:                            // %.preheader109
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, -858993459
	mov	r3, -858993460
	mov	r0, r7
	mov	r1, t1
	call	__muldi3
	mov	r1, 858993459
	mov	r7, rax
	mov	t1, t0
	mov	r0, t1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, t1
add	r0, -858993459
	mov	r1, 31
	mov	r2, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, r7
add	r0, -858993460
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, r3
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	rax, r3
add	t2, 1
	jnz	rax, .LBB124_145
	jmp	.LBB124_146
.LBB124_146:
	mov	r1, -2147483648
	mov	r2, 1
	mov	r0, t3
	call	__bit_xor
	mov	r3, rax
	mov	r0, t2
	call	__bit_xor
	jge	rax, r3, .LBB124_148
	jmp	.LBB124_149
.LBB124_147:
	mov	r1, -2147483648
	mov	r0, x9
	call	__bit_xor
	mov	r1, 2147483647
	mov	r0, rax
	call	__bit_xor
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r2, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, t3
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB124_149
	jmp	.LBB124_148
.LBB124_148:
	mov	r2, 2
.LBB124_149:
	jz	x13, .LBB124_171
	jmp	.LBB124_150
.LBB124_150:
	mov	r3, r4
	add	r3, x12
	jnz	t5, .LBB124_166
	jmp	.LBB124_151
.LBB124_151:
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r6, t4
	jz	rax, .LBB124_156
	jmp	.LBB124_152
.LBB124_152:                            // %.preheader106.preheader
	mov	t3, r4
	add	t3, x12
add	t3, 1
	mov	t2, 0
.LBB124_153:                            // %.preheader106
                                        // =>This Inner Loop Header: Depth=1
	je	t4, t2, .LBB124_183
	jmp	.LBB124_154
.LBB124_154:                            //   in Loop: Header=BB124_153 Depth=1
	mov	r0, r3
	add	r0, t2
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t1, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r0, t3
	add	r0, t2
	mov	r1, 3
	mov	[r7], rax
	call	__bit_and
add	t2, 1
	jnz	rax, .LBB124_153
	jmp	.LBB124_155
.LBB124_155:                            // %.loopexit7.i88.loopexit
	add	r3, t2
	mov	r6, t4
	sub	r6, t2
.LBB124_156:                            // %.loopexit7.i88
	mov	r1, -2147483648
	mov	r0, r6
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB124_163
	jmp	.LBB124_157
.LBB124_157:
	mov	r0, r6
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB124_159
	jmp	.LBB124_158
.LBB124_158:                            // %.preheader.i90.preheader
	mov	r7, -2147483633
	jmp	.LBB124_161
.LBB124_159:                            // %.preheader435
	mov	r7, -2147483645
	jmp	.LBB124_162
.LBB124_160:
	mov	r0, 3
	jg	r6, r0, .LBB124_159
	jmp	.LBB124_163
.LBB124_161:                            // %.preheader.i90
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r3
add	r0, 4
	mov	[r3], 808464432
	mov	r1, r3
add	r1, 8
	mov	[r0], 808464432
	mov	r0, r3
add	r0, 12
	mov	[r1], 808464432
add	r3, 16
add	r6, -16
	mov	r1, -2147483648
	mov	[r0], 808464432
	mov	r0, r6
	call	__bit_xor
	jg	rax, r7, .LBB124_161
	jmp	.LBB124_160
.LBB124_162:                            // =>This Inner Loop Header: Depth=1
	mov	[r3], 808464432
add	r6, -4
add	r3, 4
	mov	r0, r6
	call	__bit_xor
	jg	rax, r7, .LBB124_162
	jmp	.LBB124_163
.LBB124_163:                            // %.loopexit5.i89
	jz	r6, .LBB124_183
	jmp	.LBB124_164
.LBB124_164:                            // %.preheader105.preheader
	mov	t2, r3
.LBB124_165:                            // %.preheader105
                                        // =>This Inner Loop Header: Depth=1
add	r6, -1
	mov	r1, 3
add	t2, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r3, rax
	mov	t1, [r3]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t1, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r3, t2
	jz	r6, .LBB124_183
	jmp	.LBB124_165
.LBB124_166:
	mov	r7, t4
add	r7, -1
	mov	r6, 0
	jz	r7, .LBB124_169
	jmp	.LBB124_167
.LBB124_167:
	mov	t1, x12
	add	t1, t4
	add	t1, r4
add	t1, -1
	mov	x1, mcasm_static_5e6e12c67207ca8d73d385863abbfac5
	mov	r0, t5
.LBB124_168:                            // %memcpy.exit92
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 100
	call	__udivsi3
	mov	t5, rax
	mov	r1, t5
	mul	r1, -100
	add	r0, r1
	mov	r1, 1
	call	__bit_shl
	mov	r0, rax
	mov	t3, t1
	add	r0, x1
add	t3, -1
	mov	t2, r0
	mov	r1, 2
add	t2, 1
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t6, rax
	mov	r0, t3
	call	__bit_and
	mov	r1, -4
	mov	t7, rax
	call	__bit_and
	mov	t3, rax
	mov	x0, [t3]
	mov	r1, 3
	mov	r0, t7
	call	__bit_shl
	mov	r0, 255
	mov	t7, rax
	mov	r1, t7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x0
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, t6
	call	__bit_and
	mov	r0, rax
	mov	r1, t7
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[t3], rax
	mov	r0, t2
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t2, rax
	mov	r0, t1
	call	__bit_and
	mov	r1, -4
	mov	t3, rax
	call	__bit_and
	mov	t6, rax
	mov	t7, [t6]
	mov	r1, 3
	mov	r0, t3
	call	__bit_shl
	mov	r0, 255
	mov	t3, rax
	mov	r1, t3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t7, rax
	mov	r0, t2
	call	__bit_and
	mov	r0, rax
	mov	r1, t3
	call	__bit_shl
	mov	r0, t7
	mov	r1, rax
	call	__bit_or
	mov	[t6], rax
add	r6, 2
	mov	r1, -2147483648
add	t1, -2
	mov	r0, r7
	call	__bit_xor
	mov	t2, rax
	mov	r0, r6
	call	__bit_xor
	mov	r0, t5
	jl	rax, t2, .LBB124_168
	jmp	.LBB124_169
.LBB124_169:                            // %.loopexit108
	mov	r1, -2147483648
	mov	r0, t4
	call	__bit_xor
	mov	r7, rax
	mov	r0, r6
	call	__bit_xor
	jge	rax, r7, .LBB124_183
	jmp	.LBB124_170
.LBB124_170:
	mov	r1, 10
	mov	r0, t5
	call	__umodsi3
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r7, rax
	mov	r0, r6
	call	__bit_not
	add	r3, t4
	add	r3, rax
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r3, rax
	mov	t1, [r3]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	mov	r0, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB124_183
.LBB124_171:
	mov	r0, [rsp+2]
	jz	r0, .LBB124_182
	jmp	.LBB124_172
.LBB124_172:
	mov	r3, r4
	add	r3, x12
	mov	r1, -2147483648
	mov	t1, 0
	mov	r0, t5
	call	__bit_xor
	mov	r0, -2147473648
	mov	r6, r3
	add	r6, t4
	jl	rax, r0, .LBB124_176
	jmp	.LBB124_173
.LBB124_173:
	mov	x2, 0
	mov	x3, mcasm_static_5e6e12c67207ca8d73d385863abbfac5
	mov	x4, -2047483649
.LBB124_174:                            // %memcpy.exit93
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 10000
	mov	r7, t5
	mov	r0, r7
	call	__udivsi3
	mov	t5, rax
	mov	r0, t5
	mul	r0, -10000
	add	r0, r7
	mov	r1, 100
	call	__udivsi3
	mov	t2, rax
	mov	t0, t2
	mul	t0, -100
	add	t0, r0
	mov	r1, 1
	mov	r0, t0
	call	__bit_shl
	mov	t1, r6
	add	t1, x2
	mov	r0, rax
	mov	t6, t1
	add	r0, x3
add	t6, -1
	mov	t3, r0
	mov	r1, 2
add	t3, 1
	call	__bit_shr
	mov	r1, 3
	mov	t7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t7, rax
	mov	r0, t6
	call	__bit_and
	mov	r1, -4
	mov	x0, rax
	call	__bit_and
	mov	t6, rax
	mov	x1, [t6]
	mov	r1, 3
	mov	r0, x0
	call	__bit_shl
	mov	r0, 255
	mov	x0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, t7
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[t6], rax
	mov	r0, t3
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t3, rax
	mov	r0, t1
	call	__bit_and
	mov	r1, -4
	mov	t6, rax
	call	__bit_and
	mov	t7, rax
	mov	x0, [t7]
	mov	r1, 3
	mov	r0, t6
	call	__bit_shl
	mov	r0, 255
	mov	t6, rax
	mov	r1, t6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x0
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, t3
	call	__bit_and
	mov	r0, rax
	mov	r1, t6
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[t7], rax
	mov	r0, t2
	call	__bit_shl
	mov	r0, rax
	mov	t3, t1
	add	r0, x3
add	t3, -3
	mov	t2, r0
	mov	r1, 2
add	t2, 1
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t6, rax
	mov	r1, 3
add	t1, -2
	mov	r0, t3
	call	__bit_and
	mov	r1, -4
	mov	t7, rax
	call	__bit_and
	mov	t3, rax
	mov	x0, [t3]
	mov	r1, 3
	mov	r0, t7
	call	__bit_shl
	mov	r0, 255
	mov	t7, rax
	mov	r1, t7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x0
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, t6
	call	__bit_and
	mov	r0, rax
	mov	r1, t7
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[t3], rax
	mov	r0, t2
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t2, rax
	mov	r0, t1
	call	__bit_and
	mov	r1, -4
	mov	t3, rax
	call	__bit_and
	mov	t1, rax
	mov	t6, [t1]
	mov	r1, 3
	mov	r0, t3
	call	__bit_shl
	mov	r0, 255
	mov	t3, rax
	mov	r1, t3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t6, rax
	mov	r0, t2
	call	__bit_and
	mov	r0, rax
	mov	r1, t3
	call	__bit_shl
	mov	r0, t6
	mov	r1, rax
	call	__bit_or
	mov	[t1], rax
	mov	r1, -2147483648
add	x2, -4
	mov	r0, r7
	call	__bit_xor
	jg	rax, x4, .LBB124_174
	jmp	.LBB124_175
.LBB124_175:                            // %.loopexit104.loopexit
	mov	t1, 0
	sub	t1, x2
.LBB124_176:                            // %.loopexit104
	mov	r0, 100
	jl	t5, r0, .LBB124_178
	jmp	.LBB124_177
.LBB124_177:                            // %memcpy.exit95.loopexit
	mov	r1, 65532
	mov	r0, t5
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shr
	mul	rax, 5243
	mov	r1, 17
	mov	r0, rax
	call	__bit_shr
	mov	r7, rax
	mov	r0, r7
	mul	r0, -100
	add	r0, t5
	mov	r1, 65535
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_shl
	sub	r6, t1
	mov	t2, r6
	mov	r0, mcasm_static_5e6e12c67207ca8d73d385863abbfac5
	add	r0, rax
add	t2, -1
	mov	t1, r0
	mov	r1, 2
add	t1, 1
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t3, rax
	mov	r0, t2
	call	__bit_and
	mov	r1, -4
	mov	t5, rax
	call	__bit_and
	mov	t2, rax
	mov	t6, [t2]
	mov	r1, 3
	mov	r0, t5
	call	__bit_shl
	mov	r0, 255
	mov	t5, rax
	mov	r1, t5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t6, rax
	mov	r0, t3
	call	__bit_and
	mov	r0, rax
	mov	r1, t5
	call	__bit_shl
	mov	r0, t6
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[t2], rax
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t1, rax
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	r6, rax
	mov	t3, [r6]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r0, 255
	mov	t2, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
	mov	t5, r7
.LBB124_178:                            // %memcpy.exit95
	mov	r0, 10
	jl	t5, r0, .LBB124_180
	jmp	.LBB124_179
.LBB124_179:
	mov	r1, 1
	mov	r0, t5
	call	__bit_shl
	mov	r6, mcasm_static_5e6e12c67207ca8d73d385863abbfac5
	add	r6, rax
	mov	r0, r6
add	r0, 1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, r3
add	r0, 2
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r1, -4
	mov	t1, rax
	call	__bit_and
	mov	t2, rax
	mov	t3, [t2]
	mov	r1, 3
	mov	r0, t1
	call	__bit_shl
	mov	r0, 255
	mov	t1, rax
	mov	r1, t1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, r7
	call	__bit_and
	mov	r0, rax
	mov	r1, t1
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	r0, r3
add	r0, 1
	mov	r1, 3
	mov	[t2], rax
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	t1, rax
	mov	t2, [t1]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r0, 46
	mov	t2, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[t1], rax
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	jmp	.LBB124_181
.LBB124_180:
	mov	r0, r3
add	r0, 1
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 46
	mov	t1, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	r1, 48
	mov	[r7], rax
	mov	r0, t5
	call	__bit_or
	mov	r6, rax
.LBB124_181:
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r3, rax
	mov	t1, [r3]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r1, 255
	mov	r7, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, 255
	mov	r6, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
add	t4, 1
	jmp	.LBB124_183
.LBB124_182:
	mov	r0, r4
	add	r0, x12
	mov	r1, 3
add	t5, 48
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r1, 255
	mov	r3, rax
	mov	r0, t5
	call	__bit_and
	mov	r0, 255
	mov	t1, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r7, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
	mov	t4, 1
.LBB124_183:                            // %memset.exit91
	add	t4, x12
	jz	r2, .LBB124_196
	jmp	.LBB124_184
.LBB124_184:
	mov	r6, 0
	jz	t4, .LBB124_190
	jmp	.LBB124_185
.LBB124_185:                            // %.preheader103.preheader
	mov	t2, r4
add	t2, -1
	mov	t3, 46
	mov	t5, 57
	mov	r3, t4
.LBB124_186:                            // %.preheader103
                                        // =>This Inner Loop Header: Depth=1
	mov	r7, t2
	add	r7, r3
	mov	r1, 2
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	rax, t3, .LBB124_195
	jmp	.LBB124_187
.LBB124_187:                            // %.preheader103
                                        //   in Loop: Header=BB124_186 Depth=1
	je	rax, t5, .LBB124_191
	jmp	.LBB124_188
.LBB124_188:                            // %.preheader103
	mov	r0, 45
	jne	rax, r0, .LBB124_192
	jmp	.LBB124_189
.LBB124_189:                            // %.preheader103..loopexit.loopexit_crit_edge
	mov	r6, r3
.LBB124_190:                            // %.loopexit
	add	r6, r4
	mov	r1, 3
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r6, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 49
	mov	r6, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
add	r5, 1
	jmp	.LBB124_196
.LBB124_191:                            //   in Loop: Header=BB124_186 Depth=1
	mov	r1, 3
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r0, 48
	mov	t1, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
	mov	r2, 1
	jmp	.LBB124_195
.LBB124_192:
	mov	r1, 1
	mov	r6, rax
	mov	r0, rax
	call	__bit_and
	mov	r0, 2
	jne	r2, r0, .LBB124_194
	jmp	.LBB124_193
.LBB124_193:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB124_196
	jmp	.LBB124_194
.LBB124_194:
	add	r3, r4
add	r3, -1
	mov	r1, 3
	mov	r2, r6
add	r2, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r3, rax
	mov	r7, [r3]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r1, 255
	mov	r6, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, 255
	mov	r2, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r7, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	jmp	.LBB124_196
.LBB124_195:                            //   in Loop: Header=BB124_186 Depth=1
add	r3, -1
	jz	r3, .LBB124_190
	jmp	.LBB124_186
.LBB124_196:
	mov	r2, r4
	add	r2, t4
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	t1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 101
	mov	r7, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[r6], rax
	mov	r0, r5
	call	__bit_xor
add	rax, -2147483648
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 2
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
add	r3, 43
	jg	r5, t1, .LBB124_198
	jmp	.LBB124_197
.LBB124_197:
	mov	r0, 0
	sub	r0, r5
	mov	r5, r0
.LBB124_198:
	mov	r0, r2
add	r0, 1
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r1, 255
	mov	r6, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, 255
	mov	r3, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
	mov	r6, t4
	mov	r0, 100
add	r6, 2
	jl	r5, r0, .LBB124_200
	jmp	.LBB124_199
.LBB124_199:                            // %memcpy.exit96
	mov	r1, 10
	mov	r0, r5
	call	__udivsi3
	mov	r3, rax
	mov	r1, 1
	add	r4, r6
	mov	r0, r3
	call	__bit_shl
	mov	r0, mcasm_static_5e6e12c67207ca8d73d385863abbfac5
	add	r0, rax
	mov	r6, r0
	mov	r1, 2
add	r6, 1
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r7, r4
	mov	r1, 3
add	r7, 1
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	r4, rax
	mov	t3, [r4]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r0, 255
	mov	t2, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[r4], rax
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r4, rax
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r4
	call	__bit_and
	mov	r0, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mul	r3, 246
	add	r3, r5
	mov	r1, 48
	mov	[r7], rax
	mov	r0, r3
	call	__bit_or
add	r2, 4
	mov	r1, 3
	mov	r3, rax
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r2, rax
	mov	r5, [r2]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r1, 255
	mov	r4, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, 255
	mov	r3, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r5, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r2], rax
add	t4, 5
	jmp	.LBB124_201
.LBB124_200:                            // %memcpy.exit97
	mov	r1, 1
	add	r4, r6
	mov	r0, r5
	call	__bit_shl
	mov	r0, mcasm_static_5e6e12c67207ca8d73d385863abbfac5
	add	r0, rax
	mov	r2, r0
	mov	r1, 2
add	r2, 1
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	mov	r3, r4
	mov	r1, 3
add	r3, 1
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r4, rax
	mov	r7, [r4]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r7, rax
	mov	r0, r5
	call	__bit_and
	mov	r0, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[r4], rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r2, rax
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r5, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
add	t4, 4
.LBB124_201:                            // %memcpy.exit63
	mov	rax, t4
	mov	x15, [rsp+10]
	mov	x14, [rsp+11]
	mov	x13, [rsp+12]
	mov	x12, [rsp+13]
	mov	x11, [rsp+14]
	mov	x10, [rsp+15]
	mov	x9, [rsp+16]
	mov	x8, [rsp+17]
	mov	x7, [rsp+18]
	mov	x6, [rsp+19]
	mov	x5, [rsp+20]
	mov	x4, [rsp+21]
	mov	x3, [rsp+22]
	mov	x2, [rsp+23]
	mov	x1, [rsp+24]
	mov	x0, [rsp+25]
add	rsp, 104
	ret
// -- End function
// -- Begin function d2exp_buffered
d2exp_buffered:                         // @d2exp_buffered
// %bb.0:
	call	d2exp_buffered_n
	mov	r0, rax
	add	r0, r3
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r4, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r4
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r4, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	ret
// -- End function
// -- Begin function d2exp
d2exp:                                  // @d2exp
// %bb.0:
	mov	r3, r0
	mov	r0, 2000
	call	malloc
	mov	r4, rax
	mov	r0, r3
	mov	r3, r4
	call	d2exp_buffered_n
	mov	r0, rax
	add	r0, r4
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	rax, r4
	ret
// -- End function
// -- Begin function strtol
strtol:                                 // @strtol
// %bb.0:
	mov	r3, r1
	mov	r1, -2147483648
	mov	r7, r2
	mov	r2, r0
	mov	r0, r7
	call	__bit_xor
	mov	r0, -2147483612
	jg	rax, r0, .LBB127_3
	jmp	.LBB127_1
.LBB127_1:
	mov	r0, 1
	je	r7, r0, .LBB127_3
	jmp	.LBB127_2
.LBB127_2:                              // %.preheader6.preheader
	mov	r5, r2
add	r5, 1
	mov	r6, -2147483643
	mov	t1, 32
	jmp	.LBB127_5
.LBB127_3:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 22
	mov	r7, 0
	jz	r3, .LBB127_40
	jmp	.LBB127_4
.LBB127_4:
	mov	[r3], r2
	jmp	.LBB127_40
.LBB127_5:                              // %.preheader6
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r5
add	r0, -1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	mov	r0, t2
add	r0, -9
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, r6, .LBB127_9
	jmp	.LBB127_6
.LBB127_6:                              // %.preheader6
                                        //   in Loop: Header=BB127_5 Depth=1
	je	t2, t1, .LBB127_9
	jmp	.LBB127_7
.LBB127_7:                              // %.preheader6
	mov	r0, 43
	je	t2, r0, .LBB127_11
	jmp	.LBB127_8
.LBB127_8:                              // %.preheader6
	mov	r0, 45
	je	t2, r0, .LBB127_10
	jmp	.LBB127_13
.LBB127_9:                              // %.preheader6.backedge
                                        //   in Loop: Header=BB127_5 Depth=1
add	r5, 1
	jmp	.LBB127_5
.LBB127_10:                             // %.loopexit8.loopexit
	mov	r4, 1
	jmp	.LBB127_12
.LBB127_11:                             // %.loopexit8.loopexit1
	mov	r4, 0
.LBB127_12:                             // %.loopexit8
	mov	t1, r5
	mov	r1, 2
add	t1, 1
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	mov	r5, t1
	jmp	.LBB127_14
.LBB127_13:                             // %.loopexit7.loopexit
	mov	r4, 0
.LBB127_14:                             // %.loopexit7
	mov	r1, 255
	mov	r0, t2
	call	__bit_and
	mov	r0, 48
	jne	rax, r0, .LBB127_20
	jmp	.LBB127_15
.LBB127_15:
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -33
	mov	r0, rax
	call	__bit_and
	mov	r1, 47
	mov	r6, rax
	mov	r0, r7
	call	__bit_and
	jnz	rax, .LBB127_18
	jmp	.LBB127_16
.LBB127_16:
	mov	r1, 255
	mov	r0, r6
	call	__bit_and
	mov	r0, 88
	jne	rax, r0, .LBB127_18
	jmp	.LBB127_17
.LBB127_17:
	mov	r0, r5
add	r0, 1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	mov	t4, r5
add	t4, 2
	mov	r6, 16
	mov	r2, r5
	jmp	.LBB127_22
.LBB127_18:
	mov	r6, 8
	mov	t2, 48
	mov	t4, r5
	jz	r7, .LBB127_22
	jmp	.LBB127_19
.LBB127_19:
	mov	t4, r5
	mov	r6, r7
	jmp	.LBB127_22
.LBB127_20:
	mov	r6, 10
	mov	t4, r5
	jz	r7, .LBB127_22
	jmp	.LBB127_21
.LBB127_21:
	mov	t4, r5
	mov	r6, r7
.LBB127_22:
	mov	r5, r4
add	r5, 2147483647
	mov	r0, r5
	mov	r1, r6
	call	__udivsi3
	mov	r1, 255
	mov	t1, rax
	mov	r0, t2
	call	__bit_and
	mov	r7, rax
	mov	r0, r7
add	r0, -1
	mov	r1, 32
	call	__bit_or
	mov	t3, rax
	mov	r1, -2147483648
add	t3, -38
	mov	r0, r7
	call	__bit_xor
	mov	r0, -2147483591
	jg	rax, r0, .LBB127_24
	jmp	.LBB127_23
.LBB127_23:
	mov	t3, r7
.LBB127_24:
add	t3, -48
	mov	r7, 0
	mov	r0, r6
	call	__bit_xor
	mov	t2, rax
	mov	r0, t3
	call	__bit_xor
	jge	rax, t2, .LBB127_34
	jmp	.LBB127_25
.LBB127_25:                             // %.preheader.preheader
	mov	r0, t1
	mul	r0, r6
	mov	t2, r5
	sub	t2, r0
add	t4, -1
	mov	t5, -2147483591
	mov	r2, t4
.LBB127_26:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, -2147483648
	mov	r0, t1
	call	__bit_xor
	mov	t4, rax
	mov	r0, r7
	call	__bit_xor
	jg	rax, t4, .LBB127_29
	jmp	.LBB127_27
.LBB127_27:                             //   in Loop: Header=BB127_26 Depth=1
	mov	r0, t2
	call	__bit_xor
	mov	t4, rax
	mov	r0, t3
	call	__bit_xor
	jle	rax, t4, .LBB127_30
	jmp	.LBB127_28
.LBB127_28:                             //   in Loop: Header=BB127_26 Depth=1
	jne	r7, t1, .LBB127_30
	jmp	.LBB127_29
.LBB127_29:                             //   in Loop: Header=BB127_26 Depth=1
	mov	r1, 2
	mov	r0, r4
	call	__bit_or
	mov	r4, rax
	jmp	.LBB127_31
.LBB127_30:                             //   in Loop: Header=BB127_26 Depth=1
	mul	r7, r6
	add	r7, t3
.LBB127_31:                             //   in Loop: Header=BB127_26 Depth=1
add	r2, 1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t4, rax
	mov	r0, t4
add	r0, -1
	mov	r1, 32
	call	__bit_or
	mov	t3, rax
	mov	r1, -2147483648
add	t3, -38
	mov	r0, t4
	call	__bit_xor
	jg	rax, t5, .LBB127_33
	jmp	.LBB127_32
.LBB127_32:                             //   in Loop: Header=BB127_26 Depth=1
	mov	t3, t4
.LBB127_33:                             //   in Loop: Header=BB127_26 Depth=1
add	t3, -48
	mov	r0, r6
	call	__bit_xor
	mov	t4, rax
	mov	r0, t3
	call	__bit_xor
	jl	rax, t4, .LBB127_26
	jmp	.LBB127_34
.LBB127_34:                             // %.loopexit
	jz	r3, .LBB127_36
	jmp	.LBB127_35
.LBB127_35:
	mov	[r3], r2
.LBB127_36:
	mov	r1, 255
	mov	r0, r4
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB127_38
	jmp	.LBB127_37
.LBB127_37:
	mov	r1, 0
	sub	r1, r7
	mov	r7, r1
.LBB127_38:
	mov	r1, 2
	call	__bit_and
	jz	rax, .LBB127_40
	jmp	.LBB127_39
.LBB127_39:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 34
	mov	r7, r5
.LBB127_40:
	mov	rax, r7
	ret
// -- End function
// -- Begin function strtoll
strtoll:                                // @strtoll
// %bb.0:
sub	rsp, 8
	mov	[rsp+1], x0
	mov	[rsp], x1
	mov	r4, r1
	mov	r1, -2147483648
	mov	r3, r2
	mov	r5, r0
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483612
	jg	rax, r0, .LBB128_3
	jmp	.LBB128_1
.LBB128_1:
	mov	r0, 1
	je	r3, r0, .LBB128_3
	jmp	.LBB128_2
.LBB128_2:                              // %.preheader.preheader
	mov	r7, -2147483643
	mov	t1, 32
	mov	r2, r5
	jmp	.LBB128_5
.LBB128_3:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 22
	mov	t4, 0
	mov	t3, 0
	jz	r4, .LBB128_46
	jmp	.LBB128_4
.LBB128_4:
	mov	[r4], r5
	jmp	.LBB128_46
.LBB128_5:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	mov	r0, r6
add	r0, -9
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, r7, .LBB128_9
	jmp	.LBB128_6
.LBB128_6:                              // %.preheader
                                        //   in Loop: Header=BB128_5 Depth=1
	je	r6, t1, .LBB128_9
	jmp	.LBB128_7
.LBB128_7:                              // %.preheader
	mov	r0, 43
	je	r6, r0, .LBB128_10
	jmp	.LBB128_8
.LBB128_8:                              // %.preheader
	mov	r0, 45
	je	r6, r0, .LBB128_10
	jmp	.LBB128_11
.LBB128_9:                              // %isspace.exit
                                        //   in Loop: Header=BB128_5 Depth=1
add	r2, 1
	jmp	.LBB128_5
.LBB128_10:
	mov	r1, 255
add	r2, 1
	mov	r0, r6
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r6, rax
	jmp	.LBB128_12
.LBB128_11:                             // %.loopexit51.loopexit
	mov	r6, 1
.LBB128_12:                             // %.loopexit51
	mov	r1, 16
	mov	t1, 16
	mov	r0, r3
	call	__bit_or
	mov	r7, r3
	je	rax, t1, .LBB128_13
	jmp	.LBB128_18
.LBB128_13:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, 48
	mov	r7, 10
	jne	rax, r0, .LBB128_16
	jmp	.LBB128_14
.LBB128_14:
	mov	r0, r2
add	r0, 1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 32
	mov	r7, 8
	mov	r0, rax
	call	__bit_or
	mov	r0, 120
	je	rax, r0, .LBB128_15
	jmp	.LBB128_16
.LBB128_15:
add	r2, 2
	mov	r7, 16
	jmp	.LBB128_18
.LBB128_16:
	jz	r3, .LBB128_18
	jmp	.LBB128_17
.LBB128_17:
	mov	r7, r3
.LBB128_18:
	mov	t1, 2147483647
	mov	t2, -1
	jnz	r6, .LBB128_20
	jmp	.LBB128_19
.LBB128_19:
	mov	t1, -2147483648
	mov	t2, 0
.LBB128_20:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	mov	r0, r3
add	r0, -48
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483638
	jl	rax, r1, .LBB128_25
	jmp	.LBB128_21
.LBB128_21:
	mov	r0, r3
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	t3, -2147483622
	jl	rax, t3, .LBB128_24
	jmp	.LBB128_22
.LBB128_22:
	mov	r0, r3
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	r3, -87
	mov	r0, rax
	call	__bit_xor
	mov	r0, r3
	jl	rax, t3, .LBB128_25
	jmp	.LBB128_23
.LBB128_23:
	mov	r0, 36
	jmp	.LBB128_25
.LBB128_24:
add	r3, -55
	mov	r0, r3
.LBB128_25:
	mov	t4, 0
	mov	t3, 0
	jge	r0, r7, .LBB128_42
	jmp	.LBB128_26
.LBB128_26:
add	r2, 1
	mov	t7, -2147483638
	mov	x0, -2147483623
	mov	x1, -2147483622
	mov	r5, r2
	mov	t4, r0
.LBB128_27:                             // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	mov	t5, r2
add	t5, -48
	mov	r1, -2147483648
	mov	r0, t5
	call	__bit_xor
	jl	rax, t7, .LBB128_32
	jmp	.LBB128_28
.LBB128_28:                             //   in Loop: Header=BB128_27 Depth=1
	mov	r0, r2
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, x0, .LBB128_30
	jmp	.LBB128_29
.LBB128_29:                             //   in Loop: Header=BB128_27 Depth=1
add	r2, -55
	mov	t5, r2
	jmp	.LBB128_32
.LBB128_30:                             //   in Loop: Header=BB128_27 Depth=1
	mov	r0, r2
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	r2, -87
	mov	r0, rax
	call	__bit_xor
	mov	t5, r2
	jl	rax, x1, .LBB128_32
	jmp	.LBB128_31
.LBB128_31:                             //   in Loop: Header=BB128_27 Depth=1
	mov	t5, 36
.LBB128_32:                             //   in Loop: Header=BB128_27 Depth=1
	jge	t5, r7, .LBB128_42
	jmp	.LBB128_33
.LBB128_33:                             //   in Loop: Header=BB128_27 Depth=1
	mov	r3, 0
	mov	r0, t2
	mov	r1, t1
	mov	r2, t5
	call	__subdi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, r7
	call	__udivdi3
	mov	r2, rax
	mov	r3, t0
	mov	r0, t3
	mov	r1, r3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	r3, t3
	mov	r1, 31
	mov	t6, rax
	mov	r0, r3
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_xor
	sub	r2, t4
	mov	r1, 31
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_xor
	sub	rax, r3
add	t6, 1
	mov	r0, t6
	mov	r1, rax
	call	__bit_and
	add	rax, r3
	jnz	rax, .LBB128_41
	jmp	.LBB128_34
.LBB128_34:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 34
	mov	r3, -2147483638
	mov	t5, -2147483623
	mov	t6, -2147483622
.LBB128_35:                             // =>This Inner Loop Header: Depth=1
add	r5, 1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	mov	r0, r2
add	r0, -48
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, r3, .LBB128_40
	jmp	.LBB128_36
.LBB128_36:                             //   in Loop: Header=BB128_35 Depth=1
	mov	r0, r2
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, t5, .LBB128_38
	jmp	.LBB128_37
.LBB128_37:                             //   in Loop: Header=BB128_35 Depth=1
add	r2, -55
	mov	r0, r2
	jmp	.LBB128_40
.LBB128_38:                             //   in Loop: Header=BB128_35 Depth=1
	mov	r0, r2
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	r2, -87
	mov	r0, rax
	call	__bit_xor
	mov	r0, r2
	jl	rax, t6, .LBB128_40
	jmp	.LBB128_39
.LBB128_39:                             //   in Loop: Header=BB128_35 Depth=1
	mov	r0, 36
.LBB128_40:                             //   in Loop: Header=BB128_35 Depth=1
	mov	t4, t2
	mov	t3, t1
	jl	r0, r7, .LBB128_35
	jmp	.LBB128_42
.LBB128_41:                             //   in Loop: Header=BB128_27 Depth=1
	mov	r3, 0
	mov	r0, t4
	mov	r1, t3
	mov	r2, r7
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t5
	call	__adddi3
	mov	t4, rax
	mov	t3, t0
add	r5, 1
	jmp	.LBB128_27
.LBB128_42:                             // %.loopexit
	jz	r4, .LBB128_44
	jmp	.LBB128_43
.LBB128_43:
	mov	[r4], r5
.LBB128_44:
	mov	r0, 0
	mov	r1, 0
	mov	r2, t4
	mov	r3, t3
	call	__subdi3
	jnz	r6, .LBB128_46
	jmp	.LBB128_45
.LBB128_45:
	mov	t4, rax
	mov	t3, t0
.LBB128_46:
	mov	rax, t4
	mov	t0, t3
	mov	x1, [rsp]
	mov	x0, [rsp+1]
add	rsp, 8
	ret
// -- End function
// -- Begin function strtoul
strtoul:                                // @strtoul
// %bb.0:
	mov	r3, r1
	mov	r1, -2147483648
	mov	r7, r2
	mov	r2, r0
	mov	r0, r7
	call	__bit_xor
	mov	r0, -2147483612
	jg	rax, r0, .LBB129_3
	jmp	.LBB129_1
.LBB129_1:
	mov	r0, 1
	je	r7, r0, .LBB129_3
	jmp	.LBB129_2
.LBB129_2:                              // %.preheader6.preheader
	mov	r6, r2
add	r6, 1
	mov	r5, -2147483643
	mov	t1, 32
	jmp	.LBB129_5
.LBB129_3:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 22
	mov	r6, 0
	jz	r3, .LBB129_40
	jmp	.LBB129_4
.LBB129_4:
	mov	[r3], r2
	jmp	.LBB129_40
.LBB129_5:                              // %.preheader6
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r6
add	r0, -1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	mov	r0, t2
add	r0, -9
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, r5, .LBB129_9
	jmp	.LBB129_6
.LBB129_6:                              // %.preheader6
                                        //   in Loop: Header=BB129_5 Depth=1
	je	t2, t1, .LBB129_9
	jmp	.LBB129_7
.LBB129_7:                              // %.preheader6
	mov	r0, 43
	je	t2, r0, .LBB129_11
	jmp	.LBB129_8
.LBB129_8:                              // %.preheader6
	mov	r0, 45
	je	t2, r0, .LBB129_10
	jmp	.LBB129_13
.LBB129_9:                              // %.preheader6.backedge
                                        //   in Loop: Header=BB129_5 Depth=1
add	r6, 1
	jmp	.LBB129_5
.LBB129_10:                             // %.loopexit8.loopexit
	mov	r4, 1
	jmp	.LBB129_12
.LBB129_11:                             // %.loopexit8.loopexit1
	mov	r4, 0
.LBB129_12:                             // %.loopexit8
	mov	t1, r6
	mov	r1, 2
add	t1, 1
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	mov	r6, t1
	jmp	.LBB129_14
.LBB129_13:                             // %.loopexit7.loopexit
	mov	r4, 0
.LBB129_14:                             // %.loopexit7
	mov	r1, 255
	mov	r0, t2
	call	__bit_and
	mov	r0, 48
	jne	rax, r0, .LBB129_20
	jmp	.LBB129_15
.LBB129_15:
	mov	r1, 2
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -33
	mov	r0, rax
	call	__bit_and
	mov	r1, 47
	mov	r5, rax
	mov	r0, r7
	call	__bit_and
	jnz	rax, .LBB129_18
	jmp	.LBB129_16
.LBB129_16:
	mov	r1, 255
	mov	r0, r5
	call	__bit_and
	mov	r0, 88
	jne	rax, r0, .LBB129_18
	jmp	.LBB129_17
.LBB129_17:
	mov	r0, r6
add	r0, 1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	mov	t5, r6
add	t5, 2
	mov	r5, 16
	mov	r2, r6
	jmp	.LBB129_22
.LBB129_18:
	mov	t2, 48
	mov	r5, 8
	mov	t5, r6
	jz	r7, .LBB129_22
	jmp	.LBB129_19
.LBB129_19:
	mov	r5, r7
	mov	t5, r6
	jmp	.LBB129_22
.LBB129_20:
	mov	r5, 10
	mov	t5, r6
	jz	r7, .LBB129_22
	jmp	.LBB129_21
.LBB129_21:
	mov	r5, r7
	mov	t5, r6
.LBB129_22:
	mov	r0, -1
	mov	r1, r5
	call	__udivsi3
	mov	r7, rax
	mov	r0, r7
	mul	r0, r5
	call	__bit_not
	mov	r1, 255
	mov	t1, rax
	mov	r0, t2
	call	__bit_and
	mov	r6, rax
	mov	r0, r6
add	r0, -1
	mov	r1, 32
	call	__bit_or
	mov	t2, rax
	mov	r1, -2147483648
add	t2, -38
	mov	r0, r6
	call	__bit_xor
	mov	r0, -2147483591
	jg	rax, r0, .LBB129_24
	jmp	.LBB129_23
.LBB129_23:
	mov	t2, r6
.LBB129_24:
add	t2, -48
	mov	r6, 0
	mov	r0, r5
	call	__bit_xor
	mov	t3, rax
	mov	r0, t2
	call	__bit_xor
	jge	rax, t3, .LBB129_34
	jmp	.LBB129_25
.LBB129_25:                             // %.preheader.preheader
add	t5, -1
	mov	t4, -2147483591
	mov	r2, t5
.LBB129_26:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, -2147483648
	mov	r0, r7
	call	__bit_xor
	mov	t3, rax
	mov	r0, r6
	call	__bit_xor
	jg	rax, t3, .LBB129_29
	jmp	.LBB129_27
.LBB129_27:                             //   in Loop: Header=BB129_26 Depth=1
	mov	r0, t1
	call	__bit_xor
	mov	t3, rax
	mov	r0, t2
	call	__bit_xor
	jle	rax, t3, .LBB129_30
	jmp	.LBB129_28
.LBB129_28:                             //   in Loop: Header=BB129_26 Depth=1
	jne	r6, r7, .LBB129_30
	jmp	.LBB129_29
.LBB129_29:                             //   in Loop: Header=BB129_26 Depth=1
	mov	r1, 2
	mov	r0, r4
	call	__bit_or
	mov	r4, rax
	jmp	.LBB129_31
.LBB129_30:                             //   in Loop: Header=BB129_26 Depth=1
	mul	r6, r5
	add	r6, t2
.LBB129_31:                             //   in Loop: Header=BB129_26 Depth=1
add	r2, 1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t3, rax
	mov	r0, t3
add	r0, -1
	mov	r1, 32
	call	__bit_or
	mov	t2, rax
	mov	r1, -2147483648
add	t2, -38
	mov	r0, t3
	call	__bit_xor
	jg	rax, t4, .LBB129_33
	jmp	.LBB129_32
.LBB129_32:                             //   in Loop: Header=BB129_26 Depth=1
	mov	t2, t3
.LBB129_33:                             //   in Loop: Header=BB129_26 Depth=1
add	t2, -48
	mov	r0, r5
	call	__bit_xor
	mov	t3, rax
	mov	r0, t2
	call	__bit_xor
	jl	rax, t3, .LBB129_26
	jmp	.LBB129_34
.LBB129_34:                             // %.loopexit
	jz	r3, .LBB129_36
	jmp	.LBB129_35
.LBB129_35:
	mov	[r3], r2
.LBB129_36:
	mov	r1, 255
	mov	r0, r4
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB129_38
	jmp	.LBB129_37
.LBB129_37:
	mov	r1, 0
	sub	r1, r6
	mov	r6, r1
.LBB129_38:
	mov	r1, 2
	call	__bit_and
	jz	rax, .LBB129_40
	jmp	.LBB129_39
.LBB129_39:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 34
	mov	r6, -1
.LBB129_40:
	mov	rax, r6
	ret
// -- End function
// -- Begin function strtoull
strtoull:                               // @strtoull
// %bb.0:
	mov	r4, r1
	mov	r1, -2147483648
	mov	r3, r2
	mov	r5, r0
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483612
	jg	rax, r0, .LBB130_3
	jmp	.LBB130_1
.LBB130_1:
	mov	r0, 1
	je	r3, r0, .LBB130_3
	jmp	.LBB130_2
.LBB130_2:                              // %.preheader.preheader
	mov	r7, -2147483643
	mov	t1, 32
	mov	r2, r5
	jmp	.LBB130_5
.LBB130_3:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 22
	mov	t2, 0
	mov	t1, 0
	jz	r4, .LBB130_44
	jmp	.LBB130_4
.LBB130_4:
	mov	[r4], r5
	jmp	.LBB130_44
.LBB130_5:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	mov	r0, r6
add	r0, -9
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, r7, .LBB130_9
	jmp	.LBB130_6
.LBB130_6:                              // %.preheader
                                        //   in Loop: Header=BB130_5 Depth=1
	je	r6, t1, .LBB130_9
	jmp	.LBB130_7
.LBB130_7:                              // %.preheader
	mov	r0, 43
	je	r6, r0, .LBB130_10
	jmp	.LBB130_8
.LBB130_8:                              // %.preheader
	mov	r0, 45
	je	r6, r0, .LBB130_10
	jmp	.LBB130_11
.LBB130_9:                              // %isspace.exit
                                        //   in Loop: Header=BB130_5 Depth=1
add	r2, 1
	jmp	.LBB130_5
.LBB130_10:
	mov	r1, 255
add	r2, 1
	mov	r0, r6
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r6, rax
	jmp	.LBB130_12
.LBB130_11:                             // %.loopexit51.loopexit
	mov	r6, 1
.LBB130_12:                             // %.loopexit51
	mov	r1, 16
	mov	t1, 16
	mov	r0, r3
	call	__bit_or
	mov	r7, r3
	je	rax, t1, .LBB130_13
	jmp	.LBB130_18
.LBB130_13:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, 48
	mov	r7, 10
	jne	rax, r0, .LBB130_16
	jmp	.LBB130_14
.LBB130_14:
	mov	r0, r2
add	r0, 1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 32
	mov	r7, 8
	mov	r0, rax
	call	__bit_or
	mov	r0, 120
	je	rax, r0, .LBB130_15
	jmp	.LBB130_16
.LBB130_15:
add	r2, 2
	mov	r7, 16
	jmp	.LBB130_18
.LBB130_16:
	jz	r3, .LBB130_18
	jmp	.LBB130_17
.LBB130_17:
	mov	r7, r3
.LBB130_18:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	mov	r0, r3
add	r0, -48
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483638
	jl	rax, r1, .LBB130_23
	jmp	.LBB130_19
.LBB130_19:
	mov	r0, r3
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	t1, -2147483622
	jl	rax, t1, .LBB130_22
	jmp	.LBB130_20
.LBB130_20:
	mov	r0, r3
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	r3, -87
	mov	r0, rax
	call	__bit_xor
	mov	r0, r3
	jl	rax, t1, .LBB130_23
	jmp	.LBB130_21
.LBB130_21:
	mov	r0, 36
	jmp	.LBB130_23
.LBB130_22:
add	r3, -55
	mov	r0, r3
.LBB130_23:
	mov	t2, 0
	mov	t1, 0
	jge	r0, r7, .LBB130_40
	jmp	.LBB130_24
.LBB130_24:
add	r2, 1
	mov	t5, -2147483638
	mov	t6, -2147483623
	mov	t7, -2147483622
	mov	r5, r2
	mov	t2, r0
.LBB130_25:                             // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	mov	t3, r2
add	t3, -48
	mov	r1, -2147483648
	mov	r0, t3
	call	__bit_xor
	jl	rax, t5, .LBB130_30
	jmp	.LBB130_26
.LBB130_26:                             //   in Loop: Header=BB130_25 Depth=1
	mov	r0, r2
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, t6, .LBB130_28
	jmp	.LBB130_27
.LBB130_27:                             //   in Loop: Header=BB130_25 Depth=1
add	r2, -55
	mov	t3, r2
	jmp	.LBB130_30
.LBB130_28:                             //   in Loop: Header=BB130_25 Depth=1
	mov	r0, r2
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	r2, -87
	mov	r0, rax
	call	__bit_xor
	mov	t3, r2
	jl	rax, t7, .LBB130_30
	jmp	.LBB130_29
.LBB130_29:                             //   in Loop: Header=BB130_25 Depth=1
	mov	t3, 36
.LBB130_30:                             //   in Loop: Header=BB130_25 Depth=1
	jge	t3, r7, .LBB130_40
	jmp	.LBB130_31
.LBB130_31:                             //   in Loop: Header=BB130_25 Depth=1
	mov	r0, t3
	call	__bit_not
	mov	r1, -1
	mov	r3, 0
	mov	r0, rax
	mov	r2, r7
	call	__udivdi3
	mov	r2, rax
	mov	r3, t0
	mov	r0, t1
	mov	r1, r3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	r3, t1
	mov	r1, 31
	mov	t4, rax
	mov	r0, r3
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_xor
	sub	r2, t2
	mov	r1, 31
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_xor
	sub	rax, r3
add	t4, 1
	mov	r0, t4
	mov	r1, rax
	call	__bit_and
	add	rax, r3
	jnz	rax, .LBB130_39
	jmp	.LBB130_32
.LBB130_32:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 34
	mov	r3, -2147483638
	mov	t3, -2147483623
	mov	t4, -2147483622
	mov	t2, -1
	mov	t1, -1
.LBB130_33:                             // =>This Inner Loop Header: Depth=1
add	r5, 1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	mov	r0, r2
add	r0, -48
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, r3, .LBB130_38
	jmp	.LBB130_34
.LBB130_34:                             //   in Loop: Header=BB130_33 Depth=1
	mov	r0, r2
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, t3, .LBB130_36
	jmp	.LBB130_35
.LBB130_35:                             //   in Loop: Header=BB130_33 Depth=1
add	r2, -55
	mov	r0, r2
	jmp	.LBB130_38
.LBB130_36:                             //   in Loop: Header=BB130_33 Depth=1
	mov	r0, r2
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	r2, -87
	mov	r0, rax
	call	__bit_xor
	mov	r0, r2
	jl	rax, t4, .LBB130_38
	jmp	.LBB130_37
.LBB130_37:                             //   in Loop: Header=BB130_33 Depth=1
	mov	r0, 36
.LBB130_38:                             //   in Loop: Header=BB130_33 Depth=1
	jl	r0, r7, .LBB130_33
	jmp	.LBB130_40
.LBB130_39:                             //   in Loop: Header=BB130_25 Depth=1
	mov	r3, 0
	mov	r0, t2
	mov	r1, t1
	mov	r2, r7
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, t3
	call	__adddi3
	mov	t2, rax
	mov	t1, t0
add	r5, 1
	jmp	.LBB130_25
.LBB130_40:                             // %.loopexit
	jz	r4, .LBB130_42
	jmp	.LBB130_41
.LBB130_41:
	mov	[r4], r5
.LBB130_42:
	mov	r0, 0
	mov	r1, 0
	mov	r2, t2
	mov	r3, t1
	call	__subdi3
	jnz	r6, .LBB130_44
	jmp	.LBB130_43
.LBB130_43:
	mov	t2, rax
	mov	t1, t0
.LBB130_44:
	mov	rax, t2
	mov	t0, t1
	ret
// -- End function
// -- Begin function bcmp
bcmp:                                   // @bcmp
// %bb.0:
	mov	r3, r1
	mov	r1, -2147483648
	mov	r4, r0
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB131_5
	jmp	.LBB131_1
.LBB131_1:
	mov	r0, r3
	mov	r1, r4
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB131_6
	jmp	.LBB131_2
.LBB131_2:                              // %.preheader.i.preheader
	mov	r5, -2147483645
.LBB131_3:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [r4]
	mov	r1, [r3]
	jne	r0, r1, .LBB131_6
	jmp	.LBB131_4
.LBB131_4:                              //   in Loop: Header=BB131_3 Depth=1
add	r4, 4
add	r2, -4
	mov	r1, -2147483648
add	r3, 4
	mov	r0, r2
	call	__bit_xor
	jg	rax, r5, .LBB131_3
	jmp	.LBB131_5
.LBB131_5:                              // %.loopexit8.i
	mov	rax, 0
	jz	r2, .LBB131_10
	jmp	.LBB131_6
.LBB131_6:                              // %.loopexit7.i.preheader
.LBB131_7:                              // %.loopexit7.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	r5, rax
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	r5, rax, .LBB131_9
	jmp	.LBB131_8
.LBB131_8:
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	mov	r0, r5
	call	__bit_and
	sub	rax, r2
	jmp	.LBB131_10
.LBB131_9:                              //   in Loop: Header=BB131_7 Depth=1
add	r2, -1
add	r4, 1
add	r3, 1
	mov	rax, 0
	jnz	r2, .LBB131_7
	jmp	.LBB131_10
.LBB131_10:                             // %memcmp.exit
	ret
// -- End function
// -- Begin function bcopy
bcopy:                                  // @bcopy
// %bb.0:
	mov	r3, r1
	mov	r1, -2147483648
	mov	r4, r0
	mov	r0, r3
	call	__bit_xor
	mov	r5, rax
	mov	r0, r4
	call	__bit_xor
	jge	rax, r5, .LBB132_10
	jmp	.LBB132_1
.LBB132_1:
	mov	r5, r4
	add	r5, r2
	mov	r0, r5
	call	__bit_xor
	mov	r6, rax
	mov	r0, r3
	call	__bit_xor
	jge	rax, r6, .LBB132_10
	jmp	.LBB132_2
.LBB132_2:
	mov	r6, r3
	add	r6, r2
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB132_7
	jmp	.LBB132_3
.LBB132_3:
	mov	r0, r5
	mov	r1, r6
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB132_8
	jmp	.LBB132_4
.LBB132_4:                              // %.preheader.i.preheader
	mov	r5, -2147483645
	mov	r1, -2147483648
.LBB132_5:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r4
	add	r0, r2
add	r0, -4
	mov	r0, [r0]
	mov	r6, r3
	add	r6, r2
add	r6, -4
add	r2, -4
	mov	[r6], r0
	mov	r0, r2
	call	__bit_xor
	jg	rax, r5, .LBB132_5
	jmp	.LBB132_6
.LBB132_6:                              // %.loopexit9.i.loopexit
	add	r4, r2
	add	r3, r2
	mov	r6, r3
	mov	r5, r4
.LBB132_7:                              // %.loopexit9.i
	jz	r2, .LBB132_21
	jmp	.LBB132_8
.LBB132_8:                              // %.preheader
add	r5, -1
add	r6, -1
.LBB132_9:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 2
add	r2, -1
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r3, rax
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, [r7]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
add	r5, -1
add	r6, -1
	jz	r2, .LBB132_21
	jmp	.LBB132_9
.LBB132_10:
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB132_18
	jmp	.LBB132_11
.LBB132_11:
	mov	r0, r3
	mov	r1, r4
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB132_19
	jmp	.LBB132_12
.LBB132_12:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB132_14
	jmp	.LBB132_13
.LBB132_13:                             // %.preheader12.i.preheader
	mov	r5, -2147483633
	jmp	.LBB132_16
.LBB132_14:                             // %.preheader54
	mov	r5, -2147483645
	jmp	.LBB132_17
.LBB132_15:
	mov	r0, 3
	jg	r2, r0, .LBB132_14
	jmp	.LBB132_18
.LBB132_16:                             // %.preheader12.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [r4]
	mov	r1, r4
add	r1, 4
	mov	[r3], r0
	mov	r0, [r1]
	mov	r1, r3
add	r1, 4
	mov	r6, r4
add	r6, 8
	mov	r7, r3
	mov	[r1], r0
	mov	r0, [r6]
add	r7, 8
	mov	r1, r4
add	r1, 12
	mov	r6, r3
add	r6, 12
	mov	[r7], r0
add	r4, 16
	mov	r0, [r1]
add	r3, 16
add	r2, -16
	mov	r1, -2147483648
	mov	[r6], r0
	mov	r0, r2
	call	__bit_xor
	jg	rax, r5, .LBB132_16
	jmp	.LBB132_15
.LBB132_17:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [r4]
add	r4, 4
	mov	[r3], r0
add	r2, -4
add	r3, 4
	mov	r0, r2
	call	__bit_xor
	jg	rax, r5, .LBB132_17
	jmp	.LBB132_18
.LBB132_18:                             // %.loopexit11.i
	jz	r2, .LBB132_21
	jmp	.LBB132_19
.LBB132_19:                             // %.preheader49
	mov	r7, r4
	mov	t1, r3
.LBB132_20:                             // =>This Inner Loop Header: Depth=1
add	r2, -1
	mov	r1, 2
add	r7, 1
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	mov	r1, 3
add	t1, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r3, rax
	mov	r6, [r3]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r6, rax
	mov	r0, r4
	call	__bit_and
	mov	r0, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r4, r7
	mov	r3, t1
	jnz	r2, .LBB132_20
	jmp	.LBB132_21
.LBB132_21:                             // %memmove.exit
	ret
// -- End function
// -- Begin function bzero
bzero:                                  // @bzero
// %bb.0:
	mov	r2, r1
	mov	r1, 3
	mov	r3, r0
	call	__bit_and
	jz	rax, .LBB133_4
	jmp	.LBB133_1
.LBB133_1:                              // %.preheader1.preheader
	mov	r4, r3
add	r4, 1
	mov	r0, r3
.LBB133_2:                              // %.preheader1
                                        // =>This Inner Loop Header: Depth=1
	jz	r2, .LBB133_14
	jmp	.LBB133_3
.LBB133_3:                              //   in Loop: Header=BB133_2 Depth=1
add	r2, -1
	mov	r3, r0
	mov	r1, 3
add	r3, 1
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r7, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[r6], rax
	mov	r0, r4
	call	__bit_and
add	r4, 1
	mov	r0, r3
	jnz	rax, .LBB133_2
	jmp	.LBB133_4
.LBB133_4:                              // %.loopexit7.i
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB133_11
	jmp	.LBB133_5
.LBB133_5:
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB133_7
	jmp	.LBB133_6
.LBB133_6:                              // %.preheader.i.preheader
	mov	r4, -2147483633
	jmp	.LBB133_9
.LBB133_7:                              // %.preheader30
	mov	r4, -2147483645
	jmp	.LBB133_10
.LBB133_8:
	mov	r0, 3
	jg	r2, r0, .LBB133_7
	jmp	.LBB133_11
.LBB133_9:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r3
add	r0, 4
	mov	[r3], 0
	mov	r1, r3
add	r1, 8
	mov	[r0], 0
	mov	r0, r3
add	r0, 12
	mov	[r1], 0
add	r3, 16
add	r2, -16
	mov	r1, -2147483648
	mov	[r0], 0
	mov	r0, r2
	call	__bit_xor
	jg	rax, r4, .LBB133_9
	jmp	.LBB133_8
.LBB133_10:                             // =>This Inner Loop Header: Depth=1
	mov	[r3], 0
add	r2, -4
add	r3, 4
	mov	r0, r2
	call	__bit_xor
	jg	rax, r4, .LBB133_10
	jmp	.LBB133_11
.LBB133_11:                             // %.loopexit5.i
	jz	r2, .LBB133_14
	jmp	.LBB133_12
.LBB133_12:                             // %.preheader.preheader
	mov	r6, r3
.LBB133_13:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	r2, -1
	mov	r1, 3
add	r6, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r3, r6
	jnz	r2, .LBB133_13
	jmp	.LBB133_14
.LBB133_14:                             // %memset.exit
	ret
// -- End function
// -- Begin function index
index:                                  // @index
// %bb.0:
	mov	r3, r1
	mov	r1, 255
	mov	r2, r0
	mov	r0, r3
	call	__bit_and
	mov	r1, 3
	mov	r4, rax
	mov	r0, r2
	call	__bit_and
	jz	r4, .LBB134_3
	jmp	.LBB134_1
.LBB134_1:
	jz	rax, .LBB134_11
	jmp	.LBB134_2
.LBB134_2:
	mov	r6, r2
add	r6, 1
	jmp	.LBB134_13
.LBB134_3:
	mov	r5, r2
	jz	rax, .LBB134_7
	jmp	.LBB134_4
.LBB134_4:                              // %.preheader2.i.preheader
	mov	r3, r2
add	r3, 1
	mov	r5, r2
.LBB134_5:                              // %.preheader2.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB134_22
	jmp	.LBB134_6
.LBB134_6:                              //   in Loop: Header=BB134_5 Depth=1
	mov	r1, 3
add	r5, 1
	mov	r0, r3
	call	__bit_and
add	r3, 1
	jnz	rax, .LBB134_5
	jmp	.LBB134_7
.LBB134_7:                              // %.loopexit4.i.preheader
add	r5, -5
	mov	r2, -2139062144
.LBB134_8:                              // %.loopexit4.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r5
add	r0, 5
	mov	r1, [r0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r5, 4
	je	rax, r2, .LBB134_8
	jmp	.LBB134_9
.LBB134_9:                              // %.preheader.i.preheader
.LBB134_10:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
add	r5, 1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB134_22
	jmp	.LBB134_10
.LBB134_11:                             // %.loopexit9.i
	mov	r5, [r2]
	mov	r0, 16843008
	sub	r0, r5
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r6, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB134_18
	jmp	.LBB134_12
.LBB134_12:                             // %.preheader5.i.preheader
	mul	r4, 16843009
	jmp	.LBB134_16
.LBB134_13:                             // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
	mov	r5, 0
	jz	r7, .LBB134_22
	jmp	.LBB134_14
.LBB134_14:                             //   in Loop: Header=BB134_13 Depth=1
	mov	r0, r3
	call	__bit_and
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	mov	r5, r2
	je	rax, t1, .LBB134_22
	jmp	.LBB134_15
.LBB134_15:                             //   in Loop: Header=BB134_13 Depth=1
	mov	r1, 3
add	r2, 1
	mov	r0, r6
	call	__bit_and
add	r6, 1
	jz	rax, .LBB134_11
	jmp	.LBB134_13
.LBB134_16:                             // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r5
	mov	r1, r4
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB134_18
	jmp	.LBB134_17
.LBB134_17:                             //   in Loop: Header=BB134_16 Depth=1
add	r2, 4
	mov	r5, [r2]
	mov	r0, 16843008
	sub	r0, r5
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, r6, .LBB134_16
	jmp	.LBB134_18
.LBB134_18:                             // %.loopexit6.i
add	r2, -1
.LBB134_19:                             // =>This Inner Loop Header: Depth=1
add	r2, 1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	jz	r4, .LBB134_21
	jmp	.LBB134_20
.LBB134_20:                             //   in Loop: Header=BB134_19 Depth=1
	mov	r0, r3
	call	__bit_and
	mov	r5, rax
	mov	r0, r4
	call	__bit_and
	jne	rax, r5, .LBB134_19
	jmp	.LBB134_21
.LBB134_21:
	mov	r0, r3
	call	__bit_and
	mov	r3, rax
	mov	r0, r4
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r2
	call	__bit_and
	mov	r5, rax
.LBB134_22:                             // %strchr.exit
	mov	rax, r5
	ret
// -- End function
// -- Begin function memccpy
memccpy:                                // @memccpy
// %bb.0:
	mov	r5, r1
	mov	r1, -2147483648
	mov	r4, r0
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB135_5
	jmp	.LBB135_1
.LBB135_1:
	mov	r0, r5
	mov	r1, r4
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB135_5
	jmp	.LBB135_2
.LBB135_2:
	mov	r1, 255
	mov	r0, r2
	call	__bit_and
	mov	r6, rax
	mul	r6, 16843009
	mov	t1, -2139062144
	mov	t2, -2147483645
.LBB135_3:                              // =>This Inner Loop Header: Depth=1
	mov	r7, [r5]
	mov	r0, r7
	mov	r1, r6
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t1, .LBB135_5
	jmp	.LBB135_4
.LBB135_4:                              //   in Loop: Header=BB135_3 Depth=1
add	r5, 4
	mov	[r4], r7
add	r3, -4
	mov	r1, -2147483648
add	r4, 4
	mov	r0, r3
	call	__bit_xor
	jg	rax, t2, .LBB135_3
	jmp	.LBB135_5
.LBB135_5:                              // %.loopexit
.LBB135_6:                              // =>This Inner Loop Header: Depth=1
	mov	r7, 0
	jz	r3, .LBB135_8
	jmp	.LBB135_7
.LBB135_7:                              //   in Loop: Header=BB135_6 Depth=1
	mov	r1, 255
	mov	r0, r2
	call	__bit_and
	mov	r6, rax
add	r3, -1
	mov	t3, r5
	mov	r1, 2
add	t3, 1
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r7, r4
	mov	r1, 3
add	r7, 1
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r4, rax
	mov	t2, [r4]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t2, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[r4], rax
	mov	r4, r7
	mov	r5, t3
	jne	t1, r6, .LBB135_6
	jmp	.LBB135_8
.LBB135_8:
	mov	rax, r7
	ret
// -- End function
// -- Begin function memchr
memchr:                                 // @memchr
// %bb.0:
	mov	r3, r1
	mov	r1, 3
	mov	r4, r0
	call	__bit_and
	jz	rax, .LBB136_5
	jmp	.LBB136_1
.LBB136_1:
	mov	r5, r4
add	r5, 1
.LBB136_2:                              // =>This Inner Loop Header: Depth=1
	mov	rax, 0
	jz	r2, .LBB136_13
	jmp	.LBB136_3
.LBB136_3:                              //   in Loop: Header=BB136_2 Depth=1
	mov	r1, 255
	mov	r0, r3
	call	__bit_and
	mov	r1, 2
	mov	r6, rax
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, r4
	je	r0, r6, .LBB136_13
	jmp	.LBB136_4
.LBB136_4:                              //   in Loop: Header=BB136_2 Depth=1
	mov	r1, 3
add	r4, 1
	mov	r0, r5
	call	__bit_and
add	r5, 1
add	r2, -1
	jnz	rax, .LBB136_2
	jmp	.LBB136_5
.LBB136_5:                              // %.loopexit9
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB136_9
	jmp	.LBB136_6
.LBB136_6:
	mov	r1, 255
	mov	r0, r3
	call	__bit_and
	mov	r5, rax
	mul	r5, 16843009
	mov	r6, -2139062144
	mov	r7, -2147483645
.LBB136_7:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [r4]
	mov	r1, r5
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB136_10
	jmp	.LBB136_8
.LBB136_8:                              //   in Loop: Header=BB136_7 Depth=1
add	r2, -4
	mov	r1, -2147483648
add	r4, 4
	mov	r0, r2
	call	__bit_xor
	jg	rax, r7, .LBB136_7
	jmp	.LBB136_9
.LBB136_9:                              // %.loopexit6
	mov	rax, 0
	jz	r2, .LBB136_13
	jmp	.LBB136_10
.LBB136_10:                             // %.loopexit5
.LBB136_11:                             // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, r3
	call	__bit_and
	mov	r1, 2
	mov	r5, rax
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, r4
	je	r0, r5, .LBB136_13
	jmp	.LBB136_12
.LBB136_12:                             //   in Loop: Header=BB136_11 Depth=1
add	r2, -1
add	r4, 1
	mov	rax, 0
	jnz	r2, .LBB136_11
	jmp	.LBB136_13
.LBB136_13:                             // %.loopexit
	ret
// -- End function
// -- Begin function memcmp
memcmp:                                 // @memcmp
// %bb.0:
	mov	r3, r1
	mov	r1, -2147483648
	mov	r4, r0
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB137_5
	jmp	.LBB137_1
.LBB137_1:
	mov	r0, r3
	mov	r1, r4
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB137_6
	jmp	.LBB137_2
.LBB137_2:                              // %.preheader.preheader
	mov	r5, -2147483645
.LBB137_3:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [r4]
	mov	r1, [r3]
	jne	r0, r1, .LBB137_6
	jmp	.LBB137_4
.LBB137_4:                              //   in Loop: Header=BB137_3 Depth=1
add	r4, 4
add	r2, -4
	mov	r1, -2147483648
add	r3, 4
	mov	r0, r2
	call	__bit_xor
	jg	rax, r5, .LBB137_3
	jmp	.LBB137_5
.LBB137_5:                              // %.loopexit8
	mov	rax, 0
	jz	r2, .LBB137_10
	jmp	.LBB137_6
.LBB137_6:                              // %.loopexit7.preheader
.LBB137_7:                              // %.loopexit7
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	r5, rax
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	r5, rax, .LBB137_9
	jmp	.LBB137_8
.LBB137_8:
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	mov	r0, r5
	call	__bit_and
	sub	rax, r2
	jmp	.LBB137_10
.LBB137_9:                              //   in Loop: Header=BB137_7 Depth=1
add	r2, -1
add	r4, 1
add	r3, 1
	mov	rax, 0
	jnz	r2, .LBB137_7
	jmp	.LBB137_10
.LBB137_10:                             // %.loopexit
	ret
// -- End function
// -- Begin function memcpy
memcpy:                                 // @memcpy
// %bb.0:
sub	rsp, 4
	mov	[rsp], x0
	mov	r3, r1
	mov	r1, -2147483648
	mov	r7, r2
	mov	r2, r0
	mov	r0, r7
	call	__bit_xor
	mov	r0, -2147483632
	mov	r5, r2
	mov	r4, r7
	jl	rax, r0, .LBB138_13
	jmp	.LBB138_1
.LBB138_1:
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r4, rax
	mov	t4, 8
	sub	t4, r4
	mov	t5, 0
	mov	r5, r3
.LBB138_2:                              // =>This Inner Loop Header: Depth=1
	mov	r0, r3
	add	r0, t5
	mov	r6, r2
	mov	r1, 2
	add	r6, t5
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t1, rax
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	r6, rax
	mov	t3, [r6]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r0, 255
	mov	t2, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
add	t5, 1
add	r5, 1
	jne	t4, t5, .LBB138_2
	jmp	.LBB138_3
.LBB138_3:
	mov	r1, -8
	mov	r0, r4
	call	__bit_or
	mov	r4, rax
	mov	r6, r3
	add	r6, t5
	mov	r1, 3
	add	r4, r7
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	jnz	r0, .LBB138_10
	jmp	.LBB138_4
.LBB138_4:
	mov	r5, r2
	mov	r1, -2147483648
	add	r5, t5
	mov	r0, r4
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB138_7
	jmp	.LBB138_5
.LBB138_5:                              // %.preheader.preheader
	mov	r5, r2
	add	r5, t5
	add	r3, t5
	mov	r6, 0
	mov	r7, -2147483633
	jmp	.LBB138_8
.LBB138_6:
	add	r3, r6
	mov	r0, 4
	add	r5, r6
	mov	r6, r3
	jl	r4, r0, .LBB138_13
	jmp	.LBB138_7
.LBB138_7:                              // %.preheader59
	mov	r7, -2147483645
	mov	r3, r6
	jmp	.LBB138_9
.LBB138_8:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r3
	add	r0, r6
	mov	r1, r5
	mov	t0, [r0]
	mov	t1, r0
add	t1, 4
	mov	t1, [t1]
	add	r1, r6
	mov	[r1], t0
	mov	t0, r1
add	t0, 4
	mov	[t0], t1
	mov	t0, r0
add	t0, 8
	mov	t0, [t0]
	mov	t1, r1
add	r0, 12
	mov	r0, [r0]
add	t1, 8
	mov	[t1], t0
add	r1, 12
	mov	[r1], r0
add	r4, -16
	mov	r1, -2147483648
add	r6, 16
	mov	r0, r4
	call	__bit_xor
	jg	rax, r7, .LBB138_8
	jmp	.LBB138_6
.LBB138_9:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [r3]
add	r3, 4
	mov	[r5], r0
add	r4, -4
add	r5, 4
	mov	r0, r4
	call	__bit_xor
	jg	rax, r7, .LBB138_9
	jmp	.LBB138_13
.LBB138_10:
	call	__bit_shl
	mov	r7, rax
	mov	t1, 8
	sub	t1, r0
	mov	r0, r5
	call	__bit_and
	mov	t7, r3
	sub	t7, rax
	mov	r0, t7
	add	r0, t5
	mov	t2, [r0]
add	t7, 4
	mov	t6, 0
.LBB138_11:                             // =>This Inner Loop Header: Depth=1
	mov	x0, r2
	mov	r0, t5
	add	r0, t6
	add	r0, t7
	mov	t3, [r0]
	add	x0, t6
	mov	r1, 31
	add	x0, t5
	mov	r0, r7
	call	__bit_and
	mov	r0, t2
	mov	r1, rax
	call	__bit_shl
	mov	t2, rax
	mov	r0, r7
	call	__bit_not
	mov	r1, 31
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
	mov	t4, rax
	mov	r0, t3
	call	__bit_shr
	mov	r0, rax
	mov	r1, t4
	call	__bit_shr
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
add	r4, -4
	mov	r1, -2147483648
add	t6, 4
	mov	r0, t1
	call	__bit_xor
	mov	t4, rax
	mov	r0, r4
	call	__bit_xor
	mov	t2, t3
	jge	rax, t4, .LBB138_11
	jmp	.LBB138_12
.LBB138_12:
	mov	r1, -4
	mov	r0, r6
	call	__bit_or
	mov	r6, rax
	mov	r1, 3
	add	r6, t6
	mov	r0, r5
	call	__bit_and
	sub	r3, rax
	add	r3, r6
	add	r3, t5
	add	t5, r2
	add	t5, t6
add	r3, 4
	mov	r5, t5
	jmp	.LBB138_14
.LBB138_13:                             // %.loopexit8
	jz	r4, .LBB138_16
	jmp	.LBB138_14
.LBB138_14:                             // %.preheader56
	mov	t1, r3
	mov	t2, r5
.LBB138_15:                             // =>This Inner Loop Header: Depth=1
add	r4, -1
	mov	r1, 2
add	t1, 1
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	mov	r1, 3
add	t2, 1
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r5, rax
	mov	r7, [r5]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r7, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r5, t2
	mov	r3, t1
	jnz	r4, .LBB138_15
	jmp	.LBB138_16
.LBB138_16:                             // %.loopexit
	mov	rax, r2
	mov	x0, [rsp]
add	rsp, 4
	ret
// -- End function
// -- Begin function two_way_long_needle
two_way_long_needle:                    // @two_way_long_needle
// %bb.0:
sub	rsp, 1056
	mov	[rsp+263], x0
	mov	[rsp+262], x1
	mov	[rsp+261], x2
	mov	[rsp+260], x3
	mov	[rsp+259], x4
	mov	[rsp+258], x5
	mov	[rsp+257], x6
	mov	[rsp+256], x7
	mov	r4, r1
	mov	r5, r0
	mov	t6, 0
	mov	r1, -2147483648
	mov	r6, 1
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483646
	mov	r7, 0
	jl	rax, r0, .LBB139_22
	jmp	.LBB139_1
.LBB139_1:                              // %.preheader30.preheader
	mov	t1, -1
	mov	t7, 0
	mov	r7, 1
	mov	t5, 1
.LBB139_2:                              // %.preheader30
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r2
	add	r0, r7
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, r2
	add	r0, t1
	add	r0, t5
	mov	r1, 2
	mov	t2, rax
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	t3, rax
	mov	r0, t3
	call	__bit_xor
	mov	t4, rax
	mov	r0, t2
	call	__bit_xor
	jge	rax, t4, .LBB139_4
	jmp	.LBB139_3
.LBB139_3:                              //   in Loop: Header=BB139_2 Depth=1
	mov	r6, r7
	sub	r6, t1
	mov	t5, 1
	jmp	.LBB139_9
.LBB139_4:                              //   in Loop: Header=BB139_2 Depth=1
	mov	r1, 255
	mov	r0, t3
	call	__bit_and
	mov	r7, rax
	mov	r0, t2
	call	__bit_and
	jne	rax, r7, .LBB139_8
	jmp	.LBB139_5
.LBB139_5:                              //   in Loop: Header=BB139_2 Depth=1
	je	t5, r6, .LBB139_7
	jmp	.LBB139_6
.LBB139_6:                              //   in Loop: Header=BB139_2 Depth=1
add	t5, 1
	mov	r7, t7
	jmp	.LBB139_9
.LBB139_7:                              //   in Loop: Header=BB139_2 Depth=1
	add	t7, r6
	mov	t5, 1
	mov	r7, t7
	jmp	.LBB139_9
.LBB139_8:                              //   in Loop: Header=BB139_2 Depth=1
	mov	r7, t7
add	r7, 1
	mov	t5, 1
	mov	t1, t7
	mov	r6, 1
.LBB139_9:                              //   in Loop: Header=BB139_2 Depth=1
	mov	t7, r7
	mov	r7, t5
	mov	r1, -2147483648
	add	r7, t7
	mov	r0, r3
	call	__bit_xor
	mov	t2, rax
	mov	r0, r7
	call	__bit_xor
	jl	rax, t2, .LBB139_2
	jmp	.LBB139_10
.LBB139_10:                             // %.preheader29.preheader
	mov	r7, -1
	mov	x1, 0
	mov	t2, 1
	mov	t7, 1
	mov	x0, 1
.LBB139_11:                             // %.preheader29
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r2
	add	r0, t2
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, r2
	add	r0, r7
	add	r0, x0
	mov	r1, 2
	mov	t3, rax
	call	__bit_shr
	mov	r1, 3
	mov	t4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	t4, rax
	mov	r0, t3
	call	__bit_xor
	mov	t5, rax
	mov	r0, t4
	call	__bit_xor
	jge	rax, t5, .LBB139_13
	jmp	.LBB139_12
.LBB139_12:                             //   in Loop: Header=BB139_11 Depth=1
	mov	t7, t2
	sub	t7, r7
	mov	x0, 1
	jmp	.LBB139_18
.LBB139_13:                             //   in Loop: Header=BB139_11 Depth=1
	mov	r1, 255
	mov	r0, t4
	call	__bit_and
	mov	t2, rax
	mov	r0, t3
	call	__bit_and
	jne	rax, t2, .LBB139_17
	jmp	.LBB139_14
.LBB139_14:                             //   in Loop: Header=BB139_11 Depth=1
	je	x0, t7, .LBB139_16
	jmp	.LBB139_15
.LBB139_15:                             //   in Loop: Header=BB139_11 Depth=1
add	x0, 1
	mov	t2, x1
	jmp	.LBB139_18
.LBB139_16:                             //   in Loop: Header=BB139_11 Depth=1
	add	x1, t7
	mov	x0, 1
	mov	t2, x1
	jmp	.LBB139_18
.LBB139_17:                             //   in Loop: Header=BB139_11 Depth=1
	mov	t2, x1
add	t2, 1
	mov	x0, 1
	mov	r7, x1
	mov	t7, 1
.LBB139_18:                             //   in Loop: Header=BB139_11 Depth=1
	mov	x1, t2
	mov	t2, x0
	mov	r1, -2147483648
	add	t2, x1
	mov	r0, r3
	call	__bit_xor
	mov	t3, rax
	mov	r0, t2
	call	__bit_xor
	jl	rax, t3, .LBB139_11
	jmp	.LBB139_19
.LBB139_19:
add	t1, 1
add	r7, 1
	mov	r0, t1
	call	__bit_xor
	mov	t2, rax
	mov	r0, r7
	call	__bit_xor
	jl	rax, t2, .LBB139_21
	jmp	.LBB139_20
.LBB139_20:
	mov	r6, t7
.LBB139_21:
	mov	r0, t1
	sub	r0, r7
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	sub	r7, t1
add	rax, 1
	mov	r0, rax
	mov	r1, r7
	call	__bit_and
	mov	r7, rax
	add	r7, t1
.LBB139_22:
	mov	r0, 1024
	jmp	.LBB139_25
.LBB139_23:
	jz	r3, .LBB139_27
	jmp	.LBB139_24
.LBB139_24:                             // %.preheader27.preheader
	mov	t3, r3
add	t3, -1
	mov	t4, -1
	mov	t1, r2
	jmp	.LBB139_26
.LBB139_25:                             // =>This Inner Loop Header: Depth=1
	mov	r1, rsp
	add	r1, t6
add	t6, 4
	mov	[r1], r3
	je	t6, r0, .LBB139_23
	jmp	.LBB139_25
.LBB139_26:                             // %.preheader27
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shl
	add	rax, rsp
	mov	[rax], t3
add	t3, -1
add	t1, 1
	jne	t3, t4, .LBB139_26
	jmp	.LBB139_27
.LBB139_27:                             // %.loopexit28
	mov	t1, r2
	mov	r1, -2147483648
	add	t1, r6
	mov	r0, r7
	call	__bit_xor
	mov	r0, -2147483644
	mov	t2, r7
	mov	t3, r2
	jl	rax, r0, .LBB139_33
	jmp	.LBB139_28
.LBB139_28:
	mov	r0, t1
	mov	r1, r2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	t2, r7
	mov	t3, r2
	jnz	rax, .LBB139_35
	jmp	.LBB139_29
.LBB139_29:                             // %.preheader.i.preheader
	mov	t4, -2147483645
	mov	t3, r2
	mov	t2, r7
.LBB139_30:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	t1, t3
	add	t1, r6
	mov	r0, [t3]
	mov	r1, [t1]
	jne	r0, r1, .LBB139_34
	jmp	.LBB139_31
.LBB139_31:                             //   in Loop: Header=BB139_30 Depth=1
add	t2, -4
	mov	r1, -2147483648
add	t3, 4
	mov	r0, t2
	call	__bit_xor
	jg	rax, t4, .LBB139_30
	jmp	.LBB139_32
.LBB139_32:                             // %.loopexit8.i.loopexit
	mov	t1, t3
	add	t1, r6
.LBB139_33:                             // %.loopexit8.i
	jz	t2, .LBB139_38
	jmp	.LBB139_35
.LBB139_34:                             // %.loopexit7.i.preheader.loopexit
.LBB139_35:                             // %.loopexit7.i.preheader
.LBB139_36:                             // %.loopexit7.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, t3
	call	__bit_shr
	mov	r1, 3
	mov	t4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	t4, rax
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	t5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	t4, rax, .LBB139_53
	jmp	.LBB139_37
.LBB139_37:                             //   in Loop: Header=BB139_36 Depth=1
add	t2, -1
add	t3, 1
add	t1, 1
	jnz	t2, .LBB139_36
	jmp	.LBB139_38
.LBB139_38:                             // %memcmp.exit.thread
	sub	r4, r3
	mov	x3, r3
	sub	x3, r6
	mov	t2, r3
add	t2, -1
	mov	x4, 1
	sub	x4, r7
	mov	x5, r5
add	x5, -1
	mov	x6, r2
add	x6, -1
	mov	t4, 0
	mov	t3, 0
.LBB139_39:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB139_47 Depth 2
                                        //     Child Loop BB139_49 Depth 2
	mov	t1, r5
	add	t1, t3
	mov	r0, t1
	add	r0, r3
add	r0, -1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shl
	add	rax, rsp
	mov	t6, [rax]
	jz	t6, .LBB139_44
	jmp	.LBB139_40
.LBB139_40:                             //   in Loop: Header=BB139_39 Depth=1
	mov	x2, 0
	jz	t4, .LBB139_43
	jmp	.LBB139_41
.LBB139_41:                             //   in Loop: Header=BB139_39 Depth=1
	mov	r1, -2147483648
	mov	r0, r6
	call	__bit_xor
	mov	t1, rax
	mov	r0, t6
	call	__bit_xor
	jge	rax, t1, .LBB139_43
	jmp	.LBB139_42
.LBB139_42:                             //   in Loop: Header=BB139_39 Depth=1
	mov	t6, x3
.LBB139_43:                             //   in Loop: Header=BB139_39 Depth=1
	add	t3, t6
	mov	r1, -2147483648
	mov	t1, 0
	mov	r0, r4
	call	__bit_xor
	mov	t5, rax
	mov	r0, t3
	call	__bit_xor
	mov	t4, x2
	jg	rax, t5, .LBB139_65
	jmp	.LBB139_39
.LBB139_44:                             //   in Loop: Header=BB139_39 Depth=1
	mov	t5, t4
	sub	t5, r7
	mov	r1, 31
	mov	r0, t5
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	r1, r7
	sub	r1, t4
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	t7, rax
	add	t7, t4
	mov	r1, -2147483648
	mov	r0, t7
	call	__bit_xor
	mov	t6, rax
	mov	r0, t2
	call	__bit_xor
	jge	t6, rax, .LBB139_46
	jmp	.LBB139_45
.LBB139_45:                             // %.preheader.preheader
                                        //   in Loop: Header=BB139_39 Depth=1
	mov	t6, x4
	add	t6, t7
	mov	x7, t2
	sub	x7, t7
	mov	x0, r2
	add	x0, t7
	add	t7, t3
	add	t7, r5
	jmp	.LBB139_47
.LBB139_46:                             // %.loopexit
                                        //   in Loop: Header=BB139_39 Depth=1
	mov	r1, 31
	mov	r0, t5
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, t5
	call	__bit_and
	mov	t5, rax
	add	t5, r7
	mov	x1, x5
	add	x1, t3
	mov	t6, r7
	jmp	.LBB139_49
.LBB139_47:                             // %.preheader
                                        //   Parent Loop BB139_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, x0
	call	__bit_shr
	mov	r1, 3
	mov	x1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	x1, rax
	mov	r0, t7
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x2, 0
	jne	x1, rax, .LBB139_43
	jmp	.LBB139_48
.LBB139_48:                             //   in Loop: Header=BB139_47 Depth=2
add	t6, 1
add	x7, -1
add	x0, 1
add	t7, 1
	jz	x7, .LBB139_46
	jmp	.LBB139_47
.LBB139_49:                             //   Parent Loop BB139_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, -2147483648
	mov	r0, t6
	call	__bit_xor
	mov	t7, rax
	mov	r0, t4
	call	__bit_xor
	jge	rax, t7, .LBB139_52
	jmp	.LBB139_50
.LBB139_50:                             //   in Loop: Header=BB139_49 Depth=2
	mov	x2, t6
	mov	r0, x6
	add	r0, t6
	mov	r1, 2
add	x2, -1
	call	__bit_shr
	mov	r1, 3
	mov	t7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	add	t6, x1
	mov	r1, 2
	mov	t7, rax
	mov	r0, t6
	call	__bit_shr
	mov	r1, 3
	mov	x0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x0]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t6, x2
	je	t7, rax, .LBB139_49
	jmp	.LBB139_51
.LBB139_51:                             // %._crit_edge
                                        //   in Loop: Header=BB139_39 Depth=1
add	x2, 1
	mov	t5, x2
.LBB139_52:                             //   in Loop: Header=BB139_39 Depth=1
add	t4, 1
	mov	r1, -2147483648
	mov	r0, t4
	call	__bit_xor
	mov	t4, rax
	mov	r0, t5
	call	__bit_xor
	mov	t6, r6
	mov	x2, x3
	jl	rax, t4, .LBB139_65
	jmp	.LBB139_43
.LBB139_53:                             // %memcmp.exit
	mov	t1, r3
	sub	t1, r7
	mov	r0, t1
	sub	r0, r7
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	r1, r7
	sub	r1, t1
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	add	r6, t1
	mov	t2, r3
add	t2, -1
	sub	r4, r3
	mov	t7, t2
	sub	t7, r7
	mov	x0, r2
	add	x0, r7
	mov	x1, r5
	add	x1, r7
	mov	x2, r5
add	x2, -1
add	r2, -1
	mov	t3, 0
.LBB139_54:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB139_59 Depth 2
                                        //     Child Loop BB139_62 Depth 2
	mov	t1, r5
	add	t1, t3
	mov	r0, t1
	add	r0, r3
add	r0, -1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shl
	add	rax, rsp
	mov	r0, [rax]
	jnz	r0, .LBB139_57
	jmp	.LBB139_55
.LBB139_55:                             //   in Loop: Header=BB139_54 Depth=1
	mov	r1, -2147483648
	mov	r0, r7
	call	__bit_xor
	mov	t4, rax
	mov	r0, t2
	call	__bit_xor
	jle	rax, t4, .LBB139_61
	jmp	.LBB139_56
.LBB139_56:                             // %.preheader24.preheader
                                        //   in Loop: Header=BB139_54 Depth=1
	mov	x3, x1
	add	x3, t3
	mov	t6, 0
	jmp	.LBB139_59
.LBB139_57:                             //   in Loop: Header=BB139_54 Depth=1
	add	t3, r0
.LBB139_58:                             //   in Loop: Header=BB139_54 Depth=1
	mov	r1, -2147483648
	mov	t1, 0
	mov	r0, r4
	call	__bit_xor
	mov	t4, rax
	mov	r0, t3
	call	__bit_xor
	jg	rax, t4, .LBB139_65
	jmp	.LBB139_54
.LBB139_59:                             // %.preheader24
                                        //   Parent Loop BB139_54 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x0
	add	r0, t6
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, x3
	add	r0, t6
	mov	r1, 2
	mov	t4, rax
	call	__bit_shr
	mov	r1, 3
	mov	t5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	t4, rax, .LBB139_64
	jmp	.LBB139_60
.LBB139_60:                             //   in Loop: Header=BB139_59 Depth=2
add	t6, 1
	jne	t7, t6, .LBB139_59
	jmp	.LBB139_61
.LBB139_61:                             // %.loopexit25.preheader
                                        //   in Loop: Header=BB139_54 Depth=1
	mov	x3, x2
	add	x3, t3
	mov	t4, r7
.LBB139_62:                             // %.loopexit25
                                        //   Parent Loop BB139_54 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	jz	t4, .LBB139_65
	jmp	.LBB139_63
.LBB139_63:                             //   in Loop: Header=BB139_62 Depth=2
	mov	x4, t4
	mov	r0, r2
	add	r0, t4
	mov	r1, 2
add	x4, -1
	call	__bit_shr
	mov	r1, 3
	mov	t5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	add	t4, x3
	mov	r1, 2
	mov	t5, rax
	mov	r0, t4
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t4, x4
	mov	t6, r6
	je	t5, rax, .LBB139_62
	jmp	.LBB139_64
.LBB139_64:                             // %.loopexit23
                                        //   in Loop: Header=BB139_54 Depth=1
	add	t3, t6
add	t3, 1
	jmp	.LBB139_58
.LBB139_65:                             // %.loopexit21
	mov	rax, t1
	mov	x7, [rsp+256]
	mov	x6, [rsp+257]
	mov	x5, [rsp+258]
	mov	x4, [rsp+259]
	mov	x3, [rsp+260]
	mov	x2, [rsp+261]
	mov	x1, [rsp+262]
	mov	x0, [rsp+263]
add	rsp, 1056
	ret
// -- End function
// -- Begin function memmem
memmem:                                 // @memmem
// %bb.0:
sub	rsp, 268
	mov	[rsp+66], x0
	mov	[rsp+65], x1
	mov	[rsp+64], x2
	mov	r6, r1
	mov	r5, r0
	mov	t1, r5
	jz	r3, .LBB140_78
	jmp	.LBB140_1
.LBB140_1:
	mov	r0, 1
	jne	r3, r0, .LBB140_15
	jmp	.LBB140_2
.LBB140_2:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r2, rax
	mov	r0, r5
	call	__bit_and
	jz	rax, .LBB140_7
	jmp	.LBB140_3
.LBB140_3:                              // %.preheader25.preheader
	mov	r3, r5
add	r3, 1
.LBB140_4:                              // %.preheader25
                                        // =>This Inner Loop Header: Depth=1
	mov	t1, 0
	jz	r6, .LBB140_78
	jmp	.LBB140_5
.LBB140_5:                              //   in Loop: Header=BB140_4 Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	mov	r0, r2
	call	__bit_and
	mov	t1, r5
	je	r4, rax, .LBB140_78
	jmp	.LBB140_6
.LBB140_6:                              //   in Loop: Header=BB140_4 Depth=1
	mov	r1, 3
add	r5, 1
	mov	r0, r3
	call	__bit_and
add	r3, 1
add	r6, -1
	jnz	rax, .LBB140_4
	jmp	.LBB140_7
.LBB140_7:                              // %.loopexit9.i
	mov	r1, -2147483648
	mov	r0, r6
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB140_11
	jmp	.LBB140_8
.LBB140_8:
	mov	r3, r2
	mul	r3, 16843009
	mov	r4, -2139062144
	mov	r7, -2147483645
.LBB140_9:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [r5]
	mov	r1, r3
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r4, .LBB140_12
	jmp	.LBB140_10
.LBB140_10:                             //   in Loop: Header=BB140_9 Depth=1
add	r6, -4
	mov	r1, -2147483648
add	r5, 4
	mov	r0, r6
	call	__bit_xor
	jg	rax, r7, .LBB140_9
	jmp	.LBB140_11
.LBB140_11:                             // %.loopexit6.i
	mov	t1, 0
	jz	r6, .LBB140_78
	jmp	.LBB140_12
.LBB140_12:                             // %.loopexit5.i.preheader
.LBB140_13:                             // %.loopexit5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	mov	r0, r2
	call	__bit_and
	mov	t1, r5
	je	r3, rax, .LBB140_78
	jmp	.LBB140_14
.LBB140_14:                             //   in Loop: Header=BB140_13 Depth=1
add	r6, -1
add	r5, 1
	mov	t1, 0
	jz	r6, .LBB140_78
	jmp	.LBB140_13
.LBB140_15:
	mov	r1, -2147483648
	mov	t1, 0
	mov	r0, r3
	call	__bit_xor
	mov	r4, rax
	mov	r0, r6
	call	__bit_xor
	jl	rax, r4, .LBB140_78
	jmp	.LBB140_16
.LBB140_16:
	mov	t4, r6
	sub	t4, r3
	mov	r4, r5
	mov	r0, 2
	add	r4, t4
	jne	r3, r0, .LBB140_24
	jmp	.LBB140_17
.LBB140_17:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 16
	mov	r0, rax
	call	__bit_shl
add	r2, 1
	mov	r1, 2
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	r2, rax
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 16
	mov	r0, rax
	call	__bit_shl
	mov	r0, r5
add	r0, 1
	mov	r1, 2
	mov	r3, rax
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r0, 1
	mov	r3, rax
	jl	t4, r0, .LBB140_23
	jmp	.LBB140_18
.LBB140_18:
	je	r3, r2, .LBB140_23
	jmp	.LBB140_19
.LBB140_19:                             // %.preheader.preheader
add	r5, 2
.LBB140_20:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 16
	mov	r6, r5
	mov	r0, r3
	call	__bit_shl
	mov	r1, 2
	mov	r3, rax
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r3, rax
	mov	r1, -2147483648
add	r5, 1
	mov	r0, r4
	call	__bit_xor
	mov	r7, rax
	mov	r0, r6
	call	__bit_xor
	jg	rax, r7, .LBB140_22
	jmp	.LBB140_21
.LBB140_21:                             // %.preheader
                                        //   in Loop: Header=BB140_20 Depth=1
	jne	r3, r2, .LBB140_20
	jmp	.LBB140_22
.LBB140_22:                             // %.loopexit.loopexit
add	r5, -2
.LBB140_23:                             // %.loopexit
	mov	r0, r3
	mov	r1, r2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r5
	call	__bit_and
	mov	t1, rax
	jmp	.LBB140_78
.LBB140_24:
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483391
	jl	rax, r0, .LBB140_26
	jmp	.LBB140_25
.LBB140_25:
	mov	r0, r5
	mov	r1, r6
	call	two_way_long_needle
	mov	t1, rax
	jmp	.LBB140_78
.LBB140_26:
	mov	r1, 3
	mov	r0, rsp
	call	__bit_and
	mov	r7, rsp
	mov	r6, 256
	jz	rax, .LBB140_31
	jmp	.LBB140_27
.LBB140_27:                             // %.preheader22.preheader
	call	__bit_and
	mov	r0, rax
	call	__bit_xor
	mov	r6, rax
add	r6, 1
	mov	t3, 0
.LBB140_28:                             // =>This Inner Loop Header: Depth=1
	mov	r0, rsp
	add	r0, t3
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	t1, rax
	mov	t2, [t1]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	t2, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
add	t3, 1
	mov	[t1], rax
	jne	r6, t3, .LBB140_28
	jmp	.LBB140_29
.LBB140_29:                             // %.loopexit7.i
	mov	r7, rsp
	mov	r0, 257
	sub	r0, t3
	add	r7, t3
	mov	r6, 256
	mov	r1, -2147483648
	sub	r6, t3
	call	__bit_xor
	mov	r0, -2147483643
	jl	rax, r0, .LBB140_36
	jmp	.LBB140_30
.LBB140_30:                             // %.loopexit7.i.thread
	mov	r0, r6
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB140_32
	jmp	.LBB140_31
.LBB140_31:                             // %.preheader.i.preheader
	mov	t1, -2147483633
	jmp	.LBB140_34
.LBB140_32:                             // %.preheader239
	mov	t1, -2147483645
	mov	r1, -2147483648
	jmp	.LBB140_35
.LBB140_33:
	mov	r0, r6
add	r0, 16
	mov	r1, 19
	jg	r0, r1, .LBB140_32
	jmp	.LBB140_36
.LBB140_34:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r7
add	r0, 4
	mov	[r7], 0
	mov	r1, r7
add	r1, 8
	mov	[r0], 0
	mov	r0, r7
add	r0, 12
	mov	[r1], 0
add	r7, 16
add	r6, -16
	mov	r1, -2147483648
	mov	[r0], 0
	mov	r0, r6
	call	__bit_xor
	jg	rax, t1, .LBB140_34
	jmp	.LBB140_33
.LBB140_35:                             // =>This Inner Loop Header: Depth=1
	mov	[r7], 0
add	r6, -4
add	r7, 4
	mov	r0, r6
	call	__bit_xor
	jg	rax, t1, .LBB140_35
	jmp	.LBB140_36
.LBB140_36:                             // %.loopexit5.i6
	jz	r6, .LBB140_39
	jmp	.LBB140_37
.LBB140_37:                             // %.preheader21.preheader
	mov	t3, r7
.LBB140_38:                             // %.preheader21
                                        // =>This Inner Loop Header: Depth=1
add	r6, -1
	mov	r1, 3
add	t3, 1
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	t1, rax
	call	__bit_and
	mov	r7, rax
	mov	t2, [r7]
	mov	r1, 3
	mov	r0, t1
	call	__bit_shl
	mov	r0, 255
	mov	t1, rax
	mov	r1, t1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	t2, rax
	mov	r1, t1
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
	mov	r7, t3
	jnz	r6, .LBB140_38
	jmp	.LBB140_39
.LBB140_39:                             // %memset.exit.preheader
	mov	r6, r3
add	r6, -1
	mov	t5, r3
add	t5, -2
	mov	r7, 0
.LBB140_40:                             // %memset.exit
                                        // =>This Inner Loop Header: Depth=1
	mov	t1, r2
	add	t1, r7
	mov	r0, t1
add	r0, 1
	mov	r1, 2
add	r7, 1
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	t2, rax
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r0, rax
	call	__bit_shl
	sub	t2, rax
	mov	r1, 255
	mov	r0, t2
	call	__bit_and
	mov	r0, rax
	add	r0, rsp
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	t1, rax
	call	__bit_and
	mov	t2, rax
	mov	t3, [t2]
	mov	r1, 3
	mov	r0, t1
	call	__bit_shl
	mov	r0, 255
	mov	t1, rax
	mov	r1, t1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, r7
	call	__bit_and
	mov	r0, rax
	mov	r1, t1
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[t2], rax
	jne	t5, r7, .LBB140_40
	jmp	.LBB140_41
.LBB140_41:
	mov	r7, r2
	add	r7, r6
	mov	r1, 2
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r7, -1
	mov	r1, 2
	mov	t1, rax
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r0, rax
	call	__bit_shl
	sub	t1, rax
	mov	r1, 255
	mov	r0, t1
	call	__bit_and
	mov	r7, rax
	add	r7, rsp
	mov	r1, 2
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x0, r6
	mov	r1, 3
	sub	x0, rax
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	t1, rax
	call	__bit_and
	mov	r7, rax
	mov	t2, [r7]
	mov	r1, 3
	mov	r0, t1
	call	__bit_shl
	mov	r0, 255
	mov	t1, rax
	mov	r1, t1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t2, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, t1
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	r0, 17
	mov	[r7], rax
	jl	r3, r0, .LBB140_43
	jmp	.LBB140_42
.LBB140_42:                             // %.preheader19.preheader
	mov	r7, 0
	mov	x1, -2147483645
	jmp	.LBB140_59
.LBB140_43:                             // %.preheader14
	mov	t1, 0
	jl	t4, t1, .LBB140_77
	jmp	.LBB140_44
.LBB140_44:                             // %.preheader13.lr.ph
	mov	t5, -2147483643
	mov	t6, -2147483645
.LBB140_45:                             // %.preheader13
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB140_52 Depth 2
                                        //     Child Loop BB140_56 Depth 2
	mov	t1, r5
	add	t1, r6
	mov	r1, 2
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, t1
add	r0, -1
	mov	r1, 2
	mov	r5, rax
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r0, rax
	call	__bit_shl
	sub	r5, rax
	mov	r1, 255
	mov	r0, r5
	call	__bit_and
	mov	r0, rax
	add	r0, rsp
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	r7, rax
	mov	r0, r4
	call	__bit_xor
	mov	r5, rax
	mov	r0, t1
	call	__bit_xor
	jg	rax, r5, .LBB140_47
	jmp	.LBB140_46
.LBB140_46:                             // %.preheader13
                                        //   in Loop: Header=BB140_45 Depth=1
	mov	r1, 255
	mov	r0, r7
	call	__bit_and
	mov	r5, t1
	jz	rax, .LBB140_45
	jmp	.LBB140_47
.LBB140_47:                             //   in Loop: Header=BB140_45 Depth=1
	mov	r1, 255
	mov	r0, r7
	call	__bit_and
	mov	r1, -2147483648
	sub	t1, rax
	mov	r0, rax
	call	__bit_xor
	mov	r5, rax
	mov	r0, r6
	call	__bit_xor
	jle	rax, r5, .LBB140_49
	jmp	.LBB140_48
.LBB140_48:                             //   in Loop: Header=BB140_45 Depth=1
	mov	r1, -2147483648
	mov	r0, r4
	call	__bit_xor
	mov	r7, rax
	mov	r0, t1
	call	__bit_xor
	mov	r5, t1
	mov	t1, 0
	jg	rax, r7, .LBB140_77
	jmp	.LBB140_45
.LBB140_49:                             //   in Loop: Header=BB140_45 Depth=1
	mov	r0, r3
	call	__bit_xor
	mov	r5, r6
	mov	t2, t1
	mov	r7, r2
	jl	rax, t5, .LBB140_54
	jmp	.LBB140_50
.LBB140_50:                             //   in Loop: Header=BB140_45 Depth=1
	mov	r0, t1
	mov	r1, r2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	r5, r6
	mov	r7, r2
	mov	t2, t1
	jnz	rax, .LBB140_55
	jmp	.LBB140_51
.LBB140_51:                             // %.preheader.i8.preheader
                                        //   in Loop: Header=BB140_45 Depth=1
	mov	r7, r2
	mov	t2, t1
	mov	r5, r6
.LBB140_52:                             // %.preheader.i8
                                        //   Parent Loop BB140_45 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [t2]
	mov	r1, [r7]
	jne	r0, r1, .LBB140_55
	jmp	.LBB140_53
.LBB140_53:                             //   in Loop: Header=BB140_52 Depth=2
add	t2, 4
add	r5, -4
	mov	r1, -2147483648
add	r7, 4
	mov	r0, r5
	call	__bit_xor
	jg	rax, t6, .LBB140_52
	jmp	.LBB140_54
.LBB140_54:                             // %.loopexit8.i
                                        //   in Loop: Header=BB140_45 Depth=1
	jz	r5, .LBB140_77
	jmp	.LBB140_55
.LBB140_55:                             // %.loopexit7.i7.preheader
                                        //   in Loop: Header=BB140_45 Depth=1
.LBB140_56:                             // %.loopexit7.i7
                                        //   Parent Loop BB140_45 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, t2
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	t3, rax
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	t4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	t3, rax, .LBB140_58
	jmp	.LBB140_57
.LBB140_57:                             //   in Loop: Header=BB140_56 Depth=2
add	r5, -1
add	t2, 1
add	r7, 1
	jz	r5, .LBB140_77
	jmp	.LBB140_56
.LBB140_58:                             // %memcmp.exit
                                        //   in Loop: Header=BB140_45 Depth=1
	add	t1, x0
	jmp	.LBB140_48
.LBB140_59:                             // %.preheader19
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB140_60 Depth 2
                                        //       Child Loop BB140_62 Depth 3
	mov	t3, r5
.LBB140_60:                             //   Parent Loop BB140_59 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB140_62 Depth 3
	mov	r5, t3
	mov	r1, -2147483648
	mov	t1, 0
	mov	r0, r4
	call	__bit_xor
	mov	t2, rax
	mov	r0, r5
	call	__bit_xor
	jg	rax, t2, .LBB140_77
	jmp	.LBB140_61
.LBB140_61:                             // %.preheader16.preheader
                                        //   in Loop: Header=BB140_60 Depth=2
	mov	t5, r5
	add	t5, r3
	mov	x2, 0
.LBB140_62:                             // %.preheader16
                                        //   Parent Loop BB140_59 Depth=1
                                        //     Parent Loop BB140_60 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	t1, t5
	add	t1, x2
	mov	t2, t1
add	t2, -1
	mov	r1, 2
	mov	r0, t2
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	t1, -2
	mov	r1, 2
	mov	t3, rax
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	t4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r0, rax
	call	__bit_shl
	sub	t3, rax
	mov	r1, 255
	mov	r0, t3
	call	__bit_and
	mov	r0, rax
	add	r0, rsp
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r1, -2147483648
	add	x2, r6
	mov	r0, r4
	call	__bit_xor
	mov	t3, rax
	mov	r0, t2
	call	__bit_xor
	jg	rax, t3, .LBB140_64
	jmp	.LBB140_63
.LBB140_63:                             // %.preheader16
                                        //   in Loop: Header=BB140_62 Depth=3
	mov	r1, 255
	mov	r0, t1
	call	__bit_and
	jz	rax, .LBB140_62
	jmp	.LBB140_64
.LBB140_64:                             //   in Loop: Header=BB140_60 Depth=2
	mov	r1, 255
	mov	r0, t1
	call	__bit_and
	mov	t3, r5
	sub	t3, rax
	mov	r1, -2147483648
	add	t3, x2
	mov	r0, rax
	call	__bit_xor
	mov	t2, rax
	mov	r0, r6
	call	__bit_xor
	jg	rax, t2, .LBB140_60
	jmp	.LBB140_65
.LBB140_65:                             //   in Loop: Header=BB140_59 Depth=1
	mov	r1, 255
	mov	r0, t1
	call	__bit_and
	mov	t4, r7
	add	t4, r5
	mov	t2, rax
	mov	t5, t4
	sub	t5, t2
	mov	t3, r2
	add	t3, r7
	add	t5, x2
	mov	r0, t5
	mov	r1, t3
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB140_67
	jmp	.LBB140_66
.LBB140_66:                             // %.preheader.i10.preheader
                                        //   in Loop: Header=BB140_59 Depth=1
	mov	r0, [t5]
	mov	r1, [t3]
	je	r0, r1, .LBB140_71
	jmp	.LBB140_67
.LBB140_67:                             // %.loopexit7.i9
                                        //   in Loop: Header=BB140_59 Depth=1
	mov	r1, 2
	mov	r0, t5
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	t5, rax
	mov	r0, t3
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	t5, rax, .LBB140_75
	jmp	.LBB140_68
.LBB140_68:                             // %.loopexit7.i9.1
                                        //   in Loop: Header=BB140_59 Depth=1
	mov	r0, t1
	call	__bit_and
	mov	r0, t4
	sub	r0, rax
	add	r0, x2
add	r0, 1
	mov	t5, t3
	mov	r1, 2
add	t5, 1
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	t6, rax
	mov	r0, t5
	call	__bit_shr
	mov	r1, 3
	mov	t7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	t6, rax, .LBB140_75
	jmp	.LBB140_69
.LBB140_69:                             // %.loopexit7.i9.2
                                        //   in Loop: Header=BB140_59 Depth=1
	mov	r0, t1
	call	__bit_and
	mov	r0, t4
	sub	r0, rax
	add	r0, x2
add	r0, 2
	mov	t5, t3
	mov	r1, 2
add	t5, 2
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	t6, rax
	mov	r0, t5
	call	__bit_shr
	mov	r1, 3
	mov	t7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	t6, rax, .LBB140_75
	jmp	.LBB140_70
.LBB140_70:                             // %.loopexit7.i9.3
                                        //   in Loop: Header=BB140_59 Depth=1
	mov	r0, t1
	call	__bit_and
	sub	t4, rax
	add	t4, x2
add	t4, 3
	mov	r1, 2
add	t3, 3
	mov	r0, t4
	call	__bit_shr
	mov	r1, 3
	mov	t5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	t4, rax
	mov	r0, t3
	call	__bit_shr
	mov	r1, 3
	mov	t5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	t4, rax, .LBB140_75
	jmp	.LBB140_71
.LBB140_71:                             // %memcmp.exit12.thread
                                        //   in Loop: Header=BB140_59 Depth=1
	mov	r0, r5
	sub	r0, t2
	add	r0, x2
	mov	t2, r2
	mov	r1, r2
	mov	r2, r6
	call	memcmp
	jz	rax, .LBB140_76
	jmp	.LBB140_72
.LBB140_72:                             //   in Loop: Header=BB140_59 Depth=1
	mov	r1, -2147483648
	mov	r0, r7
	call	__bit_xor
	jg	rax, x1, .LBB140_74
	jmp	.LBB140_73
.LBB140_73:                             //   in Loop: Header=BB140_59 Depth=1
	mov	r7, r6
.LBB140_74:                             //   in Loop: Header=BB140_59 Depth=1
add	r7, -4
	mov	r2, t2
.LBB140_75:                             // %memcmp.exit12
                                        //   in Loop: Header=BB140_59 Depth=1
	mov	r1, 255
	mov	r0, t1
	call	__bit_and
	add	r5, x0
	sub	r5, rax
	add	r5, x2
	jmp	.LBB140_59
.LBB140_76:                             // %memcmp.exit.thread.loopexit4
	mov	r1, 255
	mov	r0, t1
	call	__bit_and
	sub	r5, rax
	add	r5, x2
	mov	t1, r5
.LBB140_77:                             // %memcmp.exit.thread
.LBB140_78:                             // %memchr.exit
	mov	rax, t1
	mov	x2, [rsp+64]
	mov	x1, [rsp+65]
	mov	x0, [rsp+66]
add	rsp, 268
	ret
// -- End function
// -- Begin function memmove
memmove:                                // @memmove
// %bb.0:
	mov	r4, r1
	mov	r1, -2147483648
	mov	r3, r2
	mov	r2, r0
	call	__bit_xor
	mov	r5, rax
	mov	r0, r4
	call	__bit_xor
	jge	rax, r5, .LBB141_10
	jmp	.LBB141_1
.LBB141_1:
	mov	r5, r4
	add	r5, r3
	mov	r0, r5
	call	__bit_xor
	mov	r6, rax
	mov	r0, r2
	call	__bit_xor
	jge	rax, r6, .LBB141_10
	jmp	.LBB141_2
.LBB141_2:
	mov	r6, r2
	add	r6, r3
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB141_7
	jmp	.LBB141_3
.LBB141_3:
	mov	r0, r5
	mov	r1, r6
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB141_8
	jmp	.LBB141_4
.LBB141_4:                              // %.preheader.preheader
	mov	r5, -2147483645
	mov	r1, -2147483648
.LBB141_5:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r4
	add	r0, r3
add	r0, -4
	mov	r0, [r0]
	mov	r6, r2
	add	r6, r3
add	r6, -4
add	r3, -4
	mov	[r6], r0
	mov	r0, r3
	call	__bit_xor
	jg	rax, r5, .LBB141_5
	jmp	.LBB141_6
.LBB141_6:                              // %.loopexit9.loopexit
	add	r4, r3
	mov	r6, r2
	add	r6, r3
	mov	r5, r4
.LBB141_7:                              // %.loopexit9
	jz	r3, .LBB141_21
	jmp	.LBB141_8
.LBB141_8:                              // %.preheader56
add	r5, -1
add	r6, -1
.LBB141_9:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 2
add	r3, -1
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r4, rax
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	t1, rax
	mov	t2, [t1]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t2, rax
	mov	r0, r4
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[t1], rax
add	r5, -1
add	r6, -1
	jz	r3, .LBB141_21
	jmp	.LBB141_9
.LBB141_10:
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483644
	mov	r5, r2
	jl	rax, r0, .LBB141_18
	jmp	.LBB141_11
.LBB141_11:
	mov	r0, r4
	mov	r1, r2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	r5, r2
	jnz	rax, .LBB141_19
	jmp	.LBB141_12
.LBB141_12:
	mov	r1, -2147483648
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483632
	mov	r5, r2
	jl	rax, r0, .LBB141_15
	jmp	.LBB141_13
.LBB141_13:                             // %.preheader12.preheader
	mov	r6, -2147483633
	mov	r5, r2
	jmp	.LBB141_16
.LBB141_14:
	mov	r0, 4
	jl	r3, r0, .LBB141_18
	jmp	.LBB141_15
.LBB141_15:                             // %.preheader66
	mov	r6, -2147483645
	jmp	.LBB141_17
.LBB141_16:                             // %.preheader12
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [r4]
	mov	r1, r4
add	r1, 4
	mov	[r5], r0
	mov	r0, [r1]
	mov	r1, r5
add	r1, 4
	mov	r7, r4
add	r7, 8
	mov	t0, r5
	mov	[r1], r0
	mov	r0, [r7]
add	t0, 8
	mov	r1, r4
add	r1, 12
	mov	r7, r5
add	r7, 12
	mov	[t0], r0
add	r4, 16
	mov	r0, [r1]
add	r5, 16
add	r3, -16
	mov	r1, -2147483648
	mov	[r7], r0
	mov	r0, r3
	call	__bit_xor
	jg	rax, r6, .LBB141_16
	jmp	.LBB141_14
.LBB141_17:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [r4]
add	r4, 4
	mov	[r5], r0
add	r3, -4
add	r5, 4
	mov	r0, r3
	call	__bit_xor
	jg	rax, r6, .LBB141_17
	jmp	.LBB141_18
.LBB141_18:                             // %.loopexit11
	jz	r3, .LBB141_21
	jmp	.LBB141_19
.LBB141_19:                             // %.preheader61
	mov	t1, r4
	mov	t2, r5
.LBB141_20:                             // =>This Inner Loop Header: Depth=1
add	r3, -1
	mov	r1, 2
add	t1, 1
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	mov	r1, 3
add	t2, 1
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r5, rax
	mov	r7, [r5]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r7, rax
	mov	r0, r4
	call	__bit_and
	mov	r0, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r4, t1
	mov	r5, t2
	jnz	r3, .LBB141_20
	jmp	.LBB141_21
.LBB141_21:                             // %.loopexit
	mov	rax, r2
	ret
// -- End function
// -- Begin function mempcpy
mempcpy:                                // @mempcpy
// %bb.0:
	mov	r4, r1
	mov	r1, -2147483648
	mov	r3, r2
	mov	r2, r0
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB142_8
	jmp	.LBB142_1
.LBB142_1:
	mov	r0, r4
	mov	r1, r2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB142_9
	jmp	.LBB142_2
.LBB142_2:
	mov	r1, -2147483648
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB142_5
	jmp	.LBB142_3
.LBB142_3:                              // %.preheader.preheader
	mov	r5, -2147483633
	jmp	.LBB142_6
.LBB142_4:
	mov	r0, 4
	jl	r3, r0, .LBB142_8
	jmp	.LBB142_5
.LBB142_5:                              // %.preheader35
	mov	r5, -2147483645
	jmp	.LBB142_7
.LBB142_6:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [r4]
	mov	r1, r4
add	r1, 4
	mov	[r2], r0
	mov	r0, [r1]
	mov	r1, r2
add	r1, 4
	mov	r6, r4
add	r6, 8
	mov	r7, r2
	mov	[r1], r0
	mov	r0, [r6]
add	r7, 8
	mov	r1, r4
add	r1, 12
	mov	r6, r2
add	r6, 12
	mov	[r7], r0
add	r4, 16
	mov	r0, [r1]
add	r2, 16
add	r3, -16
	mov	r1, -2147483648
	mov	[r6], r0
	mov	r0, r3
	call	__bit_xor
	jg	rax, r5, .LBB142_6
	jmp	.LBB142_4
.LBB142_7:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [r4]
add	r4, 4
	mov	[r2], r0
add	r3, -4
add	r2, 4
	mov	r0, r3
	call	__bit_xor
	jg	rax, r5, .LBB142_7
	jmp	.LBB142_8
.LBB142_8:                              // %.loopexit4
	jz	r3, .LBB142_11
	jmp	.LBB142_9
.LBB142_9:                              // %.preheader32
	mov	r5, r2
	mov	t1, r4
.LBB142_10:                             // =>This Inner Loop Header: Depth=1
add	r3, -1
	mov	r1, 2
add	t1, 1
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	mov	r1, 3
add	r2, 1
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r5, rax
	mov	r7, [r5]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r0, 255
	mov	r6, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r7, rax
	mov	r0, r4
	call	__bit_and
	mov	r0, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r4, t1
	mov	r5, r2
	jnz	r3, .LBB142_10
	jmp	.LBB142_11
.LBB142_11:                             // %.loopexit
	mov	rax, r2
	ret
// -- End function
// -- Begin function memrchr
memrchr:                                // @memrchr
// %bb.0:
	mov	r4, r1
	mov	r5, r0
	mov	r0, r2
	add	r0, r5
	mov	r1, 3
	call	__bit_and
	mov	r3, r2
	sub	r3, rax
	mov	t2, 0
	mov	t3, r5
.LBB143_1:                              // =>This Inner Loop Header: Depth=1
	mov	r6, r5
	mov	r0, r2
	add	r0, t3
	mov	r1, 3
	add	r6, r2
	call	__bit_and
	jz	rax, .LBB143_4
	jmp	.LBB143_2
.LBB143_2:                              //   in Loop: Header=BB143_1 Depth=1
	mov	rax, 0
	je	r2, t2, .LBB143_16
	jmp	.LBB143_3
.LBB143_3:                              //   in Loop: Header=BB143_1 Depth=1
	mov	r1, 255
	mov	r0, r4
	call	__bit_and
add	r6, -1
	mov	r1, 2
	mov	r7, rax
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	t2, 1
add	r5, -1
add	t3, -1
	je	rax, r7, .LBB143_15
	jmp	.LBB143_1
.LBB143_4:
	mov	r7, r6
	mov	r1, -2147483648
add	r7, -1
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB143_11
	jmp	.LBB143_5
.LBB143_5:
	mov	r1, 255
	mov	r0, r4
	call	__bit_and
	mov	r7, rax
	mul	r7, 16843009
	mov	t1, 0
	mov	t2, -2139062144
	mov	t3, -2147483645
.LBB143_6:                              // =>This Inner Loop Header: Depth=1
	mov	r0, r2
	add	r0, t1
	add	r0, r5
add	r0, -4
	mov	r0, [r0]
	mov	r1, r7
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t2, .LBB143_8
	jmp	.LBB143_7
.LBB143_7:                              //   in Loop: Header=BB143_6 Depth=1
add	t1, -4
	mov	r0, r3
	add	r0, t1
	mov	r1, -2147483648
	call	__bit_xor
	jg	rax, t3, .LBB143_6
	jmp	.LBB143_9
.LBB143_8:                              // %split
	add	r6, t1
	add	r3, t1
	mov	r7, r6
	jmp	.LBB143_10
.LBB143_9:                              // %._crit_edge
	add	r6, t1
	mov	r7, r6
	mov	r3, r0
.LBB143_10:
add	r7, -1
.LBB143_11:
	mov	rax, 0
	jz	r3, .LBB143_16
	jmp	.LBB143_12
.LBB143_12:                             // %.preheader.preheader
.LBB143_13:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, r4
	call	__bit_and
	mov	r1, 2
	mov	r2, rax
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, r7
	je	r0, r2, .LBB143_16
	jmp	.LBB143_14
.LBB143_14:                             //   in Loop: Header=BB143_13 Depth=1
add	r3, -1
add	r7, -1
	mov	rax, 0
	jz	r3, .LBB143_16
	jmp	.LBB143_13
.LBB143_15:                             // %..loopexit.loopexit1_crit_edge
	add	r5, r2
	mov	rax, r5
.LBB143_16:                             // %.loopexit
	ret
// -- End function
// -- Begin function memset
memset:                                 // @memset
// %bb.0:
	mov	r3, r1
	mov	r1, 255
	mov	r4, r2
	mov	r2, r0
	mov	r0, r3
	call	__bit_and
	mov	r1, 3
	mov	r6, rax
	mov	r0, r2
	call	__bit_and
	mov	r5, r2
	jz	rax, .LBB144_4
	jmp	.LBB144_1
.LBB144_1:
	mov	r7, r2
add	r7, 1
	mov	r0, r2
.LBB144_2:                              // =>This Inner Loop Header: Depth=1
	jz	r4, .LBB144_14
	jmp	.LBB144_3
.LBB144_3:                              //   in Loop: Header=BB144_2 Depth=1
add	r4, -1
	mov	r5, r0
	mov	r1, 3
add	r5, 1
	call	__bit_and
	mov	r1, -4
	mov	t1, rax
	call	__bit_and
	mov	t2, rax
	mov	t3, [t2]
	mov	r1, 3
	mov	r0, t1
	call	__bit_shl
	mov	r1, 255
	mov	t1, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, 255
	mov	t4, rax
	mov	r1, t1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, t4
	call	__bit_and
	mov	r0, rax
	mov	r1, t1
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[t2], rax
	mov	r0, r7
	call	__bit_and
add	r7, 1
	mov	r0, r5
	jnz	rax, .LBB144_2
	jmp	.LBB144_4
.LBB144_4:                              // %.loopexit7
	mov	r1, -2147483648
	mov	r0, r4
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB144_11
	jmp	.LBB144_5
.LBB144_5:
	mul	r6, 16843009
	mov	r0, r4
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB144_8
	jmp	.LBB144_6
.LBB144_6:                              // %.preheader.preheader
	mov	r7, -2147483633
	jmp	.LBB144_9
.LBB144_7:
	mov	r0, 4
	jl	r4, r0, .LBB144_11
	jmp	.LBB144_8
.LBB144_8:                              // %.preheader35
	mov	r7, -2147483645
	jmp	.LBB144_10
.LBB144_9:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r5
add	r0, 4
	mov	[r5], r6
	mov	r1, r5
add	r1, 8
	mov	[r0], r6
	mov	r0, r5
add	r0, 12
	mov	[r1], r6
add	r5, 16
add	r4, -16
	mov	r1, -2147483648
	mov	[r0], r6
	mov	r0, r4
	call	__bit_xor
	jg	rax, r7, .LBB144_9
	jmp	.LBB144_7
.LBB144_10:                             // =>This Inner Loop Header: Depth=1
	mov	[r5], r6
add	r4, -4
add	r5, 4
	mov	r0, r4
	call	__bit_xor
	jg	rax, r7, .LBB144_10
	jmp	.LBB144_11
.LBB144_11:                             // %.loopexit5
	jz	r4, .LBB144_14
	jmp	.LBB144_12
.LBB144_12:
	mov	t2, r5
.LBB144_13:                             // =>This Inner Loop Header: Depth=1
add	r4, -1
	mov	r1, 3
add	t2, 1
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r6, rax
	call	__bit_and
	mov	r5, rax
	mov	r7, [r5]
	mov	r1, 3
	mov	r0, r6
	call	__bit_shl
	mov	r1, 255
	mov	r6, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, 255
	mov	t1, rax
	mov	r1, r6
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r7, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, rax
	mov	r1, r6
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r5, t2
	jnz	r4, .LBB144_13
	jmp	.LBB144_14
.LBB144_14:                             // %.loopexit
	mov	rax, r2
	ret
// -- End function
// -- Begin function rawmemchr
rawmemchr:                              // @rawmemchr
// %bb.0:
	mov	r2, r1
	mov	r1, 3
	mov	r3, r0
	call	__bit_and
	jz	rax, .LBB145_4
	jmp	.LBB145_1
.LBB145_1:
	mov	r4, r3
add	r4, 1
.LBB145_2:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, r2
	call	__bit_and
	mov	r1, 2
	mov	r5, rax
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	rax, r5, .LBB145_8
	jmp	.LBB145_3
.LBB145_3:                              //   in Loop: Header=BB145_2 Depth=1
	mov	r1, 3
add	r3, 1
	mov	r0, r4
	call	__bit_and
add	r4, 1
	jnz	rax, .LBB145_2
	jmp	.LBB145_4
.LBB145_4:                              // %.loopexit2
	mov	r1, 255
	mov	r0, r2
	call	__bit_and
	mov	r4, rax
	mul	r4, 16843009
add	r3, -5
	mov	r5, -2139062144
.LBB145_5:                              // =>This Inner Loop Header: Depth=1
	mov	r0, r3
add	r0, 5
	mov	r0, [r0]
	mov	r1, r4
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r3, 4
	je	rax, r5, .LBB145_5
	jmp	.LBB145_6
.LBB145_6:
.LBB145_7:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, r2
	call	__bit_and
add	r3, 1
	mov	r1, 2
	mov	r4, rax
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	rax, r4, .LBB145_7
	jmp	.LBB145_8
.LBB145_8:                              // %.loopexit
	mov	rax, r3
	ret
// -- End function
// -- Begin function rindex
rindex:                                 // @rindex
// %bb.0:
	mov	r4, r1
	mov	r1, 255
	mov	r3, r0
	mov	r0, r4
	call	__bit_and
	mov	r5, rax
	jz	r5, .LBB146_16
	jmp	.LBB146_1
.LBB146_1:                              // %.preheader.split.preheader.i
	mul	r5, 16843009
	mov	r2, 0
	mov	t2, -2139062144
.LBB146_2:                              // %.preheader.split.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB146_6 Depth 2
                                        //     Child Loop BB146_9 Depth 2
                                        //     Child Loop BB146_12 Depth 2
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	jz	rax, .LBB146_4
	jmp	.LBB146_3
.LBB146_3:                              // %.preheader29.i.preheader
                                        //   in Loop: Header=BB146_2 Depth=1
	mov	r6, r3
add	r6, 1
	jmp	.LBB146_6
.LBB146_4:                              // %.loopexit9.i.i
                                        //   in Loop: Header=BB146_2 Depth=1
	mov	r6, [r3]
	mov	r0, 16843008
	sub	r0, r6
	mov	r1, r6
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t2, .LBB146_11
	jmp	.LBB146_5
.LBB146_5:                              // %.preheader5.i.i.preheader
                                        //   in Loop: Header=BB146_2 Depth=1
	jmp	.LBB146_9
.LBB146_6:                              // %.preheader29.i
                                        //   Parent Loop BB146_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
	jz	r7, .LBB146_24
	jmp	.LBB146_7
.LBB146_7:                              //   in Loop: Header=BB146_6 Depth=2
	mov	r0, r4
	call	__bit_and
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	je	rax, t1, .LBB146_15
	jmp	.LBB146_8
.LBB146_8:                              //   in Loop: Header=BB146_6 Depth=2
	mov	r1, 3
add	r3, 1
	mov	r0, r6
	call	__bit_and
add	r6, 1
	jz	rax, .LBB146_4
	jmp	.LBB146_6
.LBB146_9:                              // %.preheader5.i.i
                                        //   Parent Loop BB146_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, r6
	mov	r1, r5
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t2, .LBB146_11
	jmp	.LBB146_10
.LBB146_10:                             //   in Loop: Header=BB146_9 Depth=2
add	r3, 4
	mov	r6, [r3]
	mov	r0, 16843008
	sub	r0, r6
	mov	r1, r6
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, t2, .LBB146_9
	jmp	.LBB146_11
.LBB146_11:                             // %.loopexit6.i.i.preheader
                                        //   in Loop: Header=BB146_2 Depth=1
add	r3, -1
.LBB146_12:                             // %.loopexit6.i.i
                                        //   Parent Loop BB146_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	r3, 1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	jz	r6, .LBB146_14
	jmp	.LBB146_13
.LBB146_13:                             // %.loopexit6.i.i
                                        //   in Loop: Header=BB146_12 Depth=2
	mov	r0, r4
	call	__bit_and
	mov	r7, rax
	mov	r0, r6
	call	__bit_and
	jne	rax, r7, .LBB146_12
	jmp	.LBB146_14
.LBB146_14:                             //   in Loop: Header=BB146_2 Depth=1
	mov	r0, r4
	call	__bit_and
	mov	r7, rax
	mov	r0, r6
	call	__bit_and
	jne	rax, r7, .LBB146_24
	jmp	.LBB146_15
.LBB146_15:                             // %strchr.exit.i
                                        //   in Loop: Header=BB146_2 Depth=1
	mov	r0, r3
add	r0, 1
	mov	r2, r3
	mov	r3, r0
	jmp	.LBB146_2
.LBB146_16:
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r2, r3
	jz	rax, .LBB146_20
	jmp	.LBB146_17
.LBB146_17:                             // %.preheader2.i1.i.preheader
	mov	r4, r3
add	r4, 1
	mov	r2, r3
.LBB146_18:                             // %.preheader2.i1.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB146_24
	jmp	.LBB146_19
.LBB146_19:                             //   in Loop: Header=BB146_18 Depth=1
	mov	r1, 3
add	r2, 1
	mov	r0, r4
	call	__bit_and
add	r4, 1
	jnz	rax, .LBB146_18
	jmp	.LBB146_20
.LBB146_20:                             // %.loopexit4.i2.i.preheader
add	r2, -5
	mov	r3, -2139062144
.LBB146_21:                             // %.loopexit4.i2.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r2
add	r0, 5
	mov	r1, [r0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r2, 4
	je	rax, r3, .LBB146_21
	jmp	.LBB146_22
.LBB146_22:                             // %.preheader.i3.i.preheader
.LBB146_23:                             // %.preheader.i3.i
                                        // =>This Inner Loop Header: Depth=1
add	r2, 1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB146_23
	jmp	.LBB146_24
.LBB146_24:                             // %strrchr.exit
	mov	rax, r2
	ret
// -- End function
// -- Begin function stpcpy
stpcpy:                                 // @stpcpy
// %bb.0:
	mov	r3, r1
	mov	r2, r0
	mov	r0, r3
	mov	r1, r2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB147_4
	jmp	.LBB147_1
.LBB147_1:
	mov	r4, [r3]
	mov	r0, 16843008
	sub	r0, r4
	mov	r1, r4
	call	__bit_or
	mov	r1, -2139062144
	mov	r5, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r5, .LBB147_4
	jmp	.LBB147_2
.LBB147_2:                              // %.preheader.preheader
.LBB147_3:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	r3, 4
	mov	[r2], r4
	mov	r4, [r3]
	mov	r0, 16843008
	sub	r0, r4
add	r2, 4
	mov	r1, r4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, r5, .LBB147_3
	jmp	.LBB147_4
.LBB147_4:                              // %.loopexit.preheader
add	r2, -1
	mov	r7, r3
.LBB147_5:                              // %.loopexit
                                        // =>This Inner Loop Header: Depth=1
add	r2, 1
	mov	r1, 2
add	r7, 1
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r4, rax
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r6, rax
	mov	r0, r4
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r3, r7
	jnz	r4, .LBB147_5
	jmp	.LBB147_6
.LBB147_6:
	mov	rax, r2
	ret
// -- End function
// -- Begin function stpncpy
stpncpy:                                // @stpncpy
// %bb.0:
	mov	r3, r2
	mov	r4, r1
	mov	r2, r0
	mov	r0, r4
	mov	r1, r2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	r5, rax
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB148_5
	jmp	.LBB148_1
.LBB148_1:
	jnz	r5, .LBB148_5
	jmp	.LBB148_2
.LBB148_2:                              // %.preheader5.preheader
	mov	r6, -2139062144
	mov	r7, -2147483645
.LBB148_3:                              // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	r5, [r4]
	mov	r0, 16843008
	sub	r0, r5
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB148_5
	jmp	.LBB148_4
.LBB148_4:                              //   in Loop: Header=BB148_3 Depth=1
add	r3, -4
add	r4, 4
	mov	[r2], r5
	mov	r1, -2147483648
add	r2, 4
	mov	r0, r3
	call	__bit_xor
	jg	rax, r7, .LBB148_3
	jmp	.LBB148_5
.LBB148_5:                              // %.loopexit6.preheader
	mov	t2, 0
.LBB148_6:                              // %.loopexit6
                                        // =>This Inner Loop Header: Depth=1
	mov	r5, r2
	add	r5, t2
	je	r3, t2, .LBB148_12
	jmp	.LBB148_7
.LBB148_7:                              //   in Loop: Header=BB148_6 Depth=1
	mov	r0, r4
	add	r0, t2
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r6, rax
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r5, rax
	mov	t1, [r5]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
add	t2, 1
	jnz	r6, .LBB148_6
	jmp	.LBB148_8
.LBB148_8:
	mov	r5, r2
	add	r5, t2
	mov	r4, r5
add	r4, -1
	je	r3, t2, .LBB148_13
	jmp	.LBB148_9
.LBB148_9:                              // %.preheader.preheader
	sub	r3, t2
	mov	t1, 0
.LBB148_10:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r2
	add	r0, t1
	add	r0, t2
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r7, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
add	t1, 1
	mov	[r6], rax
	jne	r3, t1, .LBB148_10
	jmp	.LBB148_11
.LBB148_11:                             // %.loopexit.loopexit
	add	r2, t2
	add	r2, t1
	mov	r5, r2
	jmp	.LBB148_13
.LBB148_12:                             // %.loopexit.loopexit1
	mov	r4, 0
.LBB148_13:                             // %.loopexit
	mov	r0, r4
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	r5, r4
add	rax, 1
	mov	r0, rax
	mov	r1, r5
	call	__bit_and
	add	rax, r4
	ret
// -- End function
// -- Begin function strcat
strcat:                                 // @strcat
// %bb.0:
	mov	r4, r1
	mov	r1, 3
	mov	r2, r0
	call	__bit_and
	mov	r3, r2
	jz	rax, .LBB149_4
	jmp	.LBB149_1
.LBB149_1:                              // %.preheader2.preheader
	mov	r5, r2
add	r5, 1
	mov	r3, r2
.LBB149_2:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB149_9
	jmp	.LBB149_3
.LBB149_3:                              //   in Loop: Header=BB149_2 Depth=1
	mov	r1, 3
add	r3, 1
	mov	r0, r5
	call	__bit_and
add	r5, 1
	jnz	rax, .LBB149_2
	jmp	.LBB149_4
.LBB149_4:                              // %.loopexit4
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB149_9
	jmp	.LBB149_5
.LBB149_5:                              // %.preheader1.preheader
add	r3, -5
	mov	r5, -2139062144
.LBB149_6:                              // %.preheader1
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r3
add	r0, 5
	mov	r1, [r0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r3, 4
	je	rax, r5, .LBB149_6
	jmp	.LBB149_7
.LBB149_7:                              // %.preheader.preheader
.LBB149_8:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	r3, 1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB149_8
	jmp	.LBB149_9
.LBB149_9:                              // %.loopexit
	mov	r0, r3
	mov	r1, r4
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB149_13
	jmp	.LBB149_10
.LBB149_10:
	mov	r5, [r4]
	mov	r0, 16843008
	sub	r0, r5
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r6, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB149_13
	jmp	.LBB149_11
.LBB149_11:                             // %.preheader.i.preheader
.LBB149_12:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
add	r4, 4
	mov	[r3], r5
	mov	r5, [r4]
	mov	r0, 16843008
	sub	r0, r5
add	r3, 4
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, r6, .LBB149_12
	jmp	.LBB149_13
.LBB149_13:                             // %.loopexit.i.preheader
	mov	r7, r4
	mov	t1, r3
.LBB149_14:                             // %.loopexit.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
add	r7, 1
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	mov	r1, 3
add	t1, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r3, rax
	mov	r6, [r3]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r6, rax
	mov	r0, r5
	call	__bit_and
	mov	r0, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r3, t1
	mov	r4, r7
	jnz	r5, .LBB149_14
	jmp	.LBB149_15
.LBB149_15:                             // %strcpy.exit
	mov	rax, r2
	ret
// -- End function
// -- Begin function strchr
strchr:                                 // @strchr
// %bb.0:
	mov	r3, r1
	mov	r1, 255
	mov	r2, r0
	mov	r0, r3
	call	__bit_and
	mov	r1, 3
	mov	r4, rax
	mov	r0, r2
	call	__bit_and
	jz	r4, .LBB150_3
	jmp	.LBB150_1
.LBB150_1:
	jz	rax, .LBB150_11
	jmp	.LBB150_2
.LBB150_2:
	mov	r6, r2
add	r6, 1
	jmp	.LBB150_13
.LBB150_3:
	mov	r5, r2
	jz	rax, .LBB150_7
	jmp	.LBB150_4
.LBB150_4:                              // %.preheader2.preheader
	mov	r3, r2
add	r3, 1
	mov	r5, r2
.LBB150_5:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB150_22
	jmp	.LBB150_6
.LBB150_6:                              //   in Loop: Header=BB150_5 Depth=1
	mov	r1, 3
add	r5, 1
	mov	r0, r3
	call	__bit_and
add	r3, 1
	jnz	rax, .LBB150_5
	jmp	.LBB150_7
.LBB150_7:                              // %.loopexit4.preheader
add	r5, -5
	mov	r2, -2139062144
.LBB150_8:                              // %.loopexit4
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r5
add	r0, 5
	mov	r1, [r0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r5, 4
	je	rax, r2, .LBB150_8
	jmp	.LBB150_9
.LBB150_9:                              // %.preheader.preheader
.LBB150_10:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	r5, 1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB150_22
	jmp	.LBB150_10
.LBB150_11:                             // %.loopexit9
	mov	r5, [r2]
	mov	r0, 16843008
	sub	r0, r5
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r6, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB150_18
	jmp	.LBB150_12
.LBB150_12:                             // %.preheader5.preheader
	mul	r4, 16843009
	jmp	.LBB150_16
.LBB150_13:                             // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
	mov	r5, 0
	jz	r7, .LBB150_22
	jmp	.LBB150_14
.LBB150_14:                             //   in Loop: Header=BB150_13 Depth=1
	mov	r0, r3
	call	__bit_and
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	mov	r5, r2
	je	rax, t1, .LBB150_22
	jmp	.LBB150_15
.LBB150_15:                             //   in Loop: Header=BB150_13 Depth=1
	mov	r1, 3
add	r2, 1
	mov	r0, r6
	call	__bit_and
add	r6, 1
	jz	rax, .LBB150_11
	jmp	.LBB150_13
.LBB150_16:                             // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r5
	mov	r1, r4
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB150_18
	jmp	.LBB150_17
.LBB150_17:                             //   in Loop: Header=BB150_16 Depth=1
add	r2, 4
	mov	r5, [r2]
	mov	r0, 16843008
	sub	r0, r5
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, r6, .LBB150_16
	jmp	.LBB150_18
.LBB150_18:                             // %.loopexit6
add	r2, -1
.LBB150_19:                             // =>This Inner Loop Header: Depth=1
add	r2, 1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	jz	r4, .LBB150_21
	jmp	.LBB150_20
.LBB150_20:                             //   in Loop: Header=BB150_19 Depth=1
	mov	r0, r3
	call	__bit_and
	mov	r5, rax
	mov	r0, r4
	call	__bit_and
	jne	rax, r5, .LBB150_19
	jmp	.LBB150_21
.LBB150_21:
	mov	r0, r3
	call	__bit_and
	mov	r3, rax
	mov	r0, r4
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r2
	call	__bit_and
	mov	r5, rax
.LBB150_22:                             // %.loopexit
	mov	rax, r5
	ret
// -- End function
// -- Begin function strchrnul
strchrnul:                              // @strchrnul
// %bb.0:
	mov	r5, r1
	mov	r1, 255
	mov	r3, r0
	mov	r0, r5
	call	__bit_and
	mov	r1, 3
	mov	r6, rax
	mov	r0, r3
	call	__bit_and
	mov	r4, rax
	jz	r6, .LBB151_3
	jmp	.LBB151_1
.LBB151_1:
	mov	r2, r3
	jz	r4, .LBB151_11
	jmp	.LBB151_2
.LBB151_2:
	mov	r7, r3
add	r7, 1
	mov	r2, r3
	jmp	.LBB151_13
.LBB151_3:
	mov	r2, r3
	jz	r4, .LBB151_7
	jmp	.LBB151_4
.LBB151_4:                              // %.preheader2.i.preheader
	mov	r4, r3
add	r4, 1
	mov	r2, r3
.LBB151_5:                              // %.preheader2.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB151_32
	jmp	.LBB151_6
.LBB151_6:                              //   in Loop: Header=BB151_5 Depth=1
	mov	r1, 3
add	r2, 1
	mov	r0, r4
	call	__bit_and
add	r4, 1
	jnz	rax, .LBB151_5
	jmp	.LBB151_7
.LBB151_7:                              // %.loopexit4.i.preheader
add	r2, -5
	mov	r3, -2139062144
.LBB151_8:                              // %.loopexit4.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r2
add	r0, 5
	mov	r1, [r0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r2, 4
	je	rax, r3, .LBB151_8
	jmp	.LBB151_9
.LBB151_9:                              // %.preheader.i.preheader
.LBB151_10:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
add	r2, 1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB151_32
	jmp	.LBB151_10
.LBB151_11:                             // %.loopexit9.i
	mov	r7, [r2]
	mov	r0, 16843008
	sub	r0, r7
	mov	r1, r7
	call	__bit_or
	mov	r1, -2139062144
	mov	t1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t1, .LBB151_18
	jmp	.LBB151_12
.LBB151_12:                             // %.preheader5.i.preheader
	mul	r6, 16843009
	jmp	.LBB151_16
.LBB151_13:                             // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	jz	t1, .LBB151_22
	jmp	.LBB151_14
.LBB151_14:                             //   in Loop: Header=BB151_13 Depth=1
	mov	r0, r5
	call	__bit_and
	mov	t2, rax
	mov	r0, t1
	call	__bit_and
	je	rax, t2, .LBB151_32
	jmp	.LBB151_15
.LBB151_15:                             //   in Loop: Header=BB151_13 Depth=1
	mov	r1, 3
add	r2, 1
	mov	r0, r7
	call	__bit_and
add	r7, 1
	jz	rax, .LBB151_11
	jmp	.LBB151_13
.LBB151_16:                             // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r7
	mov	r1, r6
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t1, .LBB151_18
	jmp	.LBB151_17
.LBB151_17:                             //   in Loop: Header=BB151_16 Depth=1
add	r2, 4
	mov	r7, [r2]
	mov	r0, 16843008
	sub	r0, r7
	mov	r1, r7
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, t1, .LBB151_16
	jmp	.LBB151_18
.LBB151_18:                             // %.loopexit6.i
add	r2, -1
.LBB151_19:                             // =>This Inner Loop Header: Depth=1
add	r2, 1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	jz	r6, .LBB151_21
	jmp	.LBB151_20
.LBB151_20:                             //   in Loop: Header=BB151_19 Depth=1
	mov	r0, r5
	call	__bit_and
	mov	r7, rax
	mov	r0, r6
	call	__bit_and
	jne	rax, r7, .LBB151_19
	jmp	.LBB151_21
.LBB151_21:
	mov	r0, r5
	call	__bit_and
	mov	r5, rax
	mov	r0, r6
	call	__bit_and
	je	rax, r5, .LBB151_32
	jmp	.LBB151_22
.LBB151_22:                             // %strchr.exit
	jz	r4, .LBB151_27
	jmp	.LBB151_23
.LBB151_23:
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r2, r3
	jz	rax, .LBB151_31
	jmp	.LBB151_24
.LBB151_24:                             // %.preheader1.i.preheader
	mov	r0, r3
add	r0, 1
	mov	r2, r3
	mov	r3, r0
	jmp	.LBB151_26
.LBB151_25:                             //   in Loop: Header=BB151_26 Depth=1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r3, 1
	jz	rax, .LBB151_31
	jmp	.LBB151_26
.LBB151_26:                             // %.preheader1.i
                                        // =>This Inner Loop Header: Depth=1
add	r2, 1
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	jnz	rax, .LBB151_25
	jmp	.LBB151_27
.LBB151_27:                             // %.loopexit.i.preheader
	mov	r4, r3
add	r4, -1
	mov	r5, -2139062144
.LBB151_28:                             // %.loopexit.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [r3]
	mov	r0, 16843008
	sub	r0, r1
	mov	r2, r4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r3, 4
add	r4, 4
	je	rax, r5, .LBB151_28
	jmp	.LBB151_29
.LBB151_29:                             // %.preheader.i1.preheader
	mov	r5, -4
.LBB151_30:                             // %.preheader.i1
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r3
	add	r0, r5
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r2, 1
add	r5, 1
	jnz	rax, .LBB151_30
	jmp	.LBB151_31
.LBB151_31:                             // %strlen.exit
.LBB151_32:                             // %strchr.exit.thread
	mov	rax, r2
	ret
// -- End function
// -- Begin function strcmp
strcmp:                                 // @strcmp
// %bb.0:
	mov	r2, r1
	mov	r3, r0
	mov	r0, r2
	mov	r1, r3
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB152_2
	jmp	.LBB152_1
.LBB152_1:
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	jmp	.LBB152_7
.LBB152_2:
	mov	r4, [r3]
	mov	r0, [r2]
	jne	r4, r0, .LBB152_7
	jmp	.LBB152_3
.LBB152_3:                              // %.preheader5.preheader
	mov	r6, -2139062144
	mov	r5, 0
.LBB152_4:                              // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r4
	mov	r1, r4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB152_13
	jmp	.LBB152_5
.LBB152_5:                              //   in Loop: Header=BB152_4 Depth=1
add	r3, 4
add	r2, 4
	mov	r4, [r3]
	mov	r0, [r2]
	je	r4, r0, .LBB152_4
	jmp	.LBB152_6
.LBB152_6:
.LBB152_7:
	mov	r1, 255
	mov	r0, r4
	call	__bit_and
	mov	r5, 0
	jz	rax, .LBB152_12
	jmp	.LBB152_8
.LBB152_8:                              // %.preheader.preheader
add	r3, 1
.LBB152_9:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	mov	r0, r4
	call	__bit_and
	jne	rax, r5, .LBB152_11
	jmp	.LBB152_10
.LBB152_10:                             //   in Loop: Header=BB152_9 Depth=1
	mov	r1, 2
add	r2, 1
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
add	r3, 1
	mov	r0, 0
	jnz	r4, .LBB152_9
	jmp	.LBB152_11
.LBB152_11:
	call	__bit_and
	mov	r5, rax
.LBB152_12:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	sub	r5, rax
.LBB152_13:                             // %.loopexit
	mov	rax, r5
	ret
// -- End function
// -- Begin function strcpy
strcpy:                                 // @strcpy
// %bb.0:
	mov	r4, r1
	mov	r2, r0
	mov	r0, r4
	mov	r1, r2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	r3, r2
	jnz	rax, .LBB153_4
	jmp	.LBB153_1
.LBB153_1:
	mov	r5, [r4]
	mov	r0, 16843008
	sub	r0, r5
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r6, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r3, r2
	jne	rax, r6, .LBB153_4
	jmp	.LBB153_2
.LBB153_2:                              // %.preheader.preheader
	mov	r3, r2
.LBB153_3:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	r4, 4
	mov	[r3], r5
	mov	r5, [r4]
	mov	r0, 16843008
	sub	r0, r5
add	r3, 4
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, r6, .LBB153_3
	jmp	.LBB153_4
.LBB153_4:                              // %.loopexit.preheader
	mov	r7, r4
	mov	t1, r3
.LBB153_5:                              // %.loopexit
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
add	r7, 1
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	mov	r1, 3
add	t1, 1
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r3, rax
	mov	r6, [r3]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r6, rax
	mov	r0, r5
	call	__bit_and
	mov	r0, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	r3, t1
	mov	r4, r7
	jnz	r5, .LBB153_5
	jmp	.LBB153_6
.LBB153_6:
	mov	rax, r2
	ret
// -- End function
// -- Begin function strcspn
strcspn:                                // @strcspn
// %bb.0:
	mov	r3, r1
	mov	r1, 2
	mov	r2, r0
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	mov	r4, r2
	jz	r5, .LBB154_9
	jmp	.LBB154_1
.LBB154_1:
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	jz	r6, .LBB154_3
	jmp	.LBB154_2
.LBB154_2:                              // %.preheader4.preheader
add	r3, 1
	mov	r4, r2
	jmp	.LBB154_5
.LBB154_3:                              // %.preheader.preheader
	mov	r4, r2
.LBB154_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	r4, 1
	mov	r1, 2
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB154_9
	jmp	.LBB154_4
.LBB154_5:                              // %.preheader4
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB154_7 Depth 2
	mov	r7, r3
	mov	rax, r6
	jmp	.LBB154_7
.LBB154_6:                              //   in Loop: Header=BB154_7 Depth=2
	mov	r1, 2
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r7, 1
	jz	rax, .LBB154_8
	jmp	.LBB154_7
.LBB154_7:                              //   Parent Loop BB154_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, r5
	call	__bit_and
	je	rax, t1, .LBB154_9
	jmp	.LBB154_6
.LBB154_8:                              //   in Loop: Header=BB154_5 Depth=1
add	r4, 1
	mov	r1, 2
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	jnz	r5, .LBB154_5
	jmp	.LBB154_9
.LBB154_9:                              // %.loopexit
	sub	r4, r2
	mov	rax, r4
	ret
// -- End function
// -- Begin function strdup
strdup:                                 // @strdup
// %bb.0:
sub	rsp, 4
	mov	[rsp], x0
	mov	r1, 3
	mov	r2, r0
	call	__bit_and
	mov	r3, r2
	jz	rax, .LBB155_5
	jmp	.LBB155_1
.LBB155_1:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, r2
	jz	rax, .LBB155_9
	jmp	.LBB155_2
.LBB155_2:                              // %.preheader1.i.preheader
	mov	r3, r2
add	r3, 1
	mov	r5, r2
	jmp	.LBB155_4
.LBB155_3:                              //   in Loop: Header=BB155_4 Depth=1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r3, 1
	jz	rax, .LBB155_9
	jmp	.LBB155_4
.LBB155_4:                              // %.preheader1.i
                                        // =>This Inner Loop Header: Depth=1
add	r5, 1
	mov	r1, 3
	mov	r0, r5
	call	__bit_and
	jnz	rax, .LBB155_3
	jmp	.LBB155_5
.LBB155_5:                              // %.loopexit.i.preheader
	mov	r4, r3
add	r4, -1
	mov	r6, -2139062144
.LBB155_6:                              // %.loopexit.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [r3]
	mov	r0, 16843008
	sub	r0, r1
	mov	r5, r4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r3, 4
add	r4, 4
	je	rax, r6, .LBB155_6
	jmp	.LBB155_7
.LBB155_7:                              // %.preheader.i.preheader
	mov	r6, -4
.LBB155_8:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r3
	add	r0, r6
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r5, 1
add	r6, 1
	jnz	rax, .LBB155_8
	jmp	.LBB155_9
.LBB155_9:                              // %strlen.exit
	sub	r5, r2
add	r5, 1
	mov	r0, r5
	call	malloc
	mov	r3, rax
	jz	r3, .LBB155_26
	jmp	.LBB155_10
.LBB155_10:
	mov	r1, -2147483648
	mov	r0, r5
	call	__bit_xor
	mov	r0, -2147483632
	mov	r6, r3
	jl	rax, r0, .LBB155_23
	jmp	.LBB155_11
.LBB155_11:
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r4, rax
	mov	t4, 8
	sub	t4, r4
	mov	t5, 0
	mov	r6, r2
.LBB155_12:                             // =>This Inner Loop Header: Depth=1
	mov	r7, r3
	mov	r0, r2
	add	r0, t5
	mov	r1, 2
	add	r7, t5
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	r7, rax
	mov	t3, [r7]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r0, 255
	mov	t2, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
add	t5, 1
add	r6, 1
	jne	t4, t5, .LBB155_12
	jmp	.LBB155_13
.LBB155_13:
	mov	r1, -8
	mov	r0, r4
	call	__bit_or
	mov	r4, rax
	mov	r7, r2
	add	r7, t5
	mov	r1, 3
	add	r4, r5
	mov	r0, r7
	call	__bit_and
	mov	r0, rax
	jnz	r0, .LBB155_20
	jmp	.LBB155_14
.LBB155_14:
	mov	r6, r3
	mov	r1, -2147483648
	add	r6, t5
	mov	r0, r4
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB155_16
	jmp	.LBB155_15
.LBB155_15:                             // %.preheader.i2.preheader
	mov	r6, r3
	add	r6, t5
	add	r2, t5
	mov	r5, 0
	mov	r7, -2147483633
	jmp	.LBB155_18
.LBB155_16:                             // %.preheader77
	mov	t1, -2147483645
	mov	r5, r4
	mov	r2, r7
	jmp	.LBB155_19
.LBB155_17:
	add	r2, r5
	mov	r0, 3
	add	r6, r5
	mov	r7, r2
	mov	r5, r4
	jg	r4, r0, .LBB155_16
	jmp	.LBB155_23
.LBB155_18:                             // %.preheader.i2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r2
	add	r0, r5
	mov	r1, [r0]
	mov	t0, r6
	add	t0, r5
	mov	[t0], r1
	mov	r1, r0
add	r1, 4
	mov	r1, [r1]
	mov	t1, t0
add	t1, 4
	mov	[t1], r1
	mov	r1, r0
add	r1, 8
	mov	r1, [r1]
	mov	t1, t0
add	t1, 8
	mov	[t1], r1
add	r0, 12
	mov	r0, [r0]
add	t0, 12
	mov	[t0], r0
add	r4, -16
	mov	r1, -2147483648
add	r5, 16
	mov	r0, r4
	call	__bit_xor
	jg	rax, r7, .LBB155_18
	jmp	.LBB155_17
.LBB155_19:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [r2]
add	r2, 4
	mov	[r6], r0
add	r5, -4
add	r6, 4
	mov	r0, r5
	call	__bit_xor
	jg	rax, t1, .LBB155_19
	jmp	.LBB155_23
.LBB155_20:
	call	__bit_shl
	mov	r5, rax
	mov	t1, 8
	sub	t1, r0
	mov	r0, r6
	call	__bit_and
	mov	t7, r2
	sub	t7, rax
	mov	r0, t7
	add	r0, t5
	mov	t2, [r0]
add	t7, 4
	mov	t6, 0
.LBB155_21:                             // =>This Inner Loop Header: Depth=1
	mov	x0, r3
	mov	r0, t5
	add	r0, t6
	add	r0, t7
	mov	t3, [r0]
	add	x0, t6
	mov	r1, 31
	add	x0, t5
	mov	r0, r5
	call	__bit_and
	mov	r0, t2
	mov	r1, rax
	call	__bit_shl
	mov	t2, rax
	mov	r0, r5
	call	__bit_not
	mov	r1, 31
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
	mov	t4, rax
	mov	r0, t3
	call	__bit_shr
	mov	r0, rax
	mov	r1, t4
	call	__bit_shr
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
add	r4, -4
	mov	r1, -2147483648
add	t6, 4
	mov	r0, t1
	call	__bit_xor
	mov	t4, rax
	mov	r0, r4
	call	__bit_xor
	mov	t2, t3
	jge	rax, t4, .LBB155_21
	jmp	.LBB155_22
.LBB155_22:
	mov	r1, -4
	mov	r0, r7
	call	__bit_or
	mov	r5, rax
	mov	r1, 3
	add	r5, t6
	mov	r0, r6
	call	__bit_and
	sub	r2, rax
	add	r2, r5
	add	r2, t5
add	r2, 4
	mov	r6, r3
	add	r6, t5
	add	r6, t6
	jmp	.LBB155_24
.LBB155_23:                             // %.loopexit8.i
	mov	r4, r5
	jz	r5, .LBB155_26
	jmp	.LBB155_24
.LBB155_24:                             // %.preheader
	mov	t1, r2
	mov	t2, r6
.LBB155_25:                             // =>This Inner Loop Header: Depth=1
add	r4, -1
	mov	r1, 2
add	t1, 1
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	mov	r1, 3
add	t2, 1
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r7, rax
	mov	r0, r2
	call	__bit_and
	mov	r0, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
	mov	r6, t2
	mov	r2, t1
	jnz	r4, .LBB155_25
	jmp	.LBB155_26
.LBB155_26:                             // %memcpy.exit
	mov	rax, r3
	mov	x0, [rsp]
add	rsp, 4
	ret
// -- End function
// -- Begin function strlen
strlen:                                 // @strlen
// %bb.0:
	mov	r1, 3
	mov	r2, r0
	call	__bit_and
	mov	r3, r2
	jz	rax, .LBB156_5
	jmp	.LBB156_1
.LBB156_1:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, r2
	jz	rax, .LBB156_9
	jmp	.LBB156_2
.LBB156_2:                              // %.preheader1.preheader
	mov	r3, r2
add	r3, 1
	mov	r4, r2
	jmp	.LBB156_4
.LBB156_3:                              //   in Loop: Header=BB156_4 Depth=1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r3, 1
	jz	rax, .LBB156_9
	jmp	.LBB156_4
.LBB156_4:                              // %.preheader1
                                        // =>This Inner Loop Header: Depth=1
add	r4, 1
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	jnz	rax, .LBB156_3
	jmp	.LBB156_5
.LBB156_5:                              // %.loopexit.preheader
	mov	r5, r3
add	r5, -1
	mov	r6, -2139062144
.LBB156_6:                              // %.loopexit
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [r3]
	mov	r0, 16843008
	sub	r0, r1
	mov	r4, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r3, 4
add	r5, 4
	je	rax, r6, .LBB156_6
	jmp	.LBB156_7
.LBB156_7:                              // %.preheader.preheader
	mov	r6, -4
.LBB156_8:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r3
	add	r0, r6
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r4, 1
add	r6, 1
	jnz	rax, .LBB156_8
	jmp	.LBB156_9
.LBB156_9:                              // %.loopexit2
	sub	r4, r2
	mov	rax, r4
	ret
// -- End function
// -- Begin function strncat
strncat:                                // @strncat
// %bb.0:
	mov	r3, r1
	mov	r1, 3
	mov	r4, r0
	call	__bit_and
	mov	r5, r4
	jz	rax, .LBB157_4
	jmp	.LBB157_1
.LBB157_1:                              // %.preheader5.preheader
	mov	r6, r4
add	r6, 1
	mov	r5, r4
.LBB157_2:                              // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB157_9
	jmp	.LBB157_3
.LBB157_3:                              //   in Loop: Header=BB157_2 Depth=1
	mov	r1, 3
add	r5, 1
	mov	r0, r6
	call	__bit_and
add	r6, 1
	jnz	rax, .LBB157_2
	jmp	.LBB157_4
.LBB157_4:                              // %.loopexit7
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB157_9
	jmp	.LBB157_5
.LBB157_5:                              // %.preheader4.preheader
add	r5, -5
	mov	r6, -2139062144
.LBB157_6:                              // %.preheader4
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r5
add	r0, 5
	mov	r1, [r0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r5, 4
	je	rax, r6, .LBB157_6
	jmp	.LBB157_7
.LBB157_7:                              // %.preheader2.preheader
.LBB157_8:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
add	r5, 1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB157_8
	jmp	.LBB157_9
.LBB157_9:                              // %.loopexit3
	jz	r2, .LBB157_14
	jmp	.LBB157_10
.LBB157_10:                             // %.preheader.preheader
.LBB157_11:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	r6, rax
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	t1, rax
	mov	t2, [t1]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t2, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[t1], rax
	jz	r6, .LBB157_14
	jmp	.LBB157_12
.LBB157_12:                             //   in Loop: Header=BB157_11 Depth=1
add	r5, 1
add	r2, -1
add	r3, 1
	jnz	r2, .LBB157_11
	jmp	.LBB157_13
.LBB157_13:
	mov	r1, 3
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
.LBB157_14:                             // %.loopexit
	mov	rax, r4
	ret
// -- End function
// -- Begin function strncmp
strncmp:                                // @strncmp
// %bb.0:
	mov	r3, r2
	mov	r4, r1
	mov	r5, r0
	mov	r2, 0
	jz	r3, .LBB158_14
	jmp	.LBB158_1
.LBB158_1:
	mov	r0, r4
	mov	r1, r5
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	r6, rax
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB158_8
	jmp	.LBB158_2
.LBB158_2:
	jnz	r6, .LBB158_8
	jmp	.LBB158_3
.LBB158_3:                              // %.preheader10.preheader
	mov	r6, 4
	mov	r7, -2139062144
	mov	t1, -2147483645
.LBB158_4:                              // %.preheader10
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [r5]
	mov	r0, [r4]
	jne	r1, r0, .LBB158_8
	jmp	.LBB158_5
.LBB158_5:                              //   in Loop: Header=BB158_4 Depth=1
	je	r3, r6, .LBB158_14
	jmp	.LBB158_6
.LBB158_6:                              //   in Loop: Header=BB158_4 Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r7, .LBB158_14
	jmp	.LBB158_7
.LBB158_7:                              //   in Loop: Header=BB158_4 Depth=1
add	r3, -4
add	r5, 4
	mov	r1, -2147483648
add	r4, 4
	mov	r0, r3
	call	__bit_xor
	jg	rax, t1, .LBB158_4
	jmp	.LBB158_8
.LBB158_8:                              // %.loopexit11
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	r6, rax
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	r6, rax, .LBB158_13
	jmp	.LBB158_9
.LBB158_9:                              // %.preheader.preheader
add	r3, -1
add	r4, 1
add	r5, 1
.LBB158_10:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, r6
	call	__bit_and
	jz	rax, .LBB158_14
	jmp	.LBB158_11
.LBB158_11:                             // %.preheader
                                        //   in Loop: Header=BB158_10 Depth=1
	jz	r3, .LBB158_14
	jmp	.LBB158_12
.LBB158_12:                             //   in Loop: Header=BB158_10 Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	r6, rax
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r3, -1
add	r4, 1
add	r5, 1
	je	r6, rax, .LBB158_10
	jmp	.LBB158_13
.LBB158_13:                             // %.loopexit9
	mov	r0, r6
	mov	r3, rax
	call	__bit_and
	mov	r2, rax
	mov	r0, r3
	call	__bit_and
	sub	r2, rax
.LBB158_14:                             // %.loopexit
	mov	rax, r2
	ret
// -- End function
// -- Begin function strncpy
strncpy:                                // @strncpy
// %bb.0:
	mov	r4, r1
	mov	r3, r0
	mov	r0, r4
	mov	r1, r3
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	r5, rax
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483644
	mov	t2, r3
	jl	rax, r0, .LBB159_5
	jmp	.LBB159_1
.LBB159_1:
	mov	t2, r3
	jnz	r5, .LBB159_5
	jmp	.LBB159_2
.LBB159_2:                              // %.preheader4.preheader
	mov	r6, -2139062144
	mov	r7, -2147483645
	mov	t2, r3
.LBB159_3:                              // %.preheader4
                                        // =>This Inner Loop Header: Depth=1
	mov	r5, [r4]
	mov	r0, 16843008
	sub	r0, r5
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB159_6
	jmp	.LBB159_4
.LBB159_4:                              //   in Loop: Header=BB159_3 Depth=1
add	r2, -4
add	r4, 4
	mov	[t2], r5
	mov	r1, -2147483648
add	t2, 4
	mov	r0, r2
	call	__bit_xor
	jg	rax, r7, .LBB159_3
	jmp	.LBB159_5
.LBB159_5:                              // %.loopexit6
	jz	r2, .LBB159_12
	jmp	.LBB159_6
.LBB159_6:                              // %.loopexit5.preheader
	mov	t3, 1
.LBB159_7:                              // %.loopexit5
                                        // =>This Inner Loop Header: Depth=1
	mov	r5, t2
	mov	t4, r2
	mov	r1, 2
add	r2, -1
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	mov	r1, 3
add	t2, 1
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r5, rax
	mov	t1, [r5]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	jz	r6, .LBB159_9
	jmp	.LBB159_8
.LBB159_8:                              // %.loopexit5
                                        //   in Loop: Header=BB159_7 Depth=1
add	r4, 1
	jne	t4, t3, .LBB159_7
	jmp	.LBB159_9
.LBB159_9:
	jz	r2, .LBB159_12
	jmp	.LBB159_10
.LBB159_10:                             // %.preheader.preheader
	mov	r7, 0
.LBB159_11:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, t2
	add	r0, r7
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r6, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
add	r7, 1
	mov	[r5], rax
	jne	r2, r7, .LBB159_11
	jmp	.LBB159_12
.LBB159_12:                             // %.loopexit
	mov	rax, r3
	ret
// -- End function
// -- Begin function strndup
strndup:                                // @strndup
// %bb.0:
sub	rsp, 8
	mov	[rsp+1], x0
	mov	[rsp], x1
	mov	r2, r1
	mov	r4, r0
	mov	r3, r4
	jz	r2, .LBB160_4
	jmp	.LBB160_1
.LBB160_1:
	mov	r6, r4
	add	r6, r2
	mov	r5, r4
.LBB160_2:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, r5
	jz	rax, .LBB160_4
	jmp	.LBB160_3
.LBB160_3:                              //   in Loop: Header=BB160_2 Depth=1
add	r2, -1
add	r5, 1
	mov	r3, r6
	jnz	r2, .LBB160_2
	jmp	.LBB160_4
.LBB160_4:                              // %.loopexit
	sub	r3, r4
	mov	r0, r3
add	r0, 1
	call	malloc
	mov	r2, rax
	jz	r2, .LBB160_22
	jmp	.LBB160_5
.LBB160_5:
	mov	r1, -2147483648
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483632
	mov	r6, r2
	mov	r5, r3
	jl	rax, r0, .LBB160_18
	jmp	.LBB160_6
.LBB160_6:
	mov	r1, 3
	mov	r0, r2
	call	__bit_and
	mov	r5, rax
	mov	t4, 8
	sub	t4, r5
	mov	t6, 0
	mov	r6, r4
.LBB160_7:                              // =>This Inner Loop Header: Depth=1
	mov	r7, r2
	mov	r0, r4
	add	r0, t6
	mov	r1, 2
	add	r7, t6
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 3
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	r7, rax
	mov	t3, [r7]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r0, 255
	mov	t2, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
add	t6, 1
add	r6, 1
	jne	t4, t6, .LBB160_7
	jmp	.LBB160_8
.LBB160_8:
	mov	r1, -8
	mov	r0, r5
	call	__bit_or
	mov	r5, rax
	mov	r7, r4
	add	r7, t6
	mov	r1, 3
	add	r5, r3
	mov	r0, r7
	call	__bit_and
	mov	r0, rax
	jnz	r0, .LBB160_15
	jmp	.LBB160_9
.LBB160_9:
	mov	r6, r2
	mov	r1, -2147483648
	add	r6, t6
	mov	r0, r5
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB160_11
	jmp	.LBB160_10
.LBB160_10:                             // %.preheader.i.preheader
	mov	r6, r2
	add	r6, t6
	add	r4, t6
	mov	r7, 0
	mov	t1, -2147483633
	jmp	.LBB160_13
.LBB160_11:                             // %.preheader55
	mov	t1, -2147483645
	mov	r4, r7
	jmp	.LBB160_14
.LBB160_12:
	add	r4, r7
	mov	r0, 3
	add	r6, r7
	mov	r7, r4
	jg	r5, r0, .LBB160_11
	jmp	.LBB160_18
.LBB160_13:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r4
	add	r0, r7
	mov	r1, [r0]
	mov	t0, r6
	add	t0, r7
	mov	[t0], r1
	mov	r1, r0
add	r1, 4
	mov	r1, [r1]
	mov	t2, t0
add	t2, 4
	mov	[t2], r1
	mov	r1, r0
add	r1, 8
	mov	r1, [r1]
	mov	t2, t0
add	t2, 8
	mov	[t2], r1
add	r0, 12
	mov	r0, [r0]
add	t0, 12
	mov	[t0], r0
add	r5, -16
	mov	r1, -2147483648
add	r7, 16
	mov	r0, r5
	call	__bit_xor
	jg	rax, t1, .LBB160_13
	jmp	.LBB160_12
.LBB160_14:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [r4]
add	r4, 4
	mov	[r6], r0
add	r5, -4
add	r6, 4
	mov	r0, r5
	call	__bit_xor
	jg	rax, t1, .LBB160_14
	jmp	.LBB160_18
.LBB160_15:
	call	__bit_shl
	mov	t1, rax
	mov	t2, 8
	sub	t2, r0
	mov	r0, r6
	call	__bit_and
	mov	x0, r4
	sub	x0, rax
	mov	r0, x0
	add	r0, t6
	mov	t3, [r0]
add	x0, 4
	mov	t7, 0
.LBB160_16:                             // =>This Inner Loop Header: Depth=1
	mov	x1, r2
	mov	r0, t6
	add	r0, t7
	add	r0, x0
	mov	t4, [r0]
	add	x1, t7
	mov	r1, 31
	add	x1, t6
	mov	r0, t1
	call	__bit_and
	mov	r0, t3
	mov	r1, rax
	call	__bit_shl
	mov	t3, rax
	mov	r0, t1
	call	__bit_not
	mov	r1, 31
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
	mov	t5, rax
	mov	r0, t4
	call	__bit_shr
	mov	r0, rax
	mov	r1, t5
	call	__bit_shr
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
add	r5, -4
	mov	r1, -2147483648
add	t7, 4
	mov	r0, t2
	call	__bit_xor
	mov	t5, rax
	mov	r0, r5
	call	__bit_xor
	mov	t3, t4
	jge	rax, t5, .LBB160_16
	jmp	.LBB160_17
.LBB160_17:
	mov	r1, -4
	mov	r0, r7
	call	__bit_or
	mov	r7, rax
	mov	r1, 3
	add	r7, t7
	mov	r0, r6
	call	__bit_and
	sub	r4, rax
	add	r4, r7
	add	r4, t6
	add	t6, r2
	add	t6, t7
add	r4, 4
	mov	r6, t6
	jmp	.LBB160_19
.LBB160_18:                             // %.loopexit8.i
	jz	r5, .LBB160_21
	jmp	.LBB160_19
.LBB160_19:                             // %.preheader
	mov	t2, r4
	mov	t3, r6
.LBB160_20:                             // =>This Inner Loop Header: Depth=1
add	r5, -1
	mov	r1, 2
add	t2, 1
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	mov	r1, 3
add	t3, 1
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	r6, rax
	mov	t1, [r6]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t1
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t1, rax
	mov	r0, r4
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t1
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
	mov	r6, t3
	mov	r4, t2
	jnz	r5, .LBB160_20
	jmp	.LBB160_21
.LBB160_21:                             // %memcpy.exit
	mov	r0, r2
	add	r0, r3
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r4, rax
	mov	r5, [r4]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r4], rax
.LBB160_22:
	mov	rax, r2
	mov	x1, [rsp]
	mov	x0, [rsp+1]
add	rsp, 8
	ret
// -- End function
// -- Begin function strnlen
strnlen:                                // @strnlen
// %bb.0:
	mov	r3, r1
	mov	r2, r0
	mov	rax, r2
	jz	r3, .LBB161_4
	jmp	.LBB161_1
.LBB161_1:
	mov	r6, r2
	add	r6, r3
	mov	r4, r2
.LBB161_2:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, r4
	jz	r0, .LBB161_4
	jmp	.LBB161_3
.LBB161_3:                              //   in Loop: Header=BB161_2 Depth=1
add	r3, -1
add	r4, 1
	mov	rax, r6
	jnz	r3, .LBB161_2
	jmp	.LBB161_4
.LBB161_4:                              // %.loopexit
	sub	rax, r2
	ret
// -- End function
// -- Begin function strnstr
strnstr:                                // @strnstr
// %bb.0:
	mov	r3, r2
	mov	r2, r1
	mov	r4, r0
	mov	r5, r2
	jz	r3, .LBB162_4
	jmp	.LBB162_1
.LBB162_1:
	mov	r7, r2
	add	r7, r3
	mov	t1, r3
	mov	r6, r2
.LBB162_2:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, r6
	jz	rax, .LBB162_4
	jmp	.LBB162_3
.LBB162_3:                              //   in Loop: Header=BB162_2 Depth=1
add	t1, -1
add	r6, 1
	mov	r5, r7
	jnz	t1, .LBB162_2
	jmp	.LBB162_4
.LBB162_4:                              // %strnlen.exit
	mov	r1, -2147483648
	sub	r5, r2
	mov	r0, r3
	call	__bit_xor
	mov	r6, rax
	mov	r0, r5
	call	__bit_xor
	jl	rax, r6, .LBB162_6
	jmp	.LBB162_5
.LBB162_5:
	mov	r0, r2
	add	r0, r5
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 0
	jnz	r0, .LBB162_21
	jmp	.LBB162_6
.LBB162_6:
	mov	r0, r4
	mov	r1, r3
	mov	r3, r5
	call	memmem
	mov	r2, rax
	mov	rax, 0
	jz	r2, .LBB162_21
	jmp	.LBB162_7
.LBB162_7:
	mov	r3, r2
	mov	r1, 3
	sub	r3, r4
	mov	r0, r4
	call	__bit_and
	jz	rax, .LBB162_13
	jmp	.LBB162_8
.LBB162_8:                              // %.preheader2.preheader
	mov	r5, r4
.LBB162_9:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
	mov	rax, r2
	je	r2, r5, .LBB162_21
	jmp	.LBB162_10
.LBB162_10:                             //   in Loop: Header=BB162_9 Depth=1
	mov	r1, 2
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 0
	jz	r0, .LBB162_21
	jmp	.LBB162_11
.LBB162_11:                             //   in Loop: Header=BB162_9 Depth=1
add	r5, 1
	mov	r1, 3
add	r4, 1
	mov	r0, r5
	call	__bit_and
	jnz	rax, .LBB162_9
	jmp	.LBB162_12
.LBB162_12:                             // %.loopexit9.i.loopexit
	mov	r3, r2
	sub	r3, r5
.LBB162_13:                             // %.loopexit9.i
	mov	r1, -2147483648
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB162_17
	jmp	.LBB162_14
.LBB162_14:                             // %.preheader.preheader
	mov	r5, -2139062144
	mov	r6, -2147483645
.LBB162_15:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [r4]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r5, .LBB162_18
	jmp	.LBB162_16
.LBB162_16:                             //   in Loop: Header=BB162_15 Depth=1
add	r3, -4
	mov	r1, -2147483648
add	r4, 4
	mov	r0, r3
	call	__bit_xor
	jg	rax, r6, .LBB162_15
	jmp	.LBB162_17
.LBB162_17:                             // %.loopexit6.i
	mov	rax, r2
	jz	r3, .LBB162_21
	jmp	.LBB162_18
.LBB162_18:                             // %.loopexit5.i.preheader
.LBB162_19:                             // %.loopexit5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 0
	jz	r0, .LBB162_21
	jmp	.LBB162_20
.LBB162_20:                             //   in Loop: Header=BB162_19 Depth=1
add	r3, -1
add	r4, 1
	mov	rax, r2
	jnz	r3, .LBB162_19
	jmp	.LBB162_21
.LBB162_21:                             // %memchr.exit
	ret
// -- End function
// -- Begin function strpbrk
strpbrk:                                // @strpbrk
// %bb.0:
	mov	r2, r1
	mov	r1, 2
	mov	r6, r0
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	mov	r3, 0
	jz	r4, .LBB163_7
	jmp	.LBB163_1
.LBB163_1:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	jz	r5, .LBB163_7
	jmp	.LBB163_2
.LBB163_2:                              // %.preheader.preheader
add	r2, 1
.LBB163_3:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB163_5 Depth 2
	mov	r3, r6
	mov	r6, r2
	mov	rax, r5
	jmp	.LBB163_5
.LBB163_4:                              //   in Loop: Header=BB163_5 Depth=2
	mov	r1, 2
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r6, 1
	jz	rax, .LBB163_6
	jmp	.LBB163_5
.LBB163_5:                              //   Parent Loop BB163_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
	mov	r0, r4
	call	__bit_and
	je	rax, r7, .LBB163_7
	jmp	.LBB163_4
.LBB163_6:                              //   in Loop: Header=BB163_3 Depth=1
add	r3, 1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	mov	r6, r3
	mov	r3, 0
	jnz	r4, .LBB163_3
	jmp	.LBB163_7
.LBB163_7:                              // %.loopexit
	mov	rax, r3
	ret
// -- End function
// -- Begin function strrchr
strrchr:                                // @strrchr
// %bb.0:
	mov	r4, r1
	mov	r1, 255
	mov	r3, r0
	mov	r0, r4
	call	__bit_and
	mov	r5, rax
	jz	r5, .LBB164_16
	jmp	.LBB164_1
.LBB164_1:                              // %.preheader.split.preheader
	mul	r5, 16843009
	mov	r2, 0
	mov	t2, -2139062144
.LBB164_2:                              // %.preheader.split
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB164_6 Depth 2
                                        //     Child Loop BB164_9 Depth 2
                                        //     Child Loop BB164_12 Depth 2
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	jz	rax, .LBB164_4
	jmp	.LBB164_3
.LBB164_3:                              // %.preheader29.preheader
                                        //   in Loop: Header=BB164_2 Depth=1
	mov	r6, r3
add	r6, 1
	jmp	.LBB164_6
.LBB164_4:                              // %.loopexit9.i
                                        //   in Loop: Header=BB164_2 Depth=1
	mov	r6, [r3]
	mov	r0, 16843008
	sub	r0, r6
	mov	r1, r6
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t2, .LBB164_11
	jmp	.LBB164_5
.LBB164_5:                              // %.preheader5.i.preheader
                                        //   in Loop: Header=BB164_2 Depth=1
	jmp	.LBB164_9
.LBB164_6:                              // %.preheader29
                                        //   Parent Loop BB164_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
	jz	r7, .LBB164_24
	jmp	.LBB164_7
.LBB164_7:                              //   in Loop: Header=BB164_6 Depth=2
	mov	r0, r4
	call	__bit_and
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	je	rax, t1, .LBB164_15
	jmp	.LBB164_8
.LBB164_8:                              //   in Loop: Header=BB164_6 Depth=2
	mov	r1, 3
add	r3, 1
	mov	r0, r6
	call	__bit_and
add	r6, 1
	jz	rax, .LBB164_4
	jmp	.LBB164_6
.LBB164_9:                              // %.preheader5.i
                                        //   Parent Loop BB164_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, r6
	mov	r1, r5
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t2, .LBB164_11
	jmp	.LBB164_10
.LBB164_10:                             //   in Loop: Header=BB164_9 Depth=2
add	r3, 4
	mov	r6, [r3]
	mov	r0, 16843008
	sub	r0, r6
	mov	r1, r6
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, t2, .LBB164_9
	jmp	.LBB164_11
.LBB164_11:                             // %.loopexit6.i.preheader
                                        //   in Loop: Header=BB164_2 Depth=1
add	r3, -1
.LBB164_12:                             // %.loopexit6.i
                                        //   Parent Loop BB164_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	r3, 1
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	jz	r6, .LBB164_14
	jmp	.LBB164_13
.LBB164_13:                             // %.loopexit6.i
                                        //   in Loop: Header=BB164_12 Depth=2
	mov	r0, r4
	call	__bit_and
	mov	r7, rax
	mov	r0, r6
	call	__bit_and
	jne	rax, r7, .LBB164_12
	jmp	.LBB164_14
.LBB164_14:                             //   in Loop: Header=BB164_2 Depth=1
	mov	r0, r4
	call	__bit_and
	mov	r7, rax
	mov	r0, r6
	call	__bit_and
	jne	rax, r7, .LBB164_24
	jmp	.LBB164_15
.LBB164_15:                             // %strchr.exit
                                        //   in Loop: Header=BB164_2 Depth=1
	mov	r0, r3
add	r0, 1
	mov	r2, r3
	mov	r3, r0
	jmp	.LBB164_2
.LBB164_16:
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r2, r3
	jz	rax, .LBB164_20
	jmp	.LBB164_17
.LBB164_17:                             // %.preheader2.i1.preheader
	mov	r4, r3
add	r4, 1
	mov	r2, r3
.LBB164_18:                             // %.preheader2.i1
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB164_24
	jmp	.LBB164_19
.LBB164_19:                             //   in Loop: Header=BB164_18 Depth=1
	mov	r1, 3
add	r2, 1
	mov	r0, r4
	call	__bit_and
add	r4, 1
	jnz	rax, .LBB164_18
	jmp	.LBB164_20
.LBB164_20:                             // %.loopexit4.i2.preheader
add	r2, -5
	mov	r3, -2139062144
.LBB164_21:                             // %.loopexit4.i2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r2
add	r0, 5
	mov	r1, [r0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r2, 4
	je	rax, r3, .LBB164_21
	jmp	.LBB164_22
.LBB164_22:                             // %.preheader.i3.preheader
.LBB164_23:                             // %.preheader.i3
                                        // =>This Inner Loop Header: Depth=1
add	r2, 1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB164_23
	jmp	.LBB164_24
.LBB164_24:                             // %strchr.exit4
	mov	rax, r2
	ret
// -- End function
// -- Begin function strsep
strsep:                                 // @strsep
// %bb.0:
	mov	r3, r0
	mov	r2, [r3]
	mov	r4, r1
	mov	rax, 0
	jz	r2, .LBB165_14
	jmp	.LBB165_1
.LBB165_1:
	mov	t2, r2
	mov	r1, 2
add	t2, 1
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, r4
.LBB165_2:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB165_5
	jmp	.LBB165_3
.LBB165_3:                              //   in Loop: Header=BB165_2 Depth=1
add	r6, 1
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
	mov	r0, r5
	call	__bit_and
	jne	rax, r7, .LBB165_2
	jmp	.LBB165_4
.LBB165_4:
	mov	r1, 3
	mov	[r3], t2
	mov	r0, r2
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r4, rax
	mov	r5, [r4]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r4], rax
	mov	rax, r2
	jmp	.LBB165_14
.LBB165_5:                              // %.loopexit.i
	mov	r0, r5
	call	__bit_and
	jz	rax, .LBB165_7
	jmp	.LBB165_6
.LBB165_6:                              // %.preheader.i.preheader
	jmp	.LBB165_8
.LBB165_7:
	mov	[r3], 0
	mov	rax, 0
	jmp	.LBB165_14
.LBB165_8:                              // %.preheader.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB165_9 Depth 2
	mov	r5, t2
	mov	r1, 2
add	t2, 1
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, r4
.LBB165_9:                              //   Parent Loop BB165_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, r6
	call	__bit_and
	jne	t1, rax, .LBB165_13
	jmp	.LBB165_10
.LBB165_10:
	mov	r0, r6
	call	__bit_and
	mov	r0, 0
	jz	rax, .LBB165_12
	jmp	.LBB165_11
.LBB165_11:
	mov	r1, 3
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r6, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	r0, t2
.LBB165_12:
	mov	[r3], r0
	mov	rax, r2
	jmp	.LBB165_14
.LBB165_13:                             //   in Loop: Header=BB165_9 Depth=2
add	r7, 1
	mov	r0, t1
	call	__bit_and
	jz	rax, .LBB165_8
	jmp	.LBB165_9
.LBB165_14:                             // %__strtok_r.exit
	ret
// -- End function
// -- Begin function strspn
strspn:                                 // @strspn
// %bb.0:
	mov	r2, r1
	mov	r1, 2
	mov	r3, r0
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	mov	r6, r3
	jz	r4, .LBB166_7
	jmp	.LBB166_1
.LBB166_1:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, r3
	jz	r5, .LBB166_7
	jmp	.LBB166_2
.LBB166_2:                              // %.preheader.preheader
add	r2, 1
	mov	r6, r3
.LBB166_3:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB166_5 Depth 2
	mov	r7, r2
	mov	rax, r5
	jmp	.LBB166_5
.LBB166_4:                              //   in Loop: Header=BB166_5 Depth=2
	mov	r1, 2
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r7, 1
	jz	rax, .LBB166_7
	jmp	.LBB166_5
.LBB166_5:                              //   Parent Loop BB166_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, r4
	call	__bit_and
	jne	rax, t1, .LBB166_4
	jmp	.LBB166_6
.LBB166_6:                              //   in Loop: Header=BB166_3 Depth=1
add	r6, 1
	mov	r1, 2
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	jnz	r4, .LBB166_3
	jmp	.LBB166_7
.LBB166_7:                              // %.loopexit
	sub	r6, r3
	mov	rax, r6
	ret
// -- End function
// -- Begin function two_way_long_needle.63
two_way_long_needle.63:                 // @two_way_long_needle.63
// %bb.0:
sub	rsp, 1060
	mov	[rsp+264], x0
	mov	[rsp+263], x1
	mov	[rsp+262], x2
	mov	[rsp+261], x3
	mov	[rsp+260], x4
	mov	[rsp+259], x5
	mov	[rsp+258], x6
	mov	[rsp+257], x7
	mov	[rsp+256], x8
	mov	r4, r1
	mov	r5, r0
	mov	t6, 0
	mov	r1, -2147483648
	mov	r7, 1
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483646
	mov	r6, 0
	jl	rax, r0, .LBB167_22
	jmp	.LBB167_1
.LBB167_1:                              // %.preheader31.preheader
	mov	t1, -1
	mov	t7, 0
	mov	r6, 1
	mov	t5, 1
.LBB167_2:                              // %.preheader31
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r2
	add	r0, r6
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, r2
	add	r0, t1
	add	r0, t5
	mov	r1, 2
	mov	t2, rax
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	t3, rax
	mov	r0, t3
	call	__bit_xor
	mov	t4, rax
	mov	r0, t2
	call	__bit_xor
	jge	rax, t4, .LBB167_4
	jmp	.LBB167_3
.LBB167_3:                              //   in Loop: Header=BB167_2 Depth=1
	mov	r7, r6
	sub	r7, t1
	mov	t5, 1
	jmp	.LBB167_9
.LBB167_4:                              //   in Loop: Header=BB167_2 Depth=1
	mov	r1, 255
	mov	r0, t3
	call	__bit_and
	mov	r6, rax
	mov	r0, t2
	call	__bit_and
	jne	rax, r6, .LBB167_8
	jmp	.LBB167_5
.LBB167_5:                              //   in Loop: Header=BB167_2 Depth=1
	je	t5, r7, .LBB167_7
	jmp	.LBB167_6
.LBB167_6:                              //   in Loop: Header=BB167_2 Depth=1
add	t5, 1
	mov	r6, t7
	jmp	.LBB167_9
.LBB167_7:                              //   in Loop: Header=BB167_2 Depth=1
	add	t7, r7
	mov	t5, 1
	mov	r6, t7
	jmp	.LBB167_9
.LBB167_8:                              //   in Loop: Header=BB167_2 Depth=1
	mov	r6, t7
add	r6, 1
	mov	t5, 1
	mov	t1, t7
	mov	r7, 1
.LBB167_9:                              //   in Loop: Header=BB167_2 Depth=1
	mov	t7, r6
	mov	r6, t5
	mov	r1, -2147483648
	add	r6, t7
	mov	r0, r3
	call	__bit_xor
	mov	t2, rax
	mov	r0, r6
	call	__bit_xor
	jl	rax, t2, .LBB167_2
	jmp	.LBB167_10
.LBB167_10:                             // %.preheader30.preheader
	mov	r6, -1
	mov	x1, 0
	mov	t2, 1
	mov	t7, 1
	mov	x0, 1
.LBB167_11:                             // %.preheader30
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r2
	add	r0, t2
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, r2
	add	r0, r6
	add	r0, x0
	mov	r1, 2
	mov	t3, rax
	call	__bit_shr
	mov	r1, 3
	mov	t4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	t4, rax
	mov	r0, t3
	call	__bit_xor
	mov	t5, rax
	mov	r0, t4
	call	__bit_xor
	jge	rax, t5, .LBB167_13
	jmp	.LBB167_12
.LBB167_12:                             //   in Loop: Header=BB167_11 Depth=1
	mov	t7, t2
	sub	t7, r6
	mov	x0, 1
	jmp	.LBB167_18
.LBB167_13:                             //   in Loop: Header=BB167_11 Depth=1
	mov	r1, 255
	mov	r0, t4
	call	__bit_and
	mov	t2, rax
	mov	r0, t3
	call	__bit_and
	jne	rax, t2, .LBB167_17
	jmp	.LBB167_14
.LBB167_14:                             //   in Loop: Header=BB167_11 Depth=1
	je	x0, t7, .LBB167_16
	jmp	.LBB167_15
.LBB167_15:                             //   in Loop: Header=BB167_11 Depth=1
add	x0, 1
	mov	t2, x1
	jmp	.LBB167_18
.LBB167_16:                             //   in Loop: Header=BB167_11 Depth=1
	add	x1, t7
	mov	x0, 1
	mov	t2, x1
	jmp	.LBB167_18
.LBB167_17:                             //   in Loop: Header=BB167_11 Depth=1
	mov	t2, x1
add	t2, 1
	mov	x0, 1
	mov	r6, x1
	mov	t7, 1
.LBB167_18:                             //   in Loop: Header=BB167_11 Depth=1
	mov	x1, t2
	mov	t2, x0
	mov	r1, -2147483648
	add	t2, x1
	mov	r0, r3
	call	__bit_xor
	mov	t3, rax
	mov	r0, t2
	call	__bit_xor
	jl	rax, t3, .LBB167_11
	jmp	.LBB167_19
.LBB167_19:
add	t1, 1
add	r6, 1
	mov	r0, t1
	call	__bit_xor
	mov	t2, rax
	mov	r0, r6
	call	__bit_xor
	jl	rax, t2, .LBB167_21
	jmp	.LBB167_20
.LBB167_20:
	mov	r7, t7
.LBB167_21:
	mov	r0, t1
	sub	r0, r6
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	sub	r6, t1
add	rax, 1
	mov	r0, rax
	mov	r1, r6
	call	__bit_and
	mov	r6, rax
	add	r6, t1
.LBB167_22:
	mov	r0, 1024
	jmp	.LBB167_25
.LBB167_23:
	jz	r3, .LBB167_27
	jmp	.LBB167_24
.LBB167_24:                             // %.preheader28.preheader
	mov	t3, r3
add	t3, -1
	mov	t4, -1
	mov	t1, r2
	jmp	.LBB167_26
.LBB167_25:                             // =>This Inner Loop Header: Depth=1
	mov	r1, rsp
	add	r1, t6
add	t6, 4
	mov	[r1], r3
	je	t6, r0, .LBB167_23
	jmp	.LBB167_25
.LBB167_26:                             // %.preheader28
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shl
	add	rax, rsp
	mov	[rax], t3
add	t3, -1
add	t1, 1
	jne	t3, t4, .LBB167_26
	jmp	.LBB167_27
.LBB167_27:                             // %.loopexit29
	mov	t1, r2
	mov	r1, -2147483648
	add	t1, r7
	mov	r0, r6
	call	__bit_xor
	mov	r0, -2147483644
	mov	t2, r6
	mov	t3, r2
	jl	rax, r0, .LBB167_33
	jmp	.LBB167_28
.LBB167_28:
	mov	r0, t1
	mov	r1, r2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	t2, r6
	mov	t3, r2
	jnz	rax, .LBB167_35
	jmp	.LBB167_29
.LBB167_29:                             // %.preheader.i.preheader
	mov	t4, -2147483645
	mov	t3, r2
	mov	t2, r6
.LBB167_30:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	t1, t3
	add	t1, r7
	mov	r0, [t3]
	mov	r1, [t1]
	jne	r0, r1, .LBB167_34
	jmp	.LBB167_31
.LBB167_31:                             //   in Loop: Header=BB167_30 Depth=1
add	t2, -4
	mov	r1, -2147483648
add	t3, 4
	mov	r0, t2
	call	__bit_xor
	jg	rax, t4, .LBB167_30
	jmp	.LBB167_32
.LBB167_32:                             // %.loopexit8.i.loopexit
	mov	t1, t3
	add	t1, r7
.LBB167_33:                             // %.loopexit8.i
	jz	t2, .LBB167_38
	jmp	.LBB167_35
.LBB167_34:                             // %.loopexit7.i.preheader.loopexit
.LBB167_35:                             // %.loopexit7.i.preheader
.LBB167_36:                             // %.loopexit7.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, t3
	call	__bit_shr
	mov	r1, 3
	mov	t4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	t4, rax
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	t5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	t4, rax, .LBB167_58
	jmp	.LBB167_37
.LBB167_37:                             //   in Loop: Header=BB167_36 Depth=1
add	t2, -1
add	t3, 1
add	t1, 1
	jnz	t2, .LBB167_36
	jmp	.LBB167_38
.LBB167_38:                             // %memcmp.exit.thread
	mov	r1, 2048
	mov	r0, r3
	call	__bit_or
	mov	t2, rax
	mov	x4, r3
	sub	x4, r7
	mov	t3, r3
add	t3, -1
	mov	x5, 1
	sub	x5, r6
	mov	x6, r5
add	x6, -1
	mov	x7, r2
add	x7, -1
	mov	t4, 0
	mov	t5, 0
.LBB167_39:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB167_41 Depth 2
                                        //     Child Loop BB167_52 Depth 2
                                        //     Child Loop BB167_54 Depth 2
	mov	r0, r4
	sub	r0, r3
	mov	r1, -2147483648
	call	__bit_xor
	mov	t1, rax
	mov	r0, t4
	call	__bit_xor
	jle	rax, t1, .LBB167_44
	jmp	.LBB167_40
.LBB167_40:                             //   in Loop: Header=BB167_39 Depth=1
	mov	t7, r5
	add	t7, r4
	mov	x0, t7
	add	x0, t2
	mov	x1, t2
	mov	t1, t7
.LBB167_41:                             //   Parent Loop BB167_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, t1
	jz	rax, .LBB167_43
	jmp	.LBB167_42
.LBB167_42:                             //   in Loop: Header=BB167_41 Depth=2
add	x1, -1
add	t1, 1
	mov	r0, x0
	jnz	x1, .LBB167_41
	jmp	.LBB167_43
.LBB167_43:                             // %strnlen.exit
                                        //   in Loop: Header=BB167_39 Depth=1
	sub	r0, t7
	add	r4, r0
	mov	r0, r4
	sub	r0, r3
	mov	r1, -2147483648
	mov	t1, 0
	call	__bit_xor
	mov	t6, rax
	mov	r0, t4
	call	__bit_xor
	jg	rax, t6, .LBB167_74
	jmp	.LBB167_44
.LBB167_44:                             //   in Loop: Header=BB167_39 Depth=1
	mov	t1, r5
	add	t1, t4
	mov	r0, t1
	add	r0, r3
add	r0, -1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shl
	add	rax, rsp
	mov	t7, [rax]
	jz	t7, .LBB167_49
	jmp	.LBB167_45
.LBB167_45:                             //   in Loop: Header=BB167_39 Depth=1
	mov	x3, 0
	jz	t5, .LBB167_48
	jmp	.LBB167_46
.LBB167_46:                             //   in Loop: Header=BB167_39 Depth=1
	mov	r1, -2147483648
	mov	r0, r7
	call	__bit_xor
	mov	t1, rax
	mov	r0, t7
	call	__bit_xor
	jge	rax, t1, .LBB167_48
	jmp	.LBB167_47
.LBB167_47:                             //   in Loop: Header=BB167_39 Depth=1
	mov	t7, x4
.LBB167_48:                             //   in Loop: Header=BB167_39 Depth=1
	add	t4, t7
	mov	t5, x3
	jmp	.LBB167_39
.LBB167_49:                             //   in Loop: Header=BB167_39 Depth=1
	mov	t6, t5
	sub	t6, r6
	mov	r1, 31
	mov	r0, t6
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	r1, r6
	sub	r1, t5
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
	add	x0, t5
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	t7, rax
	mov	r0, t3
	call	__bit_xor
	jge	t7, rax, .LBB167_51
	jmp	.LBB167_50
.LBB167_50:                             // %.preheader.preheader
                                        //   in Loop: Header=BB167_39 Depth=1
	mov	t7, x5
	add	t7, x0
	mov	x8, t3
	sub	x8, x0
	mov	x1, r2
	add	x1, x0
	add	x0, t4
	add	x0, r5
	jmp	.LBB167_52
.LBB167_51:                             // %.loopexit
                                        //   in Loop: Header=BB167_39 Depth=1
	mov	r1, 31
	mov	r0, t6
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, t6
	call	__bit_and
	mov	t6, rax
	add	t6, r6
	mov	x2, x6
	add	x2, t4
	mov	t7, r6
	jmp	.LBB167_54
.LBB167_52:                             // %.preheader
                                        //   Parent Loop BB167_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, x1
	call	__bit_shr
	mov	r1, 3
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	x2, rax
	mov	r0, x0
	call	__bit_shr
	mov	r1, 3
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x3, 0
	jne	x2, rax, .LBB167_48
	jmp	.LBB167_53
.LBB167_53:                             //   in Loop: Header=BB167_52 Depth=2
add	t7, 1
add	x8, -1
add	x1, 1
add	x0, 1
	jz	x8, .LBB167_51
	jmp	.LBB167_52
.LBB167_54:                             //   Parent Loop BB167_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, -2147483648
	mov	r0, t7
	call	__bit_xor
	mov	x0, rax
	mov	r0, t5
	call	__bit_xor
	jge	rax, x0, .LBB167_57
	jmp	.LBB167_55
.LBB167_55:                             //   in Loop: Header=BB167_54 Depth=2
	mov	x3, t7
	mov	r0, x7
	add	r0, t7
	mov	r1, 2
add	x3, -1
	call	__bit_shr
	mov	r1, 3
	mov	x0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x0]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	add	t7, x2
	mov	r1, 2
	mov	x0, rax
	mov	r0, t7
	call	__bit_shr
	mov	r1, 3
	mov	x1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [x1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t7, x3
	je	x0, rax, .LBB167_54
	jmp	.LBB167_56
.LBB167_56:                             // %._crit_edge
                                        //   in Loop: Header=BB167_39 Depth=1
add	x3, 1
	mov	t6, x3
.LBB167_57:                             //   in Loop: Header=BB167_39 Depth=1
add	t5, 1
	mov	r1, -2147483648
	mov	r0, t5
	call	__bit_xor
	mov	t5, rax
	mov	r0, t6
	call	__bit_xor
	mov	t7, r7
	mov	x3, x4
	jl	rax, t5, .LBB167_74
	jmp	.LBB167_48
.LBB167_58:                             // %memcmp.exit
	mov	t1, r3
	sub	t1, r6
	mov	r0, t1
	sub	r0, r6
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	r1, r6
	sub	r1, t1
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
	mov	r1, 2048
	add	r7, t1
	mov	r0, r3
	call	__bit_or
	mov	t2, r3
add	t2, -1
	mov	t3, rax
	mov	x0, t2
	sub	x0, r6
	mov	x1, r2
	add	x1, r6
	mov	x2, r5
	add	x2, r6
	mov	x3, r5
add	x3, -1
add	r2, -1
	mov	t4, 0
.LBB167_59:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB167_61 Depth 2
                                        //     Child Loop BB167_68 Depth 2
                                        //     Child Loop BB167_71 Depth 2
	mov	r0, r4
	sub	r0, r3
	mov	r1, -2147483648
	call	__bit_xor
	mov	t1, rax
	mov	r0, t4
	call	__bit_xor
	jle	rax, t1, .LBB167_64
	jmp	.LBB167_60
.LBB167_60:                             //   in Loop: Header=BB167_59 Depth=1
	mov	t6, r5
	add	t6, r4
	mov	t7, t6
	add	t7, t3
	mov	x4, t3
	mov	t1, t6
.LBB167_61:                             //   Parent Loop BB167_59 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	t5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, t1
	jz	rax, .LBB167_63
	jmp	.LBB167_62
.LBB167_62:                             //   in Loop: Header=BB167_61 Depth=2
add	x4, -1
add	t1, 1
	mov	r0, t7
	jnz	x4, .LBB167_61
	jmp	.LBB167_63
.LBB167_63:                             // %strnlen.exit21
                                        //   in Loop: Header=BB167_59 Depth=1
	sub	r0, t6
	add	r4, r0
	mov	r0, r4
	sub	r0, r3
	mov	r1, -2147483648
	mov	t1, 0
	call	__bit_xor
	mov	t5, rax
	mov	r0, t4
	call	__bit_xor
	jg	rax, t5, .LBB167_74
	jmp	.LBB167_64
.LBB167_64:                             //   in Loop: Header=BB167_59 Depth=1
	mov	t1, r5
	add	t1, t4
	mov	r0, t1
	add	r0, r3
add	r0, -1
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shl
	add	rax, rsp
	mov	r0, [rax]
	jnz	r0, .LBB167_67
	jmp	.LBB167_65
.LBB167_65:                             //   in Loop: Header=BB167_59 Depth=1
	mov	r1, -2147483648
	mov	r0, r6
	call	__bit_xor
	mov	t5, rax
	mov	r0, t2
	call	__bit_xor
	jle	rax, t5, .LBB167_70
	jmp	.LBB167_66
.LBB167_66:                             // %.preheader25.preheader
                                        //   in Loop: Header=BB167_59 Depth=1
	mov	x4, x2
	add	x4, t4
	mov	t7, 0
	jmp	.LBB167_68
.LBB167_67:                             //   in Loop: Header=BB167_59 Depth=1
	add	t4, r0
	jmp	.LBB167_59
.LBB167_68:                             // %.preheader25
                                        //   Parent Loop BB167_59 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x1
	add	r0, t7
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, x4
	add	r0, t7
	mov	r1, 2
	mov	t5, rax
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	t5, rax, .LBB167_73
	jmp	.LBB167_69
.LBB167_69:                             //   in Loop: Header=BB167_68 Depth=2
add	t7, 1
	jne	x0, t7, .LBB167_68
	jmp	.LBB167_70
.LBB167_70:                             // %.loopexit26.preheader
                                        //   in Loop: Header=BB167_59 Depth=1
	mov	x4, x3
	add	x4, t4
	mov	t5, r6
.LBB167_71:                             // %.loopexit26
                                        //   Parent Loop BB167_59 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	jz	t5, .LBB167_74
	jmp	.LBB167_72
.LBB167_72:                             //   in Loop: Header=BB167_71 Depth=2
	mov	x5, t5
	mov	r0, r2
	add	r0, t5
	mov	r1, 2
add	x5, -1
	call	__bit_shr
	mov	r1, 3
	mov	t6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	add	t5, x4
	mov	r1, 2
	mov	t6, rax
	mov	r0, t5
	call	__bit_shr
	mov	r1, 3
	mov	t7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t5, x5
	mov	t7, r7
	je	t6, rax, .LBB167_71
	jmp	.LBB167_73
.LBB167_73:                             // %.loopexit24
                                        //   in Loop: Header=BB167_59 Depth=1
	add	t4, t7
add	t4, 1
	jmp	.LBB167_59
.LBB167_74:                             // %.loopexit22
	mov	rax, t1
	mov	x8, [rsp+256]
	mov	x7, [rsp+257]
	mov	x6, [rsp+258]
	mov	x5, [rsp+259]
	mov	x4, [rsp+260]
	mov	x3, [rsp+261]
	mov	x2, [rsp+262]
	mov	x1, [rsp+263]
	mov	x0, [rsp+264]
add	rsp, 1060
	ret
// -- End function
// -- Begin function strstr
strstr:                                 // @strstr
// %bb.0:
sub	rsp, 64
	mov	r3, r1
	mov	r1, 2
	mov	r2, r0
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	mov	r6, r2
	jz	r4, .LBB168_91
	jmp	.LBB168_1
.LBB168_1:
	mov	r6, r3
add	r6, 1
	mov	r1, 2
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	jnz	r5, .LBB168_15
	jmp	.LBB168_2
.LBB168_2:
	mov	r0, r4
	call	__bit_and
	mov	r1, 3
	mov	r3, rax
	mov	r0, r2
	call	__bit_and
	jz	rax, .LBB168_4
	jmp	.LBB168_3
.LBB168_3:                              // %.preheader.preheader
	mov	r5, r2
add	r5, 1
	jmp	.LBB168_6
.LBB168_4:                              // %.loopexit9.i
	mov	r5, [r2]
	mov	r0, 16843008
	sub	r0, r5
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r6, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB168_11
	jmp	.LBB168_5
.LBB168_5:                              // %.preheader5.i.preheader
	mul	r3, 16843009
	jmp	.LBB168_9
.LBB168_6:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
	mov	r6, 0
	jz	r7, .LBB168_91
	jmp	.LBB168_7
.LBB168_7:                              //   in Loop: Header=BB168_6 Depth=1
	mov	r0, r4
	call	__bit_and
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	mov	r6, r2
	je	rax, t1, .LBB168_91
	jmp	.LBB168_8
.LBB168_8:                              //   in Loop: Header=BB168_6 Depth=1
	mov	r1, 3
add	r2, 1
	mov	r0, r5
	call	__bit_and
add	r5, 1
	jz	rax, .LBB168_4
	jmp	.LBB168_6
.LBB168_9:                              // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r5
	mov	r1, r3
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r6, .LBB168_11
	jmp	.LBB168_10
.LBB168_10:                             //   in Loop: Header=BB168_9 Depth=1
add	r2, 4
	mov	r5, [r2]
	mov	r0, 16843008
	sub	r0, r5
	mov	r1, r5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, r6, .LBB168_9
	jmp	.LBB168_11
.LBB168_11:                             // %.loopexit6.i.preheader
add	r2, -1
.LBB168_12:                             // %.loopexit6.i
                                        // =>This Inner Loop Header: Depth=1
add	r2, 1
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	jz	r3, .LBB168_14
	jmp	.LBB168_13
.LBB168_13:                             // %.loopexit6.i
                                        //   in Loop: Header=BB168_12 Depth=1
	mov	r0, r4
	call	__bit_and
	mov	r5, rax
	mov	r0, r3
	call	__bit_and
	jne	rax, r5, .LBB168_12
	jmp	.LBB168_14
.LBB168_14:
	mov	r0, r3
	call	__bit_and
	mov	r3, rax
	mov	r0, r4
	call	__bit_and
	mov	r0, r3
	mov	r1, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r2
	call	__bit_and
	mov	r6, rax
	jmp	.LBB168_91
.LBB168_15:
	mov	r0, r3
add	r0, 2
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
	jnz	r7, .LBB168_21
	jmp	.LBB168_16
.LBB168_16:
	mov	r0, r4
	call	__bit_and
	mov	r1, 16
	mov	r0, rax
	call	__bit_shl
	mov	r1, 255
	mov	r3, rax
	mov	r0, r5
	call	__bit_and
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r6, 0
	jz	r0, .LBB168_91
	jmp	.LBB168_17
.LBB168_17:                             // %.preheader24.preheader
add	r2, -2
	mov	r4, 0
.LBB168_18:                             // %.preheader24
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	call	__bit_and
	mov	r1, 16
	mov	r5, rax
	mov	r0, r4
	call	__bit_shl
	mov	r0, rax
	mov	r1, r5
	call	__bit_or
	mov	r0, r2
add	r0, 3
	mov	r1, 2
	mov	r4, rax
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
add	r2, 1
	je	r3, r4, .LBB168_20
	jmp	.LBB168_19
.LBB168_19:                             // %.preheader24
                                        //   in Loop: Header=BB168_18 Depth=1
	call	__bit_and
	jnz	rax, .LBB168_18
	jmp	.LBB168_20
.LBB168_20:
	mov	r0, r3
	mov	r1, r4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r2
	call	__bit_and
	mov	r6, rax
	jmp	.LBB168_91
.LBB168_21:
	mov	r0, r3
add	r0, 3
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	jnz	t1, .LBB168_27
	jmp	.LBB168_22
.LBB168_22:
	mov	r0, r4
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r1, 255
	mov	r3, rax
	mov	r0, r5
	call	__bit_and
	mov	r1, 16
	mov	r0, rax
	call	__bit_shl
	mov	r0, rax
	mov	r1, r3
	call	__bit_or
	mov	r1, 255
	mov	r3, rax
	mov	r0, r7
	call	__bit_and
	mov	r1, 8
	mov	r0, rax
	call	__bit_shl
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r6, 0
	jz	r0, .LBB168_91
	jmp	.LBB168_23
.LBB168_23:                             // %.preheader25.preheader
add	r2, -3
	mov	r4, 0
.LBB168_24:                             // %.preheader25
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	call	__bit_and
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	r0, rax
	call	__bit_shl
	mov	r0, r2
add	r0, 4
	mov	r1, 2
	mov	r4, rax
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
add	r2, 1
	je	r3, r4, .LBB168_26
	jmp	.LBB168_25
.LBB168_25:                             // %.preheader25
                                        //   in Loop: Header=BB168_24 Depth=1
	call	__bit_and
	jnz	rax, .LBB168_24
	jmp	.LBB168_26
.LBB168_26:
	mov	r0, r3
	mov	r1, r4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r2
	call	__bit_and
	mov	r6, rax
	jmp	.LBB168_91
.LBB168_27:
	mov	r0, r3
add	r0, 4
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB168_33
	jmp	.LBB168_28
.LBB168_28:
	mov	r0, r4
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r1, 255
	mov	r3, rax
	mov	r0, r5
	call	__bit_and
	mov	r1, 16
	mov	r0, rax
	call	__bit_shl
	mov	r0, rax
	mov	r1, r3
	call	__bit_or
	mov	r1, 255
	mov	r3, rax
	mov	r0, r7
	call	__bit_and
	mov	r1, 8
	mov	r0, rax
	call	__bit_shl
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r1, 255
	mov	r3, rax
	mov	r0, t1
	call	__bit_and
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, 0
	jz	rax, .LBB168_91
	jmp	.LBB168_29
.LBB168_29:                             // %.preheader26.preheader
add	r2, -4
	mov	r4, 0
.LBB168_30:                             // %.preheader26
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 8
	mov	r5, rax
	mov	r0, r4
	call	__bit_shl
	mov	r0, rax
	mov	r1, r5
	call	__bit_or
	mov	r0, r2
add	r0, 5
	mov	r1, 2
	mov	r4, rax
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r2, 1
	jz	rax, .LBB168_32
	jmp	.LBB168_31
.LBB168_31:                             // %.preheader26
                                        //   in Loop: Header=BB168_30 Depth=1
	jne	r3, r4, .LBB168_30
	jmp	.LBB168_32
.LBB168_32:
	mov	r0, r3
	mov	r1, r4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, r2
	call	__bit_and
	mov	r6, rax
	jmp	.LBB168_91
.LBB168_33:
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r5, r3
	jz	rax, .LBB168_37
	jmp	.LBB168_34
.LBB168_34:                             // %.preheader1.i.preheader
	mov	r4, r3
	mov	r5, r6
	jmp	.LBB168_36
.LBB168_35:                             //   in Loop: Header=BB168_36 Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r5, 1
	jz	rax, .LBB168_41
	jmp	.LBB168_36
.LBB168_36:                             // %.preheader1.i
                                        // =>This Inner Loop Header: Depth=1
add	r4, 1
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	jnz	rax, .LBB168_35
	jmp	.LBB168_37
.LBB168_37:                             // %.loopexit.i.preheader
	mov	r6, r5
add	r6, -1
	mov	r7, -2139062144
.LBB168_38:                             // %.loopexit.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [r5]
	mov	r0, 16843008
	sub	r0, r1
	mov	r4, r6
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	r5, 4
add	r6, 4
	je	rax, r7, .LBB168_38
	jmp	.LBB168_39
.LBB168_39:                             // %.preheader.i14.preheader
	mov	r7, -4
.LBB168_40:                             // %.preheader.i14
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r5
	add	r0, r7
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
add	r4, 1
add	r7, 1
	jnz	rax, .LBB168_40
	jmp	.LBB168_41
.LBB168_41:                             // %strlen.exit
	sub	r4, r3
	mov	r1, 512
	mov	r0, r4
	call	__bit_or
	mov	r5, rax
	mov	t1, r5
	add	r5, r2
	mov	t2, 0
.LBB168_42:                             // =>This Inner Loop Header: Depth=1
	mov	r6, r2
	add	r6, t2
	mov	r1, 2
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB168_44
	jmp	.LBB168_43
.LBB168_43:                             //   in Loop: Header=BB168_42 Depth=1
add	t2, 1
	je	t1, t2, .LBB168_45
	jmp	.LBB168_42
.LBB168_44:                             // %.strnlen.exit_crit_edge
	mov	r5, r6
.LBB168_45:                             // %strnlen.exit
	sub	r5, r2
	mov	r1, -2147483648
	mov	r6, 0
	mov	r0, r4
	call	__bit_xor
	mov	r7, rax
	mov	r0, r5
	call	__bit_xor
	jl	rax, r7, .LBB168_91
	jmp	.LBB168_46
.LBB168_46:
	mov	r0, r4
	call	__bit_xor
	mov	r0, -2147483394
	jg	rax, r0, .LBB168_90
	jmp	.LBB168_47
.LBB168_47:
	add	r5, r2
	mov	r6, r4
add	r6, 1
	mov	r1, 3
	mov	t5, 3
	mov	r0, rsp
	call	__bit_and
	mov	r7, rsp
	mov	t2, 64
	jz	rax, .LBB168_52
	jmp	.LBB168_48
.LBB168_48:
	call	__bit_and
	mov	t1, rax
add	r7, 1
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	t3, rax
	mov	t4, [t3]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r0, 255
	mov	t2, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t4, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t4
	mov	r1, rax
	call	__bit_or
	mov	[t3], rax
	mov	t2, 63
	je	t1, t5, .LBB168_52
	jmp	.LBB168_49
.LBB168_49:
	mov	t3, rsp
	mov	r1, 3
add	t3, 2
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	r7, rax
	mov	t4, [r7]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r0, 255
	mov	t2, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t4, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t4
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
	mov	r0, 2
	mov	t2, 62
	mov	r7, t3
	je	t1, r0, .LBB168_52
	jmp	.LBB168_50
.LBB168_50:
	mov	r7, rsp
	mov	r1, 3
add	r7, 3
	mov	r0, t3
	call	__bit_and
	mov	r1, -4
	mov	t2, rax
	call	__bit_and
	mov	t3, rax
	mov	t4, [t3]
	mov	r1, 3
	mov	r0, t2
	call	__bit_shl
	mov	r0, 255
	mov	t2, rax
	mov	r1, t2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t4
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t4, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, t2
	call	__bit_shl
	mov	r0, t4
	mov	r1, rax
	call	__bit_or
	mov	[t3], rax
	mov	r0, 1
	mov	t2, 61
	je	t1, r0, .LBB168_52
	jmp	.LBB168_51
.LBB168_51:
	mov	t3, rsp
	mov	r1, 3
add	t3, 4
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	t1, rax
	call	__bit_and
	mov	r7, rax
	mov	t2, [r7]
	mov	r1, 3
	mov	r0, t1
	call	__bit_shl
	mov	r0, 255
	mov	t1, rax
	mov	r1, t1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t2, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, t1
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
	mov	t2, 60
	mov	r7, t3
.LBB168_52:                             // %.preheader.i17.preheader
	sub	r5, r4
	mov	t1, r6
	mul	t1, 16843009
	mov	t3, -2147483633
	jmp	.LBB168_55
.LBB168_53:
	mov	r0, t2
add	r0, 16
	mov	r1, 20
	jl	r0, r1, .LBB168_57
	jmp	.LBB168_54
.LBB168_54:                             // %.preheader194.preheader
	mov	t3, -2147483645
	mov	r1, -2147483648
	jmp	.LBB168_56
.LBB168_55:                             // %.preheader.i17
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r7
add	r0, 4
	mov	[r7], t1
	mov	r1, r7
add	r1, 8
	mov	[r0], t1
	mov	r0, r7
add	r0, 12
	mov	[r1], t1
add	r7, 16
add	t2, -16
	mov	r1, -2147483648
	mov	[r0], t1
	mov	r0, t2
	call	__bit_xor
	jg	rax, t3, .LBB168_55
	jmp	.LBB168_53
.LBB168_56:                             // %.preheader194
                                        // =>This Inner Loop Header: Depth=1
	mov	[r7], t1
add	t2, -4
add	r7, 4
	mov	r0, t2
	call	__bit_xor
	jg	rax, t3, .LBB168_56
	jmp	.LBB168_57
.LBB168_57:                             // %.loopexit5.i
	jz	t2, .LBB168_60
	jmp	.LBB168_58
.LBB168_58:
	mov	t4, r7
.LBB168_59:                             // =>This Inner Loop Header: Depth=1
add	t2, -1
	mov	r1, 3
add	t4, 1
	mov	r0, r7
	call	__bit_and
	mov	r1, -4
	mov	t1, rax
	call	__bit_and
	mov	r7, rax
	mov	t3, [r7]
	mov	r1, 3
	mov	r0, t1
	call	__bit_shl
	mov	r0, 255
	mov	t1, rax
	mov	r1, t1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, t1
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[r7], rax
	mov	r7, t4
	jnz	t2, .LBB168_59
	jmp	.LBB168_60
.LBB168_60:                             // %memset.exit
	jz	r4, .LBB168_63
	jmp	.LBB168_61
.LBB168_61:                             // %.preheader30.preheader
	mov	r6, r3
	mov	r7, r4
.LBB168_62:                             // %.preheader30
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 63
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	add	r0, rsp
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	t1, rax
	call	__bit_and
	mov	t2, rax
	mov	t3, [t2]
	mov	r1, 3
	mov	r0, t1
	call	__bit_shl
	mov	r0, 255
	mov	t1, rax
	mov	r1, t1
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t3
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t3, rax
	mov	r0, r7
	call	__bit_and
	mov	r0, rax
	mov	r1, t1
	call	__bit_shl
	mov	r0, t3
	mov	r1, rax
	call	__bit_or
	mov	[t2], rax
add	r7, -1
add	r6, 1
	jnz	r7, .LBB168_62
	jmp	.LBB168_63
.LBB168_63:                             // %.loopexit31
	mov	t4, 2047
	mov	t5, -2147483644
	mov	t6, -2147483645
.LBB168_64:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB168_73 Depth 2
                                        //       Child Loop BB168_75 Depth 3
                                        //       Child Loop BB168_80 Depth 3
                                        //     Child Loop BB168_69 Depth 2
                                        //       Child Loop BB168_70 Depth 3
                                        //     Child Loop BB168_86 Depth 2
add	r2, -1
	mov	r0, r2
	add	r0, r4
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 63
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	add	r0, rsp
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	add	r6, r2
	mov	r1, -2147483648
	mov	r0, r6
	call	__bit_xor
	mov	r2, rax
	mov	r0, r5
	call	__bit_xor
	jg	r2, rax, .LBB168_83
	jmp	.LBB168_65
.LBB168_65:                             // %.preheader27
                                        //   in Loop: Header=BB168_64 Depth=1
	mov	r0, r4
	call	__bit_xor
	jl	rax, t5, .LBB168_67
	jmp	.LBB168_66
.LBB168_66:                             // %.preheader27.split.preheader
                                        //   in Loop: Header=BB168_64 Depth=1
	jmp	.LBB168_73
.LBB168_67:                             // %.preheader27.split.us
                                        //   in Loop: Header=BB168_64 Depth=1
	jz	r4, .LBB168_89
	jmp	.LBB168_68
.LBB168_68:                             // %.loopexit8.i.us.preheader
                                        //   in Loop: Header=BB168_64 Depth=1
.LBB168_69:                             // %.loopexit8.i.us
                                        //   Parent Loop BB168_64 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB168_70 Depth 3
	mov	t2, 0
.LBB168_70:                             //   Parent Loop BB168_64 Depth=1
                                        //     Parent Loop BB168_69 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r2, r3
	mov	r0, r6
	add	r0, t2
	mov	r1, 2
	add	r2, t2
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	r7, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	r7, rax, .LBB168_72
	jmp	.LBB168_71
.LBB168_71:                             // %memcmp.exit.us
                                        //   in Loop: Header=BB168_69 Depth=2
	mov	r0, r6
	add	r0, r4
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 63
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	add	r0, rsp
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	add	r6, rax
	mov	r1, -2147483648
	mov	r0, r6
	call	__bit_xor
	mov	r2, rax
	mov	r0, r5
	call	__bit_xor
	jg	r2, rax, .LBB168_83
	jmp	.LBB168_69
.LBB168_72:                             //   in Loop: Header=BB168_70 Depth=3
add	t2, 1
	je	r4, t2, .LBB168_89
	jmp	.LBB168_70
.LBB168_73:                             // %.preheader27.split
                                        //   Parent Loop BB168_64 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB168_75 Depth 3
                                        //       Child Loop BB168_80 Depth 3
	mov	r0, r6
	mov	r1, r3
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	r2, r4
	mov	r7, r3
	mov	t1, r6
	jnz	rax, .LBB168_79
	jmp	.LBB168_74
.LBB168_74:                             // %.preheader.i20.preheader
                                        //   in Loop: Header=BB168_73 Depth=2
	mov	t2, 0
	mov	r2, r4
.LBB168_75:                             // %.preheader.i20
                                        //   Parent Loop BB168_64 Depth=1
                                        //     Parent Loop BB168_73 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r7, r3
	add	r7, t2
	mov	t1, r6
	add	t1, t2
	mov	r0, [t1]
	mov	r1, [r7]
	jne	r0, r1, .LBB168_78
	jmp	.LBB168_76
.LBB168_76:                             //   in Loop: Header=BB168_75 Depth=3
add	r2, -4
	mov	r1, -2147483648
add	t2, 4
	mov	r0, r2
	call	__bit_xor
	jg	rax, t6, .LBB168_75
	jmp	.LBB168_77
.LBB168_77:                             // %.loopexit8.i.loopexit
                                        //   in Loop: Header=BB168_73 Depth=2
	mov	r7, r3
	add	r7, t2
	add	t2, r6
	mov	t1, t2
	jz	r2, .LBB168_89
	jmp	.LBB168_79
.LBB168_78:                             // %.loopexit7.i18.preheader.loopexit
                                        //   in Loop: Header=BB168_73 Depth=2
.LBB168_79:                             // %.loopexit7.i18.preheader
                                        //   in Loop: Header=BB168_73 Depth=2
.LBB168_80:                             // %.loopexit7.i18
                                        //   Parent Loop BB168_64 Depth=1
                                        //     Parent Loop BB168_73 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r1, 2
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 2
	mov	t2, rax
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	t3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	t2, rax, .LBB168_82
	jmp	.LBB168_81
.LBB168_81:                             //   in Loop: Header=BB168_80 Depth=3
add	r2, -1
add	t1, 1
add	r7, 1
	jz	r2, .LBB168_89
	jmp	.LBB168_80
.LBB168_82:                             // %memcmp.exit
                                        //   in Loop: Header=BB168_73 Depth=2
	mov	r0, r6
	add	r0, r4
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 63
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	add	r0, rsp
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	add	r6, rax
	mov	r1, -2147483648
	mov	r0, r6
	call	__bit_xor
	mov	r2, rax
	mov	r0, r5
	call	__bit_xor
	jle	r2, rax, .LBB168_73
	jmp	.LBB168_83
.LBB168_83:                             // %.loopexit
                                        //   in Loop: Header=BB168_64 Depth=1
	mov	r7, r5
	add	r7, r4
	mov	r1, 2
	mov	r2, r6
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, 0
	jz	rax, .LBB168_89
	jmp	.LBB168_84
.LBB168_84:                             //   in Loop: Header=BB168_64 Depth=1
	mov	t2, r7
add	t2, 2048
	mov	t3, 0
	jmp	.LBB168_86
.LBB168_85:                             // %thread-pre-split
                                        //   in Loop: Header=BB168_86 Depth=2
add	t3, 1
	mov	r6, t3
	add	r6, r7
	mov	r1, 2
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB168_87
	jmp	.LBB168_86
.LBB168_86:                             //   Parent Loop BB168_64 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	je	t3, t4, .LBB168_88
	jmp	.LBB168_85
.LBB168_87:                             // %thread-pre-split.strnlen.exit22_crit_edge
                                        //   in Loop: Header=BB168_64 Depth=1
	mov	t2, r6
.LBB168_88:                             // %strnlen.exit22
                                        //   in Loop: Header=BB168_64 Depth=1
	sub	t2, r7
	add	r5, t2
	mov	r1, -2147483648
	mov	r6, 0
	mov	r0, r5
	call	__bit_xor
	mov	r7, rax
	mov	r0, r2
	call	__bit_xor
	jle	rax, r7, .LBB168_64
	jmp	.LBB168_89
.LBB168_89:                             // %memcmp.exit.thread
	jmp	.LBB168_91
.LBB168_90:
	mov	r0, r2
	mov	r1, r5
	mov	r2, r3
	mov	r3, r4
	call	two_way_long_needle.63
	mov	r6, rax
.LBB168_91:                             // %strchr.exit
	mov	rax, r6
add	rsp, 64
	ret
// -- End function
// -- Begin function strtok
strtok:                                 // @strtok
// %bb.0:
	mov	r4, r1
	mov	r2, r0
	jnz	r2, .LBB169_2
	jmp	.LBB169_1
.LBB169_1:
	mov	r0, mcasm_static_9f931c3a3dfc86b8ff7a00730b2a74ac
	mov	r2, [r0]
	mov	rax, 0
	jz	r2, .LBB169_14
	jmp	.LBB169_2
.LBB169_2:                              // %.preheader7.i.preheader
.LBB169_3:                              // %.preheader7.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB169_4 Depth 2
	mov	r3, r2
	mov	r1, 2
add	r2, 1
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, r4
.LBB169_4:                              //   Parent Loop BB169_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB169_6
	jmp	.LBB169_5
.LBB169_5:                              //   in Loop: Header=BB169_4 Depth=2
add	r6, 1
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
	mov	r0, r5
	call	__bit_and
	je	rax, r7, .LBB169_3
	jmp	.LBB169_4
.LBB169_6:                              // %.loopexit.i
	mov	r0, r5
	call	__bit_and
	mov	r0, rax
	mov	t2, 0
	mov	rax, 0
	jz	r0, .LBB169_13
	jmp	.LBB169_7
.LBB169_7:                              // %.preheader.i.preheader
.LBB169_8:                              // %.preheader.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB169_9 Depth 2
	mov	r5, r2
	mov	r1, 2
add	r2, 1
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, r4
.LBB169_9:                              //   Parent Loop BB169_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, r6
	call	__bit_and
	jne	t1, rax, .LBB169_12
	jmp	.LBB169_10
.LBB169_10:
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	rax, r3
	jz	r0, .LBB169_13
	jmp	.LBB169_11
.LBB169_11:
	mov	r1, 3
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, [r5]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r6, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r5], rax
	mov	t2, r2
	mov	rax, r3
	jmp	.LBB169_13
.LBB169_12:                             //   in Loop: Header=BB169_9 Depth=2
add	r7, 1
	mov	r0, t1
	call	__bit_and
	jz	rax, .LBB169_8
	jmp	.LBB169_9
.LBB169_13:                             // %__strtok_r.exit.sink.split
	mov	r0, mcasm_static_9f931c3a3dfc86b8ff7a00730b2a74ac
	mov	[r0], t2
.LBB169_14:                             // %__strtok_r.exit
	ret
// -- End function
// -- Begin function __strtok_r
__strtok_r:                             // @__strtok_r
// %bb.0:
	mov	r4, r1
	mov	t1, r0
	jnz	t1, .LBB170_2
	jmp	.LBB170_1
.LBB170_1:
	mov	t1, [r2]
	mov	rax, 0
	jz	t1, .LBB170_20
	jmp	.LBB170_2
.LBB170_2:
	jz	r3, .LBB170_4
	jmp	.LBB170_3
.LBB170_3:                              // %.preheader7.preheader
	mov	t2, t1
	jmp	.LBB170_7
.LBB170_4:
	mov	t2, t1
	mov	r1, 2
add	t2, 1
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, r4
.LBB170_5:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB170_11
	jmp	.LBB170_6
.LBB170_6:                              //   in Loop: Header=BB170_5 Depth=1
add	r6, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	mov	r0, r5
	call	__bit_and
	je	rax, r3, .LBB170_10
	jmp	.LBB170_5
.LBB170_7:                              // %.preheader7
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB170_8 Depth 2
	mov	t1, t2
	mov	r1, 2
add	t2, 1
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	mov	r6, r4
.LBB170_8:                              //   Parent Loop BB170_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB170_11
	jmp	.LBB170_9
.LBB170_9:                              //   in Loop: Header=BB170_8 Depth=2
add	r6, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	mov	r0, r5
	call	__bit_and
	je	rax, r3, .LBB170_7
	jmp	.LBB170_8
.LBB170_10:
	mov	r1, 3
	mov	[r2], t2
	mov	r0, t1
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r3, rax
	mov	r4, [r3]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r0, 255
	mov	r2, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r4
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r4, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	rax, t1
	jmp	.LBB170_20
.LBB170_11:                             // %.loopexit
	mov	r0, r5
	call	__bit_and
	jz	rax, .LBB170_13
	jmp	.LBB170_12
.LBB170_12:                             // %.preheader.preheader
	jmp	.LBB170_14
.LBB170_13:
	mov	[r2], 0
	mov	rax, 0
	jmp	.LBB170_20
.LBB170_14:                             // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB170_15 Depth 2
	mov	r5, t2
	mov	r1, 2
add	t2, 1
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, r4
.LBB170_15:                             //   Parent Loop BB170_14 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	mov	r0, r6
	call	__bit_and
	jne	r3, rax, .LBB170_19
	jmp	.LBB170_16
.LBB170_16:
	mov	r0, r6
	call	__bit_and
	mov	r0, 0
	jz	rax, .LBB170_18
	jmp	.LBB170_17
.LBB170_17:
	mov	r1, 3
	mov	r0, r5
	call	__bit_and
	mov	r1, -4
	mov	r3, rax
	call	__bit_and
	mov	r4, rax
	mov	r5, [r4]
	mov	r1, 3
	mov	r0, r3
	call	__bit_shl
	mov	r0, 255
	mov	r3, rax
	mov	r1, r3
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r3
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r4], rax
	mov	r0, t2
.LBB170_18:
	mov	[r2], r0
	mov	rax, t1
	jmp	.LBB170_20
.LBB170_19:                             //   in Loop: Header=BB170_15 Depth=2
add	r7, 1
	mov	r0, r3
	call	__bit_and
	jz	rax, .LBB170_14
	jmp	.LBB170_15
.LBB170_20:
	ret
// -- End function
// -- Begin function strtok_r
strtok_r:                               // @strtok_r
// %bb.0:
	mov	r5, r1
	mov	r3, r0
	jnz	r3, .LBB171_2
	jmp	.LBB171_1
.LBB171_1:
	mov	r3, [r2]
	mov	rax, 0
	jz	r3, .LBB171_14
	jmp	.LBB171_2
.LBB171_2:                              // %.preheader31
.LBB171_3:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB171_4 Depth 2
	mov	r4, r3
	mov	r1, 2
add	r3, 1
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, r5
.LBB171_4:                              //   Parent Loop BB171_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB171_6
	jmp	.LBB171_5
.LBB171_5:                              //   in Loop: Header=BB171_4 Depth=2
add	r7, 1
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, r6
	call	__bit_and
	je	rax, t1, .LBB171_3
	jmp	.LBB171_4
.LBB171_6:
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	t3, 0
	mov	rax, 0
	jz	r0, .LBB171_13
	jmp	.LBB171_7
.LBB171_7:                              // %.preheader.preheader
.LBB171_8:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB171_9 Depth 2
	mov	r6, r3
	mov	r1, 2
add	r3, 1
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
	mov	t1, r5
.LBB171_9:                              //   Parent Loop BB171_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 2
	mov	r0, t1
	call	__bit_shr
	mov	r1, 3
	mov	t2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t2, rax
	mov	r0, r7
	call	__bit_and
	jne	t2, rax, .LBB171_12
	jmp	.LBB171_10
.LBB171_10:
	mov	r0, r7
	call	__bit_and
	mov	r0, rax
	mov	rax, r4
	jz	r0, .LBB171_13
	jmp	.LBB171_11
.LBB171_11:
	mov	r1, 3
	mov	r0, r6
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r6, rax
	mov	r7, [r6]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r7
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r7, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r7
	mov	r1, rax
	call	__bit_or
	mov	[r6], rax
	mov	t3, r3
	mov	rax, r4
	jmp	.LBB171_13
.LBB171_12:                             //   in Loop: Header=BB171_9 Depth=2
add	t1, 1
	mov	r0, t2
	call	__bit_and
	jz	rax, .LBB171_8
	jmp	.LBB171_9
.LBB171_13:
	mov	[r2], t3
.LBB171_14:
	ret
// -- End function
// -- Begin function mbrtoc16
mbrtoc16:                               // @mbrtoc16
// %bb.0:
	mov	r4, r1
	mov	r5, 0
                                        // implicit-def: $r3
	jz	r4, .LBB172_5
	jmp	.LBB172_1
.LBB172_1:
	mov	r5, -2
	jz	r2, .LBB172_7
	jmp	.LBB172_2
.LBB172_2:
	mov	r6, r0
	mov	r1, 2
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r0, rax
	call	__bit_sar
	mov	r5, -1
	jg	rax, r5, .LBB172_4
	jmp	.LBB172_3
.LBB172_3:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 84
	jmp	.LBB172_7
.LBB172_4:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	mov	r0, r3
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r5, rax
	mov	r0, r6
.LBB172_5:                              // %mbrtowc.exit
	jz	r0, .LBB172_7
	jmp	.LBB172_6
.LBB172_6:
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r2, rax
	call	__bit_and
	mov	r4, rax
	mov	r6, [r4]
	mov	r1, 3
	mov	r0, r2
	call	__bit_shl
	mov	r1, 65535
	mov	r2, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, 65535
	mov	r3, rax
	mov	r1, r2
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 65535
	mov	r6, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r2
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r4], rax
.LBB172_7:                              // %mbrtowc.exit.thread
	mov	rax, r5
	ret
// -- End function
// -- Begin function c16rtomb
c16rtomb:                               // @c16rtomb
// %bb.0:
	mov	r3, r1
	mov	r4, r0
	mov	r2, 1
	jz	r4, .LBB173_4
	jmp	.LBB173_1
.LBB173_1:
	mov	r1, -2147483648
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483520
	jl	rax, r0, .LBB173_3
	jmp	.LBB173_2
.LBB173_2:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 84
	mov	r2, -1
	jmp	.LBB173_4
.LBB173_3:
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r4, rax
	mov	r6, [r4]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r1, 255
	mov	r5, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, 255
	mov	r3, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r6, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r4], rax
.LBB173_4:                              // %wcrtomb.exit
	mov	rax, r2
	ret
// -- End function
// -- Begin function mbrtoc32
mbrtoc32:                               // @mbrtoc32
// %bb.0:
	mov	r3, r1
	mov	rax, 0
                                        // implicit-def: $r4
	jz	r3, .LBB174_5
	jmp	.LBB174_1
.LBB174_1:
	mov	rax, -2
	jz	r2, .LBB174_7
	jmp	.LBB174_2
.LBB174_2:
	mov	r5, r0
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r0, rax
	call	__bit_sar
	mov	r0, rax
	mov	rax, -1
	jg	r0, rax, .LBB174_4
	jmp	.LBB174_3
.LBB174_3:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 84
	jmp	.LBB174_7
.LBB174_4:
	mov	r1, 255
	call	__bit_and
	mov	r4, rax
	mov	r0, r4
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, r5
.LBB174_5:                              // %mbrtowc.exit
	jz	r0, .LBB174_7
	jmp	.LBB174_6
.LBB174_6:
	mov	[r0], r4
.LBB174_7:                              // %mbrtowc.exit.thread
	ret
// -- End function
// -- Begin function c32rtomb
c32rtomb:                               // @c32rtomb
// %bb.0:
	mov	r3, r1
	mov	r4, r0
	mov	r2, 1
	jz	r4, .LBB175_4
	jmp	.LBB175_1
.LBB175_1:
	mov	r1, -2147483648
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483520
	jl	rax, r0, .LBB175_3
	jmp	.LBB175_2
.LBB175_2:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 84
	mov	r2, -1
	jmp	.LBB175_4
.LBB175_3:
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r4, rax
	mov	r6, [r4]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r6, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r4], rax
.LBB175_4:                              // %wcrtomb.exit
	mov	rax, r2
	ret
// -- End function
// -- Begin function btowc
btowc:                                  // @btowc
// %bb.0:
	mov	r1, -2147483648
	mov	r2, -1
	call	__bit_xor
	mov	r1, -2147483521
	jg	rax, r1, .LBB176_2
	jmp	.LBB176_1
.LBB176_1:
	mov	r2, r0
.LBB176_2:
	mov	rax, r2
	ret
// -- End function
// -- Begin function wctob
wctob:                                  // @wctob
// %bb.0:
	mov	r1, -2147483648
	mov	r2, -1
	call	__bit_xor
	mov	r1, -2147483521
	jg	rax, r1, .LBB177_2
	jmp	.LBB177_1
.LBB177_1:
	mov	r2, r0
.LBB177_2:
	mov	rax, r2
	ret
// -- End function
// -- Begin function mbsinit
mbsinit:                                // @mbsinit
// %bb.0:
	mov	rax, 1
	jz	r0, .LBB178_2
	jmp	.LBB178_1
.LBB178_1:
	mov	r0, [r0]
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_and
.LBB178_2:
	ret
// -- End function
// -- Begin function mbrtowc
mbrtowc:                                // @mbrtowc
// %bb.0:
	mov	r3, r1
	mov	rax, 0
	jz	r3, .LBB179_7
	jmp	.LBB179_1
.LBB179_1:
	mov	rax, -2
	jz	r2, .LBB179_7
	jmp	.LBB179_2
.LBB179_2:
	mov	r4, r0
	mov	r1, 2
	mov	r0, r3
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	mov	r0, r2
	call	__bit_and
	mov	r1, 128
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
add	r0, -128
	mov	rax, -1
	jg	r0, rax, .LBB179_4
	jmp	.LBB179_3
.LBB179_3:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 84
	jmp	.LBB179_7
.LBB179_4:
	jz	r4, .LBB179_6
	jmp	.LBB179_5
.LBB179_5:
	mov	[r4], r2
.LBB179_6:
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
.LBB179_7:
	ret
// -- End function
// -- Begin function mbrlen
mbrlen:                                 // @mbrlen
// %bb.0:
	mov	rax, 0
	jz	r0, .LBB180_5
	jmp	.LBB180_1
.LBB180_1:
	mov	rax, -2
	jz	r1, .LBB180_5
	jmp	.LBB180_2
.LBB180_2:
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r0, rax
	call	__bit_sar
	mov	r0, rax
	mov	rax, -1
	jg	r0, rax, .LBB180_4
	jmp	.LBB180_3
.LBB180_3:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 84
	jmp	.LBB180_5
.LBB180_4:
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
.LBB180_5:
	ret
// -- End function
// -- Begin function wcrtomb
wcrtomb:                                // @wcrtomb
// %bb.0:
	mov	r3, r1
	mov	r4, r0
	mov	r2, 1
	jz	r4, .LBB181_4
	jmp	.LBB181_1
.LBB181_1:
	mov	r1, -2147483648
	mov	r0, r3
	call	__bit_xor
	mov	r0, -2147483520
	jl	rax, r0, .LBB181_3
	jmp	.LBB181_2
.LBB181_2:
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 84
	mov	r2, -1
	jmp	.LBB181_4
.LBB181_3:
	mov	r1, 3
	mov	r0, r4
	call	__bit_and
	mov	r1, -4
	mov	r5, rax
	call	__bit_and
	mov	r4, rax
	mov	r6, [r4]
	mov	r1, 3
	mov	r0, r5
	call	__bit_shl
	mov	r0, 255
	mov	r5, rax
	mov	r1, r5
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r6
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	r6, rax
	mov	r0, r3
	call	__bit_and
	mov	r0, rax
	mov	r1, r5
	call	__bit_shl
	mov	r0, r6
	mov	r1, rax
	call	__bit_or
	mov	[r4], rax
.LBB181_4:
	mov	rax, r2
	ret
// -- End function
// -- Begin function mbstowcs
mbstowcs:                               // @mbstowcs
// %bb.0:
	mov	r3, r2
	mov	r4, r1
	mov	r2, r0
	jz	r2, .LBB182_2
	jmp	.LBB182_1
.LBB182_1:                              // %.preheader9.preheader
	mov	r5, 0
	mov	t1, -1
	mov	t2, r2
	jmp	.LBB182_6
.LBB182_2:
	mov	r1, 2
	mov	r0, r4
	call	__bit_shr
	mov	r1, 3
	mov	r5, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r5]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, 0
	jz	rax, .LBB182_15
	jmp	.LBB182_3
.LBB182_3:                              // %.preheader.preheader
add	r4, 1
	mov	r7, 0
	mov	r5, 0
.LBB182_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 128
	mov	r0, rax
	call	__bit_xor
add	rax, -128
	jl	rax, r7, .LBB182_8
	jmp	.LBB182_5
.LBB182_5:                              //   in Loop: Header=BB182_4 Depth=1
	mov	r0, r4
	add	r0, r5
	mov	r1, 2
add	r5, 1
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB182_12
	jmp	.LBB182_4
.LBB182_6:                              // %.preheader9
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, r4
	add	r0, r5
	mov	r1, 2
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r0, rax
	call	__bit_sar
	mov	r0, rax
	jz	r0, .LBB182_12
	jmp	.LBB182_7
.LBB182_7:                              //   in Loop: Header=BB182_6 Depth=1
	mov	r1, 255
	call	__bit_and
	mov	r6, rax
	call	__bit_and
	mov	r1, 128
	mov	r0, rax
	call	__bit_xor
add	rax, -128
	jg	rax, t1, .LBB182_9
	jmp	.LBB182_8
.LBB182_8:                              // %.loopexit
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 84
	mov	r0, -1
	jmp	.LBB182_15
.LBB182_9:                              //   in Loop: Header=BB182_6 Depth=1
	mov	r1, -2147483648
	mov	r0, r3
	call	__bit_xor
	mov	r7, rax
	mov	r0, r5
	call	__bit_xor
	jge	rax, r7, .LBB182_11
	jmp	.LBB182_10
.LBB182_10:                             //   in Loop: Header=BB182_6 Depth=1
	mov	[t2], r6
.LBB182_11:                             //   in Loop: Header=BB182_6 Depth=1
add	r5, 1
add	t2, 4
	mov	r0, r3
	je	r3, r5, .LBB182_15
	jmp	.LBB182_6
.LBB182_12:                             // %.loopexit8
	mov	r0, r5
	jz	r2, .LBB182_15
	jmp	.LBB182_13
.LBB182_13:                             // %.loopexit8
	mov	r1, -2147483648
	mov	r0, r3
	call	__bit_xor
	mov	r3, rax
	mov	r0, r5
	call	__bit_xor
	jge	rax, r3, .LBB182_15
	jmp	.LBB182_14
.LBB182_14:
	mov	r1, 2
	mov	r0, r5
	call	__bit_shl
	add	r2, rax
	mov	[r2], 0
.LBB182_15:                             // %.loopexit12
	mov	rax, r0
	ret
// -- End function
// -- Begin function wcstombs
wcstombs:                               // @wcstombs
// %bb.0:
	mov	r4, r2
	mov	r5, r1
	mov	r3, r0
	jz	r3, .LBB183_2
	jmp	.LBB183_1
.LBB183_1:                              // %.preheader9.preheader
	mov	r2, 0
	mov	t3, -2147483520
	jmp	.LBB183_6
.LBB183_2:
	mov	r0, [r5]
	mov	rax, 0
	jz	r0, .LBB183_15
	jmp	.LBB183_3
.LBB183_3:                              // %.preheader.preheader
add	r5, 4
	mov	r2, 0
	mov	r6, -2147483521
	mov	r1, -2147483648
.LBB183_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	call	__bit_xor
	jg	rax, r6, .LBB183_8
	jmp	.LBB183_5
.LBB183_5:                              //   in Loop: Header=BB183_4 Depth=1
	mov	r0, [r5]
add	r2, 1
add	r5, 4
	jz	r0, .LBB183_12
	jmp	.LBB183_4
.LBB183_6:                              // %.preheader9
                                        // =>This Inner Loop Header: Depth=1
	mov	r6, [r5]
	jz	r6, .LBB183_12
	jmp	.LBB183_7
.LBB183_7:                              //   in Loop: Header=BB183_6 Depth=1
	mov	r1, -2147483648
	mov	r0, r6
	call	__bit_xor
	jl	rax, t3, .LBB183_9
	jmp	.LBB183_8
.LBB183_8:                              // %.loopexit
	mov	r0, mcasm_static_1273b9e1b68180723daab84a177b2d85
	mov	[r0], 84
	mov	rax, -1
	jmp	.LBB183_15
.LBB183_9:                              //   in Loop: Header=BB183_6 Depth=1
	mov	r0, r4
	call	__bit_xor
	mov	r7, rax
	mov	r0, r2
	call	__bit_xor
	jge	rax, r7, .LBB183_11
	jmp	.LBB183_10
.LBB183_10:                             //   in Loop: Header=BB183_6 Depth=1
	mov	r0, r3
	add	r0, r2
	mov	r1, 3
	call	__bit_and
	mov	r1, -4
	mov	r7, rax
	call	__bit_and
	mov	t1, rax
	mov	t2, [t1]
	mov	r1, 3
	mov	r0, r7
	call	__bit_shl
	mov	r0, 255
	mov	r7, rax
	mov	r1, r7
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, t2
	mov	r1, rax
	call	__bit_and
	mov	r1, 255
	mov	t2, rax
	mov	r0, r6
	call	__bit_and
	mov	r0, rax
	mov	r1, r7
	call	__bit_shl
	mov	r0, t2
	mov	r1, rax
	call	__bit_or
	mov	[t1], rax
.LBB183_11:                             //   in Loop: Header=BB183_6 Depth=1
add	r2, 1
add	r5, 4
	mov	rax, r4
	je	r4, r2, .LBB183_15
	jmp	.LBB183_6
.LBB183_12:                             // %.loopexit8
	mov	rax, r2
	jz	r3, .LBB183_15
	jmp	.LBB183_13
.LBB183_13:                             // %.loopexit8
	mov	r1, -2147483648
	mov	r0, r4
	call	__bit_xor
	mov	r4, rax
	mov	r0, r2
	call	__bit_xor
	mov	r0, rax
	mov	rax, r2
	jge	r0, r4, .LBB183_15
	jmp	.LBB183_14
.LBB183_14:
	add	r3, r2
	mov	r1, 3
	mov	r0, r3
	call	__bit_and
	mov	r1, -4
	mov	r4, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, [r3]
	mov	r1, 3
	mov	r0, r4
	call	__bit_shl
	mov	r0, 255
	mov	r4, rax
	mov	r1, r4
	call	__bit_shl
	mov	r1, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r5
	mov	r1, rax
	call	__bit_and
	mov	r0, 0
	mov	r5, rax
	mov	r1, r4
	call	__bit_shl
	mov	r0, r5
	mov	r1, rax
	call	__bit_or
	mov	[r3], rax
	mov	rax, r2
.LBB183_15:                             // %.loopexit12
	ret
// -- End function
// -- Begin function wcslen
wcslen:                                 // @wcslen
// %bb.0:
	mov	rax, -1
.LBB184_1:                              // =>This Inner Loop Header: Depth=1
	mov	r1, [r0]
add	rax, 1
add	r0, 4
	jnz	r1, .LBB184_1
	jmp	.LBB184_2
.LBB184_2:
	ret
// -- End function
// -- Begin function wcscpy
wcscpy:                                 // @wcscpy
// %bb.0:
	mov	rax, r0
	mov	r0, 0
.LBB185_1:                              // =>This Inner Loop Header: Depth=1
	mov	r2, r1
	add	r2, r0
	mov	r2, [r2]
	mov	r3, rax
	add	r3, r0
	mov	[r3], r2
add	r0, 4
	jnz	r2, .LBB185_1
	jmp	.LBB185_2
.LBB185_2:
	ret
// -- End function
// -- Begin function wcsncpy
wcsncpy:                                // @wcsncpy
// %bb.0:
	mov	r3, r0
	mov	r4, 0
	jz	r2, .LBB186_4
	jmp	.LBB186_1
.LBB186_1:                              // %.preheader3.preheader
	mov	r0, r3
.LBB186_2:                              // %.preheader3
                                        // =>This Inner Loop Header: Depth=1
	mov	r5, [r1]
	jz	r5, .LBB186_4
	jmp	.LBB186_3
.LBB186_3:                              //   in Loop: Header=BB186_2 Depth=1
	mov	[r0], r5
add	r4, 1
add	r0, 4
add	r1, 4
	je	r2, r4, .LBB186_7
	jmp	.LBB186_2
.LBB186_4:                              // %.loopexit4
	mov	r1, -2147483648
	mov	r0, r4
	call	__bit_xor
	mov	r5, rax
	mov	r0, r2
	call	__bit_xor
	jle	rax, r5, .LBB186_7
	jmp	.LBB186_5
.LBB186_5:                              // %.preheader.preheader
	mov	r1, 2
	sub	r2, r4
	mov	r0, r4
	call	__bit_shl
	add	rax, r3
.LBB186_6:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	[rax], 0
add	r2, -1
add	rax, 4
	jnz	r2, .LBB186_6
	jmp	.LBB186_7
.LBB186_7:                              // %.loopexit
	mov	rax, r3
	ret
// -- End function
// -- Begin function wcscat
wcscat:                                 // @wcscat
// %bb.0:
	mov	rax, r0
	mov	r0, 0
.LBB187_1:                              // =>This Inner Loop Header: Depth=1
	mov	r2, rax
	add	r2, r0
	mov	r2, [r2]
add	r0, 4
	jnz	r2, .LBB187_1
	jmp	.LBB187_2
.LBB187_2:
add	r0, -4
.LBB187_3:                              // =>This Inner Loop Header: Depth=1
	mov	r2, [r1]
	mov	r3, rax
	add	r3, r0
add	r1, 4
	mov	[r3], r2
add	r0, 4
	jnz	r2, .LBB187_3
	jmp	.LBB187_4
.LBB187_4:
	ret
// -- End function
// -- Begin function wcsncat
wcsncat:                                // @wcsncat
// %bb.0:
	mov	r3, r0
	mov	r4, r3
add	r4, -4
.LBB188_1:                              // =>This Inner Loop Header: Depth=1
add	r4, 4
	mov	r0, [r4]
	jnz	r0, .LBB188_1
	jmp	.LBB188_2
.LBB188_2:
	mov	r0, 0
	jz	r2, .LBB188_6
	jmp	.LBB188_3
.LBB188_3:                              // %.preheader.preheader
	mov	r5, 0
	mov	r6, r4
.LBB188_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r7, [r1]
	mov	r0, r5
	jz	r7, .LBB188_6
	jmp	.LBB188_5
.LBB188_5:                              //   in Loop: Header=BB188_4 Depth=1
	mov	[r6], r7
add	r5, 1
add	r6, 4
add	r1, 4
	mov	r0, r2
	jne	r2, r5, .LBB188_4
	jmp	.LBB188_6
.LBB188_6:                              // %.loopexit
	mov	r1, 2
	call	__bit_shl
	add	r4, rax
	mov	[r4], 0
	mov	rax, r3
	ret
// -- End function
// -- Begin function wcscmp
wcscmp:                                 // @wcscmp
// %bb.0:
	mov	r3, [r0]
	mov	r2, 0
	jz	r3, .LBB189_4
	jmp	.LBB189_1
.LBB189_1:                              // %.preheader.preheader
add	r0, 4
.LBB189_2:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r4, [r1]
	mov	r2, r3
	jne	r3, r4, .LBB189_4
	jmp	.LBB189_3
.LBB189_3:                              //   in Loop: Header=BB189_2 Depth=1
	mov	r3, [r0]
add	r1, 4
add	r0, 4
	mov	r2, 0
	jnz	r3, .LBB189_2
	jmp	.LBB189_4
.LBB189_4:                              // %.loopexit
	mov	r0, [r1]
	mov	r1, -2147483648
	call	__bit_xor
	mov	r3, rax
	mov	r0, r2
	call	__bit_xor
	mov	r2, rax
	mov	r0, r2
	sub	r0, r3
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	sub	r3, r2
	mov	r1, 31
	mov	r2, rax
	mov	r0, r3
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	mov	r0, r3
	call	__bit_not
add	r2, 1
	mov	r0, r2
	mov	r1, rax
	call	__bit_and
	add	rax, r3
	ret
// -- End function
// -- Begin function wcsncmp
wcsncmp:                                // @wcsncmp
// %bb.0:
	mov	rax, 0
	jz	r2, .LBB190_6
	jmp	.LBB190_1
.LBB190_1:                              // %.preheader.preheader
	jmp	.LBB190_3
.LBB190_2:                              //   in Loop: Header=BB190_3 Depth=1
add	r2, -1
add	r1, 4
add	r0, 4
	jz	r2, .LBB190_6
	jmp	.LBB190_3
.LBB190_3:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r3, [r0]
	mov	r4, [r1]
	jz	r3, .LBB190_5
	jmp	.LBB190_4
.LBB190_4:                              // %.preheader
                                        //   in Loop: Header=BB190_3 Depth=1
	je	r3, r4, .LBB190_2
	jmp	.LBB190_5
.LBB190_5:
	mov	r1, -2147483648
	mov	r0, r4
	call	__bit_xor
	mov	r2, rax
	mov	r0, r3
	call	__bit_xor
	mov	r3, rax
	mov	r0, r3
	sub	r0, r2
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	sub	r2, r3
	mov	r1, 31
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	r2, rax
	mov	r0, r2
	call	__bit_not
add	r3, 1
	mov	r0, r3
	mov	r1, rax
	call	__bit_and
	add	rax, r2
.LBB190_6:                              // %.loopexit
	ret
// -- End function
// -- Begin function wcschr
wcschr:                                 // @wcschr
// %bb.0:
.LBB191_1:                              // =>This Inner Loop Header: Depth=1
	mov	r2, [r0]
	mov	rax, r0
	je	r2, r1, .LBB191_3
	jmp	.LBB191_2
.LBB191_2:                              //   in Loop: Header=BB191_1 Depth=1
add	r0, 4
	mov	rax, 0
	jnz	r2, .LBB191_1
	jmp	.LBB191_3
.LBB191_3:
	ret
// -- End function
// -- Begin function wcsrchr
wcsrchr:                                // @wcsrchr
// %bb.0:
	mov	r2, r1
	mov	r3, r0
	mov	rax, 0
.LBB192_1:                              // =>This Inner Loop Header: Depth=1
	mov	r4, [r3]
	mov	r5, rax
	mov	r0, r4
	mov	r1, r2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, r3
	sub	r1, r5
	mov	r0, rax
	call	__bit_and
	add	rax, r5
add	r3, 4
	jnz	r4, .LBB192_1
	jmp	.LBB192_2
.LBB192_2:
	ret
// -- End function
// -- Begin function wcsspn
wcsspn:                                 // @wcsspn
// %bb.0:
	mov	r2, r0
	mov	r4, [r2]
	mov	r3, r1
	mov	r0, 0
	jz	r4, .LBB193_6
	jmp	.LBB193_1
.LBB193_1:                              // %.preheader.preheader
.LBB193_2:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB193_3 Depth 2
	mov	r1, r3
.LBB193_3:                              //   Parent Loop BB193_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r5, [r1]
	je	r5, r4, .LBB193_5
	jmp	.LBB193_4
.LBB193_4:                              //   in Loop: Header=BB193_3 Depth=2
add	r1, 4
	jz	r5, .LBB193_6
	jmp	.LBB193_3
.LBB193_5:                              //   in Loop: Header=BB193_2 Depth=1
add	r0, 1
	mov	r1, 2
	call	__bit_shl
	add	rax, r2
	mov	r4, [rax]
	jnz	r4, .LBB193_2
	jmp	.LBB193_6
.LBB193_6:                              // %.loopexit
	mov	rax, r0
	ret
// -- End function
// -- Begin function wcscspn
wcscspn:                                // @wcscspn
// %bb.0:
	mov	r2, r0
	mov	r4, [r2]
	mov	r3, r1
	mov	r0, 0
	jz	r4, .LBB194_6
	jmp	.LBB194_1
.LBB194_1:                              // %.preheader.preheader
.LBB194_2:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB194_3 Depth 2
	mov	r1, r3
.LBB194_3:                              //   Parent Loop BB194_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r5, [r1]
	je	r5, r4, .LBB194_6
	jmp	.LBB194_4
.LBB194_4:                              //   in Loop: Header=BB194_3 Depth=2
add	r1, 4
	jnz	r5, .LBB194_3
	jmp	.LBB194_5
.LBB194_5:                              //   in Loop: Header=BB194_2 Depth=1
add	r0, 1
	mov	r1, 2
	call	__bit_shl
	add	rax, r2
	mov	r4, [rax]
	jnz	r4, .LBB194_2
	jmp	.LBB194_6
.LBB194_6:                              // %.loopexit
	mov	rax, r0
	ret
// -- End function
// -- Begin function wcspbrk
wcspbrk:                                // @wcspbrk
// %bb.0:
	mov	r2, [r0]
	mov	rax, 0
	jz	r2, .LBB195_6
	jmp	.LBB195_1
.LBB195_1:                              // %.preheader.preheader
.LBB195_2:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB195_3 Depth 2
	mov	rax, r0
	mov	r0, r1
.LBB195_3:                              //   Parent Loop BB195_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r3, [r0]
	je	r3, r2, .LBB195_6
	jmp	.LBB195_4
.LBB195_4:                              //   in Loop: Header=BB195_3 Depth=2
add	r0, 4
	jnz	r3, .LBB195_3
	jmp	.LBB195_5
.LBB195_5:                              //   in Loop: Header=BB195_2 Depth=1
add	rax, 4
	mov	r2, [rax]
	mov	r0, rax
	mov	rax, 0
	jnz	r2, .LBB195_2
	jmp	.LBB195_6
.LBB195_6:                              // %.loopexit
	ret
// -- End function
// -- Begin function wcsstr
wcsstr:                                 // @wcsstr
// %bb.0:
	mov	r2, -1
	mov	r3, r1
.LBB196_1:                              // =>This Inner Loop Header: Depth=1
	mov	r4, [r3]
add	r2, 1
add	r3, 4
	jnz	r4, .LBB196_1
	jmp	.LBB196_2
.LBB196_2:
	mov	rax, r0
	jz	r2, .LBB196_11
	jmp	.LBB196_3
.LBB196_3:
	mov	r3, [r0]
	mov	rax, 0
	jz	r3, .LBB196_11
	jmp	.LBB196_4
.LBB196_4:                              // %.preheader.preheader
.LBB196_5:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB196_7 Depth 2
	mov	rax, r0
	mov	r0, 0
	mov	r3, r2
	jmp	.LBB196_7
.LBB196_6:                              //   in Loop: Header=BB196_7 Depth=2
add	r3, -1
add	r0, 4
	jz	r3, .LBB196_11
	jmp	.LBB196_7
.LBB196_7:                              //   Parent Loop BB196_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r4, rax
	add	r4, r0
	mov	r4, [r4]
	mov	r5, r1
	add	r5, r0
	mov	r5, [r5]
	jz	r4, .LBB196_9
	jmp	.LBB196_8
.LBB196_8:                              //   in Loop: Header=BB196_7 Depth=2
	je	r4, r5, .LBB196_6
	jmp	.LBB196_9
.LBB196_9:                              //   in Loop: Header=BB196_5 Depth=1
	je	r4, r5, .LBB196_11
	jmp	.LBB196_10
.LBB196_10:                             //   in Loop: Header=BB196_5 Depth=1
add	rax, 4
	mov	r3, [rax]
	mov	r0, rax
	mov	rax, 0
	jnz	r3, .LBB196_5
	jmp	.LBB196_11
.LBB196_11:                             // %.loopexit
	ret
// -- End function
// -- Begin function iswalnum
iswalnum:                               // @iswalnum
// %bb.0:
	mov	r2, r0
	mov	r1, -2147483648
	mov	r3, 0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB197_2
	jmp	.LBB197_1
.LBB197_1:
	mov	r1, 95
	mov	r0, r2
	call	__bit_and
add	rax, -91
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
add	r2, -58
	mov	r1, 31
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_or
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
.LBB197_2:
	mov	rax, r3
	ret
// -- End function
// -- Begin function iswalpha
iswalpha:                               // @iswalpha
// %bb.0:
	mov	r2, r0
add	r0, -128
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -33
	mov	r3, rax
	mov	r0, r2
	call	__bit_and
add	rax, -91
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, r3
	mov	r1, rax
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function iswblank
iswblank:                               // @iswblank
// %bb.0:
	mov	r1, 32
	mov	r2, r0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r1, 9
	mov	r3, rax
	mov	r0, r2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function iswcntrl
iswcntrl:                               // @iswcntrl
// %bb.0:
	mov	r2, r0
add	r0, -128
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, r2
add	r0, -32
	mov	r1, 31
	mov	r3, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 127
	mov	r4, rax
	mov	r0, r2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r4
	mov	r1, rax
	call	__bit_or
	mov	r0, r3
	mov	r1, rax
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function iswdigit
iswdigit:                               // @iswdigit
// %bb.0:
add	r0, -58
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function iswgraph
iswgraph:                               // @iswgraph
// %bb.0:
add	r0, -127
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function iswlower
iswlower:                               // @iswlower
// %bb.0:
add	r0, -123
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function iswprint
iswprint:                               // @iswprint
// %bb.0:
add	r0, -127
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function iswpunct
iswpunct:                               // @iswpunct
// %bb.0:
	mov	r2, r0
add	r0, -127
	mov	r1, -2147483648
	mov	r3, 0
	call	__bit_xor
	mov	r0, 2147483554
	jl	rax, r0, .LBB205_2
	jmp	.LBB205_1
.LBB205_1:
	mov	r1, 95
	mov	r0, r2
	call	__bit_and
add	rax, -65
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
add	r2, -48
	mov	r1, 31
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
.LBB205_2:                              // %ispunct.exit
	mov	rax, r3
	ret
// -- End function
// -- Begin function iswspace
iswspace:                               // @iswspace
// %bb.0:
	mov	r2, r0
	mov	r1, -2147483648
	mov	r3, 0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB206_5
	jmp	.LBB206_1
.LBB206_1:
	mov	r0, r2
add	r0, -9
	mov	r3, 1
	call	__bit_xor
	mov	r4, -2147483646
	jl	rax, r4, .LBB206_5
	jmp	.LBB206_2
.LBB206_2:
	mov	r0, r2
add	r0, -12
	call	__bit_xor
	jl	rax, r4, .LBB206_5
	jmp	.LBB206_3
.LBB206_3:
	mov	r0, 32
	je	r2, r0, .LBB206_5
	jmp	.LBB206_4
.LBB206_4:
	mov	r1, 11
	mov	r0, r2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
.LBB206_5:                              // %isspace.exit
	mov	rax, r3
	ret
// -- End function
// -- Begin function iswupper
iswupper:                               // @iswupper
// %bb.0:
add	r0, -91
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_and
	ret
// -- End function
// -- Begin function iswxdigit
iswxdigit:                              // @iswxdigit
// %bb.0:
	mov	r2, r0
	mov	r1, -2147483648
	mov	r3, 0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB208_2
	jmp	.LBB208_1
.LBB208_1:
	mov	r0, r2
add	r0, -58
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 95
	mov	r3, rax
	mov	r0, r2
	call	__bit_and
add	rax, -71
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
.LBB208_2:
	mov	rax, r3
	ret
// -- End function
// -- Begin function towlower
towlower:                               // @towlower
// %bb.0:
	mov	r2, r0
add	r0, -91
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483622
	jl	rax, r0, .LBB209_2
	jmp	.LBB209_1
.LBB209_1:
add	r2, 32
.LBB209_2:
	mov	rax, r2
	ret
// -- End function
// -- Begin function towupper
towupper:                               // @towupper
// %bb.0:
	mov	r2, r0
add	r0, -123
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483622
	jl	rax, r0, .LBB210_2
	jmp	.LBB210_1
.LBB210_1:
add	r2, -32
.LBB210_2:
	mov	rax, r2
	ret
// -- End function
// -- Begin function wctype
wctype:                                 // @wctype
// %bb.0:
	mov	r1, 3
	mov	r2, r0
	call	__bit_and
	mov	r4, rax
	jz	r4, .LBB211_2
	jmp	.LBB211_1
.LBB211_1:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, mcasm_static_101b1309eb90193381b23f6ff9cb10c4
	mov	r7, r3
	mov	r6, r2
	jmp	.LBB211_7
.LBB211_2:
	mov	r3, [r2]
	mov	r1, 1970170977
	mov	r5, mcasm_static_101b1309eb90193381b23f6ff9cb10c4
	mov	r7, r3
	mov	r6, r2
	jne	r3, r1, .LBB211_7
	jmp	.LBB211_3
.LBB211_3:                              // %.preheader5.i.preheader
	mov	t1, -2139062144
	mov	r6, r2
	mov	r7, 1
.LBB211_4:                              // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t1, .LBB211_113
	jmp	.LBB211_5
.LBB211_5:                              //   in Loop: Header=BB211_4 Depth=1
add	r6, 4
add	r5, 4
	mov	r1, [r6]
	mov	r0, [r5]
	je	r1, r0, .LBB211_4
	jmp	.LBB211_6
.LBB211_6:
	mov	r7, r1
.LBB211_7:
	mov	r1, 255
	mov	r0, r7
	call	__bit_and
	mov	t1, 0
	jz	rax, .LBB211_12
	jmp	.LBB211_8
.LBB211_8:                              // %.preheader.i.preheader
add	r6, 1
.LBB211_9:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	jne	rax, t1, .LBB211_11
	jmp	.LBB211_10
.LBB211_10:                             //   in Loop: Header=BB211_9 Depth=1
	mov	r1, 2
add	r5, 1
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
add	r6, 1
	mov	r0, 0
	jnz	r7, .LBB211_9
	jmp	.LBB211_11
.LBB211_11:
	call	__bit_and
	mov	t1, rax
.LBB211_12:                             // %strcmp.exit
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, 1
	je	t1, rax, .LBB211_113
	jmp	.LBB211_13
.LBB211_13:
	mov	r5, mcasm_static_ba8c4d496b9767907466df8792d898db
	mov	r7, r3
	mov	r6, r2
	jnz	r4, .LBB211_19
	jmp	.LBB211_14
.LBB211_14:
	mov	r3, [r2]
	mov	r1, 1752198241
	mov	r7, r3
	mov	r6, r2
	jne	r3, r1, .LBB211_19
	jmp	.LBB211_15
.LBB211_15:                             // %.preheader5.i2.preheader
	mov	t1, -2139062144
	mov	r6, r2
	mov	r7, 2
.LBB211_16:                             // %.preheader5.i2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t1, .LBB211_113
	jmp	.LBB211_17
.LBB211_17:                             //   in Loop: Header=BB211_16 Depth=1
add	r6, 4
add	r5, 4
	mov	r1, [r6]
	mov	r0, [r5]
	je	r1, r0, .LBB211_16
	jmp	.LBB211_18
.LBB211_18:
	mov	r7, r1
.LBB211_19:
	mov	r1, 255
	mov	r0, r7
	call	__bit_and
	mov	t1, 0
	jz	rax, .LBB211_24
	jmp	.LBB211_20
.LBB211_20:                             // %.preheader.i1.preheader
add	r6, 1
.LBB211_21:                             // %.preheader.i1
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	jne	rax, t1, .LBB211_23
	jmp	.LBB211_22
.LBB211_22:                             //   in Loop: Header=BB211_21 Depth=1
	mov	r1, 2
add	r5, 1
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
add	r6, 1
	mov	r0, 0
	jnz	r7, .LBB211_21
	jmp	.LBB211_23
.LBB211_23:
	call	__bit_and
	mov	t1, rax
.LBB211_24:                             // %strcmp.exit3
	mov	r1, 2
	mov	r7, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	t1, rax, .LBB211_113
	jmp	.LBB211_25
.LBB211_25:
	mov	r5, mcasm_static_69e92291c9643f3af66962cd8529423b
	mov	r7, r3
	mov	r6, r2
	jnz	r4, .LBB211_31
	jmp	.LBB211_26
.LBB211_26:
	mov	r3, [r2]
	mov	r1, 1851878498
	mov	r7, r3
	mov	r6, r2
	jne	r3, r1, .LBB211_31
	jmp	.LBB211_27
.LBB211_27:                             // %.preheader5.i5.preheader
	mov	t1, -2139062144
	mov	r6, r2
	mov	r7, 3
.LBB211_28:                             // %.preheader5.i5
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t1, .LBB211_113
	jmp	.LBB211_29
.LBB211_29:                             //   in Loop: Header=BB211_28 Depth=1
add	r6, 4
add	r5, 4
	mov	r1, [r6]
	mov	r0, [r5]
	je	r1, r0, .LBB211_28
	jmp	.LBB211_30
.LBB211_30:
	mov	r7, r1
.LBB211_31:
	mov	r1, 255
	mov	r0, r7
	call	__bit_and
	mov	t1, 0
	jz	rax, .LBB211_36
	jmp	.LBB211_32
.LBB211_32:                             // %.preheader.i4.preheader
add	r6, 1
.LBB211_33:                             // %.preheader.i4
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	jne	rax, t1, .LBB211_35
	jmp	.LBB211_34
.LBB211_34:                             //   in Loop: Header=BB211_33 Depth=1
	mov	r1, 2
add	r5, 1
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
add	r6, 1
	mov	r0, 0
	jnz	r7, .LBB211_33
	jmp	.LBB211_35
.LBB211_35:
	call	__bit_and
	mov	t1, rax
.LBB211_36:                             // %strcmp.exit6
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r6, rax
	mov	r1, 3
	mov	r7, 3
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	je	t1, rax, .LBB211_113
	jmp	.LBB211_37
.LBB211_37:
	mov	r5, mcasm_static_1f6e2106003cfb940dd9d0fb44e84e96
	mov	r7, r3
	mov	r6, r2
	jnz	r4, .LBB211_43
	jmp	.LBB211_38
.LBB211_38:
	mov	r3, [r2]
	mov	r1, 1920233059
	mov	r7, r3
	mov	r6, r2
	jne	r3, r1, .LBB211_43
	jmp	.LBB211_39
.LBB211_39:                             // %.preheader5.i8.preheader
	mov	t1, -2139062144
	mov	r6, r2
	mov	r7, 4
.LBB211_40:                             // %.preheader5.i8
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t1, .LBB211_113
	jmp	.LBB211_41
.LBB211_41:                             //   in Loop: Header=BB211_40 Depth=1
add	r6, 4
add	r5, 4
	mov	r1, [r6]
	mov	r0, [r5]
	je	r1, r0, .LBB211_40
	jmp	.LBB211_42
.LBB211_42:
	mov	r7, r1
.LBB211_43:
	mov	r1, 255
	mov	r0, r7
	call	__bit_and
	mov	t1, 0
	jz	rax, .LBB211_48
	jmp	.LBB211_44
.LBB211_44:                             // %.preheader.i7.preheader
add	r6, 1
.LBB211_45:                             // %.preheader.i7
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	jne	rax, t1, .LBB211_47
	jmp	.LBB211_46
.LBB211_46:                             //   in Loop: Header=BB211_45 Depth=1
	mov	r1, 2
add	r5, 1
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
add	r6, 1
	mov	r0, 0
	jnz	r7, .LBB211_45
	jmp	.LBB211_47
.LBB211_47:
	call	__bit_and
	mov	t1, rax
.LBB211_48:                             // %strcmp.exit9
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, 4
	je	t1, rax, .LBB211_113
	jmp	.LBB211_49
.LBB211_49:
	mov	r5, mcasm_static_f507adc2f6b024a95f3c41ed4b56ff84
	mov	r7, r3
	mov	r6, r2
	jnz	r4, .LBB211_55
	jmp	.LBB211_50
.LBB211_50:
	mov	r3, [r2]
	mov	r1, 1768384868
	mov	r7, r3
	mov	r6, r2
	jne	r3, r1, .LBB211_55
	jmp	.LBB211_51
.LBB211_51:                             // %.preheader5.i11.preheader
	mov	t1, -2139062144
	mov	r6, r2
	mov	r7, 5
.LBB211_52:                             // %.preheader5.i11
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t1, .LBB211_113
	jmp	.LBB211_53
.LBB211_53:                             //   in Loop: Header=BB211_52 Depth=1
add	r6, 4
add	r5, 4
	mov	r1, [r6]
	mov	r0, [r5]
	je	r1, r0, .LBB211_52
	jmp	.LBB211_54
.LBB211_54:
	mov	r7, r1
.LBB211_55:
	mov	r1, 255
	mov	r0, r7
	call	__bit_and
	mov	t1, 0
	jz	rax, .LBB211_60
	jmp	.LBB211_56
.LBB211_56:                             // %.preheader.i10.preheader
add	r6, 1
.LBB211_57:                             // %.preheader.i10
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	jne	rax, t1, .LBB211_59
	jmp	.LBB211_58
.LBB211_58:                             //   in Loop: Header=BB211_57 Depth=1
	mov	r1, 2
add	r5, 1
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
add	r6, 1
	mov	r0, 0
	jnz	r7, .LBB211_57
	jmp	.LBB211_59
.LBB211_59:
	call	__bit_and
	mov	t1, rax
.LBB211_60:                             // %strcmp.exit12
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, 5
	je	t1, rax, .LBB211_113
	jmp	.LBB211_61
.LBB211_61:
	mov	r5, mcasm_static_a94849e29b413b79605d32b6992f1341
	mov	r7, r3
	mov	r6, r2
	jnz	r4, .LBB211_67
	jmp	.LBB211_62
.LBB211_62:
	mov	r3, [r2]
	mov	r1, 1885434471
	mov	r7, r3
	mov	r6, r2
	jne	r3, r1, .LBB211_67
	jmp	.LBB211_63
.LBB211_63:                             // %.preheader5.i14.preheader
	mov	t1, -2139062144
	mov	r6, r2
	mov	r7, 6
.LBB211_64:                             // %.preheader5.i14
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t1, .LBB211_113
	jmp	.LBB211_65
.LBB211_65:                             //   in Loop: Header=BB211_64 Depth=1
add	r6, 4
add	r5, 4
	mov	r1, [r6]
	mov	r0, [r5]
	je	r1, r0, .LBB211_64
	jmp	.LBB211_66
.LBB211_66:
	mov	r7, r1
.LBB211_67:
	mov	r1, 255
	mov	r0, r7
	call	__bit_and
	mov	t1, 0
	jz	rax, .LBB211_72
	jmp	.LBB211_68
.LBB211_68:                             // %.preheader.i13.preheader
add	r6, 1
.LBB211_69:                             // %.preheader.i13
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	jne	rax, t1, .LBB211_71
	jmp	.LBB211_70
.LBB211_70:                             //   in Loop: Header=BB211_69 Depth=1
	mov	r1, 2
add	r5, 1
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
add	r6, 1
	mov	r0, 0
	jnz	r7, .LBB211_69
	jmp	.LBB211_71
.LBB211_71:
	call	__bit_and
	mov	t1, rax
.LBB211_72:                             // %strcmp.exit15
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, 6
	je	t1, rax, .LBB211_113
	jmp	.LBB211_73
.LBB211_73:
	mov	r5, mcasm_static_e231709c1fd8ebb153beb7492ac5ec8a
	mov	r7, r3
	mov	r6, r2
	jnz	r4, .LBB211_79
	jmp	.LBB211_74
.LBB211_74:
	mov	r3, [r2]
	mov	r1, 1702326124
	mov	r7, r3
	mov	r6, r2
	jne	r3, r1, .LBB211_79
	jmp	.LBB211_75
.LBB211_75:                             // %.preheader5.i17.preheader
	mov	t1, -2139062144
	mov	r6, r2
	mov	r7, 7
.LBB211_76:                             // %.preheader5.i17
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t1, .LBB211_113
	jmp	.LBB211_77
.LBB211_77:                             //   in Loop: Header=BB211_76 Depth=1
add	r6, 4
add	r5, 4
	mov	r1, [r6]
	mov	r0, [r5]
	je	r1, r0, .LBB211_76
	jmp	.LBB211_78
.LBB211_78:
	mov	r7, r1
.LBB211_79:
	mov	r1, 255
	mov	r0, r7
	call	__bit_and
	mov	t1, 0
	jz	rax, .LBB211_84
	jmp	.LBB211_80
.LBB211_80:                             // %.preheader.i16.preheader
add	r6, 1
.LBB211_81:                             // %.preheader.i16
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	jne	rax, t1, .LBB211_83
	jmp	.LBB211_82
.LBB211_82:                             //   in Loop: Header=BB211_81 Depth=1
	mov	r1, 2
add	r5, 1
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
add	r6, 1
	mov	r0, 0
	jnz	r7, .LBB211_81
	jmp	.LBB211_83
.LBB211_83:
	call	__bit_and
	mov	t1, rax
.LBB211_84:                             // %strcmp.exit18
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, 7
	je	t1, rax, .LBB211_113
	jmp	.LBB211_85
.LBB211_85:
	mov	r5, mcasm_static_8a78ac1b83269f091ae6ac3c6b18a30e
	mov	r7, r3
	mov	r6, r2
	jnz	r4, .LBB211_91
	jmp	.LBB211_86
.LBB211_86:
	mov	r3, [r2]
	mov	r1, 1852404336
	mov	r7, r3
	mov	r6, r2
	jne	r3, r1, .LBB211_91
	jmp	.LBB211_87
.LBB211_87:                             // %.preheader5.i20.preheader
	mov	t1, -2139062144
	mov	r6, r2
	mov	r7, 8
.LBB211_88:                             // %.preheader5.i20
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t1, .LBB211_113
	jmp	.LBB211_89
.LBB211_89:                             //   in Loop: Header=BB211_88 Depth=1
add	r6, 4
add	r5, 4
	mov	r1, [r6]
	mov	r0, [r5]
	je	r1, r0, .LBB211_88
	jmp	.LBB211_90
.LBB211_90:
	mov	r7, r1
.LBB211_91:
	mov	r1, 255
	mov	r0, r7
	call	__bit_and
	mov	t1, 0
	jz	rax, .LBB211_96
	jmp	.LBB211_92
.LBB211_92:                             // %.preheader.i19.preheader
add	r6, 1
.LBB211_93:                             // %.preheader.i19
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, r7
	call	__bit_and
	jne	rax, t1, .LBB211_95
	jmp	.LBB211_94
.LBB211_94:                             //   in Loop: Header=BB211_93 Depth=1
	mov	r1, 2
add	r5, 1
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r7, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r7]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, rax
add	r6, 1
	mov	r0, 0
	jnz	r7, .LBB211_93
	jmp	.LBB211_95
.LBB211_95:
	call	__bit_and
	mov	t1, rax
.LBB211_96:                             // %strcmp.exit21
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, 8
	je	t1, rax, .LBB211_113
	jmp	.LBB211_97
.LBB211_97:
	mov	r5, mcasm_static_40c3c00d3d4beb11c80d086750d0389c
	mov	r6, r2
	jnz	r4, .LBB211_103
	jmp	.LBB211_98
.LBB211_98:
	mov	r3, [r2]
	mov	r1, 1668183408
	mov	r6, r2
	jne	r3, r1, .LBB211_103
	jmp	.LBB211_99
.LBB211_99:                             // %.preheader5.i23.preheader
	mov	r3, -2139062144
	mov	r6, r2
	mov	r7, 9
.LBB211_100:                            // %.preheader5.i23
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r3, .LBB211_113
	jmp	.LBB211_101
.LBB211_101:                            //   in Loop: Header=BB211_100 Depth=1
add	r6, 4
add	r5, 4
	mov	r1, [r6]
	mov	r0, [r5]
	je	r1, r0, .LBB211_100
	jmp	.LBB211_102
.LBB211_102:
	mov	r3, r1
.LBB211_103:
	mov	r1, 255
	mov	r0, r3
	call	__bit_and
	mov	r4, 0
	jz	rax, .LBB211_108
	jmp	.LBB211_104
.LBB211_104:                            // %.preheader.i22.preheader
add	r6, 1
.LBB211_105:                            // %.preheader.i22
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	mov	r0, r3
	call	__bit_and
	jne	rax, r4, .LBB211_107
	jmp	.LBB211_106
.LBB211_106:                            //   in Loop: Header=BB211_105 Depth=1
	mov	r1, 2
add	r5, 1
	mov	r0, r6
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
add	r6, 1
	mov	r0, 0
	jnz	r3, .LBB211_105
	jmp	.LBB211_107
.LBB211_107:
	call	__bit_and
	mov	r4, rax
.LBB211_108:                            // %strcmp.exit24
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r7, 9
	je	r4, rax, .LBB211_113
	jmp	.LBB211_109
.LBB211_109:
	mov	r1, mcasm_static_73af4c00ee0642939d1c259ea9169756
	mov	r0, r2
	call	strcmp
	mov	r7, 10
	jz	rax, .LBB211_113
	jmp	.LBB211_110
.LBB211_110:
	mov	r1, mcasm_static_8d4ec3a485ed37d3994d9b22572fa22e
	mov	r0, r2
	call	strcmp
	mov	r7, 11
	jz	rax, .LBB211_113
	jmp	.LBB211_111
.LBB211_111:
	mov	r1, mcasm_static_b653851cb116636ca8324d057df59598
	mov	r0, r2
	call	strcmp
	mov	r7, 12
	jz	rax, .LBB211_113
	jmp	.LBB211_112
.LBB211_112:
	mov	r7, 0
.LBB211_113:                            // %strcmp.exit.thread
	mov	rax, r7
	ret
// -- End function
// -- Begin function iswctype
iswctype:                               // @iswctype
// %bb.0:
	mov	r2, r0
	mov	r0, 6
	mov	r3, 0
	jg	r1, r0, .LBB212_8
	jmp	.LBB212_1
.LBB212_1:
	mov	r0, 3
	jg	r1, r0, .LBB212_5
	jmp	.LBB212_2
.LBB212_2:
	mov	r0, 1
	je	r1, r0, .LBB212_15
	jmp	.LBB212_3
.LBB212_3:
	mov	r0, 2
	je	r1, r0, .LBB212_17
	jmp	.LBB212_4
.LBB212_4:
	mov	r0, 3
	je	r1, r0, .LBB212_19
	jmp	.LBB212_40
.LBB212_5:
	mov	r0, 4
	je	r1, r0, .LBB212_21
	jmp	.LBB212_6
.LBB212_6:
	mov	r0, 5
	je	r1, r0, .LBB212_23
	jmp	.LBB212_7
.LBB212_7:
	mov	r0, 6
	je	r1, r0, .LBB212_25
	jmp	.LBB212_40
.LBB212_8:
	mov	r0, 9
	jg	r1, r0, .LBB212_12
	jmp	.LBB212_9
.LBB212_9:
	mov	r0, 7
	je	r1, r0, .LBB212_27
	jmp	.LBB212_10
.LBB212_10:
	mov	r0, 8
	je	r1, r0, .LBB212_29
	jmp	.LBB212_11
.LBB212_11:
	mov	r0, 9
	je	r1, r0, .LBB212_31
	jmp	.LBB212_40
.LBB212_12:
	mov	r0, 10
	je	r1, r0, .LBB212_33
	jmp	.LBB212_13
.LBB212_13:
	mov	r0, 11
	je	r1, r0, .LBB212_35
	jmp	.LBB212_14
.LBB212_14:
	mov	r0, 12
	je	r1, r0, .LBB212_37
	jmp	.LBB212_40
.LBB212_15:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_16
.LBB212_16:
	mov	r1, 95
	mov	r0, r2
	call	__bit_and
add	rax, -91
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
add	r2, -58
	mov	r1, 31
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_or
	mov	r3, rax
	jmp	.LBB212_40
.LBB212_17:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_18
.LBB212_18:
	mov	r1, 95
	mov	r0, r2
	call	__bit_and
add	rax, -91
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	jmp	.LBB212_40
.LBB212_19:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_20
.LBB212_20:
	mov	r1, 32
	mov	r0, r2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r1, 9
	mov	r3, rax
	mov	r0, r2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r3, rax
	jmp	.LBB212_40
.LBB212_21:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_22
.LBB212_22:
	mov	r0, r2
	call	__bit_xor
add	rax, 2147483616
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 127
	mov	r3, rax
	mov	r0, r2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r3, rax
	jmp	.LBB212_40
.LBB212_23:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_24
.LBB212_24:
add	r2, -58
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	jmp	.LBB212_40
.LBB212_25:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_26
.LBB212_26:
add	r2, -127
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	jmp	.LBB212_40
.LBB212_27:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_28
.LBB212_28:
add	r2, -123
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	jmp	.LBB212_40
.LBB212_29:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_30
.LBB212_30:
add	r2, -127
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	jmp	.LBB212_40
.LBB212_31:
	mov	r0, r2
add	r0, -127
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483554
	jl	rax, r0, .LBB212_40
	jmp	.LBB212_32
.LBB212_32:
	mov	r1, 95
	mov	r0, r2
	call	__bit_and
add	rax, -65
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
add	r2, -48
	mov	r1, 31
	mov	r3, rax
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, r3
	call	__bit_and
	mov	r3, rax
	jmp	.LBB212_40
.LBB212_33:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_34
.LBB212_34:
add	r2, -9
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483624
	jl	rax, r0, .LBB212_39
	jmp	.LBB212_40
.LBB212_35:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_36
.LBB212_36:
add	r2, -91
	mov	r1, 31
	mov	r0, r2
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	jmp	.LBB212_40
.LBB212_37:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_38
.LBB212_38:
	mov	r0, r2
add	r0, -58
	mov	r1, 31
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 95
	mov	r3, rax
	mov	r0, r2
	call	__bit_and
add	rax, -71
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, r3
	mov	r1, rax
	call	__bit_or
	mov	r3, rax
	jmp	.LBB212_40
.LBB212_39:                             // %switch.lookup
	mov	r0, 8388639
	mov	r1, r2
	call	__bit_shr
	mov	r3, rax
.LBB212_40:                             // %ispunct.exit
	mov	r1, 1
	mov	r0, r3
	call	__bit_and
	ret
// -- End function
// -- Begin function wctrans
wctrans:                                // @wctrans
// %bb.0:
	mov	r1, 3
	mov	r2, r0
	call	__bit_and
	mov	r4, rax
	jz	r4, .LBB213_2
	jmp	.LBB213_1
.LBB213_1:
	mov	r1, 2
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
	mov	r5, mcasm_static_90cbfbf1d1379f76331d7642492e620b
	mov	r6, r3
	mov	r7, r2
	jmp	.LBB213_7
.LBB213_2:
	mov	r3, [r2]
	mov	r1, 1869377396
	mov	r5, mcasm_static_90cbfbf1d1379f76331d7642492e620b
	mov	r6, r3
	mov	r7, r2
	jne	r3, r1, .LBB213_7
	jmp	.LBB213_3
.LBB213_3:                              // %.preheader5.i.preheader
	mov	t1, -2139062144
	mov	r7, r2
	mov	r6, 1
.LBB213_4:                              // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, t1, .LBB213_26
	jmp	.LBB213_5
.LBB213_5:                              //   in Loop: Header=BB213_4 Depth=1
add	r7, 4
add	r5, 4
	mov	r1, [r7]
	mov	r0, [r5]
	je	r1, r0, .LBB213_4
	jmp	.LBB213_6
.LBB213_6:
	mov	r6, r1
.LBB213_7:
	mov	r1, 255
	mov	r0, r6
	call	__bit_and
	mov	t1, 0
	jz	rax, .LBB213_12
	jmp	.LBB213_8
.LBB213_8:                              // %.preheader.i.preheader
add	r7, 1
.LBB213_9:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	t1, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [t1]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	t1, rax
	mov	r0, r6
	call	__bit_and
	jne	rax, t1, .LBB213_11
	jmp	.LBB213_10
.LBB213_10:                             //   in Loop: Header=BB213_9 Depth=1
	mov	r1, 2
add	r5, 1
	mov	r0, r7
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, rax
add	r7, 1
	mov	r0, 0
	jnz	r6, .LBB213_9
	jmp	.LBB213_11
.LBB213_11:
	call	__bit_and
	mov	t1, rax
.LBB213_12:                             // %strcmp.exit
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r6, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r6]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r6, 1
	je	t1, rax, .LBB213_26
	jmp	.LBB213_13
.LBB213_13:
	mov	r5, mcasm_static_24b38a3729868632b94186a6d5e387c9
	jnz	r4, .LBB213_19
	jmp	.LBB213_14
.LBB213_14:
	mov	r3, [r2]
	mov	r1, 1886744436
	jne	r3, r1, .LBB213_19
	jmp	.LBB213_15
.LBB213_15:                             // %.preheader5.i2.preheader
	mov	r3, -2139062144
.LBB213_16:                             // %.preheader5.i2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, r3, .LBB213_25
	jmp	.LBB213_17
.LBB213_17:                             //   in Loop: Header=BB213_16 Depth=1
add	r2, 4
add	r5, 4
	mov	r1, [r2]
	mov	r0, [r5]
	je	r1, r0, .LBB213_16
	jmp	.LBB213_18
.LBB213_18:
	mov	r3, r1
.LBB213_19:
	mov	r1, 255
	mov	r0, r3
	call	__bit_and
	mov	r6, 0
	mov	r4, 0
	jz	rax, .LBB213_24
	jmp	.LBB213_20
.LBB213_20:                             // %.preheader.i1.preheader
add	r2, 1
.LBB213_21:                             // %.preheader.i1
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r4, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r4]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r4, rax
	mov	r0, r3
	call	__bit_and
	jne	rax, r4, .LBB213_23
	jmp	.LBB213_22
.LBB213_22:                             //   in Loop: Header=BB213_21 Depth=1
	mov	r1, 2
add	r5, 1
	mov	r0, r2
	call	__bit_shr
	mov	r1, 3
	mov	r3, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r3]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r3, rax
add	r2, 1
	mov	r0, 0
	jnz	r3, .LBB213_21
	jmp	.LBB213_23
.LBB213_23:
	call	__bit_and
	mov	r4, rax
.LBB213_24:                             // %strcmp.exit3
	mov	r1, 2
	mov	r0, r5
	call	__bit_shr
	mov	r1, 3
	mov	r2, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_shl
	mov	r0, [r2]
	mov	r1, rax
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, r4
	mov	r1, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB213_26
	jmp	.LBB213_25
.LBB213_25:                             // %strcmp.exit3.thread
	mov	r6, 2
.LBB213_26:                             // %strcmp.exit.thread
	mov	rax, r6
	ret
// -- End function
// -- Begin function towctrans
towctrans:                              // @towctrans
// %bb.0:
	mov	r3, 2
	mov	r2, r0
	je	r1, r3, .LBB214_5
	jmp	.LBB214_1
.LBB214_1:
	mov	r0, 1
	jne	r1, r0, .LBB214_8
	jmp	.LBB214_2
.LBB214_2:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB214_8
	jmp	.LBB214_3
.LBB214_3:
	mov	r0, r2
add	r0, -91
	call	__bit_xor
	mov	r0, 2147483622
	jl	rax, r0, .LBB214_8
	jmp	.LBB214_4
.LBB214_4:
add	r2, 32
	jmp	.LBB214_8
.LBB214_5:
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB214_8
	jmp	.LBB214_6
.LBB214_6:
	mov	r0, r2
add	r0, -123
	call	__bit_xor
	mov	r0, 2147483622
	jl	rax, r0, .LBB214_8
	jmp	.LBB214_7
.LBB214_7:
add	r2, -32
.LBB214_8:
	mov	rax, r2
	ret
// -- End function
static mcasm_static_eb6422b321c3a10bba2c8ff81023d04b [67]
static mcasm_static_ed53d212bdc419f3bb968190f0e37111 [67]
static mcasm_static_867d57c621efda06cd5862d5d6cfbefb [1230196560, 88]
static mcasm_static_428200a628ce0e4b2ece3b899c3b423a [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2139062143, 2139062143]
static mcasm_static_7b6097f6a7af6a409dc19614f7d434c6 [46]
static mcasm_static_e784327bd39f39aee34487c8a7d75052 [0]
static mcasm_static_587a65ffaedd8d46cf598fc6494fd1ec [0, 0, 0, 0, 0, 0, 0]
static mcasm_static_77cddc3e58d09d60125d4f48b8ea755c [0]
static mcasm_static_2cc1d183fff04c49451880a295cfbfa8 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
static mcasm_static_598e24c02d9f3705d04dcdf782aa5836 [1819635240, 10604]
static mcasm_static_85b8e4757d3715073866f6059f6b5134 [858927408, 926299444, 1111570744, 1178944579, 1246316615, 1313688651, 1381060687, 1448432723, 1515804759, 0]
static mcasm_static_8f5f61b9dd74a8b851ea22679f5c2124 [5136718]
static mcasm_static_a8afc04a7a6766e4df1229dbe668b6f4 [7233902]
static mcasm_static_a0949d77eedfc21443ba62399564a4b6 [1768320585, 2037672302, 0]
static mcasm_static_1b6fc06155ce3ed37ce64d51699793b6 [6712937]
static mcasm_static_55b62ded264696f3118881eef65fa1ea [1718503725, 1953066601, 121]
static mcasm_static_94e5ac23d4a7da1069e2e6c8214725a5 [1718511917, 0]
static mcasm_static_86aa16fa46c1f241ea4bc7c9265a2c2a [825241648, 858796592, 892351536, 925906480, 959461424, 825307185, 858862129, 892417073, 925972017, 959526961, 825372722, 858927666, 892482610, 926037554, 959592498, 825438259, 858993203, 892548147, 926103091, 959658035, 825503796, 859058740, 892613684, 926168628, 959723572, 825569333, 859124277, 892679221, 926234165, 959789109, 825634870, 859189814, 892744758, 926299702, 959854646, 825700407, 859255351, 892810295, 926365239, 959920183, 825765944, 859320888, 892875832, 926430776, 959985720, 825831481, 859386425, 892941369, 926496313, 960051257, 0]
static mcasm_static_73fa1e3cc366bdb06702f35e09026afd [858927408, 926299444, 1650538808, 1717920867, 1785292903, 1852664939, 1920036975, 1987409011, 2054781047, 0]
static mcasm_static_5e6e12c67207ca8d73d385863abbfac5 [825241648, 858796592, 892351536, 925906480, 959461424, 825307185, 858862129, 892417073, 925972017, 959526961, 825372722, 858927666, 892482610, 926037554, 959592498, 825438259, 858993203, 892548147, 926103091, 959658035, 825503796, 859058740, 892613684, 926168628, 959723572, 825569333, 859124277, 892679221, 926234165, 959789109, 825634870, 859189814, 892744758, 926299702, 959854646, 825700407, 859255351, 892810295, 926365239, 959920183, 825765944, 859320888, 892875832, 926430776, 959985720, 825831481, 859386425, 892941369, 926496313, 960051257]
static mcasm_static_9f931c3a3dfc86b8ff7a00730b2a74ac [0]
static mcasm_static_1273b9e1b68180723daab84a177b2d85 [0]
static mcasm_static_101b1309eb90193381b23f6ff9cb10c4 [1970170977, 109]
static mcasm_static_ba8c4d496b9767907466df8792d898db [1752198241, 97]
static mcasm_static_69e92291c9643f3af66962cd8529423b [1851878498, 107]
static mcasm_static_1f6e2106003cfb940dd9d0fb44e84e96 [1920233059, 108]
static mcasm_static_f507adc2f6b024a95f3c41ed4b56ff84 [1768384868, 116]
static mcasm_static_a94849e29b413b79605d32b6992f1341 [1885434471, 104]
static mcasm_static_e231709c1fd8ebb153beb7492ac5ec8a [1702326124, 114]
static mcasm_static_8a78ac1b83269f091ae6ac3c6b18a30e [1852404336, 116]
static mcasm_static_40c3c00d3d4beb11c80d086750d0389c [1668183408, 116]
static mcasm_static_73af4c00ee0642939d1c259ea9169756 [1667330163, 101]
static mcasm_static_8d4ec3a485ed37d3994d9b22572fa22e [1701867637, 114]
static mcasm_static_b653851cb116636ca8324d057df59598 [1734960248, 29801]
static mcasm_static_90cbfbf1d1379f76331d7642492e620b [1869377396, 7497079]
static mcasm_static_24b38a3729868632b94186a6d5e387c9 [1886744436, 7497072]
static mcasm_static_7e9a95c96891ece14f22dc3df106a751 [0, 0, 0, 0]

export _ll_shared:z/__ll_puts_char0_0:
    inline $data modify storage std:vm s1.str set from storage std:vm char2str_map."$(a)"
	ret

export _ll_shared:z/__ll_puts_char1_0:
    inline $data modify storage std:vm s1.next set from storage std:vm char2str_map."$(a)"
	ret

export _ll_shared:z/puts_0:
    inline $scoreboard players set r0 vm_regs $(a)
    mov r1, 2
    call __bit_shl
    inline scoreboard players operation puts_ptr vm_regs = rax vm_regs
    inline data modify storage std:vm s1 set value {str: "", next: ""}
    .Lputs_loop:
    inline scoreboard players operation r0 vm_regs = puts_ptr vm_regs
    mov r1, 2
    call __bit_shr
    inline scoreboard players operation puts_word vm_regs = rax vm_regs
    inline scoreboard players operation r0 vm_regs = puts_ptr vm_regs
    mov r1, 3
    call __bit_and
    mov r0, rax
    mov r1, 3
    call __bit_shl
    inline scoreboard players operation puts_shift vm_regs = rax vm_regs
    inline data modify storage std:vm s2 set value {result: "r0", ptr: -1}
    inline execute store result storage std:vm s2.ptr int 1 run scoreboard players get puts_word vm_regs
    inline function std:_internal/load_heap_custom with storage std:vm s2
    inline scoreboard players operation r1 vm_regs = puts_shift vm_regs
    call __bit_shr
    mov r0, rax
    mov r1, 255
    call __bit_and
    mov r0, rax
    jz r0, .Lputs_done
    inline data modify storage std:vm s0 set value {a: -1}
    inline execute store result storage std:vm s0.a int 1 run scoreboard players get r0 vm_regs
    inline function _ll_shared:z/__ll_puts_char1_0 with storage std:vm s0
    inline data modify storage std:vm s3 set value {left: "", right: ""}
    inline data modify storage std:vm s3.left set from storage std:vm s1.str
    inline data modify storage std:vm s3.right set from storage std:vm s1.next
    inline function std:_internal/merge_string2 with storage std:vm s3
    inline data modify storage std:vm s1.str set from storage std:vm s3.string
    inline scoreboard players add puts_ptr vm_regs 1
    jmp .Lputs_loop
    .Lputs_done:
    inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
	ret
