#include "_ll_std"

// -- Begin function __divsf3
__divsf3:                               // @__divsf3
// %bb.0:
sub	rsp, 44
	mov	[rsp+40], x0
	mov	[rsp+36], x1
	mov	[rsp+32], x2
	mov	[rsp+28], x3
	mov	[rsp+24], x4
	mov	[rsp+20], x5
	mov	[rsp+16], x6
	mov	[rsp+12], x7
	mov	[rsp+8], x8
	mov	[rsp+4], x9
	mov	[rsp], x10
	mov	x5, r1
	mov	r1, 23
	mov	x7, r0
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 23
	mov	x1, rax
	mov	r0, x5
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	x3, rax
	mov	r0, x5
	mov	r1, x7
	call	__bit_xor
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, 8388607
	mov	x0, rax
	mov	r0, x7
	call	__bit_and
	mov	r1, 8388607
	mov	x2, rax
	mov	r0, x5
	call	__bit_and
	mov	r0, x1
add	r0, -255
	mov	r1, -2147483648
	mov	x4, rax
	call	__bit_xor
	mov	r0, 2147483394
	jl	rax, r0, .LBB0_2
	jmp	.LBB0_1
.LBB0_1:
	mov	r0, x3
add	r0, -255
	mov	r1, -2147483648
	mov	x6, 0
	call	__bit_xor
	mov	r0, 2147483393
	jg	rax, r0, .LBB0_19
	jmp	.LBB0_2
.LBB0_2:
	mov	r1, 2147483647
	mov	r0, x7
	call	__bit_and
	mov	r1, 2147483647
	mov	x8, rax
	mov	r0, x5
	call	__bit_and
	mov	r0, 2139095041
	jl	x8, r0, .LBB0_4
	jmp	.LBB0_3
.LBB0_3:
	mov	r1, 4194304
	mov	r0, x7
	call	__bit_or
	mov	r0, rax
	jmp	.LBB0_32
.LBB0_4:
	jl	rax, r0, .LBB0_6
	jmp	.LBB0_5
.LBB0_5:
	mov	r1, 4194304
	mov	r0, x5
	call	__bit_or
	mov	r0, rax
	jmp	.LBB0_32
.LBB0_6:
	mov	r1, 2139095040
	jne	x8, r1, .LBB0_9
	jmp	.LBB0_7
.LBB0_7:
	mov	r0, 2143289344
	je	rax, r1, .LBB0_32
	jmp	.LBB0_8
.LBB0_8:
	mov	r0, x0
	call	__bit_or
	mov	r0, rax
	jmp	.LBB0_32
.LBB0_9:
	jne	rax, r1, .LBB0_11
	jmp	.LBB0_10
.LBB0_10:
	mov	r0, x0
	jmp	.LBB0_32
.LBB0_11:
	jnz	x8, .LBB0_13
	jmp	.LBB0_12
.LBB0_12:
	mov	r0, rax
	mov	x1, rax
	call	__bit_not
add	rax, 1
	mov	r0, x1
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
	mov	r1, 2143289344
	sub	r1, x0
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	add	r0, x0
	jmp	.LBB0_32
.LBB0_13:
	jnz	rax, .LBB0_15
	jmp	.LBB0_14
.LBB0_14:
	mov	r0, x0
	call	__bit_or
	mov	r0, rax
	jmp	.LBB0_32
.LBB0_15:
	mov	x7, 8388607
	mov	x6, 0
	jg	x8, x7, .LBB0_17
	jmp	.LBB0_16
.LBB0_16:
	mov	r1, 1
	mov	r0, x2
	mov	x8, rax
	call	__bit_shr
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x5, rax
	mov	r1, 2
	mov	r0, x5
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	add	x6, rax
	mov	r1, 4
	mov	r0, x6
	call	__bit_shr
	add	x6, rax
	mov	r1, 252645135
	mov	r0, x6
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	x5, 24
	mov	r0, rax
	call	__bit_shr
	mov	x6, rax
	sub	x5, x6
	mov	r0, x2
	mov	r1, x5
	call	__bit_shl
	mov	x2, rax
	mov	rax, x8
add	x6, -23
.LBB0_17:
	jg	rax, x7, .LBB0_19
	jmp	.LBB0_18
.LBB0_18:
	mov	r1, 1
	mov	r0, x4
	call	__bit_shr
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x5, rax
	mov	r1, 2
	mov	r0, x5
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x7, rax
	mov	r0, x5
	call	__bit_and
	add	x7, rax
	mov	r1, 4
	mov	r0, x7
	call	__bit_shr
	add	x7, rax
	mov	r1, 252645135
	mov	r0, x7
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	x5, 24
	mov	r0, rax
	call	__bit_shr
	mov	x7, rax
	sub	x5, x7
	mov	r0, x4
	mov	r1, x5
	call	__bit_shl
	mov	x4, rax
	sub	x6, x7
add	x6, 23
.LBB0_19:
	mov	r1, 8388608
	mov	x10, 8388608
	mov	r0, x2
	call	__bit_or
	mov	r1, 8388608
	mov	x5, rax
	mov	r0, x4
	call	__bit_or
	sub	x1, x3
	add	x1, x6
	mov	x3, rax
	mov	x4, x1
	mov	r1, 8
add	x4, 127
	mov	r0, x3
	call	__bit_shl
	mov	x7, rax
	mov	x8, 1963258675
	sub	x8, x7
	mov	r1, 0
	mov	r3, 0
	mov	x6, 0
	mov	r0, x8
	mov	r2, x7
	call	__muldi3
	mov	r0, 0
	sub	r0, t0
	mov	r1, 0
	mov	r3, 0
	mov	r2, x8
	call	__muldi3
	mov	r1, 31
	mov	x8, t0
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	x9, rax
	mov	r0, x8
	call	__bit_shl
	mov	r0, x9
	mov	r1, rax
	call	__bit_or
	mov	r1, 0
	mov	r3, 0
	mov	x8, rax
	mov	r0, x8
	mov	r2, x7
	call	__muldi3
	mov	r2, 0
	sub	r2, t0
	mov	r1, 0
	mov	r3, 0
	mov	r0, x8
	call	__muldi3
	mov	r1, 31
	mov	x8, t0
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	x9, rax
	mov	r0, x8
	call	__bit_shl
	mov	r0, x9
	mov	r1, rax
	call	__bit_or
	mov	r1, 0
	mov	r3, 0
	mov	x8, rax
	mov	r0, x8
	mov	r2, x7
	call	__muldi3
	sub	x6, t0
	mov	r1, 0
	mov	r3, 0
	mov	r0, x8
	mov	r2, x6
	call	__muldi3
	mov	r1, 31
	mov	x6, t0
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	x7, rax
	mov	r0, x6
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	x7, rax
	mov	r1, 1
add	x7, -12
	mov	r0, x5
	call	__bit_shl
	mov	r1, 0
	mov	r3, 0
	mov	x6, rax
	mov	r0, x7
	mov	r2, x6
	call	__muldi3
	mov	r1, -2147483648
	mov	x7, t0
	mov	r0, x7
	call	__bit_xor
	mov	r0, -2130706433
	jg	rax, r0, .LBB0_23
	jmp	.LBB0_20
.LBB0_20:
	mov	r1, -2147483648
	mov	r0, x7
	call	__bit_xor
	mov	x5, rax
	mov	r0, x5
	call	__bit_not
	mov	r1, -2139095040
	mov	r0, rax
	call	__bit_and
	mov	r1, -2139095040
	mov	x8, rax
	mov	r0, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x5, 2139095040
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
add	x1, 126
	mov	r0, rax
	call	__bit_and
	mov	r0, x7
	mov	r1, rax
	call	__bit_shl
	mov	x8, rax
	jl	x7, x10, .LBB0_22
	jmp	.LBB0_21
.LBB0_21:
	mov	x1, x4
.LBB0_22:
	mov	r1, 24
	mov	r0, x2
	call	__bit_shl
	mov	r0, x8
	mul	r0, x3
add	x1, -1
	sub	rax, r0
	mov	x4, x1
	jmp	.LBB0_24
.LBB0_23:
	mov	r1, 1
	mov	r0, x7
	call	__bit_shr
	mov	r1, 23
	mov	x8, rax
	mov	r0, x2
	call	__bit_shl
	mov	r0, x8
	mul	r0, x3
	sub	rax, r0
	mov	x6, x5
.LBB0_24:
	mov	r0, 255
	jl	x4, r0, .LBB0_26
	jmp	.LBB0_25
.LBB0_25:
	mov	r1, 2139095040
	mov	r0, x0
	call	__bit_or
	mov	r0, rax
	jmp	.LBB0_32
.LBB0_26:
	mov	r0, 1
	jl	x4, r0, .LBB0_28
	jmp	.LBB0_27
.LBB0_27:
	mov	r1, 8388607
	mov	r0, x8
	mov	x2, rax
	call	__bit_and
	mov	r1, 23
	mov	x1, rax
	mov	r0, x4
	call	__bit_shl
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r1, 1
	mov	x1, rax
	mov	r0, x2
	call	__bit_shl
	mov	x2, rax
	jmp	.LBB0_31
.LBB0_28:
	mov	r0, -24
	jg	x4, r0, .LBB0_30
	jmp	.LBB0_29
.LBB0_29:
	mov	r0, x0
	jmp	.LBB0_32
.LBB0_30:
	mov	r1, 1
	sub	r1, x4
add	x4, 23
	mov	r0, x8
	call	__bit_shr
	mov	x1, rax
	mov	r0, x6
	mov	r1, x4
	call	__bit_shl
	mov	r1, 1
	mov	x2, rax
	mov	r0, x3
	call	__bit_shl
	mul	rax, x1
	sub	x2, rax
.LBB0_31:
	mov	r1, 1
	mov	r0, x1
	call	__bit_and
	mov	x4, rax
	add	x4, x2
	mov	r0, x3
	call	__bit_not
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	x2, rax
	mov	r0, x3
	mov	r1, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x3, x4
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	x1, rax
	mov	r0, x1
	mov	r1, x0
	call	__bit_or
	mov	r0, rax
.LBB0_32:
	mov	rax, r0
	mov	x10, [rsp]
	mov	x9, [rsp+4]
	mov	x8, [rsp+8]
	mov	x7, [rsp+12]
	mov	x6, [rsp+16]
	mov	x5, [rsp+20]
	mov	x4, [rsp+24]
	mov	x3, [rsp+28]
	mov	x2, [rsp+32]
	mov	x1, [rsp+36]
	mov	x0, [rsp+40]
add	rsp, 44
	ret
// -- End function
