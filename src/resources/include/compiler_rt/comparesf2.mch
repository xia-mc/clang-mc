#include "_ll_std"

// Single-precision comparison helpers are implemented by extending both
// operands to double and reusing the existing double comparison runtime.

__ltsf2:
	mov	x0, r1
	call	__extendsfdf2
	mov	x1, rax
	mov	x2, t0
	mov	r0, x0
	call	__extendsfdf2
	mov	r2, rax
	mov	r3, t0
	mov	r0, x1
	mov	r1, x2
	call	__ledf2
	ret

__gtsf2:
	mov	x0, r1
	call	__extendsfdf2
	mov	x1, rax
	mov	x2, t0
	mov	r0, x0
	call	__extendsfdf2
	mov	r2, rax
	mov	r3, t0
	mov	r0, x1
	mov	r1, x2
	call	__gedf2
	ret

__nesf2:
	mov	x0, r1
	call	__extendsfdf2
	mov	x1, rax
	mov	x2, t0
	mov	r0, x0
	call	__extendsfdf2
	mov	r2, rax
	mov	r3, t0
	mov	r0, x1
	mov	r1, x2
	call	__ledf2
	ret

__unordsf2:
	mov	x0, r1
	call	__extendsfdf2
	mov	x1, rax
	mov	x2, t0
	mov	r0, x0
	call	__extendsfdf2
	mov	r2, rax
	mov	r3, t0
	mov	r0, x1
	mov	r1, x2
	call	__unorddf2
	ret
