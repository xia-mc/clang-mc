#include "_ll_std"

#define __cmpdf2 __ledf2
#define __eqdf2 __ledf2
#define __ltdf2 __ledf2
#define __nedf2 __ledf2
#define __gtdf2 __gedf2

// -- Begin function __ledf2
__ledf2:                                // @__ledf2
// %bb.0:
sub	rsp, 44
	mov	[rsp+40], x0
	mov	[rsp+36], x1
	mov	[rsp+32], x2
	mov	[rsp+28], x3
	mov	[rsp+24], x4
	mov	[rsp+20], x5
	mov	[rsp+16], x6
	mov	[rsp+12], x7
	mov	[rsp+8], x8
	mov	[rsp+4], x9
	mov	[rsp], x10
	mov	x0, r1
	mov	r1, 2147483647
	mov	x1, r3
	mov	x2, r2
	mov	x3, r0
	mov	r0, x0
	call	__bit_and
	mov	r1, 2147483647
	mov	x5, rax
	mov	r0, x1
	call	__bit_and
	mov	x6, rax
	mov	r1, 2146435072
	mov	x4, 1
	mov	r0, x5
	call	__bit_xor
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x5
	call	__bit_xor
	mov	r1, 1048575
	mov	x9, rax
	mov	r0, x9
	call	__bit_and
	mov	x10, rax
	mov	r1, -1048576
	mov	x7, -1048576
	mov	r0, x9
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -1048576
	sub	r1, x9
	mov	r0, rax
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
	sub	rax, x9
add	x8, 1
	mov	r0, x8
	mov	r1, rax
	call	__bit_and
	add	rax, x9
	jnz	rax, .LBB0_8
	jmp	.LBB0_1
.LBB0_1:
	mov	r1, 2146435072
	mov	r0, x6
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
	mov	r0, x6
	call	__bit_xor
	mov	r1, 1048575
	mov	x9, rax
	mov	r0, x9
	call	__bit_and
	mov	r1, -1048576
	mov	x10, rax
	mov	r0, x9
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x7, x9
	mov	r0, rax
	mov	r1, x7
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
	mov	x7, rax
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	sub	rax, x7
add	x8, 1
	mov	r0, x8
	mov	r1, rax
	call	__bit_and
	add	rax, x7
	jnz	rax, .LBB0_8
	jmp	.LBB0_2
.LBB0_2:
	mov	r0, x2
	mov	r1, x3
	call	__bit_or
	mov	x4, rax
	mov	r0, x6
	mov	r1, x5
	call	__bit_or
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	x4, 0
	jz	rax, .LBB0_8
	jmp	.LBB0_3
.LBB0_3:
	mov	r0, x1
	mov	r1, x0
	call	__bit_and
	mov	r0, 0
	jl	rax, r0, .LBB0_6
	jmp	.LBB0_4
.LBB0_4:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x1
	call	__bit_xor
	mov	x5, rax
	mov	r0, x4
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x4
	sub	r1, x5
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x4
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
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
	mov	x4, rax
	mov	r0, x3
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	x5, rax
	mov	r0, x3
	mov	r1, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x3
	sub	r1, x2
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
	sub	x5, x4
	mov	r0, x0
	mov	r1, x1
	call	__bit_xor
	mov	x6, rax
	mov	r0, x6
	call	__bit_not
add	rax, 1
	mov	r0, x6
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
	mov	x4, -1
	jnz	rax, .LBB0_8
	jmp	.LBB0_5
.LBB0_5:
	mov	r0, x3
	mov	r1, x2
	call	__bit_xor
	mov	x2, rax
	mov	r0, x0
	mov	r1, x1
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	x0, rax
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
	call	__bit_and
	mov	x4, rax
	jmp	.LBB0_8
.LBB0_6:
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x0
	call	__bit_xor
	mov	x5, rax
	mov	r0, x4
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x4
	sub	r1, x5
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x4
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
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
	mov	x4, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	x5, rax
	mov	r0, x2
	mov	r1, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x2
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
	sub	x5, x4
	mov	r0, x0
	mov	r1, x1
	call	__bit_xor
	mov	x6, rax
	mov	r0, x6
	call	__bit_not
add	rax, 1
	mov	r0, x6
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
	mov	x4, -1
	jnz	rax, .LBB0_8
	jmp	.LBB0_7
.LBB0_7:
	mov	r0, x3
	mov	r1, x2
	call	__bit_xor
	mov	x2, rax
	mov	r0, x0
	mov	r1, x1
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	x0, rax
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
	call	__bit_and
	mov	x4, rax
.LBB0_8:
	mov	rax, x4
	mov	x10, [rsp]
	mov	x9, [rsp+4]
	mov	x8, [rsp+8]
	mov	x7, [rsp+12]
	mov	x6, [rsp+16]
	mov	x5, [rsp+20]
	mov	x4, [rsp+24]
	mov	x3, [rsp+28]
	mov	x2, [rsp+32]
	mov	x1, [rsp+36]
	mov	x0, [rsp+40]
add	rsp, 44
	ret
// -- End function
// -- Begin function __gedf2
__gedf2:                                // @__gedf2
// %bb.0:
sub	rsp, 44
	mov	[rsp+40], x0
	mov	[rsp+36], x1
	mov	[rsp+32], x2
	mov	[rsp+28], x3
	mov	[rsp+24], x4
	mov	[rsp+20], x5
	mov	[rsp+16], x6
	mov	[rsp+12], x7
	mov	[rsp+8], x8
	mov	[rsp+4], x9
	mov	[rsp], x10
	mov	x0, r1
	mov	r1, 2147483647
	mov	x1, r3
	mov	x2, r2
	mov	x3, r0
	mov	r0, x0
	call	__bit_and
	mov	r1, 2147483647
	mov	x4, rax
	mov	r0, x1
	call	__bit_and
	mov	x5, rax
	mov	r1, 2146435072
	mov	x6, -1
	mov	r0, x4
	call	__bit_xor
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x4
	call	__bit_xor
	mov	r1, 1048575
	mov	x9, rax
	mov	r0, x9
	call	__bit_and
	mov	x10, rax
	mov	r1, -1048576
	mov	x7, -1048576
	mov	r0, x9
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -1048576
	sub	r1, x9
	mov	r0, rax
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
	sub	rax, x9
add	x8, 1
	mov	r0, x8
	mov	r1, rax
	call	__bit_and
	add	rax, x9
	jnz	rax, .LBB1_8
	jmp	.LBB1_1
.LBB1_1:
	mov	r1, 2146435072
	mov	r0, x5
	call	__bit_xor
	mov	x6, rax
	mov	r0, x6
	call	__bit_not
add	rax, 1
	mov	r0, x6
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
	mov	x6, rax
	mov	r0, x5
	call	__bit_xor
	mov	r1, 1048575
	mov	x8, rax
	mov	r0, x8
	call	__bit_and
	mov	r1, -1048576
	mov	x9, rax
	mov	r0, x8
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x7, x8
	mov	r0, rax
	mov	r1, x7
	call	__bit_and
	mov	r0, x9
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x7, rax
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	sub	rax, x7
add	x6, 1
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	add	rax, x7
	mov	x6, -1
	jnz	rax, .LBB1_8
	jmp	.LBB1_2
.LBB1_2:
	mov	r0, x2
	mov	r1, x3
	call	__bit_or
	mov	x6, rax
	mov	r0, x5
	mov	r1, x4
	call	__bit_or
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	x6, 0
	jz	rax, .LBB1_8
	jmp	.LBB1_3
.LBB1_3:
	mov	r0, x1
	mov	r1, x0
	call	__bit_and
	mov	r0, 0
	jl	rax, r0, .LBB1_6
	jmp	.LBB1_4
.LBB1_4:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x1
	call	__bit_xor
	mov	x5, rax
	mov	r0, x4
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x4
	sub	r1, x5
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x4
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
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
	mov	x4, rax
	mov	r0, x3
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	x5, rax
	mov	r0, x3
	mov	r1, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x3
	sub	r1, x2
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
	sub	x5, x4
	mov	r0, x0
	mov	r1, x1
	call	__bit_xor
	mov	x6, rax
	mov	r0, x6
	call	__bit_not
add	rax, 1
	mov	r0, x6
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
	mov	x6, -1
	jnz	rax, .LBB1_8
	jmp	.LBB1_5
.LBB1_5:
	mov	r0, x3
	mov	r1, x2
	call	__bit_xor
	mov	x2, rax
	mov	r0, x0
	mov	r1, x1
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	x0, rax
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
	call	__bit_and
	mov	x6, rax
	jmp	.LBB1_8
.LBB1_6:
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x0
	call	__bit_xor
	mov	x5, rax
	mov	r0, x4
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x4
	sub	r1, x5
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x4
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
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
	mov	x4, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	x5, rax
	mov	r0, x2
	mov	r1, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x2
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
	sub	x5, x4
	mov	r0, x0
	mov	r1, x1
	call	__bit_xor
	mov	x6, rax
	mov	r0, x6
	call	__bit_not
add	rax, 1
	mov	r0, x6
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
	mov	x6, -1
	jnz	rax, .LBB1_8
	jmp	.LBB1_7
.LBB1_7:
	mov	r0, x3
	mov	r1, x2
	call	__bit_xor
	mov	x2, rax
	mov	r0, x0
	mov	r1, x1
	call	__bit_xor
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	x0, rax
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
	call	__bit_and
	mov	x6, rax
.LBB1_8:
	mov	rax, x6
	mov	x10, [rsp]
	mov	x9, [rsp+4]
	mov	x8, [rsp+8]
	mov	x7, [rsp+12]
	mov	x6, [rsp+16]
	mov	x5, [rsp+20]
	mov	x4, [rsp+24]
	mov	x3, [rsp+28]
	mov	x2, [rsp+32]
	mov	x1, [rsp+36]
	mov	x0, [rsp+40]
add	rsp, 44
	ret
// -- End function
// -- Begin function __unorddf2
__unorddf2:                             // @__unorddf2
// %bb.0:
sub	rsp, 28
	mov	[rsp+24], x0
	mov	[rsp+20], x1
	mov	[rsp+16], x2
	mov	[rsp+12], x3
	mov	[rsp+8], x4
	mov	[rsp+4], x5
	mov	[rsp], x6
	mov	r4, r1
	mov	r1, 2147483647
	mov	x1, r3
	mov	x0, r2
	mov	x4, r0
	mov	r0, r4
	call	__bit_and
	mov	r1, 2147483647
	mov	x3, rax
	mov	r0, x1
	call	__bit_and
	mov	x1, rax
	mov	r1, 2146435072
	mov	x2, 2146435072
	mov	r0, x3
	call	__bit_xor
	mov	x5, rax
	mov	r0, x5
	call	__bit_not
	mov	x6, rax
	mov	r1, x6
add	r1, 1
	mov	r0, x5
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2146435073
	mov	x5, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 2146435072
	sub	r1, x3
	mov	x3, rax
	mov	r0, x6
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
	mov	x3, rax
	mov	r0, x4
	call	__bit_not
add	rax, 1
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	sub	rax, x3
add	x5, 1
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	r1, 2146435072
	add	x3, rax
	mov	r0, x1
	call	__bit_xor
	mov	x4, rax
	mov	r0, x4
	call	__bit_not
	mov	x5, rax
	mov	r1, x5
add	r1, 1
	mov	r0, x4
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2146435073
	mov	x4, rax
	mov	r0, x1
	call	__bit_and
	sub	x2, x1
	mov	x1, rax
	mov	r0, x5
	mov	r1, x2
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	mov	r0, x0
	call	__bit_not
add	rax, 1
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	sub	rax, x1
add	x4, 1
	mov	r0, x4
	mov	r1, rax
	call	__bit_and
	add	x1, rax
	mov	r0, x3
	mov	r1, x1
	call	__bit_or
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x6, [rsp]
	mov	x5, [rsp+4]
	mov	x4, [rsp+8]
	mov	x3, [rsp+12]
	mov	x2, [rsp+16]
	mov	x1, [rsp+20]
	mov	x0, [rsp+24]
add	rsp, 28
	ret
// -- End function
