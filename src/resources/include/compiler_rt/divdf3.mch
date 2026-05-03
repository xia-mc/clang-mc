#include "_ll_std"

// -- Begin function __divdf3
__divdf3:                               // @__divdf3
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
	mov	x1, r2
	mov	x2, r0
	mov	r0, x10
	call	__bit_shr
	mov	r1, 2047
	mov	r0, rax
	call	__bit_and
	mov	r1, 20
	mov	x3, rax
	mov	r0, x8
	call	__bit_shr
	mov	r1, 2047
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	r0, x8
	mov	r1, x10
	call	__bit_xor
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, 1048575
	mov	x0, rax
	mov	r0, x10
	call	__bit_and
	mov	r1, 1048575
	mov	x5, rax
	mov	r0, x8
	call	__bit_and
	mov	r0, x3
add	r0, -2047
	mov	r1, -2147483648
	mov	x6, rax
	call	__bit_xor
	mov	r0, 2147481602
	jl	rax, r0, .LBB0_2
	jmp	.LBB0_1
.LBB0_1:
	mov	r0, x4
add	r0, -2047
	mov	r1, -2147483648
	mov	x13, 0
	call	__bit_xor
	mov	r0, 2147481601
	jg	rax, r0, .LBB0_19
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
	jmp	.LBB0_32
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
	mov	x2, x1
	jmp	.LBB0_32
.LBB0_6:
	mov	r1, 2146435072
	mov	r0, x9
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	jnz	rax, .LBB0_9
	jmp	.LBB0_7
.LBB0_7:
	mov	r1, 2146435072
	mov	r0, x7
	call	__bit_xor
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	t0, 2146959360
	mov	x2, 0
	jz	rax, .LBB0_32
	jmp	.LBB0_8
.LBB0_8:
	mov	r1, 2146435072
	mov	r0, x0
	call	__bit_or
	mov	t0, rax
	jmp	.LBB0_32
.LBB0_9:
	mov	r1, 2146435072
	mov	r0, x7
	call	__bit_xor
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	jnz	rax, .LBB0_11
	jmp	.LBB0_10
.LBB0_10:
	mov	x2, 0
	mov	t0, x0
	jmp	.LBB0_32
.LBB0_11:
	mov	r0, x2
	mov	r1, x9
	call	__bit_or
	jnz	rax, .LBB0_13
	jmp	.LBB0_12
.LBB0_12:
	mov	r0, x1
	mov	r1, x7
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
add	rax, 1
	mov	r1, 2146959360
	sub	r1, x0
	mov	r0, rax
	call	__bit_and
	mov	t0, rax
	add	t0, x0
	mov	x2, 0
	jmp	.LBB0_32
.LBB0_13:
	mov	r0, x1
	mov	r1, x7
	call	__bit_or
	jnz	rax, .LBB0_15
	jmp	.LBB0_14
.LBB0_14:
	mov	r1, 2146435072
	mov	r0, x0
	call	__bit_or
	mov	t0, rax
	mov	x2, 0
	jmp	.LBB0_32
.LBB0_15:
	mov	x14, 1048575
	mov	x13, 0
	jg	x9, x14, .LBB0_17
	jmp	.LBB0_16
.LBB0_16:
	mov	r1, 1
	mov	r0, x2
	call	__bit_shr
	mov	r0, x2
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
	mov	r0, x2
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
	mov	r0, x2
	mov	r1, x11
	call	__bit_shl
	mov	x2, rax
	mov	r0, x9
	call	__bit_not
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	x5, rax
	mov	r0, x2
	mov	r1, x9
	call	__bit_and
	mov	x2, rax
	mov	x13, 12
	sub	x13, x8
.LBB0_17:
	jg	x7, x14, .LBB0_19
	jmp	.LBB0_18
.LBB0_18:
	mov	r1, 1
	mov	r0, x1
	call	__bit_shr
	mov	r0, x1
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
	mov	r0, x1
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
	mov	r0, x1
	mov	r1, x10
	call	__bit_shl
	mov	x1, rax
	mov	r0, x8
	call	__bit_not
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	x6, rax
	mov	r0, x1
	mov	r1, x8
	call	__bit_and
	add	x7, x13
add	x7, -12
	mov	x1, rax
	mov	x13, x7
.LBB0_19:
	mov	r1, 1048576
	mov	r0, x5
	call	__bit_or
	mov	r1, 1048576
	mov	x7, rax
	mov	r0, x6
	call	__bit_or
	sub	x3, x4
	add	x3, x13
	mov	x4, rax
	mov	x5, x3
	mov	r1, 11
add	x5, 1023
	mov	r0, x1
	call	__bit_shl
	mov	r1, 21
	mov	x6, rax
	mov	r0, x1
	call	__bit_shr
	mov	r1, 11
	mov	x8, rax
	mov	r0, x4
	call	__bit_shl
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	x8, rax
	mov	x10, 1963258675
	sub	x10, x8
	mov	r1, 0
	mov	r3, 0
	mov	x9, 0
	mov	r0, x8
	mov	r2, x10
	call	__muldi3
	mov	r0, 0
	sub	r0, t0
	mov	r1, 0
	mov	r3, 0
	mov	r2, x10
	call	__muldi3
	mov	r1, 31
	mov	x10, t0
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	x11, rax
	mov	r0, x10
	call	__bit_shl
	mov	r0, x11
	mov	r1, rax
	call	__bit_or
	mov	r1, 0
	mov	r3, 0
	mov	x10, rax
	mov	r0, x10
	mov	r2, x8
	call	__muldi3
	mov	r2, 0
	sub	r2, t0
	mov	r1, 0
	mov	r3, 0
	mov	r0, x10
	call	__muldi3
	mov	r1, 31
	mov	x10, t0
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	x11, rax
	mov	r0, x10
	call	__bit_shl
	mov	r0, x11
	mov	r1, rax
	call	__bit_or
	mov	r1, 0
	mov	r3, 0
	mov	x10, rax
	mov	r0, x10
	mov	r2, x8
	call	__muldi3
	sub	x9, t0
	mov	r1, 0
	mov	r3, 0
	mov	r0, x10
	mov	r2, x9
	call	__muldi3
	mov	r1, 31
	mov	x9, t0
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	x10, rax
	mov	r0, x9
	call	__bit_shl
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	x9, rax
add	x9, -1
	mov	r1, 0
	mov	r3, 0
	mov	r0, x8
	mov	r2, x9
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x8, rax
	mov	x10, t0
	mov	r0, x6
	mov	r2, x9
	call	__muldi3
	mov	r3, 0
	mov	r2, t0
	mov	r0, x8
	mov	r1, x10
	call	__adddi3
	mov	r0, 1
	mov	r1, 0
	mov	r3, t0
	mov	r2, rax
	call	__subdi3
	mov	r1, 0
	mov	r3, 0
	mov	x6, rax
	mov	r2, t0
	mov	r0, x9
	call	__muldi3
	mov	r1, 1
	mov	x8, rax
	mov	r0, t0
	call	__bit_shl
	mov	r1, 31
	mov	x10, rax
	mov	r0, x8
	call	__bit_shr
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x10, rax
	mov	r0, x8
	call	__bit_shl
	mov	r1, 0
	mov	r3, 0
	mov	x8, rax
	mov	r0, x6
	mov	r2, x9
	call	__muldi3
	mov	r1, 31
	mov	x6, t0
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	x9, rax
	mov	r0, x6
	call	__bit_shl
	mov	r0, x9
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	x9, rax
	mov	r0, x6
	call	__bit_shr
	mov	r2, -225
	mov	r3, -1
	mov	x6, rax
	mov	r0, x8
	mov	r1, x10
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x9
	mov	r3, x6
	call	__adddi3
	mov	r1, 31
	mov	x6, rax
	mov	x10, t0
	mov	r0, x2
	call	__bit_shr
	mov	r1, 1
	mov	x8, rax
	mov	r0, x7
	call	__bit_shl
	mov	r0, rax
	mov	r1, x8
	call	__bit_or
	mov	r1, 1
	mov	x9, rax
	mov	r0, x2
	call	__bit_shl
	mov	r1, 0
	mov	r3, 0
	mov	x8, rax
	mov	r0, x6
	mov	r2, x8
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x11, t0
	mov	r0, x6
	mov	r2, x9
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x6, rax
	mov	x12, t0
	mov	r0, x10
	mov	r2, x8
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x13, rax
	mov	x14, t0
	mov	r0, x10
	mov	r2, x9
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x10, rax
	mov	x15, t0
	mov	r0, x11
	mov	r2, x6
	call	__adddi3
	mov	r1, -2
	mov	x6, rax
	mov	x11, t0
	mov	r0, x13
	call	__bit_and
	mov	r3, 0
	mov	r0, x6
	mov	r1, x11
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	x6, t0
	mov	r0, x14
	mov	r2, x10
	mov	r3, x15
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x12
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x6
	call	__adddi3
	mov	r1, -2147483648
	mov	x6, rax
	mov	x11, t0
	mov	r0, x11
	call	__bit_xor
	mov	r0, -2145386497
	jg	rax, r0, .LBB0_23
	jmp	.LBB0_20
.LBB0_20:
	mov	r0, x11
	call	__bit_not
	mov	r1, 1048576
	mov	r0, rax
	call	__bit_and
	mov	r1, 1048576
	mov	x7, rax
	mov	r0, x11
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x11
add	r1, -1048576
	mov	r0, rax
	call	__bit_and
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
add	x3, 1022
	mov	r0, rax
	call	__bit_and
	mov	x7, rax
	mov	r0, x11
	mov	r1, x7
	call	__bit_shl
	mov	r1, 1
	mov	x10, rax
	mov	r0, x6
	call	__bit_shr
	mov	r1, 31
	mov	x12, rax
	mov	r0, x7
	call	__bit_xor
	mov	r0, x12
	mov	r1, rax
	call	__bit_shr
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	x10, rax
	mov	r0, x6
	mov	r1, x7
	call	__bit_shl
	mov	x6, rax
	mov	r0, 1048576
	jl	x11, r0, .LBB0_22
	jmp	.LBB0_21
.LBB0_21:
	mov	x3, x5
.LBB0_22:
	mov	r1, 21
	mov	r0, x2
	call	__bit_shl
	mov	x2, rax
	mov	r0, x6
	mov	r1, x10
	mov	r2, x1
	mov	r3, x4
	call	__muldi3
	mov	r0, 0
	mov	r3, t0
	mov	r1, x2
	mov	r2, rax
	call	__subdi3
add	x3, -1
	mov	x5, x3
	jmp	.LBB0_24
.LBB0_23:
	mov	r1, 1
	mov	r0, x11
	call	__bit_shr
	mov	r1, 1
	mov	x10, rax
	mov	r0, x6
	call	__bit_shr
	mov	r1, 31
	mov	x3, rax
	mov	r0, x11
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 20
	mov	x6, rax
	mov	r0, x2
	call	__bit_shl
	mov	x3, rax
	mov	r0, x6
	mov	r1, x10
	mov	r2, x1
	mov	r3, x4
	call	__muldi3
	mov	r0, 0
	mov	r3, t0
	mov	r1, x3
	mov	r2, rax
	call	__subdi3
	mov	x8, x2
	mov	x9, x7
.LBB0_24:
	mov	r0, 2047
	jl	x5, r0, .LBB0_26
	jmp	.LBB0_25
.LBB0_25:
	mov	r1, 2146435072
	mov	r0, x0
	call	__bit_or
	mov	t0, rax
	mov	x2, 0
	jmp	.LBB0_32
.LBB0_26:
	mov	r0, 1
	jl	x5, r0, .LBB0_28
	jmp	.LBB0_27
.LBB0_27:
	mov	r1, 1048575
	mov	r0, x10
	mov	x7, rax
	mov	x3, t0
	call	__bit_and
	mov	r1, 20
	mov	x2, rax
	mov	r0, x5
	call	__bit_shl
	mov	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, 31
	mov	x2, rax
	mov	r0, x7
	call	__bit_shr
	mov	r1, 1
	mov	x5, rax
	mov	r0, x3
	call	__bit_shl
	mov	r0, rax
	mov	r1, x5
	call	__bit_or
	mov	r1, 1
	mov	x3, rax
	mov	r0, x7
	call	__bit_shl
	mov	x5, rax
	jmp	.LBB0_31
.LBB0_28:
	mov	r0, -53
	jg	x5, r0, .LBB0_30
	jmp	.LBB0_29
.LBB0_29:
	mov	x2, 0
	mov	t0, x0
	jmp	.LBB0_32
.LBB0_30:
	mov	x7, x5
	mov	r0, 1
	sub	r0, x5
	mov	r1, 31
add	x7, 52
	call	__bit_and
	mov	x2, rax
	mov	r1, 0
	sub	r1, x2
	mov	x3, 0
	mov	r0, x2
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, -31
	sub	r0, x5
	mov	r1, 31
	mov	x12, rax
	call	__bit_shr
	mov	x11, rax
	mov	r0, x10
	mov	r1, x2
	call	__bit_shr
	mov	x13, 0
	sub	x13, x11
	mov	x14, rax
	mov	r0, x13
	call	__bit_not
	mov	r0, x14
	mov	r1, rax
	call	__bit_and
	mov	x15, rax
	mov	r0, x6
	mov	r1, x2
	call	__bit_shr
	mov	x6, rax
	mov	r0, 32
	sub	r0, x2
	mov	r1, 31
	mov	x11, 32
	call	__bit_and
	mov	r0, x10
	mov	r1, rax
	call	__bit_shl
	mov	r1, 0
	sub	r1, x12
	mov	r0, rax
	call	__bit_and
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x13
	call	__bit_and
	mov	r0, rax
	mov	r1, x15
	call	__bit_or
	mov	x6, rax
	mov	r0, x14
	mov	r1, x13
	call	__bit_and
	mov	r1, 31
	mov	x2, rax
	mov	r0, x7
	call	__bit_and
	mov	x7, rax
	mov	r1, 0
	sub	r1, x7
	mov	r0, x7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	x5, 20
	mov	r1, 31
	mov	x10, rax
	mov	r0, x5
	call	__bit_shr
	mov	x5, rax
	mov	r0, x8
	mov	r1, x7
	call	__bit_shl
	mov	x12, 0
	sub	x12, x5
	mov	x5, rax
	mov	r0, x12
	call	__bit_not
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	x13, rax
	mov	r0, x9
	mov	r1, x7
	call	__bit_shl
	sub	x11, x7
	mov	r1, 31
	mov	x7, rax
	mov	r0, x11
	call	__bit_and
	mov	r0, x8
	mov	r1, rax
	call	__bit_shr
	sub	x3, x10
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x12
	call	__bit_and
	mov	r0, rax
	mov	r1, x13
	call	__bit_or
	mov	x3, rax
	mov	r0, x5
	mov	r1, x12
	call	__bit_and
	mov	x5, rax
	mov	r0, x1
	mov	r1, x4
	mov	r2, x6
	mov	r3, x2
	call	__muldi3
	mov	r1, 1
	mov	x7, rax
	mov	r0, t0
	call	__bit_shl
	mov	r1, 31
	mov	x8, rax
	mov	r0, x7
	call	__bit_shr
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x8, rax
	mov	r0, x7
	call	__bit_shl
	mov	r0, x5
	mov	r1, x3
	mov	r2, rax
	mov	r3, x8
	call	__subdi3
	mov	x5, rax
	mov	x3, t0
.LBB0_31:
	mov	r1, 1
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	mov	r2, x5
	mov	r3, x3
	call	__adddi3
	mov	x7, rax
	mov	x3, t0
	mov	r0, x4
	call	__bit_not
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	x5, rax
	mov	r0, x4
	mov	r1, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x4
	sub	r1, x3
	mov	r0, rax
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
	mov	x5, rax
	mov	r0, x1
	call	__bit_not
	mov	r0, rax
	mov	r1, x7
	call	__bit_and
	mov	x8, rax
	mov	r0, x1
	mov	r1, x7
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x1, x7
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	sub	x1, x5
	mov	r0, x3
	mov	r1, x4
	call	__bit_xor
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	add	x5, rax
	mov	r1, 1
	mov	r0, x5
	call	__bit_and
	mov	r3, 0
	mov	r0, x6
	mov	r1, x2
	mov	r2, rax
	call	__adddi3
	mov	x2, rax
	mov	r0, t0
	mov	r1, x0
	call	__bit_or
	mov	t0, rax
.LBB0_32:
	mov	rax, x2
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
