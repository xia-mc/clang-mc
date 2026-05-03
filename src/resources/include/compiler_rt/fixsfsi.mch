#include "_ll_std"

// -- Begin function __fixsfsi
__fixsfsi:                              // @__fixsfsi
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r0
	mov	r0, -1
	mov	x3, 1
	jg	x0, r0, .LBB0_2
	jmp	.LBB0_1
.LBB0_1:
	mov	x3, -1
.LBB0_2:
	mov	r1, 23
	mov	r0, x0
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 8388607
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 8388608
	mov	r0, rax
	call	__bit_or
	mov	x2, rax
	mov	r0, 127
	mov	rax, 0
	jl	x1, r0, .LBB0_9
	jmp	.LBB0_3
.LBB0_3:
	mov	r0, x1
add	r0, -159
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483615
	jg	rax, r0, .LBB0_6
	jmp	.LBB0_4
.LBB0_4:
	mov	r0, -1
	mov	rax, 2147483647
	jg	x0, r0, .LBB0_9
	jmp	.LBB0_5
.LBB0_5:
	mov	rax, -2147483648
	jmp	.LBB0_9
.LBB0_6:
	mov	r0, 149
	jg	x1, r0, .LBB0_8
	jmp	.LBB0_7
.LBB0_7:
	mov	r1, 150
	sub	r1, x1
	mov	r0, x2
	call	__bit_shr
	mul	rax, x3
	jmp	.LBB0_9
.LBB0_8:
add	x1, -150
	mov	r0, x2
	mov	r1, x1
	call	__bit_shl
	mul	rax, x3
.LBB0_9:
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
