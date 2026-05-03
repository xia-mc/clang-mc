#include "_ll_std"

// -- Begin function __divdi3
__divdi3:                               // @__divdi3
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
	mov	x0, r1
	mov	r1, 31
	mov	x1, r3
	mov	x2, r2
	mov	x3, r0
	mov	r0, x0
	call	__bit_shr
	mov	r1, 31
	mov	x4, rax
	mov	r0, x0
	call	__bit_sar
	mov	r1, 31
	mov	x5, rax
	mov	r0, x1
	call	__bit_shr
	mov	r1, 31
	mov	x6, rax
	mov	r0, x1
	call	__bit_sar
	mov	x7, rax
	mov	r0, x5
	mov	r1, x3
	call	__bit_xor
	mov	x3, rax
	mov	r0, x5
	mov	r1, x0
	call	__bit_xor
	mov	r3, 0
	mov	r0, x3
	mov	r1, rax
	mov	r2, x4
	call	__adddi3
	mov	x0, rax
	mov	x3, t0
	mov	r0, x7
	mov	r1, x2
	call	__bit_xor
	mov	x2, rax
	mov	r0, x7
	mov	r1, x1
	call	__bit_xor
	mov	r3, 0
	mov	r0, x2
	mov	r1, rax
	mov	r2, x6
	call	__adddi3
	mov	x1, rax
	mov	x2, t0
	mov	r0, x7
	mov	r1, x5
	call	__bit_xor
	mov	r4, 0
	mov	x4, rax
	mov	r0, x0
	mov	r1, x3
	mov	r2, x1
	mov	r3, x2
	call	__udivmoddi4
	mov	x0, t0
	mov	r0, rax
	mov	r1, x4
	call	__bit_xor
	mov	x1, rax
	mov	r0, x0
	mov	r1, x4
	call	__bit_xor
	mov	r0, x1
	mov	r1, rax
	mov	r2, x4
	mov	r3, x4
	call	__subdi3
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
