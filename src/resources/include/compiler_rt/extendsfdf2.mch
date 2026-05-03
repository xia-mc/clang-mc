#include "_ll_std"

// -- Begin function __extendsfdf2
__extendsfdf2:                          // @__extendsfdf2
// %bb.0:
sub	rsp, 36
	mov	[rsp+32], x0
	mov	[rsp+28], x1
	mov	[rsp+24], x2
	mov	[rsp+20], x3
	mov	[rsp+16], x4
	mov	[rsp+12], x5
	mov	[rsp+8], x6
	mov	[rsp+4], x7
	mov	[rsp], x8
	mov	r1, 23
	mov	x0, r0
	call	__bit_shr
	mov	r1, 8388607
	mov	x2, rax
	mov	r0, x0
	call	__bit_and
	mov	x1, rax
	mov	r1, 255
	mov	x3, 255
	mov	r0, x2
	call	__bit_and
	jz	rax, .LBB0_4
	jmp	.LBB0_1
.LBB0_1:
	je	rax, x3, .LBB0_3
	jmp	.LBB0_2
.LBB0_2:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	x2, rax
	mov	r1, 3
add	x2, 896
	mov	r0, x1
	call	__bit_shr
	mov	r1, 29
	mov	x4, rax
	mov	r0, x1
	call	__bit_shl
	mov	x3, rax
	jmp	.LBB0_6
.LBB0_3:
	mov	r1, 3
	mov	r0, x1
	call	__bit_shr
	mov	r1, 29
	mov	x4, rax
	mov	r0, x1
	call	__bit_shl
	mov	x3, rax
	mov	x2, 2047
	jmp	.LBB0_6
.LBB0_4:
	mov	x3, 0
	mov	x4, 0
	mov	x2, 0
	jz	x1, .LBB0_6
	jmp	.LBB0_5
.LBB0_5:
	mov	r1, 1
	mov	r0, x1
	call	__bit_shr
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x2, rax
	mov	r0, x2
	call	__bit_shr
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x2, rax
	mov	r0, x2
	call	__bit_shr
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x2, rax
	mov	r0, x2
	call	__bit_shr
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x2, rax
	mov	r0, x2
	call	__bit_shr
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x2, rax
	mov	r0, x2
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x2, rax
	mov	r1, 2
	mov	r0, x2
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	add	x3, rax
	mov	r1, 4
	mov	r0, x3
	call	__bit_shr
	add	x3, rax
	mov	r1, 252645135
	mov	r0, x3
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	r0, rax
	call	__bit_shr
	mov	x4, 32
	mov	r0, 32
	sub	r0, rax
	mov	x2, 905
	sub	x2, r0
	mov	x3, 53
	mov	r0, 21
	sub	r0, rax
	mov	r1, 31
	sub	x3, rax
	call	__bit_shr
	mov	r1, 31
	mov	x5, rax
	mov	r0, x3
	call	__bit_and
	mov	x6, rax
	mov	r0, x1
	mov	r1, x6
	call	__bit_shl
	mov	x7, rax
	mov	x8, 0
	sub	x8, x5
	mov	x5, 0
	mov	r0, x7
	mov	r1, x8
	call	__bit_and
	mov	r1, 0
	sub	r1, x6
	mov	x3, rax
	mov	r0, x6
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	sub	x4, x6
	mov	r1, 31
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_shr
	sub	x5, x6
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x8
	call	__bit_and
	mov	x1, rax
	mov	r0, x8
	call	__bit_not
	mov	r0, x7
	mov	r1, rax
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 1048576
	mov	r0, rax
	call	__bit_xor
	mov	x4, rax
.LBB0_6:
	mov	r1, 31
	mov	r0, x0
	call	__bit_shr
	mov	r1, 31
	mov	r0, rax
	call	__bit_shl
	mov	r1, 20
	mov	x0, rax
	mov	r0, x2
	call	__bit_shl
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	t0, rax
	mov	rax, x3
	mov	x8, [rsp]
	mov	x7, [rsp+4]
	mov	x6, [rsp+8]
	mov	x5, [rsp+12]
	mov	x4, [rsp+16]
	mov	x3, [rsp+20]
	mov	x2, [rsp+24]
	mov	x1, [rsp+28]
	mov	x0, [rsp+32]
add	rsp, 36
	ret
// -- End function
