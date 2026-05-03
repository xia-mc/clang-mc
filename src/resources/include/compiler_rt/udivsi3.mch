#include "_ll_std"

// -- Begin function __udivsi3
__udivsi3:                              // @__udivsi3
// %bb.0:
sub	rsp, 52
	mov	[rsp+48], x0
	mov	[rsp+44], x1
	mov	[rsp+40], x2
	mov	[rsp+36], x3
	mov	[rsp+32], x4
	mov	[rsp+28], x5
	mov	[rsp+24], x6
	mov	[rsp+20], x7
	mov	[rsp+16], x8
	mov	[rsp+12], x9
	mov	[rsp+8], x10
	mov	[rsp+4], x11
	mov	[rsp], x12
	mov	x0, r1
	mov	x2, r0
	mov	x1, 0
	jz	x0, .LBB0_8
	jmp	.LBB0_1
.LBB0_1:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	jl	rax, x3, .LBB0_8
	jmp	.LBB0_2
.LBB0_2:
	mov	r0, 1
	mov	x1, x2
	je	x0, r0, .LBB0_8
	jmp	.LBB0_3
.LBB0_3:
	mov	x1, 0
	mov	x3, 0
.LBB0_4:                                // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_6 Depth 2
	mov	r1, 1
	mov	r0, x3
	call	__bit_shr
	mov	r1, 1
	mov	x4, rax
	mov	r0, x2
	call	__bit_shr
	mov	r1, 31
	mov	x5, rax
	mov	r0, x3
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	x5, rax
	mov	r0, x5
	mov	r1, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x5
	sub	r1, x0
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x5
	call	__bit_not
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, x6
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x4
	call	__bit_xor
	mov	x7, rax
	mov	r0, x7
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x7
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x7, -2147483648
	mov	r0, rax
	mov	r1, x7
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
	mov	x7, rax
	sub	x6, x7
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	add	rax, x7
	mov	x8, x0
	mov	x7, 0
	mov	x6, 1
	jnz	rax, .LBB0_7
	jmp	.LBB0_5
.LBB0_5:                                //   in Loop: Header=BB0_4 Depth=1
	mov	x9, x0
.LBB0_6:                                //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 1
	mov	r0, x9
	call	__bit_shl
	mov	r1, 31
	mov	x8, rax
	mov	r0, x9
	call	__bit_shr
	mov	r1, 1
	mov	x9, rax
	mov	r0, x7
	call	__bit_shl
	mov	r0, rax
	mov	r1, x9
	call	__bit_or
	mov	r1, 1
	mov	x7, rax
	mov	r0, x6
	call	__bit_shl
	mov	x6, rax
	mov	r0, x7
	mov	r1, x4
	call	__bit_xor
	mov	x9, rax
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
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x4
	call	__bit_xor
	mov	r1, -2147483648
	mov	x10, rax
	mov	r0, x7
	call	__bit_xor
	mov	x11, rax
	mov	r0, x10
	mov	r1, x11
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x10
	sub	r1, x11
	mov	r0, rax
	call	__bit_and
	mov	x12, rax
	mov	r0, x10
	call	__bit_not
	mov	r0, rax
	mov	r1, x11
	call	__bit_and
	mov	r0, rax
	mov	r1, x12
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	x10, rax
	mov	r0, x5
	call	__bit_not
	mov	r0, rax
	mov	r1, x8
	call	__bit_and
	mov	x11, rax
	mov	r0, x5
	mov	r1, x8
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x5
	sub	r1, x8
	mov	r0, rax
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	sub	rax, x10
add	x9, 1
	mov	r0, x9
	mov	r1, rax
	call	__bit_and
	add	rax, x10
	mov	x9, x8
	jnz	rax, .LBB0_6
	jmp	.LBB0_7
.LBB0_7:                                //   in Loop: Header=BB0_4 Depth=1
	mov	r0, x2
	mov	r1, x3
	mov	r2, x8
	mov	r3, x7
	call	__subdi3
	mov	x2, rax
	mov	x3, t0
	mov	r1, -2147483648
	add	x1, x6
	mov	r0, x3
	call	__bit_xor
	mov	r1, 2147483647
	mov	x4, rax
	mov	r0, x4
	call	__bit_xor
	mov	r1, 2147483647
	mov	x5, rax
	mov	r0, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	r0, x2
	mov	r1, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x2
	sub	r1, x0
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, x5
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	x5, rax
	sub	x5, x4
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
	mov	r1, x5
	call	__bit_and
	add	rax, x4
	jnz	rax, .LBB0_4
	jmp	.LBB0_8
.LBB0_8:
	mov	rax, x1
	mov	x12, [rsp]
	mov	x11, [rsp+4]
	mov	x10, [rsp+8]
	mov	x9, [rsp+12]
	mov	x8, [rsp+16]
	mov	x7, [rsp+20]
	mov	x6, [rsp+24]
	mov	x5, [rsp+28]
	mov	x4, [rsp+32]
	mov	x3, [rsp+36]
	mov	x2, [rsp+40]
	mov	x1, [rsp+44]
	mov	x0, [rsp+48]
add	rsp, 52
	ret
// -- End function
