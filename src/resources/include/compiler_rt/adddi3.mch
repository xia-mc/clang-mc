#include "_ll_std"

// -- Begin function __adddi3
__adddi3:                               // @__adddi3
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x0, r2
	mov	x1, r0
	mov	x2, x0
	add	x2, x1
	mov	x3, r3
	mov	x4, r1
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x5, rax
	mov	r0, x2
	mov	r1, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
	add	x4, x3
	mov	r0, rax
	call	__bit_and
	add	x4, rax
	mov	rax, x2
	mov	t0, x4
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
