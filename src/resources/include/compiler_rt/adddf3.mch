#include "_ll_std"

// -- Begin function __adddf3
__adddf3:                               // @__adddf3
// %bb.0:
sub	rsp, 64
	mov	[rsp+60], x0
	mov	[rsp+56], x1
	mov	[rsp+52], x2
	mov	[rsp+48], x3
	mov	[rsp+44], x4
	mov	[rsp+40], x5
	mov	[rsp+36], x6
	mov	[rsp+32], x7
	mov	[rsp+28], x8
	mov	[rsp+24], x9
	mov	[rsp+20], x10
	mov	[rsp+16], x11
	mov	[rsp+12], x12
	mov	[rsp+8], x13
	mov	[rsp+4], x14
	mov	[rsp], x15
	mov	x0, r1
	mov	r1, 2147483647
	mov	x6, r3
	mov	x2, r2
	mov	x4, r0
	mov	x3, x4
	mov	x1, x6
	mov	r0, x0
	call	__bit_and
	mov	r1, 2147483647
	mov	x5, rax
	mov	r0, x6
	call	__bit_and
	mov	x7, rax
	mov	r2, 0
	mov	r3, -2146435072
	mov	x8, -2146435072
	mov	r0, x4
	mov	r1, x5
	call	__adddi3
	mov	x9, rax
	mov	x10, t0
	mov	r0, x10
	call	__bit_not
	mov	r1, -2146435072
	mov	r0, rax
	call	__bit_and
	mov	r1, -2146435072
	mov	x11, rax
	mov	r0, x10
	call	__bit_xor
	mov	x12, rax
	mov	r0, x12
	call	__bit_not
add	x10, 2146435072
	mov	x13, rax
	mov	r0, x13
	mov	r1, x10
	call	__bit_and
	mov	r0, x11
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x10, rax
	mov	r0, x9
	call	__bit_not
add	rax, 1
	mov	r0, x9
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	x9, rax
add	x13, 1
	sub	x9, x10
	mov	r0, x12
	mov	r1, x13
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x9
	call	__bit_and
	mov	x11, rax
	mov	r2, 0
	mov	r3, -2146435072
	add	x11, x10
	mov	r0, x2
	mov	r1, x7
	call	__adddi3
	mov	x9, rax
	mov	x10, t0
	jnz	x11, .LBB0_2
	jmp	.LBB0_1
.LBB0_1:
	mov	r1, -2146435072
	mov	r0, x10
	call	__bit_xor
	mov	x11, rax
	mov	r0, x11
	call	__bit_not
	mov	x12, rax
	mov	r1, x12
add	r1, 1
	mov	r0, x11
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, 2146435071
	mov	x11, rax
	mov	r0, x10
	call	__bit_and
	sub	x8, x10
	mov	x10, rax
	mov	r0, x12
	mov	r1, x8
	call	__bit_and
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x8, rax
	mov	r0, x9
	call	__bit_not
add	rax, 1
	mov	r0, x9
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	sub	rax, x8
add	x11, 1
	mov	r0, x11
	mov	r1, rax
	call	__bit_and
	add	rax, x8
	jnz	rax, .LBB0_13
	jmp	.LBB0_2
.LBB0_2:
	mov	r1, 2146435072
	mov	r0, x5
	call	__bit_xor
	mov	x8, rax
	mov	r0, x8
	call	__bit_not
add	rax, 1
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x5
	call	__bit_xor
	mov	x9, rax
	mov	r0, x9
	call	__bit_not
	mov	r1, -1048576
	mov	r0, rax
	call	__bit_and
	mov	r1, -1048576
	mov	x10, rax
	mov	r0, x9
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x9, 1048576
	mov	r0, rax
	mov	r1, x9
	call	__bit_and
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x9, rax
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
	sub	rax, x9
add	x8, 1
	mov	r0, x8
	mov	r1, rax
	call	__bit_and
	add	rax, x9
	jnz	rax, .LBB0_4
	jmp	.LBB0_3
.LBB0_3:
	mov	r1, 524288
	mov	r0, x0
	call	__bit_or
	mov	x6, rax
	mov	rax, x4
	jmp	.LBB0_44
.LBB0_4:
	mov	r1, 2146435072
	mov	r0, x7
	call	__bit_xor
	mov	x8, rax
	mov	r0, x8
	call	__bit_not
add	rax, 1
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x7
	call	__bit_xor
	mov	x9, rax
	mov	r0, x9
	call	__bit_not
	mov	r1, -1048576
	mov	r0, rax
	call	__bit_and
	mov	r1, -1048576
	mov	x10, rax
	mov	r0, x9
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x9, 1048576
	mov	r0, rax
	mov	r1, x9
	call	__bit_and
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x9, rax
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	sub	rax, x9
add	x8, 1
	mov	r0, x8
	mov	r1, rax
	call	__bit_and
	add	rax, x9
	jnz	rax, .LBB0_6
	jmp	.LBB0_5
.LBB0_5:
	mov	r1, 524288
	mov	r0, x1
	call	__bit_or
	mov	x6, rax
	mov	rax, x2
	jmp	.LBB0_44
.LBB0_6:
	mov	r1, 2146435072
	mov	r0, x5
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	jnz	rax, .LBB0_8
	jmp	.LBB0_7
.LBB0_7:
	mov	r0, x2
	mov	r1, x3
	call	__bit_xor
	mov	x2, rax
	mov	r0, x1
	mov	r1, x0
	call	__bit_xor
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
add	rax, 1
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	x1, rax
add	x1, 1
	mov	r1, 2146959360
	sub	r1, x0
	mov	r0, x1
	call	__bit_and
	mov	x6, rax
	mov	r1, 0
	sub	r1, x4
	add	x6, x0
	mov	r0, x1
	call	__bit_and
	add	rax, x4
	jmp	.LBB0_44
.LBB0_8:
	mov	r1, 2146435072
	mov	r0, x7
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	rax, x2
	jz	r0, .LBB0_44
	jmp	.LBB0_9
.LBB0_9:
	mov	r0, x3
	mov	r1, x5
	call	__bit_or
	jnz	rax, .LBB0_12
	jmp	.LBB0_10
.LBB0_10:
	mov	r0, x2
	mov	r1, x7
	call	__bit_or
	mov	r0, rax
	mov	rax, x2
	jnz	r0, .LBB0_44
	jmp	.LBB0_11
.LBB0_11:
	mov	r0, x2
	mov	r1, x3
	call	__bit_and
	mov	x2, rax
	mov	r0, x1
	mov	r1, x0
	call	__bit_and
	mov	x6, rax
	mov	rax, x2
	jmp	.LBB0_44
.LBB0_12:
	mov	r0, x2
	mov	r1, x7
	call	__bit_or
	mov	r0, rax
	mov	rax, x4
	mov	x6, x0
	jz	r0, .LBB0_44
	jmp	.LBB0_13
.LBB0_13:
	mov	r0, x5
	call	__bit_not
	mov	r0, rax
	mov	r1, x7
	call	__bit_and
	mov	x6, rax
	mov	r0, x5
	mov	r1, x7
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x5
	sub	r1, x7
	mov	r0, rax
	call	__bit_and
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x8, rax
	mov	r0, x3
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	x6, rax
	mov	r0, x3
	mov	r1, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x4, x2
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	x9, x6
	sub	x9, x8
	mov	r0, x7
	mov	r1, x5
	call	__bit_xor
	mov	x8, rax
	mov	r0, x8
	call	__bit_not
add	rax, 1
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	x8, rax
add	x8, 1
	mov	r0, x8
	mov	r1, x9
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x7
	call	__bit_xor
	mov	x10, rax
	mov	r0, x9
	mov	r1, x10
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x9
	sub	r1, x10
	mov	r0, rax
	call	__bit_and
	mov	x11, rax
	mov	r0, x9
	call	__bit_not
	mov	r0, rax
	mov	r1, x10
	call	__bit_and
	mov	r0, rax
	mov	r1, x11
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x9, rax
	sub	x6, x9
	mov	r0, x8
	mov	r1, x6
	call	__bit_and
	add	rax, x9
	mov	x6, x3
	mov	x8, x0
	jnz	rax, .LBB0_15
	jmp	.LBB0_14
.LBB0_14:
	mov	x6, x2
	mov	x8, x1
.LBB0_15:
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x7
	call	__bit_xor
	mov	x10, rax
	mov	r0, x9
	mov	r1, x10
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x9
	sub	r1, x10
	mov	r0, rax
	call	__bit_and
	mov	x11, rax
	mov	r0, x9
	call	__bit_not
	mov	r0, rax
	mov	r1, x10
	call	__bit_and
	mov	r0, rax
	mov	r1, x11
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x9, rax
	mov	r0, x3
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	x10, rax
	mov	r0, x3
	mov	r1, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	sub	x4, x9
	mov	r0, x7
	mov	r1, x5
	call	__bit_xor
	mov	x5, rax
	mov	r0, x5
	call	__bit_not
add	rax, 1
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	add	rax, x9
	mov	x7, x2
	mov	x5, x1
	jnz	rax, .LBB0_17
	jmp	.LBB0_16
.LBB0_16:
	mov	x7, x3
	mov	x5, x0
.LBB0_17:
	mov	r1, 20
	mov	r0, x5
	call	__bit_shr
	mov	r1, 2047
	mov	r0, rax
	call	__bit_and
	mov	r1, 20
	mov	x4, rax
	mov	r0, x8
	call	__bit_shr
	mov	r1, 2047
	mov	r0, rax
	call	__bit_and
	mov	r1, 1048575
	mov	x10, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 1048575
	mov	x9, rax
	mov	r0, x8
	call	__bit_and
	mov	x8, rax
	jnz	x4, .LBB0_19
	jmp	.LBB0_18
.LBB0_18:
	mov	r1, 1
	mov	r0, x7
	call	__bit_shr
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x4, rax
	mov	r0, x4
	call	__bit_shr
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x4, rax
	mov	r0, x4
	call	__bit_shr
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x4, rax
	mov	r0, x4
	call	__bit_shr
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x4, rax
	mov	r0, x4
	call	__bit_shr
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x4, rax
	mov	r0, x4
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x4, rax
	mov	r1, 2
	mov	r0, x4
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x11, rax
	mov	r0, x4
	call	__bit_and
	add	x11, rax
	mov	r1, 4
	mov	r0, x11
	call	__bit_shr
	add	x11, rax
	mov	r1, 252645135
	mov	r0, x11
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	r0, rax
	call	__bit_shr
	mov	x13, 64
	mov	r1, 1
	sub	x13, rax
	mov	r0, x9
	call	__bit_shr
	mov	r0, x9
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x4, rax
	mov	r0, x4
	call	__bit_shr
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x4, rax
	mov	r0, x4
	call	__bit_shr
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x4, rax
	mov	r0, x4
	call	__bit_shr
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x4, rax
	mov	r0, x4
	call	__bit_shr
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x4, rax
	mov	r0, x4
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x4, rax
	mov	r1, 2
	mov	r0, x4
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x11, rax
	mov	r0, x4
	call	__bit_and
	add	x11, rax
	mov	r1, 4
	mov	r0, x11
	call	__bit_shr
	add	x11, rax
	mov	r1, 252645135
	mov	r0, x11
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	r0, rax
	call	__bit_shr
	add	rax, x13
	mov	x12, 32
	mov	x4, 32
	sub	x4, rax
	mov	r0, x9
	call	__bit_not
add	rax, 1
	mov	r0, x9
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	x11, rax
	add	x11, x13
	mov	r0, x11
add	r0, -11
	mov	r1, 31
	call	__bit_and
	mov	x13, rax
	mov	r1, 0
	sub	r1, x13
	mov	x4, 0
	mov	r0, x13
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, x11
add	r0, -43
	mov	r1, 31
	mov	x14, rax
	call	__bit_shr
	sub	x12, x13
	mov	r1, 31
	mov	x15, rax
	mov	r0, x12
	call	__bit_and
	mov	r0, x7
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x14
	mov	r0, rax
	call	__bit_and
	mov	x12, rax
	mov	r0, x9
	mov	r1, x13
	call	__bit_shl
	mov	r0, rax
	mov	r1, x12
	call	__bit_or
	sub	x4, x15
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	x9, rax
	mov	r0, x7
	mov	r1, x13
	call	__bit_shl
	mov	x7, rax
	mov	r0, x4
	call	__bit_not
	mov	r0, x7
	mov	r1, rax
	call	__bit_and
	mov	r0, x9
	mov	r1, rax
	call	__bit_or
	mov	x9, rax
	mov	r0, x7
	mov	r1, x4
	call	__bit_and
	mov	x7, rax
	mov	x4, 12
	sub	x4, x11
.LBB0_19:
	jnz	x10, .LBB0_21
	jmp	.LBB0_20
.LBB0_20:
	mov	r1, 1
	mov	r0, x6
	call	__bit_shr
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x10, rax
	mov	r0, x10
	call	__bit_shr
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x10, rax
	mov	r0, x10
	call	__bit_shr
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x10, rax
	mov	r0, x10
	call	__bit_shr
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x10, rax
	mov	r0, x10
	call	__bit_shr
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x10, rax
	mov	r0, x10
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x10, rax
	mov	r1, 2
	mov	r0, x10
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x11, rax
	mov	r0, x10
	call	__bit_and
	add	x11, rax
	mov	r1, 4
	mov	r0, x11
	call	__bit_shr
	add	x11, rax
	mov	r1, 252645135
	mov	r0, x11
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	r0, rax
	call	__bit_shr
	mov	x13, 64
	mov	r1, 1
	sub	x13, rax
	mov	r0, x8
	call	__bit_shr
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x10, rax
	mov	r0, x10
	call	__bit_shr
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x10, rax
	mov	r0, x10
	call	__bit_shr
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x10, rax
	mov	r0, x10
	call	__bit_shr
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x10, rax
	mov	r0, x10
	call	__bit_shr
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x10, rax
	mov	r0, x10
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x10, rax
	mov	r1, 2
	mov	r0, x10
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x11, rax
	mov	r0, x10
	call	__bit_and
	add	x11, rax
	mov	r1, 4
	mov	r0, x11
	call	__bit_shr
	add	x11, rax
	mov	r1, 252645135
	mov	r0, x11
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	r0, rax
	call	__bit_shr
	add	rax, x13
	mov	x12, 32
	mov	x10, 32
	sub	x10, rax
	mov	r0, x8
	call	__bit_not
add	rax, 1
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x10
	call	__bit_and
	mov	x11, rax
	add	x11, x13
	mov	r0, x11
add	r0, -11
	mov	r1, 31
	call	__bit_and
	mov	x13, rax
	mov	r1, 0
	sub	r1, x13
	mov	x10, 0
	mov	r0, x13
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, x11
add	r0, -43
	mov	r1, 31
	mov	x14, rax
	call	__bit_shr
	sub	x12, x13
	mov	r1, 31
	mov	x15, rax
	mov	r0, x12
	call	__bit_and
	mov	r0, x6
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x14
	mov	r0, rax
	call	__bit_and
	mov	x12, rax
	mov	r0, x8
	mov	r1, x13
	call	__bit_shl
	mov	r0, rax
	mov	r1, x12
	call	__bit_or
	sub	x10, x15
	mov	r0, rax
	mov	r1, x10
	call	__bit_and
	mov	x8, rax
	mov	r0, x6
	mov	r1, x13
	call	__bit_shl
	mov	x6, rax
	mov	r0, x10
	call	__bit_not
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	x8, rax
	mov	r0, x6
	mov	r1, x10
	call	__bit_and
	mov	x6, rax
	mov	x10, 12
	sub	x10, x11
.LBB0_21:
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_and
	mov	x5, rax
	mov	r0, x2
	mov	r1, x3
	call	__bit_xor
	mov	r0, x1
	mov	r1, x0
	call	__bit_xor
	mov	r1, 3
	mov	x0, rax
	mov	r0, x7
	call	__bit_shl
	mov	r1, 29
	mov	x2, rax
	mov	r0, x7
	call	__bit_shr
	mov	r1, 3
	mov	x1, rax
	mov	r0, x9
	call	__bit_shl
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r1, 8388608
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	x3, rax
	mov	r0, x6
	call	__bit_shl
	mov	r1, 29
	mov	x1, rax
	mov	r0, x6
	call	__bit_shr
	mov	r1, 3
	mov	x6, rax
	mov	r0, x8
	call	__bit_shl
	mov	r0, rax
	mov	r1, x6
	call	__bit_or
	mov	r1, 8388608
	mov	r0, rax
	call	__bit_or
	mov	x6, rax
	mov	x7, x1
	mov	x11, x6
	je	x4, x10, .LBB0_24
	jmp	.LBB0_22
.LBB0_22:
	mov	x8, x4
	sub	x8, x10
	mov	x11, 0
	mov	r1, -2147483648
	mov	x7, 1
	mov	r0, x8
	call	__bit_xor
	mov	r0, -2147483585
	jg	rax, r0, .LBB0_24
	jmp	.LBB0_23
.LBB0_23:
	mov	r0, 64
	sub	r0, x8
	mov	r1, 31
	call	__bit_and
	mov	x10, rax
	mov	r1, 0
	sub	r1, x10
	mov	x7, 0
	mov	r0, x10
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x11, rax
	mov	r0, 32
	sub	r0, x8
	mov	r1, 31
	mov	x9, 32
	call	__bit_shr
	mov	x12, rax
	mov	r0, x1
	mov	r1, x10
	call	__bit_shl
	mov	x13, 0
	sub	x13, x12
	mov	x12, rax
	mov	r0, x13
	call	__bit_not
	mov	r0, x12
	mov	r1, rax
	call	__bit_and
	mov	x14, rax
	mov	r0, x6
	mov	r1, x10
	call	__bit_shl
	mov	r0, 32
	sub	r0, x10
	mov	r1, 31
	mov	x10, rax
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x11
	mov	r0, rax
	call	__bit_and
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x13
	call	__bit_and
	mov	r0, rax
	mov	r1, x14
	call	__bit_or
	mov	x10, rax
	mov	r0, x12
	mov	r1, x13
	call	__bit_and
	mov	r0, rax
	mov	r1, x10
	call	__bit_or
	mov	x10, rax
	mov	r0, x10
	call	__bit_not
add	rax, 1
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, x8
add	r0, -32
	mov	r1, 31
	mov	x10, rax
	call	__bit_shr
	mov	r1, 31
	mov	x11, rax
	mov	r0, x8
	call	__bit_and
	mov	x8, rax
	mov	r0, x6
	mov	r1, x8
	call	__bit_shr
	mov	x12, 0
	sub	x12, x11
	mov	x13, rax
	mov	r0, x13
	mov	r1, x12
	call	__bit_and
	mov	r1, 0
	sub	r1, x8
	mov	x11, rax
	mov	r0, x8
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x14, rax
	mov	r0, x12
	call	__bit_not
	mov	r0, x13
	mov	r1, rax
	call	__bit_and
	mov	x13, rax
	mov	r0, x1
	mov	r1, x8
	call	__bit_shr
	sub	x9, x8
	mov	r1, 31
	mov	x1, rax
	mov	r0, x9
	call	__bit_and
	mov	r0, x6
	mov	r1, rax
	call	__bit_shl
	sub	x7, x14
	mov	r0, rax
	mov	r1, x7
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x12
	call	__bit_and
	mov	r0, rax
	mov	r1, x13
	call	__bit_or
	mov	r1, 1
	mov	x1, rax
	mov	r0, x10
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	x7, rax
.LBB0_24:
	mov	r0, -1
	jg	x0, r0, .LBB0_28
	jmp	.LBB0_25
.LBB0_25:
	mov	r0, x2
	mov	r1, x3
	mov	r2, x7
	mov	r3, x11
	call	__subdi3
	mov	x1, rax
	mov	x0, t0
	mov	r0, x2
	mov	r1, x7
	call	__bit_xor
	mov	x2, rax
	mov	r0, x3
	mov	r1, x11
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	rax, 0
	mov	x6, 0
	jz	r0, .LBB0_44
	jmp	.LBB0_26
.LBB0_26:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2139095041
	jg	rax, r0, .LBB0_30
	jmp	.LBB0_27
.LBB0_27:
	mov	r1, 1
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
	mov	r1, 8
	mov	x2, rax
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
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	add	x3, rax
	mov	r1, 4
	mov	r0, x3
	call	__bit_shr
	add	x3, rax
	mov	r1, 252645135
	mov	r0, x3
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	r0, rax
	call	__bit_shr
	mov	x2, 64
	mov	r1, 1
	sub	x2, rax
	mov	r0, x0
	call	__bit_shr
	mov	r0, x0
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
	mov	x6, rax
	mov	r0, x3
	call	__bit_and
	add	x6, rax
	mov	r1, 4
	mov	r0, x6
	call	__bit_shr
	add	x6, rax
	mov	r1, 252645135
	mov	r0, x6
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	r0, rax
	call	__bit_shr
	add	rax, x2
	mov	x7, 32
	mov	x3, 32
	sub	x3, rax
	mov	r0, x0
	call	__bit_not
add	rax, 1
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	add	x2, rax
	mov	x3, x2
add	x3, -8
	mov	r1, 31
	mov	r0, x3
	call	__bit_and
	mov	x8, rax
	mov	r1, 0
	sub	r1, x8
	mov	x6, 0
	mov	r0, x8
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	x2, -40
	mov	r1, 31
	mov	x9, rax
	mov	r0, x2
	call	__bit_shr
	sub	x7, x8
	mov	r1, 31
	mov	x2, rax
	mov	r0, x7
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x9
	mov	r0, rax
	call	__bit_and
	mov	x7, rax
	mov	r0, x0
	mov	r1, x8
	call	__bit_shl
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	sub	x6, x2
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	x0, rax
	mov	r0, x1
	mov	r1, x8
	call	__bit_shl
	mov	x1, rax
	mov	r0, x6
	call	__bit_not
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	x0, rax
	mov	r0, x1
	mov	r1, x6
	call	__bit_and
	mov	x1, rax
	sub	x4, x3
	jmp	.LBB0_32
.LBB0_28:
	mov	r0, x7
	mov	r1, x11
	mov	r2, x2
	mov	r3, x3
	call	__adddi3
	mov	r1, 16777216
	mov	x1, rax
	mov	x0, t0
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB0_30
	jmp	.LBB0_29
.LBB0_29:
	mov	r1, 1
	mov	r0, x0
	call	__bit_shr
	mov	r1, 1
	mov	x2, rax
	mov	r0, x1
	call	__bit_shr
	mov	r1, 31
	mov	x1, rax
	mov	r0, x0
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x0, rax
	mov	r0, x7
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	x1, rax
add	x4, 1
	mov	x0, x2
.LBB0_30:
	mov	r0, 2047
	jl	x4, r0, .LBB0_32
	jmp	.LBB0_31
.LBB0_31:
	mov	r1, 2146435072
	mov	r0, x5
	call	__bit_or
	mov	x6, rax
	mov	rax, 0
	jmp	.LBB0_44
.LBB0_32:
	mov	x2, 0
	jg	x4, x2, .LBB0_34
	jmp	.LBB0_33
.LBB0_33:
	mov	x3, 1
	mov	r0, x4
add	r0, 63
	mov	r1, 31
	sub	x3, x4
	call	__bit_and
	mov	x6, rax
	mov	r1, 0
	sub	r1, x6
	mov	r0, x6
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, x4
add	r0, 31
	mov	r1, 31
	mov	x7, rax
	call	__bit_shr
	mov	x8, rax
	mov	r0, x1
	mov	r1, x6
	call	__bit_shl
	mov	x9, 0
	sub	x9, x8
	mov	x8, rax
	mov	r0, x9
	call	__bit_not
	mov	r0, x8
	mov	r1, rax
	call	__bit_and
	mov	x10, rax
	mov	r0, x0
	mov	r1, x6
	call	__bit_shl
	mov	x11, rax
	mov	r0, 32
	sub	r0, x6
	mov	r1, 31
	mov	x6, 32
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x7
	mov	r0, rax
	call	__bit_and
	mov	r0, x11
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x9
	call	__bit_and
	mov	r0, rax
	mov	r1, x10
	call	__bit_or
	mov	x7, rax
	mov	r0, x8
	mov	r1, x9
	call	__bit_and
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	mov	x7, rax
	mov	r0, x7
	call	__bit_not
add	rax, 1
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, -31
	sub	r0, x4
	mov	r1, 31
	mov	x4, rax
	call	__bit_shr
	mov	r1, 31
	mov	x7, rax
	mov	r0, x3
	call	__bit_and
	mov	x3, rax
	mov	r0, x0
	mov	r1, x3
	call	__bit_shr
	mov	x8, 0
	sub	x8, x7
	mov	x7, rax
	mov	r0, x7
	mov	r1, x8
	call	__bit_and
	mov	r1, 0
	sub	r1, x3
	mov	x9, rax
	mov	r0, x3
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x10, rax
	mov	r0, x8
	call	__bit_not
	mov	r0, x7
	mov	r1, rax
	call	__bit_and
	mov	x7, rax
	mov	r0, x1
	mov	r1, x3
	call	__bit_shr
	sub	x6, x3
	mov	r1, 31
	mov	x1, rax
	mov	r0, x6
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_shl
	sub	x2, x10
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x8
	call	__bit_and
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	mov	r1, 1
	mov	x0, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	x1, rax
	mov	x0, x9
	mov	x4, 0
.LBB0_34:
	mov	r1, 7
	mov	r0, x1
	call	__bit_and
	mov	r1, 3
	mov	x2, rax
	mov	r0, x1
	call	__bit_shr
	mov	r1, 29
	mov	x1, rax
	mov	r0, x0
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	x1, rax
	mov	r0, x0
	call	__bit_shr
	mov	r1, 1048575
	mov	r0, rax
	call	__bit_and
	mov	r1, 20
	mov	x0, rax
	mov	r0, x4
	call	__bit_shl
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r0, rax
	mov	r1, x5
	call	__bit_or
	mov	x0, rax
	call	__fe_getround
	mov	r1, 2
	mov	r0, rax
	je	r0, r1, .LBB0_40
	jmp	.LBB0_35
.LBB0_35:
	mov	r1, 1
	je	r0, r1, .LBB0_39
	jmp	.LBB0_36
.LBB0_36:
	mov	rax, x1
	mov	x6, x0
	jnz	r0, .LBB0_41
	jmp	.LBB0_37
.LBB0_37:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r1, 2147483643
	mov	x3, rax
	mov	r0, x3
	call	__bit_and
	mov	x4, rax
	mov	r1, -2147483644
	mov	x5, -2147483644
	mov	r0, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x5, x3
	mov	r0, rax
	mov	r1, x5
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, 0
	mov	r0, x1
	mov	r1, x0
	mov	r2, rax
	call	__adddi3
	mov	r0, 4
	mov	x6, t0
	jne	x2, r0, .LBB0_41
	jmp	.LBB0_38
.LBB0_38:
	mov	r1, 1
	mov	r0, x1
	call	__bit_and
	mov	r3, 0
	mov	r0, x1
	mov	r1, x0
	mov	r2, rax
	call	__adddi3
	mov	x6, t0
	jmp	.LBB0_42
.LBB0_39:
	mov	r0, x5
	call	__bit_not
add	rax, 1
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x3, rax
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, 0
	mov	r0, x1
	mov	r1, x0
	mov	r2, rax
	call	__adddi3
	mov	x6, t0
	jmp	.LBB0_41
.LBB0_40:
	mov	r0, x5
	call	__bit_not
add	rax, 1
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	x3, rax
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r3, 0
	mov	r0, x1
	mov	r1, x0
	mov	r2, rax
	call	__adddi3
	mov	x6, t0
.LBB0_41:
	jz	x2, .LBB0_43
	jmp	.LBB0_42
.LBB0_42:
	mov	x0, rax
	call	__fe_raise_inexact
	mov	rax, x0
.LBB0_43:
.LBB0_44:
	mov	t0, x6
	mov	x15, [rsp]
	mov	x14, [rsp+4]
	mov	x13, [rsp+8]
	mov	x12, [rsp+12]
	mov	x11, [rsp+16]
	mov	x10, [rsp+20]
	mov	x9, [rsp+24]
	mov	x8, [rsp+28]
	mov	x7, [rsp+32]
	mov	x6, [rsp+36]
	mov	x5, [rsp+40]
	mov	x4, [rsp+44]
	mov	x3, [rsp+48]
	mov	x2, [rsp+52]
	mov	x1, [rsp+56]
	mov	x0, [rsp+60]
add	rsp, 64
	ret
// -- End function
