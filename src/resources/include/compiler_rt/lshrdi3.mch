#include "_ll_std"

// -- Begin function __lshrdi3
__lshrdi3:                              // @__lshrdi3
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r1
	mov	r1, 32
	mov	x2, r2
	mov	x1, r0
	mov	r0, x2
	call	__bit_and
	jz	rax, .LBB0_2
	jmp	.LBB0_1
.LBB0_1:
add	x2, -32
	mov	r0, x0
	mov	r1, x2
	call	__bit_shr
	mov	x1, rax
	mov	x0, 0
	jmp	.LBB0_4
.LBB0_2:
	jz	x2, .LBB0_5
	jmp	.LBB0_3
.LBB0_3:
	mov	r0, x0
	mov	r1, x2
	call	__bit_shr
	mov	r1, 32
	sub	r1, x2
	mov	x3, rax
	mov	r0, x0
	call	__bit_shl
	mov	x0, rax
	mov	r0, x1
	mov	r1, x2
	call	__bit_shr
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	x1, rax
	mov	x0, x3
.LBB0_4:
.LBB0_5:
	mov	rax, x1
	mov	t0, x0
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
