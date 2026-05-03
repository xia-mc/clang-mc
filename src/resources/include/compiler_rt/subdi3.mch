#include "_ll_std"

// -- Begin function __subdi3
__subdi3:                               // @__subdi3
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x0, r2
	mov	x1, r1
	mov	x2, r0
	mov	x3, x2
	sub	x3, x0
	sub	x1, r3
	call	__bit_not
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x4, rax
	mov	r0, x2
	mov	r1, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	add	x1, rax
add	x1, 1
	mov	rax, x3
	mov	t0, x1
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
