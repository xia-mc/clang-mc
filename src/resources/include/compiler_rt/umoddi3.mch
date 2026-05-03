#include "_ll_std"

// -- Begin function __umoddi3
__umoddi3:                              // @__umoddi3
// %bb.0:
sub	rsp, 68
	mov	[rsp+64], x0
	mov	[rsp+60], x1
	mov	[rsp+56], x2
	mov	[rsp+52], x3
	mov	[rsp+48], x4
	mov	[rsp+44], x5
	mov	[rsp+40], x6
	mov	[rsp+36], x7
	mov	[rsp+32], x8
	mov	[rsp+28], x9
	mov	[rsp+24], x10
	mov	[rsp+20], x11
	mov	[rsp+16], x12
	mov	[rsp+12], x13
	mov	[rsp+8], x14
	mov	[rsp+4], x15
	mov	x0, r3
	mov	x1, r2
	mov	x3, r1
	mov	x10, r0
	mov	r0, x1
	mov	r1, x0
	call	__bit_or
	mov	x4, 64
	mov	x5, 64
	jz	rax, .LBB0_2
	jmp	.LBB0_1
.LBB0_1:
	mov	r1, 1
	mov	r0, x1
	call	__bit_shr
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x5, rax
	mov	r1, 2
	mov	r0, x5
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x6, rax
	mov	r0, x5
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
	mov	x2, 64
	mov	r1, 1
	sub	x2, rax
	mov	r0, x0
	call	__bit_shr
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x5, rax
	mov	r0, x5
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x5, rax
	mov	r1, 2
	mov	r0, x5
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x6, rax
	mov	r0, x5
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
	mov	x5, 32
	sub	x5, rax
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
	mov	r1, x5
	call	__bit_and
	mov	x5, rax
	add	x5, x2
.LBB0_2:
	mov	r0, x10
	mov	r1, x3
	call	__bit_or
	jz	rax, .LBB0_4
	jmp	.LBB0_3
.LBB0_3:
	mov	r1, 1
	mov	r0, x10
	call	__bit_shr
	mov	r0, x10
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
	mov	x6, rax
	mov	r0, x4
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
	mov	x2, 64
	mov	r1, 1
	sub	x2, rax
	mov	r0, x3
	call	__bit_shr
	mov	r0, x3
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
	mov	x6, rax
	mov	r0, x4
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
	mov	x4, 32
	sub	x4, rax
	mov	r0, x3
	call	__bit_not
add	rax, 1
	mov	r0, x3
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
	mov	x4, rax
	add	x4, x2
.LBB0_4:
	mov	x9, x5
	sub	x9, x4
	mov	r1, -2147483648
	mov	r0, x9
	call	__bit_xor
	mov	r0, -2147483585
	mov	x7, x10
	mov	x8, x3
	jg	rax, r0, .LBB0_10
	jmp	.LBB0_5
.LBB0_5:
	mov	x7, 0
	mov	x11, 63
	mov	x8, 0
	je	x9, x11, .LBB0_10
	jmp	.LBB0_6
.LBB0_6:
	mov	r0, x9
add	r0, 1
	mov	r1, 31
	mov	x2, x10
	mov	[rsp], x2
	mov	x10, 31
	call	__bit_and
	mov	x7, rax
	mov	r1, 0
	sub	r1, x7
	mov	x6, 0
	mov	r0, x7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, x9
add	r0, -31
	mov	r1, 31
	mov	x8, rax
	call	__bit_shr
	mov	x12, rax
	mov	r0, x3
	mov	r1, x7
	call	__bit_shr
	mov	x13, 0
	sub	x13, x12
	mov	x14, rax
	mov	r0, x13
	call	__bit_not
	mov	r0, x14
	mov	r1, rax
	call	__bit_and
	mov	x15, rax
	mov	r0, x2
	mov	r1, x7
	call	__bit_shr
	mov	x2, rax
	mov	r0, 32
	sub	r0, x7
	mov	r1, 31
	mov	x12, 32
	call	__bit_and
	mov	r0, x3
	mov	r1, rax
	call	__bit_shl
	mov	r1, 0
	sub	r1, x8
	mov	r0, rax
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x13
	call	__bit_and
	mov	r0, rax
	mov	r1, x15
	call	__bit_or
	mov	x7, rax
	mov	r0, x14
	mov	r1, x13
	call	__bit_and
	sub	x11, x9
	mov	r1, 31
	mov	x8, rax
	mov	r0, x11
	call	__bit_and
	mov	x2, rax
	mov	r1, 0
	sub	r1, x2
	mov	r0, x2
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	sub	x10, x9
	mov	r1, 31
	mov	x9, rax
	mov	r0, x10
	call	__bit_shr
	mov	x10, rax
	mov	x14, [rsp]
	mov	r0, x14
	mov	r1, x2
	call	__bit_shl
	mov	x11, 0
	sub	x11, x10
	mov	x10, rax
	mov	r0, x11
	call	__bit_not
	mov	r0, x10
	mov	r1, rax
	call	__bit_and
	mov	x13, rax
	mov	r0, x3
	mov	r1, x2
	call	__bit_shl
	sub	x12, x2
	mov	r1, 31
	mov	x2, rax
	mov	r0, x12
	call	__bit_and
	mov	r0, x14
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x9
	mov	r0, rax
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x11
	call	__bit_and
	mov	r0, rax
	mov	r1, x13
	call	__bit_or
	mov	x3, rax
	mov	r0, x10
	mov	r1, x11
	call	__bit_and
	mov	x9, rax
	mov	r0, x5
	call	__bit_not
	mov	x2, rax
	add	x2, x4
	mov	x4, 0
.LBB0_7:                                // =>This Inner Loop Header: Depth=1
	mov	r1, 31
	mov	r0, x7
	call	__bit_shr
	mov	r1, 1
	mov	x5, rax
	mov	r0, x8
	call	__bit_shl
	mov	r0, rax
	mov	r1, x5
	call	__bit_or
	mov	r1, 1
	mov	x5, rax
	mov	r0, x7
	call	__bit_shl
	mov	r1, 31
	mov	x7, rax
	mov	r0, x3
	call	__bit_shr
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x7, rax
	mov	r0, x9
	call	__bit_shl
	mov	r1, 31
	mov	x8, rax
	mov	r0, x9
	call	__bit_shr
	mov	r1, 1
	mov	x9, rax
	mov	r0, x3
	call	__bit_shl
	mov	r0, rax
	mov	r1, x9
	call	__bit_or
	mov	r0, rax
	mov	r1, x6
	call	__bit_or
	mov	x3, rax
	mov	r0, x8
	mov	r1, x4
	call	__bit_or
	mov	x9, rax
	mov	r0, x7
	call	__bit_not
	mov	x4, rax
	mov	r0, x5
	call	__bit_not
	mov	r0, x1
	mov	r1, x0
	mov	r2, x4
	mov	r3, rax
	call	__adddi3
	mov	r1, 31
	mov	x8, t0
	mov	r0, x8
	call	__bit_shr
	mov	x4, rax
	mov	r2, x1
	mov	r3, x0
	jl	x8, x6, .LBB0_9
	jmp	.LBB0_8
.LBB0_8:                                //   in Loop: Header=BB0_7 Depth=1
	mov	r2, 0
	mov	r3, 0
.LBB0_9:                                //   in Loop: Header=BB0_7 Depth=1
	mov	r0, x7
	mov	r1, x5
	call	__subdi3
add	x2, 1
	mov	x7, rax
	mov	x8, t0
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB0_7
	jmp	.LBB0_10
.LBB0_10:
	mov	rax, x7
	mov	t0, x8
	mov	x15, [rsp+4]
	mov	x14, [rsp+8]
	mov	x13, [rsp+12]
	mov	x12, [rsp+16]
	mov	x11, [rsp+20]
	mov	x10, [rsp+24]
	mov	x9, [rsp+28]
	mov	x8, [rsp+32]
	mov	x7, [rsp+36]
	mov	x6, [rsp+40]
	mov	x5, [rsp+44]
	mov	x4, [rsp+48]
	mov	x3, [rsp+52]
	mov	x2, [rsp+56]
	mov	x1, [rsp+60]
	mov	x0, [rsp+64]
add	rsp, 68
	ret
// -- End function
