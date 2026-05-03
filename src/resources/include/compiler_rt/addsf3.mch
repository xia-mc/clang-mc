#include "_ll_std"

// -- Begin function __addsf3
__addsf3:                               // @__addsf3
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
	mov	x4, r1
	mov	r1, 2147483647
	mov	x1, r0
	mov	x2, x4
	call	__bit_and
	mov	r1, 2147483647
	mov	x0, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, x0
add	r0, -2139095040
	mov	r1, -2147483648
	mov	x3, rax
	call	__bit_xor
	mov	r0, 8388609
	jl	rax, r0, .LBB0_2
	jmp	.LBB0_1
.LBB0_1:
	mov	r0, x3
add	r0, -2139095040
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 8388608
	jg	rax, r0, .LBB0_13
	jmp	.LBB0_2
.LBB0_2:
	mov	r0, 2139095041
	jl	x0, r0, .LBB0_4
	jmp	.LBB0_3
.LBB0_3:
	mov	r1, 4194304
	mov	r0, x1
	call	__bit_or
	mov	x4, rax
	jmp	.LBB0_44
.LBB0_4:
	jl	x3, r0, .LBB0_6
	jmp	.LBB0_5
.LBB0_5:
	mov	r1, 4194304
	mov	r0, x2
	call	__bit_or
	mov	x4, rax
	jmp	.LBB0_44
.LBB0_6:
	mov	r0, 2139095040
	jne	x0, r0, .LBB0_8
	jmp	.LBB0_7
.LBB0_7:
	mov	r0, x2
	mov	r1, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
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
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 2143289344
	sub	r1, x1
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	add	x4, x1
	jmp	.LBB0_44
.LBB0_8:
	je	x3, r0, .LBB0_44
	jmp	.LBB0_9
.LBB0_9:
	jnz	x0, .LBB0_12
	jmp	.LBB0_10
.LBB0_10:
	jnz	x3, .LBB0_44
	jmp	.LBB0_11
.LBB0_11:
	mov	r0, x2
	mov	r1, x1
	call	__bit_and
	mov	x4, rax
	jmp	.LBB0_44
.LBB0_12:
	mov	x4, x1
	jz	x3, .LBB0_44
	jmp	.LBB0_13
.LBB0_13:
	mov	x4, x1
	jg	x3, x0, .LBB0_15
	jmp	.LBB0_14
.LBB0_14:
	mov	x4, x2
.LBB0_15:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x3
	call	__bit_xor
	mov	x3, x2
	jg	rax, x0, .LBB0_17
	jmp	.LBB0_16
.LBB0_16:
	mov	x3, x1
.LBB0_17:
	mov	r1, 23
	mov	r0, x3
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 23
	mov	x0, rax
	mov	r0, x4
	call	__bit_shr
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 8388607
	mov	x6, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 8388607
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	mov	x4, rax
	jnz	x0, .LBB0_19
	jmp	.LBB0_18
.LBB0_18:
	mov	r1, 1
	mov	r0, x5
	call	__bit_shr
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x0, rax
	mov	r0, x0
	call	__bit_shr
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x0, rax
	mov	r0, x0
	call	__bit_shr
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x0, rax
	mov	r0, x0
	call	__bit_shr
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x0, rax
	mov	r0, x0
	call	__bit_shr
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x0, rax
	mov	r0, x0
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x0, rax
	mov	r1, 2
	mov	r0, x0
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x7, rax
	mov	r0, x0
	call	__bit_and
	add	x7, rax
	mov	r1, 4
	mov	r0, x7
	call	__bit_shr
	add	x7, rax
	mov	r1, 252645135
	mov	r0, x7
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	x7, 24
	mov	r0, rax
	call	__bit_shr
	mov	x0, rax
	sub	x7, x0
	mov	r0, x5
	mov	r1, x7
	call	__bit_shl
	mov	x5, rax
add	x0, -23
.LBB0_19:
	jnz	x6, .LBB0_21
	jmp	.LBB0_20
.LBB0_20:
	mov	r1, 1
	mov	r0, x4
	call	__bit_shr
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	x6, rax
	mov	r0, x6
	call	__bit_shr
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 4
	mov	x6, rax
	mov	r0, x6
	call	__bit_shr
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	x6, rax
	mov	r0, x6
	call	__bit_shr
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 16
	mov	x6, rax
	mov	r0, x6
	call	__bit_shr
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	x6, rax
	mov	r0, x6
	call	__bit_shr
	mov	r1, 1431655765
	mov	r0, rax
	call	__bit_and
	sub	x6, rax
	mov	r1, 2
	mov	r0, x6
	call	__bit_shr
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993459
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	add	x7, rax
	mov	r1, 4
	mov	r0, x7
	call	__bit_shr
	add	x7, rax
	mov	r1, 252645135
	mov	r0, x7
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	x7, 24
	mov	r0, rax
	call	__bit_shr
	mov	x6, rax
	sub	x7, x6
	mov	r0, x4
	mov	r1, x7
	call	__bit_shl
	mov	x4, rax
add	x6, -23
.LBB0_21:
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_and
	mov	x3, rax
	mov	r0, x2
	mov	r1, x1
	call	__bit_xor
	mov	r1, 3
	mov	x2, rax
	mov	r0, x5
	call	__bit_shl
	mov	r1, 67108864
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	x1, rax
	mov	r0, x4
	call	__bit_shl
	mov	r1, 67108864
	mov	r0, rax
	call	__bit_or
	mov	x4, rax
	mov	x5, x4
	je	x0, x6, .LBB0_24
	jmp	.LBB0_22
.LBB0_22:
	mov	x7, x0
	sub	x7, x6
	mov	r1, -2147483648
	mov	x5, 1
	mov	r0, x7
	call	__bit_xor
	mov	r0, -2147483617
	jg	rax, r0, .LBB0_24
	jmp	.LBB0_23
.LBB0_23:
	mov	r1, 32
	sub	r1, x7
	mov	r0, x4
	call	__bit_shl
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
	mov	x5, rax
	mov	r0, x4
	mov	r1, x7
	call	__bit_shr
	mov	r1, 1
	mov	x4, rax
	mov	r0, x5
	call	__bit_and
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	x5, rax
.LBB0_24:
	mov	r0, -1
	jg	x2, r0, .LBB0_28
	jmp	.LBB0_25
.LBB0_25:
	mov	x4, 0
	je	x1, x5, .LBB0_44
	jmp	.LBB0_26
.LBB0_26:
	sub	x1, x5
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2080374785
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
	mov	x4, rax
	mov	r0, x2
	call	__bit_and
	add	x4, rax
	mov	r1, 4
	mov	r0, x4
	call	__bit_shr
	add	x4, rax
	mov	r1, 252645135
	mov	r0, x4
	call	__bit_and
	mul	rax, 16843009
	mov	r1, 24
	mov	r0, rax
	call	__bit_shr
	mov	x2, 27
	sub	x2, rax
	mov	r0, x1
	mov	r1, x2
	call	__bit_shl
	mov	x1, rax
	sub	x0, x2
	jmp	.LBB0_32
.LBB0_28:
	add	x1, x5
	mov	r1, 134217728
	mov	r0, x1
	call	__bit_and
	jz	rax, .LBB0_30
	jmp	.LBB0_29
.LBB0_29:
	mov	r1, 1
	mov	r0, x1
	call	__bit_shr
	mov	r1, 1
	mov	x1, rax
	mov	r0, x5
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	x1, rax
add	x0, 1
.LBB0_30:
	mov	r0, 255
	jl	x0, r0, .LBB0_32
	jmp	.LBB0_31
.LBB0_31:
	mov	r1, 2139095040
	mov	r0, x3
	call	__bit_or
	mov	x4, rax
	jmp	.LBB0_44
.LBB0_32:
	mov	r0, 0
	jg	x0, r0, .LBB0_34
	jmp	.LBB0_33
.LBB0_33:
	mov	x2, 1
	sub	x2, x0
add	x0, 31
	mov	r0, x1
	mov	r1, x0
	call	__bit_shl
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
	mov	x0, rax
	mov	r0, x1
	mov	r1, x2
	call	__bit_shr
	mov	r1, 1
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	x1, rax
	mov	x0, 0
.LBB0_34:
	mov	r1, 7
	mov	r0, x1
	call	__bit_and
	mov	r1, 3
	mov	x2, rax
	mov	r0, x1
	call	__bit_shr
	mov	r1, 8388607
	mov	x1, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 23
	mov	x4, rax
	mov	r0, x0
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	x0, rax
	call	__fe_getround
	mov	r0, 2
	je	rax, r0, .LBB0_40
	jmp	.LBB0_35
.LBB0_35:
	mov	r0, 1
	je	rax, r0, .LBB0_39
	jmp	.LBB0_36
.LBB0_36:
	mov	x4, x0
	jnz	rax, .LBB0_41
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
	mov	x4, rax
	mov	r0, 4
	add	x4, x0
	jne	x2, r0, .LBB0_41
	jmp	.LBB0_38
.LBB0_38:
	mov	r1, 1
	mov	r0, x1
	call	__bit_and
	add	x0, rax
	mov	x4, x0
	jmp	.LBB0_42
.LBB0_39:
	mov	r0, x3
	call	__bit_not
add	rax, 1
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x1, rax
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	x0, rax
	mov	x4, x0
	jmp	.LBB0_41
.LBB0_40:
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
	mov	x1, rax
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	x0, rax
	mov	x4, x0
.LBB0_41:
	jz	x2, .LBB0_43
	jmp	.LBB0_42
.LBB0_42:
	call	__fe_raise_inexact
.LBB0_43:
.LBB0_44:
	mov	rax, x4
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
