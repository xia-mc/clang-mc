#include "_ll_std"

// Convert uint32_t in r0 to double in rax:t0.
__floatunsidf:
	mov	x0, r0
	jl	r0, 0, .large
	call	__floatsidf
	ret
.large:
	mov	r1, 1
	call	__bit_shr
	call	__floatsidf
	mov	r0, rax
	mov	r1, t0
	mov	r2, rax
	mov	r3, t0
	call	__adddf3
	mov	r1, 1
	mov	r4, rax
	mov	r5, t0
	mov	r0, x0
	call	__bit_and
	jnz	rax, .add_one
	mov	rax, r4
	mov	t0, r5
	ret
.add_one:
	mov	r0, r4
	mov	r1, r5
	mov	r2, 0
	mov	r3, 1072693248
	call	__adddf3
	ret
