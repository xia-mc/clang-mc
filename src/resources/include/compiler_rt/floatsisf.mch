#include "_ll_std"

// -- Begin function __floatsisf
__floatsisf:                            // @__floatsisf
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
	jz	r0, .LBB0_9
	jmp	.LBB0_1
.LBB0_1:
	mov	r1, -1
	mov	x1, r0
	jg	r0, r1, .LBB0_3
	jmp	.LBB0_2
.LBB0_2:
	mov	x1, 0
	sub	x1, r0
.LBB0_3:
	mov	r1, -2147483648
	mov	x6, -2147483648
	call	__bit_and
	mov	r1, 1
	mov	x0, rax
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
	mov	x2, rax
	mov	r1, 8
	mov	x3, 8
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
	mov	x4, rax
	mov	r0, x2
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
	mov	x2, 32
	sub	x2, rax
	mov	r1, 31
	mov	r0, x2
	call	__bit_xor
	mov	r1, 23
	jg	rax, r1, .LBB0_5
	jmp	.LBB0_4
.LBB0_4:
	sub	r1, rax
	mov	r0, x1
	call	__bit_shl
	mov	r1, 8388608
	mov	r0, rax
	call	__bit_xor
	mov	x1, rax
	jmp	.LBB0_8
.LBB0_5:
	sub	x3, x2
	mov	r0, x1
	mov	r1, x3
	call	__bit_shr
	mov	r1, 8388608
	mov	r0, rax
	call	__bit_xor
	mov	r1, x2
add	r1, 24
	mov	x4, rax
	mov	r0, x1
	call	__bit_shl
	mov	r1, 2147483647
	mov	x5, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483648
	sub	r1, x5
	mov	r0, rax
	call	__bit_and
	mov	r0, x1
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
	mov	x3, rax
	add	x3, x4
	mov	r1, 1
	mov	r0, x3
	call	__bit_and
	mov	x1, rax
	je	x5, x6, .LBB0_7
	jmp	.LBB0_6
.LBB0_6:
	mov	x1, 0
.LBB0_7:
	add	x1, x3
.LBB0_8:
	mov	r1, 23
	mov	r0, x2
	call	__bit_shl
	sub	x1, rax
add	x1, 1325400064
	mov	r0, x1
	mov	r1, x0
	call	__bit_or
.LBB0_9:
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
