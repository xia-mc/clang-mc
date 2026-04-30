#include "_ll_std"

// int64 signed division wrapper around the existing uint64 division helper.
// Arguments: dividend r0:r1, divisor r2:r3. Result: rax:t0.
__divdi3:
	mov	x0, 0
	jl	r1, 0, .dividend_neg
	jmp	.dividend_done
.dividend_neg:
	mov	x0, 1
	mov	x1, r2
	mov	x2, r3
	mov	r2, r0
	mov	r3, r1
	mov	r0, 0
	mov	r1, 0
	call	__subdi3
	mov	r0, rax
	mov	r1, t0
	mov	r2, x1
	mov	r3, x2
.dividend_done:
	jl	r3, 0, .divisor_neg
	jmp	.divisor_done
.divisor_neg:
	mov	x1, 1
	mov	r4, r0
	mov	r5, r1
	mov	r0, 0
	mov	r1, 0
	call	__subdi3
	mov	r2, rax
	mov	r3, t0
	mov	r0, r4
	mov	r1, r5
	mov	r4, x0
	mov	r0, r4
	mov	r1, x1
	call	__bit_xor
	mov	x0, rax
	mov	r0, r4
	mov	r1, r5
.divisor_done:
	call	__udivdi3
	jnz	x0, .negate_result
	ret
.negate_result:
	mov	r2, rax
	mov	r3, t0
	mov	r0, 0
	mov	r1, 0
	call	__subdi3
	ret
