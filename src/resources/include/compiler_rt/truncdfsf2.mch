#include "_ll_std"

// -- Begin function __truncdfsf2
__truncdfsf2:                           // @__truncdfsf2
// %bb.0:
sub	rsp, 48
	mov	[rsp+44], x0
	mov	[rsp+40], x1
	mov	[rsp+36], x2
	mov	[rsp+32], x3
	mov	[rsp+28], x4
	mov	[rsp+24], x5
	mov	[rsp+20], x6
	mov	[rsp+16], x7
	mov	[rsp+12], x8
	mov	[rsp+8], x9
	mov	[rsp+4], x10
	mov	[rsp], x11
	mov	x0, r1
	mov	r1, 20
	mov	x1, r0
	mov	r0, x0
	call	__bit_shr
	mov	r1, 2047
	mov	r0, rax
	call	__bit_and
	mov	r1, 1048575
	mov	x3, rax
	mov	r0, x0
	call	__bit_and
	mov	r0, x3
add	r0, -897
	mov	r1, -2147483648
	mov	x2, rax
	call	__bit_xor
	mov	r0, -2147483395
	jg	rax, r0, .LBB0_10
	jmp	.LBB0_1
.LBB0_1:
	mov	r1, 29
	mov	r0, x1
	call	__bit_shr
	mov	r1, 3
	mov	x4, rax
	mov	r0, x2
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 536870911
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, -1879048191
	jl	rax, r0, .LBB0_3
	jmp	.LBB0_2
.LBB0_2:
add	x2, 1
	jmp	.LBB0_5
.LBB0_3:
	mov	r0, 268435456
	jne	x1, r0, .LBB0_5
	jmp	.LBB0_4
.LBB0_4:
	mov	r1, 1
	mov	r0, x2
	call	__bit_and
	add	x2, rax
.LBB0_5:
	mov	r0, 8388607
	mov	x4, 0
	jg	x2, r0, .LBB0_7
	jmp	.LBB0_6
.LBB0_6:
	mov	x4, x2
.LBB0_7:
	mov	r1, -2147483648
	mov	x6, -895
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2139095041
	jg	rax, r0, .LBB0_9
	jmp	.LBB0_8
.LBB0_8:
	mov	x6, -896
.LBB0_9:
	add	x6, x3
	jmp	.LBB0_28
.LBB0_10:
	mov	r0, x1
	mov	r1, x2
	call	__bit_or
	jz	rax, .LBB0_13
	jmp	.LBB0_11
.LBB0_11:
	mov	r0, 2047
	jne	x3, r0, .LBB0_13
	jmp	.LBB0_12
.LBB0_12:
	mov	r1, 29
	mov	r0, x1
	call	__bit_shr
	mov	r1, 3
	mov	x1, rax
	mov	r0, x2
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 4194304
	mov	r0, rax
	call	__bit_or
	mov	x4, rax
	mov	x6, 255
	jmp	.LBB0_28
.LBB0_13:
	mov	x6, 255
	mov	r0, 1150
	mov	x4, 0
	jg	x3, r0, .LBB0_28
	jmp	.LBB0_14
.LBB0_14:
	mov	r0, x3
	call	__bit_not
add	rax, 1
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r1, 1048576
	mov	x4, rax
	mov	r0, x2
	call	__bit_or
	mov	r0, 896
	jz	x3, .LBB0_16
	jmp	.LBB0_15
.LBB0_15:
	mov	r0, 897
.LBB0_16:
	jnz	x4, .LBB0_18
	jmp	.LBB0_17
.LBB0_17:
	mov	x2, rax
.LBB0_18:
	mov	x5, r0
	sub	x5, x3
	mov	x4, 0
	mov	r1, 52
	mov	x6, 0
	jg	x5, r1, .LBB0_28
	jmp	.LBB0_19
.LBB0_19:
	je	r0, x3, .LBB0_21
	jmp	.LBB0_20
.LBB0_20:
	mov	r0, 64
	sub	r0, x5
	mov	r1, 31
	call	__bit_and
	mov	x3, rax
	mov	r1, 0
	sub	r1, x3
	mov	r0, x3
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x7, rax
	mov	r0, 32
	sub	r0, x5
	mov	r1, 31
	mov	x8, 32
	call	__bit_shr
	mov	x9, rax
	mov	r0, x1
	mov	r1, x3
	call	__bit_shl
	mov	x10, 0
	sub	x10, x9
	mov	x9, rax
	mov	r0, x10
	call	__bit_not
	mov	r0, x9
	mov	r1, rax
	call	__bit_and
	mov	x11, rax
	mov	r0, x2
	mov	r1, x3
	call	__bit_shl
	sub	x8, x3
	mov	r1, 31
	mov	x3, rax
	mov	r0, x8
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_shr
	sub	x6, x7
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x10
	call	__bit_and
	mov	r0, rax
	mov	r1, x11
	call	__bit_or
	mov	x3, rax
	mov	r0, x9
	mov	r1, x10
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	x3, rax
	mov	r0, x3
	call	__bit_not
add	rax, 1
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x6, rax
.LBB0_21:
	mov	r1, 31
	mov	r0, x5
	call	__bit_and
	mov	x3, rax
	mov	r1, 0
	sub	r1, x3
	mov	r0, x3
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	x5, -32
	mov	r1, 31
	mov	x7, rax
	mov	r0, x5
	call	__bit_shr
	mov	x5, rax
	mov	r0, x2
	mov	r1, x3
	call	__bit_shr
	mov	x8, 0
	sub	x8, x5
	mov	x5, rax
	mov	r0, x8
	call	__bit_not
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	x9, rax
	mov	r0, x1
	mov	r1, x3
	call	__bit_shr
	mov	r0, 32
	sub	r0, x3
	mov	r1, 31
	mov	x1, rax
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_shl
	sub	x4, x7
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x8
	call	__bit_and
	mov	r0, rax
	mov	r1, x9
	call	__bit_or
	mov	x2, rax
	mov	r0, x5
	mov	r1, x8
	call	__bit_and
	mov	r1, 1
	mov	x1, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 29
	mov	x3, rax
	mov	r0, x2
	call	__bit_shr
	mov	r1, 3
	mov	x4, rax
	mov	r0, x1
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 536870911
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, -1879048191
	jl	rax, r0, .LBB0_23
	jmp	.LBB0_22
.LBB0_22:
add	x1, 1
	jmp	.LBB0_25
.LBB0_23:
	mov	r0, 268435456
	jne	x2, r0, .LBB0_25
	jmp	.LBB0_24
.LBB0_24:
	mov	r1, 1
	mov	r0, x1
	call	__bit_and
	add	x1, rax
.LBB0_25:
	mov	r1, 8388608
	mov	r0, x1
	call	__bit_xor
	mov	x2, 8388607
	mov	x4, rax
	jg	x1, x2, .LBB0_27
	jmp	.LBB0_26
.LBB0_26:
	mov	x4, x1
.LBB0_27:
	mov	r1, -8388608
	mov	r0, x1
	call	__bit_and
	mov	r1, 8388607
	mov	x3, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x2, x1
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, x3
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
	mov	x6, rax
.LBB0_28:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_and
	mov	r1, 23
	mov	x0, rax
	mov	r0, x6
	call	__bit_shl
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	x11, [rsp]
	mov	x10, [rsp+4]
	mov	x9, [rsp+8]
	mov	x8, [rsp+12]
	mov	x7, [rsp+16]
	mov	x6, [rsp+20]
	mov	x5, [rsp+24]
	mov	x4, [rsp+28]
	mov	x3, [rsp+32]
	mov	x2, [rsp+36]
	mov	x1, [rsp+40]
	mov	x0, [rsp+44]
add	rsp, 48
	ret
// -- End function
