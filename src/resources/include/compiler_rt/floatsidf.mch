#include "_ll_std"

// -- Begin function __floatsidf
__floatsidf:                            // @__floatsidf
// %bb.0:
sub	rsp, 32
	mov	[rsp+28], x0
	mov	[rsp+24], x1
	mov	[rsp+20], x2
	mov	[rsp+16], x3
	mov	[rsp+12], x4
	mov	[rsp+8], x5
	mov	[rsp+4], x6
	mov	[rsp], x7
	mov	x1, 0
	mov	t0, 0
	jz	r0, .LBB0_6
	jmp	.LBB0_1
.LBB0_1:
	mov	r1, -1
	mov	x2, r0
	jg	r0, r1, .LBB0_3
	jmp	.LBB0_2
.LBB0_2:
	mov	x2, 0
	sub	x2, r0
.LBB0_3:
	mov	x0, -2147483648
	jl	r0, x1, .LBB0_5
	jmp	.LBB0_4
.LBB0_4:
	mov	x0, 0
.LBB0_5:
	mov	r1, 1
	mov	r0, x2
	call	__bit_shr
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x3, rax
	mov	r0, x3
	call	__bit_shr
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x3, rax
	mov	r0, x3
	call	__bit_shr
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x3, rax
	mov	r0, x3
	call	__bit_shr
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x3, rax
	mov	r0, x3
	call	__bit_shr
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x3, rax
	mov	r0, x3
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x3, rax
	mov	r1, 2
	mov	r0, x3
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	add	x4, rax
	mov	r1, 4
	mov	r0, x4
	call	__bit_shr
	add	x4, rax
	mov	r1, 252645135
	mov	r0, x4
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	r0, rax
	call	__bit_shr
	mov	x3, 32
	sub	x3, rax
	mov	r1, 31
	mov	x4, 32
	mov	r0, x3
	call	__bit_xor
	mov	x5, rax
	mov	r0, 52
	sub	r0, x5
	mov	r1, 31
	call	__bit_and
	mov	x6, rax
	mov	r1, 0
	sub	r1, x6
	mov	r0, x6
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, 20
	sub	r0, x5
	mov	r1, 31
	mov	x5, rax
	call	__bit_shr
	sub	x4, x6
	mov	r1, 31
	mov	x7, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x5
	mov	r0, rax
	call	__bit_and
	sub	x1, x7
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	x4, rax
	mov	r0, x2
	mov	r1, x6
	call	__bit_shl
	mov	x2, rax
	mov	r0, x1
	call	__bit_not
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	x4, rax
	mov	r0, x2
	mov	r1, x1
	call	__bit_and
	mov	r1, 1048576
	mov	x1, rax
	mov	r0, x4
	call	__bit_xor
	mov	r0, 1054
	sub	r0, x3
	mov	r1, 20
	mov	x2, rax
	call	__bit_shl
	mov	r2, 0
	mov	r0, x1
	mov	r1, x2
	mov	r3, rax
	call	__adddi3
	mov	x1, rax
	mov	r0, t0
	mov	r1, x0
	call	__bit_or
	mov	t0, rax
.LBB0_6:
	mov	rax, x1
	mov	x7, [rsp]
	mov	x6, [rsp+4]
	mov	x5, [rsp+8]
	mov	x4, [rsp+12]
	mov	x3, [rsp+16]
	mov	x2, [rsp+20]
	mov	x1, [rsp+24]
	mov	x0, [rsp+28]
add	rsp, 32
	ret
// -- End function
