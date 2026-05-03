#include "_ll_std"

// -- Begin function __floatunsidf
__floatunsidf:                          // @__floatunsidf
// %bb.0:
sub	rsp, 28
	mov	[rsp+24], x0
	mov	[rsp+20], x1
	mov	[rsp+16], x2
	mov	[rsp+12], x3
	mov	[rsp+8], x4
	mov	[rsp+4], x5
	mov	[rsp], x6
	mov	rax, 0
	mov	t0, 0
	jz	r0, .LBB0_2
	jmp	.LBB0_1
.LBB0_1:
	mov	r1, 1
	mov	x0, r0
	call	__bit_shr
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x1, rax
	mov	r0, x1
	call	__bit_shr
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x1, rax
	mov	r0, x1
	call	__bit_shr
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x1, rax
	mov	r0, x1
	call	__bit_shr
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x1, rax
	mov	r0, x1
	call	__bit_shr
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x1, rax
	mov	r0, x1
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x1, rax
	mov	r1, 2
	mov	r0, x1
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	add	x2, rax
	mov	r1, 4
	mov	r0, x2
	call	__bit_shr
	add	x2, rax
	mov	r1, 252645135
	mov	r0, x2
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	r0, rax
	call	__bit_shr
	mov	x1, 32
	sub	x1, rax
	mov	r1, 31
	mov	x2, 32
	mov	r0, x1
	call	__bit_xor
	mov	x3, rax
	mov	r0, 52
	sub	r0, x3
	mov	r1, 31
	call	__bit_and
	mov	x4, rax
	mov	r1, 0
	sub	r1, x4
	mov	x5, 0
	mov	r0, x4
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, 20
	sub	r0, x3
	mov	r1, 31
	mov	x3, rax
	call	__bit_shr
	sub	x2, x4
	mov	r1, 31
	mov	x6, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x3
	mov	r0, rax
	call	__bit_and
	sub	x5, x6
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	x2, rax
	mov	r0, x0
	mov	r1, x4
	call	__bit_shl
	mov	x0, rax
	mov	r0, x5
	call	__bit_not
	mov	r0, x0
	mov	r1, rax
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	x2, rax
	mov	r0, x0
	mov	r1, x5
	call	__bit_and
	mov	r1, 1048576
	mov	x0, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, 1054
	sub	r0, x1
	mov	r1, 20
	mov	x1, rax
	call	__bit_shl
	mov	r2, 0
	mov	r0, x0
	mov	r1, x1
	mov	r3, rax
	call	__adddi3
.LBB0_2:
	mov	x6, [rsp]
	mov	x5, [rsp+4]
	mov	x4, [rsp+8]
	mov	x3, [rsp+12]
	mov	x2, [rsp+16]
	mov	x1, [rsp+20]
	mov	x0, [rsp+24]
add	rsp, 28
	ret
// -- End function
