#include "_ll_std"

// -- Begin function __muldi3
__muldi3:                               // @__muldi3
// %bb.0:
sub	rsp, 40
	mov	[rsp+36], x0
	mov	[rsp+32], x1
	mov	[rsp+28], x2
	mov	[rsp+24], x3
	mov	[rsp+20], x4
	mov	[rsp+16], x5
	mov	[rsp+12], x6
	mov	[rsp+8], x7
	mov	[rsp+4], x8
	mov	[rsp], x9
	mov	x1, r1
	mov	r1, 65535
	mov	x0, r3
	mov	x3, r2
	mov	x2, r0
	call	__bit_and
	mov	r1, 65535
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	x5, rax
	mov	x6, x5
	mul	x6, x4
	mov	r1, 16
	mov	r0, x6
	call	__bit_shr
	mov	r1, 65535
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 16
	mov	x6, rax
	mov	r0, x2
	call	__bit_shr
	mov	x8, rax
	mul	x5, x8
	add	x5, x7
	mov	r1, 16
	mov	r0, x5
	call	__bit_shr
	mov	r1, 65535
	mov	x7, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 16
	mov	x5, rax
	mov	r0, x3
	call	__bit_shr
	mov	x9, rax
	mul	x4, x9
	add	x4, x5
	mov	r1, 16
	mov	r0, x4
	call	__bit_shl
	mov	r0, rax
	mov	r1, x6
	call	__bit_or
	mov	r1, 16
	mov	x5, rax
	mov	r0, x4
	call	__bit_shr
	mul	x9, x8
	mul	x1, x3
	mul	x0, x2
	add	x0, x1
	add	x0, x9
	add	x0, x7
	add	x0, rax
	mov	rax, x5
	mov	t0, x0
	mov	x9, [rsp]
	mov	x8, [rsp+4]
	mov	x7, [rsp+8]
	mov	x6, [rsp+12]
	mov	x5, [rsp+16]
	mov	x4, [rsp+20]
	mov	x3, [rsp+24]
	mov	x2, [rsp+28]
	mov	x1, [rsp+32]
	mov	x0, [rsp+36]
add	rsp, 40
	ret
// -- End function
