#include "_ll_std"

// -- Begin function __muldf3
__muldf3:                               // @__muldf3
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
	mov	x10, r1
	mov	r1, 20
	mov	x8, r3
	mov	x4, r2
	mov	x0, r0
	mov	r0, x10
	call	__bit_shr
	mov	r1, 2047
	mov	r0, rax
	call	__bit_and
	mov	r1, 20
	mov	x2, rax
	mov	r0, x8
	call	__bit_shr
	mov	r1, 2047
	mov	r0, rax
	call	__bit_and
	mov	x3, rax
	mov	r0, x8
	mov	r1, x10
	call	__bit_xor
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, 1048575
	mov	x1, rax
	mov	r0, x10
	call	__bit_and
	mov	r1, 1048575
	mov	x5, rax
	mov	r0, x8
	call	__bit_and
	mov	r0, x2
add	r0, -2047
	mov	r1, -2147483648
	mov	x6, rax
	call	__bit_xor
	mov	r0, 2147481602
	jl	rax, r0, .LBB0_2
	jmp	.LBB0_1
.LBB0_1:
	mov	r0, x3
add	r0, -2047
	mov	r1, -2147483648
	mov	x13, 0
	call	__bit_xor
	mov	r0, 2147481601
	jg	rax, r0, .LBB0_20
	jmp	.LBB0_2
.LBB0_2:
	mov	r1, 2147483647
	mov	r0, x10
	call	__bit_and
	mov	r1, 2147483647
	mov	x9, rax
	mov	r0, x8
	call	__bit_and
	mov	r1, 2146435072
	mov	x7, rax
	mov	r0, x9
	call	__bit_xor
	mov	x11, rax
	mov	r0, x11
	call	__bit_not
add	rax, 1
	mov	r0, x11
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
	mov	x11, rax
	mov	r0, x9
	call	__bit_xor
	mov	x12, rax
	mov	r0, x12
	call	__bit_not
	mov	r1, -1048576
	mov	r0, rax
	call	__bit_and
	mov	r1, -1048576
	mov	x13, rax
	mov	r0, x12
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x12, 1048576
	mov	r0, rax
	mov	r1, x12
	call	__bit_and
	mov	r0, x13
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x12, rax
	mov	r0, x0
	call	__bit_not
add	rax, 1
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	sub	rax, x12
add	x11, 1
	mov	r0, x11
	mov	r1, rax
	call	__bit_and
	add	rax, x12
	jnz	rax, .LBB0_4
	jmp	.LBB0_3
.LBB0_3:
	mov	r1, 524288
	mov	r0, x10
	call	__bit_or
	mov	t0, rax
	jmp	.LBB0_35
.LBB0_4:
	mov	r1, 2146435072
	mov	r0, x7
	call	__bit_xor
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483648
	mov	x10, rax
	mov	r0, x7
	call	__bit_xor
	mov	x11, rax
	mov	r0, x11
	call	__bit_not
	mov	r1, -1048576
	mov	r0, rax
	call	__bit_and
	mov	r1, -1048576
	mov	x12, rax
	mov	r0, x11
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x11, 1048576
	mov	r0, rax
	mov	r1, x11
	call	__bit_and
	mov	r0, x12
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x11, rax
	mov	r0, x4
	call	__bit_not
add	rax, 1
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	sub	rax, x11
add	x10, 1
	mov	r0, x10
	mov	r1, rax
	call	__bit_and
	add	rax, x11
	jnz	rax, .LBB0_6
	jmp	.LBB0_5
.LBB0_5:
	mov	r1, 524288
	mov	r0, x8
	call	__bit_or
	mov	t0, rax
	mov	x0, x4
	jmp	.LBB0_35
.LBB0_6:
	mov	r1, 2146435072
	mov	r0, x9
	call	__bit_xor
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	jnz	rax, .LBB0_9
	jmp	.LBB0_7
.LBB0_7:
	mov	r0, x4
	mov	r1, x7
	call	__bit_or
	mov	t0, 2146959360
	mov	x0, 0
	jz	rax, .LBB0_35
	jmp	.LBB0_8
.LBB0_8:
	mov	r1, 2146435072
	mov	r0, x1
	call	__bit_or
	mov	t0, rax
	jmp	.LBB0_35
.LBB0_9:
	mov	r1, 2146435072
	mov	r0, x7
	call	__bit_xor
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	jnz	rax, .LBB0_12
	jmp	.LBB0_10
.LBB0_10:
	mov	r0, x0
	mov	r1, x9
	call	__bit_or
	mov	t0, 2146959360
	mov	x0, 0
	jz	rax, .LBB0_35
	jmp	.LBB0_11
.LBB0_11:
	mov	r1, 2146435072
	mov	r0, x1
	call	__bit_or
	mov	t0, rax
	jmp	.LBB0_35
.LBB0_12:
	mov	r0, x0
	mov	r1, x9
	call	__bit_or
	jnz	rax, .LBB0_14
	jmp	.LBB0_13
.LBB0_13:
	mov	x0, 0
	mov	t0, x1
	jmp	.LBB0_35
.LBB0_14:
	mov	r0, x4
	mov	r1, x7
	call	__bit_or
	jnz	rax, .LBB0_16
	jmp	.LBB0_15
.LBB0_15:
	mov	x0, 0
	mov	t0, x1
	jmp	.LBB0_35
.LBB0_16:
	mov	x14, 1048575
	mov	x13, 0
	jg	x9, x14, .LBB0_18
	jmp	.LBB0_17
.LBB0_17:
	mov	r1, 1
	mov	r0, x0
	call	__bit_shr
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x8, rax
	mov	r0, x8
	call	__bit_shr
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x8, rax
	mov	r0, x8
	call	__bit_shr
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x8, rax
	mov	r0, x8
	call	__bit_shr
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x8, rax
	mov	r0, x8
	call	__bit_shr
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x8, rax
	mov	r0, x8
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x8, rax
	mov	r1, 2
	mov	r0, x8
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x9, rax
	mov	r0, x8
	call	__bit_and
	add	x9, rax
	mov	r1, 4
	mov	r0, x9
	call	__bit_shr
	add	x9, rax
	mov	r1, 252645135
	mov	r0, x9
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	r0, rax
	call	__bit_shr
	mov	x11, 64
	mov	r1, 1
	sub	x11, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x8, rax
	mov	r0, x8
	call	__bit_shr
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x8, rax
	mov	r0, x8
	call	__bit_shr
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x8, rax
	mov	r0, x8
	call	__bit_shr
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x8, rax
	mov	r0, x8
	call	__bit_shr
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x8, rax
	mov	r0, x8
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x8, rax
	mov	r1, 2
	mov	r0, x8
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x9, rax
	mov	r0, x8
	call	__bit_and
	add	x9, rax
	mov	r1, 4
	mov	r0, x9
	call	__bit_shr
	add	x9, rax
	mov	r1, 252645135
	mov	r0, x9
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	r0, rax
	call	__bit_shr
	add	rax, x11
	mov	x10, 32
	mov	x8, 32
	sub	x8, rax
	mov	r0, x5
	call	__bit_not
add	rax, 1
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x8
	call	__bit_and
	mov	x8, rax
	add	x8, x11
	mov	r0, x8
add	r0, -11
	mov	r1, 31
	call	__bit_and
	mov	x11, rax
	mov	r1, 0
	sub	r1, x11
	mov	x9, 0
	mov	r0, x11
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, x8
add	r0, -43
	mov	r1, 31
	mov	x12, rax
	call	__bit_shr
	sub	x10, x11
	mov	r1, 31
	mov	x13, rax
	mov	r0, x10
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x12
	mov	r0, rax
	call	__bit_and
	mov	x10, rax
	mov	r0, x5
	mov	r1, x11
	call	__bit_shl
	mov	r0, rax
	mov	r1, x10
	call	__bit_or
	sub	x9, x13
	mov	r0, rax
	mov	r1, x9
	call	__bit_and
	mov	x5, rax
	mov	r0, x0
	mov	r1, x11
	call	__bit_shl
	mov	x0, rax
	mov	r0, x9
	call	__bit_not
	mov	r0, x0
	mov	r1, rax
	call	__bit_and
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	x5, rax
	mov	r0, x0
	mov	r1, x9
	call	__bit_and
	mov	x0, rax
	mov	x13, 12
	sub	x13, x8
.LBB0_18:
	jg	x7, x14, .LBB0_20
	jmp	.LBB0_19
.LBB0_19:
	mov	r1, 1
	mov	r0, x4
	call	__bit_shr
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x7, rax
	mov	r0, x7
	call	__bit_shr
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x7, rax
	mov	r0, x7
	call	__bit_shr
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x7, rax
	mov	r0, x7
	call	__bit_shr
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x7, rax
	mov	r0, x7
	call	__bit_shr
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x7, rax
	mov	r0, x7
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x7, rax
	mov	r1, 2
	mov	r0, x7
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x8, rax
	mov	r0, x7
	call	__bit_and
	add	x8, rax
	mov	r1, 4
	mov	r0, x8
	call	__bit_shr
	add	x8, rax
	mov	r1, 252645135
	mov	r0, x8
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	r0, rax
	call	__bit_shr
	mov	x10, 64
	mov	r1, 1
	sub	x10, rax
	mov	r0, x6
	call	__bit_shr
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x7, rax
	mov	r0, x7
	call	__bit_shr
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x7, rax
	mov	r0, x7
	call	__bit_shr
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x7, rax
	mov	r0, x7
	call	__bit_shr
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x7, rax
	mov	r0, x7
	call	__bit_shr
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x7, rax
	mov	r0, x7
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x7, rax
	mov	r1, 2
	mov	r0, x7
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x8, rax
	mov	r0, x7
	call	__bit_and
	add	x8, rax
	mov	r1, 4
	mov	r0, x8
	call	__bit_shr
	add	x8, rax
	mov	r1, 252645135
	mov	r0, x8
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	r0, rax
	call	__bit_shr
	add	rax, x10
	mov	x9, 32
	mov	x7, 32
	sub	x7, rax
	mov	r0, x6
	call	__bit_not
add	rax, 1
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x7
	call	__bit_and
	mov	x7, rax
	add	x7, x10
	mov	r0, x7
add	r0, -11
	mov	r1, 31
	call	__bit_and
	mov	x10, rax
	mov	r1, 0
	sub	r1, x10
	mov	x8, 0
	mov	r0, x10
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, x7
add	r0, -43
	mov	r1, 31
	mov	x11, rax
	call	__bit_shr
	sub	x9, x10
	mov	r1, 31
	mov	x12, rax
	mov	r0, x9
	call	__bit_and
	mov	r0, x4
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x11
	mov	r0, rax
	call	__bit_and
	mov	x9, rax
	mov	r0, x6
	mov	r1, x10
	call	__bit_shl
	mov	r0, rax
	mov	r1, x9
	call	__bit_or
	sub	x8, x12
	mov	r0, rax
	mov	r1, x8
	call	__bit_and
	mov	x6, rax
	mov	r0, x4
	mov	r1, x10
	call	__bit_shl
	mov	x4, rax
	mov	r0, x8
	call	__bit_not
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	x6, rax
	mov	r0, x4
	mov	r1, x8
	call	__bit_and
	mov	x4, rax
	sub	x13, x7
add	x13, 12
.LBB0_20:
	mov	r1, 21
	mov	r0, x4
	call	__bit_shr
	mov	r1, 11
	mov	x7, rax
	mov	r0, x6
	call	__bit_shl
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	mov	r1, 11
	mov	x6, rax
	mov	r0, x4
	call	__bit_shl
	mov	r1, 0
	mov	r3, 0
	mov	x4, rax
	mov	r0, x4
	mov	r2, x0
	call	__muldi3
	mov	r1, -2147483648
	mov	x7, rax
	mov	x8, t0
	mov	r0, x6
	call	__bit_or
	mov	r1, 0
	mov	r3, 0
	mov	x6, rax
	mov	r0, x6
	mov	r2, x0
	call	__muldi3
	mov	r1, 1048576
	mov	x9, rax
	mov	x0, t0
	mov	r0, x5
	call	__bit_or
	mov	r1, 0
	mov	r3, 0
	mov	x5, rax
	mov	r0, x4
	mov	r2, x5
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x10, rax
	mov	x11, t0
	mov	r0, x6
	mov	r2, x5
	call	__muldi3
	mov	r1, -2048
	mov	x6, rax
	mov	x12, t0
	mov	r0, x7
	call	__bit_and
	mov	r1, -2048
	mov	x4, rax
	mov	r0, x10
	call	__bit_and
	mov	r1, 0
	mov	r3, 0
	mov	r0, rax
	mov	r2, x8
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x9
	call	__adddi3
	mov	r1, 0
	mov	x5, rax
	mov	x7, t0
	mov	r0, x11
	mov	r2, x6
	mov	r3, x12
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x0
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x7
	call	__adddi3
	mov	x0, rax
	mov	x6, t0
	add	x2, x3
	add	x2, x13
	mov	r1, 1048576
add	x2, -1023
	mov	r0, x6
	call	__bit_and
	jz	rax, .LBB0_22
	jmp	.LBB0_21
.LBB0_21:
add	x2, 1
	jmp	.LBB0_23
.LBB0_22:
	mov	r1, 31
	mov	r0, x0
	call	__bit_shr
	mov	r1, 1
	mov	x3, rax
	mov	r0, x6
	call	__bit_shl
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	r1, 1
	mov	x6, rax
	mov	r0, x0
	call	__bit_shl
	mov	r1, 31
	mov	x0, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	x0, rax
	mov	r0, x4
	call	__bit_shr
	mov	r1, 1
	mov	x3, rax
	mov	r0, x5
	call	__bit_shl
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	r1, 1
	mov	x5, rax
	mov	r0, x4
	call	__bit_shl
	mov	x4, rax
.LBB0_23:
	mov	r0, 2047
	jl	x2, r0, .LBB0_25
	jmp	.LBB0_24
.LBB0_24:
	mov	r1, 2146435072
	mov	r0, x1
	call	__bit_or
	mov	t0, rax
	mov	x0, 0
	jmp	.LBB0_35
.LBB0_25:
	mov	r0, 0
	jg	x2, r0, .LBB0_29
	jmp	.LBB0_26
.LBB0_26:
	mov	x3, 1
	sub	x3, x2
	mov	r0, 63
	jg	x3, r0, .LBB0_28
	jmp	.LBB0_27
.LBB0_27:
	mov	r0, x2
add	r0, 63
	mov	r1, 31
	call	__bit_and
	mov	x10, rax
	mov	r0, x4
	mov	r1, x10
	call	__bit_shl
add	x2, 31
	mov	r1, 31
	mov	x8, rax
	mov	r0, x2
	call	__bit_shr
	mov	x9, 0
	sub	x9, rax
	mov	r0, x9
	call	__bit_not
	mov	x11, rax
	mov	r0, x8
	mov	r1, x11
	call	__bit_and
	mov	x13, rax
	mov	r0, x5
	mov	r1, x10
	call	__bit_shl
	mov	x14, rax
	mov	r0, 32
	sub	r0, x10
	mov	r1, 31
	mov	x7, 32
	call	__bit_and
	mov	x12, rax
	mov	r0, x4
	mov	r1, x12
	call	__bit_shr
	mov	r1, 0
	sub	r1, x10
	mov	x15, rax
	mov	r0, x10
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x2, 0
	sub	x2, rax
	mov	r0, x15
	mov	r1, x2
	call	__bit_and
	mov	r0, x14
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x9
	call	__bit_and
	mov	r0, rax
	mov	r1, x13
	call	__bit_or
	mov	x13, rax
	mov	r0, x8
	mov	r1, x9
	call	__bit_and
	mov	r0, rax
	mov	r1, x13
	call	__bit_or
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
	mov	x8, rax
	mov	r0, x0
	mov	r1, x10
	call	__bit_shl
	mov	x13, rax
	mov	r0, x13
	mov	r1, x11
	call	__bit_and
	mov	x11, rax
	mov	r0, x6
	mov	r1, x10
	call	__bit_shl
	mov	x10, rax
	mov	r0, x0
	mov	r1, x12
	call	__bit_shr
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x9
	call	__bit_and
	mov	r0, rax
	mov	r1, x11
	call	__bit_or
	mov	x10, rax
	mov	r0, x13
	mov	r1, x9
	call	__bit_and
	mov	r1, 31
	mov	x12, rax
	mov	r0, x3
	call	__bit_and
	mov	x9, rax
	mov	r0, x5
	mov	r1, x9
	call	__bit_shr
add	x3, -32
	mov	r1, 31
	mov	x2, rax
	mov	r0, x3
	call	__bit_shr
	mov	x3, 0
	sub	x3, rax
	mov	r0, x3
	call	__bit_not
	mov	x11, rax
	mov	r0, x2
	mov	r1, x11
	call	__bit_and
	mov	x13, rax
	mov	r0, x4
	mov	r1, x9
	call	__bit_shr
	sub	x7, x9
	mov	r1, 31
	mov	x4, rax
	mov	r0, x7
	call	__bit_and
	mov	x7, rax
	mov	r0, x5
	mov	r1, x7
	call	__bit_shl
	mov	r1, 0
	sub	r1, x9
	mov	x5, rax
	mov	r0, x9
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x14, 0
	sub	x14, rax
	mov	r0, x5
	mov	r1, x14
	call	__bit_and
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	r0, rax
	mov	r1, x13
	call	__bit_or
	mov	x4, rax
	mov	r0, x2
	mov	r1, x3
	call	__bit_and
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	x5, rax
	mov	r0, x12
	mov	r1, x4
	call	__bit_or
	mov	r1, 1
	mov	x2, rax
	mov	r0, x8
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	x4, rax
	mov	r0, x6
	mov	r1, x9
	call	__bit_shr
	mov	x2, rax
	mov	r0, x2
	mov	r1, x11
	call	__bit_and
	mov	x8, rax
	mov	r0, x0
	mov	r1, x9
	call	__bit_shr
	mov	x0, rax
	mov	r0, x6
	mov	r1, x7
	call	__bit_shl
	mov	r0, rax
	mov	r1, x14
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	r0, rax
	mov	r1, x8
	call	__bit_or
	mov	x0, rax
	mov	r0, x2
	mov	r1, x3
	call	__bit_and
	jmp	.LBB0_30
.LBB0_28:
	mov	x0, 0
	mov	t0, x1
	jmp	.LBB0_35
.LBB0_29:
	mov	r1, 1048575
	mov	r0, x6
	call	__bit_and
	mov	r1, 20
	mov	x3, rax
	mov	r0, x2
	call	__bit_shl
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
.LBB0_30:
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x5
	call	__bit_xor
	mov	x2, rax
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
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 2147483647
	mov	x6, rax
	mov	r0, x2
	call	__bit_xor
	mov	r1, 2147483647
	mov	x7, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x7
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
	mov	x2, rax
	mov	r0, x4
	call	__bit_not
add	rax, 1
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	sub	rax, x2
add	x3, 1
	mov	r0, x3
	mov	r1, rax
	call	__bit_and
	add	rax, x2
	jnz	rax, .LBB0_32
	jmp	.LBB0_31
.LBB0_31:
	mov	r2, 1
	mov	r3, 0
	mov	r0, x0
	mov	r1, x1
	call	__adddi3
	mov	x0, rax
	jmp	.LBB0_34
.LBB0_32:
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	t0, x1
	jnz	rax, .LBB0_34
	jmp	.LBB0_33
.LBB0_33:
	mov	r1, 1
	mov	r0, x0
	mov	x1, t0
	call	__bit_and
	mov	r3, 0
	mov	r0, x0
	mov	r1, x1
	mov	r2, rax
	call	__adddi3
	mov	x0, rax
.LBB0_34:
.LBB0_35:
	mov	rax, x0
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
