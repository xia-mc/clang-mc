#once

#include "_ll_std"

// -- Begin function cabs
cabs:                                   // @cabs
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, [r0]
	mov	r3, r0
add	r3, 4
	mov	r1, r0
add	r1, 8
	mov	r2, [r1]
add	r0, 12
	mov	r1, [r0]
	mov	x1, [r3]
	mov	r0, r2
	mov	r3, r1
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x0
	mov	r1, x1
	mov	r2, x0
	mov	r3, x1
	call	__muldf3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x2
	mov	r3, x3
	call	__adddf3
	mov	r1, t0
	mov	r0, rax
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	jmp	sqrt
// -- End function
// -- Begin function creal
creal:                                  // @creal
// %bb.0:
	mov	rax, [r0]
add	r0, 4
	mov	t0, [r0]
	ret
// -- End function
// -- Begin function cimag
cimag:                                  // @cimag
// %bb.0:
	mov	r1, r0
add	r1, 8
	mov	rax, [r1]
add	r0, 12
	mov	t0, [r0]
	ret
// -- End function
// -- Begin function cabsf
cabsf:                                  // @cabsf
// %bb.0:
sub	rsp, 8
	mov	[rsp+4], x0
	mov	[rsp], x1
	mov	x0, [r0]
add	r0, 4
	mov	r0, [r0]
	mov	r1, r0
	call	__mulsf3
	mov	x1, rax
	mov	r0, x0
	mov	r1, x0
	call	__mulsf3
	mov	r0, rax
	mov	r1, x1
	call	__addsf3
	mov	r0, rax
	call	__extendsfdf2
	mov	r1, t0
	mov	r0, rax
	call	sqrt
	mov	r1, t0
	mov	r0, rax
	call	__truncdfsf2
	mov	x1, [rsp]
	mov	x0, [rsp+4]
add	rsp, 8
	ret
// -- End function
// -- Begin function crealf
crealf:                                 // @crealf
// %bb.0:
	mov	rax, [r0]
	ret
// -- End function
// -- Begin function cimagf
cimagf:                                 // @cimagf
// %bb.0:
add	r0, 4
	mov	rax, [r0]
	ret
// -- End function
// -- Begin function cabsl
cabsl:                                  // @cabsl
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, [r0]
	mov	r3, r0
add	r3, 4
	mov	r1, r0
add	r1, 8
	mov	r2, [r1]
add	r0, 12
	mov	r1, [r0]
	mov	x1, [r3]
	mov	r0, r2
	mov	r3, r1
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x0
	mov	r1, x1
	mov	r2, x0
	mov	r3, x1
	call	__muldf3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x2
	mov	r3, x3
	call	__adddf3
	mov	r1, t0
	mov	r0, rax
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	jmp	sqrt
// -- End function
// -- Begin function creall
creall:                                 // @creall
// %bb.0:
	mov	rax, [r0]
add	r0, 4
	mov	t0, [r0]
	ret
// -- End function
// -- Begin function cimagl
cimagl:                                 // @cimagl
// %bb.0:
	mov	r1, r0
add	r1, 8
	mov	rax, [r1]
add	r0, 12
	mov	t0, [r0]
	ret
// -- End function
// -- Begin function conj
conj:                                   // @conj
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x0, [r1]
	mov	r2, r1
add	r2, 4
	mov	r3, r1
add	r3, 8
	mov	x1, [r3]
add	r1, 12
	mov	x2, [r1]
	mov	x3, [r2]
	mov	r2, 0
	mov	r3, -2147483648
	mov	x4, r0
	mov	r0, x1
	mov	r1, x2
	call	__muldf3
	mov	r3, t0
	mov	r0, x0
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r1, -2147483648
	mov	x0, rax
	mov	x3, t0
	mov	r0, x2
	call	__bit_xor
	mov	r0, x4
add	r0, 8
	mov	[x4], x0
	mov	r1, x4
add	r1, 4
	mov	[r1], x3
	mov	[r0], x1
add	x4, 12
	mov	[x4], rax
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function conjf
conjf:                                  // @conjf
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, [r1]
add	r1, 4
	mov	x1, [r1]
	mov	r1, -2147483648
	mov	x2, r0
	mov	r0, x1
	call	__mulsf3
	mov	r0, x0
	mov	r1, rax
	call	__addsf3
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x1
	call	__bit_xor
	mov	[x2], x0
add	x2, 4
	mov	[x2], rax
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function conjl
conjl:                                  // @conjl
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x0, [r1]
	mov	r2, r1
add	r2, 4
	mov	r3, r1
add	r3, 8
	mov	x1, [r3]
add	r1, 12
	mov	x2, [r1]
	mov	x3, [r2]
	mov	r2, 0
	mov	r3, -2147483648
	mov	x4, r0
	mov	r0, x1
	mov	r1, x2
	call	__muldf3
	mov	r3, t0
	mov	r0, x0
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r1, -2147483648
	mov	x0, rax
	mov	x3, t0
	mov	r0, x2
	call	__bit_xor
	mov	r0, x4
add	r0, 8
	mov	[x4], x0
	mov	r1, x4
add	r1, 4
	mov	[r1], x3
	mov	[r0], x1
add	x4, 12
	mov	[x4], rax
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function isupper
isupper:                                // @isupper
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	mov	x1, x0
add	x1, -65
	mov	r0, x1
	call	__bit_not
	mov	r1, 26
	mov	r0, rax
	call	__bit_and
	mov	r1, 26
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -91
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
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
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function islower
islower:                                // @islower
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	mov	x1, x0
add	x1, -97
	mov	r0, x1
	call	__bit_not
	mov	r1, 26
	mov	r0, rax
	call	__bit_and
	mov	r1, 26
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -123
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
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
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function isalpha
isalpha:                                // @isalpha
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	r1, -33
	call	__bit_and
	mov	x0, rax
	mov	x1, x0
add	x1, -65
	mov	r0, x1
	call	__bit_not
	mov	r1, 26
	mov	r0, rax
	call	__bit_and
	mov	r1, 26
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -91
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
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
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function isdigit
isdigit:                                // @isdigit
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	mov	x1, x0
add	x1, -48
	mov	r0, x1
	call	__bit_not
	mov	r1, 10
	mov	r0, rax
	call	__bit_and
	mov	r1, 10
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -58
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
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
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function isxdigit
isxdigit:                               // @isxdigit
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r0
	mov	x1, x0
add	x1, -48
	mov	r0, x1
	call	__bit_not
	mov	r1, 10
	mov	r0, rax
	call	__bit_and
	mov	r1, 10
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
add	r1, -58
	mov	r0, rax
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -33
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	x0, rax
	mov	x2, x0
add	x2, -65
	mov	r0, x2
	call	__bit_not
	mov	r1, 6
	mov	r0, rax
	call	__bit_and
	mov	r1, 6
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -71
	mov	r0, rax
	mov	r1, x0
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
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function isalnum
isalnum:                                // @isalnum
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	r1, -33
	mov	x0, r0
	call	__bit_and
	mov	x1, rax
	mov	x2, x1
add	x2, -65
	mov	r0, x2
	call	__bit_not
	mov	r1, 26
	mov	r0, rax
	call	__bit_and
	mov	r1, 26
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -91
	mov	r0, rax
	mov	r1, x1
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
	mov	x1, x0
add	x1, -48
	mov	x2, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, 10
	mov	r0, rax
	call	__bit_and
	mov	r1, 10
	mov	x3, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -58
	mov	r0, rax
	mov	r1, x0
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
	mov	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function isspace
isspace:                                // @isspace
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
add	r0, -9
	mov	r1, -2147483648
	mov	x1, 1
	call	__bit_xor
	mov	x2, -2147483646
	jl	rax, x2, .LBB18_4
	jmp	.LBB18_1
.LBB18_1:
	mov	r0, x0
add	r0, -12
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, x2, .LBB18_4
	jmp	.LBB18_2
.LBB18_2:
	mov	r0, 32
	je	x0, r0, .LBB18_4
	jmp	.LBB18_3
.LBB18_3:
	mov	r1, 11
	mov	r0, x0
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
.LBB18_4:
	mov	rax, x1
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function isblank
isblank:                                // @isblank
// %bb.0:
sub	rsp, 8
	mov	[rsp+4], x0
	mov	[rsp], x1
	mov	r1, 32
	mov	x0, r0
	call	__bit_xor
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
	mov	r1, 9
	mov	x1, rax
	mov	r0, x0
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
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, [rsp]
	mov	x0, [rsp+4]
add	rsp, 8
	ret
// -- End function
// -- Begin function iscntrl
iscntrl:                                // @iscntrl
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r0
	call	__bit_not
	mov	r1, 128
	mov	r0, rax
	call	__bit_and
	mov	r1, 128
	mov	x1, rax
	mov	r0, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
add	r1, -128
	mov	r0, rax
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
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x0
	call	__bit_xor
	mov	x2, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, -2147483616
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483616
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x2, 2147483616
	mov	r0, rax
	mov	r1, x2
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
	mov	r1, 127
	mov	x2, rax
	mov	r0, x0
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
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function isprint
isprint:                                // @isprint
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	mov	x1, x0
add	x1, -32
	mov	r0, x1
	call	__bit_not
	mov	r1, 95
	mov	r0, rax
	call	__bit_and
	mov	r1, 95
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -127
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
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
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function isgraph
isgraph:                                // @isgraph
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	mov	x1, x0
add	x1, -33
	mov	r0, x1
	call	__bit_not
	mov	r1, 94
	mov	r0, rax
	call	__bit_and
	mov	r1, 94
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -127
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
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
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function ispunct
ispunct:                                // @ispunct
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r0
add	r0, -127
	mov	r1, -2147483648
	mov	x1, 0
	call	__bit_xor
	mov	r0, 2147483554
	jl	rax, r0, .LBB23_2
	jmp	.LBB23_1
.LBB23_1:
	mov	r1, 95
	mov	r0, x0
	call	__bit_and
	mov	x1, rax
	mov	x2, x1
add	x2, -91
	mov	r0, x2
	call	__bit_not
	mov	r1, -26
	mov	r0, rax
	call	__bit_and
	mov	r1, -26
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -65
	mov	r0, rax
	mov	r1, x1
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
	mov	x1, x0
add	x1, -58
	mov	x2, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, -10
	mov	r0, rax
	call	__bit_and
	mov	r1, -10
	mov	x3, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -48
	mov	r0, rax
	mov	r1, x0
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
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
.LBB23_2:
	mov	rax, x1
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function tolower
tolower:                                // @tolower
// %bb.0:
sub	rsp, 4
	mov	[rsp], x0
	mov	x0, r0
add	r0, -91
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483622
	jl	rax, r0, .LBB24_2
	jmp	.LBB24_1
.LBB24_1:
add	x0, 32
.LBB24_2:
	mov	rax, x0
	mov	x0, [rsp]
add	rsp, 4
	ret
// -- End function
// -- Begin function toupper
toupper:                                // @toupper
// %bb.0:
sub	rsp, 4
	mov	[rsp], x0
	mov	x0, r0
add	r0, -123
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483622
	jl	rax, r0, .LBB25_2
	jmp	.LBB25_1
.LBB25_1:
add	x0, -32
.LBB25_2:
	mov	rax, x0
	mov	x0, [rsp]
add	rsp, 4
	ret
// -- End function
// -- Begin function imaxabs
imaxabs:                                // @imaxabs
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x0, r1
	mov	r1, -2147483648
	mov	x1, r0
	mov	r0, x0
	call	__bit_xor
	mov	x2, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x2, -2147483648
	mov	r0, rax
	mov	r1, x2
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
	mov	r0, rax
	call	__bit_not
	mov	x2, rax
add	x2, 1
	mov	r0, x1
	add	r0, r0
	mov	r1, 0
	sub	r1, r0
	mov	x3, 0
	mov	r0, x2
	call	__bit_and
	mov	x4, rax
	add	x4, x1
	mov	r0, x1
	call	__bit_not
add	rax, 1
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	rax, x0
	add	rax, x0
	sub	x3, rax
	mov	r0, x2
	mov	r1, x3
	call	__bit_and
	add	x0, rax
	mov	rax, x4
	mov	t0, x0
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function imaxdiv
imaxdiv:                                // @imaxdiv
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x0, r4
	mov	x1, r3
	mov	x2, r2
	mov	x3, r1
	mov	x4, r0
	mov	r0, x3
	mov	r1, x2
	mov	r2, x1
	mov	r3, x0
	call	__divdi3
	mov	r1, t0
	mov	r0, x4
add	r0, 4
	mov	[r0], r1
	mov	[x4], rax
	mov	r0, rax
	mov	r2, x1
	mov	r3, x0
	call	__muldi3
	mov	r3, t0
	mov	r0, x3
	mov	r1, x2
	mov	r2, rax
	call	__subdi3
	mov	r0, x4
add	r0, 8
add	x4, 12
	mov	[x4], t0
	mov	[r0], rax
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function strtoimax
strtoimax:                              // @strtoimax
// %bb.0:
	jmp	strtoll
// -- End function
// -- Begin function strtoumax
strtoumax:                              // @strtoumax
// %bb.0:
	jmp	strtoull
// -- End function
// -- Begin function setlocale
setlocale:                              // @setlocale
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x0, r1
	mov	r1, -2147483648
	mov	x2, 0
	call	__bit_xor
	mov	r0, -2147483643
	jg	rax, r0, .LBB30_25
	jmp	.LBB30_1
.LBB30_1:
	mov	x2, mcasm_static_996e1d748484e5eb9a065a5aad9ce076
	jz	x0, .LBB30_25
	jmp	.LBB30_2
.LBB30_2:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x1, rax
	jz	x1, .LBB30_25
	jmp	.LBB30_3
.LBB30_3:
	mov	r1, 3
	mov	r0, x0
	call	__bit_and
	mov	x3, rax
	mov	x4, x1
	jnz	x3, .LBB30_6
	jmp	.LBB30_4
.LBB30_4:
	mov	x4, [x0]
	mov	r0, 67
	je	x4, r0, .LBB30_25
	jmp	.LBB30_5
.LBB30_5:
	mov	r1, 255
	mov	r0, x4
	call	__bit_and
	jz	rax, .LBB30_13
	jmp	.LBB30_6
.LBB30_6:                               // %.preheader.i.preheader
	mov	x5, 0
.LBB30_7:                               // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, mcasm_static_d9ce338f646ea8c30ea22778eb9060c2
	add	r0, x5
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x4
	call	__bit_and
	jne	rax, x2, .LBB30_10
	jmp	.LBB30_8
.LBB30_8:                               //   in Loop: Header=BB30_7 Depth=1
	mov	r0, x0
	add	r0, x5
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
add	x5, 1
	jnz	x4, .LBB30_7
	jmp	.LBB30_9
.LBB30_9:                               // %strcmp.exitsplit
	mov	r0, mcasm_static_d9ce338f646ea8c30ea22778eb9060c2
	add	r0, x5
	mov	x4, 0
	jmp	.LBB30_11
.LBB30_10:                              // %.preheader.i.strcmp.exit_crit_edge
	mov	r0, mcasm_static_d9ce338f646ea8c30ea22778eb9060c2
	add	r0, x5
.LBB30_11:                              // %strcmp.exit
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	mov	x2, mcasm_static_996e1d748484e5eb9a065a5aad9ce076
	je	rax, x5, .LBB30_25
	jmp	.LBB30_12
.LBB30_12:
	mov	x4, mcasm_static_d5660bed37806e0ae012cfdeb23a8ae3
	jnz	x3, .LBB30_18
	jmp	.LBB30_13
.LBB30_13:                              // %.thread24
	mov	x1, [x0]
	mov	r1, 1230196560
	mov	x4, mcasm_static_d5660bed37806e0ae012cfdeb23a8ae3
	jne	x1, r1, .LBB30_18
	jmp	.LBB30_14
.LBB30_14:                              // %.preheader5.i2.preheader
	mov	x1, -2139062144
.LBB30_15:                              // %.preheader5.i2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x1, .LBB30_24
	jmp	.LBB30_16
.LBB30_16:                              //   in Loop: Header=BB30_15 Depth=1
add	x0, 4
add	x4, 4
	mov	r1, [x0]
	mov	r0, [x4]
	je	r1, r0, .LBB30_15
	jmp	.LBB30_17
.LBB30_17:
	mov	x1, r1
.LBB30_18:
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	x2, 0
	mov	x3, 0
	jz	rax, .LBB30_23
	jmp	.LBB30_19
.LBB30_19:                              // %.preheader.i1.preheader
add	x0, 1
.LBB30_20:                              // %.preheader.i1
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, x1
	jne	rax, x3, .LBB30_22
	jmp	.LBB30_21
.LBB30_21:                              //   in Loop: Header=BB30_20 Depth=1
	mov	r0, [x0]
	mov	r1, 255
add	x4, 1
	call	__bit_and
	mov	x1, rax
add	x0, 1
	mov	r0, 0
	jnz	x1, .LBB30_20
	jmp	.LBB30_22
.LBB30_22:
	mov	r1, 255
	call	__bit_and
	mov	x3, rax
.LBB30_23:                              // %strcmp.exit3
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	r0, x3
	mov	r1, rax
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB30_25
	jmp	.LBB30_24
.LBB30_24:                              // %strcmp.exit3.thread
	mov	x2, mcasm_static_996e1d748484e5eb9a065a5aad9ce076
.LBB30_25:                              // %strcmp.exit.thread
	mov	rax, x2
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function localeconv
localeconv:                             // @localeconv
// %bb.0:
	mov	rax, mcasm_static_5cf5ce2b3b11ee416e97c5e21586bede
	ret
// -- End function
// -- Begin function fabs
fabs:                                   // @fabs
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	r2, 0
	mov	r3, 0
	mov	x0, r1
	mov	x1, r0
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x2
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x3, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x0
	call	__bit_xor
	mov	x3, rax
	mov	r0, x2
	call	__bit_not
add	rax, 1
	sub	x3, x0
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	add	x0, rax
	mov	rax, x1
	mov	t0, x0
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function fabsf
fabsf:                                  // @fabsf
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	r1, 0
	mov	x0, r0
	call	__ltsf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -2147483648
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x0
	call	__bit_xor
	mov	x2, rax
	mov	r0, x1
	call	__bit_not
add	rax, 1
	sub	x2, x0
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	add	rax, x0
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function fabsl
fabsl:                                  // @fabsl
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	r2, 0
	mov	r3, 0
	mov	x0, r1
	mov	x1, r0
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x2
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x3, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x0
	call	__bit_xor
	mov	x3, rax
	mov	r0, x2
	call	__bit_not
add	rax, 1
	sub	x3, x0
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	add	x0, rax
	mov	rax, x1
	mov	t0, x0
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function trunc
trunc:                                  // @trunc
// %bb.0:
	call	__fixdfsi
	mov	r0, rax
	call	__floatsidf
	ret
// -- End function
// -- Begin function truncf
truncf:                                 // @truncf
// %bb.0:
	call	__fixsfsi
	mov	r0, rax
	call	__floatsisf
	ret
// -- End function
// -- Begin function truncl
truncl:                                 // @truncl
// %bb.0:
	call	__fixdfsi
	mov	r0, rax
	call	__floatsidf
	ret
// -- End function
// -- Begin function floor
floor:                                  // @floor
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x1, r1
	mov	x2, r0
	call	__fixdfsi
	mov	x0, rax
	mov	r0, x0
	call	__floatsidf
	mov	r3, t0
	mov	r0, x2
	mov	r1, x1
	mov	r2, rax
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -2147483648
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	add	x0, rax
add	x0, 1
	mov	r0, x0
	call	__floatsidf
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function floorf
floorf:                                 // @floorf
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	call	__extendsfdf2
	mov	x1, rax
	mov	x2, t0
	mov	r0, x0
	call	__fixsfsi
	mov	x0, rax
	mov	r0, x0
	call	__floatsidf
	mov	r3, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, rax
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -2147483648
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	add	x0, rax
add	x0, 1
	mov	r0, x0
	call	__floatsisf
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function floorl
floorl:                                 // @floorl
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x1, r1
	mov	x2, r0
	call	__fixdfsi
	mov	x0, rax
	mov	r0, x0
	call	__floatsidf
	mov	r3, t0
	mov	r0, x2
	mov	r1, x1
	mov	r2, rax
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -2147483648
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	add	x0, rax
add	x0, 1
	mov	r0, x0
	call	__floatsidf
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function ceil
ceil:                                   // @ceil
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x1, r1
	mov	x2, r0
	call	__fixdfsi
	mov	x0, rax
	mov	r0, x0
	call	__floatsidf
	mov	r3, t0
	mov	r0, x2
	mov	r1, x1
	mov	r2, rax
	call	__gtdf2
	mov	r1, -2147483648
	mov	x1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, 2147483647
	mov	x2, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x1, x2
	mov	r0, rax
	mov	r1, x1
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	x0, rax
	mov	r0, x0
	call	__floatsidf
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function ceilf
ceilf:                                  // @ceilf
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r0
	call	__extendsfdf2
	mov	x1, rax
	mov	x2, t0
	mov	r0, x0
	call	__fixsfsi
	mov	x0, rax
	mov	r0, x0
	call	__floatsidf
	mov	r3, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, rax
	call	__gtdf2
	mov	r1, -2147483648
	mov	x1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, 2147483647
	mov	x2, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x1, x2
	mov	r0, rax
	mov	r1, x1
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	x0, rax
	mov	r0, x0
	call	__floatsisf
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function ceill
ceill:                                  // @ceill
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x1, r1
	mov	x2, r0
	call	__fixdfsi
	mov	x0, rax
	mov	r0, x0
	call	__floatsidf
	mov	r3, t0
	mov	r0, x2
	mov	r1, x1
	mov	r2, rax
	call	__gtdf2
	mov	r1, -2147483648
	mov	x1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, 2147483647
	mov	x2, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x1, x2
	mov	r0, rax
	mov	r1, x1
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	x0, rax
	mov	r0, x0
	call	__floatsidf
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function round
round:                                  // @round
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	r2, 0
	mov	r3, 0
	mov	x0, r1
	mov	x1, r0
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB44_2
	jmp	.LBB44_1
.LBB44_1:
	mov	r2, 0
	mov	r3, -1075838976
	mov	r0, x1
	mov	r1, x0
	call	__adddf3
	mov	x0, rax
	mov	x1, t0
	mov	r0, x0
	mov	r1, x1
	call	__fixdfsi
	mov	x2, rax
	mov	r0, x2
	call	__floatsidf
	mov	r3, t0
	mov	r0, x0
	mov	r1, x1
	mov	r2, rax
	call	__gtdf2
	mov	r1, -2147483648
	mov	x0, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x0, x1
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r1, 2147483647
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
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
	add	rax, x2
	jmp	.LBB44_3
.LBB44_2:
	mov	r2, 0
	mov	r3, 1071644672
	mov	r0, x1
	mov	r1, x0
	call	__adddf3
	mov	x0, rax
	mov	x1, t0
	mov	r0, x0
	mov	r1, x1
	call	__fixdfsi
	mov	x2, rax
	mov	r0, x2
	call	__floatsidf
	mov	r3, t0
	mov	r0, x0
	mov	r1, x1
	mov	r2, rax
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	mov	r0, x0
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	add	rax, x2
add	rax, 1
.LBB44_3:
	mov	r0, rax
	call	__floatsidf
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function roundf
roundf:                                 // @roundf
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x2, r0
	call	__extendsfdf2
	mov	r1, 0
	mov	x1, rax
	mov	x0, t0
	mov	r0, x2
	call	__ltsf2
	mov	r0, -1
	jg	rax, r0, .LBB45_2
	jmp	.LBB45_1
.LBB45_1:
	mov	r2, 0
	mov	r3, -1075838976
	mov	r0, x1
	mov	r1, x0
	call	__adddf3
	mov	x0, rax
	mov	x1, t0
	mov	r0, x0
	mov	r1, x1
	call	__fixdfsi
	mov	x2, rax
	mov	r0, x2
	call	__floatsidf
	mov	r3, t0
	mov	r0, x0
	mov	r1, x1
	mov	r2, rax
	call	__gtdf2
	mov	r1, -2147483648
	mov	x0, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x0, x1
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r1, 2147483647
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
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
	add	rax, x2
	jmp	.LBB45_3
.LBB45_2:
	mov	r2, 0
	mov	r3, 1071644672
	mov	r0, x1
	mov	r1, x0
	call	__adddf3
	mov	x0, rax
	mov	x1, t0
	mov	r0, x0
	mov	r1, x1
	call	__fixdfsi
	mov	x2, rax
	mov	r0, x2
	call	__floatsidf
	mov	r3, t0
	mov	r0, x0
	mov	r1, x1
	mov	r2, rax
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	mov	r0, x0
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	add	rax, x2
add	rax, 1
.LBB45_3:
	mov	r0, rax
	call	__floatsisf
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function roundl
roundl:                                 // @roundl
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	r2, 0
	mov	r3, 0
	mov	x0, r1
	mov	x1, r0
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB46_2
	jmp	.LBB46_1
.LBB46_1:
	mov	r2, 0
	mov	r3, -1075838976
	mov	r0, x1
	mov	r1, x0
	call	__adddf3
	mov	x0, rax
	mov	x1, t0
	mov	r0, x0
	mov	r1, x1
	call	__fixdfsi
	mov	x2, rax
	mov	r0, x2
	call	__floatsidf
	mov	r3, t0
	mov	r0, x0
	mov	r1, x1
	mov	r2, rax
	call	__gtdf2
	mov	r1, -2147483648
	mov	x0, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x0, x1
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r1, 2147483647
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
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
	add	rax, x2
	jmp	.LBB46_3
.LBB46_2:
	mov	r2, 0
	mov	r3, 1071644672
	mov	r0, x1
	mov	r1, x0
	call	__adddf3
	mov	x0, rax
	mov	x1, t0
	mov	r0, x0
	mov	r1, x1
	call	__fixdfsi
	mov	x2, rax
	mov	r0, x2
	call	__floatsidf
	mov	r3, t0
	mov	r0, x0
	mov	r1, x1
	mov	r2, rax
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	mov	r0, x0
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	add	rax, x2
add	rax, 1
.LBB46_3:
	mov	r0, rax
	call	__floatsidf
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function sqrt
sqrt:                                   // @sqrt
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
	mov	r2, 0
	mov	r3, 0
	mov	x0, r1
	mov	x1, r0
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB47_2
	jmp	.LBB47_1
.LBB47_1:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 33
	mov	x0, 2146959360
	mov	x1, 0
	jmp	.LBB47_4
.LBB47_2:
	mov	r1, 2147483647
	mov	r0, x0
	call	__bit_and
	mov	r1, 2146435072
	mov	x3, rax
	mov	r0, x3
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
	mov	x5, rax
	mov	r1, -2147483648
	mov	x2, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r1, 1048575
	mov	x4, rax
	mov	r0, x4
	call	__bit_and
	mov	x6, rax
	mov	r1, -1048576
	mov	x7, -1048576
	mov	r0, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x7, x4
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
	mov	x4, rax
	mov	r0, x1
	call	__bit_not
add	rax, 1
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	sub	rax, x4
add	x5, 1
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	r1, 2146435072
	mov	x5, rax
	mov	r0, x0
	call	__bit_xor
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	x6, rax
	mov	r0, x6
	call	__bit_not
	mov	x7, rax
	mov	r0, x1
	mov	r1, x3
	call	__bit_or
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
add	x7, 1
	mov	x3, rax
	mov	r0, x6
	mov	r1, x7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	add	x5, x4
	mov	r0, rax
	mov	r1, x5
	call	__bit_or
	jnz	rax, .LBB47_4
	jmp	.LBB47_3
.LBB47_3:
	mov	r2, 0
	mov	r3, 1072693248
	mov	r0, x1
	mov	r1, x0
	call	__gtdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x2, x3
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r1, 2147483647
	mov	x2, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	x2, rax
add	x2, 1
	mov	r1, x0
add	r1, -1072693248
	mov	r0, x2
	call	__bit_and
	mov	x3, rax
	mov	r0, x2
	mov	r1, x1
	call	__bit_and
add	x3, 1072693248
	mov	x2, rax
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	r2, 0
	mov	r3, 1071644672
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x1, rax
	mov	x0, t0
.LBB47_4:
	mov	rax, x1
	mov	t0, x0
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
// -- Begin function sqrtf
sqrtf:                                  // @sqrtf
// %bb.0:
	call	__extendsfdf2
	mov	r1, t0
	mov	r0, rax
	call	sqrt
	mov	r1, t0
	mov	r0, rax
	call	__truncdfsf2
	ret
// -- End function
// -- Begin function sqrtl
sqrtl:                                  // @sqrtl
// %bb.0:
	jmp	sqrt
// -- End function
// -- Begin function sin
sin:                                    // @sin
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
	mov	x0, r1
	mov	r1, 2147483647
	mov	x1, r0
	mov	r0, x0
	call	__bit_and
	mov	r0, 2146435072
	jl	rax, r0, .LBB50_2
	jmp	.LBB50_1
.LBB50_1:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 33
	mov	t0, 2146959360
	mov	rax, 0
	jmp	.LBB50_9
.LBB50_2:
	mov	r2, 1413754136
	mov	r3, 1074340347
	mov	r0, x1
	mov	r1, x0
	call	__gtdf2
	mov	r0, 1
	jl	rax, r0, .LBB50_4
	jmp	.LBB50_3
.LBB50_3:                               // %.preheader5.preheader
	mov	x2, 0
	jmp	.LBB50_6
.LBB50_4:                               // %.loopexit6
	mov	r2, 1413754136
	mov	r3, -1073143301
	mov	r0, x1
	mov	r1, x0
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB50_8
	jmp	.LBB50_5
.LBB50_5:                               // %.preheader.preheader
	mov	x2, 0
	jmp	.LBB50_7
.LBB50_6:                               // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, 1413754136
	mov	r3, -1072094725
	mov	r0, x1
	mov	r1, x0
	call	__adddf3
	mov	r2, 1413754136
	mov	r3, 1074340347
	mov	x1, rax
	mov	x0, t0
	mov	r0, x1
	mov	r1, x0
	call	__gtdf2
	jg	rax, x2, .LBB50_6
	jmp	.LBB50_4
.LBB50_7:                               // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, 1413754136
	mov	r3, 1075388923
	mov	r0, x1
	mov	r1, x0
	call	__adddf3
	mov	r2, 1413754136
	mov	r3, -1073143301
	mov	x1, rax
	mov	x0, t0
	mov	r0, x1
	mov	r1, x0
	call	__ltdf2
	jl	rax, x2, .LBB50_7
	jmp	.LBB50_8
.LBB50_8:                               // %.loopexit
	mov	r0, x1
	mov	r1, x0
	mov	r2, x1
	mov	r3, x0
	call	__muldf3
	mov	r2, 0
	mov	r3, -1072168960
	mov	x2, rax
	mov	x3, t0
	mov	r0, x2
	mov	r1, x3
	call	__divdf3
	mov	r2, 0
	mov	r3, 1072693248
	mov	r1, t0
	mov	r0, rax
	call	__adddf3
	mov	x4, rax
	mov	x5, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, x2
	mov	r3, x3
	call	__muldf3
	mov	r2, 0
	mov	r3, 1079902208
	mov	x6, rax
	mov	x7, t0
	mov	r0, x6
	mov	r1, x7
	call	__divdf3
	mov	r3, t0
	mov	r0, x4
	mov	r1, x5
	mov	r2, rax
	call	__adddf3
	mov	x4, rax
	mov	x5, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, x6
	mov	r3, x7
	call	__muldf3
	mov	r2, 0
	mov	r3, -1061965824
	mov	x6, rax
	mov	x7, t0
	mov	r0, x6
	mov	r1, x7
	call	__divdf3
	mov	r3, t0
	mov	r0, x4
	mov	r1, x5
	mov	r2, rax
	call	__adddf3
	mov	x4, rax
	mov	x5, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, x6
	mov	r3, x7
	call	__muldf3
	mov	r2, 0
	mov	r3, 1091970560
	mov	r1, t0
	mov	r0, rax
	call	__divdf3
	mov	r3, t0
	mov	r0, x4
	mov	r1, x5
	mov	r2, rax
	call	__adddf3
	mov	r3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, rax
	call	__muldf3
.LBB50_9:
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
// -- Begin function sinf
sinf:                                   // @sinf
// %bb.0:
	call	__extendsfdf2
	mov	r1, t0
	mov	r0, rax
	call	sin
	mov	r1, t0
	mov	r0, rax
	call	__truncdfsf2
	ret
// -- End function
// -- Begin function sinl
sinl:                                   // @sinl
// %bb.0:
	jmp	sin
// -- End function
// -- Begin function cos
cos:                                    // @cos
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x0, r1
	mov	r1, 2147483647
	mov	x1, r0
	mov	r0, x0
	call	__bit_and
	mov	r0, 2146435072
	jl	rax, r0, .LBB53_2
	jmp	.LBB53_1
.LBB53_1:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 33
	mov	t0, 2146959360
	mov	rax, 0
	jmp	.LBB53_9
.LBB53_2:
	mov	r2, 1413754136
	mov	r3, 1074340347
	mov	r0, x1
	mov	r1, x0
	call	__gtdf2
	mov	r0, 1
	jl	rax, r0, .LBB53_4
	jmp	.LBB53_3
.LBB53_3:                               // %.preheader5.preheader
	mov	x2, 0
	jmp	.LBB53_6
.LBB53_4:                               // %.loopexit6
	mov	r2, 1413754136
	mov	r3, -1073143301
	mov	r0, x1
	mov	r1, x0
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB53_8
	jmp	.LBB53_5
.LBB53_5:                               // %.preheader.preheader
	mov	x2, 0
	jmp	.LBB53_7
.LBB53_6:                               // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, 1413754136
	mov	r3, -1072094725
	mov	r0, x1
	mov	r1, x0
	call	__adddf3
	mov	r2, 1413754136
	mov	r3, 1074340347
	mov	x1, rax
	mov	x0, t0
	mov	r0, x1
	mov	r1, x0
	call	__gtdf2
	jg	rax, x2, .LBB53_6
	jmp	.LBB53_4
.LBB53_7:                               // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, 1413754136
	mov	r3, 1075388923
	mov	r0, x1
	mov	r1, x0
	call	__adddf3
	mov	r2, 1413754136
	mov	r3, -1073143301
	mov	x1, rax
	mov	x0, t0
	mov	r0, x1
	mov	r1, x0
	call	__ltdf2
	jl	rax, x2, .LBB53_7
	jmp	.LBB53_8
.LBB53_8:                               // %.loopexit
	mov	r0, x1
	mov	r1, x0
	mov	r2, x1
	mov	r3, x0
	call	__muldf3
	mov	r2, 0
	mov	r3, -1075838976
	mov	x0, rax
	mov	x1, t0
	mov	r0, x0
	mov	r1, x1
	call	__muldf3
	mov	r2, 0
	mov	r3, 1072693248
	mov	r1, t0
	mov	r0, rax
	call	__adddf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x0
	mov	r1, x1
	mov	r2, x0
	mov	r3, x1
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077411840
	mov	x4, rax
	mov	x5, t0
	mov	r0, x4
	mov	r1, x5
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x0
	mov	r1, x1
	mov	r2, x4
	mov	r3, x5
	call	__muldf3
	mov	r2, 0
	mov	r3, -1064927232
	mov	x4, rax
	mov	x5, t0
	mov	r0, x4
	mov	r1, x5
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
	mov	x2, rax
	mov	x3, t0
	mov	r0, x0
	mov	r1, x1
	mov	r2, x4
	mov	r3, x5
	call	__muldf3
	mov	r2, 0
	mov	r3, 1088663552
	mov	r1, t0
	mov	r0, rax
	call	__divdf3
	mov	r3, t0
	mov	r0, x2
	mov	r1, x3
	mov	r2, rax
	call	__adddf3
.LBB53_9:
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function cosf
cosf:                                   // @cosf
// %bb.0:
	call	__extendsfdf2
	mov	r1, t0
	mov	r0, rax
	call	cos
	mov	r1, t0
	mov	r0, rax
	call	__truncdfsf2
	ret
// -- End function
// -- Begin function cosl
cosl:                                   // @cosl
// %bb.0:
	jmp	cos
// -- End function
// -- Begin function tan
tan:                                    // @tan
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x1, r1
	mov	x2, r0
	call	cos
	mov	x3, rax
	mov	x4, t0
	mov	r2, 0
	mov	r3, 0
	mov	x0, 0
	mov	r0, x3
	mov	r1, x4
	call	__nedf2
	jnz	rax, .LBB56_2
	jmp	.LBB56_1
.LBB56_1:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	r2, 0
	mov	r3, 0
	mov	[r0], 34
	mov	r0, x2
	mov	r1, x1
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x1
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x2, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	t0, rax
add	t0, 2146435072
	jmp	.LBB56_3
.LBB56_2:
	mov	r0, x2
	mov	r1, x1
	call	sin
	mov	r1, t0
	mov	r0, rax
	mov	r2, x3
	mov	r3, x4
	call	__divdf3
	mov	x0, rax
.LBB56_3:
	mov	rax, x0
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function tanf
tanf:                                   // @tanf
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x1, r0
	call	__extendsfdf2
	mov	x4, rax
	mov	x5, t0
	mov	r0, x4
	mov	r1, x5
	call	cos
	mov	x2, rax
	mov	x3, t0
	mov	r2, 0
	mov	r3, 0
	mov	x0, 0
	mov	r0, x2
	mov	r1, x3
	call	__nedf2
	jnz	rax, .LBB57_2
	jmp	.LBB57_1
.LBB57_1:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	r1, 0
	mov	[r0], 34
	mov	r0, x1
	call	__ltsf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -2147483648
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, rax
add	r1, 2146435072
	jmp	.LBB57_3
.LBB57_2:
	mov	r0, x4
	mov	r1, x5
	call	sin
	mov	r1, t0
	mov	r0, rax
	mov	r2, x2
	mov	r3, x3
	call	__divdf3
	mov	x0, rax
	mov	r1, t0
.LBB57_3:
	mov	r0, x0
	call	__truncdfsf2
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function tanl
tanl:                                   // @tanl
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x1, r1
	mov	x2, r0
	call	cos
	mov	x3, rax
	mov	x4, t0
	mov	r2, 0
	mov	r3, 0
	mov	x0, 0
	mov	r0, x3
	mov	r1, x4
	call	__nedf2
	jnz	rax, .LBB58_2
	jmp	.LBB58_1
.LBB58_1:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	r2, 0
	mov	r3, 0
	mov	[r0], 34
	mov	r0, x2
	mov	r1, x1
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x1
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x2, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	t0, rax
add	t0, 2146435072
	jmp	.LBB58_3
.LBB58_2:
	mov	r0, x2
	mov	r1, x1
	call	sin
	mov	r1, t0
	mov	r0, rax
	mov	r2, x3
	mov	r3, x4
	call	__divdf3
	mov	x0, rax
.LBB58_3:
	mov	rax, x0
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function exp
exp:                                    // @exp
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
	mov	x0, r1
	mov	x1, r0
	mov	r2, 0
	mov	r3, 1082533888
	mov	x2, 0
	call	__gtdf2
	mov	r0, 1
	jl	rax, r0, .LBB59_2
	jmp	.LBB59_1
.LBB59_1:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 34
	mov	x2, 2146435072
	mov	x3, 0
	jmp	.LBB59_5
.LBB59_2:
	mov	r2, 0
	mov	r3, -1064876032
	mov	r0, x1
	mov	r1, x0
	call	__ltdf2
	mov	x3, 0
	jl	rax, x2, .LBB59_5
	jmp	.LBB59_3
.LBB59_3:                               // %.preheader.preheader
	mov	x2, 1072693248
	mov	x4, 1
	mov	x7, 40
	mov	x5, 0
	mov	x6, 1072693248
.LBB59_4:                               // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x4
	call	__floatunsidf
	mov	r3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, rax
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__muldf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x3
	mov	r1, x2
	mov	r2, x5
	mov	r3, x6
	call	__adddf3
add	x4, 1
	mov	x3, rax
	mov	x2, t0
	jne	x4, x7, .LBB59_4
	jmp	.LBB59_5
.LBB59_5:                               // %.loopexit
	mov	rax, x3
	mov	t0, x2
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
// -- Begin function expf
expf:                                   // @expf
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
	mov	x2, r0
	call	__extendsfdf2
	mov	r1, 1144078336
	mov	x0, rax
	mov	x1, t0
	mov	r0, x2
	call	__gtsf2
	mov	r0, 1
	jl	rax, r0, .LBB60_2
	jmp	.LBB60_1
.LBB60_1:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 34
	mov	rax, 2139095040
	jmp	.LBB60_6
.LBB60_2:
	mov	r1, -1002815488
	mov	r0, x2
	call	__ltsf2
	mov	r0, rax
	mov	rax, 0
	jl	r0, rax, .LBB60_6
	jmp	.LBB60_3
.LBB60_3:                               // %.preheader.preheader
	mov	x3, 1072693248
	mov	x4, 0
	mov	x2, 1
	mov	x7, 40
	mov	x5, 0
	mov	x6, 1072693248
.LBB60_4:                               // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x2
	call	__floatunsidf
	mov	r3, t0
	mov	r0, x0
	mov	r1, x1
	mov	r2, rax
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__muldf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x4
	mov	r1, x3
	mov	r2, x5
	mov	r3, x6
	call	__adddf3
add	x2, 1
	mov	x4, rax
	mov	x3, t0
	jne	x2, x7, .LBB60_4
	jmp	.LBB60_5
.LBB60_5:
	mov	r0, x4
	mov	r1, x3
	call	__truncdfsf2
.LBB60_6:
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
// -- Begin function expl
expl:                                   // @expl
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
	mov	x0, r1
	mov	x1, r0
	mov	r2, 0
	mov	r3, 1082533888
	mov	x2, 0
	call	__gtdf2
	mov	r0, 1
	jl	rax, r0, .LBB61_2
	jmp	.LBB61_1
.LBB61_1:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 34
	mov	x2, 2146435072
	mov	x3, 0
	jmp	.LBB61_5
.LBB61_2:
	mov	r2, 0
	mov	r3, -1064876032
	mov	r0, x1
	mov	r1, x0
	call	__ltdf2
	mov	x3, 0
	jl	rax, x2, .LBB61_5
	jmp	.LBB61_3
.LBB61_3:                               // %.preheader.preheader
	mov	x2, 1072693248
	mov	x4, 1
	mov	x7, 40
	mov	x5, 0
	mov	x6, 1072693248
.LBB61_4:                               // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x4
	call	__floatunsidf
	mov	r3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, rax
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__muldf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x3
	mov	r1, x2
	mov	r2, x5
	mov	r3, x6
	call	__adddf3
add	x4, 1
	mov	x3, rax
	mov	x2, t0
	jne	x4, x7, .LBB61_4
	jmp	.LBB61_5
.LBB61_5:                               // %.loopexit
	mov	rax, x3
	mov	t0, x2
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
// -- Begin function log
log:                                    // @log
// %bb.0:
sub	rsp, 28
	mov	[rsp+24], x0
	mov	[rsp+20], x1
	mov	[rsp+16], x2
	mov	[rsp+12], x3
	mov	[rsp+8], x4
	mov	[rsp+4], x5
	mov	[rsp], x6
	mov	r2, 0
	mov	r3, 0
	mov	x1, r1
	mov	x2, r0
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB62_2
	jmp	.LBB62_1
.LBB62_1:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 33
	mov	x1, 2146959360
	mov	x2, 0
	jmp	.LBB62_12
.LBB62_2:
	mov	r2, 0
	mov	r3, 0
	mov	r0, x2
	mov	r1, x1
	call	__nedf2
	jnz	rax, .LBB62_4
	jmp	.LBB62_3
.LBB62_3:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 34
	mov	x1, -1048576
	mov	x2, 0
	jmp	.LBB62_12
.LBB62_4:
	mov	r1, 2147483647
	mov	r0, x1
	call	__bit_and
	mov	r0, 2146435071
	jg	rax, r0, .LBB62_12
	jmp	.LBB62_5
.LBB62_5:
	mov	r2, 0
	mov	r3, 1073741824
	mov	x0, 0
	mov	r0, x2
	mov	r1, x1
	call	__gtdf2
	mov	r0, 1
	jl	rax, r0, .LBB62_7
	jmp	.LBB62_6
.LBB62_6:                               // %.preheader4.preheader
	mov	x3, 0
	jmp	.LBB62_9
.LBB62_7:                               // %.loopexit5
	mov	r2, 0
	mov	r3, 1071644672
	mov	x3, 0
	mov	r0, x2
	mov	r1, x1
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB62_11
	jmp	.LBB62_8
.LBB62_8:                               // %.preheader.preheader
	jmp	.LBB62_10
.LBB62_9:                               // %.preheader4
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, 0
	mov	r3, 1071644672
	mov	r0, x2
	mov	r1, x1
	call	__muldf3
	mov	x2, rax
	mov	x1, t0
	mov	r2, 0
	mov	r3, 1073741824
add	x0, 1
	mov	r0, x2
	mov	r1, x1
	call	__gtdf2
	jg	rax, x3, .LBB62_9
	jmp	.LBB62_7
.LBB62_10:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x2
	mov	r1, x1
	mov	r2, x2
	mov	r3, x1
	call	__adddf3
	mov	x2, rax
	mov	x1, t0
	mov	r2, 0
	mov	r3, 1071644672
add	x0, -1
	mov	r0, x2
	mov	r1, x1
	call	__ltdf2
	jl	rax, x3, .LBB62_10
	jmp	.LBB62_11
.LBB62_11:                              // %.loopexit
	mov	r2, 0
	mov	r3, -1074790400
	mov	r0, x2
	mov	r1, x1
	call	__adddf3
	mov	r2, 0
	mov	r3, 1072693248
	mov	x3, rax
	mov	x4, t0
	mov	r0, x2
	mov	r1, x1
	call	__adddf3
	mov	r3, t0
	mov	r0, x3
	mov	r1, x4
	mov	r2, rax
	call	__divdf3
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 0
	mov	x1, rax
	mov	x2, t0
	mov	r0, x3
	mov	r1, x4
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x3
	mov	r1, x4
	mov	r2, x1
	mov	r3, x2
	call	__muldf3
	mov	r2, 0
	mov	r3, 1074266112
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1075052544
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1075576832
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1075970048
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1076232192
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1076494336
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1076756480
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1076953088
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077084160
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077215232
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077346304
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077477376
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077608448
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077739520
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077870592
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1077968896
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078034432
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078099968
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078165504
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078231040
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078296576
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078362112
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078427648
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x3
	mov	r3, x4
	call	__muldf3
	mov	r2, 0
	mov	r3, 1078493184
	mov	r1, t0
	mov	r0, rax
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddf3
	mov	x1, rax
	mov	x2, t0
	mov	r0, x0
	call	__floatsidf
	mov	r2, -17155601
	mov	r3, 1072049730
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	x0, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, x1
	mov	r3, x2
	call	__adddf3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x0
	mov	r3, x3
	call	__adddf3
	mov	x2, rax
	mov	x1, t0
.LBB62_12:
	mov	rax, x2
	mov	t0, x1
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
// -- Begin function logf
logf:                                   // @logf
// %bb.0:
	call	__extendsfdf2
	mov	r1, t0
	mov	r0, rax
	call	log
	mov	r1, t0
	mov	r0, rax
	call	__truncdfsf2
	ret
// -- End function
// -- Begin function logl
logl:                                   // @logl
// %bb.0:
	jmp	log
// -- End function
// -- Begin function pow
pow:                                    // @pow
// %bb.0:
sub	rsp, 36
	mov	[rsp+32], x0
	mov	[rsp+28], x1
	mov	[rsp+24], x2
	mov	[rsp+20], x3
	mov	[rsp+16], x4
	mov	[rsp+12], x5
	mov	[rsp+8], x6
	mov	[rsp+4], x7
	mov	[rsp], x8
	mov	x0, r3
	mov	x1, r2
	mov	x2, r1
	mov	x3, r0
	mov	r0, x1
	mov	r1, x0
	call	__fixdfsi
	mov	x4, rax
	mov	r0, x4
	call	__floatsidf
	mov	r3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, rax
	call	__nedf2
	jnz	rax, .LBB65_7
	jmp	.LBB65_1
.LBB65_1:
	mov	x1, 1072693248
	mov	x0, 0
	jz	x4, .LBB65_6
	jmp	.LBB65_2
.LBB65_2:
	mov	r0, -1
	mov	x5, x4
	jg	x4, r0, .LBB65_4
	jmp	.LBB65_3
.LBB65_3:
	mov	x5, 0
	sub	x5, x4
.LBB65_4:
.LBB65_5:                               // =>This Inner Loop Header: Depth=1
	mov	r1, 1
	mov	r0, x5
	call	__bit_and
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
	mov	x6, rax
	mov	r0, x3
	mov	r1, x2
	mov	r2, x0
	mov	r3, x1
	call	__muldf3
	mov	x7, rax
	mov	x8, t0
	sub	x1, x8
	mov	r0, x6
	call	__bit_not
	mov	x6, rax
add	x6, 1
	mov	r0, x6
	mov	r1, x1
	call	__bit_and
	mov	x1, rax
	sub	x0, x7
	add	x1, x8
	mov	r0, x6
	mov	r1, x0
	call	__bit_and
	mov	x0, rax
	add	x0, x7
	mov	r0, x3
	mov	r1, x2
	mov	r2, x3
	mov	r3, x2
	call	__muldf3
	mov	r1, 1
	mov	x3, rax
	mov	x2, t0
	mov	r0, x5
	call	__bit_shr
	mov	x5, rax
	jnz	x5, .LBB65_5
	jmp	.LBB65_6
.LBB65_6:                               // %.loopexit
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	x2, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x2, -2147483648
	mov	r0, rax
	mov	r1, x2
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
	mov	r0, 0
	mov	r1, 1072693248
	mov	x2, rax
	mov	r2, x0
	mov	r3, x1
	call	__divdf3
	mov	x3, rax
	mov	x4, t0
	sub	x4, x1
	mov	r0, x2
	call	__bit_not
	mov	x5, rax
add	x5, 1
	mov	r0, x5
	mov	r1, x4
	call	__bit_and
	mov	x2, rax
	sub	x3, x0
	add	x2, x1
	mov	r0, x5
	mov	r1, x3
	call	__bit_and
	mov	x4, rax
	add	x4, x0
	jmp	.LBB65_14
.LBB65_7:
	mov	r2, 0
	mov	r3, 0
	mov	x4, 0
	mov	r0, x3
	mov	r1, x2
	call	__ledf2
	jg	rax, x4, .LBB65_9
	jmp	.LBB65_8
.LBB65_8:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 33
	mov	x2, 2146959360
	jmp	.LBB65_14
.LBB65_9:
	mov	r0, x3
	mov	r1, x2
	call	log
	mov	r3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, rax
	call	__muldf3
	mov	x0, rax
	mov	x1, t0
	mov	r2, 0
	mov	r3, 1082533888
	mov	x2, 0
	mov	r0, x0
	mov	r1, x1
	call	__gtdf2
	mov	r0, 1
	jl	rax, r0, .LBB65_11
	jmp	.LBB65_10
.LBB65_10:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 34
	mov	x2, 2146435072
	jmp	.LBB65_14
.LBB65_11:
	mov	r2, 0
	mov	r3, -1064876032
	mov	r0, x0
	mov	r1, x1
	call	__ltdf2
	jl	rax, x2, .LBB65_14
	jmp	.LBB65_12
.LBB65_12:                              // %.preheader.preheader
	mov	x2, 1072693248
	mov	x3, 1
	mov	x7, 40
	mov	x5, 0
	mov	x6, 1072693248
.LBB65_13:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
	call	__floatunsidf
	mov	r3, t0
	mov	r0, x0
	mov	r1, x1
	mov	r2, rax
	call	__divdf3
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__muldf3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x4
	mov	r1, x2
	mov	r2, x5
	mov	r3, x6
	call	__adddf3
add	x3, 1
	mov	x4, rax
	mov	x2, t0
	jne	x3, x7, .LBB65_13
	jmp	.LBB65_14
.LBB65_14:                              // %.loopexit4
	mov	rax, x4
	mov	t0, x2
	mov	x8, [rsp]
	mov	x7, [rsp+4]
	mov	x6, [rsp+8]
	mov	x5, [rsp+12]
	mov	x4, [rsp+16]
	mov	x3, [rsp+20]
	mov	x2, [rsp+24]
	mov	x1, [rsp+28]
	mov	x0, [rsp+32]
add	rsp, 36
	ret
// -- End function
// -- Begin function powf
powf:                                   // @powf
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r1
	call	__extendsfdf2
	mov	x1, rax
	mov	x2, t0
	mov	r0, x0
	call	__extendsfdf2
	mov	r3, t0
	mov	r0, x1
	mov	r1, x2
	mov	r2, rax
	call	pow
	mov	r1, t0
	mov	r0, rax
	call	__truncdfsf2
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function powl
powl:                                   // @powl
// %bb.0:
	jmp	pow
// -- End function
// -- Begin function fmod
fmod:                                   // @fmod
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x2, r3
	mov	x3, r2
	mov	x0, r1
	mov	x1, r0
	mov	r2, 0
	mov	r3, 0
	mov	x4, 0
	mov	r0, x3
	mov	r1, x2
	call	__nedf2
	jnz	rax, .LBB68_2
	jmp	.LBB68_1
.LBB68_1:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 33
	mov	t0, 2146959360
	jmp	.LBB68_3
.LBB68_2:
	mov	r0, x1
	mov	r1, x0
	mov	r2, x3
	mov	r3, x2
	call	__divdf3
	mov	r1, t0
	mov	r0, rax
	call	__fixdfsi
	mov	r0, rax
	call	__floatsidf
	mov	r1, t0
	mov	r0, rax
	mov	r2, x3
	mov	r3, x2
	call	__muldf3
	mov	r3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, rax
	call	__subdf3
	mov	x4, rax
.LBB68_3:
	mov	rax, x4
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function fmodf
fmodf:                                  // @fmodf
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r1
	mov	r1, 0
	mov	x1, r0
	mov	r0, x0
	call	__nesf2
	jnz	rax, .LBB69_2
	jmp	.LBB69_1
.LBB69_1:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 33
	mov	rax, 2143289344
	jmp	.LBB69_3
.LBB69_2:
	mov	r0, x0
	call	__extendsfdf2
	mov	x0, rax
	mov	x2, t0
	mov	r0, x1
	call	__extendsfdf2
	mov	x1, rax
	mov	x3, t0
	mov	r0, x1
	mov	r1, x3
	mov	r2, x0
	mov	r3, x2
	call	__divdf3
	mov	r1, t0
	mov	r0, rax
	call	__fixdfsi
	mov	r0, rax
	call	__floatsidf
	mov	r1, t0
	mov	r0, rax
	mov	r2, x0
	mov	r3, x2
	call	__muldf3
	mov	r3, t0
	mov	r0, x1
	mov	r1, x3
	mov	r2, rax
	call	__subdf3
	mov	r1, t0
	mov	r0, rax
	call	__truncdfsf2
.LBB69_3:
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function fmodl
fmodl:                                  // @fmodl
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x2, r3
	mov	x3, r2
	mov	x0, r1
	mov	x1, r0
	mov	r2, 0
	mov	r3, 0
	mov	x4, 0
	mov	r0, x3
	mov	r1, x2
	call	__nedf2
	jnz	rax, .LBB70_2
	jmp	.LBB70_1
.LBB70_1:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 33
	mov	t0, 2146959360
	jmp	.LBB70_3
.LBB70_2:
	mov	r0, x1
	mov	r1, x0
	mov	r2, x3
	mov	r3, x2
	call	__divdf3
	mov	r1, t0
	mov	r0, rax
	call	__fixdfsi
	mov	r0, rax
	call	__floatsidf
	mov	r1, t0
	mov	r0, rax
	mov	r2, x3
	mov	r3, x2
	call	__muldf3
	mov	r3, t0
	mov	r0, x1
	mov	r1, x0
	mov	r2, rax
	call	__subdf3
	mov	x4, rax
.LBB70_3:
	mov	rax, x4
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function copysign
copysign:                               // @copysign
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x0, r1
	mov	r1, -2147483648
	mov	x1, r0
	mov	r0, r3
	call	__bit_xor
	mov	x2, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x2, -2147483648
	mov	r0, rax
	mov	r1, x2
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
	mov	r2, 0
	mov	r3, 0
	mov	x2, rax
	mov	r0, x1
	mov	r1, x0
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x3
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	r0, x3
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x0
	call	__bit_xor
	mov	x4, rax
	mov	r0, x3
	mov	r1, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	sub	x4, x0
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	add	x0, rax
	mov	rax, x1
	mov	t0, x0
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function copysignf
copysignf:                              // @copysignf
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	r2, r1
	mov	r1, -2147483648
	mov	x0, r0
	mov	r0, r2
	call	__bit_xor
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -2147483648
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 0
	mov	x1, rax
	mov	r0, x0
	call	__ltsf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	x2, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x2, -2147483648
	mov	r0, rax
	mov	r1, x2
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
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x0
	call	__bit_xor
	mov	x3, rax
	mov	r0, x2
	mov	r1, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	sub	x3, x0
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	add	rax, x0
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function copysignl
copysignl:                              // @copysignl
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x0, r1
	mov	r1, -2147483648
	mov	x1, r0
	mov	r0, r3
	call	__bit_xor
	mov	x2, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x2, -2147483648
	mov	r0, rax
	mov	r1, x2
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
	mov	r2, 0
	mov	r3, 0
	mov	x2, rax
	mov	r0, x1
	mov	r1, x0
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x3
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	r0, x3
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x0
	call	__bit_xor
	mov	x4, rax
	mov	r0, x3
	mov	r1, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	sub	x4, x0
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	add	x0, rax
	mov	rax, x1
	mov	t0, x0
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function fmin
fmin:                                   // @fmin
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x1, r3
	mov	x0, r2
	mov	x3, r1
	mov	x2, r0
	mov	r2, x2
	mov	r3, x3
	call	__unorddf2
	mov	r0, rax
	mov	rax, x0
	mov	x4, x1
	jnz	r0, .LBB74_3
	jmp	.LBB74_1
.LBB74_1:
	mov	r0, x0
	mov	r1, x1
	mov	r2, x0
	mov	r3, x1
	call	__unorddf2
	mov	r0, rax
	mov	rax, x2
	mov	x4, x3
	jnz	r0, .LBB74_3
	jmp	.LBB74_2
.LBB74_2:
	mov	r0, x2
	mov	r1, x3
	mov	r2, x0
	mov	r3, x1
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x4
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	mov	r0, x4
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
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
	mov	r0, rax
	call	__bit_not
	mov	x5, rax
add	x5, 1
	sub	x3, x1
	mov	r0, x5
	mov	r1, x3
	call	__bit_and
	mov	x4, rax
	sub	x2, x0
	add	x4, x1
	mov	r0, x5
	mov	r1, x2
	call	__bit_and
	add	rax, x0
.LBB74_3:
	mov	t0, x4
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function fminf
fminf:                                  // @fminf
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r1
	mov	x1, r0
	mov	r1, x1
	call	__unordsf2
	mov	r0, rax
	mov	rax, x0
	jnz	r0, .LBB75_3
	jmp	.LBB75_1
.LBB75_1:
	mov	r0, x0
	mov	r1, x0
	call	__unordsf2
	mov	r0, rax
	mov	rax, x1
	jnz	r0, .LBB75_3
	jmp	.LBB75_2
.LBB75_2:
	mov	r0, x1
	mov	r1, x0
	call	__ltsf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	x2, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x2, -2147483648
	mov	r0, rax
	mov	r1, x2
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	sub	x1, x0
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	add	rax, x0
.LBB75_3:
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function fminl
fminl:                                  // @fminl
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x1, r3
	mov	x0, r2
	mov	x3, r1
	mov	x2, r0
	mov	r2, x2
	mov	r3, x3
	call	__unorddf2
	mov	r0, rax
	mov	rax, x0
	mov	x4, x1
	jnz	r0, .LBB76_3
	jmp	.LBB76_1
.LBB76_1:
	mov	r0, x0
	mov	r1, x1
	mov	r2, x0
	mov	r3, x1
	call	__unorddf2
	mov	r0, rax
	mov	rax, x2
	mov	x4, x3
	jnz	r0, .LBB76_3
	jmp	.LBB76_2
.LBB76_2:
	mov	r0, x2
	mov	r1, x3
	mov	r2, x0
	mov	r3, x1
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x4
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	mov	r0, x4
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
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
	mov	r0, rax
	call	__bit_not
	mov	x5, rax
add	x5, 1
	sub	x3, x1
	mov	r0, x5
	mov	r1, x3
	call	__bit_and
	mov	x4, rax
	sub	x2, x0
	add	x4, x1
	mov	r0, x5
	mov	r1, x2
	call	__bit_and
	add	rax, x0
.LBB76_3:
	mov	t0, x4
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function fmax
fmax:                                   // @fmax
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x1, r3
	mov	x0, r2
	mov	x3, r1
	mov	x2, r0
	mov	r2, x2
	mov	r3, x3
	call	__unorddf2
	mov	r0, rax
	mov	rax, x0
	mov	x4, x1
	jnz	r0, .LBB77_3
	jmp	.LBB77_1
.LBB77_1:
	mov	r0, x0
	mov	r1, x1
	mov	r2, x0
	mov	r3, x1
	call	__unorddf2
	mov	r0, rax
	mov	rax, x2
	mov	x4, x3
	jnz	r0, .LBB77_3
	jmp	.LBB77_2
.LBB77_2:
	mov	r0, x2
	mov	r1, x3
	mov	r2, x0
	mov	r3, x1
	call	__gtdf2
	mov	r1, -2147483648
	mov	x4, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x4, x5
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	r1, 2147483647
	mov	x4, rax
	mov	r0, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	x5, rax
add	x5, 1
	sub	x3, x1
	mov	r0, x5
	mov	r1, x3
	call	__bit_and
	mov	x4, rax
	sub	x2, x0
	add	x4, x1
	mov	r0, x5
	mov	r1, x2
	call	__bit_and
	add	rax, x0
.LBB77_3:
	mov	t0, x4
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function fmaxf
fmaxf:                                  // @fmaxf
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x0, r1
	mov	x1, r0
	mov	r1, x1
	call	__unordsf2
	mov	r0, rax
	mov	rax, x0
	jnz	r0, .LBB78_3
	jmp	.LBB78_1
.LBB78_1:
	mov	r0, x0
	mov	r1, x0
	call	__unordsf2
	mov	r0, rax
	mov	rax, x1
	jnz	r0, .LBB78_3
	jmp	.LBB78_2
.LBB78_2:
	mov	r0, x1
	mov	r1, x0
	call	__gtsf2
	mov	r1, -2147483648
	mov	x2, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, 2147483647
	mov	x3, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x2, x3
	mov	r0, rax
	mov	r1, x2
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	sub	x1, x0
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	add	rax, x0
.LBB78_3:
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function fmaxl
fmaxl:                                  // @fmaxl
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x1, r3
	mov	x0, r2
	mov	x3, r1
	mov	x2, r0
	mov	r2, x2
	mov	r3, x3
	call	__unorddf2
	mov	r0, rax
	mov	rax, x0
	mov	x4, x1
	jnz	r0, .LBB79_3
	jmp	.LBB79_1
.LBB79_1:
	mov	r0, x0
	mov	r1, x1
	mov	r2, x0
	mov	r3, x1
	call	__unorddf2
	mov	r0, rax
	mov	rax, x2
	mov	x4, x3
	jnz	r0, .LBB79_3
	jmp	.LBB79_2
.LBB79_2:
	mov	r0, x2
	mov	r1, x3
	mov	r2, x0
	mov	r3, x1
	call	__gtdf2
	mov	r1, -2147483648
	mov	x4, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x4, x5
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	r1, 2147483647
	mov	x4, rax
	mov	r0, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	x5, rax
add	x5, 1
	sub	x3, x1
	mov	r0, x5
	mov	r1, x3
	call	__bit_and
	mov	x4, rax
	sub	x2, x0
	add	x4, x1
	mov	r0, x5
	mov	r1, x2
	call	__bit_and
	add	rax, x0
.LBB79_3:
	mov	t0, x4
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function signal
signal:                                 // @signal
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r1
	mov	x1, r0
add	r0, -7
	mov	r1, -2147483648
	mov	x2, -1
	call	__bit_xor
	mov	r0, 2147483642
	jl	rax, r0, .LBB80_2
	jmp	.LBB80_1
.LBB80_1:
	mov	r1, 2
	mov	r0, x1
	call	__bit_shl
	mov	r0, mcasm_static_6bc8db79278211dbe9528318ee407262
	add	r0, rax
	mov	x2, [r0]
	mov	[r0], x0
.LBB80_2:
	mov	rax, x2
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function raise
raise:                                  // @raise
// %bb.0:
sub	rsp, 8
	mov	[rsp+4], x0
	mov	[rsp], x1
	mov	x0, r0
add	r0, -7
	mov	r1, -2147483648
	mov	x1, -1
	call	__bit_xor
	mov	r0, 2147483642
	jl	rax, r0, .LBB81_7
	jmp	.LBB81_1
.LBB81_1:
	mov	r1, 2
	mov	r0, x0
	call	__bit_shl
	mov	r0, mcasm_static_6bc8db79278211dbe9528318ee407262
	add	r0, rax
	mov	r1, [r0]
	mov	r0, 1
	mov	x1, 0
	je	r1, r0, .LBB81_7
	jmp	.LBB81_2
.LBB81_2:
	jnz	r1, .LBB81_6
	jmp	.LBB81_3
.LBB81_3:
	jne	x0, r0, .LBB81_7
	jmp	.LBB81_4
.LBB81_4:
	inline tellraw @a "[DataPack] Aborted! Program has crashed, run /reload to reset."
.LBB81_5:                               // =>This Inner Loop Header: Depth=1
	jmp	.LBB81_5
.LBB81_6:
	mov	r0, x0
	calld	r1
.LBB81_7:
	mov	rax, x1
	mov	x1, [rsp]
	mov	x0, [rsp+4]
add	rsp, 8
	ret
// -- End function
// -- Begin function printf
printf:                                 // @printf
// %bb.0:
sub	rsp, 32
	mov	t0, rsp
add	t0, 8
	mov	[t0], r2
	mov	r2, rsp
add	r2, 12
	mov	[r2], r3
	mov	r2, rsp
add	r2, 16
	mov	[r2], r4
	mov	r2, rsp
add	r2, 20
	mov	[r2], r5
	mov	r2, rsp
add	r2, 24
	mov	[r2], r6
	mov	r2, rsp
add	r2, 28
	mov	[r2], r7
	mov	[rsp+4], r1
	mov	r1, rsp
add	r1, 4
	mov	[rsp+28], r1
	call	vprintf
add	rsp, 32
	ret
// -- End function
// -- Begin function putchar
putchar:                                // @putchar
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	r1, 255
	mov	x1, r0
	call	__bit_and
	mov	r0, mcasm_static_00ac4c2001e59a84fcd276db8d985f14
	mov	x2, [r0]
	mov	r0, 10
	mov	x0, rax
	jne	x0, r0, .LBB83_5
	jmp	.LBB83_1
.LBB83_1:
	mov	x1, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
	add	x2, x1
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_0 with storage std:vm ls0
	mov	r0, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB83_4
	jmp	.LBB83_2
.LBB83_2:                               // %.preheader.i.i.preheader
add	x1, 2
.LBB83_3:                               // %.preheader.i.i
                                        // =>This Inner Loop Header: Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_1 with storage std:vm ls0
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jnz	rax, .LBB83_3
	jmp	.LBB83_4
.LBB83_4:                               // %puts.exit.i
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
	mov	r0, mcasm_static_00ac4c2001e59a84fcd276db8d985f14
	mov	[r0], 0
	jmp	.LBB83_11
.LBB83_5:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147482625
	jl	rax, r0, .LBB83_10
	jmp	.LBB83_6
.LBB83_6:
	mov	x3, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
	mov	x4, x2
	add	x4, x3
	mov	r0, [x4]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	x2, 0
	mov	r0, rax
	call	__bit_or
	mov	[x4], rax
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_0 with storage std:vm ls0
	mov	r0, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB83_9
	jmp	.LBB83_7
.LBB83_7:                               // %.preheader.i2.i.preheader
add	x3, 2
.LBB83_8:                               // %.preheader.i2.i
                                        // =>This Inner Loop Header: Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_1 with storage std:vm ls0
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
add	x3, 1
	jnz	rax, .LBB83_8
	jmp	.LBB83_9
.LBB83_9:                               // %puts.exit3.i
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
.LBB83_10:
	mov	r0, x2
add	r0, 1
	mov	x3, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
	add	x3, x2
	mov	x2, [x3]
	mov	r2, mcasm_static_00ac4c2001e59a84fcd276db8d985f14
	mov	r1, 255
	mov	[r2], r0
	mov	r0, x1
	call	__bit_and
	mov	r1, -256
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
.LBB83_11:                              // %__stdout_linebuf_putc.exit
	mov	rax, x0
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function puts
puts:                                   // @puts
// %bb.0:
sub	rsp, 4
	mov	[rsp], x0
	mov	x0, r0
	jnz	x0, .LBB84_2
	jmp	.LBB84_1
.LBB84_1:
	call	abort
.LBB84_2:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_0 with storage std:vm ls0
	mov	r0, x0
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB84_5
	jmp	.LBB84_3
.LBB84_3:                               // %.preheader.preheader
add	x0, 2
.LBB84_4:                               // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_1 with storage std:vm ls0
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
add	x0, 1
	jnz	rax, .LBB84_4
	jmp	.LBB84_5
.LBB84_5:                               // %.loopexit
	mov	rax, 1
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
	mov	x0, [rsp]
add	rsp, 4
	ret
// -- End function
// -- Begin function snprintf
snprintf:                               // @snprintf
// %bb.0:
sub	rsp, 24
	mov	t0, rsp
add	t0, 8
	mov	[t0], r4
	mov	r4, rsp
add	r4, 12
	mov	[r4], r5
	mov	r4, rsp
add	r4, 16
	mov	[r4], r6
	mov	r4, rsp
add	r4, 20
	mov	[r4], r7
	mov	[rsp+4], r3
	mov	r3, rsp
add	r3, 4
	mov	[rsp+20], r3
	call	vsnprintf
add	rsp, 24
	ret
// -- End function
// -- Begin function sprintf
sprintf:                                // @sprintf
// %bb.0:
sub	rsp, 28
	mov	t0, r1
	mov	r1, rsp
add	r1, 8
	mov	[r1], r3
	mov	r1, rsp
add	r1, 12
	mov	[r1], r4
	mov	r1, rsp
add	r1, 16
	mov	[r1], r5
	mov	r1, rsp
add	r1, 20
	mov	[r1], r6
	mov	r1, rsp
add	r1, 24
	mov	[r1], r7
	mov	[rsp+4], r2
	mov	r3, rsp
add	r3, 4
	mov	r1, -1
	mov	[rsp+24], r3
	mov	r2, t0
	call	vsnprintf
add	rsp, 28
	ret
// -- End function
// -- Begin function __stdout_linebuf_flush
__stdout_linebuf_flush:                 // @__stdout_linebuf_flush
// %bb.0:
sub	rsp, 8
	mov	[rsp+4], x0
	mov	[rsp], x1
	mov	r0, mcasm_static_00ac4c2001e59a84fcd276db8d985f14
	mov	x1, [r0]
	jz	x1, .LBB87_5
	jmp	.LBB87_1
.LBB87_1:
	mov	x0, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
	add	x1, x0
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_0 with storage std:vm ls0
	mov	r0, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB87_4
	jmp	.LBB87_2
.LBB87_2:                               // %.preheader.i.preheader
add	x0, 2
.LBB87_3:                               // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_1 with storage std:vm ls0
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
add	x0, 1
	jnz	rax, .LBB87_3
	jmp	.LBB87_4
.LBB87_4:                               // %puts.exit
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
	mov	r0, mcasm_static_00ac4c2001e59a84fcd276db8d985f14
	mov	[r0], 0
.LBB87_5:
	mov	rax, 0
	mov	x1, [rsp]
	mov	x0, [rsp+4]
add	rsp, 8
	ret
// -- End function
// -- Begin function __stdout_linebuf_putc
__stdout_linebuf_putc:                  // @__stdout_linebuf_putc
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	r1, 255
	mov	x1, r0
	call	__bit_and
	mov	r0, mcasm_static_00ac4c2001e59a84fcd276db8d985f14
	mov	x2, [r0]
	mov	r0, 10
	mov	x0, rax
	jne	x0, r0, .LBB88_5
	jmp	.LBB88_1
.LBB88_1:
	mov	x1, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
	add	x2, x1
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_0 with storage std:vm ls0
	mov	r0, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB88_4
	jmp	.LBB88_2
.LBB88_2:                               // %.preheader.i.preheader
add	x1, 2
.LBB88_3:                               // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_1 with storage std:vm ls0
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jnz	rax, .LBB88_3
	jmp	.LBB88_4
.LBB88_4:                               // %puts.exit
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
	mov	r0, mcasm_static_00ac4c2001e59a84fcd276db8d985f14
	mov	[r0], 0
	jmp	.LBB88_11
.LBB88_5:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147482625
	jl	rax, r0, .LBB88_10
	jmp	.LBB88_6
.LBB88_6:
	mov	x3, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
	mov	x4, x2
	add	x4, x3
	mov	r0, [x4]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	x2, 0
	mov	r0, rax
	call	__bit_or
	mov	[x4], rax
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_0 with storage std:vm ls0
	mov	r0, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB88_9
	jmp	.LBB88_7
.LBB88_7:                               // %.preheader.i2.preheader
add	x3, 2
.LBB88_8:                               // %.preheader.i2
                                        // =>This Inner Loop Header: Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_1 with storage std:vm ls0
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
add	x3, 1
	jnz	rax, .LBB88_8
	jmp	.LBB88_9
.LBB88_9:                               // %puts.exit3
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
.LBB88_10:
	mov	r0, x2
add	r0, 1
	mov	x3, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
	add	x3, x2
	mov	x2, [x3]
	mov	r2, mcasm_static_00ac4c2001e59a84fcd276db8d985f14
	mov	r1, 255
	mov	[r2], r0
	mov	r0, x1
	call	__bit_and
	mov	r1, -256
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
.LBB88_11:
	mov	rax, x0
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function __stdout_linebuf_write
__stdout_linebuf_write:                 // @__stdout_linebuf_write
// %bb.0:
sub	rsp, 76
	mov	[rsp+72], x0
	mov	[rsp+68], x1
	mov	[rsp+64], x2
	mov	[rsp+60], x3
	mov	[rsp+56], x4
	mov	[rsp+52], x5
	mov	[rsp+48], x6
	mov	[rsp+44], x7
	mov	[rsp+40], x8
	mov	[rsp+36], x9
	mov	[rsp+32], x10
	mov	[rsp+28], x11
	mov	[rsp+24], x12
	mov	[rsp+20], x13
	mov	[rsp+16], x14
	mov	[rsp+12], x15
	mov	x0, r1
	mov	x13, r0
	jz	x0, .LBB89_48
	jmp	.LBB89_1
.LBB89_1:                               // %.preheader11.preheader
	mov	x5, 10
	mov	x9, -2147483645
	mov	x10, mcasm_static_00ac4c2001e59a84fcd276db8d985f14
	mov	r0, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
add	r0, 1
	mov	[rsp+8], r0
	mov	x11, -2147483632
	mov	x12, -2147482625
.LBB89_2:                               // %.preheader11
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB89_4 Depth 2
                                        //     Child Loop BB89_9 Depth 2
                                        //     Child Loop BB89_13 Depth 2
                                        //     Child Loop BB89_19 Depth 2
                                        //       Child Loop BB89_21 Depth 3
                                        //       Child Loop BB89_30 Depth 3
                                        //       Child Loop BB89_27 Depth 3
                                        //       Child Loop BB89_28 Depth 3
                                        //       Child Loop BB89_34 Depth 3
                                        //       Child Loop BB89_39 Depth 3
                                        //     Child Loop BB89_45 Depth 2
	mov	r1, 3
	mov	r0, x13
	call	__bit_and
	mov	x2, x0
	mov	x4, x13
	jz	rax, .LBB89_7
	jmp	.LBB89_3
.LBB89_3:                               // %.preheader8.preheader
                                        //   in Loop: Header=BB89_2 Depth=1
	mov	x3, x13
add	x3, 1
	mov	x4, x13
	mov	x2, x0
.LBB89_4:                               // %.preheader8
                                        //   Parent Loop BB89_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, 0
	jz	x2, .LBB89_15
	jmp	.LBB89_5
.LBB89_5:                               //   in Loop: Header=BB89_4 Depth=2
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	r0, x4
	je	rax, x5, .LBB89_15
	jmp	.LBB89_6
.LBB89_6:                               //   in Loop: Header=BB89_4 Depth=2
	mov	r1, 3
add	x4, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
add	x2, -1
	jnz	rax, .LBB89_4
	jmp	.LBB89_7
.LBB89_7:                               // %.loopexit9.i
                                        //   in Loop: Header=BB89_2 Depth=1
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB89_11
	jmp	.LBB89_8
.LBB89_8:                               // %.preheader.preheader
                                        //   in Loop: Header=BB89_2 Depth=1
.LBB89_9:                               // %.preheader
                                        //   Parent Loop BB89_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x3, [x4]
	mov	r1, 168430090
	mov	r0, x3
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, -2139062144
	jne	rax, r0, .LBB89_12
	jmp	.LBB89_10
.LBB89_10:                              //   in Loop: Header=BB89_9 Depth=2
add	x2, -4
	mov	r1, -2147483648
add	x4, 4
	mov	r0, x2
	call	__bit_xor
	jg	rax, x9, .LBB89_9
	jmp	.LBB89_11
.LBB89_11:                              // %.loopexit6.i
                                        //   in Loop: Header=BB89_2 Depth=1
	mov	r0, 0
	jz	x2, .LBB89_15
	jmp	.LBB89_12
.LBB89_12:                              // %.loopexit5.i.preheader
                                        //   in Loop: Header=BB89_2 Depth=1
.LBB89_13:                              // %.loopexit5.i
                                        //   Parent Loop BB89_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	r0, x4
	je	rax, x5, .LBB89_15
	jmp	.LBB89_14
.LBB89_14:                              //   in Loop: Header=BB89_13 Depth=2
add	x2, -1
add	x4, 1
	mov	r0, 0
	jnz	x2, .LBB89_13
	jmp	.LBB89_15
.LBB89_15:                              // %memchr.exit
                                        //   in Loop: Header=BB89_2 Depth=1
	mov	x2, x0
	jz	r0, .LBB89_17
	jmp	.LBB89_16
.LBB89_16:                              //   in Loop: Header=BB89_2 Depth=1
	mov	x2, r0
	sub	x2, x13
.LBB89_17:                              //   in Loop: Header=BB89_2 Depth=1
	mov	[rsp], r0
	jz	x2, .LBB89_42
	jmp	.LBB89_18
.LBB89_18:                              //   in Loop: Header=BB89_2 Depth=1
	mov	x5, [x10]
	mov	r0, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
add	r0, 2
	mov	[rsp+4], r0
.LBB89_19:                              //   Parent Loop BB89_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB89_21 Depth 3
                                        //       Child Loop BB89_30 Depth 3
                                        //       Child Loop BB89_27 Depth 3
                                        //       Child Loop BB89_28 Depth 3
                                        //       Child Loop BB89_34 Depth 3
                                        //       Child Loop BB89_39 Depth 3
	mov	x4, 1023
	sub	x4, x5
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	x3, rax
	mov	r0, x2
	mov	r1, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	x6, x2
	sub	x6, x4
	mov	r0, rax
	mov	r1, x6
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	x3, rax
	add	x3, x4
	mov	x14, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
	mov	r1, -2147483648
	add	x14, x5
	mov	r0, x3
	call	__bit_xor
	mov	x7, x13
	mov	x6, x3
	jl	rax, x11, .LBB89_32
	jmp	.LBB89_20
.LBB89_20:                              //   in Loop: Header=BB89_19 Depth=2
	mov	r1, 3
	mov	r0, x14
	call	__bit_and
	mov	x6, rax
	mov	x1, 8
	sub	x1, x6
	mov	x10, 0
	mov	x11, 1
	mov	x8, x13
.LBB89_21:                              //   Parent Loop BB89_2 Depth=1
                                        //     Parent Loop BB89_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r0, x13
	add	r0, x10
	mov	r0, [r0]
	mov	x15, x11
	mov	x12, x14
	mov	r1, 255
	add	x12, x10
	call	__bit_and
	mov	r0, [x12]
	mov	r1, -256
	mov	x7, rax
	call	__bit_and
	mov	r1, 255
	mov	x9, rax
	mov	r0, x7
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x9
	mov	r1, rax
	call	__bit_or
	mov	[x12], rax
add	x10, 1
add	x8, 1
add	x11, 1
	jne	x1, x10, .LBB89_21
	jmp	.LBB89_22
.LBB89_22:                              //   in Loop: Header=BB89_19 Depth=2
	mov	r1, -8
	mov	r0, x6
	call	__bit_or
	mov	x6, rax
	mov	x7, x13
	add	x7, x10
	mov	r1, 3
	add	x6, x3
	mov	r0, x7
	call	__bit_and
	jnz	rax, .LBB89_29
	jmp	.LBB89_23
.LBB89_23:                              //   in Loop: Header=BB89_19 Depth=2
	mov	r1, -2147483648
	add	x14, x10
	mov	r0, x6
	call	__bit_xor
	mov	x9, -2147483645
	mov	x10, mcasm_static_00ac4c2001e59a84fcd276db8d985f14
	mov	x11, -2147483632
	mov	x12, -2147482625
	mov	x1, -2147483633
	jl	rax, x11, .LBB89_25
	jmp	.LBB89_24
.LBB89_24:                              // %.preheader.i.preheader
                                        //   in Loop: Header=BB89_19 Depth=2
	jmp	.LBB89_27
.LBB89_25:                              // %.preheader123
                                        //   in Loop: Header=BB89_19 Depth=2
	jmp	.LBB89_28
.LBB89_26:                              //   in Loop: Header=BB89_19 Depth=2
	mov	r0, 3
	jg	x6, r0, .LBB89_25
	jmp	.LBB89_32
.LBB89_27:                              // %.preheader.i
                                        //   Parent Loop BB89_2 Depth=1
                                        //     Parent Loop BB89_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r0, [x7]
	mov	r1, x7
add	r1, 4
	mov	[x14], r0
	mov	r0, [r1]
	mov	r1, x14
add	r1, 4
	mov	r2, x7
add	r2, 8
	mov	r3, x14
	mov	[r1], r0
	mov	r0, [r2]
add	r3, 8
	mov	r1, x7
add	r1, 12
	mov	r2, x14
add	r2, 12
	mov	[r3], r0
add	x7, 16
	mov	r0, [r1]
add	x14, 16
add	x6, -16
	mov	r1, -2147483648
	mov	[r2], r0
	mov	r0, x6
	call	__bit_xor
	jg	rax, x1, .LBB89_27
	jmp	.LBB89_26
.LBB89_28:                              //   Parent Loop BB89_2 Depth=1
                                        //     Parent Loop BB89_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r0, [x7]
add	x7, 4
	mov	[x14], r0
add	x6, -4
	mov	r1, -2147483648
add	x14, 4
	mov	r0, x6
	call	__bit_xor
	jg	rax, x9, .LBB89_28
	jmp	.LBB89_32
.LBB89_29:                              //   in Loop: Header=BB89_19 Depth=2
	mov	r1, 3
	mov	r0, rax
	mov	x1, rax
	call	__bit_shl
	mov	x5, rax
	mov	x9, 8
	mov	r1, 3
	sub	x9, x1
	mov	r0, x8
	call	__bit_and
	mov	x1, x13
	sub	x1, rax
	add	x10, x1
	mov	x10, [x10]
add	x1, 4
.LBB89_30:                              //   Parent Loop BB89_2 Depth=1
                                        //     Parent Loop BB89_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r0, x1
	add	r0, x15
	mov	x11, [r0]
	mov	x4, x14
	mov	r1, 31
	add	x4, x15
	mov	r0, x5
	call	__bit_and
	mov	r0, x10
	mov	r1, rax
	call	__bit_shr
	mov	x10, rax
	mov	r0, x5
	call	__bit_not
	mov	r1, 31
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
	mov	x12, rax
	mov	r0, x11
	call	__bit_shl
	mov	r0, rax
	mov	r1, x12
	call	__bit_shl
	mov	r0, rax
	mov	r1, x10
	call	__bit_or
	mov	[x4], rax
add	x6, -4
	mov	r1, -2147483648
add	x15, 4
	mov	r0, x9
	call	__bit_xor
	mov	r1, -2147483648
	mov	x12, rax
	mov	r0, x6
	call	__bit_xor
	mov	x10, x11
	jge	rax, x12, .LBB89_30
	jmp	.LBB89_31
.LBB89_31:                              //   in Loop: Header=BB89_19 Depth=2
	mov	r1, -4
	mov	r0, x7
	call	__bit_or
	mov	r1, 3
	mov	x5, rax
	mov	r0, x8
	call	__bit_and
	mov	x7, x13
	sub	x7, rax
	add	x7, x5
	add	x7, x15
add	x7, 4
	add	x14, x15
	mov	x9, -2147483645
	mov	x10, mcasm_static_00ac4c2001e59a84fcd276db8d985f14
	mov	x11, -2147483632
	mov	x12, -2147482625
	jmp	.LBB89_33
.LBB89_32:                              // %.loopexit8.i
                                        //   in Loop: Header=BB89_19 Depth=2
	jz	x6, .LBB89_36
	jmp	.LBB89_33
.LBB89_33:                              // %.preheader120
                                        //   in Loop: Header=BB89_19 Depth=2
	mov	x1, x14
.LBB89_34:                              //   Parent Loop BB89_2 Depth=1
                                        //     Parent Loop BB89_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r0, [x7]
add	x6, -1
	mov	r1, 255
add	x7, 1
	call	__bit_and
	mov	r0, [x14]
	mov	x5, rax
	mov	r1, -256
add	x1, 1
	call	__bit_and
	mov	r1, 255
	mov	x8, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	[x14], rax
	mov	x14, x1
	jnz	x6, .LBB89_34
	jmp	.LBB89_35
.LBB89_35:                              // %memcpy.exit.loopexit
                                        //   in Loop: Header=BB89_19 Depth=2
	mov	x5, [x10]
.LBB89_36:                              // %memcpy.exit
                                        //   in Loop: Header=BB89_19 Depth=2
	add	x5, x3
	mov	r1, -2147483648
	mov	[x10], x5
	mov	r0, x5
	call	__bit_xor
	jl	rax, x12, .LBB89_41
	jmp	.LBB89_37
.LBB89_37:                              //   in Loop: Header=BB89_19 Depth=2
	mov	x1, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
	add	x5, x1
	mov	r0, [x5]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x5], rax
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_0 with storage std:vm ls0
	mov	r0, [rsp+8]
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB89_40
	jmp	.LBB89_38
.LBB89_38:                              // %.preheader.i5.preheader
                                        //   in Loop: Header=BB89_19 Depth=2
	mov	x1, [rsp+4]
.LBB89_39:                              // %.preheader.i5
                                        //   Parent Loop BB89_2 Depth=1
                                        //     Parent Loop BB89_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_1 with storage std:vm ls0
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jnz	rax, .LBB89_39
	jmp	.LBB89_40
.LBB89_40:                              // %puts.exit
                                        //   in Loop: Header=BB89_19 Depth=2
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
	mov	[x10], 0
	mov	x5, 0
.LBB89_41:                              //   in Loop: Header=BB89_19 Depth=2
	add	x13, x3
	sub	x2, x3
	sub	x0, x3
	jnz	x2, .LBB89_19
	jmp	.LBB89_42
.LBB89_42:                              // %.loopexit
                                        //   in Loop: Header=BB89_2 Depth=1
	mov	x5, 10
	mov	r0, [rsp]
	jz	r0, .LBB89_47
	jmp	.LBB89_43
.LBB89_43:                              //   in Loop: Header=BB89_2 Depth=1
	mov	x1, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
	add	x1, [x10]
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_0 with storage std:vm ls0
	mov	r0, [rsp+8]
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB89_46
	jmp	.LBB89_44
.LBB89_44:                              // %.preheader.i6.preheader
                                        //   in Loop: Header=BB89_2 Depth=1
	mov	x1, mcasm_static_f4f5ec55549b356ae56eb42848b711eb
add	x1, 2
.LBB89_45:                              // %.preheader.i6
                                        //   Parent Loop BB89_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/putchar_1 with storage std:vm ls0
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jnz	rax, .LBB89_45
	jmp	.LBB89_46
.LBB89_46:                              // %puts.exit7
                                        //   in Loop: Header=BB89_2 Depth=1
add	x13, 1
add	x0, -1
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
	mov	[x10], 0
.LBB89_47:                              //   in Loop: Header=BB89_2 Depth=1
	jnz	x0, .LBB89_2
	jmp	.LBB89_48
.LBB89_48:                              // %.loopexit12
	mov	rax, 0
	mov	x15, [rsp+12]
	mov	x14, [rsp+16]
	mov	x13, [rsp+20]
	mov	x12, [rsp+24]
	mov	x11, [rsp+28]
	mov	x10, [rsp+32]
	mov	x9, [rsp+36]
	mov	x8, [rsp+40]
	mov	x7, [rsp+44]
	mov	x6, [rsp+48]
	mov	x5, [rsp+52]
	mov	x4, [rsp+56]
	mov	x3, [rsp+60]
	mov	x2, [rsp+64]
	mov	x1, [rsp+68]
	mov	x0, [rsp+72]
add	rsp, 76
	ret
// -- End function
// -- Begin function vprintf
vprintf:                                // @vprintf
// %bb.0:
sub	rsp, 544
	mov	[rsp+540], x0
	mov	[rsp+536], x1
	mov	[rsp+532], x2
	mov	[rsp+528], x3
	mov	[rsp+524], x4
	mov	[rsp+520], x5
	mov	r3, r1
	mov	[rsp+516], r3
	mov	[rsp+512], r3
	mov	r2, rsp
	mov	r1, 512
	mov	x2, r0
	mov	r0, r2
	mov	r2, x2
	call	vsnprintf
	mov	x3, rax
	mov	r0, 0
	mov	x1, -1
	jl	x3, r0, .LBB90_41
	jmp	.LBB90_1
.LBB90_1:
	mov	r0, 511
	jg	x3, r0, .LBB90_3
	jmp	.LBB90_2
.LBB90_2:                               // %.thread
	mov	r0, rsp
	mov	r1, x3
	call	__stdout_linebuf_write
	mov	x1, x3
	jmp	.LBB90_41
.LBB90_3:
add	x3, 1
	mov	r0, x3
	call	malloc
	mov	x0, rax
	jnz	x0, .LBB90_5
	jmp	.LBB90_4
.LBB90_4:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 12
	jmp	.LBB90_41
.LBB90_5:
	mov	r3, [rsp+516]
	mov	[rsp+512], r3
	mov	r0, x0
	mov	r1, x3
	mov	r2, x2
	call	vsnprintf
	mov	r0, -1
	mov	x1, rax
	jg	x1, r0, .LBB90_23
	jmp	.LBB90_6
.LBB90_6:
	mov	r0, 16384
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB90_8
	jmp	.LBB90_7
.LBB90_7:
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	x3, x0
add	x3, -1
	mov	x1, [x3]
	mov	x4, 0
	mov	x2, 0
	mov	rax, 0
	jmp	.LBB90_13
.LBB90_8:
	mov	r0, 16386
	mov	x2, [r0]
	mov	x3, x0
add	x3, -1
	mov	x1, [x3]
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x4, 0
	jz	x2, .LBB90_13
	jmp	.LBB90_9
.LBB90_9:
	jge	x2, x3, .LBB90_13
	jmp	.LBB90_10
.LBB90_10:                              // %.preheader.i.preheader
.LBB90_11:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	x4, x2
	mov	r0, x4
add	r0, 1
	mov	x2, [r0]
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	x2, .LBB90_13
	jmp	.LBB90_12
.LBB90_12:                              // %.preheader.i
                                        //   in Loop: Header=BB90_11 Depth=1
	jl	x2, x3, .LBB90_11
	jmp	.LBB90_13
.LBB90_13:                              // %.loopexit.i
	jne	x2, x3, .LBB90_15
	jmp	.LBB90_14
.LBB90_14:
	call	abort
.LBB90_15:
	mov	r0, 16386
	jz	x4, .LBB90_19
	jmp	.LBB90_16
.LBB90_16:
	mov	r0, [x4]
	mov	r1, r0
	add	r1, x4
	jne	r1, x3, .LBB90_18
	jmp	.LBB90_17
.LBB90_17:
	add	r0, x1
	mov	[x4], r0
	mov	x3, x4
	jmp	.LBB90_20
.LBB90_18:
add	x4, 1
	mov	r0, x4
.LBB90_19:
	mov	[r0], x3
	mov	[x0], x2
.LBB90_20:
	mov	r1, 1
	mov	x1, -1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB90_41
	jmp	.LBB90_21
.LBB90_21:
	mov	r0, [x3]
	mov	r1, r0
	add	r1, x3
	jne	r1, x2, .LBB90_41
	jmp	.LBB90_22
.LBB90_22:
	add	r0, [x2]
	mov	[x3], r0
add	x2, 1
	mov	r0, [x2]
add	x3, 1
	mov	[x3], r0
	jmp	.LBB90_41
.LBB90_23:
	mov	r0, x0
	mov	r1, x1
	call	__stdout_linebuf_write
	mov	r0, rsp
	je	x0, r0, .LBB90_41
	jmp	.LBB90_24
.LBB90_24:
	mov	r0, 16384
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB90_26
	jmp	.LBB90_25
.LBB90_25:
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	x3, x0
add	x3, -1
	mov	x4, [x3]
	mov	x5, 0
	mov	x2, 0
	mov	rax, 0
	jmp	.LBB90_31
.LBB90_26:
	mov	r0, 16386
	mov	x2, [r0]
	mov	x3, x0
add	x3, -1
	mov	x4, [x3]
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x5, 0
	jz	x2, .LBB90_31
	jmp	.LBB90_27
.LBB90_27:
	jge	x2, x3, .LBB90_31
	jmp	.LBB90_28
.LBB90_28:                              // %.preheader.i5.preheader
.LBB90_29:                              // %.preheader.i5
                                        // =>This Inner Loop Header: Depth=1
	mov	x5, x2
	mov	r0, x5
add	r0, 1
	mov	x2, [r0]
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	x2, .LBB90_31
	jmp	.LBB90_30
.LBB90_30:                              // %.preheader.i5
                                        //   in Loop: Header=BB90_29 Depth=1
	jl	x2, x3, .LBB90_29
	jmp	.LBB90_31
.LBB90_31:                              // %.loopexit.i4
	jne	x2, x3, .LBB90_33
	jmp	.LBB90_32
.LBB90_32:
	call	abort
.LBB90_33:
	mov	r0, 16386
	jz	x5, .LBB90_37
	jmp	.LBB90_34
.LBB90_34:
	mov	r0, [x5]
	mov	r1, r0
	add	r1, x5
	jne	r1, x3, .LBB90_36
	jmp	.LBB90_35
.LBB90_35:
	add	r0, x4
	mov	[x5], r0
	mov	x3, x5
	jmp	.LBB90_38
.LBB90_36:
add	x5, 1
	mov	r0, x5
.LBB90_37:
	mov	[r0], x3
	mov	[x0], x2
.LBB90_38:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB90_41
	jmp	.LBB90_39
.LBB90_39:
	mov	r0, [x3]
	mov	r1, r0
	add	r1, x3
	jne	r1, x2, .LBB90_41
	jmp	.LBB90_40
.LBB90_40:
	add	r0, [x2]
	mov	[x3], r0
add	x2, 1
	mov	r0, [x2]
add	x3, 1
	mov	[x3], r0
.LBB90_41:                              // %free.exit
	mov	rax, x1
	mov	x5, [rsp+520]
	mov	x4, [rsp+524]
	mov	x3, [rsp+528]
	mov	x2, [rsp+532]
	mov	x1, [rsp+536]
	mov	x0, [rsp+540]
add	rsp, 544
	ret
// -- End function
// -- Begin function vsnprintf
vsnprintf:                              // @vsnprintf
// %bb.0:
sub	rsp, 576
	mov	[rsp+572], x0
	mov	[rsp+568], x1
	mov	[rsp+564], x2
	mov	[rsp+560], x3
	mov	[rsp+556], x4
	mov	[rsp+552], x5
	mov	[rsp+548], x6
	mov	[rsp+544], x7
	mov	[rsp+540], x8
	mov	[rsp+536], x9
	mov	[rsp+532], x10
	mov	[rsp+528], x11
	mov	[rsp+524], x12
	mov	[rsp+520], x13
	mov	[rsp+516], x14
	mov	[rsp+512], x15
	mov	x4, r2
	mov	[rsp+92], r3
	mov	[rsp+80], r0
	mov	r0, rsp
add	r0, 84
	mov	[r0], r1
	mov	r0, rsp
add	r0, 88
	mov	[r0], 0
	mov	x1, rsp
add	x1, 96
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	r1, 3
	mov	[rsp+48], rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 3
	mov	r0, rax
	call	__bit_xor
	mov	r0, rsp
add	r0, 98
	mov	[rsp+24], r0
	mov	r0, rsp
add	r0, 415
	mov	[rsp+52], r0
	mov	x0, rsp
add	x0, 417
	mov	r0, rsp
add	r0, 97
	mov	[rsp+44], r0
add	rax, 1
	mov	[rsp+32], rax
	mov	x15, rsp
add	x15, 417
	mov	r0, rsp
add	r0, 351
	mov	[rsp+28], r0
	mov	r0, rsp
add	r0, 415
	mov	[rsp+36], r0
	mov	x11, 37
	mov	x3, 1
	mov	x9, -2147483638
	mov	r0, mcasm_static_d6be6aa1de7347d31fe38817b7c46b0b
	mov	r1, mcasm_static_1cb923c0b8a727a5738b7ee997983bc0
	sub	r1, r0
	mov	[rsp+20], r1
	mov	r0, mcasm_static_b9e802fbaf641deea9821b02daddc0fb
	mov	r1, mcasm_static_dd3f7305ff93b472d41bcd9472f338ce
	sub	r1, r0
	mov	[rsp+40], r1
	mov	[rsp+56], x0
	mov	[rsp+60], x15
.LBB91_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB91_44 Depth 2
                                        //       Child Loop BB91_40 Depth 3
                                        //         Child Loop BB91_36 Depth 4
                                        //           Child Loop BB91_16 Depth 5
                                        //             Child Loop BB91_24 Depth 6
                                        //             Child Loop BB91_8 Depth 6
                                        //     Child Loop BB91_58 Depth 2
                                        //     Child Loop BB91_64 Depth 2
                                        //     Child Loop BB91_487 Depth 2
                                        //     Child Loop BB91_489 Depth 2
                                        //     Child Loop BB91_491 Depth 2
                                        //     Child Loop BB91_500 Depth 2
                                        //     Child Loop BB91_509 Depth 2
                                        //     Child Loop BB91_519 Depth 2
                                        //     Child Loop BB91_180 Depth 2
                                        //     Child Loop BB91_164 Depth 2
                                        //     Child Loop BB91_543 Depth 2
                                        //     Child Loop BB91_556 Depth 2
                                        //     Child Loop BB91_211 Depth 2
                                        //     Child Loop BB91_215 Depth 2
                                        //     Child Loop BB91_223 Depth 2
                                        //     Child Loop BB91_225 Depth 2
                                        //     Child Loop BB91_230 Depth 2
                                        //     Child Loop BB91_204 Depth 2
                                        //     Child Loop BB91_206 Depth 2
                                        //     Child Loop BB91_208 Depth 2
                                        //     Child Loop BB91_281 Depth 2
                                        //     Child Loop BB91_289 Depth 2
                                        //     Child Loop BB91_294 Depth 2
                                        //     Child Loop BB91_299 Depth 2
                                        //     Child Loop BB91_302 Depth 2
                                        //     Child Loop BB91_326 Depth 2
                                        //     Child Loop BB91_327 Depth 2
                                        //     Child Loop BB91_331 Depth 2
                                        //     Child Loop BB91_306 Depth 2
                                        //     Child Loop BB91_313 Depth 2
                                        //     Child Loop BB91_339 Depth 2
                                        //     Child Loop BB91_342 Depth 2
                                        //     Child Loop BB91_345 Depth 2
                                        //     Child Loop BB91_351 Depth 2
                                        //     Child Loop BB91_354 Depth 2
                                        //     Child Loop BB91_357 Depth 2
                                        //     Child Loop BB91_363 Depth 2
                                        //     Child Loop BB91_365 Depth 2
                                        //     Child Loop BB91_367 Depth 2
                                        //     Child Loop BB91_377 Depth 2
                                        //     Child Loop BB91_380 Depth 2
                                        //     Child Loop BB91_383 Depth 2
                                        //     Child Loop BB91_390 Depth 2
                                        //     Child Loop BB91_396 Depth 2
                                        //     Child Loop BB91_398 Depth 2
                                        //     Child Loop BB91_400 Depth 2
                                        //     Child Loop BB91_417 Depth 2
                                        //     Child Loop BB91_418 Depth 2
                                        //     Child Loop BB91_421 Depth 2
                                        //     Child Loop BB91_406 Depth 2
                                        //     Child Loop BB91_410 Depth 2
                                        //     Child Loop BB91_318 Depth 2
                                        //     Child Loop BB91_425 Depth 2
                                        //     Child Loop BB91_432 Depth 2
                                        //     Child Loop BB91_434 Depth 2
                                        //     Child Loop BB91_436 Depth 2
                                        //     Child Loop BB91_252 Depth 2
                                        //     Child Loop BB91_258 Depth 2
                                        //     Child Loop BB91_261 Depth 2
                                        //     Child Loop BB91_267 Depth 2
                                        //     Child Loop BB91_243 Depth 2
                                        //     Child Loop BB91_245 Depth 2
                                        //     Child Loop BB91_247 Depth 2
                                        //     Child Loop BB91_444 Depth 2
                                        //     Child Loop BB91_459 Depth 2
                                        //     Child Loop BB91_468 Depth 2
                                        //     Child Loop BB91_478 Depth 2
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	je	rax, x11, .LBB91_3
	jmp	.LBB91_2
.LBB91_2:                               //   in Loop: Header=BB91_1 Depth=1
	jz	rax, .LBB91_567
	jmp	.LBB91_4
.LBB91_3:                               // %.preheader194.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x12, 0
	mov	x8, 32
	mov	x14, x4
	mov	x10, 0
	mov	x1, 0
	mov	x13, 0
	mov	x5, 0
	mov	x7, 42
	mov	x6, 43
	jmp	.LBB91_44
.LBB91_4:                               //   in Loop: Header=BB91_1 Depth=1
	mov	x2, rax
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 88
	mov	x1, [r1]
	mov	x5, x1
add	x5, 1
	jz	r0, .LBB91_7
	jmp	.LBB91_5
.LBB91_5:                               //   in Loop: Header=BB91_1 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x5
	call	__bit_xor
	jge	rax, x6, .LBB91_7
	jmp	.LBB91_6
.LBB91_6:                               //   in Loop: Header=BB91_1 Depth=1
	add	x1, [rsp+80]
	mov	x5, [x1]
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, -256
	mov	x2, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, rsp
add	r0, 88
	mov	x5, 1
	add	x5, [r0]
.LBB91_7:                               //   in Loop: Header=BB91_1 Depth=1
add	x4, 1
	mov	r0, rsp
add	r0, 88
	mov	[r0], x5
	mov	x9, -2147483638
	jmp	.LBB91_1
.LBB91_8:                               // %.preheader
                                        //   Parent Loop BB91_1 Depth=1
                                        //     Parent Loop BB91_44 Depth=2
                                        //       Parent Loop BB91_40 Depth=3
                                        //         Parent Loop BB91_36 Depth=4
                                        //           Parent Loop BB91_16 Depth=5
                                        // =>          This Inner Loop Header: Depth=6
add	x14, 1
	mov	r0, [x14]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	je	x4, x2, .LBB91_8
	jmp	.LBB91_9
.LBB91_9:                               // %.preheader
                                        //   in Loop: Header=BB91_16 Depth=5
	mov	r0, 41
	jg	x4, r0, .LBB91_12
	jmp	.LBB91_10
.LBB91_10:                              // %.preheader
                                        //   in Loop: Header=BB91_36 Depth=4
	mov	r0, 32
	je	x4, r0, .LBB91_33
	jmp	.LBB91_11
.LBB91_11:                              // %.preheader
                                        //   in Loop: Header=BB91_40 Depth=3
	mov	r0, 35
	je	x4, r0, .LBB91_37
	jmp	.LBB91_53
.LBB91_12:                              // %.preheader
                                        //   in Loop: Header=BB91_16 Depth=5
	je	x4, x7, .LBB91_45
	jmp	.LBB91_13
.LBB91_13:                              // %.preheader
                                        //   in Loop: Header=BB91_16 Depth=5
	mov	r0, 48
	je	x4, r0, .LBB91_41
	jmp	.LBB91_14
.LBB91_14:                              // %.preheader
                                        //   in Loop: Header=BB91_16 Depth=5
	jne	x4, x6, .LBB91_53
	jmp	.LBB91_15
.LBB91_15:                              // %.loopexit116.outer.loopexit
                                        //   in Loop: Header=BB91_16 Depth=5
	mov	x13, 1
	mov	x5, 1
.LBB91_16:                              // %.loopexit116.outer
                                        //   Parent Loop BB91_1 Depth=1
                                        //     Parent Loop BB91_44 Depth=2
                                        //       Parent Loop BB91_40 Depth=3
                                        //         Parent Loop BB91_36 Depth=4
                                        // =>        This Loop Header: Depth=5
                                        //             Child Loop BB91_24 Depth 6
                                        //             Child Loop BB91_8 Depth 6
	mov	x2, x14
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	jg	x4, x7, .LBB91_20
	jmp	.LBB91_17
.LBB91_17:                              // %.loopexit116.outer
                                        //   in Loop: Header=BB91_36 Depth=4
	mov	r0, 32
	je	x4, r0, .LBB91_35
	jmp	.LBB91_18
.LBB91_18:                              // %.loopexit116.outer
                                        //   in Loop: Header=BB91_40 Depth=3
	mov	r0, 35
	je	x4, r0, .LBB91_39
	jmp	.LBB91_19
.LBB91_19:                              // %.loopexit116.outer
                                        //   in Loop: Header=BB91_1 Depth=1
	je	x4, x7, .LBB91_47
	jmp	.LBB91_55
.LBB91_20:                              // %.loopexit116.outer
                                        //   in Loop: Header=BB91_16 Depth=5
	je	x4, x6, .LBB91_23
	jmp	.LBB91_21
.LBB91_21:                              // %.loopexit116.outer
                                        //   in Loop: Header=BB91_16 Depth=5
	mov	r0, 45
	je	x4, r0, .LBB91_32
	jmp	.LBB91_22
.LBB91_22:                              // %.loopexit116.outer
                                        //   in Loop: Header=BB91_44 Depth=2
	mov	r0, 48
	je	x4, r0, .LBB91_43
	jmp	.LBB91_55
.LBB91_23:                              // %.loopexit116.preheader
                                        //   in Loop: Header=BB91_16 Depth=5
.LBB91_24:                              // %.loopexit116
                                        //   Parent Loop BB91_1 Depth=1
                                        //     Parent Loop BB91_44 Depth=2
                                        //       Parent Loop BB91_40 Depth=3
                                        //         Parent Loop BB91_36 Depth=4
                                        //           Parent Loop BB91_16 Depth=5
                                        // =>          This Inner Loop Header: Depth=6
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	je	x4, x6, .LBB91_24
	jmp	.LBB91_25
.LBB91_25:                              // %.loopexit116
                                        //   in Loop: Header=BB91_16 Depth=5
	mov	r0, 41
	jg	x4, r0, .LBB91_28
	jmp	.LBB91_26
.LBB91_26:                              // %.loopexit116
                                        //   in Loop: Header=BB91_36 Depth=4
	mov	r0, 32
	je	x4, r0, .LBB91_34
	jmp	.LBB91_27
.LBB91_27:                              // %.loopexit116
                                        //   in Loop: Header=BB91_40 Depth=3
	mov	r0, 35
	je	x4, r0, .LBB91_38
	jmp	.LBB91_54
.LBB91_28:                              // %.loopexit116
                                        //   in Loop: Header=BB91_16 Depth=5
	je	x4, x7, .LBB91_46
	jmp	.LBB91_29
.LBB91_29:                              // %.loopexit116
                                        //   in Loop: Header=BB91_16 Depth=5
	mov	r0, 48
	je	x4, r0, .LBB91_42
	jmp	.LBB91_30
.LBB91_30:                              // %.loopexit116
                                        //   in Loop: Header=BB91_16 Depth=5
	mov	r0, 45
	jne	x4, r0, .LBB91_54
	jmp	.LBB91_31
.LBB91_31:                              // %.preheader.preheader.loopexit
                                        //   in Loop: Header=BB91_16 Depth=5
	mov	x13, 1
.LBB91_32:                              // %.preheader.preheader
                                        //   in Loop: Header=BB91_16 Depth=5
	mov	x14, x2
	mov	x2, 45
	jmp	.LBB91_8
.LBB91_33:                              // %.loopexit117.backedge.loopexit
                                        //   in Loop: Header=BB91_36 Depth=4
	mov	x1, 1
	mov	x5, 1
	jmp	.LBB91_36
.LBB91_34:                              // %.loopexit117.backedge.loopexit2
                                        //   in Loop: Header=BB91_36 Depth=4
	mov	x1, 1
	mov	x14, x2
	mov	x13, 1
	jmp	.LBB91_36
.LBB91_35:                              // %.loopexit117.backedge.loopexit7
                                        //   in Loop: Header=BB91_36 Depth=4
	mov	x1, 1
	mov	x14, x2
.LBB91_36:                              // %.loopexit117
                                        //   Parent Loop BB91_1 Depth=1
                                        //     Parent Loop BB91_44 Depth=2
                                        //       Parent Loop BB91_40 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB91_16 Depth 5
                                        //             Child Loop BB91_24 Depth 6
                                        //             Child Loop BB91_8 Depth 6
	jmp	.LBB91_16
.LBB91_37:                              // %.loopexit118.backedge.loopexit
                                        //   in Loop: Header=BB91_40 Depth=3
	mov	x10, 1
	mov	x5, 1
	jmp	.LBB91_40
.LBB91_38:                              // %.loopexit118.backedge.loopexit3
                                        //   in Loop: Header=BB91_40 Depth=3
	mov	x10, 1
	mov	x14, x2
	mov	x13, 1
	jmp	.LBB91_40
.LBB91_39:                              // %.loopexit118.backedge.loopexit8
                                        //   in Loop: Header=BB91_40 Depth=3
	mov	x10, 1
	mov	x14, x2
.LBB91_40:                              // %.loopexit118
                                        //   Parent Loop BB91_1 Depth=1
                                        //     Parent Loop BB91_44 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB91_36 Depth 4
                                        //           Child Loop BB91_16 Depth 5
                                        //             Child Loop BB91_24 Depth 6
                                        //             Child Loop BB91_8 Depth 6
	jmp	.LBB91_36
.LBB91_41:                              // %.preheader194.backedge.loopexit
                                        //   in Loop: Header=BB91_44 Depth=2
	mov	x12, 1
	mov	x8, x4
	mov	x5, 1
	jmp	.LBB91_44
.LBB91_42:                              // %.preheader194.backedge.loopexit4
                                        //   in Loop: Header=BB91_44 Depth=2
	mov	x12, 1
	mov	x14, x2
	mov	x8, x4
	mov	x13, 1
	jmp	.LBB91_44
.LBB91_43:                              // %.preheader194.backedge.loopexit9
                                        //   in Loop: Header=BB91_44 Depth=2
	mov	x12, 1
	mov	x14, x2
	mov	x8, x4
.LBB91_44:                              // %.preheader194
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB91_40 Depth 3
                                        //         Child Loop BB91_36 Depth 4
                                        //           Child Loop BB91_16 Depth 5
                                        //             Child Loop BB91_24 Depth 6
                                        //             Child Loop BB91_8 Depth 6
	jmp	.LBB91_40
.LBB91_45:                              // %.loopexit120.loopexit
                                        //   in Loop: Header=BB91_1 Depth=1
add	x14, -1
	mov	x5, 1
	jmp	.LBB91_48
.LBB91_46:                              // %.loopexit120.loopexit5
                                        //   in Loop: Header=BB91_1 Depth=1
add	x2, -1
	mov	x13, 1
	mov	x14, x2
	jmp	.LBB91_48
.LBB91_47:                              // %.loopexit120.loopexit10
                                        //   in Loop: Header=BB91_1 Depth=1
.LBB91_48:                              // %.loopexit120
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r0, [r0]
	mov	x6, r0
	mov	r1, -1
	jg	r0, r1, .LBB91_50
	jmp	.LBB91_49
.LBB91_49:                              //   in Loop: Header=BB91_1 Depth=1
	mov	x6, 0
	sub	x6, r0
.LBB91_50:                              //   in Loop: Header=BB91_1 Depth=1
	mov	x2, 1
	mov	r1, 0
	jl	r0, r1, .LBB91_52
	jmp	.LBB91_51
.LBB91_51:                              //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x5
.LBB91_52:                              //   in Loop: Header=BB91_1 Depth=1
	mov	[rsp+76], x12
add	x14, 2
	mov	r0, [x14]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	mov	x5, x2
	jmp	.LBB91_59
.LBB91_53:                              // %.loopexit.loopexit
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x5, 1
	jmp	.LBB91_56
.LBB91_54:                              // %.loopexit.loopexit1
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x13, 1
	mov	x14, x2
	jmp	.LBB91_56
.LBB91_55:                              // %.loopexit.loopexit6
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x14, x2
.LBB91_56:                              // %.loopexit
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	[rsp+76], x12
	mov	r0, x4
add	r0, -48
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	x6, 0
	mov	r0, rax
	call	__bit_xor
	mov	r0, -2147483639
	jg	rax, r0, .LBB91_59
	jmp	.LBB91_57
.LBB91_57:                              // %.preheader192.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
.LBB91_58:                              // %.preheader192
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x4, -48
	mov	r1, 255
	mul	x6, 10
	mov	r0, x4
	call	__bit_and
add	x14, 1
	mov	r0, [x14]
	mov	r1, 255
	add	x6, rax
	call	__bit_and
	mov	x4, rax
	mov	r0, x4
add	r0, -48
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jl	rax, x9, .LBB91_58
	jmp	.LBB91_59
.LBB91_59:                              // %.loopexit193
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x4
	call	__bit_and
	mov	x12, -1
	mov	r0, 46
	jne	rax, r0, .LBB91_65
	jmp	.LBB91_60
.LBB91_60:                              //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x14
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	jne	x4, x7, .LBB91_62
	jmp	.LBB91_61
.LBB91_61:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x2, [r0]
	mov	r1, -2147483648
add	x14, 2
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 2147483647
	mov	x9, rax
	mov	r0, x4
	call	__bit_xor
	mov	r1, 2147483647
	mov	x11, rax
	mov	r0, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x11
	mov	x11, 37
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
add	x2, 1
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, [x14]
	mov	x12, rax
	mov	r1, 255
add	x12, -1
	call	__bit_and
	mov	x4, rax
	jmp	.LBB91_65
.LBB91_62:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, x4
add	r0, -48
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	x12, 0
	mov	r0, rax
	call	__bit_xor
	mov	x14, x2
	mov	r0, -2147483639
	jg	rax, r0, .LBB91_65
	jmp	.LBB91_63
.LBB91_63:                              // %.preheader190.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x14, x2
.LBB91_64:                              // %.preheader190
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x4, -48
	mov	r1, 255
	mul	x12, 10
	mov	r0, x4
	call	__bit_and
add	x14, 1
	mov	r0, [x14]
	mov	r1, 255
	add	x12, rax
	call	__bit_and
	mov	x4, rax
	mov	r0, x4
add	r0, -48
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jl	rax, x9, .LBB91_64
	jmp	.LBB91_65
.LBB91_65:                              // %.loopexit191
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x4
	call	__bit_and
	mov	x2, 0
	mov	r0, 107
	jg	rax, r0, .LBB91_68
	jmp	.LBB91_66
.LBB91_66:                              // %.loopexit191
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 76
	je	rax, r0, .LBB91_75
	jmp	.LBB91_67
.LBB91_67:                              // %.loopexit191
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 104
	je	rax, r0, .LBB91_71
	jmp	.LBB91_78
.LBB91_68:                              // %.loopexit191
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 108
	je	rax, r0, .LBB91_73
	jmp	.LBB91_69
.LBB91_69:                              // %.loopexit191
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 116
	je	rax, r0, .LBB91_77
	jmp	.LBB91_70
.LBB91_70:                              // %.loopexit191
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 122
	je	rax, r0, .LBB91_76
	jmp	.LBB91_78
.LBB91_71:                              //   in Loop: Header=BB91_1 Depth=1
	mov	x4, x14
add	x4, 1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	x9, rax
	mov	x2, 2
	mov	r0, 104
	jne	x9, r0, .LBB91_79
	jmp	.LBB91_72
.LBB91_72:                              //   in Loop: Header=BB91_1 Depth=1
add	x14, 2
	mov	x2, 1
	jmp	.LBB91_78
.LBB91_73:                              //   in Loop: Header=BB91_1 Depth=1
	mov	x4, x14
add	x4, 1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	x9, rax
	mov	x2, 3
	mov	r0, 108
	jne	x9, r0, .LBB91_79
	jmp	.LBB91_74
.LBB91_74:                              //   in Loop: Header=BB91_1 Depth=1
add	x14, 2
	mov	x2, 4
	jmp	.LBB91_78
.LBB91_75:                              //   in Loop: Header=BB91_1 Depth=1
add	x14, 1
	mov	x2, 5
	jmp	.LBB91_78
.LBB91_76:                              //   in Loop: Header=BB91_1 Depth=1
add	x14, 1
	mov	x2, 6
	jmp	.LBB91_78
.LBB91_77:                              //   in Loop: Header=BB91_1 Depth=1
add	x14, 1
	mov	x2, 7
.LBB91_78:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [x14]
	mov	r1, 255
	call	__bit_and
	mov	x9, rax
	mov	x4, x14
.LBB91_79:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	jz	rax, .LBB91_567
	jmp	.LBB91_80
.LBB91_80:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
add	x4, 1
	mov	r0, x9
	call	__bit_and
	mov	r0, 100
	jg	rax, r0, .LBB91_87
	jmp	.LBB91_81
.LBB91_81:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 87
	jg	rax, r0, .LBB91_84
	jmp	.LBB91_82
.LBB91_82:                              //   in Loop: Header=BB91_1 Depth=1
	mov	x2, rax
	mov	r0, rax
add	r0, -69
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, -2147483645
	jl	rax, r0, .LBB91_184
	jmp	.LBB91_83
.LBB91_83:                              //   in Loop: Header=BB91_1 Depth=1
	je	x2, x11, .LBB91_538
	jmp	.LBB91_560
.LBB91_84:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 88
	je	rax, r0, .LBB91_129
	jmp	.LBB91_85
.LBB91_85:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 99
	je	rax, r0, .LBB91_159
	jmp	.LBB91_86
.LBB91_86:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 100
	je	rax, r0, .LBB91_97
	jmp	.LBB91_560
.LBB91_87:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 110
	jg	rax, r0, .LBB91_91
	jmp	.LBB91_88
.LBB91_88:                              //   in Loop: Header=BB91_1 Depth=1
	mov	x7, rax
	mov	r0, rax
add	r0, -101
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, -2147483645
	jl	rax, r0, .LBB91_184
	jmp	.LBB91_89
.LBB91_89:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 105
	je	x7, r0, .LBB91_97
	jmp	.LBB91_90
.LBB91_90:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 110
	je	x7, r0, .LBB91_524
	jmp	.LBB91_560
.LBB91_91:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 114
	jg	rax, r0, .LBB91_94
	jmp	.LBB91_92
.LBB91_92:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 111
	je	rax, r0, .LBB91_144
	jmp	.LBB91_93
.LBB91_93:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 112
	je	rax, r0, .LBB91_523
	jmp	.LBB91_560
.LBB91_94:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 115
	je	rax, r0, .LBB91_483
	jmp	.LBB91_95
.LBB91_95:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 117
	je	rax, r0, .LBB91_114
	jmp	.LBB91_96
.LBB91_96:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 120
	je	rax, r0, .LBB91_129
	jmp	.LBB91_560
.LBB91_97:                              //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 3
	jg	x2, r0, .LBB91_101
	jmp	.LBB91_98
.LBB91_98:                              //   in Loop: Header=BB91_1 Depth=1
	je	x2, x3, .LBB91_104
	jmp	.LBB91_99
.LBB91_99:                              //   in Loop: Header=BB91_1 Depth=1
	mov	x9, -2147483638
	mov	r0, 2
	je	x2, r0, .LBB91_105
	jmp	.LBB91_100
.LBB91_100:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 3
	je	x2, r0, .LBB91_106
	jmp	.LBB91_110
.LBB91_101:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 4
	je	x2, r0, .LBB91_107
	jmp	.LBB91_102
.LBB91_102:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 6
	je	x2, r0, .LBB91_108
	jmp	.LBB91_103
.LBB91_103:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x9, -2147483638
	mov	r0, 7
	je	x2, r0, .LBB91_109
	jmp	.LBB91_110
.LBB91_104:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 128
	mov	r0, rax
	call	__bit_xor
	mov	x8, rax
add	x8, -128
	mov	r1, 31
	mov	r0, x8
	call	__bit_sar
	mov	x9, -2147483638
	jmp	.LBB91_111
.LBB91_105:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r0, [r0]
	mov	r1, 65535
	call	__bit_and
	mov	r1, 32768
	mov	r0, rax
	call	__bit_xor
	mov	x8, rax
add	x8, -32768
	mov	r1, 31
	mov	r0, x8
	call	__bit_sar
	jmp	.LBB91_111
.LBB91_106:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x8, [r0]
	mov	r1, 31
	mov	r0, x8
	call	__bit_sar
	jmp	.LBB91_111
.LBB91_107:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x8, [r0]
add	r0, 8
	mov	[rsp+92], r0
	mov	rax, [r1]
	mov	x9, -2147483638
	jmp	.LBB91_111
.LBB91_108:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x8, [r0]
	mov	r1, 31
	mov	r0, x8
	call	__bit_sar
	mov	x9, -2147483638
	jmp	.LBB91_111
.LBB91_109:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x8, [r0]
	mov	r1, 31
	mov	r0, x8
	call	__bit_sar
	jmp	.LBB91_111
.LBB91_110:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x8, [r0]
	mov	r1, 31
	mov	r0, x8
	call	__bit_sar
.LBB91_111:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, -1
	jg	rax, r0, .LBB91_113
	jmp	.LBB91_112
.LBB91_112:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 0
	mov	r1, 0
	mov	r2, x8
	mov	r3, rax
	call	__subdi3
	mov	r2, t0
	mov	r0, rsp
	mov	r1, rsp
	mov	r3, rsp
	mov	r4, rsp
add	r0, 16
	mov	[r0], x12
add	r1, 12
	mov	[r1], x6
add	r3, 8
	mov	r0, [rsp+76]
	mov	[r3], r0
add	r4, 4
	mov	[r4], x1
	mov	[rsp], x13
	mov	r0, rsp
add	r0, 80
	mov	r3, 1
	mov	r4, 10
	mov	r5, 0
	mov	r6, 0
	mov	r1, rax
	mov	r7, x5
	call	format_integer
	jmp	.LBB91_1
.LBB91_113:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
	mov	r1, rsp
	mov	r2, rsp
	mov	r3, rsp
add	r0, 16
	mov	[r0], x12
add	r1, 12
	mov	[r1], x6
add	r2, 8
	mov	r0, [rsp+76]
	mov	[r2], r0
add	r3, 4
	mov	[r3], x1
	mov	[rsp], x13
	mov	r0, rsp
add	r0, 80
	mov	r3, 0
	mov	r4, 10
	mov	r5, 0
	mov	r6, 0
	mov	r1, x8
	mov	r2, rax
	mov	r7, x5
	call	format_integer
	jmp	.LBB91_1
.LBB91_114:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 3
	jg	x2, r0, .LBB91_118
	jmp	.LBB91_115
.LBB91_115:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x9, -2147483638
	je	x2, x3, .LBB91_121
	jmp	.LBB91_116
.LBB91_116:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 2
	je	x2, r0, .LBB91_122
	jmp	.LBB91_117
.LBB91_117:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 3
	je	x2, r0, .LBB91_123
	jmp	.LBB91_127
.LBB91_118:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x9, -2147483638
	mov	r0, 4
	je	x2, r0, .LBB91_124
	jmp	.LBB91_119
.LBB91_119:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 6
	je	x2, r0, .LBB91_125
	jmp	.LBB91_120
.LBB91_120:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 7
	je	x2, r0, .LBB91_126
	jmp	.LBB91_127
.LBB91_121:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, rax
	mov	r2, 0
	jmp	.LBB91_128
.LBB91_122:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r0, [r0]
	mov	r1, 65535
	call	__bit_and
	mov	r1, rax
	mov	r2, 0
	jmp	.LBB91_128
.LBB91_123:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r1, [r0]
	mov	r2, 0
	jmp	.LBB91_128
.LBB91_124:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r2, r0
add	r2, 4
	mov	[rsp+92], r2
	mov	r1, [r0]
add	r0, 8
	mov	[rsp+92], r0
	mov	r2, [r2]
	jmp	.LBB91_128
.LBB91_125:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r1, [r0]
	mov	r2, 0
	jmp	.LBB91_128
.LBB91_126:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x2, [r0]
	mov	r1, 31
	mov	r0, x2
	call	__bit_sar
	mov	r1, x2
	mov	r2, rax
	jmp	.LBB91_128
.LBB91_127:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r1, [r0]
	mov	r2, 0
.LBB91_128:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
	mov	r3, rsp
	mov	r4, rsp
	mov	r5, rsp
add	r0, 16
	mov	[r0], x12
add	r3, 12
	mov	[r3], x6
add	r4, 8
	mov	r0, [rsp+76]
	mov	[r4], r0
add	r5, 4
	mov	[r5], 0
	mov	[rsp], 0
	mov	r0, rsp
add	r0, 80
	mov	r3, 0
	mov	r4, 10
	mov	r5, 0
	mov	r6, 0
	mov	r7, x5
	call	format_integer
	jmp	.LBB91_1
.LBB91_129:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 3
	jg	x2, r0, .LBB91_133
	jmp	.LBB91_130
.LBB91_130:                             //   in Loop: Header=BB91_1 Depth=1
	je	x2, x3, .LBB91_136
	jmp	.LBB91_131
.LBB91_131:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 2
	je	x2, r0, .LBB91_137
	jmp	.LBB91_132
.LBB91_132:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 3
	je	x2, r0, .LBB91_138
	jmp	.LBB91_142
.LBB91_133:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 4
	je	x2, r0, .LBB91_139
	jmp	.LBB91_134
.LBB91_134:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 6
	je	x2, r0, .LBB91_140
	jmp	.LBB91_135
.LBB91_135:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 7
	je	x2, r0, .LBB91_141
	jmp	.LBB91_142
.LBB91_136:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x8, rax
	mov	x11, 0
	jmp	.LBB91_143
.LBB91_137:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r0, [r0]
	mov	r1, 65535
	call	__bit_and
	mov	x8, rax
	mov	x11, 0
	jmp	.LBB91_143
.LBB91_138:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x8, [r0]
	mov	x11, 0
	jmp	.LBB91_143
.LBB91_139:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x8, [r0]
add	r0, 8
	mov	[rsp+92], r0
	mov	x11, [r1]
	jmp	.LBB91_143
.LBB91_140:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x8, [r0]
	mov	x11, 0
	jmp	.LBB91_143
.LBB91_141:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x8, [r0]
	mov	r1, 31
	mov	r0, x8
	call	__bit_sar
	mov	x11, rax
	jmp	.LBB91_143
.LBB91_142:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x8, [r0]
	mov	x11, 0
.LBB91_143:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	r1, 88
	mov	r0, rax
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rsp
	mov	r1, rsp
	mov	r2, rsp
	mov	r3, rsp
add	r0, 16
	mov	[r0], x12
add	r1, 12
	mov	[r1], x6
add	r2, 8
	mov	r0, [rsp+76]
	mov	[r2], r0
add	r3, 4
	mov	[r3], 0
	mov	[rsp], 0
	mov	r0, rsp
add	r0, 80
	mov	r3, 0
	mov	r4, 16
	mov	r1, x8
	mov	r2, x11
	mov	r5, rax
	mov	r6, x10
	mov	r7, x5
	call	format_integer
	mov	x11, 37
	mov	x9, -2147483638
	jmp	.LBB91_1
.LBB91_144:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 3
	jg	x2, r0, .LBB91_148
	jmp	.LBB91_145
.LBB91_145:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x9, -2147483638
	je	x2, x3, .LBB91_151
	jmp	.LBB91_146
.LBB91_146:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 2
	je	x2, r0, .LBB91_152
	jmp	.LBB91_147
.LBB91_147:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 3
	je	x2, r0, .LBB91_153
	jmp	.LBB91_157
.LBB91_148:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x9, -2147483638
	mov	r0, 4
	je	x2, r0, .LBB91_154
	jmp	.LBB91_149
.LBB91_149:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 6
	je	x2, r0, .LBB91_155
	jmp	.LBB91_150
.LBB91_150:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 7
	je	x2, r0, .LBB91_156
	jmp	.LBB91_157
.LBB91_151:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, rax
	mov	r2, 0
	jmp	.LBB91_158
.LBB91_152:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r0, [r0]
	mov	r1, 65535
	call	__bit_and
	mov	r1, rax
	mov	r2, 0
	jmp	.LBB91_158
.LBB91_153:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r1, [r0]
	mov	r2, 0
	jmp	.LBB91_158
.LBB91_154:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r2, r0
add	r2, 4
	mov	[rsp+92], r2
	mov	r1, [r0]
add	r0, 8
	mov	[rsp+92], r0
	mov	r2, [r2]
	jmp	.LBB91_158
.LBB91_155:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r1, [r0]
	mov	r2, 0
	jmp	.LBB91_158
.LBB91_156:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x2, [r0]
	mov	r1, 31
	mov	r0, x2
	call	__bit_sar
	mov	r1, x2
	mov	r2, rax
	jmp	.LBB91_158
.LBB91_157:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r1, [r0]
	mov	r2, 0
.LBB91_158:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
	mov	r3, rsp
	mov	r4, rsp
	mov	r5, rsp
add	r0, 16
	mov	[r0], x12
add	r3, 12
	mov	[r3], x6
add	r4, 8
	mov	r0, [rsp+76]
	mov	[r4], r0
add	r5, 4
	mov	[r5], 0
	mov	[rsp], 0
	mov	r0, rsp
add	r0, 80
	mov	r3, 0
	mov	r4, 8
	mov	r5, 0
	mov	r6, x10
	mov	r7, x5
	call	format_integer
	jmp	.LBB91_1
.LBB91_159:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x7, [r0]
	mov	x8, x6
add	x8, -1
	jnz	x5, .LBB91_172
	jmp	.LBB91_160
.LBB91_160:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	mov	r1, 2147483646
	mov	x2, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -2147483647
	mov	x5, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483647
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x8
	call	__bit_and
	mov	r0, rsp
add	r0, 84
	mov	x8, [r0]
	mov	r0, rsp
add	r0, 88
	mov	x5, [r0]
	mov	x6, rax
	mov	x9, -2147483638
	jz	x6, .LBB91_168
	jmp	.LBB91_161
.LBB91_161:                             //   in Loop: Header=BB91_1 Depth=1
	jz	x8, .LBB91_163
	jmp	.LBB91_162
.LBB91_162:                             // %.preheader130.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
add	x6, 1
	mov	x1, x5
	jmp	.LBB91_164
.LBB91_163:                             //   in Loop: Header=BB91_1 Depth=1
	add	x5, x6
	jmp	.LBB91_171
.LBB91_164:                             // %.preheader130
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x5, 1
	jz	x8, .LBB91_167
	jmp	.LBB91_165
.LBB91_165:                             // %.preheader130
                                        //   in Loop: Header=BB91_164 Depth=2
	mov	r1, -2147483648
	mov	r0, x8
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x5
	call	__bit_xor
	jge	rax, x2, .LBB91_167
	jmp	.LBB91_166
.LBB91_166:                             //   in Loop: Header=BB91_164 Depth=2
	add	x1, [rsp+80]
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, rsp
add	r0, 88
	mov	x5, 1
	add	x5, [r0]
	mov	r0, rsp
add	r0, 84
	mov	x8, [r0]
.LBB91_167:                             //   in Loop: Header=BB91_164 Depth=2
	mov	r0, rsp
add	r0, 88
add	x6, -1
	mov	[r0], x5
	mov	x1, x5
	jg	x6, x3, .LBB91_164
	jmp	.LBB91_168
.LBB91_168:                             // %.loopexit131
                                        //   in Loop: Header=BB91_1 Depth=1
	jz	x8, .LBB91_171
	jmp	.LBB91_169
.LBB91_169:                             // %.loopexit131
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x5
	mov	r1, -2147483648
add	x2, 1
	mov	r0, x8
	call	__bit_xor
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x6, .LBB91_171
	jmp	.LBB91_170
.LBB91_170:                             //   in Loop: Header=BB91_1 Depth=1
	add	x5, [rsp+80]
	mov	x2, [x5]
	mov	r1, 255
	mov	r0, x7
	call	__bit_and
	mov	r1, -256
	mov	x6, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	mov	r0, rsp
add	r0, 88
	mov	x5, [r0]
.LBB91_171:                             //   in Loop: Header=BB91_1 Depth=1
add	x5, 1
	mov	r0, rsp
add	r0, 88
	mov	[r0], x5
	jmp	.LBB91_1
.LBB91_172:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 88
	mov	x1, [r1]
	mov	x5, x1
add	x5, 1
	mov	x9, -2147483638
	jz	r0, .LBB91_175
	jmp	.LBB91_173
.LBB91_173:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x5
	call	__bit_xor
	jge	rax, x2, .LBB91_175
	jmp	.LBB91_174
.LBB91_174:                             //   in Loop: Header=BB91_1 Depth=1
	add	x1, [rsp+80]
	mov	x2, [x1]
	mov	r1, 255
	mov	r0, x7
	call	__bit_and
	mov	r1, -256
	mov	x5, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, rsp
add	r0, 88
	mov	x1, [r0]
	mov	x5, x1
add	x5, 1
.LBB91_175:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 88
	mov	r1, -2147483648
	mov	[r0], x5
	mov	r0, x6
	call	__bit_xor
	mov	r1, 2147483646
	mov	x2, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -2147483647
	mov	x6, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483647
	sub	r1, x2
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x8
	call	__bit_and
	mov	x6, rax
	jz	x6, .LBB91_1
	jmp	.LBB91_176
.LBB91_176:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	jz	r0, .LBB91_178
	jmp	.LBB91_177
.LBB91_177:                             // %.preheader132.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x5
	jmp	.LBB91_180
.LBB91_178:                             //   in Loop: Header=BB91_1 Depth=1
add	x6, 1
	add	x1, x6
	mov	r0, rsp
add	r0, 88
	mov	[r0], x1
	jmp	.LBB91_1
.LBB91_179:                             //   in Loop: Header=BB91_180 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
add	x6, -1
	mov	x5, x2
.LBB91_180:                             // %.preheader132
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB91_183
	jmp	.LBB91_181
.LBB91_181:                             // %.preheader132
                                        //   in Loop: Header=BB91_180 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x7, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x7, .LBB91_183
	jmp	.LBB91_182
.LBB91_182:                             //   in Loop: Header=BB91_180 Depth=2
	add	x5, [rsp+80]
	mov	r0, [x5]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x5], rax
	mov	r0, rsp
add	r0, 88
	mov	x2, 1
	add	x2, [r0]
.LBB91_183:                             //   in Loop: Header=BB91_180 Depth=2
	mov	r0, rsp
add	r0, 88
	mov	[r0], x2
	jg	x6, x3, .LBB91_179
	jmp	.LBB91_1
.LBB91_184:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x14, [r0]
add	r0, 8
	mov	[rsp+92], r0
	mov	x15, [r1]
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	r1, 128
	mov	r0, rax
	call	__bit_xor
	mov	x8, rax
	mov	r1, 255
add	x8, -128
	mov	r0, x9
	call	__bit_and
	mov	r1, 32
	mov	x2, rax
	mov	r0, x2
	call	__bit_or
	mov	r0, 91
	jl	x8, r0, .LBB91_186
	jmp	.LBB91_185
.LBB91_185:                             //   in Loop: Header=BB91_1 Depth=1
	mov	rax, x2
.LBB91_186:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, -1
	mov	x0, 9
	jg	x15, r0, .LBB91_188
	jmp	.LBB91_187
.LBB91_187:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, -2147483648
	mov	r0, x15
	mov	x1, rax
	call	__bit_xor
	mov	x15, rax
	mov	rax, x1
	mov	x7, 45
	mov	x8, 0
	mov	r1, -1
	jmp	.LBB91_191
.LBB91_188:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x7, 43
	mov	x8, 0
	mov	r1, -1
	jnz	x13, .LBB91_191
	jmp	.LBB91_189
.LBB91_189:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 0
	mov	x8, 1
	mov	x7, 0
	jz	x1, .LBB91_191
	jmp	.LBB91_190
.LBB91_190:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x7, 32
	mov	x8, 0
	mov	r1, -1
.LBB91_191:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 101
	mov	[rsp+64], x7
	mov	[rsp+72], x8
	je	rax, r0, .LBB91_233
	jmp	.LBB91_192
.LBB91_192:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 103
	je	rax, r0, .LBB91_271
	jmp	.LBB91_193
.LBB91_193:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x11, 0
	mov	x13, mcasm_static_15400d789abfe0b4765dc732902f6f37
	mov	r0, 102
	jne	rax, r0, .LBB91_438
	jmp	.LBB91_194
.LBB91_194:                             //   in Loop: Header=BB91_1 Depth=1
	mov	[rsp+68], r1
	mov	r0, x12
	call	__bit_not
	mov	r1, 9
	mov	r0, rax
	call	__bit_and
	mov	r1, 9
	mov	x2, rax
	mov	r0, x12
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	x11, x12
add	x11, -9
	mov	r0, rax
	mov	r1, x11
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x11
	call	__bit_and
	mov	x13, 6
	mov	r0, 0
	jl	x12, r0, .LBB91_196
	jmp	.LBB91_195
.LBB91_195:                             //   in Loop: Header=BB91_1 Depth=1
add	rax, 9
	mov	x13, rax
.LBB91_196:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, x14
	mov	r1, x15
	mov	r2, x14
	mov	r3, x15
	call	__unorddf2
	jz	rax, .LBB91_198
	jmp	.LBB91_197
.LBB91_197:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	x2, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, 91
	mov	r0, rax
	call	__bit_and
	mov	r1, 91
	mov	x9, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x2, -91
	mov	r0, rax
	mov	r1, x2
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, [rsp+20]
	call	__bit_and
	mov	x10, rax
	mov	r0, mcasm_static_d6be6aa1de7347d31fe38817b7c46b0b
	add	x10, r0
	jmp	.LBB91_200
.LBB91_198:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r2, -1
	mov	r3, 2146435071
	mov	r0, x14
	mov	r1, x15
	call	__gtdf2
	jl	rax, x3, .LBB91_210
	jmp	.LBB91_199
.LBB91_199:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	x2, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, 91
	mov	r0, rax
	call	__bit_and
	mov	r1, 91
	mov	x9, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x2, -91
	mov	r0, rax
	mov	r1, x2
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, [rsp+40]
	call	__bit_and
	mov	x10, rax
	mov	r0, mcasm_static_b9e802fbaf641deea9821b02daddc0fb
	add	x10, r0
.LBB91_200:                             // %memcpy.exit
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [x10]
	mov	x1, x10
	mov	r1, 255
add	x1, 1
	call	__bit_and
	mov	r0, [rsp+96]
	mov	r1, -256
	mov	x9, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x9
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, [x1]
	mov	[rsp+96], rax
	mov	x1, x10
	mov	r1, 255
add	x1, 2
	call	__bit_and
	mov	x7, rsp
add	x7, 97
	mov	r0, [x7]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x11, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x11
	mov	r1, rax
	call	__bit_or
	mov	r0, [x1]
	mov	[x7], rax
	mov	r1, 255
add	x10, 3
	call	__bit_and
	mov	x1, rsp
add	x1, 98
	mov	r0, [x1]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x11, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x11
	mov	r1, rax
	call	__bit_or
	mov	r0, [x10]
	mov	r1, 255
	mov	[x1], rax
	call	__bit_and
	mov	x1, rsp
add	x1, 99
	mov	r0, [x1]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x10, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	mov	x1, rsp
add	x1, 96
	mov	r0, [rsp+48]
	jz	r0, .LBB91_205
	jmp	.LBB91_201
.LBB91_201:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	x11, rsp
add	x11, 96
	mov	r0, x9
	call	__bit_and
	jz	rax, .LBB91_209
	jmp	.LBB91_202
.LBB91_202:                             // %.preheader1.i.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x11, rsp
add	x11, 96
	mov	x1, [rsp+44]
	jmp	.LBB91_204
.LBB91_203:                             //   in Loop: Header=BB91_204 Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB91_209
	jmp	.LBB91_204
.LBB91_204:                             // %.preheader1.i
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x11, 1
	mov	r1, 3
	mov	r0, x11
	call	__bit_and
	jnz	rax, .LBB91_203
	jmp	.LBB91_205
.LBB91_205:                             // %.loopexit.i.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x1
add	x2, -4
add	x1, -1
	mov	x0, -2139062144
.LBB91_206:                             // %.loopexit.i
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 4
	mov	r1, [x2]
	mov	r0, 16843008
	sub	r0, r1
	mov	x11, x1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x1, 4
	je	rax, x0, .LBB91_206
	jmp	.LBB91_207
.LBB91_207:                             // %.preheader.i.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x1, 0
.LBB91_208:                             // %.preheader.i
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x11, 1
add	x1, 1
	jnz	rax, .LBB91_208
	jmp	.LBB91_209
.LBB91_209:                             // %strlen.exit
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 96
	sub	x11, r0
	jmp	.LBB91_232
.LBB91_210:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, x14
	mov	r1, x15
	call	__fixdfsi
	mov	x2, rax
	mov	r0, x2
	call	__floatsidf
	mov	r3, t0
	mov	r0, x14
	mov	r1, x15
	mov	r2, rax
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	x9, rax
	mov	r0, x9
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x11, rax
	mov	r0, x9
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x9, -2147483648
	mov	r0, rax
	mov	r1, x9
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
	mov	r0, rax
	call	__bit_not
	mov	x9, rax
	add	x9, x2
add	x9, 1
	mov	r0, x9
	call	__floatsidf
	mov	r3, t0
	mov	r0, x14
	mov	r1, x15
	mov	r2, rax
	call	__subdf3
	mov	x11, rax
	mov	x12, t0
	mov	r2, 0
	mov	r3, 0
	mov	x1, 0
	mov	r0, x11
	mov	r1, x12
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x2
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x14, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x14
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	x2, rax
add	x2, 1
	mov	r1, 0
	sub	r1, x12
	mov	r0, x2
	call	__bit_and
	mov	x14, rax
	mov	r1, 0
	sub	r1, x11
	add	x14, x12
	mov	r0, x2
	call	__bit_and
	add	rax, x11
	mov	x8, x13
add	x8, 1
.LBB91_211:                             //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r2, 0
	mov	r3, 1076101120
	mov	r0, rax
	mov	r1, x14
	call	__muldf3
	mov	x11, rax
	mov	x12, t0
	mov	r0, x11
	mov	r1, x12
	call	__fixdfsi
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483639
	mov	x14, rax
	mov	r0, x14
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x14
add	r1, 2147483639
	mov	r0, rax
	call	__bit_and
	mov	x15, rax
	mov	r0, x14
	call	__bit_not
	mov	r1, -2147483639
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x15
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
add	x2, -9
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	x2, rax
	mov	x7, rsp
add	x7, 352
	add	x7, x1
	mov	x14, [x7]
add	rax, 57
	mov	r1, 255
add	x2, 9
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x15, rax
	mov	r0, x14
	call	__bit_and
	mov	r1, 255
	mov	x14, rax
	mov	r0, x15
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x14
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mov	r0, x2
	call	__floatsidf
	mov	r3, t0
	mov	r0, x11
	mov	r1, x12
	mov	r2, rax
	call	__subdf3
	mov	r2, 0
	mov	r3, 0
	mov	x11, rax
	mov	x2, t0
	mov	r0, x11
	mov	r1, x2
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x12, rax
	mov	r0, x12
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x12
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x14, rax
	mov	r0, x12
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x14
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	x12, rax
add	x12, 1
	mov	r1, 0
	sub	r1, x2
	mov	r0, x12
	call	__bit_and
	mov	x14, rax
	mov	r1, 0
	sub	r1, x11
	add	x14, x2
	mov	r0, x12
	call	__bit_and
add	x1, 1
	add	rax, x11
	jne	x8, x1, .LBB91_211
	jmp	.LBB91_212
.LBB91_212:                             //   in Loop: Header=BB91_1 Depth=1
	jz	x13, .LBB91_219
	jmp	.LBB91_213
.LBB91_213:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 352
	add	r0, x13
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r1, 24
	mov	r0, rax
	call	__bit_sar
	mov	x0, [rsp+28]
	mov	x8, mcasm_static_ccbdd611d38f580638dd57066fcc265d
	mov	r0, 53
	jl	rax, r0, .LBB91_220
	jmp	.LBB91_214
.LBB91_214:                             // %.preheader145.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x13
	mov	x7, 57
.LBB91_215:                             // %.preheader145
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x1, x0
	add	x1, x2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	jne	rax, x7, .LBB91_217
	jmp	.LBB91_216
.LBB91_216:                             //   in Loop: Header=BB91_215 Depth=2
	mov	r0, [x1]
	mov	r1, -256
add	x2, -1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r0, x2
add	r0, 1
	mov	[x1], rax
	jg	r0, x3, .LBB91_215
	jmp	.LBB91_218
.LBB91_217:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x2, [x1]
add	rax, 1
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x11, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x11
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	jmp	.LBB91_220
.LBB91_218:                             //   in Loop: Header=BB91_1 Depth=1
add	x9, 1
	jmp	.LBB91_220
.LBB91_219:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+352]
	mov	r1, 255
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r1, 24
	mov	r0, rax
	call	__bit_sar
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, 2147483595
	mov	x2, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -2147483596
	mov	x11, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483596
	sub	r1, x2
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
	call	__bit_and
	add	x9, rax
	mov	x8, mcasm_static_ccbdd611d38f580638dd57066fcc265d
.LBB91_220:                             //   in Loop: Header=BB91_1 Depth=1
	jz	x9, .LBB91_222
	jmp	.LBB91_221
.LBB91_221:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x1, 0
	mov	x15, 0
	mov	x11, 0
	jmp	.LBB91_223
.LBB91_222:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+416]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[rsp+416], rax
	mov	x11, 1
	jmp	.LBB91_224
.LBB91_223:                             //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r2, 10
	mov	r3, 0
	mov	r0, x9
	mov	r1, x15
	call	__udivdi3
	mov	r2, -10
	mov	r3, 0
	mov	x12, rax
	mov	x14, t0
	mov	r0, x12
	mov	r1, x14
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x9
	mov	r3, x15
	call	__adddi3
	add	rax, x8
	mov	r0, [rax]
	mov	r1, 255
	call	__bit_and
	mov	x7, rsp
add	x7, 416
	add	x7, x1
	mov	r0, [x7]
	mov	x2, rax
	mov	r1, -256
add	x11, 1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[x7], rax
	mov	r0, x15
	call	__bit_xor
	mov	r1, 2147483647
	mov	x1, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483648
	sub	r1, x1
	mov	r0, rax
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -10
	mov	x2, rax
	mov	r0, x9
	call	__bit_and
	mov	r1, 9
	mov	x1, rax
	mov	r0, x9
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, 9
	sub	r1, x9
	mov	r0, rax
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
	sub	x1, x2
	mov	r0, x15
	call	__bit_not
add	rax, 1
	mov	r0, x15
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
	add	rax, x2
	mov	x1, x11
	mov	x9, x12
	mov	x15, x14
	jnz	rax, .LBB91_223
	jmp	.LBB91_224
.LBB91_224:                             // %.loopexit144
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x8, 0
	mov	x7, [rsp+36]
.LBB91_225:                             //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x7
	add	r0, x11
	mov	r0, [r0]
	mov	r1, 255
	mov	x1, x8
	call	__bit_and
	mov	x9, rsp
add	x9, 96
	add	x9, x1
	mov	r0, [x9]
	mov	x1, rax
	mov	r1, -256
add	x8, 1
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x9], rax
add	x7, -1
	jne	x11, x8, .LBB91_225
	jmp	.LBB91_226
.LBB91_226:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, x13
	mov	r1, x10
	call	__bit_or
	jz	rax, .LBB91_228
	jmp	.LBB91_227
.LBB91_227:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x1, rsp
add	x1, 96
	add	x1, x11
	mov	r0, [x1]
	mov	r1, -256
add	x8, 1
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x11, x8
.LBB91_228:                             //   in Loop: Header=BB91_1 Depth=1
	jz	x13, .LBB91_231
	jmp	.LBB91_229
.LBB91_229:                             // %.preheader142.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x8, rsp
add	x8, 352
	mov	x1, x11
.LBB91_230:                             // %.preheader142
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x8]
	mov	r1, 255
	call	__bit_and
	mov	x7, rsp
add	x7, 96
	add	x7, x1
	mov	r0, [x7]
	mov	x1, rax
	mov	r1, -256
add	x11, 1
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
add	x13, -1
add	x8, 1
	mov	x1, x11
	jnz	x13, .LBB91_230
	jmp	.LBB91_231
.LBB91_231:                             // %.loopexit143
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x1, rsp
add	x1, 96
	add	x1, x11
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
.LBB91_232:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x13, rsp
add	x13, 96
	mov	r1, [rsp+68]
	jmp	.LBB91_438
.LBB91_233:                             //   in Loop: Header=BB91_1 Depth=1
	mov	[rsp+68], r1
	mov	x13, 6
	mov	r0, 0
	jl	x12, r0, .LBB91_235
	jmp	.LBB91_234
.LBB91_234:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x13, x12
.LBB91_235:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, x14
	mov	r1, x15
	mov	r2, x14
	mov	r3, x15
	call	__unorddf2
	jz	rax, .LBB91_237
	jmp	.LBB91_236
.LBB91_236:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, 91
	mov	r0, rax
	call	__bit_and
	mov	r1, 91
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -91
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, [rsp+20]
	call	__bit_and
	mov	x10, rax
	mov	r0, mcasm_static_d6be6aa1de7347d31fe38817b7c46b0b
	add	x10, r0
	jmp	.LBB91_239
.LBB91_237:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r2, -1
	mov	r3, 2146435071
	mov	r0, x14
	mov	r1, x15
	call	__gtdf2
	jl	rax, x3, .LBB91_249
	jmp	.LBB91_238
.LBB91_238:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, 91
	mov	r0, rax
	call	__bit_and
	mov	r1, 91
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -91
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, [rsp+40]
	call	__bit_and
	mov	x10, rax
	mov	r0, mcasm_static_b9e802fbaf641deea9821b02daddc0fb
	add	x10, r0
.LBB91_239:                             // %memcpy.exit76
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [x10]
	mov	x2, x10
	mov	r1, 255
add	x2, 1
	call	__bit_and
	mov	r0, [rsp+96]
	mov	r1, -256
	mov	x9, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x9
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r0, [x2]
	mov	[rsp+96], rax
	mov	x7, x10
	mov	r1, 255
add	x7, 2
	call	__bit_and
	mov	x8, rsp
add	x8, 97
	mov	r0, [x8]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, [x7]
	mov	[x8], rax
	mov	r1, 255
add	x10, 3
	call	__bit_and
	mov	x7, rsp
add	x7, 98
	mov	r0, [x7]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, [x10]
	mov	r1, 255
	mov	[x7], rax
	call	__bit_and
	mov	x7, rsp
add	x7, 99
	mov	r0, [x7]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mov	x1, rsp
add	x1, 96
	mov	r0, [rsp+48]
	jz	r0, .LBB91_244
	jmp	.LBB91_240
.LBB91_240:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	x11, rsp
add	x11, 96
	mov	r0, x9
	call	__bit_and
	jz	rax, .LBB91_248
	jmp	.LBB91_241
.LBB91_241:                             // %.preheader1.i77.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x11, rsp
add	x11, 96
	mov	x1, [rsp+44]
	jmp	.LBB91_243
.LBB91_242:                             //   in Loop: Header=BB91_243 Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB91_248
	jmp	.LBB91_243
.LBB91_243:                             // %.preheader1.i77
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x11, 1
	mov	r1, 3
	mov	r0, x11
	call	__bit_and
	jnz	rax, .LBB91_242
	jmp	.LBB91_244
.LBB91_244:                             // %.loopexit.i78.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x1
add	x2, -4
add	x1, -1
	mov	x0, -2139062144
.LBB91_245:                             // %.loopexit.i78
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 4
	mov	r1, [x2]
	mov	r0, 16843008
	sub	r0, r1
	mov	x11, x1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x1, 4
	je	rax, x0, .LBB91_245
	jmp	.LBB91_246
.LBB91_246:                             // %.preheader.i79.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x1, 0
.LBB91_247:                             // %.preheader.i79
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x11, 1
add	x1, 1
	jnz	rax, .LBB91_247
	jmp	.LBB91_248
.LBB91_248:                             // %strlen.exit80
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 96
	sub	x11, r0
	jmp	.LBB91_270
.LBB91_249:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r2, x13
add	r2, 1
	mov	r3, rsp
add	r3, 416
	mov	r4, rsp
add	r4, 352
	mov	r0, x14
	mov	r1, x15
	call	extract_sig_digits
	mov	r0, [rsp+416]
	mov	r1, 255
	call	__bit_and
	mov	r0, [rsp+96]
	mov	r1, -256
	mov	x12, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x12
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[rsp+96], rax
	mov	r0, x13
	mov	r1, x10
	call	__bit_or
	mov	x11, 1
	jz	rax, .LBB91_254
	jmp	.LBB91_250
.LBB91_250:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x1, rsp
add	x1, 97
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x11, 2
	jz	x13, .LBB91_254
	jmp	.LBB91_251
.LBB91_251:                             // %.preheader149.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x11, 0
	mov	x8, [rsp+24]
	mov	x0, [rsp+60]
.LBB91_252:                             // %.preheader149
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x0
	add	r0, x11
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x7, x8
	add	x7, x11
	mov	r0, [x7]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
add	x11, 1
	mov	[x7], rax
	jne	x13, x11, .LBB91_252
	jmp	.LBB91_253
.LBB91_253:                             // %.loopexit150.loopexit
                                        //   in Loop: Header=BB91_1 Depth=1
add	x11, 2
	mov	x0, 9
.LBB91_254:                             // %.loopexit150
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, 91
	mov	r0, rax
	call	__bit_and
	mov	r1, 91
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -91
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x8, rsp
add	x8, 96
	add	x8, x11
	mov	x1, [x8]
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, -32
	mov	r0, rax
	call	__bit_and
	mov	x2, rax
	mov	r1, -256
add	x2, 101
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	x10, [rsp+352]
	mov	r1, -2147483648
	mov	[x8], rax
	mov	r0, x10
	call	__bit_xor
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -2147483648
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 2
	mov	r0, rax
	call	__bit_and
	mov	r0, -1
	jg	x10, r0, .LBB91_256
	jmp	.LBB91_255
.LBB91_255:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 0
	sub	r0, x10
	mov	x10, r0
.LBB91_256:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x7, x8
add	x7, 1
	mov	x1, [x7]
add	rax, 43
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mov	x15, x11
add	x15, 2
	mov	r0, 100
	jl	x10, r0, .LBB91_262
	jmp	.LBB91_257
.LBB91_257:                             // %.preheader148.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x8, [rsp+44]
	add	x8, x11
.LBB91_258:                             // %.preheader148
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 10
	mov	x1, x10
	mov	x13, x8
	mov	r0, x1
	call	__udivsi3
	mov	x10, rax
	mov	r0, x10
	mul	r0, 246
	add	r0, x1
	mov	r1, 48
	call	__bit_or
	mov	x7, rsp
add	x7, 96
	add	x7, x11
add	x7, 2
	mov	x2, [x7]
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x14, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x14
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
add	x11, 1
add	x8, 1
	jg	x1, x0, .LBB91_258
	jmp	.LBB91_259
.LBB91_259:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, x11
add	r0, 1
add	x11, 2
	jge	x15, r0, .LBB91_264
	jmp	.LBB91_260
.LBB91_260:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x7, rsp
add	x7, 96
	add	x7, x15
	mov	x10, x7
	mov	x8, x13
.LBB91_261:                             //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x1, [x7]
	mov	x14, x13
	mov	r1, 255
add	x14, 1
	mov	r0, x1
	call	__bit_and
	mov	r0, [x14]
	mov	r1, 255
	mov	x2, rax
	call	__bit_and
	mov	x12, rax
	mov	r1, -256
add	x10, 1
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x12
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mov	r0, [x14]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x14], rax
	mov	r1, -2147483648
add	x8, -1
	mov	r0, x13
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x10
	call	__bit_xor
	mov	x13, x8
	mov	x7, x10
	jl	rax, x1, .LBB91_261
	jmp	.LBB91_263
.LBB91_262:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, x10
	mul	r0, 205
	mov	r1, 11
	call	__bit_shr
	mov	r1, 31
	mov	r0, rax
	call	__bit_and
	mov	r1, 48
	mov	x1, rax
	mov	r0, x1
	call	__bit_or
	mov	x7, rsp
add	x7, 96
	add	x7, x15
	mov	r0, [x7]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x13, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x13
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mul	x1, -10
	add	x1, x10
add	x8, 3
	mov	x2, [x8]
add	x1, 48
	mov	r1, 255
add	x11, 4
	mov	r0, x1
	call	__bit_and
	mov	r1, -256
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x8], rax
	jmp	.LBB91_264
.LBB91_263:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+96]
	mov	r1, 255
	call	__bit_and
	mov	x12, rax
.LBB91_264:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	x2, rsp
add	x2, 96
	add	x2, x11
	mov	r0, [x2]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[x2], rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483558
	mov	x0, -2147483623
	jg	rax, r0, .LBB91_270
	jmp	.LBB91_265
.LBB91_265:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x12
	call	__bit_and
	jz	rax, .LBB91_270
	jmp	.LBB91_266
.LBB91_266:                             // %.preheader146.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x8, [rsp+44]
.LBB91_267:                             // %.preheader146
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x12
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, x0, .LBB91_269
	jmp	.LBB91_268
.LBB91_268:                             //   in Loop: Header=BB91_267 Depth=2
	mov	x7, x8
add	x7, -1
	mov	x1, [x7]
add	x12, -32
	mov	r1, 255
	mov	r0, x12
	call	__bit_and
	mov	r1, -256
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
.LBB91_269:                             //   in Loop: Header=BB91_267 Depth=2
	mov	r0, [x8]
	mov	r1, 255
	call	__bit_and
	mov	x12, rax
add	x8, 1
	jnz	x12, .LBB91_267
	jmp	.LBB91_270
.LBB91_270:                             // %.loopexit147
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x13, rsp
add	x13, 96
	mov	r1, [rsp+68]
	jmp	.LBB91_438
.LBB91_271:                             //   in Loop: Header=BB91_1 Depth=1
	mov	[rsp+68], r1
	mov	r1, -2
	mov	r0, x12
	call	__bit_and
	mov	r1, 1
	mov	x1, rax
	mov	r0, x12
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, 1
	sub	r1, x12
	mov	r0, rax
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, x12
add	r1, -1
	mov	r0, rax
	call	__bit_and
	mov	x13, 6
	mov	r0, 0
	jl	x12, r0, .LBB91_273
	jmp	.LBB91_272
.LBB91_272:                             //   in Loop: Header=BB91_1 Depth=1
add	rax, 1
	mov	x13, rax
.LBB91_273:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, x14
	mov	r1, x15
	mov	r2, x14
	mov	r3, x15
	call	__unorddf2
	jz	rax, .LBB91_275
	jmp	.LBB91_274
.LBB91_274:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, 91
	mov	r0, rax
	call	__bit_and
	mov	r1, 91
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -91
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, [rsp+20]
	call	__bit_and
	mov	x9, rax
	mov	r0, mcasm_static_d6be6aa1de7347d31fe38817b7c46b0b
	add	x9, r0
	jmp	.LBB91_277
.LBB91_275:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r2, -1
	mov	r3, 2146435071
	mov	r0, x14
	mov	r1, x15
	call	__gtdf2
	jl	rax, x3, .LBB91_278
	jmp	.LBB91_276
.LBB91_276:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, 91
	mov	r0, rax
	call	__bit_and
	mov	r1, 91
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -91
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, [rsp+40]
	call	__bit_and
	mov	x9, rax
	mov	r0, mcasm_static_b9e802fbaf641deea9821b02daddc0fb
	add	x9, r0
.LBB91_277:                             // %memcpy.exit82.loopexit
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [x9]
	mov	x7, x9
	mov	r1, 255
add	x7, 1
	call	__bit_and
	mov	r0, [rsp+96]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, [x7]
	mov	[rsp+96], rax
	mov	x7, x9
	mov	r1, 255
add	x7, 2
	call	__bit_and
	mov	x8, rsp
add	x8, 97
	mov	r0, [x8]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, [x7]
	mov	[x8], rax
	mov	r1, 255
add	x9, 3
	call	__bit_and
	mov	x7, rsp
add	x7, 98
	mov	r0, [x7]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, [x9]
	mov	r1, 255
	mov	[x7], rax
	call	__bit_and
	mov	x7, rsp
add	x7, 99
	mov	r0, [x7]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mov	x0, -2139062144
	jmp	.LBB91_428
.LBB91_278:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r3, rsp
add	r3, 416
	mov	r4, rsp
add	r4, 352
	mov	r0, x14
	mov	r1, x15
	mov	r2, x13
	call	extract_sig_digits
	mov	x15, x13
	jnz	x10, .LBB91_283
	jmp	.LBB91_279
.LBB91_279:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x15, x13
	mov	r0, 2
	jl	x13, r0, .LBB91_283
	jmp	.LBB91_280
.LBB91_280:                             // %.preheader181.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r0, x13
.LBB91_281:                             // %.preheader181
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x1, r0
	mov	r0, [rsp+52]
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x15, x1
	mov	r0, 48
	jne	rax, r0, .LBB91_283
	jmp	.LBB91_282
.LBB91_282:                             //   in Loop: Header=BB91_281 Depth=2
	mov	r0, x1
add	r0, -1
	mov	x15, 1
	mov	r1, 2
	jg	x1, r1, .LBB91_281
	jmp	.LBB91_283
.LBB91_283:                             // %.loopexit182
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x11, [rsp+352]
	mov	r0, -4
	jl	x11, r0, .LBB91_285
	jmp	.LBB91_284
.LBB91_284:                             // %.loopexit182
                                        //   in Loop: Header=BB91_1 Depth=1
	jl	x11, x13, .LBB91_304
	jmp	.LBB91_285
.LBB91_285:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+416]
	mov	r1, 255
	call	__bit_and
	mov	r0, [rsp+96]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[rsp+96], rax
	jnz	x10, .LBB91_287
	jmp	.LBB91_286
.LBB91_286:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x14, 1
	mov	r0, 2
	jl	x15, r0, .LBB91_295
	jmp	.LBB91_287
.LBB91_287:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x1, rsp
add	x1, 97
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x8, 2
	mov	r0, 1
	jl	x15, x8, .LBB91_291
	jmp	.LBB91_288
.LBB91_288:                             // %.preheader179.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x7, x15
add	x7, -1
	mov	x8, 0
	mov	x14, [rsp+24]
	mov	x0, [rsp+56]
.LBB91_289:                             // %.preheader179
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x0
	add	r0, x8
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x12, x14
	add	x12, x8
	mov	r0, [x12]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
add	x8, 1
	mov	[x12], rax
	jne	x7, x8, .LBB91_289
	jmp	.LBB91_290
.LBB91_290:                             // %.loopexit180.loopexit
                                        //   in Loop: Header=BB91_1 Depth=1
add	x8, 2
	mov	r0, x15
	mov	x0, 9
.LBB91_291:                             // %.loopexit180
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x14, x8
	jz	x10, .LBB91_295
	jmp	.LBB91_292
.LBB91_292:                             // %.loopexit180
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x14, x8
	jle	x13, r0, .LBB91_295
	jmp	.LBB91_293
.LBB91_293:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x14, x8
	add	x14, x13
	sub	x14, r0
	mov	x1, rsp
add	x1, 96
	add	x1, x8
	sub	x13, r0
.LBB91_294:                             //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
add	x13, -1
add	x1, 1
	jnz	x13, .LBB91_294
	jmp	.LBB91_295
.LBB91_295:                             // %.loopexit178
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, 91
	mov	r0, rax
	call	__bit_and
	mov	r1, 91
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -91
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x8, rsp
add	x8, 96
	add	x8, x14
	mov	x1, [x8]
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, -32
	mov	r0, rax
	call	__bit_and
	mov	x2, rax
	mov	r1, -256
add	x2, 101
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[x8], rax
	mov	r0, x11
	call	__bit_xor
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -2147483648
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 2
	mov	r0, rax
	call	__bit_and
	mov	r0, -1
	jg	x11, r0, .LBB91_297
	jmp	.LBB91_296
.LBB91_296:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 0
	sub	r0, x11
	mov	x11, r0
.LBB91_297:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x7, x8
add	x7, 1
	mov	x1, [x7]
add	rax, 43
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mov	x15, x14
add	x15, 2
	mov	r0, 100
	jl	x11, r0, .LBB91_303
	jmp	.LBB91_298
.LBB91_298:                             // %.preheader177.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x8, [rsp+44]
	add	x8, x14
.LBB91_299:                             // %.preheader177
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 10
	mov	x1, x11
	mov	x12, x8
	mov	r0, x1
	call	__udivsi3
	mov	x11, rax
	mov	r0, x11
	mul	r0, 246
	add	r0, x1
	mov	r1, 48
	call	__bit_or
	mov	x7, rsp
add	x7, 96
	add	x7, x14
add	x7, 2
	mov	x2, [x7]
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x13, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x13
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
add	x14, 1
add	x8, 1
	jg	x1, x0, .LBB91_299
	jmp	.LBB91_300
.LBB91_300:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, x14
add	r0, 1
add	x14, 2
	jge	x15, r0, .LBB91_334
	jmp	.LBB91_301
.LBB91_301:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x7, rsp
add	x7, 96
	add	x7, x15
	mov	x11, x7
	mov	x8, x12
.LBB91_302:                             //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x1, [x7]
	mov	x15, x12
	mov	r1, 255
add	x15, 1
	mov	r0, x1
	call	__bit_and
	mov	r0, [x15]
	mov	r1, 255
	mov	x2, rax
	call	__bit_and
	mov	x13, rax
	mov	r1, -256
add	x11, 1
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x13
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mov	r0, [x15]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x15], rax
	mov	r1, -2147483648
add	x8, -1
	mov	r0, x12
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x11
	call	__bit_xor
	mov	x12, x8
	mov	x7, x11
	jl	rax, x1, .LBB91_302
	jmp	.LBB91_334
.LBB91_303:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, x11
	mul	r0, 205
	mov	r1, 11
	call	__bit_shr
	mov	r1, 31
	mov	r0, rax
	call	__bit_and
	mov	r1, 48
	mov	x1, rax
	mov	r0, x1
	call	__bit_or
	mov	x7, rsp
add	x7, 96
	add	x7, x15
	mov	r0, [x7]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x12, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x12
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mul	x1, -10
	add	x1, x11
add	x8, 3
	mov	x2, [x8]
add	x1, 48
	mov	r1, 255
add	x14, 4
	mov	r0, x1
	call	__bit_and
	mov	r1, -256
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x8], rax
	jmp	.LBB91_334
.LBB91_304:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 0
	jl	x11, r0, .LBB91_319
	jmp	.LBB91_305
.LBB91_305:                             // %.preheader171.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x8, x11
add	x8, 1
	mov	x12, 0
.LBB91_306:                             // %.preheader171
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, 48
	jge	x12, x15, .LBB91_308
	jmp	.LBB91_307
.LBB91_307:                             //   in Loop: Header=BB91_306 Depth=2
	mov	r0, rsp
add	r0, 416
	add	r0, x12
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
.LBB91_308:                             //   in Loop: Header=BB91_306 Depth=2
	mov	x7, rsp
add	x7, 96
	add	x7, x12
	mov	x1, [x7]
	mov	r1, 255
	call	__bit_and
	mov	r1, -256
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
add	x12, 1
	mov	[x7], rax
	jne	x8, x12, .LBB91_306
	jmp	.LBB91_309
.LBB91_309:                             //   in Loop: Header=BB91_1 Depth=1
	jnz	x10, .LBB91_311
	jmp	.LBB91_310
.LBB91_310:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x12, x8
	jle	x15, x8, .LBB91_332
	jmp	.LBB91_311
.LBB91_311:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x1, rsp
add	x1, 96
	add	x1, x8
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x12, x11
add	x12, 2
	jle	x15, x8, .LBB91_315
	jmp	.LBB91_312
.LBB91_312:                             // %.preheader169.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x7, x15
add	x7, -1
	mov	x12, [rsp+24]
	mov	x0, [rsp+56]
.LBB91_313:                             // %.preheader169
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x0
	add	r0, x11
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x8, x12
	add	x8, x11
	mov	r0, [x8]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
add	x11, 1
	mov	[x8], rax
	jne	x7, x11, .LBB91_313
	jmp	.LBB91_314
.LBB91_314:                             // %.loopexit170.loopexit
                                        //   in Loop: Header=BB91_1 Depth=1
add	x11, 2
	mov	x8, x15
	mov	x12, x11
.LBB91_315:                             // %.loopexit170
                                        //   in Loop: Header=BB91_1 Depth=1
	jz	x10, .LBB91_332
	jmp	.LBB91_316
.LBB91_316:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x1, x12
	jle	x13, x8, .LBB91_333
	jmp	.LBB91_317
.LBB91_317:                             // %.preheader153.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	sub	x13, x8
	mov	x1, x12
.LBB91_318:                             // %.preheader153
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x2, rsp
add	x2, 96
	add	x2, x12
	mov	r0, [x2]
	mov	r1, -256
add	x1, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
add	x13, -1
	mov	[x2], rax
	mov	x12, x1
	jz	x13, .LBB91_333
	jmp	.LBB91_318
.LBB91_319:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+96]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[rsp+96], rax
	jnz	x10, .LBB91_321
	jmp	.LBB91_320
.LBB91_320:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x2, 1
	jl	x15, x3, .LBB91_322
	jmp	.LBB91_321
.LBB91_321:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x1, rsp
add	x1, 97
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x2, 2
.LBB91_322:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x12, x2
	mov	r0, -1
	je	x11, r0, .LBB91_324
	jmp	.LBB91_323
.LBB91_323:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, x11
	call	__bit_not
	mov	x12, rax
	add	x12, x2
	mov	x1, rsp
add	x1, 96
	add	x1, x2
add	x11, 1
	jmp	.LBB91_326
.LBB91_324:                             // %.loopexit175
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 0
	jl	x15, x3, .LBB91_328
	jmp	.LBB91_325
.LBB91_325:                             // %.preheader173.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x8, rsp
add	x8, 416
	mov	x7, x15
	mov	x1, x12
	jmp	.LBB91_327
.LBB91_326:                             //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
add	x11, 1
add	x1, 1
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
	jnz	rax, .LBB91_324
	jmp	.LBB91_326
.LBB91_327:                             // %.preheader173
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x8]
	mov	r1, 255
	call	__bit_and
	mov	x11, rsp
add	x11, 96
	add	x11, x1
	mov	r0, [x11]
	mov	x1, rax
	mov	r1, -256
add	x12, 1
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x11], rax
add	x7, -1
add	x8, 1
	mov	x1, x12
	mov	r0, x15
	jnz	x7, .LBB91_327
	jmp	.LBB91_328
.LBB91_328:                             // %.loopexit174
                                        //   in Loop: Header=BB91_1 Depth=1
	jz	x10, .LBB91_332
	jmp	.LBB91_329
.LBB91_329:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x1, x12
	jle	x13, r0, .LBB91_333
	jmp	.LBB91_330
.LBB91_330:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x1, x12
	add	x1, x13
	sub	x1, r0
	mov	x2, rsp
add	x2, 96
	add	x2, x12
	sub	x13, r0
.LBB91_331:                             //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
add	x13, -1
add	x2, 1
	jz	x13, .LBB91_333
	jmp	.LBB91_331
.LBB91_332:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x1, rsp
add	x1, 96
	add	x1, x12
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	jmp	.LBB91_335
.LBB91_333:                             // %.loopexit154
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, rsp
add	x2, 96
	add	x2, x1
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	jmp	.LBB91_422
.LBB91_334:                             // %.loopexit176
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x1, rsp
add	x1, 96
	add	x1, x14
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	jnz	x10, .LBB91_422
	jmp	.LBB91_335
.LBB91_335:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x10, rsp
add	x10, 96
	mov	r0, [rsp+48]
	mov	x7, 69
	jz	r0, .LBB91_337
	jmp	.LBB91_336
.LBB91_336:                             // %.preheader166.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x10, rsp
add	x10, 96
	mov	x1, [rsp+32]
	jmp	.LBB91_339
.LBB91_337:                             // %.loopexit9.i
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, [x10]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	x0, -2139062144
	jne	rax, x0, .LBB91_344
	jmp	.LBB91_338
.LBB91_338:                             // %.preheader5.i.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	jmp	.LBB91_342
.LBB91_339:                             // %.preheader166
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x10]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB91_347
	jmp	.LBB91_340
.LBB91_340:                             // %.preheader166
                                        //   in Loop: Header=BB91_339 Depth=2
	mov	r0, 101
	je	rax, r0, .LBB91_372
	jmp	.LBB91_341
.LBB91_341:                             //   in Loop: Header=BB91_339 Depth=2
add	x1, -1
add	x10, 1
	jz	x1, .LBB91_337
	jmp	.LBB91_339
.LBB91_342:                             // %.preheader5.i
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 1701143909
	mov	r0, x2
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x0, .LBB91_344
	jmp	.LBB91_343
.LBB91_343:                             //   in Loop: Header=BB91_342 Depth=2
add	x10, 4
	mov	x2, [x10]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x0, .LBB91_342
	jmp	.LBB91_344
.LBB91_344:                             // %.loopexit6.i.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
add	x10, -1
.LBB91_345:                             // %.loopexit6.i
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x10, 1
	mov	r0, [x10]
	mov	r1, 255
	call	__bit_and
	mov	r0, 101
	je	rax, r0, .LBB91_371
	jmp	.LBB91_346
.LBB91_346:                             // %.loopexit6.i
                                        //   in Loop: Header=BB91_345 Depth=2
	jnz	rax, .LBB91_345
	jmp	.LBB91_347
.LBB91_347:                             // %.loopexit164
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x10, rsp
add	x10, 96
	mov	r0, [rsp+48]
	jz	r0, .LBB91_349
	jmp	.LBB91_348
.LBB91_348:                             // %.preheader160.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x10, rsp
add	x10, 96
	mov	x1, [rsp+32]
	jmp	.LBB91_351
.LBB91_349:                             // %.loopexit9.i84
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, [x10]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	x0, -2139062144
	jne	rax, x0, .LBB91_356
	jmp	.LBB91_350
.LBB91_350:                             // %.preheader5.i87.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	jmp	.LBB91_354
.LBB91_351:                             // %.preheader160
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x10]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB91_359
	jmp	.LBB91_352
.LBB91_352:                             // %.preheader160
                                        //   in Loop: Header=BB91_351 Depth=2
	je	rax, x7, .LBB91_370
	jmp	.LBB91_353
.LBB91_353:                             //   in Loop: Header=BB91_351 Depth=2
add	x1, -1
add	x10, 1
	jz	x1, .LBB91_349
	jmp	.LBB91_351
.LBB91_354:                             // %.preheader5.i87
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 1162167621
	mov	r0, x2
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x0, .LBB91_356
	jmp	.LBB91_355
.LBB91_355:                             //   in Loop: Header=BB91_354 Depth=2
add	x10, 4
	mov	x2, [x10]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x0, .LBB91_354
	jmp	.LBB91_356
.LBB91_356:                             // %.loopexit6.i85.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
add	x10, -1
.LBB91_357:                             // %.loopexit6.i85
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x10, 1
	mov	r0, [x10]
	mov	r1, 255
	call	__bit_and
	je	rax, x7, .LBB91_369
	jmp	.LBB91_358
.LBB91_358:                             // %.loopexit6.i85
                                        //   in Loop: Header=BB91_357 Depth=2
	jnz	rax, .LBB91_357
	jmp	.LBB91_359
.LBB91_359:                             // %.loopexit158
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x1, rsp
add	x1, 96
	mov	r0, [rsp+48]
	jz	r0, .LBB91_364
	jmp	.LBB91_360
.LBB91_360:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x10, rsp
add	x10, 96
	mov	r0, [rsp+96]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB91_368
	jmp	.LBB91_361
.LBB91_361:                             // %.preheader1.i89.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x10, rsp
add	x10, 96
	mov	x1, [rsp+44]
	jmp	.LBB91_363
.LBB91_362:                             //   in Loop: Header=BB91_363 Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB91_368
	jmp	.LBB91_363
.LBB91_363:                             // %.preheader1.i89
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x10, 1
	mov	r1, 3
	mov	r0, x10
	call	__bit_and
	jnz	rax, .LBB91_362
	jmp	.LBB91_364
.LBB91_364:                             // %.loopexit.i90.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x1
add	x2, -4
add	x1, -1
	mov	x0, -2139062144
.LBB91_365:                             // %.loopexit.i90
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 4
	mov	r1, [x2]
	mov	r0, 16843008
	sub	r0, r1
	mov	x10, x1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x1, 4
	je	rax, x0, .LBB91_365
	jmp	.LBB91_366
.LBB91_366:                             // %.preheader.i91.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x1, 0
.LBB91_367:                             // %.preheader.i91
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x10, 1
add	x1, 1
	jnz	rax, .LBB91_367
	jmp	.LBB91_368
.LBB91_368:                             // %strlen.exit92
                                        //   in Loop: Header=BB91_1 Depth=1
	jmp	.LBB91_373
.LBB91_369:                             // %strchr.exit.loopexit
                                        //   in Loop: Header=BB91_1 Depth=1
	jmp	.LBB91_373
.LBB91_370:                             // %strchr.exit.loopexit16
                                        //   in Loop: Header=BB91_1 Depth=1
	jmp	.LBB91_373
.LBB91_371:                             // %strchr.exit.loopexit17
                                        //   in Loop: Header=BB91_1 Depth=1
	jmp	.LBB91_373
.LBB91_372:                             // %strchr.exit.loopexit19
                                        //   in Loop: Header=BB91_1 Depth=1
.LBB91_373:                             // %strchr.exit
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x11, rsp
add	x11, 96
	mov	r0, [rsp+48]
	jz	r0, .LBB91_375
	jmp	.LBB91_374
.LBB91_374:                             // %.preheader156.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x11, rsp
add	x11, 96
	mov	x1, [rsp+32]
	jmp	.LBB91_377
.LBB91_375:                             // %.loopexit9.i93
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, [x11]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	x0, -2139062144
	jne	rax, x0, .LBB91_382
	jmp	.LBB91_376
.LBB91_376:                             // %.preheader5.i96.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	jmp	.LBB91_380
.LBB91_377:                             // %.preheader156
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB91_422
	jmp	.LBB91_378
.LBB91_378:                             // %.preheader156
                                        //   in Loop: Header=BB91_377 Depth=2
	mov	r0, 46
	je	rax, r0, .LBB91_386
	jmp	.LBB91_379
.LBB91_379:                             //   in Loop: Header=BB91_377 Depth=2
add	x1, -1
add	x11, 1
	jz	x1, .LBB91_375
	jmp	.LBB91_377
.LBB91_380:                             // %.preheader5.i96
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 774778414
	mov	r0, x2
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x0, .LBB91_382
	jmp	.LBB91_381
.LBB91_381:                             //   in Loop: Header=BB91_380 Depth=2
add	x11, 4
	mov	x2, [x11]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x0, .LBB91_380
	jmp	.LBB91_382
.LBB91_382:                             // %.loopexit6.i94.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
add	x11, -1
.LBB91_383:                             // %.loopexit6.i94
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x11, 1
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	mov	r0, 46
	je	rax, r0, .LBB91_385
	jmp	.LBB91_384
.LBB91_384:                             // %.loopexit6.i94
                                        //   in Loop: Header=BB91_383 Depth=2
	jnz	rax, .LBB91_383
	jmp	.LBB91_385
.LBB91_385:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_xor
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
	mov	r0, rax
	mov	r1, x11
	call	__bit_and
	mov	x11, rax
	jmp	.LBB91_387
.LBB91_386:                             // %strchr.exit97.loopexit
                                        //   in Loop: Header=BB91_1 Depth=1
.LBB91_387:                             // %strchr.exit97
                                        //   in Loop: Header=BB91_1 Depth=1
	jz	x11, .LBB91_422
	jmp	.LBB91_388
.LBB91_388:                             // %strchr.exit97
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r1, -2147483648
	mov	r0, x10
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x11
	call	__bit_xor
	jge	rax, x1, .LBB91_422
	jmp	.LBB91_389
.LBB91_389:                             //   in Loop: Header=BB91_1 Depth=1
add	x11, 1
	mov	r0, 0
.LBB91_390:                             //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x8, r0
	mov	x12, x10
	mov	r1, -2147483648
	add	x12, x8
	mov	r0, x11
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x12
	call	__bit_xor
	jle	rax, x1, .LBB91_392
	jmp	.LBB91_391
.LBB91_391:                             //   in Loop: Header=BB91_390 Depth=2
	mov	r0, x12
add	r0, -1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, x8
add	r0, -1
	mov	r1, 48
	je	rax, r1, .LBB91_390
	jmp	.LBB91_392
.LBB91_392:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, x12
	mov	r1, x11
	call	__bit_xor
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
	mov	r1, 3
	mov	x13, rax
	mov	r0, x10
	call	__bit_and
	mov	x1, x10
	jz	rax, .LBB91_397
	jmp	.LBB91_393
.LBB91_393:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [x10]
	mov	r1, 255
	call	__bit_and
	mov	x14, x10
	jz	rax, .LBB91_401
	jmp	.LBB91_394
.LBB91_394:                             // %.preheader1.i98.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x1, x10
add	x1, 1
	mov	x14, x10
	jmp	.LBB91_396
.LBB91_395:                             //   in Loop: Header=BB91_396 Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB91_401
	jmp	.LBB91_396
.LBB91_396:                             // %.preheader1.i98
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x14, 1
	mov	r1, 3
	mov	r0, x14
	call	__bit_and
	jnz	rax, .LBB91_395
	jmp	.LBB91_397
.LBB91_397:                             // %.loopexit.i99.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x1
add	x2, -4
add	x1, -1
	mov	x0, -2139062144
.LBB91_398:                             // %.loopexit.i99
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 4
	mov	r1, [x2]
	mov	r0, 16843008
	sub	r0, r1
	mov	x14, x1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x1, 4
	je	rax, x0, .LBB91_398
	jmp	.LBB91_399
.LBB91_399:                             // %.preheader.i100.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x1, 0
.LBB91_400:                             // %.preheader.i100
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x14, 1
add	x1, 1
	jnz	rax, .LBB91_400
	jmp	.LBB91_401
.LBB91_401:                             // %strlen.exit101
                                        //   in Loop: Header=BB91_1 Depth=1
add	x13, 1
	add	x12, x13
	mov	x11, x14
	sub	x11, x10
	mov	r1, -2147483648
add	x11, 1
	mov	r0, x12
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x10
	call	__bit_xor
	jge	rax, x1, .LBB91_411
	jmp	.LBB91_402
.LBB91_402:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x15, x10
	add	x15, x11
	mov	r1, -2147483648
	mov	r0, x15
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x12
	call	__bit_xor
	jge	rax, x1, .LBB91_411
	jmp	.LBB91_403
.LBB91_403:                             //   in Loop: Header=BB91_1 Depth=1
	add	x13, x14
	mov	x2, x13
	add	x2, x8
	mov	x12, x2
	mov	r1, -2147483648
add	x12, 1
	mov	r0, x11
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB91_408
	jmp	.LBB91_404
.LBB91_404:                             //   in Loop: Header=BB91_1 Depth=1
add	x2, 1
	mov	r0, x15
	mov	r1, x2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB91_409
	jmp	.LBB91_405
.LBB91_405:                             // %.preheader.i103.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x1, 0
	sub	x1, x10
	mov	x15, x10
	add	x15, x14
	add	x13, x10
	mov	x2, x1
	add	x2, x8
add	x14, 1
	mov	x0, -2147483645
.LBB91_406:                             // %.preheader.i103
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x15
	add	r0, x1
add	r0, -3
	mov	r0, [r0]
	mov	r1, x13
	add	r1, x2
add	r1, -3
	mov	[r1], r0
add	x15, -4
add	x14, -4
	mov	x11, x1
	add	x11, x14
	mov	r1, -2147483648
add	x13, -4
	mov	r0, x11
	call	__bit_xor
	jg	rax, x0, .LBB91_406
	jmp	.LBB91_407
.LBB91_407:                             // %.loopexit9.i104.loopexit
                                        //   in Loop: Header=BB91_1 Depth=1
	add	x15, x1
	add	x13, x1
	add	x13, x8
add	x13, 1
add	x15, 1
	mov	x12, x13
.LBB91_408:                             // %.loopexit9.i104
                                        //   in Loop: Header=BB91_1 Depth=1
	jz	x11, .LBB91_422
	jmp	.LBB91_409
.LBB91_409:                             // %.preheader1099
                                        //   in Loop: Header=BB91_1 Depth=1
add	x15, -1
add	x12, -1
.LBB91_410:                             //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x15]
	mov	r1, 255
add	x11, -1
	call	__bit_and
	mov	r0, [x12]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x12], rax
add	x15, -1
add	x12, -1
	jz	x11, .LBB91_422
	jmp	.LBB91_410
.LBB91_411:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, -2147483648
	mov	r0, x11
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB91_419
	jmp	.LBB91_412
.LBB91_412:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, x10
	add	r0, x13
	add	r0, x8
	mov	r1, x10
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB91_420
	jmp	.LBB91_413
.LBB91_413:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, -2147483648
	mov	r0, x11
	call	__bit_xor
	mov	x0, -2147483645
	mov	r0, -2147483632
	jl	rax, r0, .LBB91_415
	jmp	.LBB91_414
.LBB91_414:                             // %.preheader12.i.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	add	x13, x8
	mov	r0, x10
	mov	x1, -2147483633
	jmp	.LBB91_417
.LBB91_415:                             // %.preheader1108
                                        //   in Loop: Header=BB91_1 Depth=1
	jmp	.LBB91_418
.LBB91_416:                             //   in Loop: Header=BB91_1 Depth=1
	add	x13, x10
	mov	x12, x13
	mov	r0, 3
	jg	x11, r0, .LBB91_415
	jmp	.LBB91_419
.LBB91_417:                             // %.preheader12.i
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, [r0]
	mov	r2, r0
	add	r2, x13
	mov	r3, r0
add	r3, 4
	mov	[r2], r1
	mov	r1, [r3]
	mov	r3, r2
add	r3, 4
	mov	[r3], r1
	mov	r1, r0
add	r1, 8
	mov	r1, [r1]
	mov	r3, r2
add	r3, 8
add	r2, 12
	mov	[r3], r1
add	r0, 12
	mov	r0, [r0]
add	x10, 16
add	x11, -16
	mov	r1, -2147483648
	mov	[r2], r0
	mov	r0, x11
	call	__bit_xor
	mov	r0, x10
	jg	rax, x1, .LBB91_417
	jmp	.LBB91_416
.LBB91_418:                             //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x10]
add	x10, 4
	mov	[x12], r0
add	x11, -4
	mov	r1, -2147483648
add	x12, 4
	mov	r0, x11
	call	__bit_xor
	jg	rax, x0, .LBB91_418
	jmp	.LBB91_419
.LBB91_419:                             // %.loopexit11.i
                                        //   in Loop: Header=BB91_1 Depth=1
	jz	x11, .LBB91_422
	jmp	.LBB91_420
.LBB91_420:                             // %.preheader1103
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x7, x12
.LBB91_421:                             //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x10]
add	x11, -1
	mov	r1, 255
add	x10, 1
	call	__bit_and
	mov	r0, [x12]
	mov	x1, rax
	mov	r1, -256
add	x7, 1
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x12], rax
	mov	x12, x7
	jnz	x11, .LBB91_421
	jmp	.LBB91_422
.LBB91_422:                             // %memmove.exit
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	r0, [rsp+96]
	mov	r1, 255
	mov	x1, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	x0, -2139062144
	mov	r0, -2147483558
	mov	x9, -2147483623
	jg	rax, r0, .LBB91_428
	jmp	.LBB91_423
.LBB91_423:                             // %memmove.exit
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	jz	rax, .LBB91_428
	jmp	.LBB91_424
.LBB91_424:                             // %.preheader151.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x8, [rsp+44]
.LBB91_425:                             // %.preheader151
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, x9, .LBB91_427
	jmp	.LBB91_426
.LBB91_426:                             //   in Loop: Header=BB91_425 Depth=2
	mov	x7, x8
add	x7, -1
	mov	x1, [x7]
add	x2, -32
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, -256
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
.LBB91_427:                             //   in Loop: Header=BB91_425 Depth=2
	mov	r0, [x8]
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
add	x8, 1
	jnz	x2, .LBB91_425
	jmp	.LBB91_428
.LBB91_428:                             // %memcpy.exit82
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x1, rsp
add	x1, 96
	mov	r0, [rsp+48]
	jz	r0, .LBB91_433
	jmp	.LBB91_429
.LBB91_429:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x11, rsp
add	x11, 96
	mov	r0, [rsp+96]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB91_437
	jmp	.LBB91_430
.LBB91_430:                             // %.preheader1.i105.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x11, rsp
add	x11, 96
	mov	x1, [rsp+44]
	jmp	.LBB91_432
.LBB91_431:                             //   in Loop: Header=BB91_432 Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB91_437
	jmp	.LBB91_432
.LBB91_432:                             // %.preheader1.i105
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x11, 1
	mov	r1, 3
	mov	r0, x11
	call	__bit_and
	jnz	rax, .LBB91_431
	jmp	.LBB91_433
.LBB91_433:                             // %.loopexit.i106.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x1
add	x2, -4
add	x1, -1
.LBB91_434:                             // %.loopexit.i106
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 4
	mov	r1, [x2]
	mov	r0, 16843008
	sub	r0, r1
	mov	x11, x1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x1, 4
	je	rax, x0, .LBB91_434
	jmp	.LBB91_435
.LBB91_435:                             // %.preheader.i107.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x1, 0
.LBB91_436:                             // %.preheader.i107
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x11, 1
add	x1, 1
	jnz	rax, .LBB91_436
	jmp	.LBB91_437
.LBB91_437:                             // %strlen.exit108
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x13, rsp
add	x13, 96
	sub	x11, x13
	mov	r1, [rsp+68]
.LBB91_438:                             //   in Loop: Header=BB91_1 Depth=1
	sub	x6, x11
	add	x6, r1
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	mov	r1, 2147483647
	mov	x1, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483648
	sub	r1, x1
	mov	r0, rax
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	x9, rax
	mov	r0, x5
	mov	x10, [rsp+76]
	mov	r1, x10
	call	__bit_or
	mov	x0, [rsp+56]
	mov	x15, [rsp+60]
	jnz	rax, .LBB91_448
	jmp	.LBB91_439
.LBB91_439:                             //   in Loop: Header=BB91_1 Depth=1
	jl	x6, x3, .LBB91_448
	jmp	.LBB91_440
.LBB91_440:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 88
	mov	x7, [r1]
	jz	r0, .LBB91_442
	jmp	.LBB91_441
.LBB91_441:                             // %.preheader140.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x8, x9
	mov	x2, x7
	jmp	.LBB91_444
.LBB91_442:                             //   in Loop: Header=BB91_1 Depth=1
	add	x7, x9
	mov	r0, rsp
add	r0, 88
	mov	[r0], x7
	jmp	.LBB91_448
.LBB91_443:                             //   in Loop: Header=BB91_444 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
add	x8, -1
	mov	x7, x2
.LBB91_444:                             // %.preheader140
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB91_447
	jmp	.LBB91_445
.LBB91_445:                             // %.preheader140
                                        //   in Loop: Header=BB91_444 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB91_447
	jmp	.LBB91_446
.LBB91_446:                             //   in Loop: Header=BB91_444 Depth=2
	add	x7, [rsp+80]
	mov	r0, [x7]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x7], rax
	mov	r0, rsp
add	r0, 88
	mov	x2, 1
	add	x2, [r0]
.LBB91_447:                             //   in Loop: Header=BB91_444 Depth=2
	mov	r0, rsp
add	r0, 88
	mov	[r0], x2
	jg	x8, x3, .LBB91_443
	jmp	.LBB91_448
.LBB91_448:                             // %.loopexit141
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+72]
	jnz	r0, .LBB91_453
	jmp	.LBB91_449
.LBB91_449:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 88
	mov	x7, [r1]
	mov	x2, x7
add	x2, 1
	jz	r0, .LBB91_452
	jmp	.LBB91_450
.LBB91_450:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB91_452
	jmp	.LBB91_451
.LBB91_451:                             //   in Loop: Header=BB91_1 Depth=1
	add	x7, [rsp+80]
	mov	r0, [x7]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, [rsp+64]
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mov	r0, rsp
add	r0, 88
	mov	x2, 1
	add	x2, [r0]
.LBB91_452:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 88
	mov	[r0], x2
.LBB91_453:                             //   in Loop: Header=BB91_1 Depth=1
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
	mov	x1, rax
	mov	r0, x10
	call	__bit_xor
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	jnz	rax, .LBB91_463
	jmp	.LBB91_454
.LBB91_454:                             //   in Loop: Header=BB91_1 Depth=1
	jl	x6, x3, .LBB91_463
	jmp	.LBB91_455
.LBB91_455:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 88
	mov	x8, [r1]
	jz	r0, .LBB91_457
	jmp	.LBB91_456
.LBB91_456:                             // %.preheader138.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x7, x9
	mov	x2, x8
	jmp	.LBB91_459
.LBB91_457:                             //   in Loop: Header=BB91_1 Depth=1
	add	x8, x9
	mov	r0, rsp
add	r0, 88
	mov	[r0], x8
	jmp	.LBB91_463
.LBB91_458:                             //   in Loop: Header=BB91_459 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
add	x7, -1
	mov	x8, x2
.LBB91_459:                             // %.preheader138
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB91_462
	jmp	.LBB91_460
.LBB91_460:                             // %.preheader138
                                        //   in Loop: Header=BB91_459 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB91_462
	jmp	.LBB91_461
.LBB91_461:                             //   in Loop: Header=BB91_459 Depth=2
	add	x8, [rsp+80]
	mov	r0, [x8]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x8], rax
	mov	r0, rsp
add	r0, 88
	mov	x2, 1
	add	x2, [r0]
.LBB91_462:                             //   in Loop: Header=BB91_459 Depth=2
	mov	r0, rsp
add	r0, 88
	mov	[r0], x2
	jg	x7, x3, .LBB91_458
	jmp	.LBB91_463
.LBB91_463:                             // %.loopexit139
                                        //   in Loop: Header=BB91_1 Depth=1
	jz	x11, .LBB91_472
	jmp	.LBB91_464
.LBB91_464:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 88
	mov	x7, [r1]
	jz	r0, .LBB91_466
	jmp	.LBB91_465
.LBB91_465:                             // %.preheader136.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
add	x11, -1
	mov	x2, x7
	jmp	.LBB91_468
.LBB91_466:                             //   in Loop: Header=BB91_1 Depth=1
	add	x7, x11
	mov	r0, rsp
add	r0, 88
	mov	[r0], x7
	jmp	.LBB91_472
.LBB91_467:                             //   in Loop: Header=BB91_468 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
add	x13, 1
add	x11, -1
	mov	x7, x2
.LBB91_468:                             // %.preheader136
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB91_471
	jmp	.LBB91_469
.LBB91_469:                             // %.preheader136
                                        //   in Loop: Header=BB91_468 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB91_471
	jmp	.LBB91_470
.LBB91_470:                             //   in Loop: Header=BB91_468 Depth=2
	mov	r0, [x13]
	mov	r1, 255
	call	__bit_and
	add	x7, [rsp+80]
	mov	r0, [x7]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mov	r0, rsp
add	r0, 88
	mov	x2, 1
	add	x2, [r0]
.LBB91_471:                             //   in Loop: Header=BB91_468 Depth=2
	mov	r0, rsp
add	r0, 88
	mov	[r0], x2
	jnz	x11, .LBB91_467
	jmp	.LBB91_472
.LBB91_472:                             // %.loopexit137
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x11, 37
	jz	x5, .LBB91_482
	jmp	.LBB91_473
.LBB91_473:                             // %.loopexit137
                                        //   in Loop: Header=BB91_1 Depth=1
	jl	x6, x3, .LBB91_482
	jmp	.LBB91_474
.LBB91_474:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 88
	mov	x5, [r1]
	jz	r0, .LBB91_476
	jmp	.LBB91_475
.LBB91_475:                             // %.preheader134.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x5
	jmp	.LBB91_478
.LBB91_476:                             //   in Loop: Header=BB91_1 Depth=1
	add	x5, x9
	mov	r0, rsp
add	r0, 88
	mov	[r0], x5
	jmp	.LBB91_482
.LBB91_477:                             //   in Loop: Header=BB91_478 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
add	x9, -1
	mov	x5, x2
.LBB91_478:                             // %.preheader134
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB91_481
	jmp	.LBB91_479
.LBB91_479:                             // %.preheader134
                                        //   in Loop: Header=BB91_478 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB91_481
	jmp	.LBB91_480
.LBB91_480:                             //   in Loop: Header=BB91_478 Depth=2
	add	x5, [rsp+80]
	mov	r0, [x5]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x5], rax
	mov	r0, rsp
add	r0, 88
	mov	x2, 1
	add	x2, [r0]
.LBB91_481:                             //   in Loop: Header=BB91_478 Depth=2
	mov	r0, rsp
add	r0, 88
	mov	[r0], x2
	jg	x9, x3, .LBB91_477
	jmp	.LBB91_482
.LBB91_482:                             // %.loopexit135
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x9, -2147483638
	jmp	.LBB91_1
.LBB91_483:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	x1, [r0]
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
	mov	r1, mcasm_static_3a492ebf99720d2e4b84550316b037ff
	sub	r1, x1
add	rax, 1
	mov	r0, rax
	call	__bit_and
	mov	x7, rax
	add	x7, x1
	mov	r1, 3
	mov	r0, x7
	call	__bit_and
	mov	x1, x7
	mov	x9, -2139062144
	jz	rax, .LBB91_488
	jmp	.LBB91_484
.LBB91_484:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	x8, x7
	jz	rax, .LBB91_492
	jmp	.LBB91_485
.LBB91_485:                             // %.preheader1.i109.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x1, x7
add	x1, 1
	mov	x8, x7
	jmp	.LBB91_487
.LBB91_486:                             //   in Loop: Header=BB91_487 Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB91_492
	jmp	.LBB91_487
.LBB91_487:                             // %.preheader1.i109
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x8, 1
	mov	r1, 3
	mov	r0, x8
	call	__bit_and
	jnz	rax, .LBB91_486
	jmp	.LBB91_488
.LBB91_488:                             // %.loopexit.i110.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x1
add	x2, -4
add	x1, -1
.LBB91_489:                             // %.loopexit.i110
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 4
	mov	r1, [x2]
	mov	r0, 16843008
	sub	r0, r1
	mov	x8, x1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x1, 4
	je	rax, x9, .LBB91_489
	jmp	.LBB91_490
.LBB91_490:                             // %.preheader.i111.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x1, 0
.LBB91_491:                             // %.preheader.i111
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x8, 1
add	x1, 1
	jnz	rax, .LBB91_491
	jmp	.LBB91_492
.LBB91_492:                             // %strlen.exit112
                                        //   in Loop: Header=BB91_1 Depth=1
	sub	x8, x7
	mov	r0, x12
	call	__bit_not
	mov	r0, rax
	mov	r1, x8
	call	__bit_and
	mov	x1, rax
	mov	r0, x12
	mov	r1, x8
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	x2, x12
	sub	x2, x8
	mov	r0, rax
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, 0
	jl	x12, r0, .LBB91_494
	jmp	.LBB91_493
.LBB91_493:                             //   in Loop: Header=BB91_1 Depth=1
	add	x8, rax
.LBB91_494:                             //   in Loop: Header=BB91_1 Depth=1
	jnz	x5, .LBB91_504
	jmp	.LBB91_495
.LBB91_495:                             //   in Loop: Header=BB91_1 Depth=1
	jle	x6, x8, .LBB91_504
	jmp	.LBB91_496
.LBB91_496:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 88
	mov	x10, [r1]
	mov	x9, x6
	sub	x9, x8
	jz	r0, .LBB91_498
	jmp	.LBB91_497
.LBB91_497:                             // %.preheader188.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x10
	jmp	.LBB91_500
.LBB91_498:                             //   in Loop: Header=BB91_1 Depth=1
	add	x10, x9
	mov	r0, rsp
add	r0, 88
	mov	[r0], x10
	jmp	.LBB91_504
.LBB91_499:                             //   in Loop: Header=BB91_500 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
add	x9, -1
	mov	x10, x2
.LBB91_500:                             // %.preheader188
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB91_503
	jmp	.LBB91_501
.LBB91_501:                             // %.preheader188
                                        //   in Loop: Header=BB91_500 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB91_503
	jmp	.LBB91_502
.LBB91_502:                             //   in Loop: Header=BB91_500 Depth=2
	add	x10, [rsp+80]
	mov	r0, [x10]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x10], rax
	mov	r0, rsp
add	r0, 88
	mov	x2, 1
	add	x2, [r0]
.LBB91_503:                             //   in Loop: Header=BB91_500 Depth=2
	mov	r0, rsp
add	r0, 88
	mov	[r0], x2
	jg	x9, x3, .LBB91_499
	jmp	.LBB91_504
.LBB91_504:                             // %.loopexit189
                                        //   in Loop: Header=BB91_1 Depth=1
	jz	x8, .LBB91_513
	jmp	.LBB91_505
.LBB91_505:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 88
	mov	x10, [r1]
	jz	r0, .LBB91_507
	jmp	.LBB91_506
.LBB91_506:                             // %.preheader186.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x9, x8
add	x9, -1
	mov	x2, x10
	jmp	.LBB91_509
.LBB91_507:                             //   in Loop: Header=BB91_1 Depth=1
	add	x10, x8
	mov	r0, rsp
add	r0, 88
	mov	[r0], x10
	jmp	.LBB91_513
.LBB91_508:                             //   in Loop: Header=BB91_509 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
add	x7, 1
add	x9, -1
	mov	x10, x2
.LBB91_509:                             // %.preheader186
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB91_512
	jmp	.LBB91_510
.LBB91_510:                             // %.preheader186
                                        //   in Loop: Header=BB91_509 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB91_512
	jmp	.LBB91_511
.LBB91_511:                             //   in Loop: Header=BB91_509 Depth=2
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	add	x10, [rsp+80]
	mov	r0, [x10]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x10], rax
	mov	r0, rsp
add	r0, 88
	mov	x2, 1
	add	x2, [r0]
.LBB91_512:                             //   in Loop: Header=BB91_509 Depth=2
	mov	r0, rsp
add	r0, 88
	mov	[r0], x2
	jnz	x9, .LBB91_508
	jmp	.LBB91_513
.LBB91_513:                             // %.loopexit187
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x9, -2147483638
	jz	x5, .LBB91_1
	jmp	.LBB91_514
.LBB91_514:                             // %.loopexit187
                                        //   in Loop: Header=BB91_1 Depth=1
	jle	x6, x8, .LBB91_1
	jmp	.LBB91_515
.LBB91_515:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 88
	mov	x5, [r1]
	sub	x6, x8
	jz	r0, .LBB91_517
	jmp	.LBB91_516
.LBB91_516:                             // %.preheader184.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x5
	jmp	.LBB91_519
.LBB91_517:                             //   in Loop: Header=BB91_1 Depth=1
	add	x5, x6
	mov	r0, rsp
add	r0, 88
	mov	[r0], x5
	jmp	.LBB91_1
.LBB91_518:                             //   in Loop: Header=BB91_519 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
add	x6, -1
	mov	x5, x2
.LBB91_519:                             // %.preheader184
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB91_522
	jmp	.LBB91_520
.LBB91_520:                             // %.preheader184
                                        //   in Loop: Header=BB91_519 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB91_522
	jmp	.LBB91_521
.LBB91_521:                             //   in Loop: Header=BB91_519 Depth=2
	add	x5, [rsp+80]
	mov	r0, [x5]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x5], rax
	mov	r0, rsp
add	r0, 88
	mov	x2, 1
	add	x2, [r0]
.LBB91_522:                             //   in Loop: Header=BB91_519 Depth=2
	mov	r0, rsp
add	r0, 88
	mov	[r0], x2
	jg	x6, x3, .LBB91_518
	jmp	.LBB91_1
.LBB91_523:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, r0
add	r1, 4
	mov	[rsp+92], r1
	mov	r1, [r0]
	mov	r0, rsp
	mov	r2, rsp
	mov	r3, rsp
	mov	r4, rsp
add	r0, 16
	mov	[r0], x12
add	r2, 12
	mov	[r2], x6
add	r3, 8
	mov	r0, [rsp+76]
	mov	[r3], r0
add	r4, 4
	mov	[r4], 0
	mov	[rsp], 0
	mov	r0, rsp
add	r0, 80
	mov	r2, 0
	mov	r3, 0
	mov	r4, 16
	mov	r5, 0
	mov	r6, 1
	mov	r7, x5
	call	format_integer
	mov	x9, -2147483638
	jmp	.LBB91_1
.LBB91_524:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 88
	mov	r0, [r0]
	mov	r1, 3
	jg	x2, r1, .LBB91_528
	jmp	.LBB91_525
.LBB91_525:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x9, -2147483638
	je	x2, x3, .LBB91_531
	jmp	.LBB91_526
.LBB91_526:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 2
	je	x2, r1, .LBB91_532
	jmp	.LBB91_527
.LBB91_527:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 3
	je	x2, r1, .LBB91_533
	jmp	.LBB91_537
.LBB91_528:                             //   in Loop: Header=BB91_1 Depth=1
	mov	x9, -2147483638
	mov	r1, 4
	je	x2, r1, .LBB91_534
	jmp	.LBB91_529
.LBB91_529:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 6
	je	x2, r1, .LBB91_535
	jmp	.LBB91_530
.LBB91_530:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, 7
	je	x2, r1, .LBB91_536
	jmp	.LBB91_537
.LBB91_531:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, [rsp+92]
	mov	r2, r1
add	r2, 4
	mov	[rsp+92], r2
	mov	x5, [r1]
	mov	x1, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, -256
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	jmp	.LBB91_1
.LBB91_532:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, [rsp+92]
	mov	r2, r1
add	r2, 4
	mov	[rsp+92], r2
	mov	x5, [r1]
	mov	x1, [x5]
	mov	r1, 65535
	call	__bit_and
	mov	r1, -65536
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 65535
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	jmp	.LBB91_1
.LBB91_533:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, [rsp+92]
	mov	r2, r1
add	r2, 4
	mov	[rsp+92], r2
	mov	r1, [r1]
	mov	[r1], r0
	jmp	.LBB91_1
.LBB91_534:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, [rsp+92]
	mov	r2, r1
add	r2, 4
	mov	[rsp+92], r2
	mov	r1, [r1]
	mov	[r1], r0
add	r1, 4
	mov	[r1], 0
	jmp	.LBB91_1
.LBB91_535:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, [rsp+92]
	mov	r2, r1
add	r2, 4
	mov	[rsp+92], r2
	mov	r1, [r1]
	mov	[r1], r0
	jmp	.LBB91_1
.LBB91_536:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, [rsp+92]
	mov	r2, r1
add	r2, 4
	mov	[rsp+92], r2
	mov	r1, [r1]
	mov	[r1], r0
	jmp	.LBB91_1
.LBB91_537:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, [rsp+92]
	mov	r2, r1
add	r2, 4
	mov	[rsp+92], r2
	mov	r1, [r1]
	mov	[r1], r0
	jmp	.LBB91_1
.LBB91_538:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	x9, [r0]
	mov	r0, rsp
add	r0, 88
	mov	x7, [r0]
	jnz	x5, .LBB91_547
	jmp	.LBB91_539
.LBB91_539:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 2
	jl	x6, r0, .LBB91_547
	jmp	.LBB91_540
.LBB91_540:                             //   in Loop: Header=BB91_1 Depth=1
	jz	x9, .LBB91_542
	jmp	.LBB91_541
.LBB91_541:                             // %.preheader128.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x10, x6
add	x10, 1
	mov	x11, x7
	jmp	.LBB91_543
.LBB91_542:                             //   in Loop: Header=BB91_1 Depth=1
	add	x7, x6
	mov	r0, rsp
add	r0, 88
	mov	[r0], x7
	mov	x11, 37
	mov	x9, -2147483638
	jmp	.LBB91_1
.LBB91_543:                             // %.preheader128
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x7, 1
	jz	x9, .LBB91_546
	jmp	.LBB91_544
.LBB91_544:                             // %.preheader128
                                        //   in Loop: Header=BB91_543 Depth=2
	mov	r1, -2147483648
	mov	r0, x9
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x7
	call	__bit_xor
	jge	rax, x1, .LBB91_546
	jmp	.LBB91_545
.LBB91_545:                             //   in Loop: Header=BB91_543 Depth=2
	add	x11, [rsp+80]
	mov	x1, [x11]
	mov	r1, 255
	mov	r0, x8
	call	__bit_and
	mov	r1, -256
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x11], rax
	mov	r0, rsp
add	r0, 88
	mov	x7, 1
	add	x7, [r0]
	mov	r0, rsp
add	r0, 84
	mov	x9, [r0]
.LBB91_546:                             //   in Loop: Header=BB91_543 Depth=2
	mov	r0, rsp
add	r0, 88
add	x10, -1
	mov	[r0], x7
	mov	x11, x7
	mov	r0, 2
	jg	x10, r0, .LBB91_543
	jmp	.LBB91_547
.LBB91_547:                             // %.loopexit129
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x8, x7
add	x8, 1
	jz	x9, .LBB91_550
	jmp	.LBB91_548
.LBB91_548:                             // %.loopexit129
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	r1, -2147483648
	mov	r0, x9
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x8
	call	__bit_xor
	jge	rax, x1, .LBB91_550
	jmp	.LBB91_549
.LBB91_549:                             //   in Loop: Header=BB91_1 Depth=1
	add	x7, [rsp+80]
	mov	r0, [x7]
	mov	r1, -256
	call	__bit_and
	mov	r1, 37
	mov	r0, rax
	call	__bit_or
	mov	[x7], rax
	mov	r0, rsp
add	r0, 88
	mov	x7, [r0]
	mov	x8, x7
add	x8, 1
.LBB91_550:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 88
	mov	[r0], x8
	mov	x11, 37
	mov	x9, -2147483638
	jz	x5, .LBB91_1
	jmp	.LBB91_551
.LBB91_551:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, 2
	jl	x6, r0, .LBB91_1
	jmp	.LBB91_552
.LBB91_552:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	jz	r0, .LBB91_554
	jmp	.LBB91_553
.LBB91_553:                             // %.preheader126.preheader
                                        //   in Loop: Header=BB91_1 Depth=1
	mov	x2, x8
	jmp	.LBB91_556
.LBB91_554:                             //   in Loop: Header=BB91_1 Depth=1
	add	x7, x6
	mov	r0, rsp
add	r0, 88
	mov	[r0], x7
	jmp	.LBB91_1
.LBB91_555:                             //   in Loop: Header=BB91_556 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
add	x6, -1
	mov	x8, x2
.LBB91_556:                             // %.preheader126
                                        //   Parent Loop BB91_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB91_559
	jmp	.LBB91_557
.LBB91_557:                             // %.preheader126
                                        //   in Loop: Header=BB91_556 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB91_559
	jmp	.LBB91_558
.LBB91_558:                             //   in Loop: Header=BB91_556 Depth=2
	add	x8, [rsp+80]
	mov	r0, [x8]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x8], rax
	mov	r0, rsp
add	r0, 88
	mov	x2, 1
	add	x2, [r0]
.LBB91_559:                             //   in Loop: Header=BB91_556 Depth=2
	mov	r0, rsp
add	r0, 88
	mov	[r0], x2
	mov	r0, 2
	jg	x6, r0, .LBB91_555
	jmp	.LBB91_1
.LBB91_560:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	x6, [r0]
	mov	r0, rsp
add	r0, 88
	mov	x2, [r0]
	mov	x5, x2
add	x5, 1
	jz	x6, .LBB91_566
	jmp	.LBB91_561
.LBB91_561:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x5
	call	__bit_xor
	jge	rax, x1, .LBB91_563
	jmp	.LBB91_562
.LBB91_562:                             //   in Loop: Header=BB91_1 Depth=1
	add	x2, [rsp+80]
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 37
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	mov	r0, rsp
add	r0, 84
	mov	x6, [r0]
	mov	r0, rsp
add	r0, 88
	mov	x2, [r0]
	mov	x5, x2
add	x5, 1
.LBB91_563:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r0, rsp
add	r0, 88
	mov	[r0], x5
	jz	x6, .LBB91_566
	jmp	.LBB91_564
.LBB91_564:                             //   in Loop: Header=BB91_1 Depth=1
	mov	r1, -2147483648
add	x2, 2
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB91_566
	jmp	.LBB91_565
.LBB91_565:                             //   in Loop: Header=BB91_1 Depth=1
	add	x5, [rsp+80]
	mov	x1, [x5]
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	r1, -256
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	mov	r0, rsp
add	r0, 88
	mov	x5, [r0]
.LBB91_566:                             //   in Loop: Header=BB91_1 Depth=1
add	x5, 1
	mov	r0, rsp
add	r0, 88
	mov	[r0], x5
	mov	x9, -2147483638
	jmp	.LBB91_1
.LBB91_567:
	mov	r0, rsp
add	r0, 84
	mov	x1, [r0]
	mov	r0, rsp
add	r0, 88
	mov	x0, [r0]
	jz	x1, .LBB91_569
	jmp	.LBB91_568
.LBB91_568:
add	x1, -1
	mov	r0, x0
	call	__bit_not
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	x2, rax
	mov	r0, x0
	mov	r1, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x0, x1
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x0, rax
	add	x0, x1
	add	x0, [rsp+80]
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, rsp
add	r0, 88
	mov	x0, [r0]
.LBB91_569:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 2147483647
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r1, 2147483647
	mov	x3, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
add	x0, 1
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
add	rax, -1
	mov	x15, [rsp+512]
	mov	x14, [rsp+516]
	mov	x13, [rsp+520]
	mov	x12, [rsp+524]
	mov	x11, [rsp+528]
	mov	x10, [rsp+532]
	mov	x9, [rsp+536]
	mov	x8, [rsp+540]
	mov	x7, [rsp+544]
	mov	x6, [rsp+548]
	mov	x5, [rsp+552]
	mov	x4, [rsp+556]
	mov	x3, [rsp+560]
	mov	x2, [rsp+564]
	mov	x1, [rsp+568]
	mov	x0, [rsp+572]
add	rsp, 576
	ret
// -- End function
// -- Begin function format_integer
format_integer:                         // @format_integer
// %bb.0:
sub	rsp, 148
	mov	[rsp+144], x0
	mov	[rsp+140], x1
	mov	[rsp+136], x2
	mov	[rsp+132], x3
	mov	[rsp+128], x4
	mov	[rsp+124], x5
	mov	[rsp+120], x6
	mov	[rsp+116], x7
	mov	[rsp+112], x8
	mov	[rsp+108], x9
	mov	[rsp+104], x10
	mov	[rsp+100], x11
	mov	[rsp+96], x12
	mov	[rsp+92], x13
	mov	[rsp+88], x14
	mov	[rsp+84], x15
	mov	x15, [rsp+164]
	mov	[rsp+16], r7
	mov	[rsp+12], r6
	mov	x2, r5
	mov	x3, r4
	mov	x8, r3
	mov	x5, r2
	mov	x6, r1
	mov	x0, r0
	mov	r0, x6
	mov	r1, x5
	call	__bit_or
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
	mov	x4, rax
	jnz	x9, .LBB92_2
	jmp	.LBB92_1
.LBB92_1:
	mov	x14, 0
	jz	x15, .LBB92_6
	jmp	.LBB92_2
.LBB92_2:
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
	mov	x14, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	x1, mcasm_static_65a9b514e1127679337fc429ce44df2f
	mov	r1, mcasm_static_ccbdd611d38f580638dd57066fcc265d
	sub	r1, x1
add	rax, 1
	mov	r0, rax
	call	__bit_and
	jnz	x4, .LBB92_4
	jmp	.LBB92_3
.LBB92_3:
	add	x1, rax
	mov	x12, 0
	mov	x11, x6
	mov	x10, x5
	mov	x14, 0
	jmp	.LBB92_5
.LBB92_4:
	mov	r0, [rsp+20]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[rsp+20], rax
	jmp	.LBB92_6
.LBB92_5:                               // =>This Inner Loop Header: Depth=1
	mov	r3, 0
	mov	r0, x11
	mov	r1, x10
	mov	r2, x3
	call	__udivdi3
	mov	r3, 0
	mov	x4, rax
	mov	x9, t0
	mov	r0, x4
	mov	r1, x9
	mov	r2, x3
	call	__muldi3
	mov	r3, t0
	mov	r0, x11
	mov	r1, x10
	mov	r2, rax
	call	__subdi3
	add	rax, x1
	mov	r0, [rax]
	mov	r1, 255
	call	__bit_and
	mov	x7, rsp
add	x7, 20
	add	x7, x12
	mov	r0, [x7]
	mov	x12, rax
	mov	r1, -256
add	x14, 1
	call	__bit_and
	mov	r1, 255
	mov	x13, rax
	mov	r0, x12
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x13
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mov	r0, x11
	call	__bit_not
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	x12, rax
	mov	r0, x11
	mov	r1, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x11, x3
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	x11, rax
add	x11, -1
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
add	rax, 1
	mov	r0, rax
	mov	r1, x11
	call	__bit_and
add	rax, 1
	mov	x12, x14
	mov	x11, x4
	mov	x10, x9
	jnz	rax, .LBB92_5
	jmp	.LBB92_6
.LBB92_6:                               // %.loopexit22
	mov	rax, 45
	mov	x1, 0
	mov	x10, 0
	jnz	x8, .LBB92_9
	jmp	.LBB92_7
.LBB92_7:
	mov	r0, [rsp+148]
	mov	rax, 43
	jnz	r0, .LBB92_9
	jmp	.LBB92_8
.LBB92_8:
	mov	x8, [rsp+152]
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
	mov	x10, rax
	mov	r0, x10
	call	__bit_not
add	rax, 1
	mov	r1, -32
	mov	r0, rax
	call	__bit_and
add	rax, 32
.LBB92_9:
	mov	[rsp], rax
	mov	x4, 0
	mov	x9, 0
	mov	x11, 0
	mov	r1, 0
	mov	r0, [rsp+12]
	jz	r0, .LBB92_17
	jmp	.LBB92_10
.LBB92_10:
	mov	r0, 8
	jne	x3, r0, .LBB92_14
	jmp	.LBB92_11
.LBB92_11:
	jz	x14, .LBB92_13
	jmp	.LBB92_12
.LBB92_12:
	mov	r0, rsp
add	r0, 20
	add	r0, x14
add	r0, -1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, 48
	mov	r1, 0
	je	rax, r0, .LBB92_17
	jmp	.LBB92_13
.LBB92_13:
	mov	x1, 48
	mov	x4, 1
	mov	x11, 1
	jmp	.LBB92_17
.LBB92_14:
	mov	r0, x6
	mov	r1, x5
	call	__bit_or
	mov	r1, 0
	jz	rax, .LBB92_17
	jmp	.LBB92_15
.LBB92_15:
	mov	r0, 16
	jne	x3, r0, .LBB92_17
	jmp	.LBB92_16
.LBB92_16:
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
	mov	x4, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 32
	mov	r0, rax
	call	__bit_and
	mov	r1, rax
add	r1, 88
	mov	x1, 48
	mov	x11, 2
	mov	x9, 1
.LBB92_17:
	mov	x13, x15
	sub	x13, x14
	jg	x15, x14, .LBB92_19
	jmp	.LBB92_18
.LBB92_18:
	mov	x13, 0
.LBB92_19:
	mov	r0, -1
	mov	x5, x13
	jg	x15, r0, .LBB92_21
	jmp	.LBB92_20
.LBB92_20:
	mov	x5, 0
.LBB92_21:
	mov	[rsp+4], r1
	mov	x3, [rsp+160]
	mov	x2, 0
	jg	x15, r0, .LBB92_23
	jmp	.LBB92_22
.LBB92_22:
	mov	x2, [rsp+156]
.LBB92_23:
	mov	[rsp+8], x1
	mov	[rsp+12], x5
	add	x5, x14
	mov	r0, x10
	call	__bit_not
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	rax, x5
	add	rax, x11
	mov	x12, x3
	sub	x12, rax
	mov	x1, x12
	jg	x3, rax, .LBB92_25
	jmp	.LBB92_24
.LBB92_24:
	mov	x1, 0
.LBB92_25:
	mov	r0, x2
	mov	r1, [rsp+16]
	call	__bit_or
	mov	x11, x0
add	x11, 4
	mov	x7, x0
add	x7, 8
	jnz	rax, .LBB92_35
	jmp	.LBB92_26
.LBB92_26:
	mov	r0, 1
	jl	x1, r0, .LBB92_35
	jmp	.LBB92_27
.LBB92_27:
	mov	r0, [x11]
	mov	x8, [x7]
	jz	r0, .LBB92_29
	jmp	.LBB92_28
.LBB92_28:                              // %.preheader20.preheader
	mov	x15, 1
	mov	x6, x12
	mov	x3, x8
	jmp	.LBB92_31
.LBB92_29:
	add	x8, x1
	mov	[x7], x8
	jmp	.LBB92_35
.LBB92_30:                              //   in Loop: Header=BB92_31 Depth=1
	mov	r0, [x11]
add	x6, -1
	mov	x8, x3
.LBB92_31:                              // %.preheader20
                                        // =>This Inner Loop Header: Depth=1
add	x3, 1
	jz	r0, .LBB92_34
	jmp	.LBB92_32
.LBB92_32:                              // %.preheader20
                                        //   in Loop: Header=BB92_31 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x3
	call	__bit_xor
	jge	rax, x5, .LBB92_34
	jmp	.LBB92_33
.LBB92_33:                              //   in Loop: Header=BB92_31 Depth=1
	add	x8, [x0]
	mov	r0, [x8]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x8], rax
	mov	x3, 1
	add	x3, [x7]
.LBB92_34:                              //   in Loop: Header=BB92_31 Depth=1
	mov	[x7], x3
	jg	x6, x15, .LBB92_30
	jmp	.LBB92_35
.LBB92_35:                              // %.loopexit21
	jnz	x10, .LBB92_40
	jmp	.LBB92_36
.LBB92_36:
	mov	r0, [x11]
	jz	r0, .LBB92_39
	jmp	.LBB92_37
.LBB92_37:
	mov	x6, [x7]
	mov	x3, x6
	mov	r1, -2147483648
add	x3, 1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x3
	call	__bit_xor
	jge	rax, x5, .LBB92_39
	jmp	.LBB92_38
.LBB92_38:
	add	x6, [x0]
	mov	x3, [x6]
	mov	r1, 255
	mov	r0, [rsp]
	call	__bit_and
	mov	r1, -256
	mov	x5, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x6], rax
.LBB92_39:
	add	[x7], 1
.LBB92_40:
	mov	x8, x1
	jz	x4, .LBB92_45
	jmp	.LBB92_41
.LBB92_41:
	mov	r0, [x11]
	jz	r0, .LBB92_44
	jmp	.LBB92_42
.LBB92_42:
	mov	x4, [x7]
	mov	x3, x4
	mov	r1, -2147483648
add	x3, 1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x3
	call	__bit_xor
	jge	rax, x5, .LBB92_44
	jmp	.LBB92_43
.LBB92_43:
	add	x4, [x0]
	mov	r0, [x4]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, [rsp+8]
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
.LBB92_44:
	add	[x7], 1
.LBB92_45:
	jz	x9, .LBB92_50
	jmp	.LBB92_46
.LBB92_46:
	mov	r0, [x11]
	jz	r0, .LBB92_49
	jmp	.LBB92_47
.LBB92_47:
	mov	x5, [x7]
	mov	x3, x5
	mov	r1, -2147483648
add	x3, 1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x3
	call	__bit_xor
	jge	rax, x4, .LBB92_49
	jmp	.LBB92_48
.LBB92_48:
	add	x5, [x0]
	mov	x3, [x5]
	mov	r1, 255
	mov	r0, [rsp+4]
	call	__bit_and
	mov	r1, -256
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
.LBB92_49:
	add	[x7], 1
.LBB92_50:
	mov	r0, [rsp+16]
	jnz	r0, .LBB92_61
	jmp	.LBB92_51
.LBB92_51:
	jz	x2, .LBB92_61
	jmp	.LBB92_52
.LBB92_52:
	mov	r0, 1
	jl	x8, r0, .LBB92_61
	jmp	.LBB92_53
.LBB92_53:
	mov	r0, [x11]
	mov	x6, [x7]
	jz	r0, .LBB92_55
	jmp	.LBB92_54
.LBB92_54:                              // %.preheader18.preheader
	mov	x4, 1
	mov	x5, x12
	mov	x2, x6
	jmp	.LBB92_57
.LBB92_55:
	add	x6, x8
	mov	[x7], x6
	jmp	.LBB92_61
.LBB92_56:                              //   in Loop: Header=BB92_57 Depth=1
	mov	r0, [x11]
add	x5, -1
	mov	x6, x2
.LBB92_57:                              // %.preheader18
                                        // =>This Inner Loop Header: Depth=1
add	x2, 1
	jz	r0, .LBB92_60
	jmp	.LBB92_58
.LBB92_58:                              // %.preheader18
                                        //   in Loop: Header=BB92_57 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x3, .LBB92_60
	jmp	.LBB92_59
.LBB92_59:                              //   in Loop: Header=BB92_57 Depth=1
	add	x6, [x0]
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x6], rax
	mov	x2, 1
	add	x2, [x7]
.LBB92_60:                              //   in Loop: Header=BB92_57 Depth=1
	mov	[x7], x2
	jg	x5, x4, .LBB92_56
	jmp	.LBB92_61
.LBB92_61:                              // %.loopexit19
	mov	x4, 1
	mov	r1, [rsp+12]
	jl	r1, x4, .LBB92_70
	jmp	.LBB92_62
.LBB92_62:
	mov	r0, [x11]
	mov	x5, [x7]
	jz	r0, .LBB92_64
	jmp	.LBB92_63
.LBB92_63:                              // %.preheader16.preheader
	mov	x1, 1
	mov	x2, x5
	jmp	.LBB92_66
.LBB92_64:
	add	x5, r1
	mov	[x7], x5
	jmp	.LBB92_70
.LBB92_65:                              //   in Loop: Header=BB92_66 Depth=1
	mov	r0, [x11]
add	x13, -1
	mov	x5, x2
.LBB92_66:                              // %.preheader16
                                        // =>This Inner Loop Header: Depth=1
add	x2, 1
	jz	r0, .LBB92_69
	jmp	.LBB92_67
.LBB92_67:                              // %.preheader16
                                        //   in Loop: Header=BB92_66 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x3, .LBB92_69
	jmp	.LBB92_68
.LBB92_68:                              //   in Loop: Header=BB92_66 Depth=1
	add	x5, [x0]
	mov	r0, [x5]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x5], rax
	mov	x2, 1
	add	x2, [x7]
.LBB92_69:                              //   in Loop: Header=BB92_66 Depth=1
	mov	[x7], x2
	jg	x13, x1, .LBB92_65
	jmp	.LBB92_70
.LBB92_70:                              // %.loopexit17
	jl	x14, x4, .LBB92_79
	jmp	.LBB92_71
.LBB92_71:
	mov	r0, [x11]
	mov	x5, [x7]
	jz	r0, .LBB92_73
	jmp	.LBB92_72
.LBB92_72:                              // %.preheader14.preheader
	mov	x1, rsp
add	x1, 19
	mov	x4, 1
	mov	x2, x5
	jmp	.LBB92_75
.LBB92_73:
	add	x5, x14
	mov	[x7], x5
	jmp	.LBB92_79
.LBB92_74:                              //   in Loop: Header=BB92_75 Depth=1
	mov	r0, [x11]
add	x14, -1
	mov	x5, x2
.LBB92_75:                              // %.preheader14
                                        // =>This Inner Loop Header: Depth=1
add	x2, 1
	jz	r0, .LBB92_78
	jmp	.LBB92_76
.LBB92_76:                              // %.preheader14
                                        //   in Loop: Header=BB92_75 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x3, .LBB92_78
	jmp	.LBB92_77
.LBB92_77:                              //   in Loop: Header=BB92_75 Depth=1
	mov	r0, x1
	add	r0, x14
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	add	x5, [x0]
	mov	r0, [x5]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	mov	x2, 1
	add	x2, [x7]
.LBB92_78:                              //   in Loop: Header=BB92_75 Depth=1
	mov	[x7], x2
	jg	x14, x4, .LBB92_74
	jmp	.LBB92_79
.LBB92_79:                              // %.loopexit15
	mov	r0, [rsp+16]
	jz	r0, .LBB92_89
	jmp	.LBB92_80
.LBB92_80:                              // %.loopexit15
	mov	r0, 1
	jl	x8, r0, .LBB92_89
	jmp	.LBB92_81
.LBB92_81:
	mov	r0, [x11]
	mov	x4, [x7]
	jz	r0, .LBB92_83
	jmp	.LBB92_82
.LBB92_82:                              // %.preheader.preheader
	mov	x3, 1
	mov	x1, x4
	jmp	.LBB92_85
.LBB92_83:
	add	x4, x8
	mov	[x7], x4
	jmp	.LBB92_89
.LBB92_84:                              //   in Loop: Header=BB92_85 Depth=1
	mov	r0, [x11]
add	x12, -1
	mov	x4, x1
.LBB92_85:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	x1, 1
	jz	r0, .LBB92_88
	jmp	.LBB92_86
.LBB92_86:                              // %.preheader
                                        //   in Loop: Header=BB92_85 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	jge	rax, x2, .LBB92_88
	jmp	.LBB92_87
.LBB92_87:                              //   in Loop: Header=BB92_85 Depth=1
	add	x4, [x0]
	mov	r0, [x4]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x4], rax
	mov	x1, 1
	add	x1, [x7]
.LBB92_88:                              //   in Loop: Header=BB92_85 Depth=1
	mov	[x7], x1
	jg	x12, x3, .LBB92_84
	jmp	.LBB92_89
.LBB92_89:                              // %.loopexit
	mov	x15, [rsp+84]
	mov	x14, [rsp+88]
	mov	x13, [rsp+92]
	mov	x12, [rsp+96]
	mov	x11, [rsp+100]
	mov	x10, [rsp+104]
	mov	x9, [rsp+108]
	mov	x8, [rsp+112]
	mov	x7, [rsp+116]
	mov	x6, [rsp+120]
	mov	x5, [rsp+124]
	mov	x4, [rsp+128]
	mov	x3, [rsp+132]
	mov	x2, [rsp+136]
	mov	x1, [rsp+140]
	mov	x0, [rsp+144]
add	rsp, 148
	ret
// -- End function
// -- Begin function extract_sig_digits
extract_sig_digits:                     // @extract_sig_digits
// %bb.0:
sub	rsp, 48
	mov	[rsp+44], x0
	mov	[rsp+40], x1
	mov	[rsp+36], x2
	mov	[rsp+32], x3
	mov	[rsp+28], x4
	mov	[rsp+24], x5
	mov	[rsp+20], x6
	mov	[rsp+16], x7
	mov	[rsp+12], x8
	mov	[rsp+8], x9
	mov	[rsp+4], x10
	mov	[rsp], x11
	mov	x3, r1
	mov	r1, -2147483648
	mov	x0, r4
	mov	x1, r3
	mov	x2, r2
	mov	x4, r0
	mov	r0, x2
	call	__bit_xor
	mov	r1, 2147483646
	mov	x5, rax
	mov	r0, x5
	call	__bit_and
	mov	x6, rax
	mov	r1, -2147483647
	mov	x7, -2147483647
	mov	r0, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x7, x5
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
add	x2, -1
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	x2, rax
	mov	r2, 0
	mov	r3, 0
	mov	x8, 0
	mov	r0, x4
	mov	r1, x3
	call	__eqdf2
	jz	rax, .LBB93_3
	jmp	.LBB93_1
.LBB93_1:
	mov	r2, 0
	mov	r3, 1076101120
	mov	r0, x4
	mov	r1, x3
	call	__gedf2
	jl	rax, x8, .LBB93_4
	jmp	.LBB93_2
.LBB93_2:                               // %.preheader8.preheader
	mov	x5, 0
	jmp	.LBB93_6
.LBB93_3:
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
add	x1, 1
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	jmp	.LBB93_22
.LBB93_4:                               // %.loopexit9
add	x2, 1
	mov	r2, 0
	mov	r3, 1072693248
	mov	x9, 0
	mov	r0, x4
	mov	r1, x3
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB93_7
	jmp	.LBB93_5
.LBB93_5:                               // %.preheader7.preheader
	mov	x5, 0
	jmp	.LBB93_8
.LBB93_6:                               // %.preheader8
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, -1717986918
	mov	r3, 1069128089
	mov	r0, x4
	mov	r1, x3
	call	__muldf3
	mov	x4, rax
	mov	x3, t0
	mov	r2, 0
	mov	r3, 1076101120
add	x8, 1
	mov	r0, x4
	mov	r1, x3
	call	__ltdf2
	jl	rax, x5, .LBB93_4
	jmp	.LBB93_6
.LBB93_7:                               // %.loopexit
	mov	x10, x2
add	x10, 1
	jmp	.LBB93_9
.LBB93_8:                               // %.preheader7
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, 0
	mov	r3, 1076101120
	mov	r0, x4
	mov	r1, x3
	call	__muldf3
	mov	x4, rax
	mov	x3, t0
	mov	r2, 0
	mov	r3, 1072693248
add	x8, -1
	mov	r0, x4
	mov	r1, x3
	call	__ltdf2
	jl	rax, x5, .LBB93_8
	jmp	.LBB93_7
.LBB93_9:                               // =>This Inner Loop Header: Depth=1
	mov	r0, x4
	mov	r1, x3
	call	__fixdfsi
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x5
	call	__bit_xor
	mov	r1, 2147483647
	mov	x6, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, -2147483648
	mov	x7, rax
	mov	r0, x6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483648
	sub	r1, x6
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x5
	call	__bit_xor
	mov	r1, -2147483639
	mov	x6, rax
	mov	r0, x6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x6
add	r1, 2147483639
	mov	r0, rax
	call	__bit_and
	mov	x7, rax
	mov	r0, x6
	call	__bit_not
	mov	r1, -2147483639
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
add	x5, -9
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	x5, rax
add	x5, 9
	mov	r1, 48
	mov	r0, x5
	call	__bit_or
	mov	x11, x1
	add	x11, x9
	mov	r0, [x11]
	mov	r1, -256
	mov	x6, rax
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	[x11], rax
	mov	r0, x5
	call	__floatunsidf
	mov	r3, t0
	mov	r0, x4
	mov	r1, x3
	mov	r2, rax
	call	__subdf3
	mov	r2, 0
	mov	r3, 1076101120
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
	mov	r2, 0
	mov	r3, 0
	mov	x5, rax
	mov	x4, t0
	mov	r0, x5
	mov	r1, x4
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x3
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x3
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
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
	mov	r0, rax
	call	__bit_not
	mov	x6, rax
add	x6, 1
	mov	r1, 0
	sub	r1, x4
	mov	r0, x6
	call	__bit_and
	mov	x3, rax
	mov	r1, 0
	sub	r1, x5
	add	x3, x4
	mov	r0, x6
	call	__bit_and
	mov	x4, rax
add	x9, 1
	add	x4, x5
	jne	x10, x9, .LBB93_9
	jmp	.LBB93_10
.LBB93_10:
	mov	x5, x1
	add	x5, x2
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r1, 24
	mov	r0, rax
	call	__bit_sar
	mov	x6, 53
	jg	rax, x6, .LBB93_14
	jmp	.LBB93_11
.LBB93_11:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	rax, x6, .LBB93_21
	jmp	.LBB93_12
.LBB93_12:
	mov	r2, -400107883
	mov	r3, 1041313291
	mov	r0, x4
	mov	r1, x3
	call	__gtdf2
	mov	r0, 0
	jg	rax, r0, .LBB93_14
	jmp	.LBB93_13
.LBB93_13:
	mov	r0, x5
add	r0, -1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB93_21
	jmp	.LBB93_14
.LBB93_14:                              // %.preheader48
	mov	x6, x2
add	x6, -1
	mov	x4, 57
	mov	x7, 1
.LBB93_15:                              // =>This Inner Loop Header: Depth=1
	mov	x3, x1
	add	x3, x6
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	jne	rax, x4, .LBB93_18
	jmp	.LBB93_16
.LBB93_16:                              //   in Loop: Header=BB93_15 Depth=1
	mov	r0, [x3]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r0, x6
add	x6, -1
add	r0, 1
	mov	[x3], rax
	jg	r0, x7, .LBB93_15
	jmp	.LBB93_17
.LBB93_17:                              // %.preheader.preheader
	mov	x6, 1
	jmp	.LBB93_19
.LBB93_18:
	mov	x1, [x3]
add	rax, 1
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	jmp	.LBB93_21
.LBB93_19:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	x7, x2
	mov	x9, x1
	add	x9, x7
	mov	r0, x9
add	r0, -1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x9]
	mov	r1, -256
	mov	x3, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x9], rax
add	x2, -1
	jg	x7, x6, .LBB93_19
	jmp	.LBB93_20
.LBB93_20:
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 49
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
add	x8, 1
.LBB93_21:
	mov	r0, [x5]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x5], rax
.LBB93_22:
	mov	[x0], x8
	mov	x11, [rsp]
	mov	x10, [rsp+4]
	mov	x9, [rsp+8]
	mov	x8, [rsp+12]
	mov	x7, [rsp+16]
	mov	x6, [rsp+20]
	mov	x5, [rsp+24]
	mov	x4, [rsp+28]
	mov	x3, [rsp+32]
	mov	x2, [rsp+36]
	mov	x1, [rsp+40]
	mov	x0, [rsp+44]
add	rsp, 48
	ret
// -- End function
// -- Begin function vsprintf
vsprintf:                               // @vsprintf
// %bb.0:
	mov	r3, r1
	mov	r1, -1
	mov	r4, r2
	mov	r2, r3
	mov	r3, r4
	jmp	vsnprintf
// -- End function
// -- Begin function abort
abort:                                  // @abort
// %bb.0:
	inline tellraw @a "[DataPack] Aborted! Program has crashed, run /reload to reset."
.LBB95_1:                               // =>This Inner Loop Header: Depth=1
	jmp	.LBB95_1
// -- End function
// -- Begin function atexit
atexit:                                 // @atexit
// %bb.0:
	mov	rax, 0
	ret
// -- End function
// -- Begin function abs
abs:                                    // @abs
// %bb.0:
	mov	r1, -1
	mov	rax, r0
	jg	rax, r1, .LBB97_2
	jmp	.LBB97_1
.LBB97_1:
	mov	r0, 0
	sub	r0, rax
	mov	rax, r0
.LBB97_2:
	ret
// -- End function
// -- Begin function atoi
atoi:                                   // @atoi
// %bb.0:
	mov	r1, 0
	mov	r2, 10
	jmp	strtol
// -- End function
// -- Begin function atol
atol:                                   // @atol
// %bb.0:
	mov	r1, 0
	mov	r2, 10
	jmp	strtol
// -- End function
// -- Begin function atoll
atoll:                                  // @atoll
// %bb.0:
	mov	r1, 0
	mov	r2, 10
	jmp	strtoll
// -- End function
// -- Begin function div
div:                                    // @div
// %bb.0:
	mov	r3, r1
	div	r3, r2
	mov	[r0], r3
	mul	r3, r2
	sub	r1, r3
add	r0, 4
	mov	[r0], r1
	ret
// -- End function
// -- Begin function ldiv
ldiv:                                   // @ldiv
// %bb.0:
	mov	r3, r1
	div	r3, r2
	mov	[r0], r3
	mul	r3, r2
	sub	r1, r3
add	r0, 4
	mov	[r0], r1
	ret
// -- End function
// -- Begin function lldiv
lldiv:                                  // @lldiv
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x0, r4
	mov	x1, r3
	mov	x2, r2
	mov	x3, r1
	mov	x4, r0
	mov	r0, x3
	mov	r1, x2
	mov	r2, x1
	mov	r3, x0
	call	__divdi3
	mov	r1, t0
	mov	r0, x4
add	r0, 4
	mov	[r0], r1
	mov	[x4], rax
	mov	r0, rax
	mov	r2, x1
	mov	r3, x0
	call	__muldi3
	mov	r3, t0
	mov	r0, x3
	mov	r1, x2
	mov	r2, rax
	call	__subdi3
	mov	r0, x4
add	r0, 8
add	x4, 12
	mov	[x4], t0
	mov	[r0], rax
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function gcvt
gcvt:                                   // @gcvt
// %bb.0:
sub	rsp, 1080
	mov	[rsp+1076], x0
	mov	[rsp+1072], x1
	mov	[rsp+1068], x2
	mov	[rsp+1064], x3
	mov	[rsp+1060], x4
	mov	[rsp+1056], x5
	mov	[rsp+1052], x6
	mov	[rsp+1048], x7
	mov	[rsp+1044], x8
	mov	[rsp+1040], x9
	mov	[rsp+1036], x10
	mov	[rsp+1032], x11
	mov	[rsp+1028], x12
	mov	x0, r3
	mov	x2, r2
	mov	x3, r1
	mov	x4, r0
	jz	x0, .LBB104_115
	jmp	.LBB104_1
.LBB104_1:
	mov	r0, 0
	jg	x2, r0, .LBB104_3
	jmp	.LBB104_2
.LBB104_2:
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	jmp	.LBB104_115
.LBB104_3:
	mov	r1, -113
	mov	r0, x2
	call	__bit_and
	mov	x1, rax
	mov	r1, 112
	mov	x5, 112
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x5, x2
	mov	r0, rax
	mov	r1, x5
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, x2
add	r1, -112
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	mov	x5, x1
add	x5, 112
	mov	r1, 1048176
	mov	r0, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -1048064
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	x6, rax
	mov	r0, x5
	call	__bit_not
	mov	r1, 1048176
	mov	r0, rax
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	x5, rax
	mov	x6, x5
add	x6, 1048576
	mov	r0, 625
	mov	x1, rsp
add	x1, 4
	jl	x2, r0, .LBB104_6
	jmp	.LBB104_4
.LBB104_4:
	mov	r0, x6
	call	malloc
	mov	x1, rax
	jnz	x1, .LBB104_6
	jmp	.LBB104_5
.LBB104_5:
	mov	r0, x4
	mov	r1, x3
	mov	r2, x2
	mov	r3, x0
	call	gcvt_fast
	jmp	.LBB104_115
.LBB104_6:
	mov	r2, x2
add	r2, -1
add	x5, 1048176
	mov	r0, x4
	mov	r1, x3
	mov	r3, x1
	call	d2exp_buffered_n
	mov	x7, rax
	mov	r1, -2147483648
add	x5, 399
	mov	r0, x7
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x6
	call	__bit_xor
	jl	x8, rax, .LBB104_8
	jmp	.LBB104_7
.LBB104_7:
	mov	x7, x5
.LBB104_8:
	add	x7, x1
	mov	r0, [x7]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x7], rax
	mov	r0, x1
	call	__bit_and
	mov	x8, rax
	jz	x8, .LBB104_10
	jmp	.LBB104_9
.LBB104_9:
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x7, rax
	jmp	.LBB104_11
.LBB104_10:
	mov	x7, [x1]
	mov	r0, 5136718
	je	x7, r0, .LBB104_25
	jmp	.LBB104_11
.LBB104_11:
	mov	r1, 255
	mov	r0, x7
	call	__bit_and
	mov	x9, 0
	mov	x11, mcasm_static_6f7acf3033ec5284dc119ee615ec1d1a
	jz	rax, .LBB104_16
	jmp	.LBB104_12
.LBB104_12:                             // %.preheader.i.preheader
	mov	x12, x1
add	x12, 1
	mov	x9, x7
.LBB104_13:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x10, rax
	mov	r0, x9
	call	__bit_and
	mov	r0, x9
	jne	rax, x10, .LBB104_15
	jmp	.LBB104_14
.LBB104_14:                             //   in Loop: Header=BB104_13 Depth=1
	mov	r0, [x12]
	mov	r1, 255
add	x11, 1
	call	__bit_and
	mov	x9, rax
add	x12, 1
	mov	r0, 0
	jnz	x9, .LBB104_13
	jmp	.LBB104_15
.LBB104_15:
	mov	r1, 255
	call	__bit_and
	mov	x9, rax
.LBB104_16:                             // %strcmp.exit
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	je	x9, rax, .LBB104_25
	jmp	.LBB104_17
.LBB104_17:
	jnz	x8, .LBB104_19
	jmp	.LBB104_18
.LBB104_18:
	mov	x7, [x1]
	mov	r0, 7233902
	je	x7, r0, .LBB104_25
	jmp	.LBB104_19
.LBB104_19:
	mov	r1, 255
	mov	r0, x7
	call	__bit_and
	mov	x9, 0
	mov	x11, mcasm_static_d6be6aa1de7347d31fe38817b7c46b0b
	jz	rax, .LBB104_24
	jmp	.LBB104_20
.LBB104_20:                             // %.preheader.i4.preheader
	mov	x12, x1
add	x12, 1
	mov	x9, x7
.LBB104_21:                             // %.preheader.i4
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x10, rax
	mov	r0, x9
	call	__bit_and
	mov	r0, x9
	jne	rax, x10, .LBB104_23
	jmp	.LBB104_22
.LBB104_22:                             //   in Loop: Header=BB104_21 Depth=1
	mov	r0, [x12]
	mov	r1, 255
add	x11, 1
	call	__bit_and
	mov	x9, rax
add	x12, 1
	mov	r0, 0
	jnz	x9, .LBB104_21
	jmp	.LBB104_23
.LBB104_23:
	mov	r1, 255
	call	__bit_and
	mov	x9, rax
.LBB104_24:                             // %strcmp.exit6
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	jne	x9, rax, .LBB104_43
	jmp	.LBB104_25
.LBB104_25:                             // %strcmp.exit.thread
	mov	r0, [x0]
	mov	x3, x0
	mov	r1, -256
add	x3, 1
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x3]
	mov	x4, x0
	mov	r1, -256
add	x4, 2
	call	__bit_and
	mov	r1, 97
	mov	r0, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x4]
	mov	x3, x0
	mov	r1, -256
add	x3, 3
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x4], rax
	mov	r0, [x3]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[x3], rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483023
	jl	rax, r0, .LBB104_115
	jmp	.LBB104_26
.LBB104_26:
	mov	r0, 16384
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB104_28
	jmp	.LBB104_27
.LBB104_27:
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	x3, x1
add	x3, -1
	mov	x4, [x3]
	mov	x5, 0
	mov	x2, 0
	mov	rax, 0
	jmp	.LBB104_33
.LBB104_28:
	mov	r0, 16386
	mov	x2, [r0]
	mov	x3, x1
add	x3, -1
	mov	x4, [x3]
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x5, 0
	jz	x2, .LBB104_33
	jmp	.LBB104_29
.LBB104_29:
	jge	x2, x3, .LBB104_33
	jmp	.LBB104_30
.LBB104_30:                             // %.preheader.i7.preheader
.LBB104_31:                             // %.preheader.i7
                                        // =>This Inner Loop Header: Depth=1
	mov	x5, x2
	mov	r0, x5
add	r0, 1
	mov	x2, [r0]
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	x2, .LBB104_33
	jmp	.LBB104_32
.LBB104_32:                             // %.preheader.i7
                                        //   in Loop: Header=BB104_31 Depth=1
	jl	x2, x3, .LBB104_31
	jmp	.LBB104_33
.LBB104_33:                             // %.loopexit.i
	jne	x2, x3, .LBB104_35
	jmp	.LBB104_34
.LBB104_34:
	call	abort
.LBB104_35:
	mov	r0, 16386
	jz	x5, .LBB104_39
	jmp	.LBB104_36
.LBB104_36:
	mov	r0, [x5]
	mov	r1, r0
	add	r1, x5
	jne	r1, x3, .LBB104_38
	jmp	.LBB104_37
.LBB104_37:
	add	r0, x4
	mov	[x5], r0
	mov	x3, x5
	jmp	.LBB104_40
.LBB104_38:
add	x5, 1
	mov	r0, x5
.LBB104_39:
	mov	[r0], x3
	mov	[x1], x2
.LBB104_40:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB104_115
	jmp	.LBB104_41
.LBB104_41:
	mov	r0, [x3]
	mov	r1, r0
	add	r1, x3
	jne	r1, x2, .LBB104_115
	jmp	.LBB104_42
.LBB104_42:
	add	r0, [x2]
	mov	[x3], r0
add	x2, 1
	mov	r0, [x2]
add	x3, 1
	mov	[x3], r0
	jmp	.LBB104_115
.LBB104_43:
	mov	x11, mcasm_static_b1a7585fb8349acaafdbdb40ab01c310
	mov	x9, x7
	mov	x12, x1
	jnz	x8, .LBB104_49
	jmp	.LBB104_44
.LBB104_44:
	mov	x7, [x1]
	mov	r1, 1768320585
	mov	x9, x7
	mov	x12, x1
	jne	x7, r1, .LBB104_49
	jmp	.LBB104_45
.LBB104_45:                             // %.preheader5.i10.preheader
	mov	x9, -2139062144
	mov	x12, x1
.LBB104_46:                             // %.preheader5.i10
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x9, .LBB104_63
	jmp	.LBB104_47
.LBB104_47:                             //   in Loop: Header=BB104_46 Depth=1
add	x12, 4
add	x11, 4
	mov	r1, [x12]
	mov	r0, [x11]
	je	r1, r0, .LBB104_46
	jmp	.LBB104_48
.LBB104_48:
	mov	x9, r1
.LBB104_49:
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	x10, 0
	jz	rax, .LBB104_54
	jmp	.LBB104_50
.LBB104_50:                             // %.preheader.i8.preheader
add	x12, 1
.LBB104_51:                             // %.preheader.i8
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x10, rax
	mov	r0, x9
	call	__bit_and
	mov	r0, x9
	jne	rax, x10, .LBB104_53
	jmp	.LBB104_52
.LBB104_52:                             //   in Loop: Header=BB104_51 Depth=1
	mov	r0, [x12]
	mov	r1, 255
add	x11, 1
	call	__bit_and
	mov	x9, rax
add	x12, 1
	mov	r0, 0
	jnz	x9, .LBB104_51
	jmp	.LBB104_53
.LBB104_53:
	mov	r1, 255
	call	__bit_and
	mov	x10, rax
.LBB104_54:                             // %strcmp.exit11
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	je	x10, rax, .LBB104_63
	jmp	.LBB104_55
.LBB104_55:
	jnz	x8, .LBB104_57
	jmp	.LBB104_56
.LBB104_56:
	mov	x7, [x1]
	mov	r0, 6712937
	je	x7, r0, .LBB104_63
	jmp	.LBB104_57
.LBB104_57:
	mov	r1, 255
	mov	r0, x7
	call	__bit_and
	mov	x9, 0
	mov	x11, mcasm_static_b9e802fbaf641deea9821b02daddc0fb
	jz	rax, .LBB104_62
	jmp	.LBB104_58
.LBB104_58:                             // %.preheader.i12.preheader
	mov	x12, x1
add	x12, 1
	mov	x9, x7
.LBB104_59:                             // %.preheader.i12
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x10, rax
	mov	r0, x9
	call	__bit_and
	mov	r0, x9
	jne	rax, x10, .LBB104_61
	jmp	.LBB104_60
.LBB104_60:                             //   in Loop: Header=BB104_59 Depth=1
	mov	r0, [x12]
	mov	r1, 255
add	x11, 1
	call	__bit_and
	mov	x9, rax
add	x12, 1
	mov	r0, 0
	jnz	x9, .LBB104_59
	jmp	.LBB104_61
.LBB104_61:
	mov	r1, 255
	call	__bit_and
	mov	x9, rax
.LBB104_62:                             // %strcmp.exit15
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	jne	x9, rax, .LBB104_81
	jmp	.LBB104_63
.LBB104_63:                             // %strcmp.exit11.thread
	mov	r0, [x0]
	mov	x3, x0
	mov	r1, -256
add	x3, 1
	call	__bit_and
	mov	r1, 105
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x3]
	mov	x4, x0
	mov	r1, -256
add	x4, 2
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x4]
	mov	x3, x0
	mov	r1, -256
add	x3, 3
	call	__bit_and
	mov	r1, 102
	mov	r0, rax
	call	__bit_or
	mov	[x4], rax
	mov	r0, [x3]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[x3], rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483023
	jl	rax, r0, .LBB104_115
	jmp	.LBB104_64
.LBB104_64:
	mov	r0, 16384
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB104_66
	jmp	.LBB104_65
.LBB104_65:
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	x3, x1
add	x3, -1
	mov	x4, [x3]
	mov	x5, 0
	mov	x2, 0
	mov	rax, 0
	jmp	.LBB104_71
.LBB104_66:
	mov	r0, 16386
	mov	x2, [r0]
	mov	x3, x1
add	x3, -1
	mov	x4, [x3]
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x5, 0
	jz	x2, .LBB104_71
	jmp	.LBB104_67
.LBB104_67:
	jge	x2, x3, .LBB104_71
	jmp	.LBB104_68
.LBB104_68:                             // %.preheader.i19.preheader
.LBB104_69:                             // %.preheader.i19
                                        // =>This Inner Loop Header: Depth=1
	mov	x5, x2
	mov	r0, x5
add	r0, 1
	mov	x2, [r0]
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	x2, .LBB104_71
	jmp	.LBB104_70
.LBB104_70:                             // %.preheader.i19
                                        //   in Loop: Header=BB104_69 Depth=1
	jl	x2, x3, .LBB104_69
	jmp	.LBB104_71
.LBB104_71:                             // %.loopexit.i18
	jne	x2, x3, .LBB104_73
	jmp	.LBB104_72
.LBB104_72:
	call	abort
.LBB104_73:
	mov	r0, 16386
	jz	x5, .LBB104_77
	jmp	.LBB104_74
.LBB104_74:
	mov	r0, [x5]
	mov	r1, r0
	add	r1, x5
	jne	r1, x3, .LBB104_76
	jmp	.LBB104_75
.LBB104_75:
	add	r0, x4
	mov	[x5], r0
	mov	x3, x5
	jmp	.LBB104_78
.LBB104_76:
add	x5, 1
	mov	r0, x5
.LBB104_77:
	mov	[r0], x3
	mov	[x1], x2
.LBB104_78:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB104_115
	jmp	.LBB104_79
.LBB104_79:
	mov	r0, [x3]
	mov	r1, r0
	add	r1, x3
	jne	r1, x2, .LBB104_115
	jmp	.LBB104_80
.LBB104_80:
	add	r0, [x2]
	mov	[x3], r0
add	x2, 1
	mov	r0, [x2]
add	x3, 1
	mov	[x3], r0
	jmp	.LBB104_115
.LBB104_81:
	mov	x11, mcasm_static_557d67ef4a6ee5836caf0dd5d257f148
	mov	x9, x7
	mov	x12, x1
	jnz	x8, .LBB104_87
	jmp	.LBB104_82
.LBB104_82:
	mov	x7, [x1]
	mov	r1, 1718503725
	mov	x9, x7
	mov	x12, x1
	jne	x7, r1, .LBB104_87
	jmp	.LBB104_83
.LBB104_83:                             // %.preheader5.i23.preheader
	mov	x9, -2139062144
	mov	x12, x1
.LBB104_84:                             // %.preheader5.i23
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x9, .LBB104_105
	jmp	.LBB104_85
.LBB104_85:                             //   in Loop: Header=BB104_84 Depth=1
add	x12, 4
add	x11, 4
	mov	r1, [x12]
	mov	r0, [x11]
	je	r1, r0, .LBB104_84
	jmp	.LBB104_86
.LBB104_86:
	mov	x9, r1
.LBB104_87:
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	x10, 0
	jz	rax, .LBB104_92
	jmp	.LBB104_88
.LBB104_88:                             // %.preheader.i21.preheader
add	x12, 1
.LBB104_89:                             // %.preheader.i21
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x10, rax
	mov	r0, x9
	call	__bit_and
	mov	r0, x9
	jne	rax, x10, .LBB104_91
	jmp	.LBB104_90
.LBB104_90:                             //   in Loop: Header=BB104_89 Depth=1
	mov	r0, [x12]
	mov	r1, 255
add	x11, 1
	call	__bit_and
	mov	x9, rax
add	x12, 1
	mov	r0, 0
	jnz	x9, .LBB104_89
	jmp	.LBB104_91
.LBB104_91:
	mov	r1, 255
	call	__bit_and
	mov	x10, rax
.LBB104_92:                             // %strcmp.exit24
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	je	x10, rax, .LBB104_105
	jmp	.LBB104_93
.LBB104_93:
	mov	x9, mcasm_static_fab2707d6a59281c3d2f28ed4a57dc87
	mov	x10, x1
	jnz	x8, .LBB104_99
	jmp	.LBB104_94
.LBB104_94:
	mov	x7, [x1]
	mov	r1, 1718511917
	mov	x10, x1
	jne	x7, r1, .LBB104_99
	jmp	.LBB104_95
.LBB104_95:                             // %.preheader5.i27.preheader
	mov	x7, -2139062144
	mov	x10, x1
.LBB104_96:                             // %.preheader5.i27
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x7, .LBB104_105
	jmp	.LBB104_97
.LBB104_97:                             //   in Loop: Header=BB104_96 Depth=1
add	x10, 4
add	x9, 4
	mov	r1, [x10]
	mov	r0, [x9]
	je	r1, r0, .LBB104_96
	jmp	.LBB104_98
.LBB104_98:
	mov	x7, r1
.LBB104_99:
	mov	r1, 255
	mov	r0, x7
	call	__bit_and
	mov	x8, 0
	jz	rax, .LBB104_104
	jmp	.LBB104_100
.LBB104_100:                            // %.preheader.i25.preheader
add	x10, 1
.LBB104_101:                            // %.preheader.i25
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x8, rax
	mov	r0, x7
	call	__bit_and
	mov	r0, x7
	jne	rax, x8, .LBB104_103
	jmp	.LBB104_102
.LBB104_102:                            //   in Loop: Header=BB104_101 Depth=1
	mov	r0, [x10]
	mov	r1, 255
add	x9, 1
	call	__bit_and
	mov	x7, rax
add	x10, 1
	mov	r0, 0
	jnz	x7, .LBB104_101
	jmp	.LBB104_103
.LBB104_103:
	mov	r1, 255
	call	__bit_and
	mov	x8, rax
.LBB104_104:                            // %strcmp.exit28
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	jne	x8, rax, .LBB104_107
	jmp	.LBB104_105
.LBB104_105:                            // %strcmp.exit24.thread
	mov	r0, [x0]
	mov	x3, x0
	mov	r1, -256
add	x3, 1
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x3]
	mov	x4, x0
	mov	r1, -256
add	x4, 2
	call	__bit_and
	mov	r1, 105
	mov	r0, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x4]
	mov	x3, x0
	mov	r1, -256
add	x3, 3
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x4], rax
	mov	r0, [x3]
	mov	x4, x0
	mov	r1, -256
add	x4, 4
	call	__bit_and
	mov	r1, 102
	mov	r0, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x4]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[x4], rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483023
	jl	rax, r0, .LBB104_115
	jmp	.LBB104_106
.LBB104_106:
	mov	r0, x1
	call	free
	jmp	.LBB104_115
.LBB104_107:
	mov	r1, rsp
	mov	r0, x1
	call	parse_exp10
	jnz	rax, .LBB104_113
	jmp	.LBB104_108
.LBB104_108:
	mov	r0, [rsp]
	mov	r1, -4
	jl	r0, r1, .LBB104_113
	jmp	.LBB104_109
.LBB104_109:
	jge	r0, x2, .LBB104_113
	jmp	.LBB104_110
.LBB104_110:
	call	__bit_not
	mov	x7, rax
	add	x7, x2
	mov	r1, -2147483648
	mov	x8, -2147483648
	mov	r0, x7
	call	__bit_xor
	mov	r1, 2147483647
	mov	x9, rax
	mov	r0, x9
	call	__bit_and
	mov	r1, -2147483648
	mov	x10, rax
	mov	r0, x9
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x8, x9
	mov	r0, rax
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x7
	call	__bit_and
	mov	r0, x4
	mov	r1, x3
	mov	r2, rax
	mov	r3, x1
	call	d2fixed_buffered_n
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x6
	call	__bit_xor
	jl	x4, rax, .LBB104_112
	jmp	.LBB104_111
.LBB104_111:
	mov	x3, x5
.LBB104_112:
	add	x3, x1
	mov	r0, [x3]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x3], rax
.LBB104_113:
	mov	r0, x1
	call	trim_trailing_zeros_g
	mov	r0, x1
	call	strlen
add	rax, 1
	mov	r0, x0
	mov	r1, x1
	mov	r2, rax
	call	memcpy
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483023
	jl	rax, r0, .LBB104_115
	jmp	.LBB104_114
.LBB104_114:
	mov	r0, x1
	call	free
.LBB104_115:                            // %free.exit
	mov	rax, x0
	mov	x12, [rsp+1028]
	mov	x11, [rsp+1032]
	mov	x10, [rsp+1036]
	mov	x9, [rsp+1040]
	mov	x8, [rsp+1044]
	mov	x7, [rsp+1048]
	mov	x6, [rsp+1052]
	mov	x5, [rsp+1056]
	mov	x4, [rsp+1060]
	mov	x3, [rsp+1064]
	mov	x2, [rsp+1068]
	mov	x1, [rsp+1072]
	mov	x0, [rsp+1076]
add	rsp, 1080
	ret
// -- End function
// -- Begin function parse_exp10
parse_exp10:                            // @parse_exp10
// %bb.0:
sub	rsp, 28
	mov	[rsp+24], x0
	mov	[rsp+20], x1
	mov	[rsp+16], x2
	mov	[rsp+12], x3
	mov	[rsp+8], x4
	mov	[rsp+4], x5
	mov	[rsp], x6
	mov	x0, r1
	mov	r1, 3
	mov	x1, r0
	call	__bit_and
	mov	x2, rax
	mov	x4, x1
	jz	x2, .LBB105_2
	jmp	.LBB105_1
.LBB105_1:                              // %.preheader12.preheader
	mov	x3, x1
add	x3, 1
	mov	x5, 101
	mov	x4, x1
	jmp	.LBB105_4
.LBB105_2:                              // %.loopexit9.i
	mov	x3, [x4]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	x5, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x5, .LBB105_9
	jmp	.LBB105_3
.LBB105_3:                              // %.preheader5.i.preheader
	jmp	.LBB105_7
.LBB105_4:                              // %.preheader12
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB105_12
	jmp	.LBB105_5
.LBB105_5:                              // %.preheader12
                                        //   in Loop: Header=BB105_4 Depth=1
	je	rax, x5, .LBB105_27
	jmp	.LBB105_6
.LBB105_6:                              //   in Loop: Header=BB105_4 Depth=1
	mov	r1, 3
add	x4, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
	jz	rax, .LBB105_2
	jmp	.LBB105_4
.LBB105_7:                              // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 1701143909
	mov	r0, x3
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x5, .LBB105_9
	jmp	.LBB105_8
.LBB105_8:                              //   in Loop: Header=BB105_7 Depth=1
add	x4, 4
	mov	x3, [x4]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x5, .LBB105_7
	jmp	.LBB105_9
.LBB105_9:                              // %.loopexit6.i.preheader
add	x4, -1
	mov	x3, 101
.LBB105_10:                             // %.loopexit6.i
                                        // =>This Inner Loop Header: Depth=1
add	x4, 1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	je	rax, x3, .LBB105_26
	jmp	.LBB105_11
.LBB105_11:                             // %.loopexit6.i
                                        //   in Loop: Header=BB105_10 Depth=1
	jnz	rax, .LBB105_10
	jmp	.LBB105_12
.LBB105_12:                             // %.loopexit
	jz	x2, .LBB105_14
	jmp	.LBB105_13
.LBB105_13:                             // %.preheader7.preheader
	mov	x2, x1
add	x2, 1
	mov	x3, 69
	jmp	.LBB105_16
.LBB105_14:                             // %.loopexit9.i2
	mov	x2, [x1]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	x3, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x3, .LBB105_21
	jmp	.LBB105_15
.LBB105_15:                             // %.preheader5.i4.preheader
	jmp	.LBB105_19
.LBB105_16:                             // %.preheader7
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB105_37
	jmp	.LBB105_17
.LBB105_17:                             // %.preheader7
                                        //   in Loop: Header=BB105_16 Depth=1
	je	rax, x3, .LBB105_25
	jmp	.LBB105_18
.LBB105_18:                             //   in Loop: Header=BB105_16 Depth=1
	mov	r1, 3
add	x1, 1
	mov	r0, x2
	call	__bit_and
add	x2, 1
	jz	rax, .LBB105_14
	jmp	.LBB105_16
.LBB105_19:                             // %.preheader5.i4
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 1162167621
	mov	r0, x2
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x3, .LBB105_21
	jmp	.LBB105_20
.LBB105_20:                             //   in Loop: Header=BB105_19 Depth=1
add	x1, 4
	mov	x2, [x1]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x3, .LBB105_19
	jmp	.LBB105_21
.LBB105_21:                             // %.loopexit6.i3.preheader
add	x1, -1
	mov	x2, 69
.LBB105_22:                             // %.loopexit6.i3
                                        // =>This Inner Loop Header: Depth=1
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB105_36
	jmp	.LBB105_23
.LBB105_23:                             // %.loopexit6.i3
                                        //   in Loop: Header=BB105_22 Depth=1
	jne	rax, x2, .LBB105_22
	jmp	.LBB105_24
.LBB105_24:                             // %strchr.exit.loopexit
	jmp	.LBB105_28
.LBB105_25:                             // %strchr.exit.loopexit2
	jmp	.LBB105_28
.LBB105_26:                             // %strchr.exit.loopexit3
	mov	x1, x4
	jmp	.LBB105_28
.LBB105_27:                             // %strchr.exit.loopexit5
	mov	x1, x4
.LBB105_28:                             // %strchr.exit
	mov	x3, x1
add	x3, 1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, 45
	je	rax, r0, .LBB105_31
	jmp	.LBB105_29
.LBB105_29:                             // %strchr.exit
	mov	r0, 43
	mov	x4, 1
	jne	rax, r0, .LBB105_32
	jmp	.LBB105_30
.LBB105_30:
add	x1, 2
	mov	x3, x1
	jmp	.LBB105_32
.LBB105_31:
add	x1, 2
	mov	x4, -1
	mov	x3, x1
.LBB105_32:
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	x1, rax
	mov	r0, x1
add	r0, -58
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, -1
	mov	r0, rax
	call	__bit_xor
	mov	r0, -2147483402
	jl	rax, r0, .LBB105_38
	jmp	.LBB105_33
.LBB105_33:                             // %.preheader.preheader
add	x3, 1
	mov	x2, 0
	mov	x5, -2147483638
.LBB105_34:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	x6, x2
add	x1, -48
	mov	r1, 255
	mul	x6, 10
	mov	r0, x1
	call	__bit_and
	mov	r0, [x3]
	mov	x2, rax
	mov	r1, 255
	add	x2, x6
	call	__bit_and
	mov	x1, rax
	mov	r0, x1
add	r0, -48
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	x3, 1
	mov	r0, rax
	call	__bit_xor
	jl	rax, x5, .LBB105_34
	jmp	.LBB105_35
.LBB105_35:
	mul	x2, x4
	mov	[x0], x2
	mov	x2, 0
	jmp	.LBB105_38
.LBB105_36:                             // %strchr.exit5.thread.loopexit
	mov	x2, -1
	jmp	.LBB105_38
.LBB105_37:                             // %strchr.exit5.thread.loopexit1
	mov	x2, -1
.LBB105_38:                             // %strchr.exit5.thread
	mov	rax, x2
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
// -- Begin function trim_trailing_zeros_g
trim_trailing_zeros_g:                  // @trim_trailing_zeros_g
// %bb.0:
sub	rsp, 40
	mov	[rsp+36], x0
	mov	[rsp+32], x1
	mov	[rsp+28], x2
	mov	[rsp+24], x3
	mov	[rsp+20], x4
	mov	[rsp+16], x5
	mov	[rsp+12], x6
	mov	[rsp+8], x7
	mov	[rsp+4], x8
	mov	[rsp], x9
	mov	r1, 3
	mov	x1, r0
	call	__bit_and
	mov	x2, rax
	mov	x0, x1
	jz	x2, .LBB106_2
	jmp	.LBB106_1
.LBB106_1:                              // %.preheader31.preheader
	mov	x3, x1
add	x3, 1
	mov	x4, 101
	mov	x0, x1
	jmp	.LBB106_4
.LBB106_2:                              // %.loopexit9.i
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	x4, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB106_9
	jmp	.LBB106_3
.LBB106_3:                              // %.preheader5.i.preheader
	jmp	.LBB106_7
.LBB106_4:                              // %.preheader31
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB106_12
	jmp	.LBB106_5
.LBB106_5:                              // %.preheader31
                                        //   in Loop: Header=BB106_4 Depth=1
	je	rax, x4, .LBB106_37
	jmp	.LBB106_6
.LBB106_6:                              //   in Loop: Header=BB106_4 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
	jz	rax, .LBB106_2
	jmp	.LBB106_4
.LBB106_7:                              // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 1701143909
	mov	r0, x3
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB106_9
	jmp	.LBB106_8
.LBB106_8:                              //   in Loop: Header=BB106_7 Depth=1
add	x0, 4
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x4, .LBB106_7
	jmp	.LBB106_9
.LBB106_9:                              // %.loopexit6.i.preheader
add	x0, -1
	mov	x3, 101
.LBB106_10:                             // %.loopexit6.i
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	je	rax, x3, .LBB106_36
	jmp	.LBB106_11
.LBB106_11:                             // %.loopexit6.i
                                        //   in Loop: Header=BB106_10 Depth=1
	jnz	rax, .LBB106_10
	jmp	.LBB106_12
.LBB106_12:                             // %.loopexit29
	mov	x0, x1
	jz	x2, .LBB106_14
	jmp	.LBB106_13
.LBB106_13:                             // %.preheader25.preheader
	mov	x3, x1
add	x3, 1
	mov	x4, 69
	mov	x0, x1
	jmp	.LBB106_16
.LBB106_14:                             // %.loopexit9.i5
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	x4, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB106_21
	jmp	.LBB106_15
.LBB106_15:                             // %.preheader5.i7.preheader
	jmp	.LBB106_19
.LBB106_16:                             // %.preheader25
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB106_24
	jmp	.LBB106_17
.LBB106_17:                             // %.preheader25
                                        //   in Loop: Header=BB106_16 Depth=1
	je	rax, x4, .LBB106_35
	jmp	.LBB106_18
.LBB106_18:                             //   in Loop: Header=BB106_16 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
	jz	rax, .LBB106_14
	jmp	.LBB106_16
.LBB106_19:                             // %.preheader5.i7
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 1162167621
	mov	r0, x3
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB106_21
	jmp	.LBB106_20
.LBB106_20:                             //   in Loop: Header=BB106_19 Depth=1
add	x0, 4
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x4, .LBB106_19
	jmp	.LBB106_21
.LBB106_21:                             // %.loopexit6.i6.preheader
add	x0, -1
	mov	x3, 69
.LBB106_22:                             // %.loopexit6.i6
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	je	rax, x3, .LBB106_34
	jmp	.LBB106_23
.LBB106_23:                             // %.loopexit6.i6
                                        //   in Loop: Header=BB106_22 Depth=1
	jnz	rax, .LBB106_22
	jmp	.LBB106_24
.LBB106_24:                             // %.loopexit
	mov	x3, x1
	jz	x2, .LBB106_29
	jmp	.LBB106_25
.LBB106_25:
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x0, x1
	jz	rax, .LBB106_33
	jmp	.LBB106_26
.LBB106_26:                             // %.preheader1.i.preheader
	mov	x3, x1
add	x3, 1
	mov	x0, x1
	jmp	.LBB106_28
.LBB106_27:                             //   in Loop: Header=BB106_28 Depth=1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
add	x3, 1
	jz	rax, .LBB106_33
	jmp	.LBB106_28
.LBB106_28:                             // %.preheader1.i
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r1, 3
	mov	r0, x0
	call	__bit_and
	jnz	rax, .LBB106_27
	jmp	.LBB106_29
.LBB106_29:                             // %.loopexit.i.preheader
	mov	x4, x3
add	x4, -1
	mov	x5, -2139062144
.LBB106_30:                             // %.loopexit.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [x3]
	mov	r0, 16843008
	sub	r0, r1
	mov	x0, x4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x3, 4
add	x4, 4
	je	rax, x5, .LBB106_30
	jmp	.LBB106_31
.LBB106_31:                             // %.preheader.i.preheader
	mov	x4, -4
.LBB106_32:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
	add	r0, x4
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x0, 1
add	x4, 1
	jnz	rax, .LBB106_32
	jmp	.LBB106_33
.LBB106_33:                             // %strlen.exit
	jmp	.LBB106_38
.LBB106_34:                             // %strchr.exit.loopexit
	jmp	.LBB106_38
.LBB106_35:                             // %strchr.exit.loopexit4
	jmp	.LBB106_38
.LBB106_36:                             // %strchr.exit.loopexit5
	jmp	.LBB106_38
.LBB106_37:                             // %strchr.exit.loopexit7
.LBB106_38:                             // %strchr.exit
	jz	x2, .LBB106_40
	jmp	.LBB106_39
.LBB106_39:                             // %.preheader.preheader
	mov	x2, x1
add	x2, 1
	mov	x3, 46
	jmp	.LBB106_42
.LBB106_40:                             // %.loopexit9.i9
	mov	x2, [x1]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	x3, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x3, .LBB106_47
	jmp	.LBB106_41
.LBB106_41:                             // %.preheader5.i12.preheader
	jmp	.LBB106_45
.LBB106_42:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB106_87
	jmp	.LBB106_43
.LBB106_43:                             // %.preheader
                                        //   in Loop: Header=BB106_42 Depth=1
	je	rax, x3, .LBB106_51
	jmp	.LBB106_44
.LBB106_44:                             //   in Loop: Header=BB106_42 Depth=1
	mov	r1, 3
add	x1, 1
	mov	r0, x2
	call	__bit_and
add	x2, 1
	jz	rax, .LBB106_40
	jmp	.LBB106_42
.LBB106_45:                             // %.preheader5.i12
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 774778414
	mov	r0, x2
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x3, .LBB106_47
	jmp	.LBB106_46
.LBB106_46:                             //   in Loop: Header=BB106_45 Depth=1
add	x1, 4
	mov	x2, [x1]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x3, .LBB106_45
	jmp	.LBB106_47
.LBB106_47:                             // %.loopexit6.i10.preheader
add	x1, -1
	mov	x2, 46
.LBB106_48:                             // %.loopexit6.i10
                                        // =>This Inner Loop Header: Depth=1
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	je	rax, x2, .LBB106_50
	jmp	.LBB106_49
.LBB106_49:                             // %.loopexit6.i10
                                        //   in Loop: Header=BB106_48 Depth=1
	jnz	rax, .LBB106_48
	jmp	.LBB106_50
.LBB106_50:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
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
add	rax, 1
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	x1, rax
	jmp	.LBB106_52
.LBB106_51:                             // %strchr.exit13.loopexit
.LBB106_52:                             // %strchr.exit13
	jz	x1, .LBB106_87
	jmp	.LBB106_53
.LBB106_53:                             // %strchr.exit13
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	jge	rax, x2, .LBB106_87
	jmp	.LBB106_54
.LBB106_54:
add	x1, 1
	mov	r0, 1
	mov	r2, 0
	mov	r3, -3
	mov	x4, 48
	mov	x3, x0
.LBB106_55:                             // =>This Inner Loop Header: Depth=1
	mov	r1, -2147483648
	mov	x2, x3
	mov	x7, r0
	mov	x8, r3
	mov	x9, r2
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	jle	rax, x3, .LBB106_57
	jmp	.LBB106_56
.LBB106_56:                             //   in Loop: Header=BB106_55 Depth=1
	mov	x3, x2
add	x3, -1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, x7
add	r0, -1
	mov	r3, x8
add	r3, -1
	mov	r2, x9
add	r2, -1
	je	rax, x4, .LBB106_55
	jmp	.LBB106_57
.LBB106_57:
	mov	r0, x2
	mov	r1, x1
	call	__bit_xor
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
	mov	x3, rax
add	x3, 1
	mov	r1, 3
	add	x2, x3
	mov	r0, x0
	call	__bit_and
	mov	x1, x0
	jz	rax, .LBB106_62
	jmp	.LBB106_58
.LBB106_58:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x4, x0
	jz	rax, .LBB106_66
	jmp	.LBB106_59
.LBB106_59:                             // %.preheader1.i14.preheader
	mov	x1, x0
add	x1, 1
	mov	x4, x0
	jmp	.LBB106_61
.LBB106_60:                             //   in Loop: Header=BB106_61 Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB106_66
	jmp	.LBB106_61
.LBB106_61:                             // %.preheader1.i14
                                        // =>This Inner Loop Header: Depth=1
add	x4, 1
	mov	r1, 3
	mov	r0, x4
	call	__bit_and
	jnz	rax, .LBB106_60
	jmp	.LBB106_62
.LBB106_62:                             // %.loopexit.i15.preheader
	mov	x5, x1
add	x5, -1
	mov	x6, -2139062144
.LBB106_63:                             // %.loopexit.i15
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [x1]
	mov	r0, 16843008
	sub	r0, r1
	mov	x4, x5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x1, 4
add	x5, 4
	je	rax, x6, .LBB106_63
	jmp	.LBB106_64
.LBB106_64:                             // %.preheader.i16.preheader
	mov	x5, -4
.LBB106_65:                             // %.preheader.i16
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x1
	add	r0, x5
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x4, 1
add	x5, 1
	jnz	rax, .LBB106_65
	jmp	.LBB106_66
.LBB106_66:                             // %strlen.exit17
	mov	x1, x4
	sub	x1, x0
	mov	r1, -2147483648
add	x1, 1
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x0
	call	__bit_xor
	jge	rax, x5, .LBB106_76
	jmp	.LBB106_67
.LBB106_67:
	mov	x5, x0
	add	x5, x1
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x6, .LBB106_76
	jmp	.LBB106_68
.LBB106_68:
	mov	r1, -2147483648
	add	x2, x1
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB106_73
	jmp	.LBB106_69
.LBB106_69:
	mov	r0, x5
	mov	r1, x2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB106_74
	jmp	.LBB106_70
.LBB106_70:                             // %.preheader.i19.preheader
	mov	x2, 0
	sub	x2, x0
	mov	x5, x0
	add	x5, x4
	add	x7, x3
	add	x8, x3
	mov	x3, -2147483645
.LBB106_71:                             // %.preheader.i19
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x5
	add	r0, x2
add	r0, -3
	mov	r0, [r0]
	mov	r1, x8
	add	r1, x4
	mov	[r1], r0
add	x2, -4
add	x7, -4
	mov	x1, x4
	add	x1, x2
add	x1, 1
	mov	r1, -2147483648
add	x8, -4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x3, .LBB106_71
	jmp	.LBB106_72
.LBB106_72:                             // %.loopexit9.i20.loopexit
	add	x0, x1
	add	x7, x4
	mov	x2, x7
	mov	x5, x0
.LBB106_73:                             // %.loopexit9.i20
	jz	x1, .LBB106_87
	jmp	.LBB106_74
.LBB106_74:                             // %.preheader227
add	x5, -1
add	x2, -1
.LBB106_75:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
add	x1, -1
	call	__bit_and
	mov	r0, [x2]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x2], rax
add	x5, -1
add	x2, -1
	jz	x1, .LBB106_87
	jmp	.LBB106_75
.LBB106_76:
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB106_84
	jmp	.LBB106_77
.LBB106_77:
	mov	r0, x2
	mov	r1, x0
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB106_85
	jmp	.LBB106_78
.LBB106_78:
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB106_80
	jmp	.LBB106_79
.LBB106_79:                             // %.preheader12.i.preheader
	add	x3, x9
	mov	x2, -2147483633
	mov	r0, x0
	jmp	.LBB106_82
.LBB106_80:                             // %.preheader237
	mov	x3, -2147483645
	jmp	.LBB106_83
.LBB106_81:
	add	x3, x0
	mov	r0, 3
	mov	x2, x3
	jg	x1, r0, .LBB106_80
	jmp	.LBB106_84
.LBB106_82:                             // %.preheader12.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [r0]
	mov	r2, r0
	add	r2, x3
	mov	r3, r0
add	r3, 4
	mov	[r2], r1
	mov	r1, [r3]
	mov	r3, r2
add	r3, 4
	mov	[r3], r1
	mov	r1, r0
add	r1, 8
	mov	r1, [r1]
	mov	r3, r2
add	r3, 8
add	r2, 12
	mov	[r3], r1
add	r0, 12
	mov	r0, [r0]
add	x0, 16
add	x1, -16
	mov	r1, -2147483648
	mov	[r2], r0
	mov	r0, x1
	call	__bit_xor
	mov	r0, x0
	jg	rax, x2, .LBB106_82
	jmp	.LBB106_81
.LBB106_83:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
add	x0, 4
	mov	[x2], r0
add	x1, -4
	mov	r1, -2147483648
add	x2, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x3, .LBB106_83
	jmp	.LBB106_84
.LBB106_84:                             // %.loopexit11.i
	jz	x1, .LBB106_87
	jmp	.LBB106_85
.LBB106_85:                             // %.preheader232
	mov	x5, x2
.LBB106_86:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
add	x1, -1
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x2]
	mov	x3, rax
	mov	r1, -256
add	x5, 1
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x2], rax
	mov	x2, x5
	jnz	x1, .LBB106_86
	jmp	.LBB106_87
.LBB106_87:                             // %memmove.exit
	mov	x9, [rsp]
	mov	x8, [rsp+4]
	mov	x7, [rsp+8]
	mov	x6, [rsp+12]
	mov	x5, [rsp+16]
	mov	x4, [rsp+20]
	mov	x3, [rsp+24]
	mov	x2, [rsp+28]
	mov	x1, [rsp+32]
	mov	x0, [rsp+36]
add	rsp, 40
	ret
// -- End function
// -- Begin function gcvt_fast
gcvt_fast:                              // @gcvt_fast
// %bb.0:
sub	rsp, 116
	mov	[rsp+112], x0
	mov	[rsp+108], x1
	mov	[rsp+104], x2
	mov	[rsp+100], x3
	mov	[rsp+96], x4
	mov	[rsp+92], x5
	mov	[rsp+88], x6
	mov	[rsp+84], x7
	mov	[rsp+80], x8
	mov	[rsp+76], x9
	mov	[rsp+72], x10
	mov	[rsp+68], x11
	mov	[rsp+64], x12
	mov	x0, r3
	mov	x3, r2
	mov	x6, r1
	mov	x5, r0
	jz	x0, .LBB107_69
	jmp	.LBB107_1
.LBB107_1:
	mov	r0, 0
	jg	x3, r0, .LBB107_3
	jmp	.LBB107_2
.LBB107_2:
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	jmp	.LBB107_69
.LBB107_3:
	mov	r0, x3
	call	__bit_not
	mov	r1, 63
	mov	r0, rax
	call	__bit_and
	mov	r1, 63
	mov	x1, rax
	mov	r0, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	x2, x3
add	x2, -63
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	x1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	x4, rax
	mov	r0, x5
	mov	r1, x6
	mov	r2, x5
	mov	r3, x6
	call	__unorddf2
	jz	rax, .LBB107_5
	jmp	.LBB107_4
.LBB107_4:
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	x1, x0
add	x1, 1
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 97
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x1, x0
add	x1, 2
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x1, x0
add	x1, 3
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	jmp	.LBB107_69
.LBB107_5:
	mov	r1, 2147483647
	mov	r0, x6
	call	__bit_and
	mov	r2, -1
	mov	r3, 2146435071
	mov	x2, -1
	mov	r0, x5
	mov	r1, rax
	call	__gtdf2
	jl	rax, x1, .LBB107_9
	jmp	.LBB107_6
.LBB107_6:
	mov	r2, 0
	mov	r3, 0
	mov	r0, x5
	mov	r1, x6
	call	__ltdf2
	mov	x1, x0
	jg	rax, x2, .LBB107_8
	jmp	.LBB107_7
.LBB107_7:
	mov	r0, [x0]
	mov	x1, x0
	mov	r1, -256
add	x1, 1
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
.LBB107_8:
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 105
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x2, x1
add	x2, 1
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	mov	x2, x1
add	x2, 2
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 102
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
add	x1, 3
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	jmp	.LBB107_69
.LBB107_9:
	mov	r2, 0
	mov	r3, 0
	mov	r0, x5
	mov	r1, x6
	call	__ltdf2
	mov	x1, x0
	jg	rax, x2, .LBB107_11
	jmp	.LBB107_10
.LBB107_10:
	mov	r0, [x0]
	mov	x1, x0
	mov	r1, -256
add	x1, 1
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[x0], rax
	mov	r0, x6
	call	__bit_xor
	mov	x6, rax
.LBB107_11:
	mov	r2, 0
	mov	r3, 0
	mov	x2, 0
	mov	r0, x5
	mov	r1, x6
	call	__eqdf2
	jz	rax, .LBB107_14
	jmp	.LBB107_12
.LBB107_12:
	mov	r2, 0
	mov	r3, 1076101120
	mov	r0, x5
	mov	r1, x6
	call	__gedf2
	jl	rax, x2, .LBB107_15
	jmp	.LBB107_13
.LBB107_13:                             // %.preheader29.preheader
	mov	x7, 0
	jmp	.LBB107_17
.LBB107_14:
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
add	x1, 1
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	jmp	.LBB107_69
.LBB107_15:                             // %.loopexit30
add	x4, 63
	mov	r2, 0
	mov	r3, 1072693248
	mov	x10, 0
	mov	r0, x5
	mov	r1, x6
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB107_18
	jmp	.LBB107_16
.LBB107_16:                             // %.preheader27.preheader
	mov	x7, 0
	jmp	.LBB107_19
.LBB107_17:                             // %.preheader29
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, -1717986918
	mov	r3, 1069128089
	mov	r0, x5
	mov	r1, x6
	call	__muldf3
	mov	x5, rax
	mov	x6, t0
	mov	r2, 0
	mov	r3, 1076101120
add	x2, 1
	mov	r0, x5
	mov	r1, x6
	call	__ltdf2
	jl	rax, x7, .LBB107_15
	jmp	.LBB107_17
.LBB107_18:                             // %.loopexit28
	mov	x11, x4
add	x11, 1
	jmp	.LBB107_20
.LBB107_19:                             // %.preheader27
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, 0
	mov	r3, 1076101120
	mov	r0, x5
	mov	r1, x6
	call	__muldf3
	mov	x5, rax
	mov	x6, t0
	mov	r2, 0
	mov	r3, 1072693248
add	x2, -1
	mov	r0, x5
	mov	r1, x6
	call	__ltdf2
	jl	rax, x7, .LBB107_19
	jmp	.LBB107_18
.LBB107_20:                             // =>This Inner Loop Header: Depth=1
	mov	r0, x5
	mov	r1, x6
	call	__fixdfsi
	mov	x7, rax
	mov	r0, x7
	mov	x12, rsp
	add	x12, x10
	mov	x8, [x12]
add	r0, 48
	mov	r1, 255
	call	__bit_and
	mov	r1, -256
	mov	x9, rax
	mov	r0, x8
	call	__bit_and
	mov	r1, 255
	mov	x8, rax
	mov	r0, x9
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	[x12], rax
	mov	r0, x7
	call	__floatsidf
	mov	r3, t0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__subdf3
	mov	r2, 0
	mov	r3, 1076101120
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
add	x10, 1
	mov	x5, rax
	mov	x6, t0
	jne	x11, x10, .LBB107_20
	jmp	.LBB107_21
.LBB107_21:
	mov	r0, rsp
	add	r0, x4
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r1, 24
	mov	r0, rax
	call	__bit_sar
	mov	r0, 53
	jl	rax, r0, .LBB107_29
	jmp	.LBB107_22
.LBB107_22:                             // %.preheader26.preheader
	mov	x5, x4
add	x5, -1
	mov	x6, 57
	mov	x7, 1
.LBB107_23:                             // %.preheader26
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, rsp
	add	r0, x5
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jne	rax, x6, .LBB107_26
	jmp	.LBB107_24
.LBB107_24:                             //   in Loop: Header=BB107_23 Depth=1
	mov	x8, rsp
	add	x8, x5
	mov	r0, [x8]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r0, x5
add	x5, -1
add	r0, 1
	mov	[x8], rax
	jg	r0, x7, .LBB107_23
	jmp	.LBB107_25
.LBB107_25:                             // %.preheader25.preheader
	mov	x7, 1
	mov	x8, x4
	jmp	.LBB107_27
.LBB107_26:
	mov	x7, rsp
	add	x7, x5
	mov	x5, [x7]
add	rax, 1
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	jmp	.LBB107_29
.LBB107_27:                             // %.preheader25
                                        // =>This Inner Loop Header: Depth=1
	mov	x9, x8
	mov	x10, rsp
	add	x10, x9
	mov	r0, x10
add	r0, -1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x10]
	mov	r1, -256
	mov	x5, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x10], rax
add	x8, -1
	jg	x9, x7, .LBB107_27
	jmp	.LBB107_28
.LBB107_28:
	mov	r0, [rsp]
	mov	r1, -256
	call	__bit_and
	mov	r1, 49
	mov	r0, rax
	call	__bit_or
	mov	[rsp], rax
add	x2, 1
.LBB107_29:
	mov	r0, 1
	mov	x5, x4
	je	x3, r0, .LBB107_35
	jmp	.LBB107_30
.LBB107_30:                             // %.preheader23.preheader
	mov	x6, x4
add	x6, -1
	mov	x3, 48
	mov	x7, 2
	mov	x5, 1
.LBB107_31:                             // %.preheader23
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, rsp
	add	r0, x6
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jne	rax, x3, .LBB107_33
	jmp	.LBB107_32
.LBB107_32:                             //   in Loop: Header=BB107_31 Depth=1
	mov	r0, x6
add	x6, -1
add	r0, 1
	jg	r0, x7, .LBB107_31
	jmp	.LBB107_35
.LBB107_33:
	mov	x5, x6
	mov	r0, -4
add	x5, 1
	jl	x2, r0, .LBB107_38
	jmp	.LBB107_34
.LBB107_34:
	jge	x2, x4, .LBB107_38
	jmp	.LBB107_52
.LBB107_35:                             // %.loopexit24
	mov	r0, -4
	jl	x2, r0, .LBB107_37
	jmp	.LBB107_36
.LBB107_36:                             // %.loopexit24
	jl	x2, x4, .LBB107_52
	jmp	.LBB107_37
.LBB107_37:
	mov	r0, [rsp]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x1]
	mov	x3, rax
	mov	x5, x1
	mov	r1, -256
add	x5, 1
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	mov	x1, x5
	jmp	.LBB107_42
.LBB107_38:
	mov	r0, [rsp]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x1]
	mov	x3, rax
	mov	x8, x1
	mov	r1, -256
add	x8, 1
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	x7, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, [x8]
	mov	r1, -256
add	x1, 2
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	r0, 2
	mov	[x8], rax
	jl	x5, r0, .LBB107_42
	jmp	.LBB107_39
.LBB107_39:                             // %.preheader21.preheader
	mov	x5, rsp
add	x5, 1
.LBB107_40:                             // %.preheader21
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x5
	add	r0, x7
	mov	r0, [r0]
	mov	x8, x1
	mov	r1, 255
	add	x8, x7
	call	__bit_and
	mov	r0, [x8]
	mov	r1, -256
	mov	x3, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
add	x7, 1
	mov	[x8], rax
	jne	x6, x7, .LBB107_40
	jmp	.LBB107_41
.LBB107_41:                             // %.loopexit22.loopexit
	add	x1, x7
.LBB107_42:                             // %.loopexit22
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 101
	mov	r0, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[x1], rax
	mov	r0, x2
	call	__bit_xor
	mov	x3, rax
	mov	r0, x3
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x3, -2147483648
	mov	r0, rax
	mov	r1, x3
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 2
	mov	r0, rax
	call	__bit_and
	mov	r0, -1
add	rax, 43
	jg	x2, r0, .LBB107_44
	jmp	.LBB107_43
.LBB107_43:
	mov	r0, 0
	sub	r0, x2
	mov	x2, r0
.LBB107_44:
	mov	x5, x1
add	x5, 1
	mov	x3, [x5]
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	x9, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r0, 10
	mov	[x5], rax
	jl	x2, r0, .LBB107_46
	jmp	.LBB107_45
.LBB107_45:                             // %.preheader.preheader
	mov	x8, x1
add	x8, 2
	mov	x7, 99
	mov	x3, x2
	jmp	.LBB107_47
.LBB107_46:
	mov	x7, x1
add	x1, 2
	mov	r0, [x1]
	mov	r1, -256
add	x7, 3
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	jmp	.LBB107_51
.LBB107_47:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	x4, x3
	mov	x10, x1
	add	x10, x9
	mov	r1, 10
add	x10, 2
	mov	r0, x4
	call	__udivsi3
	mov	r1, 10
	mov	x3, rax
	mov	r0, x3
	call	__umodsi3
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r0, [x10]
	mov	r1, -256
	mov	x5, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x10], rax
add	x9, 1
	jg	x4, x7, .LBB107_47
	jmp	.LBB107_48
.LBB107_48:
	add	x1, x9
add	x9, 1
	mov	x7, x1
	mov	r0, 3
add	x7, 2
	jl	x9, r0, .LBB107_51
	jmp	.LBB107_49
.LBB107_49:
	mov	x3, x8
	mov	x9, x1
.LBB107_50:                             // =>This Inner Loop Header: Depth=1
	mov	x4, [x8]
	mov	x10, x1
	mov	r1, 255
add	x10, 1
	mov	r0, x4
	call	__bit_and
	mov	r0, [x10]
	mov	r1, 255
	mov	x5, rax
	call	__bit_and
	mov	x6, rax
	mov	r1, -256
add	x3, 1
	mov	r0, x4
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x8], rax
	mov	r0, [x10]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x10], rax
	mov	r1, -2147483648
add	x9, -1
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x3
	call	__bit_xor
	mov	x1, x9
	mov	x8, x3
	jl	rax, x4, .LBB107_50
	jmp	.LBB107_51
.LBB107_51:                             // %.loopexit
	mov	r1, 10
	mov	r0, x2
	call	__umodsi3
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r0, [x7]
	mov	x1, rax
	mov	x6, x7
	mov	r1, -256
add	x6, 1
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	jmp	.LBB107_68
.LBB107_52:
	mov	r0, 0
	jl	x2, r0, .LBB107_60
	jmp	.LBB107_53
.LBB107_53:                             // %.preheader100.preheader
.LBB107_54:                             // %.preheader100
                                        // =>This Inner Loop Header: Depth=1
	mov	x7, r0
	mov	r0, 48
	jge	x7, x5, .LBB107_56
	jmp	.LBB107_55
.LBB107_55:                             //   in Loop: Header=BB107_54 Depth=1
	mov	r0, rsp
	add	r0, x7
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
.LBB107_56:                             //   in Loop: Header=BB107_54 Depth=1
	mov	x3, [x1]
	mov	x6, x1
	mov	r1, 255
add	x6, 1
	call	__bit_and
	mov	r1, -256
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, x7
add	r0, 1
	mov	x1, x6
	jne	x7, x2, .LBB107_54
	jmp	.LBB107_57
.LBB107_57:
	mov	r0, x2
add	r0, 1
	jle	x5, r0, .LBB107_68
	jmp	.LBB107_58
.LBB107_58:
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x6], rax
	sub	x5, x2
	mov	x3, rsp
	add	x3, x2
	mov	x4, 1
.LBB107_59:                             // =>This Inner Loop Header: Depth=1
	mov	r0, x3
	add	r0, x4
	mov	r0, [r0]
	mov	x7, x6
	mov	r1, 255
	add	x7, x4
	call	__bit_and
	mov	r0, [x7]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
add	x4, 1
	mov	[x7], rax
	je	x5, x4, .LBB107_67
	jmp	.LBB107_59
.LBB107_60:
	mov	r0, [x1]
	mov	x4, x1
	mov	r1, -256
add	x4, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, [x4]
	mov	x6, x1
	mov	r1, -256
add	x6, 2
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	x3, -1
	mov	[x4], rax
	je	x2, x3, .LBB107_63
	jmp	.LBB107_61
.LBB107_61:                             // %.preheader19.preheader
	mov	x4, 2
	jmp	.LBB107_65
.LBB107_62:                             // %.loopexit20.loopexit
	add	x1, x4
	mov	x6, x1
.LBB107_63:                             // %.loopexit20
	mov	r0, 1
	jl	x5, r0, .LBB107_68
	jmp	.LBB107_64
.LBB107_64:                             // %.preheader17.preheader
	mov	x3, rsp
	mov	x4, x6
	jmp	.LBB107_66
.LBB107_65:                             // %.preheader19
                                        // =>This Inner Loop Header: Depth=1
	mov	x6, x1
	add	x6, x4
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r0, x4
add	r0, -1
	mov	[x6], rax
	mov	r1, x2
	call	__bit_xor
add	x4, 1
	je	rax, x3, .LBB107_62
	jmp	.LBB107_65
.LBB107_66:                             // %.preheader17
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x4]
	mov	x1, rax
	mov	r1, -256
add	x6, 1
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
add	x5, -1
add	x3, 1
	mov	x4, x6
	jz	x5, .LBB107_68
	jmp	.LBB107_66
.LBB107_67:                             // %.loopexit16.loopexit
	add	x6, x4
.LBB107_68:                             // %.loopexit16
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x6], rax
.LBB107_69:
	mov	rax, x0
	mov	x12, [rsp+64]
	mov	x11, [rsp+68]
	mov	x10, [rsp+72]
	mov	x9, [rsp+76]
	mov	x8, [rsp+80]
	mov	x7, [rsp+84]
	mov	x6, [rsp+88]
	mov	x5, [rsp+92]
	mov	x4, [rsp+96]
	mov	x3, [rsp+100]
	mov	x2, [rsp+104]
	mov	x1, [rsp+108]
	mov	x0, [rsp+112]
add	rsp, 116
	ret
// -- End function
// -- Begin function itoa
itoa:                                   // @itoa
// %bb.0:
sub	rsp, 60
	mov	[rsp+56], x0
	mov	[rsp+52], x1
	mov	[rsp+48], x2
	mov	[rsp+44], x3
	mov	[rsp+40], x4
	mov	[rsp+36], x5
	mov	[rsp+32], x6
	mov	[rsp+28], x7
	mov	[rsp+24], x8
	mov	[rsp+20], x9
	mov	[rsp+16], x10
	mov	x2, r2
	mov	x0, r1
add	r2, -37
	mov	r1, -2147483648
	mov	x1, r0
	mov	r0, r2
	call	__bit_xor
	mov	r0, 2147483612
	jg	rax, r0, .LBB108_2
	jmp	.LBB108_1
.LBB108_1:
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	x0, 0
	jmp	.LBB108_20
.LBB108_2:
	mov	r0, -1
	jg	x1, r0, .LBB108_5
	jmp	.LBB108_3
.LBB108_3:
	mov	r0, 10
	jne	x2, r0, .LBB108_5
	jmp	.LBB108_4
.LBB108_4:
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, 0
	sub	r0, x1
	mov	x6, 1
	mov	x1, r0
	jmp	.LBB108_7
.LBB108_5:
	mov	r0, 10
	mov	x6, 0
	je	x2, r0, .LBB108_7
	jmp	.LBB108_6
.LBB108_6:                              // %.preheader8.preheader
	mov	x7, mcasm_static_ccbdd611d38f580638dd57066fcc265d
	jmp	.LBB108_16
.LBB108_7:
	mov	x7, rsp
add	x7, 15
	mov	r0, [x7]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[x7], rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483548
	jl	rax, r0, .LBB108_10
	jmp	.LBB108_8
.LBB108_8:                              // %.preheader.preheader
	mov	x8, mcasm_static_c362db4c2893882ec2b44d8077bc5bcb
	mov	x9, -2147473649
	mov	x2, x1
.LBB108_9:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 100
	mov	r0, x2
	call	__udivsi3
	mov	x1, rax
	mov	r0, x1
	mul	r0, 2147483548
	add	r0, x2
	mov	r1, 1
	call	__bit_shl
	mov	x3, rax
	add	x3, x8
	mov	r0, x3
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x10, x7
add	x10, -1
	mov	r0, [x10]
	mov	r1, -256
	mov	x4, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r0, [x3]
	mov	r1, 255
	mov	[x10], rax
	call	__bit_and
add	x7, -2
	mov	r0, [x7]
	mov	r1, -256
	mov	x3, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[x7], rax
	mov	r0, x2
	call	__bit_xor
	mov	x2, x1
	jg	rax, x9, .LBB108_9
	jmp	.LBB108_10
.LBB108_10:                             // %.loopexit5
	mov	r0, 9
	add	x6, x0
	jg	x1, r0, .LBB108_12
	jmp	.LBB108_11
.LBB108_11:
	mov	r1, 48
	mov	r0, x1
	call	__bit_or
	mov	x4, x7
add	x4, -1
	mov	x1, [x4]
	mov	r1, 255
	mov	x2, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -256
	mov	x3, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	rax, x2
	mov	[x4], r0
	mov	x3, -1
	jmp	.LBB108_13
.LBB108_12:
	mov	x5, x7
	mov	r1, 1
add	x5, -1
	mov	r0, x1
	call	__bit_shl
	mov	x8, mcasm_static_c362db4c2893882ec2b44d8077bc5bcb
	add	x8, rax
	mov	r0, x8
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x5]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	x4, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r0, [x8]
	mov	r1, 255
	mov	[x5], rax
	call	__bit_and
	mov	x5, x7
add	x5, -2
	mov	r0, [x5]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	rax, x2
	mov	[x5], r0
	mov	r0, 100
	mov	x3, -2
	je	x1, r0, .LBB108_15
	jmp	.LBB108_13
.LBB108_13:
	add	x3, x7
add	x3, 1
	mov	x4, 0
.LBB108_14:                             // =>This Inner Loop Header: Depth=1
	mov	x5, x6
	add	x5, x4
	mov	x1, [x5]
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	mov	r0, x3
	add	r0, x4
	mov	r0, [r0]
	mov	r1, 255
add	x4, 1
	call	__bit_and
	jnz	rax, .LBB108_14
	jmp	.LBB108_15
.LBB108_15:                             // %.loopexit
	add	x6, x4
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x6], rax
	jmp	.LBB108_20
.LBB108_16:                             // %.preheader8
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x1
	mov	r1, x2
	call	__udivsi3
	mov	x3, rax
	mov	r0, x3
	mul	r0, x2
	mov	r1, x1
	sub	r1, r0
	add	r1, x7
	mov	r0, [r1]
	mov	r1, 255
	call	__bit_and
	mov	x8, x0
	add	x8, x6
	mov	r0, [x8]
	mov	x4, rax
	mov	r1, -256
add	x6, 1
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[x8], rax
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x2
	call	__bit_xor
	mov	x1, x3
	jle	rax, x4, .LBB108_16
	jmp	.LBB108_17
.LBB108_17:
	mov	x1, x0
	add	x1, x6
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	x4, 0
	mov	r0, rax
	call	__bit_or
	mov	r0, 1
	mov	[x1], rax
	je	x6, r0, .LBB108_20
	jmp	.LBB108_18
.LBB108_18:                             // %.preheader6.preheader
add	x6, -1
.LBB108_19:                             // %.preheader6
                                        // =>This Inner Loop Header: Depth=1
	mov	x5, x0
	add	x5, x4
	mov	x1, [x5]
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	x7, x0
	add	x7, x6
	mov	r0, [x7]
	mov	r1, 255
	mov	x2, rax
	call	__bit_and
	mov	r1, -256
	mov	x3, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	mov	r0, [x7]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
add	x4, 1
add	x6, -1
	mov	[x7], rax
	jl	x4, x6, .LBB108_19
	jmp	.LBB108_20
.LBB108_20:                             // %.loopexit7
	mov	rax, x0
	mov	x10, [rsp+16]
	mov	x9, [rsp+20]
	mov	x8, [rsp+24]
	mov	x7, [rsp+28]
	mov	x6, [rsp+32]
	mov	x5, [rsp+36]
	mov	x4, [rsp+40]
	mov	x3, [rsp+44]
	mov	x2, [rsp+48]
	mov	x1, [rsp+52]
	mov	x0, [rsp+56]
add	rsp, 60
	ret
// -- End function
// -- Begin function labs
labs:                                   // @labs
// %bb.0:
	mov	r1, -1
	mov	rax, r0
	jg	rax, r1, .LBB109_2
	jmp	.LBB109_1
.LBB109_1:
	mov	r0, 0
	sub	r0, rax
	mov	rax, r0
.LBB109_2:
	ret
// -- End function
// -- Begin function llabs
llabs:                                  // @llabs
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x0, r1
	mov	r1, -2147483648
	mov	x1, r0
	mov	r0, x0
	call	__bit_xor
	mov	x2, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x2, -2147483648
	mov	r0, rax
	mov	r1, x2
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
	mov	r0, rax
	call	__bit_not
	mov	x2, rax
add	x2, 1
	mov	r0, x1
	add	r0, r0
	mov	r1, 0
	sub	r1, r0
	mov	x3, 0
	mov	r0, x2
	call	__bit_and
	mov	x4, rax
	add	x4, x1
	mov	r0, x1
	call	__bit_not
add	rax, 1
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	rax, x0
	add	rax, x0
	sub	x3, rax
	mov	r0, x2
	mov	r1, x3
	call	__bit_and
	add	x0, rax
	mov	rax, x4
	mov	t0, x0
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function malloc
malloc:                                 // @malloc
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
	mov	r1, 16384
	mov	r2, [r1]
	mov	r3, 1296125004
	je	r2, r3, .LBB111_2
	jmp	.LBB111_1
.LBB111_1:
	mov	[r1], 1296125004
	mov	r1, 16385
	mov	[r1], 16387
	mov	r2, 16386
add	r0, 3
	mov	r1, 2
	mov	[r2], 0
	call	__bit_shr
	mov	r1, -2
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	mov	x1, rax
	mov	r1, 1
	mov	x2, 1
	mov	r0, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x2, x0
	mov	r0, rax
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
add	x0, -1
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x0, rax
	mov	x2, x0
add	x2, 1
add	x0, 2
	jmp	.LBB111_17
.LBB111_2:
	mov	r1, 16386
	mov	x7, [r1]
add	r0, 3
	mov	r1, 2
	call	__bit_shr
	mov	r1, -2
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	mov	x1, rax
	mov	r1, 1
	mov	x2, 1
	mov	r0, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x2, x0
	mov	r0, rax
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
add	x0, -1
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x0, rax
	mov	x2, x0
add	x2, 1
add	x0, 2
	jz	x7, .LBB111_17
	jmp	.LBB111_3
.LBB111_3:                              // %.preheader.preheader
	mov	r0, 0
.LBB111_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	x6, x7
	mov	x3, [x6]
	mov	x5, x6
add	x5, 1
	mov	x7, [x5]
	mov	r1, -2147483648
	mov	x1, r0
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x3
	call	__bit_xor
	jle	rax, x4, .LBB111_12
	jmp	.LBB111_5
.LBB111_5:
add	x2, 3
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x3
	call	__bit_xor
	jge	rax, x2, .LBB111_9
	jmp	.LBB111_6
.LBB111_6:
	jnz	x1, .LBB111_8
	jmp	.LBB111_7
.LBB111_7:
	mov	r0, 16386
	mov	[r0], x7
	mov	x4, x5
	jmp	.LBB111_20
.LBB111_8:
add	x1, 1
	mov	[x1], x7
	mov	x4, x5
	jmp	.LBB111_20
.LBB111_9:
	mov	r0, x6
	add	r0, x0
	sub	x3, x0
	mov	[r0], x3
	mov	r1, r0
add	r1, 1
	mov	[r1], x7
	mov	[x6], x0
	jnz	x1, .LBB111_11
	jmp	.LBB111_10
.LBB111_10:
	mov	r1, 16386
	mov	[r1], r0
	mov	x4, x5
	jmp	.LBB111_20
.LBB111_11:
add	x1, 1
	mov	[x1], r0
	mov	x4, x5
	jmp	.LBB111_20
.LBB111_12:                             //   in Loop: Header=BB111_4 Depth=1
	mov	r0, x6
	jnz	x7, .LBB111_4
	jmp	.LBB111_13
.LBB111_13:
	mov	r0, 16385
	mov	x7, [r0]
	mov	r0, x3
	add	r0, x6
	jne	x7, r0, .LBB111_17
	jmp	.LBB111_14
.LBB111_14:
	mov	r0, x7
add	r0, -8388609
	mov	r1, -2147483648
	mov	x4, 0
	call	__bit_xor
	mov	r0, 2139111426
	jl	rax, r0, .LBB111_20
	jmp	.LBB111_15
.LBB111_15:
	mov	x2, x0
	mov	r0, 8388608
	sub	r0, x7
	mov	r1, -2147483648
	sub	x2, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	jg	rax, x3, .LBB111_20
	jmp	.LBB111_16
.LBB111_16:
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
	mov	x2, x1
add	x2, 1
	mov	r0, rax
	call	__bit_not
	mov	r1, 16385
	sub	r1, x1
add	rax, 1
	mov	x1, 16385
	mov	r0, rax
	call	__bit_and
	add	rax, x2
	mov	[rax], 0
	mov	r0, x6
	add	r0, x0
	mov	[x1], r0
	mov	[x6], x0
	mov	x4, x5
	jmp	.LBB111_20
.LBB111_17:
	mov	r0, 16385
	mov	x1, [r0]
	mov	r0, x1
add	r0, -8388609
	mov	r1, -2147483648
	mov	x4, 0
	call	__bit_xor
	mov	r0, 2139111426
	jl	rax, r0, .LBB111_20
	jmp	.LBB111_18
.LBB111_18:
	mov	r0, 8388608
	sub	r0, x1
	jge	x2, r0, .LBB111_20
	jmp	.LBB111_19
.LBB111_19:
	mov	r0, x1
	add	r0, x0
	mov	r1, 16385
	mov	[r1], r0
	mov	[x1], x0
add	x1, 1
	mov	x4, x1
.LBB111_20:
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
// -- Begin function free
free:                                   // @free
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x1, r0
	jz	x1, .LBB112_18
	jmp	.LBB112_1
.LBB112_1:
	mov	r0, 16384
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB112_3
	jmp	.LBB112_2
.LBB112_2:
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	x2, x1
add	x2, -1
	mov	x3, [x2]
	mov	x4, 0
	mov	x0, 0
	mov	rax, 0
	jmp	.LBB112_8
.LBB112_3:
	mov	r0, 16386
	mov	x0, [r0]
	mov	x2, x1
add	x2, -1
	mov	x3, [x2]
	mov	r0, x0
	call	__bit_not
add	rax, 1
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x4, 0
	jz	x0, .LBB112_8
	jmp	.LBB112_4
.LBB112_4:
	jge	x0, x2, .LBB112_8
	jmp	.LBB112_5
.LBB112_5:                              // %.preheader.preheader
.LBB112_6:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	x4, x0
	mov	r0, x4
add	r0, 1
	mov	x0, [r0]
	mov	r0, x0
	call	__bit_not
add	rax, 1
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	x0, .LBB112_8
	jmp	.LBB112_7
.LBB112_7:                              // %.preheader
                                        //   in Loop: Header=BB112_6 Depth=1
	jl	x0, x2, .LBB112_6
	jmp	.LBB112_8
.LBB112_8:                              // %.loopexit
	jne	x0, x2, .LBB112_10
	jmp	.LBB112_9
.LBB112_9:
	call	abort
.LBB112_10:
	mov	r0, 16386
	jz	x4, .LBB112_14
	jmp	.LBB112_11
.LBB112_11:
	mov	r0, [x4]
	mov	r1, r0
	add	r1, x4
	jne	r1, x2, .LBB112_13
	jmp	.LBB112_12
.LBB112_12:
	add	r0, x3
	mov	[x4], r0
	mov	x2, x4
	jmp	.LBB112_15
.LBB112_13:
add	x4, 1
	mov	r0, x4
.LBB112_14:
	mov	[r0], x2
	mov	[x1], x0
.LBB112_15:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB112_18
	jmp	.LBB112_16
.LBB112_16:
	mov	r0, [x2]
	mov	r1, r0
	add	r1, x2
	jne	r1, x0, .LBB112_18
	jmp	.LBB112_17
.LBB112_17:
	add	r0, [x0]
	mov	[x2], r0
add	x0, 1
	mov	r0, [x0]
add	x2, 1
	mov	[x2], r0
.LBB112_18:
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function realloc
realloc:                                // @realloc
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
	mov	x0, r0
	jnz	x0, .LBB113_2
	jmp	.LBB113_1
.LBB113_1:
	mov	r0, r1
	call	malloc
	jmp	.LBB113_92
.LBB113_2:
	mov	r0, 16384
	mov	r0, [r0]
	jnz	r1, .LBB113_20
	jmp	.LBB113_3
.LBB113_3:
	mov	r1, 1296125004
	je	r0, r1, .LBB113_5
	jmp	.LBB113_4
.LBB113_4:
	mov	r0, 16384
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	x2, x0
add	x2, -1
	mov	x3, [x2]
	mov	x4, 0
	mov	x1, 0
	mov	rax, 0
	jmp	.LBB113_10
.LBB113_5:
	mov	r0, 16386
	mov	x1, [r0]
	mov	x2, x0
add	x2, -1
	mov	x3, [x2]
	mov	r0, x1
	call	__bit_not
add	rax, 1
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x4, 0
	jz	x1, .LBB113_10
	jmp	.LBB113_6
.LBB113_6:
	jge	x1, x2, .LBB113_10
	jmp	.LBB113_7
.LBB113_7:                              // %.preheader.preheader
.LBB113_8:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	x4, x1
	mov	r0, x4
add	r0, 1
	mov	x1, [r0]
	mov	r0, x1
	call	__bit_not
add	rax, 1
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	x1, .LBB113_10
	jmp	.LBB113_9
.LBB113_9:                              // %.preheader
                                        //   in Loop: Header=BB113_8 Depth=1
	jl	x1, x2, .LBB113_8
	jmp	.LBB113_10
.LBB113_10:                             // %.loopexit
	jne	x1, x2, .LBB113_12
	jmp	.LBB113_11
.LBB113_11:
	call	abort
.LBB113_12:
	mov	r0, 16386
	jz	x4, .LBB113_16
	jmp	.LBB113_13
.LBB113_13:
	mov	r0, [x4]
	mov	r1, r0
	add	r1, x4
	jne	r1, x2, .LBB113_15
	jmp	.LBB113_14
.LBB113_14:
	add	r0, x3
	mov	[x4], r0
	mov	x2, x4
	jmp	.LBB113_17
.LBB113_15:
add	x4, 1
	mov	r0, x4
.LBB113_16:
	mov	[r0], x2
	mov	[x0], x1
.LBB113_17:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 0
	jz	r0, .LBB113_92
	jmp	.LBB113_18
.LBB113_18:
	mov	r0, [x2]
	mov	r1, r0
	add	r1, x2
	jne	r1, x1, .LBB113_92
	jmp	.LBB113_19
.LBB113_19:
	add	r0, [x1]
	mov	[x2], r0
add	x1, 1
	mov	r0, [x1]
add	x2, 1
	mov	[x2], r0
	jmp	.LBB113_92
.LBB113_20:
	mov	r2, 1296125004
	je	r0, r2, .LBB113_22
	jmp	.LBB113_21
.LBB113_21:
	mov	r0, 16384
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
.LBB113_22:
	mov	x11, x0
add	x11, -1
	mov	x3, [x11]
	mov	x4, r1
	mov	r0, r1
add	r0, 3
	mov	r1, 2
	call	__bit_shr
	mov	r1, -2
	mov	x1, rax
	mov	r0, x1
	call	__bit_and
	mov	x2, rax
	mov	r1, 1
	mov	x5, 1
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x5, x1
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
add	x1, -1
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	x2, rax
	mov	x1, x2
add	x1, 1
	mov	r1, -2147483648
add	x2, 2
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x3
	call	__bit_xor
	jg	rax, x5, .LBB113_73
	jmp	.LBB113_23
.LBB113_23:
	mov	r0, 16385
	mov	r0, [r0]
	mov	x7, x3
	add	x7, x11
	mov	x6, x2
	sub	x6, x3
	je	x7, r0, .LBB113_27
	jmp	.LBB113_24
.LBB113_24:
	mov	r0, 16386
	mov	r0, [r0]
	mov	x5, 0
	jz	r0, .LBB113_32
	jmp	.LBB113_25
.LBB113_25:
	jge	r0, x7, .LBB113_32
	jmp	.LBB113_26
.LBB113_26:                             // %.preheader29.preheader
	jmp	.LBB113_30
.LBB113_27:
	mov	r0, x7
add	r0, -8388609
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2139111426
	jl	rax, r0, .LBB113_39
	jmp	.LBB113_28
.LBB113_28:
	mov	r0, 8388608
	sub	r0, x7
	jg	x6, r0, .LBB113_39
	jmp	.LBB113_29
.LBB113_29:
	add	x1, x0
	mov	r0, 16385
	mov	[r0], x1
	mov	r0, x0
add	r0, -1
	mov	[r0], x2
	mov	rax, x0
	jmp	.LBB113_92
.LBB113_30:                             // %.preheader29
                                        // =>This Inner Loop Header: Depth=1
	mov	x5, r0
add	r0, 1
	mov	r0, [r0]
	jz	r0, .LBB113_32
	jmp	.LBB113_31
.LBB113_31:                             // %.preheader29
                                        //   in Loop: Header=BB113_30 Depth=1
	jl	r0, x7, .LBB113_30
	jmp	.LBB113_32
.LBB113_32:                             // %.loopexit30
	jne	r0, x7, .LBB113_39
	jmp	.LBB113_33
.LBB113_33:
	mov	x7, [x7]
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x7
	call	__bit_xor
	jl	rax, x8, .LBB113_39
	jmp	.LBB113_34
.LBB113_34:
	mov	r0, x3
	add	r0, x0
	mov	x8, [r0]
	mov	r0, x6
add	r0, 2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x7
	call	__bit_xor
	jge	rax, x4, .LBB113_38
	jmp	.LBB113_35
.LBB113_35:
	add	x7, x3
	mov	[x11], x7
	jnz	x5, .LBB113_37
	jmp	.LBB113_36
.LBB113_36:
	mov	r0, 16386
	mov	[r0], x8
	mov	rax, x0
	jmp	.LBB113_92
.LBB113_37:
add	x5, 1
	mov	[x5], x8
	mov	rax, x0
	jmp	.LBB113_92
.LBB113_38:
	add	x1, x0
	sub	x7, x6
	mov	[x1], x7
	mov	r0, x1
add	r0, 1
	mov	[r0], x8
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
	mov	x3, x5
add	x3, 1
	mov	r0, rax
	call	__bit_not
	mov	r1, 16385
	sub	r1, x5
add	rax, 1
	mov	r0, rax
	call	__bit_and
	add	rax, x3
	mov	[rax], x1
	mov	r0, x0
add	r0, -1
	mov	[r0], x2
	mov	rax, x0
	jmp	.LBB113_92
.LBB113_39:
	mov	r0, x4
	call	malloc
	mov	x2, rax
	mov	rax, 0
	jz	x2, .LBB113_92
	jmp	.LBB113_40
.LBB113_40:
	mov	r1, 2
	mov	x7, x2
	mov	r0, x3
	call	__bit_shl
	mov	x1, rax
add	x1, -4
	mov	r0, x1
	call	__bit_not
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	x3, rax
	mov	r0, x1
	mov	r1, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x1, x4
	mov	r0, rax
	mov	r1, x1
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	x6, rax
	add	x6, x4
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	mov	r0, -2147483632
	mov	x4, x0
	mov	x1, x7
	jl	rax, r0, .LBB113_53
	jmp	.LBB113_41
.LBB113_41:
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	x3, rax
	mov	x8, 8
	sub	x8, x3
	mov	x12, 0
	mov	x5, x0
.LBB113_42:                             // =>This Inner Loop Header: Depth=1
	mov	r0, x0
	add	r0, x12
	mov	r0, [r0]
	mov	x9, x2
	mov	r1, 255
	add	x9, x12
	call	__bit_and
	mov	r0, [x9]
	mov	r1, -256
	mov	x4, rax
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	[x9], rax
add	x12, 1
add	x5, 1
	jne	x8, x12, .LBB113_42
	jmp	.LBB113_43
.LBB113_43:
	mov	r1, -8
	mov	r0, x3
	call	__bit_or
	mov	x3, rax
	mov	x4, x0
	add	x4, x12
	mov	r1, 3
	add	x3, x6
	mov	r0, x4
	call	__bit_and
	jnz	rax, .LBB113_50
	jmp	.LBB113_44
.LBB113_44:
	mov	x7, x2
	mov	r1, -2147483648
	add	x7, x12
	mov	r0, x3
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB113_46
	jmp	.LBB113_45
.LBB113_45:                             // %.preheader.i.preheader
	add	x2, x12
	add	x12, x0
	mov	x4, 0
	mov	x5, -2147483633
	jmp	.LBB113_48
.LBB113_46:                             // %.preheader162
	mov	x2, -2147483645
	mov	x6, x3
	jmp	.LBB113_49
.LBB113_47:
	add	x2, x4
	add	x12, x4
	mov	r0, 3
	mov	x7, x2
	mov	x4, x12
	mov	x6, x3
	jg	x3, r0, .LBB113_46
	jmp	.LBB113_53
.LBB113_48:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x12
	add	r0, x4
	mov	r1, [r0]
	mov	r2, x2
	add	r2, x4
	mov	[r2], r1
	mov	r1, r0
add	r1, 4
	mov	r1, [r1]
	mov	r3, r2
add	r3, 4
	mov	[r3], r1
	mov	r1, r0
add	r1, 8
	mov	r1, [r1]
	mov	r3, r2
add	r3, 8
	mov	[r3], r1
add	r0, 12
	mov	r0, [r0]
add	r2, 12
	mov	[r2], r0
add	x3, -16
	mov	r1, -2147483648
add	x4, 16
	mov	r0, x3
	call	__bit_xor
	jg	rax, x5, .LBB113_48
	jmp	.LBB113_47
.LBB113_49:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x4]
add	x4, 4
	mov	[x7], r0
add	x6, -4
	mov	r1, -2147483648
add	x7, 4
	mov	r0, x6
	call	__bit_xor
	jg	rax, x2, .LBB113_49
	jmp	.LBB113_53
.LBB113_50:
	mov	r1, 3
	mov	r0, rax
	mov	x8, rax
	call	__bit_shl
	mov	x6, rax
	mov	x7, 8
	mov	r1, 3
	sub	x7, x8
	mov	r0, x5
	call	__bit_and
	mov	x14, x0
	sub	x14, rax
	mov	r0, x14
	add	r0, x12
	mov	x8, [r0]
add	x14, 4
	mov	x13, 0
.LBB113_51:                             // =>This Inner Loop Header: Depth=1
	mov	x15, x2
	mov	r0, x12
	add	r0, x13
	add	r0, x14
	mov	x9, [r0]
	add	x15, x13
	mov	r1, 31
	add	x15, x12
	mov	r0, x6
	call	__bit_and
	mov	r0, x8
	mov	r1, rax
	call	__bit_shr
	mov	x8, rax
	mov	r0, x6
	call	__bit_not
	mov	r1, 31
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
	mov	x10, rax
	mov	r0, x9
	call	__bit_shl
	mov	r0, rax
	mov	r1, x10
	call	__bit_shl
	mov	r0, rax
	mov	r1, x8
	call	__bit_or
	mov	[x15], rax
add	x3, -4
	mov	r1, -2147483648
add	x13, 4
	mov	r0, x7
	call	__bit_xor
	mov	r1, -2147483648
	mov	x10, rax
	mov	r0, x3
	call	__bit_xor
	mov	x8, x9
	jge	rax, x10, .LBB113_51
	jmp	.LBB113_52
.LBB113_52:
	mov	r1, -4
	mov	r0, x4
	call	__bit_or
	mov	x6, rax
	mov	r1, 3
	add	x6, x13
	mov	r0, x5
	call	__bit_and
	mov	x4, x0
	sub	x4, rax
	add	x4, x6
	add	x4, x12
	add	x2, x12
	add	x2, x13
add	x4, 4
	mov	x7, x2
	jmp	.LBB113_54
.LBB113_53:                             // %.loopexit8.i
	mov	x3, x6
	jz	x6, .LBB113_56
	jmp	.LBB113_54
.LBB113_54:                             // %.preheader159
	mov	x6, x7
.LBB113_55:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x4]
add	x3, -1
	mov	r1, 255
add	x4, 1
	call	__bit_and
	mov	r0, [x7]
	mov	x2, rax
	mov	r1, -256
add	x6, 1
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mov	x7, x6
	jnz	x3, .LBB113_55
	jmp	.LBB113_56
.LBB113_56:                             // %memcpy.exit
	mov	r0, 16384
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB113_58
	jmp	.LBB113_57
.LBB113_57:
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	x3, [x11]
	mov	x4, 0
	mov	x2, 0
	mov	rax, 0
	jmp	.LBB113_63
.LBB113_58:
	mov	r0, 16386
	mov	x2, [r0]
	mov	x3, [x11]
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x4, 0
	jz	x2, .LBB113_63
	jmp	.LBB113_59
.LBB113_59:
	jge	x2, x11, .LBB113_63
	jmp	.LBB113_60
.LBB113_60:                             // %.preheader27.preheader
.LBB113_61:                             // %.preheader27
                                        // =>This Inner Loop Header: Depth=1
	mov	x4, x2
	mov	r0, x4
add	r0, 1
	mov	x2, [r0]
	mov	r0, x2
	call	__bit_not
add	rax, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	x2, .LBB113_63
	jmp	.LBB113_62
.LBB113_62:                             // %.preheader27
                                        //   in Loop: Header=BB113_61 Depth=1
	jl	x2, x11, .LBB113_61
	jmp	.LBB113_63
.LBB113_63:                             // %.loopexit28
	jne	x2, x11, .LBB113_65
	jmp	.LBB113_64
.LBB113_64:
	call	abort
.LBB113_65:
	mov	r0, 16386
	jz	x4, .LBB113_69
	jmp	.LBB113_66
.LBB113_66:
	mov	r0, [x4]
	mov	r1, r0
	add	r1, x4
	jne	r1, x11, .LBB113_68
	jmp	.LBB113_67
.LBB113_67:
	add	r0, x3
	mov	[x4], r0
	mov	x11, x4
	jmp	.LBB113_70
.LBB113_68:
add	x4, 1
	mov	r0, x4
.LBB113_69:
	mov	[r0], x11
	mov	[x0], x2
.LBB113_70:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, x1
	jz	r0, .LBB113_92
	jmp	.LBB113_71
.LBB113_71:
	mov	r0, [x11]
	mov	r1, r0
	add	r1, x11
	jne	r1, x2, .LBB113_92
	jmp	.LBB113_72
.LBB113_72:
	add	r0, [x2]
	mov	[x11], r0
add	x2, 1
	mov	r0, [x2]
add	x11, 1
	mov	[x11], r0
	jmp	.LBB113_92
.LBB113_73:
	sub	x3, x2
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483646
	mov	r0, rax
	mov	rax, x0
	jl	r0, r1, .LBB113_92
	jmp	.LBB113_74
.LBB113_74:
	add	x1, x0
	mov	r0, x0
add	r0, -1
	mov	[r0], x2
	add	x2, x0
	mov	[x1], x3
	mov	rax, x0
	jz	x2, .LBB113_92
	jmp	.LBB113_75
.LBB113_75:
	mov	r0, 16384
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB113_77
	jmp	.LBB113_76
.LBB113_76:
	mov	[r0], 1296125004
	mov	r0, 16385
	mov	[r0], 16387
	mov	r0, 16386
	mov	[r0], 0
	mov	x3, [x1]
	mov	x5, 0
	mov	x4, 0
	mov	rax, 0
	jmp	.LBB113_82
.LBB113_77:
	mov	r0, 16386
	mov	x4, [r0]
	mov	r0, x4
	call	__bit_not
add	rax, 1
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	x5, 0
	jz	x4, .LBB113_82
	jmp	.LBB113_78
.LBB113_78:
	jge	x4, x1, .LBB113_82
	jmp	.LBB113_79
.LBB113_79:                             // %.preheader25.preheader
.LBB113_80:                             // %.preheader25
                                        // =>This Inner Loop Header: Depth=1
	mov	x5, x4
	mov	r0, x5
add	r0, 1
	mov	x4, [r0]
	mov	r0, x4
	call	__bit_not
add	rax, 1
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jz	x4, .LBB113_82
	jmp	.LBB113_81
.LBB113_81:                             // %.preheader25
                                        //   in Loop: Header=BB113_80 Depth=1
	jl	x4, x1, .LBB113_80
	jmp	.LBB113_82
.LBB113_82:                             // %.loopexit26
	jne	x4, x1, .LBB113_84
	jmp	.LBB113_83
.LBB113_83:
	call	abort
.LBB113_84:
	mov	r0, 16386
	jz	x5, .LBB113_88
	jmp	.LBB113_85
.LBB113_85:
	mov	r0, [x5]
	mov	r1, r0
	add	r1, x5
	jne	r1, x1, .LBB113_87
	jmp	.LBB113_86
.LBB113_86:
	add	r0, x3
	mov	[x5], r0
	mov	x1, x5
	jmp	.LBB113_89
.LBB113_87:
add	x5, 1
	mov	r0, x5
.LBB113_88:
	mov	[r0], x1
	mov	[x2], x4
.LBB113_89:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, x0
	jz	r0, .LBB113_92
	jmp	.LBB113_90
.LBB113_90:
	mov	r0, [x1]
	mov	r1, r0
	add	r1, x1
	mov	rax, x0
	jne	r1, x4, .LBB113_92
	jmp	.LBB113_91
.LBB113_91:
	add	r0, [x4]
	mov	[x1], r0
add	x4, 1
	mov	r0, [x4]
add	x1, 1
	mov	[x1], r0
	mov	rax, x0
.LBB113_92:
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
// -- Begin function calloc
calloc:                                 // @calloc
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x0, r1
	mov	x2, r0
	jz	x2, .LBB114_2
	jmp	.LBB114_1
.LBB114_1:
	mov	r1, 0
	mov	r3, 0
	mov	x1, 0
	mov	r0, x2
	mov	r2, x0
	call	__muldi3
	mov	x3, t0
	mov	r0, x3
	call	__bit_not
add	rax, 1
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	jnz	rax, .LBB114_18
	jmp	.LBB114_2
.LBB114_2:
	mul	x0, x2
	mov	r0, x0
	call	malloc
	mov	x2, rax
	mov	x1, 0
	jz	x2, .LBB114_18
	jmp	.LBB114_3
.LBB114_3:
	mov	r1, 3
	mov	x1, x2
	mov	r0, x1
	call	__bit_and
	jz	rax, .LBB114_8
	jmp	.LBB114_4
.LBB114_4:                              // %.preheader2.preheader
	mov	x4, x2
add	x4, 1
	mov	x3, 0
.LBB114_5:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
	je	x0, x3, .LBB114_18
	jmp	.LBB114_6
.LBB114_6:                              //   in Loop: Header=BB114_5 Depth=1
	mov	x5, x2
	add	x5, x3
	mov	r0, [x5]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	r0, x4
	add	r0, x3
	mov	r1, 3
	mov	[x5], rax
	call	__bit_and
add	x3, 1
	jnz	rax, .LBB114_5
	jmp	.LBB114_7
.LBB114_7:                              // %.loopexit7.i.loopexit
	add	x2, x3
	sub	x0, x3
.LBB114_8:                              // %.loopexit7.i
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB114_15
	jmp	.LBB114_9
.LBB114_9:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB114_11
	jmp	.LBB114_10
.LBB114_10:                             // %.preheader.i.preheader
	mov	x3, -2147483633
	jmp	.LBB114_13
.LBB114_11:                             // %.preheader33
	mov	x3, -2147483645
	jmp	.LBB114_14
.LBB114_12:
	mov	r0, 3
	jg	x0, r0, .LBB114_11
	jmp	.LBB114_15
.LBB114_13:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x2
add	r0, 4
	mov	[x2], 0
	mov	r1, x2
add	r1, 8
	mov	[r0], 0
	mov	r0, x2
add	r0, 12
	mov	[r1], 0
add	x2, 16
add	x0, -16
	mov	r1, -2147483648
	mov	[r0], 0
	mov	r0, x0
	call	__bit_xor
	jg	rax, x3, .LBB114_13
	jmp	.LBB114_12
.LBB114_14:                             // =>This Inner Loop Header: Depth=1
	mov	[x2], 0
add	x0, -4
	mov	r1, -2147483648
add	x2, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x3, .LBB114_14
	jmp	.LBB114_15
.LBB114_15:                             // %.loopexit5.i
	jz	x0, .LBB114_18
	jmp	.LBB114_16
.LBB114_16:                             // %.preheader.preheader
	mov	x3, x2
.LBB114_17:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
add	x0, -1
	mov	r1, -256
add	x3, 1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	mov	x2, x3
	jnz	x0, .LBB114_17
	jmp	.LBB114_18
.LBB114_18:                             // %memset.exit
	mov	rax, x1
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function d2fixed_buffered_n
d2fixed_buffered_n:                     // @d2fixed_buffered_n
// %bb.0:                               // %memcpy.exit
sub	rsp, 128
	mov	[rsp+124], x0
	mov	[rsp+120], x1
	mov	[rsp+116], x2
	mov	[rsp+112], x3
	mov	[rsp+108], x4
	mov	[rsp+104], x5
	mov	[rsp+100], x6
	mov	[rsp+96], x7
	mov	[rsp+92], x8
	mov	[rsp+88], x9
	mov	[rsp+84], x10
	mov	[rsp+80], x11
	mov	[rsp+76], x12
	mov	[rsp+72], x13
	mov	[rsp+68], x14
	mov	[rsp+64], x15
	mov	x6, r1
	mov	r1, 1048575
	mov	x1, r3
	mov	x5, r2
	mov	x9, r0
	mov	r0, x6
	call	__bit_and
	mov	r1, 20
	mov	x15, rax
	mov	r0, x6
	call	__bit_shr
	mov	r1, 2047
	mov	x2, 2047
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
	jne	x0, x2, .LBB115_6
	jmp	.LBB115_1
.LBB115_1:
	mov	r0, x9
	mov	r1, x15
	call	__bit_or
	jz	rax, .LBB115_3
	jmp	.LBB115_2
.LBB115_2:                              // %memcpy.exit38.loopexit175
	mov	r0, [x1]
	mov	x0, x1
	mov	r1, -256
add	x0, 1
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, [x0]
	mov	r1, -256
add	x1, 2
	call	__bit_and
	mov	r1, 97
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x7, 3
	jmp	.LBB115_183
.LBB115_3:
	mov	r0, -1
	mov	x7, 8
	jg	x6, r0, .LBB115_5
	jmp	.LBB115_4
.LBB115_4:
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x7, 9
.LBB115_5:                              // %memcpy.exit38.loopexit
	mov	r1, 31
	mov	r0, x6
	call	__bit_shr
	add	x1, rax
	mov	r0, [x1]
	mov	x0, x1
	mov	r1, -256
add	x0, 1
	call	__bit_and
	mov	r1, 73
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, [x0]
	mov	x2, x1
	mov	r1, -256
add	x2, 2
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x2]
	mov	x0, x1
	mov	r1, -256
add	x0, 3
	call	__bit_and
	mov	r1, 102
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	mov	r0, [x0]
	mov	x2, x1
	mov	r1, -256
add	x2, 4
	call	__bit_and
	mov	r1, 105
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x2]
	mov	x0, x1
	mov	r1, -256
add	x0, 5
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	mov	r0, [x0]
	mov	x2, x1
	mov	r1, -256
add	x2, 6
	call	__bit_and
	mov	r1, 105
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x2]
	mov	r1, -256
add	x1, 7
	call	__bit_and
	mov	r1, 116
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 121
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	jmp	.LBB115_183
.LBB115_6:
	mov	r0, x9
	mov	r1, x15
	call	__bit_or
	jnz	rax, .LBB115_26
	jmp	.LBB115_7
.LBB115_7:
	jnz	x0, .LBB115_26
	jmp	.LBB115_8
.LBB115_8:
	mov	r0, -1
	mov	x3, 0
	jg	x6, r0, .LBB115_10
	jmp	.LBB115_9
.LBB115_9:
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x3, 1
.LBB115_10:
	mov	x4, x1
	add	x4, x3
	mov	r0, [x4]
	mov	x7, x3
	mov	r1, -256
add	x7, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x4], rax
	jz	x5, .LBB115_183
	jmp	.LBB115_11
.LBB115_11:
	mov	r1, 2
	mov	r0, x3
	call	__bit_or
	add	x7, x1
	mov	r0, [x7]
	mov	r1, -256
	mov	x3, rax
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	add	x1, x3
	mov	r1, 3
	mov	[x7], rax
	mov	r0, x1
	call	__bit_and
	mov	x0, x5
	jz	rax, .LBB115_15
	jmp	.LBB115_12
.LBB115_12:                             // %.preheader78.preheader
add	x4, 3
	mov	x2, x1
	mov	x0, x5
.LBB115_13:                             // %.preheader78
                                        // =>This Inner Loop Header: Depth=1
	jz	x0, .LBB115_25
	jmp	.LBB115_14
.LBB115_14:                             //   in Loop: Header=BB115_13 Depth=1
	mov	r0, [x2]
add	x0, -1
	mov	x1, x2
	mov	r1, -256
add	x1, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x2], rax
	mov	r0, x4
	call	__bit_and
add	x4, 1
	mov	x2, x1
	jnz	rax, .LBB115_13
	jmp	.LBB115_15
.LBB115_15:                             // %.loopexit7.i
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB115_22
	jmp	.LBB115_16
.LBB115_16:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB115_18
	jmp	.LBB115_17
.LBB115_17:                             // %.preheader.i.preheader
	mov	x2, -2147483633
	jmp	.LBB115_20
.LBB115_18:                             // %.preheader432
	mov	x2, -2147483645
	jmp	.LBB115_21
.LBB115_19:
	mov	r0, 3
	jg	x0, r0, .LBB115_18
	jmp	.LBB115_22
.LBB115_20:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x1
add	r0, 4
	mov	[x1], 808464432
	mov	r1, x1
add	r1, 8
	mov	[r0], 808464432
	mov	r0, x1
add	r0, 12
	mov	[r1], 808464432
add	x1, 16
add	x0, -16
	mov	r1, -2147483648
	mov	[r0], 808464432
	mov	r0, x0
	call	__bit_xor
	jg	rax, x2, .LBB115_20
	jmp	.LBB115_19
.LBB115_21:                             // =>This Inner Loop Header: Depth=1
	mov	[x1], 808464432
add	x0, -4
	mov	r1, -2147483648
add	x1, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x2, .LBB115_21
	jmp	.LBB115_22
.LBB115_22:                             // %.loopexit5.i
	jz	x0, .LBB115_25
	jmp	.LBB115_23
.LBB115_23:                             // %.preheader.preheader
	mov	x2, x1
.LBB115_24:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
add	x0, -1
	mov	r1, -256
add	x2, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x1, x2
	jnz	x0, .LBB115_24
	jmp	.LBB115_25
.LBB115_25:                             // %memset.exit
	add	x3, x5
	mov	x7, x3
	jmp	.LBB115_183
.LBB115_26:
	mov	r1, 1048576
	mov	r0, x15
	call	__bit_or
	jz	x0, .LBB115_28
	jmp	.LBB115_27
.LBB115_27:
	mov	x15, rax
.LBB115_28:
	mov	x2, -1074
	jz	x0, .LBB115_30
	jmp	.LBB115_29
.LBB115_29:
add	x0, -1075
	mov	x2, x0
.LBB115_30:
	mov	[rsp+8], x5
	mov	r0, -1
	mov	x7, 0
	jg	x6, r0, .LBB115_32
	jmp	.LBB115_31
.LBB115_31:
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x7, 1
.LBB115_32:
	mov	r0, -52
	mov	[rsp+28], x9
	mov	[rsp+32], x15
	mov	[rsp+12], x2
	jl	x2, r0, .LBB115_76
	jmp	.LBB115_33
.LBB115_33:
	mov	r1, -2147483648
	mov	x5, -2147483648
	mov	x2, [rsp+12]
	mov	r0, x2
	call	__bit_xor
	mov	r1, 2147483647
	mov	x6, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, -2147483648
	mov	x0, x7
	mov	x7, rax
	mov	r0, x6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x5, x6
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r0, x7
	mov	x7, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	x14, rax
	mov	r0, x14
	mul	r0, 78913
	mov	r1, 18
	call	__bit_shr
add	rax, 25
	mov	r1, 65535
	mov	r0, rax
	call	__bit_and
	mul	rax, 58255
	mov	r1, 19
	mov	r0, rax
	call	__bit_shr
	mov	x8, rax
	mov	x4, x14
	sub	x4, x2
add	x4, 128
	mov	r0, x1
add	r0, -4
	mov	[rsp+4], r0
	mov	x3, 0
	mov	x2, mcasm_static_bff1819c724c09c306780236d311fec2
	mov	x0, 99999999
	mov	x10, x8
	mov	[rsp+20], x14
	mov	[rsp+24], x4
.LBB115_34:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB115_38 Depth 2
                                        //     Child Loop BB115_66 Depth 2
                                        //     Child Loop BB115_47 Depth 2
                                        //     Child Loop BB115_50 Depth 2
add	x10, -1
	mov	x5, rsp
add	x5, 40
	mov	r0, x14
	mov	r1, x10
	mov	r2, x5
	call	ryu_fill_pow10_split_exp
	mov	r0, x9
	mov	r1, x15
	mov	r2, x5
	mov	r3, x4
	call	ryu_mul_shift_mod1e9_exact
	mov	x11, rax
	jnz	x3, .LBB115_39
	jmp	.LBB115_35
.LBB115_35:                             //   in Loop: Header=BB115_34 Depth=1
	mov	x3, 1
	jnz	x11, .LBB115_53
	jmp	.LBB115_36
.LBB115_36:                             //   in Loop: Header=BB115_34 Depth=1
	mov	r0, 2
	jl	x8, r0, .LBB115_76
	jmp	.LBB115_37
.LBB115_37:                             // %.preheader98.preheader
                                        //   in Loop: Header=BB115_34 Depth=1
.LBB115_38:                             // %.preheader98
                                        //   Parent Loop BB115_34 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x10, x8
add	x10, -2
	mov	x5, rsp
add	x5, 40
	mov	r0, x14
	mov	r1, x10
	mov	r2, x5
	call	ryu_fill_pow10_split_exp
	mov	r0, x9
	mov	r1, x15
	mov	r2, x5
	mov	r3, x4
	call	ryu_mul_shift_mod1e9_exact
	mov	x11, rax
	jz	x11, .LBB115_75
	jmp	.LBB115_52
.LBB115_39:                             //   in Loop: Header=BB115_34 Depth=1
	mov	x12, x1
	add	x12, x7
	jz	x11, .LBB115_41
	jmp	.LBB115_40
.LBB115_40:                             // %memcpy.exit40
                                        //   in Loop: Header=BB115_34 Depth=1
	mov	x3, x12
	mov	r1, 10000
add	x3, 7
	mov	r0, x11
	call	__udivsi3
	mov	x13, rax
	mov	x5, x13
	mul	x5, -10000
	add	x5, x11
	mov	r1, 100
	mov	r0, x5
	call	__udivsi3
	mov	x6, rax
	mov	r0, x6
	mul	r0, -100
	add	r0, x5
	mov	r1, 1
	call	__bit_shl
	mov	x5, rax
	add	x5, x2
	mov	r0, [x5]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	r0, [x3]
	mov	x14, rax
	mov	x4, x12
	mov	r1, -256
add	x4, 8
	call	__bit_and
	mov	r1, 255
	mov	x15, rax
	mov	r0, x14
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x15
	mov	x15, [rsp+32]
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x4]
	mov	r1, -256
	mov	x5, rax
	call	__bit_and
	mov	r1, 255
	mov	x14, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x14
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
	mov	x3, x12
	mov	r1, 1
add	x3, 5
	mov	r0, x6
	call	__bit_shl
	mov	x5, rax
	add	x5, x2
	mov	r0, [x5]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	r0, [x3]
	mov	x6, rax
	mov	x4, x12
	mov	r1, -256
add	x4, 6
	call	__bit_and
	mov	r1, 255
	mov	x14, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x14
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x4]
	mov	r1, -256
	mov	x5, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 100000000
	mov	[x4], rax
	mov	r0, x11
	call	__udivsi3
	mov	x11, rax
	mov	x5, x11
	mul	x5, -10000
	add	x5, x13
	mov	r1, 100
	mov	r0, x5
	call	__udivsi3
	mov	x6, rax
	mov	r0, x6
	mul	r0, -100
	add	r0, x5
	mov	r1, 1
	call	__bit_shl
	mov	x5, rax
	add	x5, x2
	mov	r0, [x5]
	mov	x3, x12
add	x3, 3
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	r0, [x3]
	mov	x13, rax
	mov	x4, x12
	mov	r1, -256
add	x4, 4
	call	__bit_and
	mov	r1, 255
	mov	x14, rax
	mov	r0, x13
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x14
	mov	x14, [rsp+20]
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x4]
	mov	r1, -256
	mov	x5, rax
	call	__bit_and
	mov	r1, 255
	mov	x13, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x13
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x4], rax
	mov	r0, x6
	call	__bit_shl
	mov	x5, rax
	add	x5, x2
	mov	r0, [x5]
	mov	x3, x12
add	x3, 1
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	r0, [x3]
	mov	r1, -256
	mov	x6, rax
	call	__bit_and
	mov	r1, 255
	mov	x13, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x13
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x5]
	mov	x3, x12
	mov	r1, 255
add	x3, 2
	call	__bit_and
	mov	r0, [x3]
	mov	r1, -256
	mov	x5, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x12]
	mov	r1, -256
add	x11, 48
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x11
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	[x12], rax
	jmp	.LBB115_51
.LBB115_41:                             //   in Loop: Header=BB115_34 Depth=1
	mov	r1, 3
	mov	r0, x12
	call	__bit_and
	mov	x6, 9
	mov	x11, x12
	jz	rax, .LBB115_46
	jmp	.LBB115_42
.LBB115_42:                             // %.preheader95.preheader
                                        //   in Loop: Header=BB115_34 Depth=1
	mov	r0, [x12]
	mov	x11, x12
	mov	r1, -256
add	x11, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x12], rax
	mov	r0, x11
	call	__bit_and
	mov	x6, 8
	jz	rax, .LBB115_46
	jmp	.LBB115_43
.LBB115_43:                             // %.preheader95.1
                                        //   in Loop: Header=BB115_34 Depth=1
	mov	x3, x12
add	x3, 1
	mov	r0, [x3]
	mov	x11, x12
	mov	r1, -256
add	x11, 2
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x3], rax
	mov	r0, x11
	call	__bit_and
	mov	x6, 7
	jz	rax, .LBB115_46
	jmp	.LBB115_44
.LBB115_44:                             // %.preheader95.2
                                        //   in Loop: Header=BB115_34 Depth=1
	mov	x3, x12
add	x3, 2
	mov	r0, [x3]
	mov	x11, x12
	mov	r1, -256
add	x11, 3
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x3], rax
	mov	r0, x11
	call	__bit_and
	mov	x6, 6
	jz	rax, .LBB115_46
	jmp	.LBB115_45
.LBB115_45:                             // %.preheader95.3
                                        //   in Loop: Header=BB115_34 Depth=1
	mov	x11, x12
add	x12, 3
	mov	r0, [x12]
	mov	r1, -256
add	x11, 4
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x12], rax
	mov	x6, 5
.LBB115_46:                             // %.thread.preheader
                                        //   in Loop: Header=BB115_34 Depth=1
	mov	x3, -2147483645
.LBB115_47:                             // %.thread
                                        //   Parent Loop BB115_34 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	[x11], 808464432
add	x6, -4
	mov	r1, -2147483648
add	x11, 4
	mov	r0, x6
	call	__bit_xor
	jg	rax, x3, .LBB115_47
	jmp	.LBB115_48
.LBB115_48:                             // %.loopexit5.i45
                                        //   in Loop: Header=BB115_34 Depth=1
	jz	x6, .LBB115_51
	jmp	.LBB115_49
.LBB115_49:                             // %.preheader94.preheader
                                        //   in Loop: Header=BB115_34 Depth=1
	mov	x3, 0
.LBB115_50:                             // %.preheader94
                                        //   Parent Loop BB115_34 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x4, x11
	add	x4, x3
	mov	r0, [x4]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
add	x3, 1
	mov	[x4], rax
	jne	x6, x3, .LBB115_50
	jmp	.LBB115_51
.LBB115_51:                             // %memset.exit47
                                        //   in Loop: Header=BB115_34 Depth=1
add	x7, 9
	mov	x4, [rsp+24]
	jmp	.LBB115_74
.LBB115_52:                             // %.loopexit99.loopexit
                                        //   in Loop: Header=BB115_34 Depth=1
add	x8, -1
.LBB115_53:                             // %.loopexit99
                                        //   in Loop: Header=BB115_34 Depth=1
	mov	r1, -2147483648
	mov	r0, x11
	call	__bit_xor
	mov	r0, -1147483648
	jl	rax, r0, .LBB115_55
	jmp	.LBB115_54
.LBB115_54:
	call	abort
.LBB115_55:                             //   in Loop: Header=BB115_34 Depth=1
	mov	r1, 9
	jg	x11, x0, .LBB115_65
	jmp	.LBB115_56
.LBB115_56:                             //   in Loop: Header=BB115_34 Depth=1
	mov	r1, 8
	mov	r0, 9999999
	jg	x11, r0, .LBB115_65
	jmp	.LBB115_57
.LBB115_57:                             //   in Loop: Header=BB115_34 Depth=1
	mov	r1, 7
	mov	r0, 999999
	jg	x11, r0, .LBB115_65
	jmp	.LBB115_58
.LBB115_58:                             //   in Loop: Header=BB115_34 Depth=1
	mov	r1, 6
	mov	r0, 99999
	jg	x11, r0, .LBB115_65
	jmp	.LBB115_59
.LBB115_59:                             //   in Loop: Header=BB115_34 Depth=1
	mov	r1, 5
	mov	r0, 9999
	jg	x11, r0, .LBB115_65
	jmp	.LBB115_60
.LBB115_60:                             //   in Loop: Header=BB115_34 Depth=1
	mov	x4, 4
	mov	r0, 999
	jg	x11, r0, .LBB115_64
	jmp	.LBB115_61
.LBB115_61:                             //   in Loop: Header=BB115_34 Depth=1
	mov	x4, 3
	mov	r0, 99
	jg	x11, r0, .LBB115_64
	jmp	.LBB115_62
.LBB115_62:                             //   in Loop: Header=BB115_34 Depth=1
	mov	x4, 2
	mov	r0, 9
	jg	x11, r0, .LBB115_64
	jmp	.LBB115_63
.LBB115_63:                             //   in Loop: Header=BB115_34 Depth=1
	mov	x4, 1
.LBB115_64:                             //   in Loop: Header=BB115_34 Depth=1
	mov	x12, 0
	jmp	.LBB115_68
.LBB115_65:                             //   in Loop: Header=BB115_34 Depth=1
	mov	x15, [rsp+4]
	mov	[rsp+36], x7
	add	x15, x7
	mov	[rsp+16], r1
	add	x15, r1
	mov	x4, 0
.LBB115_66:                             // %memcpy.exit48
                                        //   Parent Loop BB115_34 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 10000
	mov	x12, x11
	mov	r0, x12
	call	__udivsi3
	mov	x11, rax
	mov	x5, x11
	mul	x5, -10000
	add	x5, x12
	mov	r1, 100
	mov	r0, x5
	call	__udivsi3
	mov	x6, rax
	mov	r0, x6
	mul	r0, -100
	add	r0, x5
	mov	r1, 1
	call	__bit_shl
	mov	x5, rax
	mov	x9, x15
	add	x9, x4
	add	x5, x2
	mov	r0, [x5]
	mov	x3, x9
add	x3, 2
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	r0, [x3]
	mov	x13, rax
	mov	x7, x9
	mov	r1, -256
add	x7, 3
	call	__bit_and
	mov	r1, 255
	mov	x14, rax
	mov	r0, x13
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x14
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x7]
	mov	r1, -256
	mov	x5, rax
	call	__bit_and
	mov	r1, 255
	mov	x13, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x13
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x7], rax
	mov	r0, x6
	call	__bit_shl
	mov	x5, rax
	add	x5, x2
	mov	r0, [x5]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	r0, [x9]
	mov	x6, rax
	mov	x3, x9
	mov	r1, -256
add	x3, 1
	call	__bit_and
	mov	r1, 255
	mov	x13, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x13
	mov	r1, rax
	call	__bit_or
	mov	[x9], rax
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x3]
	mov	r1, -256
	mov	x5, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
add	x4, -4
	jg	x12, x0, .LBB115_66
	jmp	.LBB115_67
.LBB115_67:                             // %.loopexit97.loopexit
                                        //   in Loop: Header=BB115_34 Depth=1
	mov	x12, 0
	sub	x12, x4
	mov	x7, [rsp+36]
	mov	x9, [rsp+28]
	mov	x15, [rsp+32]
	mov	x4, [rsp+16]
.LBB115_68:                             // %.loopexit97
                                        //   in Loop: Header=BB115_34 Depth=1
	mov	x14, x1
	add	x14, x7
	mov	r0, 100
	jl	x11, r0, .LBB115_70
	jmp	.LBB115_69
.LBB115_69:                             // %memcpy.exit50
                                        //   in Loop: Header=BB115_34 Depth=1
	mov	r1, 65532
	mov	r0, x11
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shr
	mul	rax, 5243
	mov	r1, 17
	mov	r0, rax
	call	__bit_shr
	mov	[rsp+36], rax
	mov	r0, rax
	mul	r0, -100
	add	r0, x11
	mov	r1, 65535
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_shl
	mov	x5, rax
	mov	x3, x14
	add	x3, x4
	sub	x3, x12
	add	x5, x2
	mov	r0, [x5]
	mov	x6, x7
	mov	x7, x4
	mov	x4, x3
add	x4, -2
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	r0, [x4]
	mov	x11, rax
	mov	r1, -256
add	x3, -1
	call	__bit_and
	mov	r1, 255
	mov	x13, rax
	mov	r0, x11
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x13
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
	mov	x4, x7
	mov	x7, x6
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x3]
	mov	r1, -256
	mov	x5, rax
	call	__bit_and
	mov	r1, 255
	mov	x11, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x11
	mov	r1, rax
	call	__bit_or
	mov	r1, 2
	mov	[x3], rax
	mov	r0, x12
	call	__bit_or
	mov	x12, rax
	mov	x11, [rsp+36]
.LBB115_70:                             //   in Loop: Header=BB115_34 Depth=1
	mov	r0, 10
	jl	x11, r0, .LBB115_72
	jmp	.LBB115_71
.LBB115_71:                             // %memcpy.exit51.loopexit
                                        //   in Loop: Header=BB115_34 Depth=1
	mov	r1, 1
	mov	r0, x11
	call	__bit_shl
	mov	x5, rax
	add	x14, x4
	sub	x14, x12
	add	x5, x2
	mov	r0, [x5]
	mov	x3, x14
add	x3, -2
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	r0, [x3]
	mov	x6, rax
	mov	r1, -256
add	x14, -1
	call	__bit_and
	mov	r1, 255
	mov	x11, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x11
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x14]
	mov	r1, -256
	mov	x5, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x14], rax
	jmp	.LBB115_73
.LBB115_72:                             //   in Loop: Header=BB115_34 Depth=1
	mov	r1, 48
	mov	r0, x11
	call	__bit_or
	mov	x5, [x14]
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	[x14], rax
.LBB115_73:                             // %memcpy.exit51
                                        //   in Loop: Header=BB115_34 Depth=1
	add	x7, x4
	mov	x14, [rsp+20]
	mov	x4, [rsp+24]
.LBB115_74:                             //   in Loop: Header=BB115_34 Depth=1
	mov	x3, 1
	mov	r0, x8
	mov	x8, x10
	jg	r0, x3, .LBB115_34
	jmp	.LBB115_77
.LBB115_75:                             //   in Loop: Header=BB115_38 Depth=2
add	x8, -1
	jg	x8, x3, .LBB115_38
	jmp	.LBB115_76
.LBB115_76:                             // %.loopexit100
	mov	x0, x1
	add	x0, x7
	mov	r0, [x0]
	mov	r1, -256
add	x7, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
.LBB115_77:                             // %.loopexit102
	mov	x2, [rsp+8]
	jz	x2, .LBB115_79
	jmp	.LBB115_78
.LBB115_78:
	mov	x0, x1
	add	x0, x7
	mov	r0, [x0]
	mov	r1, -256
add	x7, 1
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
.LBB115_79:
	mov	r0, -1
	mov	x3, [rsp+12]
	jg	x3, r0, .LBB115_168
	jmp	.LBB115_80
.LBB115_80:
	mov	r0, -52
	jl	x3, r0, .LBB115_82
	jmp	.LBB115_81
.LBB115_81:
	mov	r1, 9
	mov	r0, x2
	call	__udivsi3
	mov	x13, rax
	mov	x9, 0
	jmp	.LBB115_100
.LBB115_82:
	mov	x0, x7
	mov	r0, x3
	call	__bit_not
	mul	rax, 78913
	mov	r1, 18
	mov	r0, rax
	call	__bit_shr
add	rax, -15
	mov	r1, 65535
	mov	r0, rax
	call	__bit_and
	mul	rax, 58255
	mov	r1, 19
	mov	r0, rax
	call	__bit_shr
	mov	r1, -2
	mov	x5, rax
	mov	r0, x5
	call	__bit_and
	mov	x6, rax
	mov	r1, 1
	mov	x7, 1
	mov	r0, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x7, x5
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
add	x5, -1
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r1, 9
	mov	x5, rax
	mov	r0, x2
	call	__udivsi3
	mov	x13, rax
	jge	x13, x5, .LBB115_98
	jmp	.LBB115_83
.LBB115_83:
	mov	x3, x1
	mov	x7, x0
	add	x3, x7
	mov	r1, 3
	mov	r0, x3
	call	__bit_and
	mov	x4, x2
	jz	rax, .LBB115_87
	jmp	.LBB115_84
.LBB115_84:                             // %.preheader81.preheader
	add	x1, x7
add	x1, 1
	mov	x0, x3
	mov	x4, x2
.LBB115_85:                             // %.preheader81
                                        // =>This Inner Loop Header: Depth=1
	jz	x4, .LBB115_97
	jmp	.LBB115_86
.LBB115_86:                             //   in Loop: Header=BB115_85 Depth=1
	mov	r0, [x0]
add	x4, -1
	mov	x3, x0
	mov	r1, -256
add	x3, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x0], rax
	mov	r0, x1
	call	__bit_and
add	x1, 1
	mov	x0, x3
	jnz	rax, .LBB115_85
	jmp	.LBB115_87
.LBB115_87:                             // %.loopexit7.i52
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB115_94
	jmp	.LBB115_88
.LBB115_88:
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB115_90
	jmp	.LBB115_89
.LBB115_89:                             // %.preheader.i54.preheader
	mov	x0, -2147483633
	jmp	.LBB115_92
.LBB115_90:                             // %.preheader440
	mov	x0, -2147483645
	jmp	.LBB115_93
.LBB115_91:
	mov	r0, 3
	jg	x4, r0, .LBB115_90
	jmp	.LBB115_94
.LBB115_92:                             // %.preheader.i54
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
add	r0, 4
	mov	[x3], 808464432
	mov	r1, x3
add	r1, 8
	mov	[r0], 808464432
	mov	r0, x3
add	r0, 12
	mov	[r1], 808464432
add	x3, 16
add	x4, -16
	mov	r1, -2147483648
	mov	[r0], 808464432
	mov	r0, x4
	call	__bit_xor
	jg	rax, x0, .LBB115_92
	jmp	.LBB115_91
.LBB115_93:                             // =>This Inner Loop Header: Depth=1
	mov	[x3], 808464432
add	x4, -4
	mov	r1, -2147483648
add	x3, 4
	mov	r0, x4
	call	__bit_xor
	jg	rax, x0, .LBB115_93
	jmp	.LBB115_94
.LBB115_94:                             // %.loopexit5.i53
	jz	x4, .LBB115_97
	jmp	.LBB115_95
.LBB115_95:                             // %.preheader80.preheader
	mov	x0, x3
.LBB115_96:                             // %.preheader80
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
add	x4, -1
	mov	r1, -256
add	x0, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x3], rax
	mov	x3, x0
	jnz	x4, .LBB115_96
	jmp	.LBB115_97
.LBB115_97:                             // %memset.exit55
	add	x7, x2
	jmp	.LBB115_183
.LBB115_98:
	mov	x9, 0
	mov	x7, x0
	jz	x5, .LBB115_100
	jmp	.LBB115_99
.LBB115_99:
	mov	r0, x1
	add	r0, x7
	mov	x6, x5
	mul	x6, 9
	mov	r1, 48
	mov	r2, x6
	call	memset
	add	x7, x6
	mov	x9, x5
.LBB115_100:
	mov	x2, 0
	sub	x2, x3
	jge	x9, x13, .LBB115_102
	jmp	.LBB115_101
.LBB115_101:
	mov	r0, x9
	mul	r0, 9
add	r0, 9
	jg	r0, x2, .LBB115_103
	jmp	.LBB115_102
.LBB115_102:
	mov	r0, x13
	mul	r0, 9
	mov	r2, r0
	mov	r1, [rsp+8]
	sub	r2, r1
add	r2, 9
	mov	[rsp+4], r2
	mov	x0, x7
	add	x0, r1
	call	__bit_not
	mov	x3, rax
	add	x3, x0
	add	x3, x1
	mov	[rsp+16], x2
	jmp	.LBB115_118
.LBB115_103:                            // %.loopexit90
	mul	x9, -9
	mov	x3, x1
	add	x3, x7
	mov	r1, 3
	mov	r0, [rsp+8]
	add	x9, r0
	mov	r0, x3
	call	__bit_and
	mov	x2, x9
	jz	rax, .LBB115_107
	jmp	.LBB115_104
.LBB115_104:                            // %.preheader84.preheader
	add	x1, x7
add	x1, 1
	mov	x0, x3
	mov	x2, x9
.LBB115_105:                            // %.preheader84
                                        // =>This Inner Loop Header: Depth=1
	jz	x2, .LBB115_117
	jmp	.LBB115_106
.LBB115_106:                            //   in Loop: Header=BB115_105 Depth=1
	mov	r0, [x0]
add	x2, -1
	mov	x3, x0
	mov	r1, -256
add	x3, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x0], rax
	mov	r0, x1
	call	__bit_and
add	x1, 1
	mov	x0, x3
	jnz	rax, .LBB115_105
	jmp	.LBB115_107
.LBB115_107:                            // %.loopexit7.i56
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB115_114
	jmp	.LBB115_108
.LBB115_108:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB115_110
	jmp	.LBB115_109
.LBB115_109:                            // %.preheader.i58.preheader
	mov	x0, -2147483633
	jmp	.LBB115_112
.LBB115_110:                            // %.preheader450
	mov	x0, -2147483645
	jmp	.LBB115_113
.LBB115_111:
	mov	r0, 3
	jg	x2, r0, .LBB115_110
	jmp	.LBB115_114
.LBB115_112:                            // %.preheader.i58
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
add	r0, 4
	mov	[x3], 808464432
	mov	r1, x3
add	r1, 8
	mov	[r0], 808464432
	mov	r0, x3
add	r0, 12
	mov	[r1], 808464432
add	x3, 16
add	x2, -16
	mov	r1, -2147483648
	mov	[r0], 808464432
	mov	r0, x2
	call	__bit_xor
	jg	rax, x0, .LBB115_112
	jmp	.LBB115_111
.LBB115_113:                            // =>This Inner Loop Header: Depth=1
	mov	[x3], 808464432
add	x2, -4
	mov	r1, -2147483648
add	x3, 4
	mov	r0, x2
	call	__bit_xor
	jg	rax, x0, .LBB115_113
	jmp	.LBB115_114
.LBB115_114:                            // %.loopexit5.i57
	jz	x2, .LBB115_117
	jmp	.LBB115_115
.LBB115_115:                            // %.preheader83.preheader
	mov	x0, x3
.LBB115_116:                            // %.preheader83
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
add	x2, -1
	mov	r1, -256
add	x0, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x3], rax
	mov	x3, x0
	jnz	x2, .LBB115_116
	jmp	.LBB115_117
.LBB115_117:                            // %memset.exit59
	add	x7, x9
	jmp	.LBB115_183
.LBB115_118:                            // =>This Loop Header: Depth=1
                                        //     Child Loop BB115_127 Depth 2
                                        //     Child Loop BB115_130 Depth 2
	mov	[rsp+20], x3
	mov	[rsp+36], x7
	mov	[rsp+24], x9
add	x9, 1
	mov	r2, rsp
add	r2, 40
	mov	r0, x2
	mov	r1, x9
	call	ryu_fill_pow10_split_2_exp
	mov	r0, rsp
add	r0, 44
	mov	x5, [rsp+40]
	mov	x10, [r0]
	mov	r1, 0
	mov	r3, 0
	mov	r0, x5
	mov	r2, x15
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x6, rax
	mov	x11, t0
	mov	r0, x5
	mov	x0, [rsp+28]
	mov	r2, x0
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x4, x13
	mov	x13, t0
	mov	r0, x10
	mov	r2, x0
	call	__muldi3
	mov	x5, rax
	mov	x14, x5
	add	x14, x13
	mov	x3, x15
	mov	x15, x6
	add	x15, x14
	mov	x12, t0
	mov	r0, x15
	mov	r1, x6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x14
	call	__bit_and
	mov	x2, rax
	mov	r0, x15
	call	__bit_not
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x14
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	x2, rax
	mov	r0, x14
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x13
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	x12, rax
	add	x6, x11
	mov	x2, x12
	mov	r1, 0
	mov	r3, 0
	add	x2, x6
	mov	r0, x10
	mov	r2, x3
	call	__muldi3
	mov	x5, rax
	mov	x11, x5
	add	x11, x2
	mov	x10, t0
	mov	r0, x11
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	x13, rax
	mov	r0, x11
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x13
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x12
	call	__bit_and
	mov	x13, rax
	mov	r0, x2
	mov	r1, x12
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x6
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	x10, rax
	mov	r0, rsp
add	r0, 48
	mov	r1, rsp
add	r1, 52
	mov	x2, [r0]
	mov	x6, [r1]
	mov	r1, 0
	mov	r3, 0
	add	x10, x5
	mov	r0, x2
	mov	r2, x0
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x5, rax
	mov	x12, t0
	mov	r0, x2
	mov	r2, x3
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x2, rax
	mov	x7, t0
	mov	r0, x6
	mov	r2, x0
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x13, rax
	mov	x8, t0
	mov	r0, x6
	mov	r2, x3
	call	__muldi3
	mov	r1, 0
	mov	x14, rax
	mov	x15, t0
	mov	r0, x12
	mov	r2, x13
	mov	r3, x8
	call	__adddi3
	mov	r1, 0
	mov	x13, t0
	mov	r0, rax
	mov	r2, x2
	mov	r3, x7
	call	__adddi3
	mov	r1, 0
	mov	x2, rax
	mov	x12, t0
	mov	r0, x5
	mov	r2, x11
	mov	r3, x10
	call	__adddi3
	mov	r2, 0
	mov	r1, t0
	mov	r0, rax
	mov	r3, x2
	call	__adddi3
	mov	x6, rax
	mov	x2, t0
	mov	r0, x2
	mov	r1, x10
	call	__bit_xor
	mov	x5, rax
	mov	r0, x5
	call	__bit_not
	mov	x7, rax
	mov	r1, x7
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
	mov	r1, x2
	sub	r1, x10
	mov	x5, rax
	mov	r0, x7
	call	__bit_and
	mov	x7, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x10
	call	__bit_and
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x2, rax
	mov	r0, x6
	mov	r1, x11
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x6
	sub	r1, x11
	mov	r0, rax
	call	__bit_and
	mov	x7, rax
	mov	r0, x6
	call	__bit_not
	mov	r0, rax
	mov	r1, x11
	call	__bit_and
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	sub	rax, x2
add	x5, 1
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	add	x2, rax
	mov	r1, 1
	mov	r0, x2
	call	__bit_and
	mov	r0, rsp
add	r0, 56
	mov	r1, rsp
add	r1, 60
	mov	x2, [r0]
	mov	x5, [r1]
	mov	r1, 0
	mov	r3, 0
	mov	x6, rax
	mov	r0, x2
	mov	r2, x0
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x7, rax
	mov	x8, t0
	mov	r0, x2
	mov	r2, x3
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x2, rax
	mov	x10, t0
	mov	r0, x5
	mov	r2, x0
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x11, rax
	mov	x0, t0
	mov	r0, x5
	mov	r2, x3
	call	__muldi3
	mov	r1, 0
	mov	x5, rax
	mov	x3, t0
	mov	r0, x8
	mov	r2, x11
	mov	r3, x0
	call	__adddi3
	mov	r1, 0
	mov	x0, t0
	mov	r0, rax
	mov	r2, x2
	mov	r3, x10
	call	__adddi3
	mov	r1, 0
	mov	x2, rax
	mov	x8, t0
	mov	r0, x7
	mov	r2, x14
	mov	r3, x15
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x13
	mov	x13, x4
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x12
	call	__adddi3
	mov	r2, 0
	mov	x10, rax
	mov	x11, t0
	mov	r0, x10
	mov	r1, x11
	mov	r3, x2
	call	__adddi3
	mov	r1, 0
	mov	x12, t0
	mov	r0, x0
	mov	r2, x5
	mov	r3, x3
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x8
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x6
	call	__adddi3
	mov	r1, -512
	mov	x0, rax
	mov	x2, t0
	mov	r0, x0
	call	__bit_and
	mov	r2, 0
	mov	r3, 1000000000
	mov	x3, rax
	mov	r0, x0
	mov	r1, x2
	call	__umoddi3
	mov	r1, 1073741823
	mov	r0, t0
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, x3
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x0
	mov	r3, x2
	call	__adddi3
	mov	r1, -512
	mov	x0, rax
	mov	r0, x10
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	x2, rax
	mov	r0, x12
	mov	r1, x0
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x12
	mov	r3, x0
	call	__adddi3
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, x2
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x10
	mov	r3, x11
	call	__adddi3
	mov	r0, [rsp+24]
	je	r0, x13, .LBB115_131
	jmp	.LBB115_119
.LBB115_119:                            //   in Loop: Header=BB115_118 Depth=1
	mov	x11, x1
	mov	x7, [rsp+36]
	add	x11, x7
	jz	rax, .LBB115_121
	jmp	.LBB115_120
.LBB115_120:                            // %memcpy.exit60
                                        //   in Loop: Header=BB115_118 Depth=1
	mov	x4, x11
	mov	r1, 10000
add	x4, 7
	mov	r0, rax
	mov	x10, rax
	call	__udivsi3
	mov	x12, rax
	mov	x0, x12
	mul	x0, -10000
	add	x0, x10
	mov	r1, 100
	mov	r0, x0
	call	__udivsi3
	mov	x6, rax
	mov	r0, x6
	mul	r0, -100
	add	r0, x0
	mov	r1, 1
	call	__bit_shl
	mov	x0, rax
	mov	x8, mcasm_static_bff1819c724c09c306780236d311fec2
	add	x0, x8
	mov	r0, [x0]
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x4]
	mov	x2, rax
	mov	x5, x11
	mov	r1, -256
add	x5, 8
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x5]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	mov	x4, x11
	mov	r1, 1
add	x4, 5
	mov	r0, x6
	call	__bit_shl
	mov	x0, rax
	add	x0, x8
	mov	r0, [x0]
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x4]
	mov	x2, rax
	mov	x5, x11
	mov	r1, -256
add	x5, 6
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x5]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 100000000
	mov	[x5], rax
	mov	r0, x10
	call	__udivsi3
	mov	x10, rax
	mov	x0, x10
	mul	x0, -10000
	add	x0, x12
	mov	r1, 100
	mov	r0, x0
	call	__udivsi3
	mov	x6, rax
	mov	r0, x6
	mul	r0, -100
	add	r0, x0
	mov	r1, 1
	call	__bit_shl
	mov	x0, rax
	add	x0, x8
	mov	r0, [x0]
	mov	x4, x11
add	x4, 3
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x4]
	mov	x2, rax
	mov	x5, x11
	mov	r1, -256
add	x5, 4
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x5]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x5], rax
	mov	r0, x6
	call	__bit_shl
	mov	x0, rax
	add	x0, x8
	mov	r0, [x0]
	mov	x4, x11
add	x4, 1
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x4]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
	mov	r0, [x0]
	mov	x3, x11
	mov	r1, 255
add	x3, 2
	call	__bit_and
	mov	r0, [x3]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x11]
	mov	r1, -256
add	x10, 48
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x10
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	[x11], rax
	mov	x15, [rsp+32]
	mov	x3, [rsp+20]
	jmp	.LBB115_149
.LBB115_121:                            //   in Loop: Header=BB115_118 Depth=1
	mov	r1, 3
	mov	r0, x11
	call	__bit_and
	mov	x6, 9
	mov	x10, x11
	jz	rax, .LBB115_126
	jmp	.LBB115_122
.LBB115_122:                            // %.preheader88.preheader
                                        //   in Loop: Header=BB115_118 Depth=1
	mov	r0, [x11]
	mov	x10, x11
	mov	r1, -256
add	x10, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x11], rax
	mov	r0, x10
	call	__bit_and
	mov	x6, 8
	jz	rax, .LBB115_126
	jmp	.LBB115_123
.LBB115_123:                            // %.preheader88.1
                                        //   in Loop: Header=BB115_118 Depth=1
	mov	x0, x11
add	x0, 1
	mov	r0, [x0]
	mov	x10, x11
	mov	r1, -256
add	x10, 2
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x0], rax
	mov	r0, x10
	call	__bit_and
	mov	x6, 7
	jz	rax, .LBB115_126
	jmp	.LBB115_124
.LBB115_124:                            // %.preheader88.2
                                        //   in Loop: Header=BB115_118 Depth=1
	mov	x0, x11
add	x0, 2
	mov	r0, [x0]
	mov	x10, x11
	mov	r1, -256
add	x10, 3
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x0], rax
	mov	r0, x10
	call	__bit_and
	mov	x6, 6
	jz	rax, .LBB115_126
	jmp	.LBB115_125
.LBB115_125:                            // %.preheader88.3
                                        //   in Loop: Header=BB115_118 Depth=1
	mov	x10, x11
add	x11, 3
	mov	r0, [x11]
	mov	r1, -256
add	x10, 4
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x11], rax
	mov	x6, 5
.LBB115_126:                            // %.thread73.preheader
                                        //   in Loop: Header=BB115_118 Depth=1
	mov	x15, [rsp+32]
	mov	x3, [rsp+20]
	mov	x0, -2147483645
.LBB115_127:                            // %.thread73
                                        //   Parent Loop BB115_118 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	[x10], 808464432
add	x6, -4
	mov	r1, -2147483648
add	x10, 4
	mov	r0, x6
	call	__bit_xor
	jg	rax, x0, .LBB115_127
	jmp	.LBB115_128
.LBB115_128:                            // %.loopexit5.i65
                                        //   in Loop: Header=BB115_118 Depth=1
	jz	x6, .LBB115_149
	jmp	.LBB115_129
.LBB115_129:                            // %.preheader87.preheader
                                        //   in Loop: Header=BB115_118 Depth=1
	mov	x0, 0
.LBB115_130:                            // %.preheader87
                                        //   Parent Loop BB115_118 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x2, x10
	add	x2, x0
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
add	x0, 1
	mov	[x2], rax
	je	x6, x0, .LBB115_149
	jmp	.LBB115_130
.LBB115_131:
	mov	x7, rax
	mul	x13, -9
	mov	x3, [rsp+8]
	add	x13, x3
	mov	r1, 9
	mov	r0, 0
	mov	x8, [rsp+28]
	mov	x9, [rsp+32]
	mov	x10, [rsp+12]
	mov	x4, [rsp+20]
	je	x13, r1, .LBB115_135
	jmp	.LBB115_132
.LBB115_132:
	mov	r1, -2
	mov	x5, [rsp+4]
	mov	r0, x5
	call	__bit_and
	mov	x0, rax
	mov	r1, 1
	mov	x2, 1
	mov	r0, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x2, x5
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
add	x5, -1
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	x5, rax
add	x5, 1
	mov	rax, x7
	jmp	.LBB115_134
.LBB115_133:
	mov	x7, rax
	mov	r0, rax
	mul	r0, -10
	add	r0, x6
	mov	r1, 5
	je	r0, r1, .LBB115_136
	jmp	.LBB115_135
.LBB115_134:                            // =>This Inner Loop Header: Depth=1
	mov	r1, 10
	mov	x6, rax
	mov	r0, x6
	call	__udivsi3
add	x5, -1
	jz	x5, .LBB115_133
	jmp	.LBB115_134
.LBB115_135:
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, 2147483642
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	mov	x2, rax
	mov	r1, -2147483643
	mov	x3, -2147483643
	mov	r0, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x3, x0
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	r0, x2
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
	mov	x2, rax
	jmp	.LBB115_142
.LBB115_136:
	mov	r0, x3
	call	__bit_not
	mov	x5, rax
	sub	x5, x10
	mov	r0, 1
	mov	x2, 2
	jl	x5, r0, .LBB115_142
	jmp	.LBB115_137
.LBB115_137:
	mov	r0, 59
	mov	x2, 1
	jg	x5, r0, .LBB115_142
	jmp	.LBB115_138
.LBB115_138:
	mov	r0, x8
	mov	r1, x9
	call	__bit_or
	jnz	rax, .LBB115_140
	jmp	.LBB115_139
.LBB115_139:
	call	abort
.LBB115_140:
	mov	r1, 31
	mov	r0, x5
	call	__bit_and
	mov	x0, rax
	mov	r1, 0
	sub	r1, x0
	mov	x2, 0
	mov	r0, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	x5, -32
	mov	r1, 31
	mov	x3, rax
	mov	r0, x5
	call	__bit_shr
	mov	r0, -1
	mov	x5, rax
	mov	r1, x0
	call	__bit_shl
	mov	x6, 0
	sub	x6, x5
	mov	x5, rax
	mov	r0, x6
	call	__bit_not
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	sub	r0, x0
	mov	r1, 31
	mov	x0, rax
	call	__bit_and
	mov	r0, -1
	mov	r1, rax
	call	__bit_shr
	sub	x2, x3
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	x0, rax
	mov	r0, x5
	mov	r1, x6
	call	__bit_and
	mov	x2, rax
	mov	r0, x0
	call	__bit_not
	mov	x0, rax
	mov	r0, x2
	call	__bit_not
	mov	x2, rax
	mov	r0, x9
	mov	r1, x0
	call	__bit_and
	mov	x0, rax
	mov	r0, x8
	mov	r1, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	x2, 2
	jz	rax, .LBB115_142
	jmp	.LBB115_141
.LBB115_141:
	mov	x2, 1
.LBB115_142:
	jz	x13, .LBB115_151
	jmp	.LBB115_143
.LBB115_143:
	mov	x10, x13
add	x10, -1
	mov	x3, 0
	mov	x5, x7
	jz	x10, .LBB115_146
	jmp	.LBB115_144
.LBB115_144:
	mov	x8, mcasm_static_bff1819c724c09c306780236d311fec2
	mov	x6, x5
.LBB115_145:                            // %memcpy.exit68
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 100
	mov	r0, x6
	call	__udivsi3
	mov	x5, rax
	mov	r0, x5
	mul	r0, -100
	add	x6, r0
	mov	r1, 1
	mov	r0, x6
	call	__bit_shl
	mov	x0, rax
	add	x0, x8
	mov	r0, [x0]
	mov	x9, x4
add	x9, -1
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x9]
	mov	r1, -256
	mov	x6, rax
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	[x9], rax
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x4]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
add	x3, 2
	mov	r1, -2147483648
add	x4, -2
	mov	r0, x10
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x3
	call	__bit_xor
	mov	x6, x5
	jl	rax, x0, .LBB115_145
	jmp	.LBB115_146
.LBB115_146:                            // %.loopexit
	mov	x6, x5
	mov	r1, -2147483648
	mov	r0, x13
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x3
	call	__bit_xor
	mov	x4, [rsp+36]
	jge	rax, x0, .LBB115_148
	jmp	.LBB115_147
.LBB115_147:
	mov	x5, x1
	mov	r1, 10
	add	x5, x4
	mov	r0, x6
	call	__umodsi3
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	x0, rax
	mov	r0, x3
	call	__bit_not
	add	x5, x13
	add	x5, rax
	mov	r0, [x5]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
.LBB115_148:
	add	x4, x13
	mov	[rsp+36], x4
	jmp	.LBB115_151
.LBB115_149:                            // %memset.exit67
                                        //   in Loop: Header=BB115_118 Depth=1
add	x7, 9
add	x3, 9
	mov	x2, [rsp+16]
	jge	x9, x13, .LBB115_118
	jmp	.LBB115_150
.LBB115_150:                            // %memset.exit67
                                        //   in Loop: Header=BB115_118 Depth=1
	mov	r0, x9
	mul	r0, 9
add	r0, 9
	jg	r0, x2, .LBB115_103
	jmp	.LBB115_118
.LBB115_151:
	mov	x7, [rsp+36]
	jz	x2, .LBB115_183
	jmp	.LBB115_152
.LBB115_152:
	jz	x7, .LBB115_154
	jmp	.LBB115_153
.LBB115_153:                            // %.preheader86.preheader
	mov	x9, x1
add	x9, -1
	mov	x0, 0
	mov	x5, 46
	mov	x6, 57
	mov	x8, x7
	jmp	.LBB115_155
.LBB115_154:
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 49
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	jmp	.LBB115_162
.LBB115_155:                            // %.preheader86
                                        // =>This Inner Loop Header: Depth=1
	mov	x3, x9
	add	x3, x8
	mov	r0, [x3]
	mov	r1, 255
add	x7, -1
	call	__bit_and
	je	rax, x5, .LBB115_158
	jmp	.LBB115_156
.LBB115_156:                            // %.preheader86
                                        //   in Loop: Header=BB115_155 Depth=1
	je	rax, x6, .LBB115_163
	jmp	.LBB115_157
.LBB115_157:                            // %.preheader86
	mov	r0, 45
	je	rax, r0, .LBB115_159
	jmp	.LBB115_164
.LBB115_158:                            // %.preheader86._crit_edge27
                                        //   in Loop: Header=BB115_155 Depth=1
	mov	x0, x7
	jmp	.LBB115_167
.LBB115_159:                            // %.preheader86._crit_edge
	mov	x3, x8
.LBB115_160:
	add	x3, x1
	mov	r0, [x3]
	mov	r1, -256
	call	__bit_and
	mov	r1, 49
	mov	r0, rax
	call	__bit_or
	mov	r0, 1
	mov	[x3], rax
	mov	x7, [rsp+36]
	jl	x0, r0, .LBB115_162
	jmp	.LBB115_161
.LBB115_161:
	add	x0, x1
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
add	x0, 1
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
.LBB115_162:
	add	x1, x7
	mov	r0, [x1]
	mov	r1, -256
add	x7, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	jmp	.LBB115_183
.LBB115_163:                            //   in Loop: Header=BB115_155 Depth=1
	mov	r0, [x3]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x3], rax
	mov	x2, 1
	jmp	.LBB115_167
.LBB115_164:
	mov	r1, 1
	mov	x1, rax
	mov	r0, rax
	call	__bit_and
	mov	r0, 2
	mov	x7, [rsp+36]
	jne	x2, r0, .LBB115_166
	jmp	.LBB115_165
.LBB115_165:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB115_183
	jmp	.LBB115_166
.LBB115_166:
	mov	x0, [x3]
	mov	r0, x1
add	r0, 1
	mov	r1, 255
	call	__bit_and
	mov	r1, -256
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	jmp	.LBB115_183
.LBB115_167:                            //   in Loop: Header=BB115_155 Depth=1
	mov	x3, 0
	mov	x8, x7
	jz	x7, .LBB115_160
	jmp	.LBB115_155
.LBB115_168:
	mov	x3, x1
	add	x3, x7
	mov	r1, 3
	mov	r0, x3
	call	__bit_and
	mov	x4, x2
	jz	rax, .LBB115_172
	jmp	.LBB115_169
.LBB115_169:                            // %.preheader92.preheader
	add	x1, x7
add	x1, 1
	mov	x0, x3
	mov	x4, x2
.LBB115_170:                            // %.preheader92
                                        // =>This Inner Loop Header: Depth=1
	jz	x4, .LBB115_182
	jmp	.LBB115_171
.LBB115_171:                            //   in Loop: Header=BB115_170 Depth=1
	mov	r0, [x0]
add	x4, -1
	mov	x3, x0
	mov	r1, -256
add	x3, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x0], rax
	mov	r0, x1
	call	__bit_and
add	x1, 1
	mov	x0, x3
	jnz	rax, .LBB115_170
	jmp	.LBB115_172
.LBB115_172:                            // %.loopexit7.i69
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB115_179
	jmp	.LBB115_173
.LBB115_173:
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB115_175
	jmp	.LBB115_174
.LBB115_174:                            // %.preheader.i71.preheader
	mov	x0, -2147483633
	jmp	.LBB115_177
.LBB115_175:                            // %.preheader481
	mov	x0, -2147483645
	jmp	.LBB115_178
.LBB115_176:
	mov	r0, 3
	jg	x4, r0, .LBB115_175
	jmp	.LBB115_179
.LBB115_177:                            // %.preheader.i71
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
add	r0, 4
	mov	[x3], 808464432
	mov	r1, x3
add	r1, 8
	mov	[r0], 808464432
	mov	r0, x3
add	r0, 12
	mov	[r1], 808464432
add	x3, 16
add	x4, -16
	mov	r1, -2147483648
	mov	[r0], 808464432
	mov	r0, x4
	call	__bit_xor
	jg	rax, x0, .LBB115_177
	jmp	.LBB115_176
.LBB115_178:                            // =>This Inner Loop Header: Depth=1
	mov	[x3], 808464432
add	x4, -4
	mov	r1, -2147483648
add	x3, 4
	mov	r0, x4
	call	__bit_xor
	jg	rax, x0, .LBB115_178
	jmp	.LBB115_179
.LBB115_179:                            // %.loopexit5.i70
	jz	x4, .LBB115_182
	jmp	.LBB115_180
.LBB115_180:                            // %.preheader91.preheader
	mov	x0, x3
.LBB115_181:                            // %.preheader91
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
add	x4, -1
	mov	r1, -256
add	x0, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x3], rax
	mov	x3, x0
	jnz	x4, .LBB115_181
	jmp	.LBB115_182
.LBB115_182:                            // %memset.exit72
	add	x7, x2
.LBB115_183:                            // %memcpy.exit38
	mov	rax, x7
	mov	x15, [rsp+64]
	mov	x14, [rsp+68]
	mov	x13, [rsp+72]
	mov	x12, [rsp+76]
	mov	x11, [rsp+80]
	mov	x10, [rsp+84]
	mov	x9, [rsp+88]
	mov	x8, [rsp+92]
	mov	x7, [rsp+96]
	mov	x6, [rsp+100]
	mov	x5, [rsp+104]
	mov	x4, [rsp+108]
	mov	x3, [rsp+112]
	mov	x2, [rsp+116]
	mov	x1, [rsp+120]
	mov	x0, [rsp+124]
add	rsp, 128
	ret
// -- End function
// -- Begin function ryu_fill_pow10_split_exp
ryu_fill_pow10_split_exp:               // @ryu_fill_pow10_split_exp
// %bb.0:
sub	rsp, 188
	mov	[rsp+184], x0
	mov	[rsp+180], x1
	mov	[rsp+176], x2
	mov	[rsp+172], x3
	mov	[rsp+168], x4
	mov	[rsp+164], x5
	mov	[rsp+160], x6
	mov	[rsp+156], x7
	mov	[rsp+152], x8
	mov	[rsp+148], x9
	mov	[rsp+144], x10
	mov	x1, r1
	mov	x2, x1
	mul	x2, -9
	add	x2, r0
add	x2, 128
	mov	r0, -1
	mov	x0, r2
	jg	x2, r0, .LBB116_2
	jmp	.LBB116_1
.LBB116_1:
	mov	[x0], 1
	mov	r0, x0
add	r0, 4
	mov	[r0], 0
	mov	r0, x0
add	r0, 8
	mov	r1, x0
add	r1, 12
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, x0
add	r0, 16
add	x0, 20
	mov	[x0], 0
	mov	[r0], 0
	jmp	.LBB116_19
.LBB116_2:
	mov	r0, rsp
add	r0, 40
	mov	r1, rsp
add	r1, 44
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 48
	mov	r1, rsp
add	r1, 52
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 56
	mov	r1, rsp
add	r1, 60
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 64
	mov	r1, rsp
add	r1, 68
	mov	[r1], -2147483648
	mov	[r0], 0
	mov	r0, -255
	jz	x1, .LBB116_9
	jmp	.LBB116_3
.LBB116_3:
	mov	[rsp], -255
	mov	r0, rsp
add	r0, 4
	mov	r1, rsp
add	r1, 8
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 12
	mov	r1, rsp
add	r1, 16
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 20
	mov	r1, rsp
add	r1, 24
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 28
	mov	r1, rsp
add	r1, 32
	mov	[r1], -2147483648
	mov	[r0], 0
	mov	[rsp+108], -276
	mov	r0, rsp
add	r0, 112
	mov	r1, rsp
add	r1, 116
	mov	[r1], -209245859
	mov	[r0], 606470823
	mov	r0, rsp
add	r0, 120
	mov	r1, rsp
add	r1, 124
	mov	[r1], -36215714
	mov	[r0], 18528969
	mov	r0, rsp
add	r0, 128
	mov	r1, rsp
add	r1, 132
	mov	[r1], 828902024
	mov	[r0], -124440528
	mov	r0, rsp
add	r0, 136
	mov	r1, rsp
add	r1, 140
	mov	[r1], -1989124287
	mov	[r0], 917808535
.LBB116_4:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 1
	mov	r0, x1
	call	__bit_and
	jz	rax, .LBB116_6
	jmp	.LBB116_5
.LBB116_5:                              //   in Loop: Header=BB116_4 Depth=1
	mov	r0, rsp
add	r0, 72
	mov	r1, rsp
	mov	r2, rsp
add	r2, 108
	call	ryu_dyadic256_quick_mul
	mov	r0, rsp
add	r0, 104
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 32
	mov	[r1], r0
	mov	r0, rsp
add	r0, 100
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 28
	mov	[r1], r0
	mov	r0, rsp
add	r0, 96
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 24
	mov	[r1], r0
	mov	r0, rsp
add	r0, 92
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 20
	mov	[r1], r0
	mov	r0, rsp
add	r0, 88
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 16
	mov	[r1], r0
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 12
	mov	[r1], r0
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 8
	mov	[r1], r0
	mov	r0, rsp
add	r0, 76
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 4
	mov	r2, [rsp+72]
	mov	[r1], r0
	mov	[rsp], r2
.LBB116_6:                              //   in Loop: Header=BB116_4 Depth=1
	mov	r1, 1
	mov	r0, x1
	call	__bit_shr
	mov	x1, rax
	jz	x1, .LBB116_8
	jmp	.LBB116_7
.LBB116_7:                              //   in Loop: Header=BB116_4 Depth=1
	mov	r0, rsp
add	r0, 72
	mov	r1, rsp
add	r1, 108
	mov	r2, r1
	call	ryu_dyadic256_quick_mul
	mov	r0, rsp
add	r0, 104
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 140
	mov	[r1], r0
	mov	r0, rsp
add	r0, 100
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 136
	mov	[r1], r0
	mov	r0, rsp
add	r0, 96
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 132
	mov	[r1], r0
	mov	r0, rsp
add	r0, 92
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 128
	mov	[r1], r0
	mov	r0, rsp
add	r0, 88
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 124
	mov	[r1], r0
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 120
	mov	[r1], r0
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 116
	mov	[r1], r0
	mov	r0, rsp
add	r0, 76
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 112
	mov	r2, [rsp+72]
	mov	[r1], r0
	mov	[rsp+108], r2
	jmp	.LBB116_4
.LBB116_8:
	mov	r0, rsp
add	r0, 4
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 40
	mov	[r1], r0
	mov	r0, rsp
add	r0, 8
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 44
	mov	[r1], r0
	mov	r0, rsp
add	r0, 12
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 48
	mov	[r1], r0
	mov	r0, rsp
add	r0, 16
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 52
	mov	[r1], r0
	mov	r0, rsp
add	r0, 20
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 56
	mov	[r1], r0
	mov	r0, rsp
add	r0, 24
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 60
	mov	[r1], r0
	mov	r0, rsp
add	r0, 28
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 64
	mov	[r1], r0
	mov	r0, rsp
add	r0, 32
	mov	r1, [r0]
	mov	r2, rsp
add	r2, 68
	mov	r0, [rsp]
	mov	[rsp+36], r0
	mov	r0, [rsp+36]
	mov	[r2], r1
.LBB116_9:
	add	r0, x2
	mov	[rsp+36], r0
	mov	r0, rsp
add	r0, 108
	mov	r1, rsp
add	r1, 36
	call	ryu_dyadic256_as_mantissa_type
	mov	r0, rsp
add	r0, 112
	mov	x3, [r0]
	mov	x4, [rsp+108]
	mov	r2, 1
	mov	r3, 0
	mov	r0, x4
	mov	r1, x3
	call	__adddi3
	mov	x2, rax
	mov	x1, t0
	mov	r0, x4
	mov	r1, x3
	call	__bit_and
	mov	r0, rsp
add	r0, 116
	mov	r1, rsp
add	r1, 120
	mov	x4, [r1]
	mov	x3, [r0]
	mov	r0, -1
	jne	rax, r0, .LBB116_13
	jmp	.LBB116_10
.LBB116_10:
	mov	r2, 1
	mov	r3, 0
	mov	r0, x3
	mov	r1, x4
	call	__adddi3
	mov	x3, rax
	mov	x4, t0
	mov	r0, x3
	mov	r1, x4
	call	__bit_or
	jnz	rax, .LBB116_13
	jmp	.LBB116_11
.LBB116_11:
	mov	x3, rsp
add	x3, 124
	mov	x4, rsp
add	x4, 128
	mov	r1, [x4]
	mov	r0, [x3]
	mov	r2, 1
	mov	r3, 0
	call	__adddi3
	mov	r1, t0
	mov	[x4], r1
	mov	[x3], rax
	mov	r0, rax
	call	__bit_or
	mov	x3, 0
	mov	x4, 0
	jnz	rax, .LBB116_13
	jmp	.LBB116_12
.LBB116_12:
	mov	x4, rsp
add	x4, 132
	mov	x5, rsp
add	x5, 136
	mov	r1, [x5]
	mov	r0, [x4]
	mov	r2, 1
	mov	r3, 0
	call	__adddi3
	mov	[x5], t0
	mov	[x4], rax
	mov	x4, 0
.LBB116_13:
	mov	r0, rsp
add	r0, 124
	mov	r1, rsp
add	r1, 128
	mov	x5, [r1]
	mov	x6, [r0]
	mov	r0, rsp
add	r0, 132
	mov	r1, rsp
add	r1, 136
	mov	x7, [r1]
	mov	x8, [r0]
	mov	r0, x8
	mov	r1, x7
	call	__bit_or
	jnz	rax, .LBB116_17
	jmp	.LBB116_14
.LBB116_14:
	mov	r1, 1000000000
	mov	r0, x6
	call	__bit_xor
	mov	r0, rax
	mov	r1, x5
	call	__bit_or
	jnz	rax, .LBB116_16
	jmp	.LBB116_15
.LBB116_15:
	mov	r0, x3
	mov	r1, x2
	call	__bit_or
	mov	x5, rax
	mov	r0, x4
	mov	r1, x1
	call	__bit_or
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	x5, 0
	mov	x6, 1000000000
	mov	rax, 1000000000
	jz	r0, .LBB116_18
	jmp	.LBB116_17
.LBB116_16:
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
	mov	x9, rax
	mov	r0, x6
	call	__bit_not
	mov	r1, 1000000001
	mov	r0, rax
	call	__bit_and
	mov	r1, 1000000001
	mov	x10, rax
	mov	r0, x6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x6
add	r1, -1000000001
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
add	x9, 1
	mov	r0, x9
	mov	r1, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, x6
	jnz	r0, .LBB116_18
	jmp	.LBB116_17
.LBB116_17:
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, x8
	mov	r1, x7
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x8
	mov	r3, x7
	call	__adddi3
	mov	r2, 1000000000
	mov	r3, 0
	mov	x7, rax
	mov	r0, x5
	mov	r1, x7
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x5
	mov	r3, x7
	call	__adddi3
	mov	r1, -512
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, rax
	mov	r1, x7
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x6
	mov	r3, x5
	call	__adddi3
	mov	x5, 0
.LBB116_18:
	mov	[x0], x2
	mov	r0, x0
add	r0, 4
	mov	[r0], x1
	mov	r0, x0
add	r0, 8
	mov	r1, x0
add	r1, 12
	mov	[r1], x4
	mov	[r0], x3
	mov	r0, x0
add	r0, 16
add	x0, 20
	mov	[x0], x5
	mov	[r0], rax
.LBB116_19:
	mov	x10, [rsp+144]
	mov	x9, [rsp+148]
	mov	x8, [rsp+152]
	mov	x7, [rsp+156]
	mov	x6, [rsp+160]
	mov	x5, [rsp+164]
	mov	x4, [rsp+168]
	mov	x3, [rsp+172]
	mov	x2, [rsp+176]
	mov	x1, [rsp+180]
	mov	x0, [rsp+184]
add	rsp, 188
	ret
// -- End function
// -- Begin function ryu_mul_shift_mod1e9_exact
ryu_mul_shift_mod1e9_exact:             // @ryu_mul_shift_mod1e9_exact
// %bb.0:
sub	rsp, 128
	mov	[rsp+124], x0
	mov	[rsp+120], x1
	mov	[rsp+116], x2
	mov	[rsp+112], x3
	mov	[rsp+108], x4
	mov	[rsp+104], x5
	mov	[rsp+100], x6
	mov	[rsp+96], x7
	mov	[rsp+92], x8
	mov	[rsp+88], x9
	mov	[rsp+84], x10
	mov	[rsp+80], x11
	mov	[rsp+76], x12
	mov	[rsp+72], x13
	mov	[rsp+68], x14
	mov	[rsp+64], x15
	mov	[rsp+24], r3
	mov	x7, r2
	mov	x5, r1
	mov	r1, rsp
add	r1, 56
	mov	[rsp+20], r1
	mov	r1, rsp
add	r1, 48
	mov	[rsp+16], r1
	mov	x4, rsp
add	x4, 40
	mov	r1, x7
add	r1, 4
	mov	x1, [x7]
	mov	x2, [r1]
	mov	r1, 0
	mov	r3, 0
	mov	x6, r0
	mov	r0, x1
	mov	r2, x6
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x0, rax
	mov	[rsp+28], x0
	mov	x3, t0
	mov	r0, x1
	mov	r2, x5
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x1, rax
	mov	x8, t0
	mov	r0, x2
	mov	r2, x6
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x9, rax
	mov	x10, t0
	mov	r0, x2
	mov	r2, x5
	call	__muldi3
	mov	r1, 0
	mov	x2, rax
	mov	x11, t0
	mov	r0, x3
	mov	r2, x9
	mov	r3, x10
	call	__adddi3
	mov	r1, 0
	mov	x3, t0
	mov	r0, rax
	mov	r2, x1
	mov	r3, x8
	call	__adddi3
	mov	x1, rax
	mov	x8, t0
	mov	r0, rsp
add	r0, 36
	mov	[r0], x1
	mov	r1, 0
	mov	[rsp+32], x0
	mov	r0, x3
	mov	r2, x2
	mov	r3, x11
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x8
	call	__adddi3
	mov	r0, x7
add	r0, 8
	mov	r1, x7
add	r1, 12
	mov	x2, [r0]
	mov	x3, [r1]
	mov	r1, 0
	mov	r3, 0
	mov	x12, rax
	mov	x13, t0
	mov	r0, x2
	mov	r2, x6
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x14, rax
	mov	x8, t0
	mov	r0, x2
	mov	r2, x5
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x2, rax
	mov	x15, t0
	mov	r0, x3
	mov	r2, x6
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x11, rax
	mov	x0, t0
	mov	r0, x3
	mov	r2, x5
	call	__muldi3
	mov	r1, 0
	mov	x9, rax
	mov	x10, t0
	mov	r0, x8
	mov	r2, x11
	mov	r3, x0
	call	__adddi3
	mov	r1, 0
	mov	x11, t0
	mov	r0, rax
	mov	r2, x2
	mov	r3, x15
	call	__adddi3
	mov	r3, 0
	mov	x0, rax
	mov	x8, t0
	mov	r0, x12
	mov	r1, x13
	mov	r2, x14
	call	__adddi3
	mov	r2, 0
	mov	r1, t0
	mov	r0, rax
	mov	r3, x0
	call	__adddi3
	mov	x3, rax
	mov	x2, t0
	mov	r0, rsp
add	r0, 44
	mov	[r0], x2
	mov	[x4], x3
	mov	r0, x2
	mov	r1, x13
	call	__bit_xor
	mov	x14, rax
	mov	r0, x14
	call	__bit_not
	mov	r1, x2
	sub	r1, x13
	mov	x15, rax
	mov	r0, x15
	call	__bit_and
	mov	x0, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x13
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x13, rax
	mov	r0, x3
	mov	r1, x12
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x3
	sub	r1, x12
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
	mov	r0, x3
	call	__bit_not
	mov	r0, rax
	mov	r1, x12
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
add	x15, 1
	sub	x0, x13
	mov	r0, x14
	mov	r1, x15
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
	mov	r1, x0
	call	__bit_and
	mov	r1, 0
	add	x13, rax
	mov	r0, x11
	mov	r2, x9
	mov	r3, x10
	call	__adddi3
	mov	r1, 1
	mov	x9, rax
	mov	x10, t0
	mov	r0, x13
	call	__bit_and
	mov	r0, x7
add	r0, 16
add	x7, 20
	mov	x0, [r0]
	mov	x11, [x7]
	mov	r1, 0
	mov	r3, 0
	mov	x7, rax
	mov	r0, x0
	mov	r2, x6
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x12, rax
	mov	x13, t0
	mov	r0, x0
	mov	r2, x5
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x0, rax
	mov	x14, t0
	mov	r0, x11
	mov	r2, x6
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x6, rax
	mov	x15, t0
	mov	r0, x11
	mov	r2, x5
	call	__muldi3
	mov	r1, 0
	mov	x5, rax
	mov	x4, t0
	mov	r0, x13
	mov	r2, x6
	mov	r3, x15
	call	__adddi3
	mov	r1, 0
	mov	x6, t0
	mov	r0, rax
	mov	r2, x0
	mov	r3, x14
	call	__adddi3
	mov	r3, 0
	mov	x0, rax
	mov	x13, t0
	mov	r0, x9
	mov	x9, [rsp+28]
	mov	r1, x10
	mov	r2, x12
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x8
	call	__adddi3
	mov	r2, 0
	mov	r1, t0
	mov	r0, rax
	mov	r3, x0
	mov	x0, [rsp+24]
	call	__adddi3
	mov	x12, rax
	mov	x11, t0
	mov	r0, rsp
add	r0, 52
	mov	[r0], x11
	mov	r1, 0
	mov	r0, [rsp+16]
	mov	[r0], x12
	mov	r0, x6
	mov	r2, x5
	mov	r3, x4
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x13
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x7
	call	__adddi3
	mov	x7, rax
	mov	x5, t0
	mov	r0, rsp
add	r0, 60
	mov	[r0], x5
	mov	r0, [rsp+20]
	mov	[r0], x7
	mov	x13, x7
	mov	x14, x5
	jz	x0, .LBB117_17
	jmp	.LBB117_1
.LBB117_1:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483393
	mov	x13, 0
	mov	x14, 0
	mov	x12, 0
	mov	x11, 0
	mov	x3, 0
	mov	x2, 0
	mov	x9, 0
	mov	x1, 0
	jg	rax, r0, .LBB117_17
	jmp	.LBB117_2
.LBB117_2:
	mov	r1, 6
	mov	r0, x0
	call	__bit_shr
	mov	r1, 63
	mov	x9, rax
	mov	r0, x0
	call	__bit_and
	mov	x8, rax
	mov	r1, 3
	mov	x15, 3
	mov	r0, x9
	call	__bit_shl
	mov	x6, rsp
add	x6, 32
	add	x6, rax
	mov	x14, [x6]
	mov	r0, x6
add	r0, 4
	mov	x1, [r0]
	jnz	x8, .LBB117_6
	jmp	.LBB117_3
.LBB117_3:
	mov	r0, 191
	mov	x9, x14
	mov	x14, 0
	jg	x0, r0, .LBB117_17
	jmp	.LBB117_4
.LBB117_4:
	mov	r0, x6
add	r0, 8
	mov	r1, x6
add	r1, 12
	mov	x2, [r1]
	mov	x3, [r0]
	mov	r0, 127
	jg	x0, r0, .LBB117_17
	jmp	.LBB117_5
.LBB117_5:
	mov	r0, x6
add	r0, 16
add	x6, 20
	mov	x11, [x6]
	mov	x12, [r0]
	jmp	.LBB117_17
.LBB117_6:
	mov	x10, 64
	mov	r1, 31
	sub	x10, x8
	mov	r0, x8
	call	__bit_and
	mov	x0, rax
	mov	r1, 0
	sub	r1, x0
	mov	r0, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, x8
add	r0, -32
	mov	r1, 31
	mov	x4, rax
	mov	[rsp+20], r0
	call	__bit_shr
	mov	x3, rax
	mov	r0, x1
	mov	r1, x0
	call	__bit_shr
	sub	x11, x3
	mov	x12, rax
	mov	r0, x11
	call	__bit_not
	mov	r0, x12
	mov	r1, rax
	call	__bit_and
	mov	x13, rax
	mov	r0, x14
	mov	r1, x0
	call	__bit_shr
	mov	x14, rax
	mov	r0, 32
	sub	r0, x0
	mov	r1, 31
	mov	x3, 32
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_shl
	mov	r1, 0
	sub	r1, x4
	mov	r0, rax
	call	__bit_and
	mov	r0, x14
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x11
	call	__bit_and
	mov	r0, rax
	mov	r1, x13
	call	__bit_or
	mov	[rsp+28], rax
	mov	r0, x12
	mov	r1, x11
	call	__bit_and
	mov	x1, rax
	mov	[rsp+16], x9
	je	x9, x15, .LBB117_8
	jmp	.LBB117_7
.LBB117_7:
	mov	r0, x6
add	r0, 8
	mov	r1, x6
add	r1, 12
	mov	x0, [r1]
	mov	x4, [r0]
	mov	r1, 31
	mov	r0, x10
	call	__bit_and
	mov	x11, rax
	mov	r1, 0
	sub	r1, x11
	mov	r0, x11
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, x10
add	r0, -32
	mov	r1, 31
	mov	x12, rax
	call	__bit_shr
	mov	x13, rax
	mov	r0, x4
	mov	r1, x11
	call	__bit_shl
	mov	x14, 0
	sub	x14, x13
	mov	x13, rax
	mov	r0, x14
	call	__bit_not
	mov	r0, x13
	mov	r1, rax
	call	__bit_and
	mov	x15, rax
	mov	r0, x0
	mov	r1, x11
	call	__bit_shl
	sub	x3, x11
	mov	r1, 31
	mov	x0, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x4
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x12
	mov	r0, rax
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x14
	call	__bit_and
	mov	r0, rax
	mov	r1, x15
	call	__bit_or
	mov	x0, rax
	mov	r0, x13
	mov	r1, x14
	call	__bit_and
	mov	x3, rax
	mov	r0, x0
	mov	r1, x1
	call	__bit_or
	mov	x1, rax
	mov	r0, x3
	mov	r1, [rsp+28]
	call	__bit_or
	mov	[rsp+28], rax
.LBB117_8:
	mov	r0, 191
	mov	x3, 0
	mov	x12, 0
	mov	x11, 0
	mov	r1, [rsp+24]
	jg	r1, r0, .LBB117_15
	jmp	.LBB117_9
.LBB117_9:
	mov	x13, [rsp+16]
add	x13, 1
	mov	r1, 3
	mov	x9, 3
	mov	r0, x13
	call	__bit_shl
	mov	x15, rsp
add	x15, 32
	add	x15, rax
	mov	x0, [x15]
	mov	r0, x15
add	r0, 4
	mov	x2, [r0]
	mov	r1, 31
	mov	r0, x8
	call	__bit_and
	mov	x3, rax
	mov	r1, 0
	sub	r1, x3
	mov	r0, x3
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 31
	mov	x4, rax
	mov	r0, [rsp+20]
	call	__bit_shr
	mov	x14, rax
	mov	r0, 32
	sub	r0, x3
	mov	r1, 31
	mov	x12, 32
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_shl
	mov	r1, 0
	sub	r1, x4
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	r0, x0
	mov	r1, x3
	call	__bit_shr
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	x0, 0
	sub	x0, x14
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x4, rax
	mov	r0, x2
	mov	r1, x3
	call	__bit_shr
	mov	x2, rax
	mov	r0, x0
	call	__bit_not
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	x3, rax
	mov	r0, x2
	mov	r1, x0
	call	__bit_and
	mov	x2, rax
	je	x13, x9, .LBB117_11
	jmp	.LBB117_10
.LBB117_10:
	mov	r0, x15
add	r0, 8
add	x15, 12
	mov	x4, [x15]
	mov	x9, [r0]
	mov	r1, 31
	mov	r0, x10
	call	__bit_and
	mov	x0, rax
	mov	r1, 0
	sub	r1, x0
	mov	r0, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r0, x10
add	r0, -32
	mov	r1, 31
	mov	[rsp+12], rax
	call	__bit_shr
	mov	x13, rax
	mov	r0, x9
	mov	r1, x0
	call	__bit_shl
	mov	x14, 0
	sub	x14, x13
	mov	x13, rax
	mov	r0, x14
	call	__bit_not
	mov	r0, x13
	mov	r1, rax
	call	__bit_and
	mov	x15, rax
	mov	[rsp+4], x4
	mov	r0, x4
	mov	r1, x0
	call	__bit_shl
	sub	x12, x0
	mov	r1, 31
	mov	x0, rax
	mov	r0, x12
	call	__bit_and
	mov	[rsp+8], x9
	mov	r0, x9
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	mov	r0, [rsp+12]
	sub	r1, r0
	mov	r0, rax
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x14
	call	__bit_and
	mov	r0, rax
	mov	r1, x15
	call	__bit_or
	mov	x0, rax
	mov	r0, x13
	mov	r1, x14
	call	__bit_and
	mov	x4, rax
	mov	r0, x0
	mov	r1, x2
	call	__bit_or
	mov	x2, rax
	mov	r0, x4
	mov	r1, x3
	call	__bit_or
	mov	x3, rax
	mov	r0, 127
	mov	x12, 0
	mov	r1, [rsp+24]
	jg	r1, r0, .LBB117_15
	jmp	.LBB117_13
.LBB117_11:
	mov	x13, 0
	mov	r0, 127
	mov	x14, 0
	mov	x12, 0
	mov	x9, [rsp+28]
	mov	r1, [rsp+24]
	jg	r1, r0, .LBB117_17
	jmp	.LBB117_12
.LBB117_12:
	mov	r0, x6
add	r0, 16
	mov	x9, [r0]
	mov	r0, x6
add	r0, 20
	mov	x4, [r0]
	mov	r1, 31
	mov	r0, x8
	call	__bit_and
	mov	x11, rax
	mov	r1, 0
	sub	r1, x11
	mov	r0, x11
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 31
	mov	x13, rax
	mov	r0, [rsp+20]
	call	__bit_shr
	mov	x14, rax
	mov	r0, x4
	mov	r1, x11
	call	__bit_shr
	mov	x15, 0
	sub	x15, x14
	mov	x14, rax
	mov	r0, x15
	call	__bit_not
	mov	r0, x14
	mov	r1, rax
	call	__bit_and
	mov	x0, rax
	mov	r0, x9
	mov	r1, x11
	call	__bit_shr
	mov	r0, 32
	sub	r0, x11
	mov	r1, 31
	mov	x11, rax
	call	__bit_and
	mov	r0, x4
	mov	r1, rax
	call	__bit_shl
	sub	x12, x13
	mov	r0, rax
	mov	r1, x12
	call	__bit_and
	mov	r0, x11
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x15
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	x12, rax
	mov	r0, x14
	mov	r1, x15
	call	__bit_and
	mov	x11, rax
	jmp	.LBB117_14
.LBB117_13:
	mov	r1, 31
	mov	r0, x8
	call	__bit_and
	mov	x0, rax
	mov	r1, 0
	sub	r1, x0
	mov	x13, 0
	mov	r0, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 31
	mov	x4, rax
	mov	r0, [rsp+20]
	call	__bit_shr
	mov	x11, rax
	mov	x9, [rsp+4]
	mov	r0, x9
	mov	r1, x0
	call	__bit_shr
	mov	x14, 0
	sub	x14, x11
	mov	x11, rax
	mov	r0, x14
	call	__bit_not
	mov	r0, x11
	mov	r1, rax
	call	__bit_and
	mov	x12, rax
	mov	r0, [rsp+8]
	mov	r1, x0
	call	__bit_shr
	mov	r0, 32
	sub	r0, x0
	mov	r1, 31
	mov	x0, rax
	call	__bit_and
	mov	r0, x9
	mov	r1, rax
	call	__bit_shl
	mov	r1, 0
	sub	r1, x4
	mov	r0, rax
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x14
	call	__bit_and
	mov	r0, rax
	mov	r1, x12
	call	__bit_or
	mov	x12, rax
	mov	r0, x11
	mov	r1, x14
	call	__bit_and
	mov	x11, rax
	mov	r0, 1
	mov	x14, 0
	mov	x9, [rsp+28]
	mov	r1, [rsp+16]
	je	r1, r0, .LBB117_17
	jmp	.LBB117_14
.LBB117_14:
	mov	r0, x6
add	r0, 24
add	x6, 28
	mov	x6, [x6]
	mov	x4, [r0]
	mov	r1, 31
	mov	r0, x10
	call	__bit_and
	mov	x13, rax
	mov	r1, 0
	sub	r1, x13
	mov	x14, 0
	mov	r0, x13
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	x10, -32
	mov	r1, 31
	mov	x9, rax
	mov	r0, x10
	call	__bit_shr
	mov	x10, rax
	mov	r0, x4
	mov	r1, x13
	call	__bit_shl
	mov	x0, 0
	sub	x0, x10
	mov	x10, rax
	mov	r0, x0
	call	__bit_not
	mov	r0, x10
	mov	r1, rax
	call	__bit_and
	mov	x15, rax
	mov	r0, x6
	mov	r1, x13
	call	__bit_shl
	mov	r0, 32
	sub	r0, x13
	mov	r1, 31
	mov	x13, rax
	call	__bit_and
	mov	r0, x4
	mov	r1, rax
	call	__bit_shr
	sub	x14, x9
	mov	r0, rax
	mov	r1, x14
	call	__bit_and
	mov	r0, x13
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, x15
	call	__bit_or
	mov	x4, rax
	mov	r0, x10
	mov	r1, x0
	call	__bit_and
	mov	x0, rax
	mov	r0, x4
	mov	r1, x11
	call	__bit_or
	mov	x11, rax
	mov	r0, x0
	mov	r1, x12
	call	__bit_or
	mov	x12, rax
.LBB117_15:
	mov	r1, 31
	mov	r0, x8
	call	__bit_and
	mov	x0, rax
	mov	r1, 0
	sub	r1, x0
	mov	r0, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 31
	mov	x4, rax
	mov	r0, [rsp+20]
	call	__bit_shr
	mov	x8, rax
	mov	r0, x5
	mov	r1, x0
	call	__bit_shr
	mov	x9, 0
	sub	x9, x8
	mov	x8, rax
	mov	r0, x9
	call	__bit_not
	mov	r0, x8
	mov	r1, rax
	call	__bit_and
	mov	x10, rax
	mov	r0, x7
	mov	r1, x0
	call	__bit_shr
	mov	r0, 32
	sub	r0, x0
	mov	r1, 31
	mov	x0, rax
	call	__bit_and
	mov	r0, x5
	mov	r1, rax
	call	__bit_shl
	mov	r1, 0
	sub	r1, x4
	mov	r0, rax
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x9
	call	__bit_and
	mov	r0, rax
	mov	r1, x10
	call	__bit_or
	mov	x13, rax
	mov	r0, x8
	mov	r1, x9
	call	__bit_and
	mov	x14, rax
	mov	x9, [rsp+28]
	mov	r0, [rsp+16]
	jz	r0, .LBB117_17
	jmp	.LBB117_16
.LBB117_16:
	mov	x13, 0
	mov	x14, 0
.LBB117_17:
	mov	r1, -512
	mov	r0, x13
	call	__bit_and
	mov	r2, 0
	mov	r3, 1000000000
	mov	x0, rax
	mov	r0, x13
	mov	r1, x14
	call	__umoddi3
	mov	r1, 1073741823
	mov	r0, t0
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, x0
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x13
	mov	r3, x14
	call	__adddi3
	mov	r1, -512
	mov	x0, rax
	mov	r0, x12
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	x4, rax
	mov	r0, x11
	mov	r1, x0
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x11
	mov	r3, x0
	call	__adddi3
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, x4
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x12
	mov	r3, x11
	call	__adddi3
	mov	r1, -512
	mov	x0, rax
	mov	r0, x3
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	x4, rax
	mov	r0, x2
	mov	r1, x0
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x2
	mov	r3, x0
	call	__adddi3
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, x4
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x3
	mov	r3, x2
	call	__adddi3
	mov	r1, -512
	mov	x0, rax
	mov	r0, x9
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	x2, rax
	mov	r0, x1
	mov	r1, x0
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x1
	mov	r3, x0
	call	__adddi3
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, x2
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x9
	mov	r3, x1
	call	__adddi3
	mov	x15, [rsp+64]
	mov	x14, [rsp+68]
	mov	x13, [rsp+72]
	mov	x12, [rsp+76]
	mov	x11, [rsp+80]
	mov	x10, [rsp+84]
	mov	x9, [rsp+88]
	mov	x8, [rsp+92]
	mov	x7, [rsp+96]
	mov	x6, [rsp+100]
	mov	x5, [rsp+104]
	mov	x4, [rsp+108]
	mov	x3, [rsp+112]
	mov	x2, [rsp+116]
	mov	x1, [rsp+120]
	mov	x0, [rsp+124]
add	rsp, 128
	ret
// -- End function
// -- Begin function ryu_fill_pow10_split_2_exp
ryu_fill_pow10_split_2_exp:             // @ryu_fill_pow10_split_2_exp
// %bb.0:
sub	rsp, 188
	mov	[rsp+184], x0
	mov	[rsp+180], x1
	mov	[rsp+176], x2
	mov	[rsp+172], x3
	mov	[rsp+168], x4
	mov	[rsp+164], x5
	mov	[rsp+160], x6
	mov	[rsp+156], x7
	mov	[rsp+152], x8
	mov	[rsp+148], x9
	mov	[rsp+144], x10
	mov	x0, r2
	mov	x2, r1
	mov	x1, r0
	mov	[rsp+36], -255
	mov	r0, rsp
add	r0, 40
	mov	r1, rsp
add	r1, 44
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 48
	mov	r1, rsp
add	r1, 52
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 56
	mov	r1, rsp
add	r1, 60
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 64
	mov	r1, rsp
add	r1, 68
	mov	[r1], -2147483648
	mov	[r0], 0
	mov	[rsp], -255
	mov	r0, rsp
add	r0, 4
	mov	r1, rsp
add	r1, 8
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 12
	mov	r1, rsp
add	r1, 16
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 20
	mov	r1, rsp
add	r1, 24
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 28
	mov	r1, rsp
add	r1, 32
	mov	[r1], -2147483648
	mov	[r0], 0
	mov	[rsp+108], -226
	mov	r0, rsp
add	r0, 112
	mov	r1, rsp
add	r1, 116
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 120
	mov	r1, rsp
add	r1, 124
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 128
	mov	r1, rsp
add	r1, 132
	mov	[r1], 0
	mov	[r0], 0
	mov	r0, rsp
add	r0, 136
	mov	r1, rsp
add	r1, 140
	mov	[r1], -294967296
	mov	[r0], 0
.LBB118_1:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 1
	mov	r0, x2
	call	__bit_and
	jz	rax, .LBB118_3
	jmp	.LBB118_2
.LBB118_2:                              //   in Loop: Header=BB118_1 Depth=1
	mov	r0, rsp
add	r0, 72
	mov	r1, rsp
	mov	r2, rsp
add	r2, 108
	call	ryu_dyadic256_quick_mul
	mov	r0, rsp
add	r0, 104
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 32
	mov	[r1], r0
	mov	r0, rsp
add	r0, 100
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 28
	mov	[r1], r0
	mov	r0, rsp
add	r0, 96
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 24
	mov	[r1], r0
	mov	r0, rsp
add	r0, 92
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 20
	mov	[r1], r0
	mov	r0, rsp
add	r0, 88
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 16
	mov	[r1], r0
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 12
	mov	[r1], r0
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 8
	mov	[r1], r0
	mov	r0, rsp
add	r0, 76
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 4
	mov	r2, [rsp+72]
	mov	[r1], r0
	mov	[rsp], r2
.LBB118_3:                              //   in Loop: Header=BB118_1 Depth=1
	mov	r1, 1
	mov	r0, x2
	call	__bit_shr
	mov	x2, rax
	jz	x2, .LBB118_5
	jmp	.LBB118_4
.LBB118_4:                              //   in Loop: Header=BB118_1 Depth=1
	mov	r0, rsp
add	r0, 72
	mov	r1, rsp
add	r1, 108
	mov	r2, r1
	call	ryu_dyadic256_quick_mul
	mov	r0, rsp
add	r0, 104
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 140
	mov	[r1], r0
	mov	r0, rsp
add	r0, 100
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 136
	mov	[r1], r0
	mov	r0, rsp
add	r0, 96
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 132
	mov	[r1], r0
	mov	r0, rsp
add	r0, 92
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 128
	mov	[r1], r0
	mov	r0, rsp
add	r0, 88
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 124
	mov	[r1], r0
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 120
	mov	[r1], r0
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 116
	mov	[r1], r0
	mov	r0, rsp
add	r0, 76
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 112
	mov	r2, [rsp+72]
	mov	[r1], r0
	mov	[rsp+108], r2
	jmp	.LBB118_1
.LBB118_5:
	mov	r0, rsp
add	r0, 4
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 40
	mov	[r1], r0
	mov	r0, rsp
add	r0, 8
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 44
	mov	[r1], r0
	mov	r0, rsp
add	r0, 12
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 48
	mov	[r1], r0
	mov	r0, rsp
add	r0, 16
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 52
	mov	[r1], r0
	mov	r0, rsp
add	r0, 20
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 56
	mov	[r1], r0
	mov	r0, rsp
add	r0, 24
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 60
	mov	[r1], r0
	mov	r0, rsp
add	r0, 28
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 64
	mov	[r1], r0
	mov	r0, rsp
add	r0, 32
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 68
	mov	r2, [rsp]
	mov	[rsp+36], r2
	mov	r2, [rsp+36]
	mov	[r1], r0
	sub	r2, x1
add	r2, 128
	mov	[rsp+36], r2
	mov	r0, rsp
add	r0, 108
	mov	r1, rsp
add	r1, 36
	call	ryu_dyadic256_as_mantissa_type
	mov	r0, rsp
add	r0, 112
	mov	x3, [r0]
	mov	x4, [rsp+108]
	mov	r0, rsp
add	r0, 116
	mov	r1, rsp
add	r1, 120
	mov	x2, [r1]
	mov	x1, [r0]
	mov	r0, rsp
add	r0, 124
	mov	r1, rsp
add	r1, 128
	mov	x5, [r1]
	mov	x6, [r0]
	mov	r0, rsp
add	r0, 132
	mov	r1, rsp
add	r1, 136
	mov	x7, [r1]
	mov	x8, [r0]
	mov	r0, x8
	mov	r1, x7
	call	__bit_or
	jnz	rax, .LBB118_9
	jmp	.LBB118_6
.LBB118_6:
	mov	r1, 1000000000
	mov	r0, x6
	call	__bit_xor
	mov	r0, rax
	mov	r1, x5
	call	__bit_or
	jnz	rax, .LBB118_8
	jmp	.LBB118_7
.LBB118_7:
	mov	r0, x1
	mov	r1, x4
	call	__bit_or
	mov	x5, rax
	mov	r0, x2
	mov	r1, x3
	call	__bit_or
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	x5, 0
	mov	x6, 1000000000
	mov	rax, 1000000000
	jz	r0, .LBB118_10
	jmp	.LBB118_9
.LBB118_8:
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
	mov	x9, rax
	mov	r0, x6
	call	__bit_not
	mov	r1, 1000000001
	mov	r0, rax
	call	__bit_and
	mov	r1, 1000000001
	mov	x10, rax
	mov	r0, x6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x6
add	r1, -1000000001
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
add	x9, 1
	mov	r0, x9
	mov	r1, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, x6
	jnz	r0, .LBB118_10
	jmp	.LBB118_9
.LBB118_9:
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, x8
	mov	r1, x7
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x8
	mov	r3, x7
	call	__adddi3
	mov	r2, 1000000000
	mov	r3, 0
	mov	x7, rax
	mov	r0, x5
	mov	r1, x7
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x5
	mov	r3, x7
	call	__adddi3
	mov	r1, -512
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, rax
	mov	r1, x7
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x6
	mov	r3, x5
	call	__adddi3
	mov	x5, 0
.LBB118_10:
	mov	[x0], x4
	mov	r0, x0
add	r0, 4
	mov	[r0], x3
	mov	r0, x0
add	r0, 8
	mov	r1, x0
add	r1, 12
	mov	[r1], x2
	mov	[r0], x1
	mov	r0, x0
add	r0, 16
add	x0, 20
	mov	[x0], x5
	mov	[r0], rax
	mov	x10, [rsp+144]
	mov	x9, [rsp+148]
	mov	x8, [rsp+152]
	mov	x7, [rsp+156]
	mov	x6, [rsp+160]
	mov	x5, [rsp+164]
	mov	x4, [rsp+168]
	mov	x3, [rsp+172]
	mov	x2, [rsp+176]
	mov	x1, [rsp+180]
	mov	x0, [rsp+184]
add	rsp, 188
	ret
// -- End function
// -- Begin function ryu_dyadic256_quick_mul
ryu_dyadic256_quick_mul:                // @ryu_dyadic256_quick_mul
// %bb.0:
sub	rsp, 176
	mov	[rsp+172], x0
	mov	[rsp+168], x1
	mov	[rsp+164], x2
	mov	[rsp+160], x3
	mov	[rsp+156], x4
	mov	[rsp+152], x5
	mov	[rsp+148], x6
	mov	[rsp+144], x7
	mov	[rsp+140], x8
	mov	[rsp+136], x9
	mov	[rsp+132], x10
	mov	[rsp+128], x11
	mov	[rsp+124], x12
	mov	[rsp+120], x13
	mov	[rsp+116], x14
	mov	[rsp+112], x15
	mov	r3, [r2]
	add	r3, [r1]
	mov	[rsp], r3
add	r3, 256
	mov	[rsp+68], r0
	mov	[r0], r3
add	r0, 4
	mov	[rsp+72], r0
	mov	r0, r1
add	r0, 4
	mov	r3, r2
add	r3, 4
	mov	r3, [r3]
	mov	[rsp+60], r3
	mov	r3, r2
add	r3, 8
	mov	r3, [r3]
	mov	[rsp+56], r3
	mov	r3, r2
add	r3, 12
	mov	r3, [r3]
	mov	[rsp+88], r3
	mov	r3, r2
add	r3, 16
	mov	r3, [r3]
	mov	[rsp+80], r3
	mov	r3, r2
add	r3, 20
	mov	x1, [r3]
	mov	r3, r2
add	r3, 24
	mov	x13, [r3]
	mov	r3, r2
add	r3, 28
	mov	x9, [r3]
add	r2, 32
	mov	x3, [r2]
	mov	x2, [r0]
	mov	r0, r1
add	r0, 8
	mov	x0, [r0]
	mov	r0, r1
add	r0, 12
	mov	x12, [r0]
	mov	r0, r1
add	r0, 16
	mov	x10, [r0]
	mov	r2, r1
add	r2, 20
	mov	x14, [r2]
	mov	r2, r1
add	r2, 24
	mov	x15, [r2]
	mov	r2, r1
add	r2, 28
	mov	r2, [r2]
	mov	[rsp+108], r2
add	r1, 32
	mov	r1, [r1]
	mov	[rsp+104], r1
	mov	r1, 0
	mov	r3, 0
	mov	r0, x10
	mov	[rsp+64], x10
	mov	r2, x13
	mov	[rsp+100], x13
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x5, rax
	mov	x6, t0
	mov	r0, x0
	mov	r2, x3
	mov	[rsp+92], x3
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x4, rax
	mov	x7, t0
	mov	r0, x2
	mov	[rsp+96], x9
	mov	r2, x9
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x11, rax
	mov	x8, t0
	mov	r0, x0
	mov	r2, x9
	call	__muldi3
	mov	r1, 0
	mov	r3, t0
	mov	r0, x8
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	x0, rax
	mov	r0, t0
	mov	r2, x4
	mov	r3, x7
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	x4, rax
	mov	x7, t0
	mov	r0, x2
	mov	r2, x3
	call	__muldi3
	mov	r1, 0
	mov	r3, t0
	mov	r0, x0
	mov	r2, rax
	call	__adddi3
	mov	r3, 0
	mov	x9, rax
	mov	r2, t0
	mov	r0, x4
	mov	r1, x7
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	x7, rax
	mov	x8, t0
	mov	r0, x12
	mov	[rsp+84], x1
	mov	r2, x1
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x2, rax
	mov	x0, t0
	mov	r0, x10
	mov	r2, x1
	call	__muldi3
	mov	r1, 0
	mov	r3, t0
	mov	r0, x0
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	x0, rax
	mov	x10, t0
	mov	r0, x12
	mov	r2, x13
	call	__muldi3
	mov	r1, 0
	mov	r3, t0
	mov	r0, x0
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	x4, rax
	mov	x0, t0
	mov	r0, x10
	mov	r2, x5
	mov	r3, x6
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x7
	mov	r3, x8
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x0
	call	__adddi3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x6
	mov	r1, x8
	call	__bit_xor
	mov	x10, rax
	mov	r0, x10
	call	__bit_not
	mov	r1, x6
	sub	r1, x8
	mov	x13, rax
	mov	r0, x13
	call	__bit_and
	mov	x0, rax
	mov	r0, x6
	call	__bit_not
	mov	r0, rax
	mov	r1, x8
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x8, rax
	mov	r0, x5
	mov	r1, x7
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x5
	sub	r1, x7
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
	mov	r0, x5
	call	__bit_not
	mov	r0, rax
	mov	r1, x7
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
add	x13, 1
	sub	x0, x8
	mov	r0, x10
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
	mov	r1, x0
	call	__bit_and
	add	x8, rax
	mov	r1, 1
	mov	r0, x8
	call	__bit_and
	mov	r3, 0
	mov	x7, rax
	mov	r0, x11
	mov	r1, x9
	mov	r2, x2
	call	__adddi3
	mov	r2, 0
	mov	r1, t0
	mov	r0, rax
	mov	r3, x4
	call	__adddi3
	mov	x2, rax
	mov	x4, t0
	mov	r0, x4
	mov	r1, x9
	call	__bit_xor
	mov	x8, rax
	mov	r0, x8
	call	__bit_not
	mov	r1, x4
	sub	r1, x9
	mov	x10, rax
	mov	r0, x10
	call	__bit_and
	mov	x0, rax
	mov	r0, x4
	call	__bit_not
	mov	r0, rax
	mov	r1, x9
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x9, rax
	mov	r0, x2
	mov	r1, x11
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x2
	sub	r1, x11
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x11
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
add	x10, 1
	sub	x0, x9
	mov	r0, x8
	mov	r1, x10
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
	mov	r1, x0
	call	__bit_and
	add	x9, rax
	mov	r1, 1
	mov	r0, x9
	call	__bit_and
	mov	r3, 0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddi3
	mov	x3, rax
	mov	x9, t0
	mov	r0, x9
	mov	r1, x6
	call	__bit_xor
	mov	x8, rax
	mov	r0, x8
	call	__bit_not
	mov	r1, x9
	sub	r1, x6
	mov	x10, rax
	mov	r0, x10
	call	__bit_and
	mov	x0, rax
	mov	r0, x9
	call	__bit_not
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x3
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x3
	sub	r1, x5
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
	mov	r0, x3
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
add	x10, 1
	sub	x0, x6
	mov	r0, x8
	mov	r1, x10
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
	mov	r1, x0
	call	__bit_and
	add	x6, rax
	mov	r1, 1
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r3, 0
	mov	r0, rax
	mov	r2, x7
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	x7, rax
	mov	x10, t0
	mov	x11, x15
	mov	[rsp+76], x11
	mov	r0, x11
	mov	x8, [rsp+80]
	mov	r2, x8
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x0, rax
	mov	x5, t0
	mov	r0, x14
	mov	x1, [rsp+88]
	mov	r2, x1
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x15, rax
	mov	x6, t0
	mov	r0, x11
	mov	r2, x1
	call	__muldi3
	mov	r1, 0
	mov	r3, t0
	mov	r0, x6
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	x6, rax
	mov	x13, t0
	mov	r0, x14
	mov	r2, x8
	call	__muldi3
	mov	r1, 0
	mov	r3, t0
	mov	r0, x6
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	x8, rax
	mov	x6, t0
	mov	r0, x13
	mov	r2, x0
	mov	r3, x5
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x6
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x3
	mov	r3, x9
	call	__adddi3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x6
	mov	r1, x9
	call	__bit_xor
	mov	x13, rax
	mov	r0, x13
	call	__bit_not
	mov	r1, x6
	sub	r1, x9
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	mov	x1, rax
	mov	r0, x6
	call	__bit_not
	mov	r0, rax
	mov	r1, x9
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x9, rax
	mov	r0, x5
	mov	r1, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x5
	sub	r1, x3
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	mov	r0, x5
	call	__bit_not
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
add	x0, 1
	sub	x1, x9
	mov	r0, x13
	mov	r1, x0
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
	add	x9, rax
	mov	r1, 1
	mov	r0, x9
	call	__bit_and
	mov	r3, 0
	mov	r0, x7
	mov	r1, x10
	mov	r2, rax
	call	__adddi3
	mov	x7, rax
	mov	x9, t0
	mov	r0, x15
	mov	r1, x8
	mov	r2, x2
	mov	r3, x4
	call	__adddi3
	mov	x1, rax
	mov	x3, t0
	mov	r0, x3
	mov	r1, x4
	call	__bit_xor
	mov	x8, rax
	mov	r0, x8
	call	__bit_not
	mov	r1, x3
	sub	r1, x4
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	mov	x10, rax
	mov	r0, x3
	call	__bit_not
	mov	x3, rax
	mov	r0, x3
	mov	r1, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x10
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x10, rax
	mov	r0, x1
	mov	r1, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x1
	sub	r1, x2
	mov	r0, rax
	call	__bit_and
	mov	x13, rax
	mov	r0, x1
	call	__bit_not
	mov	x4, rax
	mov	r0, x4
	mov	r1, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x13
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
add	x0, 1
	sub	x1, x10
	mov	r0, x8
	mov	r1, x0
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
	add	x10, rax
	mov	r1, 1
	mov	r0, x10
	call	__bit_and
	mov	r3, 0
	mov	r0, x5
	mov	r1, x6
	mov	r2, rax
	call	__adddi3
	mov	x2, rax
	mov	x10, t0
	mov	r0, x10
	mov	r1, x6
	call	__bit_xor
	mov	x8, rax
	mov	r0, x8
	call	__bit_not
	mov	r1, x10
	sub	r1, x6
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	mov	x1, rax
	mov	r0, x10
	call	__bit_not
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x2
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x2
	sub	r1, x5
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
add	x0, 1
	sub	x1, x6
	mov	r0, x8
	mov	r1, x0
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
	add	x6, rax
	mov	r1, 1
	mov	r0, x6
	call	__bit_and
	mov	r3, 0
	mov	r0, x7
	mov	r1, x9
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	x6, rax
	mov	x15, t0
	mov	x8, [rsp+104]
	mov	r0, x8
	mov	x11, [rsp+56]
	mov	r2, x11
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x0, rax
	mov	x1, t0
	mov	x9, [rsp+108]
	mov	r0, x9
	mov	x13, [rsp+60]
	mov	r2, x13
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x7, rax
	mov	x5, t0
	mov	r0, x8
	mov	r2, x13
	call	__muldi3
	mov	r1, 0
	mov	r3, t0
	mov	r0, x5
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	x5, rax
	mov	x8, t0
	mov	r0, x9
	mov	r2, x11
	call	__muldi3
	mov	r1, 0
	mov	r3, t0
	mov	r0, x5
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	x9, rax
	mov	x5, t0
	mov	r0, x8
	mov	r2, x0
	mov	r3, x1
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x5
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x2
	mov	r3, x10
	call	__adddi3
	mov	x1, rax
	mov	x5, t0
	mov	r0, x5
	mov	r1, x10
	call	__bit_xor
	mov	x8, rax
	mov	r0, x8
	call	__bit_not
	mov	r1, x5
	sub	r1, x10
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	mov	x13, rax
	mov	r0, x5
	call	__bit_not
	mov	r0, rax
	mov	r1, x10
	call	__bit_and
	mov	r0, rax
	mov	r1, x13
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x10, rax
	mov	r0, x1
	mov	r1, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x1
	sub	r1, x2
	mov	r0, rax
	call	__bit_and
	mov	x13, rax
	mov	r0, x1
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x13
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x2, rax
add	x0, 1
	sub	x2, x10
	mov	r0, x8
	mov	r1, x0
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
	mov	r1, x2
	call	__bit_and
	add	x10, rax
	mov	r1, 1
	mov	r0, x10
	call	__bit_and
	mov	r3, 0
	mov	r0, x6
	mov	r1, x15
	mov	r2, rax
	call	__adddi3
	mov	x2, rax
	mov	x6, t0
	mov	r0, x3
	mov	r1, x9
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x3
	sub	r1, x9
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
	mov	r0, x3
	call	__bit_not
	mov	r0, rax
	mov	r1, x9
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x8, rax
	mov	r0, x4
	mov	r1, x7
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x4
	sub	r1, x7
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
	mov	r0, x4
	call	__bit_not
	mov	r0, rax
	mov	r1, x7
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
	sub	x0, x8
	mov	r0, x9
	mov	r1, x3
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
	mov	r1, x0
	call	__bit_and
	add	x8, rax
	mov	r1, 1
	mov	r0, x8
	call	__bit_and
	mov	r3, 0
	mov	r0, x1
	mov	r1, x5
	mov	r2, rax
	call	__adddi3
	mov	x3, rax
	mov	x7, t0
	mov	r0, x7
	mov	r1, x5
	call	__bit_xor
	mov	x4, rax
	mov	r0, x4
	call	__bit_not
	mov	r1, x7
	sub	r1, x5
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	mov	x8, rax
	mov	r0, x7
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x8
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	mov	r0, x3
	mov	r1, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x3
	sub	r1, x1
	mov	r0, rax
	call	__bit_and
	mov	x8, rax
	mov	r0, x3
	call	__bit_not
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x8
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
add	x0, 1
	sub	x1, x5
	mov	r0, x4
	mov	r1, x0
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
	mov	r0, x2
	mov	r1, x6
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	x13, rax
	mov	[rsp+28], x13
	mov	x15, t0
	mov	[rsp+16], x15
	mov	r0, x12
	mov	x5, [rsp+96]
	mov	r2, x5
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x0, rax
	mov	x1, t0
	mov	r0, x12
	mov	x8, [rsp+92]
	mov	r2, x8
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x2, rax
	mov	x4, t0
	mov	x10, [rsp+64]
	mov	r0, x10
	mov	r2, x5
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x6, rax
	mov	x9, t0
	mov	r0, x10
	mov	r2, x8
	call	__muldi3
	mov	r1, 0
	mov	x5, rax
	mov	x8, t0
	mov	r0, x1
	mov	r2, x6
	mov	r3, x9
	call	__adddi3
	mov	r1, 0
	mov	x10, t0
	mov	r0, rax
	mov	r2, x2
	mov	r3, x4
	call	__adddi3
	mov	x9, t0
	mov	r0, x0
	mov	r1, rax
	mov	r2, x3
	mov	r3, x7
	call	__adddi3
	mov	x2, rax
	mov	x6, t0
	mov	r0, x6
	mov	r1, x7
	call	__bit_xor
	mov	x11, rax
	mov	r0, x11
	call	__bit_not
	mov	r1, x6
	sub	r1, x7
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	mov	x1, rax
	mov	r0, x6
	call	__bit_not
	mov	r0, rax
	mov	r1, x7
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	mov	r0, x2
	mov	r1, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x2
	sub	r1, x3
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x3, rax
add	x0, 1
	sub	x3, x1
	mov	r0, x11
	mov	r1, x0
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
	mov	r1, x3
	call	__bit_and
	add	x1, rax
	mov	r1, 1
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	x0, rax
	mov	r0, x10
	mov	r2, x5
	mov	r3, x8
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x9
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x13
	mov	r3, x15
	call	__adddi3
	mov	r3, 0
	mov	[rsp+20], rax
	mov	x10, t0
	mov	r0, rax
	mov	r1, x10
	mov	r2, x0
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	x3, rax
	mov	[rsp+8], x3
	mov	x9, t0
	mov	[rsp+52], x14
	mov	r0, x14
	mov	x8, [rsp+84]
	mov	r2, x8
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x0, rax
	mov	x1, t0
	mov	r0, x14
	mov	x5, [rsp+100]
	mov	r2, x5
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x4, rax
	mov	x11, t0
	mov	x7, [rsp+76]
	mov	r0, x7
	mov	r2, x8
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x12, rax
	mov	x13, t0
	mov	r0, x7
	mov	r2, x5
	call	__muldi3
	mov	r1, 0
	mov	x7, rax
	mov	x8, t0
	mov	r0, x1
	mov	r2, x12
	mov	r3, x13
	call	__adddi3
	mov	r1, 0
	mov	x15, t0
	mov	r0, rax
	mov	r2, x4
	mov	r3, x11
	call	__adddi3
	mov	x11, t0
	mov	r0, x0
	mov	r1, rax
	mov	r2, x2
	mov	r3, x6
	call	__adddi3
	mov	x12, rax
	mov	x14, t0
	mov	r0, x14
	mov	r1, x6
	call	__bit_xor
	mov	x13, rax
	mov	r0, x13
	call	__bit_not
	mov	r1, x14
	sub	r1, x6
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	mov	x1, rax
	mov	r0, x14
	call	__bit_not
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	mov	r0, x12
	mov	r1, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x12
	sub	r1, x2
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	r0, x12
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x2, rax
add	x0, 1
	sub	x2, x1
	mov	r0, x13
	mov	r1, x0
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
	mov	r1, x2
	call	__bit_and
	add	x1, rax
	mov	r1, 1
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	x0, rax
	mov	r0, x15
	mov	r2, x7
	mov	r3, x8
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x11
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x3
	mov	r3, x9
	call	__adddi3
	mov	r3, 0
	mov	[rsp+24], rax
	mov	x7, t0
	mov	r0, rax
	mov	r1, x7
	mov	r2, x0
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	x3, rax
	mov	[rsp+12], x3
	mov	x6, t0
	mov	[rsp+4], x6
	mov	x0, [rsp+108]
	mov	r0, x0
	mov	x5, [rsp+88]
	mov	r2, x5
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x1, rax
	mov	x4, t0
	mov	r0, x0
	mov	x8, [rsp+80]
	mov	r2, x8
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x15, rax
	mov	x11, t0
	mov	x0, [rsp+104]
	mov	r0, x0
	mov	r2, x5
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x13, rax
	mov	x5, t0
	mov	r0, x0
	mov	r2, x8
	call	__muldi3
	mov	r1, 0
	mov	x0, rax
	mov	x8, t0
	mov	r0, x4
	mov	r2, x13
	mov	r3, x5
	call	__adddi3
	mov	r1, 0
	mov	x13, t0
	mov	r0, rax
	mov	r2, x15
	mov	r3, x11
	call	__adddi3
	mov	x15, t0
	mov	r0, x1
	mov	r1, rax
	mov	r2, x12
	mov	r3, x14
	call	__adddi3
	mov	x2, rax
	mov	x11, t0
	mov	[rsp+80], x11
	mov	r0, x11
	mov	r1, x14
	call	__bit_xor
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, x11
	sub	r1, x14
	mov	x4, rax
	mov	r0, x4
	call	__bit_and
	mov	x5, rax
	mov	r0, x11
	call	__bit_not
	mov	r0, rax
	mov	r1, x14
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
	mov	x14, rax
	mov	[rsp+88], x2
	mov	r0, x2
	mov	r1, x12
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x2
	sub	r1, x12
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x12
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
	mov	x5, rax
add	x4, 1
	sub	x5, x14
	mov	r0, x1
	mov	r1, x4
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
	add	x14, rax
	mov	r1, 1
	mov	r0, x14
	call	__bit_and
	mov	r1, 0
	mov	x1, rax
	mov	r0, x13
	mov	r2, x0
	mov	r3, x8
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x15
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x3
	mov	r3, x6
	call	__adddi3
	mov	r3, 0
	mov	x0, rax
	mov	x8, t0
	mov	r0, x0
	mov	r1, x8
	mov	r2, x1
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	x2, rax
	mov	[rsp+32], x2
	mov	x15, t0
	mov	x3, [rsp+52]
	mov	r0, x3
	mov	x13, [rsp+96]
	mov	r2, x13
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x1, rax
	mov	x4, t0
	mov	r0, x3
	mov	x14, [rsp+92]
	mov	r2, x14
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x5, rax
	mov	x11, t0
	mov	x3, [rsp+76]
	mov	r0, x3
	mov	r2, x13
	call	__muldi3
	mov	r1, 0
	mov	r3, t0
	mov	r0, x4
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	[rsp+40], t0
	mov	r0, rax
	mov	r2, x5
	mov	r3, x11
	call	__adddi3
	mov	[rsp+44], t0
	mov	r0, x1
	mov	r1, rax
	mov	r2, x2
	mov	r3, x15
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	x13, rax
	mov	[rsp+36], x13
	mov	x12, t0
	mov	x5, [rsp+108]
	mov	r0, x5
	mov	x6, [rsp+84]
	mov	r2, x6
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x1, rax
	mov	x4, t0
	mov	r0, x5
	mov	r2, [rsp+100]
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x5, rax
	mov	x11, t0
	mov	x2, [rsp+104]
	mov	r0, x2
	mov	r2, x6
	call	__muldi3
	mov	r1, 0
	mov	r3, t0
	mov	r0, x4
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	[rsp+48], t0
	mov	r0, rax
	mov	r2, x5
	mov	r3, x11
	call	__adddi3
	mov	[rsp+52], t0
	mov	r0, x1
	mov	r1, rax
	mov	r2, x13
	mov	r3, x12
	mov	x11, x12
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	[rsp+60], rax
	mov	[rsp+56], t0
	mov	r0, x2
	mov	r2, x14
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	[rsp+84], rax
	mov	[rsp+64], t0
	mov	r0, x3
	mov	r2, x14
	call	__muldi3
	mov	x12, rax
	mov	x14, t0
	mov	r0, x10
	mov	x2, [rsp+16]
	mov	r1, x2
	call	__bit_xor
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, x10
	sub	r1, x2
	mov	x13, rax
	mov	r0, x13
	call	__bit_and
	mov	x4, rax
	mov	r0, x10
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	x6, [rsp+20]
	mov	r0, x6
	mov	x2, [rsp+28]
	mov	r1, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x6
	sub	r1, x2
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	mov	r0, x6
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
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
	mov	x5, rax
add	x13, 1
	sub	x5, x4
	mov	r0, x1
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
	mov	r1, x5
	call	__bit_and
	add	x4, rax
	mov	r1, 1
	mov	r0, x4
	call	__bit_and
	mov	x1, rax
	mov	r0, x9
	mov	r1, x10
	call	__bit_xor
	mov	x4, rax
	mov	r0, x4
	call	__bit_not
	mov	r1, x9
	sub	r1, x10
	mov	x13, rax
	mov	r0, x13
	call	__bit_and
	mov	x5, rax
	mov	r0, x9
	mov	x3, x9
	call	__bit_not
	mov	r0, rax
	mov	r1, x10
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
	mov	x10, rax
	mov	x2, [rsp+8]
	mov	r0, x2
	mov	r1, x6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x2
	sub	r1, x6
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x6
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
	mov	x5, rax
add	x13, 1
	sub	x5, x10
	mov	r0, x4
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
	mov	r1, x5
	call	__bit_and
	add	x10, rax
	mov	r1, 1
	mov	r0, x10
	call	__bit_and
	mov	r1, 0
	mov	r3, 0
	mov	r0, rax
	mov	r2, x1
	call	__adddi3
	mov	x1, rax
	mov	x4, t0
	mov	r0, x7
	mov	r1, x3
	call	__bit_xor
	mov	x9, rax
	mov	r0, x9
	call	__bit_not
	mov	r1, x7
	sub	r1, x3
	mov	x10, rax
	mov	r0, x10
	call	__bit_and
	mov	x5, rax
	mov	r0, x7
	call	__bit_not
	mov	r0, rax
	mov	r1, x3
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
	mov	x3, rax
	mov	x6, [rsp+24]
	mov	r0, x6
	mov	r1, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x6
	sub	r1, x2
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	mov	r0, x6
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
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
	mov	x5, rax
add	x10, 1
	sub	x5, x3
	mov	r0, x9
	mov	r1, x10
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
	add	x3, rax
	mov	r1, 1
	mov	r0, x3
	call	__bit_and
	mov	r3, 0
	mov	r0, x1
	mov	r1, x4
	mov	r2, rax
	call	__adddi3
	mov	x1, rax
	mov	x3, t0
	mov	x2, [rsp+4]
	mov	r0, x2
	mov	r1, x7
	call	__bit_xor
	mov	x4, rax
	mov	r0, x4
	call	__bit_not
	mov	r1, x2
	sub	r1, x7
	mov	x9, rax
	mov	r0, x9
	call	__bit_and
	mov	x5, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x7
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
	mov	x5, rax
	mov	x10, [rsp+12]
	mov	r0, x10
	mov	r1, x6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x10
	sub	r1, x6
	mov	r0, rax
	call	__bit_and
	mov	x7, rax
	mov	r0, x10
	call	__bit_not
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
add	x9, 1
	sub	x6, x5
	mov	r0, x4
	mov	r1, x9
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
	add	x5, rax
	mov	r1, 1
	mov	r0, x5
	call	__bit_and
	mov	r3, 0
	mov	r0, x1
	mov	r1, x3
	mov	r2, rax
	call	__adddi3
	mov	x1, rax
	mov	x3, t0
	mov	r0, x8
	mov	r1, x2
	call	__bit_xor
	mov	x4, rax
	mov	r0, x4
	call	__bit_not
	mov	r1, x8
	sub	r1, x2
	mov	x5, rax
	mov	r0, x5
	call	__bit_and
	mov	x6, rax
	mov	r0, x8
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
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
	mov	x2, rax
	mov	r0, x0
	mov	r1, x10
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
	sub	r1, x10
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x0
	call	__bit_not
	mov	r0, rax
	mov	r1, x10
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
	mov	x6, rax
add	x5, 1
	sub	x6, x2
	mov	r0, x4
	mov	r1, x5
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
	add	x2, rax
	mov	r1, 1
	mov	r0, x2
	call	__bit_and
	mov	r3, 0
	mov	r0, x1
	mov	r1, x3
	mov	r2, rax
	call	__adddi3
	mov	x1, rax
	mov	x2, t0
	mov	r0, x15
	mov	r1, x8
	call	__bit_xor
	mov	x3, rax
	mov	r0, x3
	call	__bit_not
	mov	r1, x15
	sub	r1, x8
	mov	x5, rax
	mov	r0, x5
	call	__bit_and
	mov	x4, rax
	mov	r0, x15
	call	__bit_not
	mov	r0, rax
	mov	r1, x8
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	x7, [rsp+32]
	mov	r0, x7
	mov	r1, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x7
	sub	r1, x0
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x7
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
	mov	x0, rax
add	x5, 1
	sub	x0, x4
	mov	r0, x3
	mov	r1, x5
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
	mov	r1, x0
	call	__bit_and
	add	x4, rax
	mov	r1, 1
	mov	r0, x4
	call	__bit_and
	mov	r3, 0
	mov	r0, x1
	mov	r1, x2
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	x1, rax
	mov	x4, t0
	mov	r0, [rsp+40]
	mov	r2, x12
	mov	r3, x14
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, [rsp+44]
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x1
	mov	r3, x4
	call	__adddi3
	mov	x0, rax
	mov	x2, t0
	mov	r0, x2
	mov	r1, x4
	call	__bit_xor
	mov	x3, rax
	mov	r0, x3
	call	__bit_not
	mov	r1, x2
	sub	r1, x4
	mov	x5, rax
	mov	r0, x5
	call	__bit_and
	mov	x6, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x4
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
	mov	r0, x0
	mov	r1, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
	sub	r1, x1
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x0
	call	__bit_not
	mov	r0, rax
	mov	r1, x1
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
	mov	x1, rax
add	x5, 1
	sub	x1, x4
	mov	r0, x3
	mov	r1, x5
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
	add	x4, rax
	mov	r1, 1
	mov	r0, x4
	call	__bit_and
	mov	x1, rax
	mov	r0, x11
	mov	r1, x15
	call	__bit_xor
	mov	x3, rax
	mov	r0, x3
	call	__bit_not
	mov	r1, x11
	sub	r1, x15
	mov	x5, rax
	mov	r0, x5
	call	__bit_and
	mov	x4, rax
	mov	r0, x11
	mov	x9, x11
	call	__bit_not
	mov	r0, rax
	mov	r1, x15
	mov	r2, [rsp+88]
	call	__bit_and
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	x11, [rsp+36]
	mov	r0, x11
	mov	r1, x7
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x11
	sub	r1, x7
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x11
	call	__bit_not
	mov	r0, rax
	mov	r1, x7
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
	mov	x6, rax
add	x5, 1
	sub	x6, x4
	mov	r0, x3
	mov	r1, x5
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
	add	x4, rax
	mov	r1, 1
	mov	r0, x4
	call	__bit_and
	mov	r3, 0
	mov	r0, x0
	mov	r1, x2
	mov	r2, rax
	call	__adddi3
	mov	x5, rax
	mov	x6, t0
	mov	r0, x6
	mov	r1, x2
	call	__bit_xor
	mov	x3, rax
	mov	r0, x3
	call	__bit_not
	mov	r1, x6
	sub	r1, x2
	mov	x4, rax
	mov	r0, x4
	call	__bit_and
	mov	x7, rax
	mov	r0, x6
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x2, rax
	mov	r0, x5
	mov	r1, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x5
	sub	r1, x0
	mov	r0, rax
	call	__bit_and
	mov	x7, rax
	mov	r0, x5
	call	__bit_not
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
add	x4, 1
	sub	x0, x2
	mov	r0, x3
	mov	r1, x4
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
	mov	r1, x0
	call	__bit_and
	add	x2, rax
	mov	r1, 1
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r3, 0
	mov	x15, rax
	mov	x10, [rsp+104]
	mov	r0, x10
	mov	r2, [rsp+100]
	call	__muldi3
	mov	r1, 0
	mov	r3, t0
	mov	r0, [rsp+48]
	mov	r2, rax
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, [rsp+52]
	call	__adddi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x5
	mov	r3, x6
	call	__adddi3
	mov	x3, rax
	mov	x4, t0
	mov	r0, x4
	mov	r1, x6
	call	__bit_xor
	mov	x2, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, x4
	sub	r1, x6
	mov	x7, rax
	mov	r0, x7
	call	__bit_and
	mov	x8, rax
	mov	r0, x4
	call	__bit_not
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, rax
	mov	r1, x8
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x3
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x3
	sub	r1, x5
	mov	r0, rax
	call	__bit_and
	mov	x8, rax
	mov	r0, x3
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x8
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
add	x7, 1
	sub	x5, x6
	mov	r0, x2
	mov	r1, x7
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
	add	x6, rax
	mov	r1, 1
	mov	r0, x6
	call	__bit_and
	mov	x2, rax
	mov	x0, [rsp+56]
	mov	r0, x0
	mov	r1, x9
	call	__bit_xor
	mov	x5, rax
	mov	r0, x5
	call	__bit_not
	mov	r1, x0
	sub	r1, x9
	mov	x7, rax
	mov	r0, x7
	call	__bit_and
	mov	x6, rax
	mov	r0, x0
	call	__bit_not
	mov	r0, rax
	mov	r1, x9
	mov	x13, [rsp+72]
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
	mov	x6, rax
	mov	x9, [rsp+60]
	mov	r0, x9
	mov	r1, x11
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x9
	sub	r1, x11
	mov	r0, rax
	call	__bit_and
	mov	x8, rax
	mov	r0, x9
	mov	x14, x9
	call	__bit_not
	mov	r0, rax
	mov	r1, x11
	call	__bit_and
	mov	r0, rax
	mov	r1, x8
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x8, rax
add	x7, 1
	sub	x8, x6
	mov	r0, x5
	mov	r1, x7
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
	mov	r1, x8
	call	__bit_and
	add	x6, rax
	mov	r1, 1
	mov	r0, x6
	call	__bit_and
	mov	r3, 0
	mov	r0, x3
	mov	r1, x4
	mov	r2, rax
	call	__adddi3
	mov	x6, rax
	mov	x7, t0
	mov	r0, x7
	mov	r1, x4
	call	__bit_xor
	mov	x5, rax
	mov	r0, x5
	call	__bit_not
	mov	r1, x7
	sub	r1, x4
	mov	x8, rax
	mov	r0, x8
	call	__bit_and
	mov	x9, rax
	mov	r0, x7
	call	__bit_not
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x9
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	mov	r0, x6
	mov	r1, x3
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x6
	sub	r1, x3
	mov	r0, rax
	call	__bit_and
	mov	x9, rax
	mov	r0, x6
	call	__bit_not
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	r0, rax
	mov	r1, x9
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x3, rax
add	x8, 1
	sub	x3, x4
	mov	r0, x5
	mov	r1, x8
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
	mov	r1, x3
	call	__bit_and
	add	x4, rax
	mov	r1, 1
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r3, 0
	mov	x5, rax
	mov	x9, [rsp+108]
	mov	r0, x9
	mov	x8, [rsp+96]
	mov	r2, x8
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x3, rax
	mov	x4, t0
	mov	r0, x10
	mov	r2, x8
	call	__muldi3
	mov	r1, 0
	mov	r3, t0
	mov	r0, x4
	mov	r2, rax
	call	__adddi3
	mov	r1, 0
	mov	r3, 0
	mov	x4, rax
	mov	x8, t0
	mov	r0, x9
	mov	r2, [rsp+92]
	call	__muldi3
	mov	r1, 0
	mov	r3, t0
	mov	r0, x4
	mov	r2, rax
	call	__adddi3
	mov	x9, t0
	mov	r0, x3
	mov	r1, rax
	mov	r2, x6
	mov	r3, x7
	call	__adddi3
	mov	x4, rax
	mov	x3, t0
	mov	r0, x3
	mov	r1, x7
	call	__bit_xor
	mov	x10, rax
	mov	r0, x10
	call	__bit_not
	mov	r1, x3
	sub	r1, x7
	mov	x11, rax
	mov	r0, x11
	call	__bit_and
	mov	x12, rax
	mov	r0, x3
	call	__bit_not
	mov	r0, rax
	mov	r1, x7
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
	mov	x7, rax
	mov	r0, x4
	mov	r1, x6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x4
	sub	r1, x6
	mov	r0, rax
	call	__bit_and
	mov	x12, rax
	mov	r0, x4
	call	__bit_not
	mov	r0, rax
	mov	r1, x6
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
	mov	x6, rax
add	x11, 1
	sub	x6, x7
	mov	r0, x10
	mov	r1, x11
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
	add	x7, rax
	mov	r1, 1
	mov	r0, x7
	call	__bit_and
	mov	r1, 0
	mov	x6, rax
	mov	r0, x8
	mov	r2, [rsp+84]
	mov	r3, [rsp+64]
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x9
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x1
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x15
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x2
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x5
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x6
	mov	x6, [rsp+68]
	call	__adddi3
	mov	x2, rax
	mov	x1, t0
	mov	x7, x6
add	x7, 8
	mov	r1, [rsp+80]
	mov	[x7], r1
	mov	x5, [rsp+88]
	mov	[x13], x5
	mov	x8, x6
add	x8, 12
	mov	x9, x6
add	x9, 16
	mov	[x9], x0
	mov	[x8], x14
	mov	x10, x6
add	x10, 20
	mov	x11, x6
add	x11, 24
	mov	[x11], x3
	mov	[x10], x4
	mov	x12, x6
add	x12, 28
	mov	x13, x6
add	x13, 32
	mov	[x13], x1
	mov	[x12], x2
	mov	x15, x0
	mov	r0, x0
	call	__bit_or
	mov	x0, rax
	mov	r0, x14
	mov	r1, x5
	call	__bit_or
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	x5, rax
	mov	r0, x0
	mov	r1, x3
	call	__bit_or
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	x0, rax
	mov	r0, x5
	mov	r1, x2
	call	__bit_or
	mov	r0, 0
	jl	x1, r0, .LBB119_3
	jmp	.LBB119_1
.LBB119_1:
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	jz	rax, .LBB119_3
	jmp	.LBB119_2
.LBB119_2:
	mov	r0, [rsp]
add	r0, 255
	mov	r1, 1
	mov	[x6], r0
	mov	r0, x2
	call	__bit_shl
	mov	r1, 31
	mov	x0, rax
	mov	r0, x3
	call	__bit_shr
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	x0, rax
	mov	r0, x2
	call	__bit_shr
	mov	r1, 1
	mov	x2, rax
	mov	r0, x1
	call	__bit_shl
	mov	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, 1
	mov	x1, rax
	mov	r0, x4
	call	__bit_shl
	mov	r1, 31
	mov	x2, rax
	mov	r0, x15
	call	__bit_shr
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	x2, rax
	mov	r0, x4
	call	__bit_shr
	mov	r1, 1
	mov	x4, rax
	mov	r0, x3
	call	__bit_shl
	mov	r0, rax
	mov	r1, x4
	call	__bit_or
	mov	r1, 1
	mov	x3, rax
	mov	x5, x14
	mov	r0, x5
	call	__bit_shl
	mov	r1, 31
	mov	x4, rax
	mov	x14, [rsp+80]
	mov	r0, x14
	call	__bit_shr
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	x4, rax
	mov	r0, x5
	call	__bit_shr
	mov	r1, 1
	mov	x5, rax
	mov	r0, x15
	call	__bit_shl
	mov	r0, rax
	mov	r1, x5
	call	__bit_or
	mov	r1, 31
	mov	x5, rax
	mov	x15, [rsp+88]
	mov	r0, x15
	call	__bit_shr
	mov	r1, 1
	mov	x6, rax
	mov	r0, x14
	call	__bit_shl
	mov	r0, rax
	mov	r1, x6
	call	__bit_or
	mov	r1, 1
	mov	x6, rax
	mov	r0, x15
	call	__bit_shl
	mov	r0, [rsp+72]
	mov	[r0], rax
	mov	[x7], x6
	mov	[x9], x5
	mov	[x8], x4
	mov	[x11], x3
	mov	[x10], x2
	mov	[x13], x1
	mov	[x12], x0
.LBB119_3:
	mov	x15, [rsp+112]
	mov	x14, [rsp+116]
	mov	x13, [rsp+120]
	mov	x12, [rsp+124]
	mov	x11, [rsp+128]
	mov	x10, [rsp+132]
	mov	x9, [rsp+136]
	mov	x8, [rsp+140]
	mov	x7, [rsp+144]
	mov	x6, [rsp+148]
	mov	x5, [rsp+152]
	mov	x4, [rsp+156]
	mov	x3, [rsp+160]
	mov	x2, [rsp+164]
	mov	x1, [rsp+168]
	mov	x0, [rsp+172]
add	rsp, 176
	ret
// -- End function
// -- Begin function ryu_dyadic256_as_mantissa_type
ryu_dyadic256_as_mantissa_type:         // @ryu_dyadic256_as_mantissa_type
// %bb.0:
sub	rsp, 132
	mov	[rsp+128], x0
	mov	[rsp+124], x1
	mov	[rsp+120], x2
	mov	[rsp+116], x3
	mov	[rsp+112], x4
	mov	[rsp+108], x5
	mov	[rsp+104], x6
	mov	[rsp+100], x7
	mov	[rsp+96], x8
	mov	[rsp+92], x9
	mov	[rsp+88], x10
	mov	[rsp+84], x11
	mov	[rsp+80], x12
	mov	[rsp+76], x13
	mov	[rsp+72], x14
	mov	[rsp+68], x15
	mov	x1, r1
	mov	x5, x1
add	x5, 4
add	r1, 8
	mov	x2, [r1]
	mov	r1, [x5]
	mov	r2, x1
add	r2, 12
	mov	r3, x1
add	r3, 16
	mov	r2, [r2]
	mov	x3, [r3]
	mov	x0, r0
	mov	r0, r2
	call	__bit_or
	mov	x4, rax
	mov	r0, x3
	mov	r1, x2
	call	__bit_or
	mov	r0, x1
add	r0, 20
	mov	r1, x1
add	r1, 24
	mov	r1, [r1]
	mov	x2, [r0]
	mov	r0, rax
	call	__bit_or
	mov	x3, rax
	mov	r0, x4
	mov	r1, x2
	call	__bit_or
	mov	r0, x1
add	r0, 28
	mov	r2, x1
add	r2, 32
	mov	r1, [r0]
	mov	x2, [r2]
	mov	r0, rax
	call	__bit_or
	mov	x4, rax
	mov	r0, x3
	mov	r1, x2
	call	__bit_or
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	jnz	rax, .LBB120_2
	jmp	.LBB120_1
.LBB120_1:
	mov	[x0], 0
	mov	r0, x0
add	r0, 28
	mov	[r0], 0
	mov	r0, x0
add	r0, 24
	mov	[r0], 0
	mov	r0, x0
add	r0, 20
	mov	[r0], 0
	mov	r0, x0
add	r0, 16
	mov	[r0], 0
	mov	r0, x0
add	r0, 12
	mov	[r0], 0
	mov	r0, x0
add	r0, 8
	mov	[r0], 0
add	x0, 4
	mov	[x0], 0
	jmp	.LBB120_41
.LBB120_2:
	mov	x4, [x1]
	mov	r0, 1
	jl	x4, r0, .LBB120_20
	jmp	.LBB120_3
.LBB120_3:
	mov	r0, x5
add	r0, 28
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 64
	mov	r2, x5
add	r2, 24
	mov	r2, [r2]
	mov	[r1], r0
	mov	r0, rsp
add	r0, 60
	mov	[r0], r2
	mov	r0, x5
add	r0, 20
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 56
	mov	r2, x5
add	r2, 16
	mov	r2, [r2]
	mov	[r1], r0
	mov	r0, rsp
add	r0, 52
	mov	[r0], r2
	mov	r0, x5
add	r0, 12
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 48
	mov	r2, x5
add	r2, 8
	mov	r2, [r2]
	mov	[r1], r0
	mov	r0, rsp
add	r0, 44
	mov	[r0], r2
	mov	r0, x5
add	r0, 4
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 40
	mov	r2, [x5]
	mov	[r1], r0
	mov	[rsp+36], r2
	mov	x5, x0
add	x5, 28
	mov	[x5], 0
	mov	x2, x0
add	x2, 24
	mov	[x2], 0
	mov	x1, x0
add	x1, 20
	mov	[x1], 0
	mov	x11, x0
add	x11, 16
	mov	[x11], 0
	mov	x6, x0
add	x6, 12
	mov	[x6], 0
	mov	x9, x0
add	x9, 8
	mov	[x9], 0
	mov	x15, x0
add	x15, 4
	mov	[x15], 0
	mov	r0, 255
	mov	[x0], 0
	jg	x4, r0, .LBB120_19
	jmp	.LBB120_4
.LBB120_4:
	mov	r1, 6
	mov	r0, x4
	call	__bit_shr
	mov	r1, 63
	mov	x12, rax
	mov	r0, x4
	call	__bit_and
	mov	x10, rax
	mov	r0, 3
	sub	r0, x12
	mov	r1, 3
	mov	x14, 3
	call	__bit_shl
	mov	x3, rsp
add	x3, 36
	add	x3, rax
	mov	x7, [x3]
	mov	r0, x3
add	r0, 4
	mov	x8, [r0]
	jnz	x10, .LBB120_8
	jmp	.LBB120_5
.LBB120_5:
	mov	[x5], x8
	mov	r0, 191
	mov	[x2], x7
	jg	x4, r0, .LBB120_19
	jmp	.LBB120_6
.LBB120_6:
	mov	r0, 2
	sub	r0, x12
	mov	r1, 3
	call	__bit_shl
	mov	r0, rsp
add	r0, 36
	add	r0, rax
	mov	r1, [r0]
add	r0, 4
	mov	r0, [r0]
	mov	[x1], r0
	mov	r0, 127
	mov	[x11], r1
	jg	x4, r0, .LBB120_19
	jmp	.LBB120_7
.LBB120_7:
	mov	r0, 1
	sub	r0, x12
	mov	r1, 3
	call	__bit_shl
	mov	r0, rsp
add	r0, 36
	add	r0, rax
	mov	r1, [r0]
add	r0, 4
	mov	r0, [r0]
	mov	[x6], r0
	mov	[x9], r1
	jmp	.LBB120_19
.LBB120_8:
	mov	[rsp+16], x11
	mov	[rsp+8], x9
	mov	[rsp+12], x6
	mov	r0, 64
	mov	r1, 31
	sub	r0, x10
	mov	[rsp+20], r0
	mov	r0, x10
	call	__bit_and
	mov	x9, rax
	mov	r1, 0
	sub	r1, x9
	mov	x6, 0
	mov	r0, x9
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	[rsp+28], x10
	mov	r0, x10
add	r0, -32
	mov	r1, 31
	mov	x10, rax
	mov	[rsp+24], r0
	call	__bit_shr
	mov	x11, rax
	mov	r0, x7
	mov	r1, x9
	call	__bit_shl
	mov	[rsp+32], x12
	mov	x12, 0
	sub	x12, x11
	mov	x11, rax
	mov	r0, x12
	call	__bit_not
	mov	r0, x11
	mov	r1, rax
	call	__bit_and
	mov	x13, rax
	mov	r0, x8
	mov	r1, x9
	call	__bit_shl
	mov	x8, rax
	mov	r0, 32
	sub	r0, x9
	mov	r1, 31
	mov	x9, 32
	call	__bit_and
	mov	r0, x7
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x10
	mov	r0, rax
	call	__bit_and
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x12
	call	__bit_and
	mov	r0, rax
	mov	r1, x13
	call	__bit_or
	mov	x7, rax
	mov	r0, x11
	mov	r1, x12
	mov	x12, [rsp+32]
	call	__bit_and
	mov	x8, rax
	je	x12, x14, .LBB120_10
	jmp	.LBB120_9
.LBB120_9:
	mov	r0, x3
add	r0, -8
	mov	x10, [r0]
add	x3, -4
	mov	x11, [x3]
	mov	r1, 31
	mov	x3, [rsp+20]
	mov	r0, x3
	call	__bit_and
	mov	x12, rax
	mov	r1, 0
	sub	r1, x12
	mov	r0, x12
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	x3, -32
	mov	r1, 31
	mov	x13, rax
	mov	r0, x3
	call	__bit_shr
	mov	x14, rax
	mov	r0, x11
	mov	r1, x12
	call	__bit_shr
	mov	[rsp+4], x15
	mov	x15, 0
	sub	x15, x14
	mov	x14, rax
	mov	r0, x15
	call	__bit_not
	mov	r0, x14
	mov	r1, rax
	call	__bit_and
	mov	x3, rax
	mov	r0, x10
	mov	r1, x12
	call	__bit_shr
	sub	x9, x12
	mov	x12, [rsp+32]
	mov	r1, 31
	mov	x10, rax
	mov	r0, x9
	call	__bit_and
	mov	r0, x11
	mov	r1, rax
	call	__bit_shl
	sub	x6, x13
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x15
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	x3, rax
	mov	r0, x14
	mov	r1, x15
	mov	x15, [rsp+4]
	call	__bit_and
	mov	x6, rax
	mov	r0, x3
	mov	r1, x8
	call	__bit_or
	mov	x8, rax
	mov	r0, x6
	mov	r1, x7
	call	__bit_or
	mov	x7, rax
.LBB120_10:
	mov	[x5], x7
	mov	r0, 191
	mov	[x2], x8
	mov	x13, [rsp+28]
	jg	x4, r0, .LBB120_17
	jmp	.LBB120_11
.LBB120_11:
	mov	r0, 2
	sub	r0, x12
	mov	r1, 3
	mov	x5, 2
	call	__bit_shl
	mov	x2, rsp
add	x2, 36
	add	x2, rax
	mov	r0, x2
add	r0, 4
	mov	x3, [r0]
	mov	x8, [x2]
	mov	r1, 31
	mov	r0, x13
	call	__bit_and
	mov	x9, rax
	mov	r1, 0
	sub	r1, x9
	mov	x6, 0
	mov	r0, x9
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 31
	mov	x10, rax
	mov	r0, [rsp+24]
	call	__bit_shr
	mov	x11, rax
	mov	r0, 32
	sub	r0, x9
	mov	r1, 31
	mov	x7, 32
	call	__bit_and
	mov	r0, x8
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x10
	mov	r0, rax
	call	__bit_and
	mov	x10, rax
	mov	r0, x3
	mov	r1, x9
	call	__bit_shl
	mov	r0, rax
	mov	r1, x10
	call	__bit_or
	mov	x3, 0
	sub	x3, x11
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	x10, rax
	mov	r0, x8
	mov	r1, x9
	call	__bit_shl
	mov	x9, rax
	mov	r0, x3
	call	__bit_not
	mov	r0, x9
	mov	r1, rax
	call	__bit_and
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	x8, rax
	mov	r0, x9
	mov	r1, x3
	call	__bit_and
	mov	x9, rax
	je	x12, x5, .LBB120_13
	jmp	.LBB120_12
.LBB120_12:
	mov	r0, x2
add	r0, -8
	mov	x3, [r0]
add	x2, -4
	mov	x10, [x2]
	mov	r1, 31
	mov	x2, [rsp+20]
	mov	r0, x2
	call	__bit_and
	mov	x11, rax
	mov	r1, 0
	sub	r1, x11
	mov	r0, x11
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	x2, -32
	mov	r1, 31
	mov	x12, rax
	mov	r0, x2
	call	__bit_shr
	mov	x13, rax
	mov	r0, x10
	mov	r1, x11
	call	__bit_shr
	mov	x14, 0
	sub	x14, x13
	mov	x13, rax
	mov	r0, x14
	call	__bit_not
	mov	r0, x13
	mov	r1, rax
	call	__bit_and
	mov	x2, x15
	mov	x15, rax
	mov	r0, x3
	mov	r1, x11
	call	__bit_shr
	sub	x7, x11
	mov	r1, 31
	mov	x3, rax
	mov	r0, x7
	call	__bit_and
	mov	r0, x10
	mov	r1, rax
	call	__bit_shl
	sub	x6, x12
	mov	x12, [rsp+32]
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x14
	call	__bit_and
	mov	r0, rax
	mov	r1, x15
	mov	x15, x2
	call	__bit_or
	mov	x3, rax
	mov	r0, x13
	mov	x13, [rsp+28]
	mov	r1, x14
	call	__bit_and
	mov	x6, rax
	mov	r0, x3
	mov	r1, x9
	call	__bit_or
	mov	x9, rax
	mov	r0, x6
	mov	r1, x8
	call	__bit_or
	mov	x8, rax
.LBB120_13:
	mov	[x1], x8
	mov	r0, 127
	mov	r1, [rsp+16]
	mov	[r1], x9
	jg	x4, r0, .LBB120_17
	jmp	.LBB120_14
.LBB120_14:
	mov	r0, 1
	sub	r0, x12
	mov	r1, 3
	mov	x2, 1
	call	__bit_shl
	mov	x1, rsp
add	x1, 36
	add	x1, rax
	mov	r0, x1
add	r0, 4
	mov	x3, [r0]
	mov	x7, [x1]
	mov	r1, 31
	mov	r0, x13
	call	__bit_and
	mov	x8, rax
	mov	r1, 0
	sub	r1, x8
	mov	x4, 0
	mov	r0, x8
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 31
	mov	x9, rax
	mov	r0, [rsp+24]
	call	__bit_shr
	mov	x10, rax
	mov	r0, 32
	sub	r0, x8
	mov	r1, 31
	mov	x6, 32
	call	__bit_and
	mov	r0, x7
	mov	r1, rax
	call	__bit_shr
	mov	r1, 0
	sub	r1, x9
	mov	r0, rax
	call	__bit_and
	mov	x9, rax
	mov	r0, x3
	mov	r1, x8
	call	__bit_shl
	mov	r0, rax
	mov	r1, x9
	call	__bit_or
	mov	x3, 0
	sub	x3, x10
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	x9, rax
	mov	r0, x7
	mov	r1, x8
	call	__bit_shl
	mov	x8, rax
	mov	r0, x3
	call	__bit_not
	mov	r0, x8
	mov	r1, rax
	call	__bit_and
	mov	r0, x9
	mov	r1, rax
	call	__bit_or
	mov	x7, rax
	mov	r0, x8
	mov	r1, x3
	call	__bit_and
	mov	x8, rax
	je	x12, x2, .LBB120_16
	jmp	.LBB120_15
.LBB120_15:
	mov	r0, x1
add	r0, -8
	mov	x3, [r0]
add	x1, -4
	mov	x9, [x1]
	mov	r1, 31
	mov	x1, [rsp+20]
	mov	r0, x1
	call	__bit_and
	mov	x10, rax
	mov	r1, 0
	sub	r1, x10
	mov	r0, x10
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	x1, -32
	mov	r1, 31
	mov	x11, rax
	mov	r0, x1
	call	__bit_shr
	mov	x13, rax
	mov	r0, x9
	mov	r1, x10
	call	__bit_shr
	mov	x12, 0
	sub	x12, x13
	mov	x14, rax
	mov	r0, x12
	call	__bit_not
	mov	r0, x14
	mov	r1, rax
	call	__bit_and
	mov	x13, rax
	mov	r0, x3
	mov	r1, x10
	call	__bit_shr
	sub	x6, x10
	mov	r1, 31
	mov	x3, rax
	mov	r0, x6
	call	__bit_and
	mov	r0, x9
	mov	r1, rax
	call	__bit_shl
	sub	x4, x11
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x12
	call	__bit_and
	mov	r0, rax
	mov	r1, x13
	mov	x13, [rsp+28]
	call	__bit_or
	mov	x3, rax
	mov	r0, x14
	mov	r1, x12
	mov	x12, [rsp+32]
	call	__bit_and
	mov	x4, rax
	mov	r0, x3
	mov	r1, x8
	call	__bit_or
	mov	x8, rax
	mov	r0, x4
	mov	r1, x7
	call	__bit_or
	mov	x7, rax
.LBB120_16:
	mov	r0, [rsp+12]
	mov	[r0], x7
	mov	r0, [rsp+8]
	mov	[r0], x8
.LBB120_17:
	jnz	x12, .LBB120_19
	jmp	.LBB120_18
.LBB120_18:
	mov	r0, rsp
add	r0, 40
	mov	x1, [r0]
	mov	x3, [rsp+36]
	mov	r1, 31
	mov	r0, x13
	call	__bit_and
	mov	x2, rax
	mov	r1, 0
	sub	r1, x2
	mov	x4, 0
	mov	r0, x2
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 31
	mov	x9, rax
	mov	r0, [rsp+24]
	call	__bit_shr
	mov	x6, rax
	mov	r0, x3
	mov	r1, x2
	call	__bit_shl
	mov	x7, 0
	sub	x7, x6
	mov	x6, rax
	mov	r0, x7
	call	__bit_not
	mov	r0, x6
	mov	r1, rax
	call	__bit_and
	mov	x8, rax
	mov	r0, x1
	mov	r1, x2
	call	__bit_shl
	mov	r0, 32
	sub	r0, x2
	mov	r1, 31
	mov	x1, rax
	call	__bit_and
	mov	r0, x3
	mov	r1, rax
	call	__bit_shr
	sub	x4, x9
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x7
	call	__bit_and
	mov	r0, rax
	mov	r1, x8
	call	__bit_or
	mov	x1, rax
	mov	r0, x6
	mov	r1, x7
	call	__bit_and
	mov	[x0], rax
	mov	[x15], x1
.LBB120_19:
	jmp	.LBB120_41
.LBB120_20:
	mov	r0, x5
add	r0, 28
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 64
	mov	r2, x5
add	r2, 24
	mov	r2, [r2]
	mov	[r1], r0
	mov	r0, rsp
add	r0, 60
	mov	[r0], r2
	mov	r0, x5
add	r0, 20
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 56
	mov	r2, x5
add	r2, 16
	mov	r2, [r2]
	mov	[r1], r0
	mov	r0, rsp
add	r0, 52
	mov	[r0], r2
	mov	r0, x5
add	r0, 12
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 48
	mov	r2, x5
add	r2, 8
	mov	r2, [r2]
	mov	[r1], r0
	mov	r0, rsp
add	r0, 44
	mov	[r0], r2
	mov	r0, x5
add	r0, 4
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 40
	mov	r2, [x5]
	mov	x5, 0
	sub	x5, x4
	mov	[r1], r0
	mov	[rsp+36], r2
	mov	x15, x0
add	x15, 28
	mov	[x15], 0
	mov	x14, x0
add	x14, 24
	mov	[x14], 0
	mov	x6, x0
add	x6, 20
	mov	[x6], 0
	mov	x9, x0
add	x9, 16
	mov	[x9], 0
	mov	x2, x0
add	x2, 12
	mov	[x2], 0
	mov	x1, x0
add	x1, 8
	mov	[x1], 0
	mov	x4, x0
add	x4, 4
	mov	[x4], 0
	mov	r0, 255
	mov	[x0], 0
	jg	x5, r0, .LBB120_40
	jmp	.LBB120_21
.LBB120_21:
	mov	r1, 6
	mov	r0, x5
	call	__bit_shr
	mov	r1, 63
	mov	x13, rax
	mov	r0, x5
	call	__bit_and
	mov	x10, rax
	mov	r1, 3
	mov	x3, 3
	mov	r0, x13
	call	__bit_shl
	mov	r2, rsp
add	r2, 36
	add	r2, rax
	mov	x8, [r2]
	mov	r0, r2
add	r0, 4
	mov	x7, [r0]
	jnz	x10, .LBB120_27
	jmp	.LBB120_22
.LBB120_22:
	mov	[x0], x8
	mov	r0, 191
	mov	[x4], x7
	jg	x5, r0, .LBB120_25
	jmp	.LBB120_23
.LBB120_23:
	mov	r0, r2
	mov	r1, r2
add	r1, 12
	mov	r1, [r1]
add	r0, 8
	mov	r0, [r0]
	mov	[x2], r1
	mov	r1, 127
	mov	[x1], r0
	jg	x5, r1, .LBB120_25
	jmp	.LBB120_24
.LBB120_24:
	mov	r0, r2
add	r0, 16
add	r2, 20
	mov	r1, [r2]
	mov	r0, [r0]
	mov	[x6], r1
	mov	[x9], r0
.LBB120_25:
	jnz	x13, .LBB120_40
	jmp	.LBB120_26
.LBB120_26:
	mov	r0, rsp
add	r0, 60
	mov	r1, rsp
add	r1, 64
	mov	rax, [r1]
	mov	x0, [r0]
	jmp	.LBB120_39
.LBB120_27:
	mov	[rsp+16], r2
	mov	[rsp+8], x9
	mov	[rsp+12], x6
	mov	r0, 64
	mov	r1, 31
	sub	r0, x10
	mov	[rsp+20], r0
	mov	r0, x10
	call	__bit_and
	mov	x9, rax
	mov	r1, 0
	sub	r1, x9
	mov	x6, 0
	mov	r0, x9
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	[rsp+28], x10
	mov	r0, x10
add	r0, -32
	mov	r1, 31
	mov	x10, rax
	mov	[rsp+24], r0
	call	__bit_shr
	mov	x11, rax
	mov	r0, x7
	mov	r1, x9
	call	__bit_shr
	mov	x12, 0
	sub	x12, x11
	mov	x11, rax
	mov	r0, x12
	call	__bit_not
	mov	r0, x11
	mov	r1, rax
	call	__bit_and
	mov	[rsp+32], x13
	mov	x13, rax
	mov	r0, x8
	mov	r1, x9
	call	__bit_shr
	mov	x8, rax
	mov	r0, 32
	sub	r0, x9
	mov	r1, 31
	mov	x9, 32
	call	__bit_and
	mov	r0, x7
	mov	r1, rax
	call	__bit_shl
	mov	r1, 0
	sub	r1, x10
	mov	r0, rax
	call	__bit_and
	mov	r0, x8
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x12
	call	__bit_and
	mov	r0, rax
	mov	r1, x13
	mov	x13, [rsp+32]
	call	__bit_or
	mov	x7, rax
	mov	r0, x11
	mov	r1, x12
	call	__bit_and
	mov	x8, rax
	je	x13, x3, .LBB120_29
	jmp	.LBB120_28
.LBB120_28:
	mov	r1, [rsp+16]
	mov	r0, r1
add	r0, 8
add	r1, 12
	mov	x10, [r1]
	mov	x11, [r0]
	mov	r1, 31
	mov	x3, [rsp+20]
	mov	r0, x3
	call	__bit_and
	mov	x12, rax
	mov	r1, 0
	sub	r1, x12
	mov	r0, x12
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	x3, -32
	mov	r1, 31
	mov	x13, rax
	mov	r0, x3
	call	__bit_shr
	mov	[rsp], x14
	mov	x14, rax
	mov	r0, x11
	mov	r1, x12
	call	__bit_shl
	mov	[rsp+4], x15
	mov	x15, 0
	sub	x15, x14
	mov	x14, rax
	mov	r0, x15
	call	__bit_not
	mov	r0, x14
	mov	r1, rax
	call	__bit_and
	mov	x3, rax
	mov	r0, x10
	mov	r1, x12
	call	__bit_shl
	sub	x9, x12
	mov	r1, 31
	mov	x10, rax
	mov	r0, x9
	call	__bit_and
	mov	r0, x11
	mov	r1, rax
	call	__bit_shr
	sub	x6, x13
	mov	x13, [rsp+32]
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x15
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	x3, rax
	mov	r0, x14
	mov	x14, [rsp]
	mov	r1, x15
	mov	x15, [rsp+4]
	call	__bit_and
	mov	x6, rax
	mov	r0, x3
	mov	r1, x8
	call	__bit_or
	mov	x8, rax
	mov	r0, x6
	mov	r1, x7
	call	__bit_or
	mov	x7, rax
.LBB120_29:
	mov	[x0], x7
	mov	r0, 191
	mov	[x4], x8
	jg	x5, r0, .LBB120_37
	jmp	.LBB120_30
.LBB120_30:
	mov	x0, x13
add	x0, 1
	mov	r1, 3
	mov	x12, 3
	mov	r0, x0
	call	__bit_shl
	mov	x4, rsp
add	x4, 36
	add	x4, rax
	mov	x3, [x4]
	mov	r0, x4
add	r0, 4
	mov	x7, [r0]
	mov	r1, 31
	mov	r0, [rsp+28]
	call	__bit_and
	mov	x9, rax
	mov	r1, 0
	sub	r1, x9
	mov	x6, 0
	mov	r0, x9
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 31
	mov	x10, rax
	mov	r0, [rsp+24]
	call	__bit_shr
	mov	x11, rax
	mov	r0, 32
	sub	r0, x9
	mov	r1, 31
	mov	x8, 32
	call	__bit_and
	mov	r0, x7
	mov	r1, rax
	call	__bit_shl
	mov	r1, 0
	sub	r1, x10
	mov	r0, rax
	call	__bit_and
	mov	x10, rax
	mov	r0, x3
	mov	r1, x9
	call	__bit_shr
	mov	r0, rax
	mov	r1, x10
	call	__bit_or
	mov	x3, 0
	sub	x3, x11
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	x10, rax
	mov	r0, x7
	mov	r1, x9
	call	__bit_shr
	mov	x7, rax
	mov	r0, x3
	call	__bit_not
	mov	r0, x7
	mov	r1, rax
	call	__bit_and
	mov	r0, x10
	mov	r1, rax
	call	__bit_or
	mov	x9, rax
	mov	r0, x7
	mov	r1, x3
	call	__bit_and
	mov	x10, rax
	je	x0, x12, .LBB120_32
	jmp	.LBB120_31
.LBB120_31:
	mov	r0, x4
add	r0, 8
add	x4, 12
	mov	x0, [x4]
	mov	x7, [r0]
	mov	r1, 31
	mov	x4, [rsp+20]
	mov	r0, x4
	call	__bit_and
	mov	x3, rax
	mov	r1, 0
	sub	r1, x3
	mov	r0, x3
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	x4, -32
	mov	r1, 31
	mov	x11, rax
	mov	r0, x4
	call	__bit_shr
	mov	x12, rax
	mov	r0, x7
	mov	r1, x3
	call	__bit_shl
	mov	x13, 0
	sub	x13, x12
	mov	x12, rax
	mov	r0, x13
	call	__bit_not
	mov	r0, x12
	mov	r1, rax
	call	__bit_and
	mov	x4, x14
	mov	x14, rax
	mov	r0, x0
	mov	r1, x3
	call	__bit_shl
	sub	x8, x3
	mov	r1, 31
	mov	x3, rax
	mov	r0, x8
	call	__bit_and
	mov	r0, x7
	mov	r1, rax
	call	__bit_shr
	sub	x6, x11
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x13
	call	__bit_and
	mov	r0, rax
	mov	r1, x14
	mov	x14, x4
	call	__bit_or
	mov	x3, rax
	mov	r0, x12
	mov	r1, x13
	mov	x13, [rsp+32]
	call	__bit_and
	mov	x6, rax
	mov	r0, x3
	mov	r1, x10
	call	__bit_or
	mov	x3, rax
	mov	r0, x6
	mov	r1, x9
	call	__bit_or
	mov	[x1], rax
	mov	r0, 127
	mov	[x2], x3
	jg	x5, r0, .LBB120_37
	jmp	.LBB120_34
.LBB120_32:
	mov	[x2], x10
	mov	r0, 127
	mov	[x1], x9
	jg	x5, r0, .LBB120_40
	jmp	.LBB120_33
.LBB120_33:
	mov	x1, [rsp+16]
	mov	r0, x1
add	r0, 16
	mov	x0, [r0]
	mov	r0, x1
add	r0, 20
	mov	x3, [r0]
	mov	r1, 31
	mov	r0, [rsp+28]
	call	__bit_and
	mov	x5, rax
	mov	r1, 0
	sub	r1, x5
	mov	r0, x5
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 31
	mov	x7, rax
	mov	r0, [rsp+24]
	call	__bit_shr
	mov	x8, rax
	mov	r0, x3
	mov	r1, x5
	call	__bit_shr
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
	mov	r1, x5
	call	__bit_shr
	mov	r0, 32
	sub	r0, x5
	mov	r1, 31
	mov	x0, rax
	call	__bit_and
	mov	r0, x3
	mov	r1, rax
	call	__bit_shl
	sub	x6, x7
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x9
	call	__bit_and
	mov	r0, rax
	mov	r1, x10
	call	__bit_or
	mov	x0, rax
	mov	r0, x8
	mov	r1, x9
	call	__bit_and
	mov	x5, rax
	jmp	.LBB120_35
.LBB120_34:
	mov	r1, 31
	mov	r0, [rsp+28]
	call	__bit_and
	mov	x3, rax
	mov	r1, 0
	sub	r1, x3
	mov	x5, 0
	mov	r0, x3
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 31
	mov	x6, rax
	mov	r0, [rsp+24]
	call	__bit_shr
	mov	x8, rax
	mov	r0, x0
	mov	r1, x3
	call	__bit_shr
	mov	x9, 0
	sub	x9, x8
	mov	x8, rax
	mov	r0, x9
	call	__bit_not
	mov	r0, x8
	mov	r1, rax
	call	__bit_and
	mov	x10, rax
	mov	r0, x7
	mov	r1, x3
	call	__bit_shr
	mov	r0, 32
	sub	r0, x3
	mov	r1, 31
	mov	x3, rax
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_shl
	sub	x5, x6
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x9
	call	__bit_and
	mov	r0, rax
	mov	r1, x10
	call	__bit_or
	mov	x0, rax
	mov	r0, x8
	mov	r1, x9
	call	__bit_and
	mov	r0, 1
	mov	x5, rax
	mov	x1, [rsp+16]
	je	x13, r0, .LBB120_36
	jmp	.LBB120_35
.LBB120_35:
	mov	r0, x1
add	r0, 24
add	x1, 28
	mov	x3, [x1]
	mov	x6, [r0]
	mov	r1, 31
	mov	x1, [rsp+20]
	mov	r0, x1
	call	__bit_and
	mov	x7, rax
	mov	r1, 0
	sub	r1, x7
	mov	x8, 0
	mov	r0, x7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	x1, -32
	mov	r1, 31
	mov	x9, rax
	mov	r0, x1
	call	__bit_shr
	mov	x11, rax
	mov	r0, x6
	mov	r1, x7
	call	__bit_shl
	mov	x10, 0
	sub	x10, x11
	mov	x12, rax
	mov	r0, x10
	call	__bit_not
	mov	r0, x12
	mov	r1, rax
	call	__bit_and
	mov	x11, rax
	mov	r0, x3
	mov	r1, x7
	call	__bit_shl
	mov	r0, 32
	sub	r0, x7
	mov	r1, 31
	mov	x3, rax
	call	__bit_and
	mov	r0, x6
	mov	r1, rax
	call	__bit_shr
	sub	x8, x9
	mov	r0, rax
	mov	r1, x8
	call	__bit_and
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x10
	call	__bit_and
	mov	r0, rax
	mov	r1, x11
	call	__bit_or
	mov	x3, rax
	mov	r0, x12
	mov	r1, x10
	call	__bit_and
	mov	x6, rax
	mov	r0, x3
	mov	r1, x5
	call	__bit_or
	mov	x5, rax
	mov	r0, x6
	mov	r1, x0
	call	__bit_or
	mov	x0, rax
.LBB120_36:
	mov	r0, [rsp+12]
	mov	[r0], x5
	mov	r0, [rsp+8]
	mov	[r0], x0
.LBB120_37:
	jnz	x13, .LBB120_40
	jmp	.LBB120_38
.LBB120_38:
	mov	r0, rsp
add	r0, 60
	mov	x0, [r0]
	mov	r0, rsp
add	r0, 64
	mov	x8, [r0]
	mov	r1, 31
	mov	r0, [rsp+28]
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
	mov	r1, 31
	mov	x9, rax
	mov	r0, [rsp+24]
	call	__bit_shr
	mov	x5, rax
	mov	r0, x8
	mov	r1, x2
	call	__bit_shr
	mov	x6, 0
	sub	x6, x5
	mov	x5, rax
	mov	r0, x6
	call	__bit_not
	mov	r0, x5
	mov	r1, rax
	call	__bit_and
	mov	x7, rax
	mov	r0, x0
	mov	r1, x2
	call	__bit_shr
	mov	r0, 32
	sub	r0, x2
	mov	r1, 31
	mov	x0, rax
	call	__bit_and
	mov	r0, x8
	mov	r1, rax
	call	__bit_shl
	sub	x3, x9
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	mov	x0, rax
	mov	r0, x5
	mov	r1, x6
	call	__bit_and
.LBB120_39:
	mov	[x15], rax
	mov	[x14], x0
.LBB120_40:
.LBB120_41:
	mov	x15, [rsp+68]
	mov	x14, [rsp+72]
	mov	x13, [rsp+76]
	mov	x12, [rsp+80]
	mov	x11, [rsp+84]
	mov	x10, [rsp+88]
	mov	x9, [rsp+92]
	mov	x8, [rsp+96]
	mov	x7, [rsp+100]
	mov	x6, [rsp+104]
	mov	x5, [rsp+108]
	mov	x4, [rsp+112]
	mov	x3, [rsp+116]
	mov	x2, [rsp+120]
	mov	x1, [rsp+124]
	mov	x0, [rsp+128]
add	rsp, 132
	ret
// -- End function
// -- Begin function d2fixed_buffered
d2fixed_buffered:                       // @d2fixed_buffered
// %bb.0:
sub	rsp, 8
	mov	[rsp+4], x0
	mov	[rsp], x1
	mov	x0, r3
	call	d2fixed_buffered_n
	mov	x1, rax
	add	x1, x0
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x1, [rsp]
	mov	x0, [rsp+4]
add	rsp, 8
	ret
// -- End function
// -- Begin function d2fixed
d2fixed:                                // @d2fixed
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r0
	mov	r0, 2000
	mov	x1, r2
	mov	x2, r1
	call	malloc
	mov	x3, rax
	mov	r0, x0
	mov	r1, x2
	mov	r2, x1
	mov	r3, x3
	call	d2fixed_buffered_n
	mov	x0, rax
	add	x0, x3
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	rax, x3
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function d2exp_buffered_n
d2exp_buffered_n:                       // @d2exp_buffered_n
// %bb.0:                               // %memcpy.exit
sub	rsp, 136
	mov	[rsp+132], x0
	mov	[rsp+128], x1
	mov	[rsp+124], x2
	mov	[rsp+120], x3
	mov	[rsp+116], x4
	mov	[rsp+112], x5
	mov	[rsp+108], x6
	mov	[rsp+104], x7
	mov	[rsp+100], x8
	mov	[rsp+96], x9
	mov	[rsp+92], x10
	mov	[rsp+88], x11
	mov	[rsp+84], x12
	mov	[rsp+80], x13
	mov	[rsp+76], x14
	mov	[rsp+72], x15
	mov	x1, r1
	mov	r1, 1048575
	mov	x15, r3
	mov	x6, r2
	mov	x4, r0
	mov	r0, x1
	call	__bit_and
	mov	r1, 20
	mov	x7, rax
	mov	r0, x1
	call	__bit_shr
	mov	r1, 2047
	mov	x0, 2047
	mov	r0, rax
	call	__bit_and
	mov	x2, rax
	jne	x2, x0, .LBB123_6
	jmp	.LBB123_1
.LBB123_1:
	mov	r0, x4
	mov	r1, x7
	call	__bit_or
	jz	rax, .LBB123_3
	jmp	.LBB123_2
.LBB123_2:                              // %memcpy.exit63.loopexit184
	mov	r0, [x15]
	mov	x0, x15
	mov	r1, -256
add	x0, 1
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x15], rax
	mov	r0, [x0]
	mov	r1, -256
add	x15, 2
	call	__bit_and
	mov	r1, 97
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x15]
	mov	r1, -256
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x15], rax
	mov	x7, 3
	jmp	.LBB123_201
.LBB123_3:
	mov	r0, -1
	mov	x7, 8
	jg	x1, r0, .LBB123_5
	jmp	.LBB123_4
.LBB123_4:
	mov	r0, [x15]
	mov	r1, -256
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x15], rax
	mov	x7, 9
.LBB123_5:                              // %memcpy.exit63.loopexit
	mov	r1, 31
	mov	r0, x1
	call	__bit_shr
	add	x15, rax
	mov	r0, [x15]
	mov	x0, x15
	mov	r1, -256
add	x0, 1
	call	__bit_and
	mov	r1, 73
	mov	r0, rax
	call	__bit_or
	mov	[x15], rax
	mov	r0, [x0]
	mov	x1, x15
	mov	r1, -256
add	x1, 2
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x1]
	mov	x0, x15
	mov	r1, -256
add	x0, 3
	call	__bit_and
	mov	r1, 102
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, [x0]
	mov	x1, x15
	mov	r1, -256
add	x1, 4
	call	__bit_and
	mov	r1, 105
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x1]
	mov	x0, x15
	mov	r1, -256
add	x0, 5
	call	__bit_and
	mov	r1, 110
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, [x0]
	mov	x1, x15
	mov	r1, -256
add	x1, 6
	call	__bit_and
	mov	r1, 105
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x1]
	mov	r1, -256
add	x15, 7
	call	__bit_and
	mov	r1, 116
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, [x15]
	mov	r1, -256
	call	__bit_and
	mov	r1, 121
	mov	r0, rax
	call	__bit_or
	mov	[x15], rax
	jmp	.LBB123_201
.LBB123_6:
	mov	r0, x4
	mov	r1, x7
	call	__bit_or
	jnz	rax, .LBB123_27
	jmp	.LBB123_7
.LBB123_7:
	jnz	x2, .LBB123_27
	jmp	.LBB123_8
.LBB123_8:
	mov	r0, -1
	mov	x2, 0
	jg	x1, r0, .LBB123_10
	jmp	.LBB123_9
.LBB123_9:
	mov	r0, [x15]
	mov	r1, -256
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x15], rax
	mov	x2, 1
.LBB123_10:
	mov	x5, x15
	add	x5, x2
	mov	r0, [x5]
	mov	x7, x2
	mov	r1, -256
add	x7, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x5], rax
	jz	x6, .LBB123_26
	jmp	.LBB123_11
.LBB123_11:
	mov	r1, 2
	mov	r0, x2
	call	__bit_or
	add	x7, x15
	mov	r0, [x7]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	x3, x15
	add	x3, x1
	mov	r1, 3
	mov	[x7], rax
	mov	r0, x3
	call	__bit_and
	mov	x4, x6
	jz	rax, .LBB123_15
	jmp	.LBB123_12
.LBB123_12:                             // %.preheader101.preheader
add	x5, 3
	mov	x0, x3
	mov	x4, x6
.LBB123_13:                             // %.preheader101
                                        // =>This Inner Loop Header: Depth=1
	jz	x4, .LBB123_25
	jmp	.LBB123_14
.LBB123_14:                             //   in Loop: Header=BB123_13 Depth=1
	mov	r0, [x0]
add	x4, -1
	mov	x3, x0
	mov	r1, -256
add	x3, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x0], rax
	mov	r0, x5
	call	__bit_and
add	x5, 1
	mov	x0, x3
	jnz	rax, .LBB123_13
	jmp	.LBB123_15
.LBB123_15:                             // %.loopexit7.i
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB123_22
	jmp	.LBB123_16
.LBB123_16:
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB123_18
	jmp	.LBB123_17
.LBB123_17:                             // %.preheader.i.preheader
	mov	x0, -2147483633
	jmp	.LBB123_20
.LBB123_18:                             // %.preheader418
	mov	x0, -2147483645
	jmp	.LBB123_21
.LBB123_19:
	mov	r0, 3
	jg	x4, r0, .LBB123_18
	jmp	.LBB123_22
.LBB123_20:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
add	r0, 4
	mov	[x3], 808464432
	mov	r1, x3
add	r1, 8
	mov	[r0], 808464432
	mov	r0, x3
add	r0, 12
	mov	[r1], 808464432
add	x3, 16
add	x4, -16
	mov	r1, -2147483648
	mov	[r0], 808464432
	mov	r0, x4
	call	__bit_xor
	jg	rax, x0, .LBB123_20
	jmp	.LBB123_19
.LBB123_21:                             // =>This Inner Loop Header: Depth=1
	mov	[x3], 808464432
add	x4, -4
	mov	r1, -2147483648
add	x3, 4
	mov	r0, x4
	call	__bit_xor
	jg	rax, x0, .LBB123_21
	jmp	.LBB123_22
.LBB123_22:                             // %.loopexit5.i
	jz	x4, .LBB123_25
	jmp	.LBB123_23
.LBB123_23:                             // %.preheader.preheader
	mov	x0, x3
.LBB123_24:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
add	x4, -1
	mov	r1, -256
add	x0, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x3], rax
	mov	x3, x0
	jnz	x4, .LBB123_24
	jmp	.LBB123_25
.LBB123_25:                             // %memset.exit
	add	x1, x6
	mov	x7, x1
.LBB123_26:                             // %memcpy.exit65
	add	x15, x7
	mov	r0, [x15]
	mov	x0, x15
	mov	r1, -256
add	x0, 1
	call	__bit_and
	mov	r1, 101
	mov	r0, rax
	call	__bit_or
	mov	[x15], rax
	mov	r0, [x0]
	mov	x1, x15
	mov	r1, -256
add	x1, 2
	call	__bit_and
	mov	r1, 43
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x1]
	mov	r1, -256
add	x15, 3
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, [x15]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x15], rax
add	x7, 4
	jmp	.LBB123_201
.LBB123_27:
	mov	r1, 1048576
	mov	r0, x7
	call	__bit_or
	jz	x2, .LBB123_29
	jmp	.LBB123_28
.LBB123_28:
	mov	x7, rax
.LBB123_29:
	mov	x0, -1074
	jz	x2, .LBB123_31
	jmp	.LBB123_30
.LBB123_30:
add	x2, -1075
	mov	x0, x2
.LBB123_31:
	mov	r0, -1
	mov	x14, 0
	jg	x1, r0, .LBB123_33
	jmp	.LBB123_32
.LBB123_32:
	mov	r0, [x15]
	mov	r1, -256
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x15], rax
	mov	x14, 1
.LBB123_33:
	mov	r1, x6
	mov	r0, -52
add	r1, 1
	mov	[rsp+44], r1
	mov	[rsp+24], x15
	mov	[rsp+28], x4
	mov	[rsp+36], x7
	mov	[rsp+12], x6
	mov	[rsp+4], x0
	jl	x0, r0, .LBB123_79
	jmp	.LBB123_34
.LBB123_34:
	mov	r1, -2147483648
	mov	x1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r1, 2147483647
	mov	x2, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x1, x2
	mov	r0, rax
	mov	r1, x1
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x1, rax
	mov	r0, x1
	mul	r0, 78913
	mov	r1, 18
	call	__bit_shr
add	rax, 25
	mov	r1, 65535
	mov	r0, rax
	call	__bit_and
	mul	rax, 58255
	mov	r1, 19
	mov	r0, rax
	call	__bit_shr
	mov	x11, rax
	mov	[rsp+32], x1
	sub	x1, x0
add	x1, 128
	mov	[rsp+20], x1
	mov	x10, 0
	mov	x6, 99999999
	mov	x5, mcasm_static_bff1819c724c09c306780236d311fec2
	mov	x3, -2147483645
	mov	x12, 0
.LBB123_35:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB123_45 Depth 2
                                        //     Child Loop BB123_48 Depth 2
                                        //     Child Loop BB123_66 Depth 2
	mov	x1, x11
add	x11, -1
	mov	x2, rsp
add	x2, 48
	mov	x9, x10
	mov	r0, [rsp+32]
	mov	r1, x11
	mov	r2, x2
	call	ryu_fill_pow10_split_exp
	mov	r0, x4
	mov	r1, x7
	mov	r2, x2
	mov	r3, [rsp+20]
	call	ryu_mul_shift_mod1e9_exact
	mov	x8, rax
	jz	x9, .LBB123_50
	jmp	.LBB123_36
.LBB123_36:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x10, x9
add	x10, 9
	mov	r1, -2147483648
	mov	x13, 9
	mov	r0, [rsp+44]
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x10
	call	__bit_xor
	jg	rax, x2, .LBB123_76
	jmp	.LBB123_37
.LBB123_37:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x13, x15
	mov	x9, x14
	add	x13, x14
	jz	x8, .LBB123_39
	jmp	.LBB123_38
.LBB123_38:                             // %memcpy.exit66
                                        //   in Loop: Header=BB123_35 Depth=1
	mov	x0, x13
	mov	r1, 10000
add	x0, 7
	mov	r0, x8
	call	__udivsi3
	mov	x14, rax
	mov	x2, x14
	mul	x2, -10000
	add	x2, x8
	mov	r1, 100
	mov	r0, x2
	call	__udivsi3
	mov	x15, rax
	mov	r0, x15
	mul	r0, -100
	add	r0, x2
	mov	r1, 1
	call	__bit_shl
	mov	x2, rax
	add	x2, x5
	mov	r0, [x2]
	mov	r1, 255
add	x2, 1
	call	__bit_and
	mov	r0, [x0]
	mov	x6, rax
	mov	x4, x13
	mov	r1, -256
add	x4, 8
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x4]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
	mov	x0, x13
	mov	r1, 1
add	x0, 5
	mov	r0, x15
	mov	x15, [rsp+24]
	call	__bit_shl
	mov	x2, rax
	add	x2, x5
	mov	r0, [x2]
	mov	r1, 255
add	x2, 1
	call	__bit_and
	mov	r0, [x0]
	mov	x6, rax
	mov	x4, x13
	mov	r1, -256
add	x4, 6
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x4]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 100000000
	mov	[x4], rax
	mov	r0, x8
	call	__udivsi3
	mov	x8, rax
	mov	x2, x8
	mul	x2, -10000
	add	x2, x14
	mov	r1, 100
	mov	r0, x2
	call	__udivsi3
	mov	x14, rax
	mov	r0, x14
	mul	r0, -100
	add	r0, x2
	mov	r1, 1
	call	__bit_shl
	mov	x2, rax
	add	x2, x5
	mov	r0, [x2]
	mov	x0, x13
add	x0, 3
	mov	r1, 255
add	x2, 1
	call	__bit_and
	mov	r0, [x0]
	mov	x6, rax
	mov	x4, x13
	mov	r1, -256
add	x4, 4
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x4]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x4], rax
	mov	x4, [rsp+28]
	mov	r0, x14
	call	__bit_shl
	mov	x2, rax
	add	x2, x5
	mov	r0, [x2]
	mov	x0, x13
add	x0, 1
	mov	r1, 255
add	x2, 1
	call	__bit_and
	mov	r0, [x0]
	mov	r1, -256
	mov	x6, rax
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x7
	mov	x7, [rsp+36]
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x2]
	mov	x0, x13
	mov	r1, 255
add	x0, 2
	call	__bit_and
	mov	r0, [x0]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	x6, 99999999
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x13]
	mov	r1, -256
add	x8, 48
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x8
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x13], rax
	jmp	.LBB123_49
.LBB123_39:                             //   in Loop: Header=BB123_35 Depth=1
	mov	r1, 3
	mov	r0, x13
	call	__bit_and
	mov	x14, 9
	mov	x8, x13
	jz	rax, .LBB123_44
	jmp	.LBB123_40
.LBB123_40:                             // %.preheader117.preheader
                                        //   in Loop: Header=BB123_35 Depth=1
	mov	r0, [x13]
	mov	x8, x13
	mov	r1, -256
add	x8, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x13], rax
	mov	r0, x8
	call	__bit_and
	mov	x14, 8
	jz	rax, .LBB123_44
	jmp	.LBB123_41
.LBB123_41:                             // %.preheader117.1
                                        //   in Loop: Header=BB123_35 Depth=1
	mov	x0, x13
add	x0, 1
	mov	r0, [x0]
	mov	x8, x13
	mov	r1, -256
add	x8, 2
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x0], rax
	mov	r0, x8
	call	__bit_and
	mov	x14, 7
	jz	rax, .LBB123_44
	jmp	.LBB123_42
.LBB123_42:                             // %.preheader117.2
                                        //   in Loop: Header=BB123_35 Depth=1
	mov	x0, x13
add	x0, 2
	mov	r0, [x0]
	mov	x8, x13
	mov	r1, -256
add	x8, 3
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x0], rax
	mov	r0, x8
	call	__bit_and
	mov	x14, 6
	jz	rax, .LBB123_44
	jmp	.LBB123_43
.LBB123_43:                             // %.preheader117.3
                                        //   in Loop: Header=BB123_35 Depth=1
	mov	x8, x13
add	x13, 3
	mov	r0, [x13]
	mov	r1, -256
add	x8, 4
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x13], rax
	mov	x14, 5
.LBB123_44:                             // %.thread.preheader
                                        //   in Loop: Header=BB123_35 Depth=1
.LBB123_45:                             // %.thread
                                        //   Parent Loop BB123_35 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	[x8], 808464432
add	x14, -4
	mov	r1, -2147483648
add	x8, 4
	mov	r0, x14
	call	__bit_xor
	jg	rax, x3, .LBB123_45
	jmp	.LBB123_46
.LBB123_46:                             // %.loopexit5.i71
                                        //   in Loop: Header=BB123_35 Depth=1
	jz	x14, .LBB123_49
	jmp	.LBB123_47
.LBB123_47:                             // %.preheader116.preheader
                                        //   in Loop: Header=BB123_35 Depth=1
	mov	x0, 0
.LBB123_48:                             // %.preheader116
                                        //   Parent Loop BB123_35 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x2, x8
	add	x2, x0
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
add	x0, 1
	mov	[x2], rax
	jne	x14, x0, .LBB123_48
	jmp	.LBB123_49
.LBB123_49:                             // %memset.exit73
                                        //   in Loop: Header=BB123_35 Depth=1
	mov	x14, x9
add	x14, 9
	jmp	.LBB123_77
.LBB123_50:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x10, 0
	jz	x8, .LBB123_77
	jmp	.LBB123_51
.LBB123_51:                             //   in Loop: Header=BB123_35 Depth=1
	mov	r1, -2147483648
	mov	r0, x8
	call	__bit_xor
	mov	r0, -1147483648
	jl	rax, r0, .LBB123_53
	jmp	.LBB123_52
.LBB123_52:
	call	abort
.LBB123_53:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x13, 9
	jg	x8, x6, .LBB123_62
	jmp	.LBB123_54
.LBB123_54:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x13, 8
	mov	r0, 9999999
	jg	x8, r0, .LBB123_62
	jmp	.LBB123_55
.LBB123_55:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x13, 7
	mov	r0, 999999
	jg	x8, r0, .LBB123_62
	jmp	.LBB123_56
.LBB123_56:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x13, 6
	mov	r0, 99999
	jg	x8, r0, .LBB123_62
	jmp	.LBB123_57
.LBB123_57:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x13, 5
	mov	r0, 9999
	jg	x8, r0, .LBB123_62
	jmp	.LBB123_58
.LBB123_58:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x13, 4
	mov	r0, 999
	jg	x8, r0, .LBB123_62
	jmp	.LBB123_59
.LBB123_59:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x13, 3
	mov	r0, 99
	jg	x8, r0, .LBB123_62
	jmp	.LBB123_60
.LBB123_60:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x13, 2
	mov	r0, 9
	jg	x8, r0, .LBB123_62
	jmp	.LBB123_61
.LBB123_61:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x13, 1
.LBB123_62:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x12, x11
	mul	x12, 9
	add	x12, x13
	mov	r1, -2147483648
add	x12, -1
	mov	r0, [rsp+44]
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x13
	call	__bit_xor
	jg	rax, x2, .LBB123_76
	jmp	.LBB123_63
.LBB123_63:                             //   in Loop: Header=BB123_35 Depth=1
	mov	[rsp+8], x1
	mov	r0, [rsp+12]
	jz	r0, .LBB123_74
	jmp	.LBB123_64
.LBB123_64:                             //   in Loop: Header=BB123_35 Depth=1
	mov	[rsp+16], x12
	mov	x12, x15
	add	x12, x14
	mov	x6, 0
	mov	x4, x12
	add	x4, x13
	mov	r0, 10000
	jl	x8, r0, .LBB123_68
	jmp	.LBB123_65
.LBB123_65:                             //   in Loop: Header=BB123_35 Depth=1
	mov	[rsp+40], x14
	mov	x0, 0
	mov	x1, 99999999
.LBB123_66:                             // %memcpy.exit74
                                        //   Parent Loop BB123_35 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 10000
	mov	x10, x8
	mov	r0, x10
	call	__udivsi3
	mov	x8, rax
	mov	x2, x8
	mul	x2, -10000
	add	x2, x10
	mov	r1, 100
	mov	r0, x2
	call	__udivsi3
	mov	x14, rax
	mov	r0, x14
	mul	r0, -100
	add	r0, x2
	mov	r1, 1
	call	__bit_shl
	mov	x2, rax
	mov	x9, x4
	add	x9, x0
	add	x2, x5
	mov	r0, [x2]
	mov	x15, x9
add	x15, -1
	mov	r1, 255
add	x2, 1
	call	__bit_and
	mov	r0, [x15]
	mov	r1, -256
	mov	x6, rax
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	[x15], rax
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x9]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x9], rax
	mov	r0, x14
	call	__bit_shl
	mov	x2, rax
	add	x2, x5
	mov	r0, [x2]
	mov	x14, x9
add	x14, -3
	mov	r1, 255
add	x2, 1
	call	__bit_and
	mov	r0, [x14]
	mov	x6, rax
	mov	r1, -256
add	x9, -2
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	[x14], rax
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x9]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x9], rax
add	x0, -4
	jg	x10, x1, .LBB123_66
	jmp	.LBB123_67
.LBB123_67:                             // %.loopexit115.loopexit
                                        //   in Loop: Header=BB123_35 Depth=1
	mov	x6, 0
	sub	x6, x0
	mov	x15, [rsp+24]
	mov	x14, [rsp+40]
	mov	x7, [rsp+36]
.LBB123_68:                             // %.loopexit115
                                        //   in Loop: Header=BB123_35 Depth=1
	mov	r0, 100
	jl	x8, r0, .LBB123_70
	jmp	.LBB123_69
.LBB123_69:                             // %memcpy.exit76.loopexit
                                        //   in Loop: Header=BB123_35 Depth=1
	mov	r1, 65532
	mov	r0, x8
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shr
	mul	rax, 5243
	mov	r1, 17
	mov	r0, rax
	call	__bit_shr
	mov	x10, rax
	mov	r0, x10
	mul	r0, -100
	add	r0, x8
	mov	r1, 65535
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_shl
	mov	x2, rax
	sub	x4, x6
	add	x2, x5
	mov	r0, [x2]
	mov	x0, x4
add	x0, -1
	mov	r1, 255
add	x2, 1
	call	__bit_and
	mov	r0, [x0]
	mov	r1, -256
	mov	x6, rax
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x7
	mov	x7, [rsp+36]
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x4]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
	mov	x8, x10
.LBB123_70:                             // %memcpy.exit76
                                        //   in Loop: Header=BB123_35 Depth=1
	mov	x0, x12
add	x0, 1
	mov	r0, 10
	jl	x8, r0, .LBB123_72
	jmp	.LBB123_71
.LBB123_71:                             //   in Loop: Header=BB123_35 Depth=1
	mov	r1, 1
	mov	r0, x8
	call	__bit_shl
	mov	x2, rax
	add	x2, x5
	mov	r0, x2
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x4, x12
add	x4, 2
	mov	r0, [x4]
	mov	r1, -256
	mov	x6, rax
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x7
	mov	x7, [rsp+36]
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	x4, [rsp+28]
	jmp	.LBB123_73
.LBB123_72:                             //   in Loop: Header=BB123_35 Depth=1
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	r1, 48
	mov	[x0], rax
	mov	r0, x8
	call	__bit_or
	mov	x4, [rsp+28]
.LBB123_73:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x2, [x12]
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x6, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x12], rax
	mov	r0, x13
add	r0, 1
	mov	x12, [rsp+16]
	mov	x1, [rsp+8]
	jmp	.LBB123_75
.LBB123_74:                             //   in Loop: Header=BB123_35 Depth=1
	mov	x0, x15
	add	x0, x14
	mov	x2, [x0]
add	x8, 48
	mov	r1, 255
	mov	r0, x8
	call	__bit_and
	mov	r1, -256
	mov	x6, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, 1
	mov	x1, [rsp+8]
.LBB123_75:                             //   in Loop: Header=BB123_35 Depth=1
	add	x14, r0
	mov	x10, x13
	mov	x6, 99999999
	jmp	.LBB123_77
.LBB123_76:
	mov	x10, x13
	jmp	.LBB123_130
.LBB123_77:                             //   in Loop: Header=BB123_35 Depth=1
	mov	r0, 1
	jg	x1, r0, .LBB123_35
	jmp	.LBB123_78
.LBB123_78:
	mov	[rsp+16], x12
	mov	x6, 0
	mov	r0, [rsp+4]
	mov	x4, 0
	jl	r0, x6, .LBB123_80
	jmp	.LBB123_129
.LBB123_79:
	mov	r0, x0
	call	__bit_not
	mul	rax, 78913
	mov	r1, 18
	mov	r0, rax
	call	__bit_shr
add	rax, -15
	mov	r1, 65535
	mov	r0, rax
	call	__bit_and
	mul	rax, 58255
	mov	r1, 19
	mov	r0, rax
	call	__bit_shr
	mov	r1, -2
	mov	x1, rax
	mov	r0, x1
	call	__bit_and
	mov	x2, rax
	mov	r1, 1
	mov	x6, 1
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x6, x1
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
add	x1, -1
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	x6, rax
	mov	r0, 0
	mov	[rsp+16], r0
	mov	x10, 0
	mov	x4, 0
.LBB123_80:
	mov	r0, [rsp+4]
	sub	x4, r0
	mov	x9, x10
	mov	[rsp+20], x4
.LBB123_81:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB123_117 Depth 2
                                        //     Child Loop BB123_96 Depth 2
                                        //     Child Loop BB123_99 Depth 2
	mov	x11, x6
	mov	r0, rsp
add	r0, 68
	mov	[r0], 0
	mov	r0, rsp
add	r0, 64
	mov	[r0], 0
	mov	r0, rsp
add	r0, 60
	mov	[r0], 0
	mov	r0, rsp
add	r0, 56
	mov	[r0], 0
	mov	r0, rsp
add	r0, 52
	mov	[r0], 0
	mov	[rsp+48], 0
add	x6, 1
	jz	x11, .LBB123_83
	jmp	.LBB123_82
.LBB123_82:                             //   in Loop: Header=BB123_81 Depth=1
	mov	r0, x11
	mul	r0, 9
	jg	r0, x4, .LBB123_84
	jmp	.LBB123_83
.LBB123_83:                             //   in Loop: Header=BB123_81 Depth=1
	mov	[rsp+40], x14
	mov	r2, rsp
add	r2, 48
	mov	r0, x4
	mov	[rsp+32], x6
	mov	r1, x6
	call	ryu_fill_pow10_split_2_exp
	mov	r0, rsp
add	r0, 52
	mov	x2, [rsp+48]
	mov	x8, [r0]
	mov	r1, 0
	mov	r3, 0
	mov	r0, x2
	mov	r2, x7
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x4, x7
	mov	x7, rax
	mov	x13, t0
	mov	r0, x2
	mov	x1, [rsp+28]
	mov	r2, x1
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x6, t0
	mov	r0, x8
	mov	r2, x1
	call	__muldi3
	mov	x2, rax
	mov	x14, x2
	add	x14, x6
	mov	x12, x7
	add	x12, x14
	mov	x10, t0
	mov	r0, x12
	mov	r1, x7
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x14
	call	__bit_and
	mov	x15, rax
	mov	r0, x12
	call	__bit_not
	mov	r0, rax
	mov	r1, x7
	call	__bit_and
	mov	r0, rax
	mov	r1, x15
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x12, rax
	mov	r0, x14
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	x7, rax
	mov	r0, x14
	mov	r1, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x6
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	x10, rax
	add	x12, x13
	mov	x2, x10
	mov	r1, 0
	mov	r3, 0
	add	x2, x12
	mov	r0, x8
	mov	r2, x4
	call	__muldi3
	mov	x6, rax
	mov	x8, x6
	add	x8, x2
	mov	x15, t0
	mov	r0, x8
	mov	r1, x6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	x7, rax
	mov	r0, x8
	call	__bit_not
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	mov	r0, x2
	call	__bit_not
	mov	r0, rax
	mov	r1, x10
	call	__bit_and
	mov	x7, rax
	mov	r0, x2
	mov	r1, x10
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x12
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	add	x15, rax
	mov	r0, rsp
add	r0, 56
	mov	r1, rsp
add	r1, 60
	mov	x2, [r0]
	mov	x7, [r1]
	mov	r1, 0
	mov	r3, 0
	add	x15, x6
	mov	r0, x2
	mov	r2, x1
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x6, rax
	mov	x10, t0
	mov	r0, x2
	mov	r2, x4
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x2, rax
	mov	x5, t0
	mov	r0, x7
	mov	r2, x1
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x12, rax
	mov	x0, t0
	mov	r0, x7
	mov	r2, x4
	call	__muldi3
	mov	r1, 0
	mov	x13, rax
	mov	x14, t0
	mov	r0, x10
	mov	r2, x12
	mov	r3, x0
	call	__adddi3
	mov	r1, 0
	mov	x12, t0
	mov	r0, rax
	mov	r2, x2
	mov	r3, x5
	call	__adddi3
	mov	r1, 0
	mov	x0, rax
	mov	x10, t0
	mov	r0, x6
	mov	r2, x8
	mov	r3, x15
	call	__adddi3
	mov	r2, 0
	mov	r1, t0
	mov	r0, rax
	mov	r3, x0
	call	__adddi3
	mov	x6, rax
	mov	x0, t0
	mov	r0, x0
	mov	r1, x15
	call	__bit_xor
	mov	x2, rax
	mov	r0, x2
	call	__bit_not
	mov	x5, rax
	mov	r1, x5
add	r1, 1
	mov	r0, x2
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
	sub	r1, x15
	mov	x2, rax
	mov	r0, x5
	call	__bit_and
	mov	x5, rax
	mov	r0, x0
	call	__bit_not
	mov	r0, rax
	mov	r1, x15
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
	mov	x0, rax
	mov	r0, x6
	mov	r1, x8
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x6
	sub	r1, x8
	mov	r0, rax
	call	__bit_and
	mov	x5, rax
	mov	r0, x6
	call	__bit_not
	mov	r0, rax
	mov	r1, x8
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
	sub	rax, x0
add	x2, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	add	x0, rax
	mov	r1, 1
	mov	r0, x0
	call	__bit_and
	mov	r0, rsp
add	r0, 64
	mov	r1, rsp
add	r1, 68
	mov	x0, [r0]
	mov	x2, [r1]
	mov	r1, 0
	mov	r3, 0
	mov	x15, rax
	mov	r0, x0
	mov	r2, x1
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x5, rax
	mov	x6, t0
	mov	r0, x0
	mov	r2, x4
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x0, rax
	mov	x7, t0
	mov	r0, x2
	mov	r2, x1
	call	__muldi3
	mov	r1, 0
	mov	r3, 0
	mov	x8, rax
	mov	x3, t0
	mov	r0, x2
	mov	r2, x4
	call	__muldi3
	mov	r1, 0
	mov	x2, rax
	mov	x1, t0
	mov	r0, x6
	mov	r2, x8
	mov	r3, x3
	call	__adddi3
	mov	r1, 0
	mov	x3, t0
	mov	r0, rax
	mov	r2, x0
	mov	r3, x7
	call	__adddi3
	mov	r1, 0
	mov	x0, rax
	mov	x6, t0
	mov	r0, x5
	mov	r2, x13
	mov	r3, x14
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x12
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x10
	call	__adddi3
	mov	r2, 0
	mov	x12, rax
	mov	x8, t0
	mov	r0, x12
	mov	r1, x8
	mov	r3, x0
	call	__adddi3
	mov	r1, 0
	mov	x10, t0
	mov	r0, x3
	mov	r2, x2
	mov	r3, x1
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x6
	call	__adddi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x15
	call	__adddi3
	mov	r1, -512
	mov	x0, rax
	mov	x1, t0
	mov	r0, x0
	call	__bit_and
	mov	r2, 0
	mov	r3, 1000000000
	mov	x2, rax
	mov	r0, x0
	mov	r1, x1
	call	__umoddi3
	mov	r1, 1073741823
	mov	r0, t0
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, x2
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x0
	mov	r3, x1
	call	__adddi3
	mov	r1, -512
	mov	x0, rax
	mov	r0, x12
	call	__bit_and
	mov	r2, 1000000000
	mov	r3, 0
	mov	x1, rax
	mov	r0, x10
	mov	r1, x0
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x10
	mov	r3, x0
	call	__adddi3
	mov	r2, 1000000000
	mov	r3, 0
	mov	r0, x1
	mov	r1, rax
	call	__udivdi3
	mov	r2, -1000000000
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	call	__muldi3
	mov	r1, t0
	mov	r0, rax
	mov	r2, x12
	mov	r3, x8
	call	__adddi3
	mov	x8, rax
	jz	x9, .LBB123_101
	jmp	.LBB123_85
.LBB123_84:                             //   in Loop: Header=BB123_81 Depth=1
	mov	x10, 0
	jz	x9, .LBB123_128
	jmp	.LBB123_86
.LBB123_85:                             //   in Loop: Header=BB123_81 Depth=1
	mov	x11, x9
add	x11, 9
	mov	r1, -2147483648
	mov	x10, 9
	mov	r0, [rsp+44]
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x11
	call	__bit_xor
	mov	x15, [rsp+24]
	mov	x14, [rsp+40]
	mov	x7, [rsp+36]
	mov	x4, [rsp+20]
	mov	x6, [rsp+32]
	jg	rax, x0, .LBB123_127
	jmp	.LBB123_88
.LBB123_86:                             //   in Loop: Header=BB123_81 Depth=1
	mov	x11, x9
add	x11, 9
	mov	x10, 9
	mov	r1, -2147483648
	mov	x8, 0
	mov	r0, [rsp+44]
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x11
	call	__bit_xor
	jg	rax, x0, .LBB123_127
	jmp	.LBB123_87
.LBB123_87:                             //   in Loop: Header=BB123_81 Depth=1
	mov	x10, x15
	add	x10, x14
	jmp	.LBB123_90
.LBB123_88:                             //   in Loop: Header=BB123_81 Depth=1
	mov	x10, x15
	add	x10, x14
	jz	x8, .LBB123_90
	jmp	.LBB123_89
.LBB123_89:                             // %memcpy.exit77
                                        //   in Loop: Header=BB123_81 Depth=1
	mov	x3, x10
	mov	r1, 10000
add	x3, 7
	mov	r0, x8
	call	__udivsi3
	mov	x12, rax
	mov	x0, x12
	mul	x0, -10000
	add	x0, x8
	mov	r1, 100
	mov	r0, x0
	call	__udivsi3
	mov	x13, rax
	mov	r0, x13
	mul	r0, -100
	add	r0, x0
	mov	r1, 1
	call	__bit_shl
	mov	x0, rax
	mov	x9, mcasm_static_bff1819c724c09c306780236d311fec2
	add	x0, x9
	mov	r0, [x0]
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x3]
	mov	x1, rax
	mov	x5, x10
	mov	r1, -256
add	x5, 8
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x5]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	mov	x3, x10
	mov	r1, 1
add	x3, 5
	mov	r0, x13
	call	__bit_shl
	mov	x0, rax
	add	x0, x9
	mov	r0, [x0]
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x3]
	mov	x1, rax
	mov	x5, x10
	mov	r1, -256
add	x5, 6
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x5]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 100000000
	mov	[x5], rax
	mov	r0, x8
	call	__udivsi3
	mov	x8, rax
	mov	x0, x8
	mul	x0, -10000
	add	x0, x12
	mov	r1, 100
	mov	r0, x0
	call	__udivsi3
	mov	x12, rax
	mov	r0, x12
	mul	r0, -100
	add	r0, x0
	mov	r1, 1
	call	__bit_shl
	mov	x0, rax
	add	x0, x9
	mov	r0, [x0]
	mov	x3, x10
add	x3, 3
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x3]
	mov	x1, rax
	mov	x5, x10
	mov	r1, -256
add	x5, 4
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x5]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x5], rax
	mov	r0, x12
	call	__bit_shl
	mov	x0, rax
	add	x0, x9
	mov	r0, [x0]
	mov	x3, x10
add	x3, 1
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x3]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, [x0]
	mov	x2, x10
	mov	r1, 255
add	x2, 2
	call	__bit_and
	mov	r0, [x2]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x2], rax
	mov	r0, [x10]
	mov	r1, -256
add	x8, 48
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x8
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	[x10], rax
	jmp	.LBB123_100
.LBB123_90:                             //   in Loop: Header=BB123_81 Depth=1
	mov	r1, 3
	mov	r0, x10
	call	__bit_and
	mov	x8, 9
	jz	rax, .LBB123_95
	jmp	.LBB123_91
.LBB123_91:                             // %.preheader111.preheader
                                        //   in Loop: Header=BB123_81 Depth=1
	mov	x0, x15
	add	x0, x14
	mov	r0, [x0]
	mov	x10, x0
	mov	r1, -256
add	x10, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x0], rax
	mov	r0, x10
	call	__bit_and
	mov	x8, 8
	jz	rax, .LBB123_95
	jmp	.LBB123_92
.LBB123_92:                             // %.preheader111.1
                                        //   in Loop: Header=BB123_81 Depth=1
	mov	x1, x0
add	x1, 1
	mov	r0, [x1]
	mov	x10, x0
	mov	r1, -256
add	x10, 2
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x1], rax
	mov	r0, x10
	call	__bit_and
	mov	x8, 7
	jz	rax, .LBB123_95
	jmp	.LBB123_93
.LBB123_93:                             // %.preheader111.2
                                        //   in Loop: Header=BB123_81 Depth=1
	mov	x1, x0
add	x1, 2
	mov	r0, [x1]
	mov	x10, x0
	mov	r1, -256
add	x10, 3
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x1], rax
	mov	r0, x10
	call	__bit_and
	mov	x8, 6
	jz	rax, .LBB123_95
	jmp	.LBB123_94
.LBB123_94:                             // %.preheader111.3
                                        //   in Loop: Header=BB123_81 Depth=1
	mov	x10, x0
add	x0, 3
	mov	r0, [x0]
	mov	r1, -256
add	x10, 4
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	x8, 5
.LBB123_95:                             // %.thread98.preheader
                                        //   in Loop: Header=BB123_81 Depth=1
	mov	x0, -2147483645
.LBB123_96:                             // %.thread98
                                        //   Parent Loop BB123_81 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	[x10], 808464432
add	x8, -4
	mov	r1, -2147483648
add	x10, 4
	mov	r0, x8
	call	__bit_xor
	jg	rax, x0, .LBB123_96
	jmp	.LBB123_97
.LBB123_97:                             // %.loopexit5.i82
                                        //   in Loop: Header=BB123_81 Depth=1
	jz	x8, .LBB123_100
	jmp	.LBB123_98
.LBB123_98:                             // %.preheader110.preheader
                                        //   in Loop: Header=BB123_81 Depth=1
	mov	x0, 0
.LBB123_99:                             // %.preheader110
                                        //   Parent Loop BB123_81 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x1, x10
	add	x1, x0
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
add	x0, 1
	mov	[x1], rax
	jne	x8, x0, .LBB123_99
	jmp	.LBB123_100
.LBB123_100:                            // %memset.exit84
                                        //   in Loop: Header=BB123_81 Depth=1
add	x14, 9
	mov	x10, x11
	jmp	.LBB123_128
.LBB123_101:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x10, 0
	mov	x15, [rsp+24]
	mov	x14, [rsp+40]
	mov	x7, [rsp+36]
	mov	x4, [rsp+20]
	mov	x6, [rsp+32]
	mov	x13, 99999999
	jz	x8, .LBB123_128
	jmp	.LBB123_102
.LBB123_102:                            //   in Loop: Header=BB123_81 Depth=1
	mov	r1, -2147483648
	mov	r0, x8
	call	__bit_xor
	mov	r0, -1147483648
	jl	rax, r0, .LBB123_104
	jmp	.LBB123_103
.LBB123_103:
	call	abort
.LBB123_104:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x10, 9
	jg	x8, x13, .LBB123_113
	jmp	.LBB123_105
.LBB123_105:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x10, 8
	mov	r0, 9999999
	jg	x8, r0, .LBB123_113
	jmp	.LBB123_106
.LBB123_106:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x10, 7
	mov	r0, 999999
	jg	x8, r0, .LBB123_113
	jmp	.LBB123_107
.LBB123_107:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x10, 6
	mov	r0, 99999
	jg	x8, r0, .LBB123_113
	jmp	.LBB123_108
.LBB123_108:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x10, 5
	mov	r0, 9999
	jg	x8, r0, .LBB123_113
	jmp	.LBB123_109
.LBB123_109:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x10, 4
	mov	r0, 999
	jg	x8, r0, .LBB123_113
	jmp	.LBB123_110
.LBB123_110:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x10, 3
	mov	r0, 99
	jg	x8, r0, .LBB123_113
	jmp	.LBB123_111
.LBB123_111:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x10, 2
	mov	r0, 9
	jg	x8, r0, .LBB123_113
	jmp	.LBB123_112
.LBB123_112:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x10, 1
.LBB123_113:                            //   in Loop: Header=BB123_81 Depth=1
	mov	r0, x11
	call	__bit_not
	mul	rax, 9
	add	rax, x10
	mov	r1, -2147483648
add	rax, -1
	mov	[rsp+16], rax
	mov	r0, [rsp+44]
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x10
	call	__bit_xor
	jg	rax, x0, .LBB123_127
	jmp	.LBB123_114
.LBB123_114:                            //   in Loop: Header=BB123_81 Depth=1
	mov	r0, [rsp+12]
	jz	r0, .LBB123_125
	jmp	.LBB123_115
.LBB123_115:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x3, x15
	add	x3, x14
	mov	x1, 0
	mov	r0, 10000
	jl	x8, r0, .LBB123_119
	jmp	.LBB123_116
.LBB123_116:                            //   in Loop: Header=BB123_81 Depth=1
	mov	[rsp+8], x3
	mov	x6, x3
	add	x6, x10
	mov	x5, 0
	mov	x3, mcasm_static_bff1819c724c09c306780236d311fec2
.LBB123_117:                            // %memcpy.exit85
                                        //   Parent Loop BB123_81 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 10000
	mov	x11, x8
	mov	r0, x11
	call	__udivsi3
	mov	x8, rax
	mov	x0, x8
	mul	x0, -10000
	add	x0, x11
	mov	r1, 100
	mov	r0, x0
	call	__udivsi3
	mov	x12, rax
	mov	r0, x12
	mul	r0, -100
	add	r0, x0
	mov	r1, 1
	call	__bit_shl
	mov	x0, rax
	mov	x7, x6
	add	x7, x5
	add	x0, x3
	mov	r0, [x0]
	mov	x9, x7
add	x9, -1
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x9]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x9], rax
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x7]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x7], rax
	mov	r0, x12
	call	__bit_shl
	mov	x0, rax
	add	x0, x3
	mov	r0, [x0]
	mov	x9, x7
add	x9, -3
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x9]
	mov	x1, rax
	mov	r1, -256
add	x7, -2
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x9], rax
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x7]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
add	x5, -4
	jg	x11, x13, .LBB123_117
	jmp	.LBB123_118
.LBB123_118:                            // %.loopexit113.loopexit
                                        //   in Loop: Header=BB123_81 Depth=1
	mov	x1, 0
	sub	x1, x5
	mov	x7, [rsp+36]
	mov	x6, [rsp+32]
	mov	x3, [rsp+8]
.LBB123_119:                            // %.loopexit113
                                        //   in Loop: Header=BB123_81 Depth=1
	mov	r0, 100
	jl	x8, r0, .LBB123_121
	jmp	.LBB123_120
.LBB123_120:                            // %memcpy.exit87.loopexit
                                        //   in Loop: Header=BB123_81 Depth=1
	mov	r1, 65532
	mov	r0, x8
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shr
	mul	rax, 5243
	mov	r1, 17
	mov	r0, rax
	call	__bit_shr
	mov	x11, rax
	mov	r0, x11
	mul	r0, -100
	add	r0, x8
	mov	r1, 65535
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_shl
	mov	x0, rax
	mov	x5, x3
	add	x5, x10
	sub	x5, x1
	mov	r0, mcasm_static_bff1819c724c09c306780236d311fec2
	add	x0, r0
	mov	r0, [x0]
	mov	x6, x5
add	x6, -1
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x6]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x6], rax
	mov	x6, [rsp+32]
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x5]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	mov	x8, x11
.LBB123_121:                            // %memcpy.exit87
                                        //   in Loop: Header=BB123_81 Depth=1
	mov	r0, 10
	jl	x8, r0, .LBB123_123
	jmp	.LBB123_122
.LBB123_122:                            //   in Loop: Header=BB123_81 Depth=1
	mov	r1, 1
	mov	r0, x8
	call	__bit_shl
	mov	x0, rax
	mov	r0, mcasm_static_bff1819c724c09c306780236d311fec2
	add	x0, r0
	mov	r0, x0
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x5, x3
add	x5, 2
	mov	r0, [x5]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	mov	x1, x3
add	x1, 1
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jmp	.LBB123_124
.LBB123_123:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x0, x3
add	x0, 1
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	r1, 48
	mov	[x0], rax
	mov	r0, x8
	call	__bit_or
.LBB123_124:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x0, [x3]
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	r0, x10
add	r0, 1
	jmp	.LBB123_126
.LBB123_125:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x2, x15
	add	x2, x14
	mov	x0, [x2]
add	x12, 48
	mov	r1, 255
	mov	r0, x12
	call	__bit_and
	mov	r1, -256
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	[x2], rax
	mov	r0, 1
.LBB123_126:                            //   in Loop: Header=BB123_81 Depth=1
	add	x14, r0
	jmp	.LBB123_128
.LBB123_127:
	mov	x12, [rsp+16]
	mov	x4, [rsp+28]
	jmp	.LBB123_130
.LBB123_128:                            //   in Loop: Header=BB123_81 Depth=1
	mov	x9, x10
	mov	r0, 200
	jne	x6, r0, .LBB123_81
	jmp	.LBB123_129
.LBB123_129:                            // %.loopexit114
	mov	x7, [rsp+44]
	sub	x7, x10
	mov	x2, 0
	mov	x9, x10
	mov	x8, 0
	mov	x12, [rsp+16]
	jmp	.LBB123_134
.LBB123_130:
	mov	x7, [rsp+44]
	sub	x7, x9
	mov	r1, -2147483648
	mov	x2, 0
	mov	r0, x7
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x10
	call	__bit_xor
	jle	rax, x0, .LBB123_134
	jmp	.LBB123_131
.LBB123_131:
	mov	x0, [rsp+12]
	sub	x0, x10
add	x0, 1
.LBB123_132:                            // =>This Inner Loop Header: Depth=1
	mov	r1, 10
	mov	x6, x8
	mov	r0, x6
	call	__udivsi3
add	x0, 1
	mov	x8, rax
	jne	x9, x0, .LBB123_132
	jmp	.LBB123_133
.LBB123_133:
	mov	x2, x8
	mul	x2, -10
	add	x2, x6
	mov	r0, 5
	je	x2, r0, .LBB123_135
	jmp	.LBB123_134
.LBB123_134:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r1, 2147483642
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	mov	x1, rax
	mov	r1, -2147483643
	mov	x2, -2147483643
	mov	r0, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x2, x0
	mov	r0, rax
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x6, rax
	jmp	.LBB123_149
.LBB123_135:
	mov	r0, [rsp+44]
	sub	r0, x12
	mov	x10, r0
	mov	r1, [rsp+4]
	add	r1, r0
	mov	x2, 0
	sub	x2, r1
	mov	x3, 1
	jl	x2, x3, .LBB123_140
	jmp	.LBB123_136
.LBB123_136:
	mov	r0, 59
	mov	x6, 1
	jg	x2, r0, .LBB123_149
	jmp	.LBB123_137
.LBB123_137:
	mov	r0, x4
	mov	x6, [rsp+36]
	mov	r1, x6
	call	__bit_or
	jnz	rax, .LBB123_139
	jmp	.LBB123_138
.LBB123_138:
	call	abort
.LBB123_139:
	mov	r1, 31
	mov	r0, x2
	call	__bit_and
	mov	x0, rax
	mov	r1, 0
	sub	r1, x0
	mov	x1, 0
	mov	r0, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
add	x2, -32
	mov	r1, 31
	mov	x3, rax
	mov	r0, x2
	call	__bit_shr
	mov	r0, -1
	mov	x2, rax
	mov	r1, x0
	call	__bit_shl
	mov	x5, 0
	sub	x5, x2
	mov	x2, rax
	mov	r0, x5
	call	__bit_not
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	mov	r0, 32
	sub	r0, x0
	mov	r1, 31
	mov	x0, rax
	call	__bit_and
	mov	r0, -1
	mov	r1, rax
	call	__bit_shr
	sub	x1, x3
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	x0, rax
	mov	r0, x2
	mov	r1, x5
	call	__bit_and
	mov	x1, rax
	mov	r0, x0
	call	__bit_not
	mov	x0, rax
	mov	r0, x1
	call	__bit_not
	mov	x1, rax
	mov	r0, x6
	mov	r1, x0
	call	__bit_and
	mov	x0, rax
	mov	r0, x4
	mov	r1, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
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
	call	__bit_xor
	mov	x3, rax
.LBB123_140:
	mov	r0, -1
	jg	x10, r0, .LBB123_147
	jmp	.LBB123_141
.LBB123_141:
	mov	r1, 1
	mov	r0, x3
	call	__bit_and
	jz	rax, .LBB123_147
	jmp	.LBB123_142
.LBB123_142:
	mov	r0, x4
	mov	r1, [rsp+36]
	call	__bit_or
	jz	rax, .LBB123_144
	jmp	.LBB123_143
.LBB123_143:                            // %.preheader109.preheader
	mov	x1, 0
	sub	x1, x10
	mov	x5, -1
	mov	x2, [rsp+36]
	jmp	.LBB123_145
.LBB123_144:
	call	abort
.LBB123_145:                            // %.preheader109
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, -858993459
	mov	r3, -858993460
	mov	r0, x4
	mov	r1, x2
	call	__muldi3
	mov	r1, 858993459
	mov	x4, rax
	mov	x2, t0
	mov	r0, x2
	call	__bit_xor
	mov	x6, rax
	mov	r0, x6
	call	__bit_not
	mov	r1, x2
add	r1, -858993459
	mov	x10, rax
	mov	r0, x10
	call	__bit_and
	mov	x0, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, 858993459
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 858993460
	mov	x11, rax
	mov	r0, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x4
add	r1, -858993460
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
	mov	r0, x4
	call	__bit_not
	mov	r1, 858993460
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
add	x10, 1
	sub	x0, x11
	mov	r0, x6
	mov	r1, x10
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
	mov	r1, x0
	call	__bit_and
	add	rax, x11
add	x5, 1
	jnz	rax, .LBB123_145
	jmp	.LBB123_146
.LBB123_146:
	mov	r1, -2147483648
	mov	x6, 1
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x5
	call	__bit_xor
	jge	rax, x0, .LBB123_148
	jmp	.LBB123_149
.LBB123_147:
	mov	r1, -2147483648
	mov	r0, x10
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 2147483647
	mov	x1, rax
	mov	r0, x0
	call	__bit_xor
	mov	r1, 2147483647
	mov	x2, rax
	mov	r0, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	x6, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB123_149
	jmp	.LBB123_148
.LBB123_148:
	mov	x6, 2
.LBB123_149:
	jz	x9, .LBB123_171
	jmp	.LBB123_150
.LBB123_150:
	mov	x2, x15
	add	x2, x14
	jnz	x8, .LBB123_166
	jmp	.LBB123_151
.LBB123_151:
	mov	r1, 3
	mov	r0, x2
	call	__bit_and
	mov	x3, x7
	jz	rax, .LBB123_156
	jmp	.LBB123_152
.LBB123_152:                            // %.preheader106.preheader
	mov	x1, x15
	add	x1, x14
add	x1, 1
	mov	x0, 0
.LBB123_153:                            // %.preheader106
                                        // =>This Inner Loop Header: Depth=1
	je	x7, x0, .LBB123_183
	jmp	.LBB123_154
.LBB123_154:                            //   in Loop: Header=BB123_153 Depth=1
	mov	x3, x2
	add	x3, x0
	mov	r0, [x3]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r0, x1
	add	r0, x0
	mov	r1, 3
	mov	[x3], rax
	call	__bit_and
add	x0, 1
	jnz	rax, .LBB123_153
	jmp	.LBB123_155
.LBB123_155:                            // %.loopexit7.i88.loopexit
	add	x2, x0
	mov	x3, x7
	sub	x3, x0
.LBB123_156:                            // %.loopexit7.i88
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB123_163
	jmp	.LBB123_157
.LBB123_157:
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB123_159
	jmp	.LBB123_158
.LBB123_158:                            // %.preheader.i90.preheader
	mov	x0, -2147483633
	jmp	.LBB123_161
.LBB123_159:                            // %.preheader435
	mov	x0, -2147483645
	jmp	.LBB123_162
.LBB123_160:
	mov	r0, 3
	jg	x3, r0, .LBB123_159
	jmp	.LBB123_163
.LBB123_161:                            // %.preheader.i90
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x2
add	r0, 4
	mov	[x2], 808464432
	mov	r1, x2
add	r1, 8
	mov	[r0], 808464432
	mov	r0, x2
add	r0, 12
	mov	[r1], 808464432
add	x2, 16
add	x3, -16
	mov	r1, -2147483648
	mov	[r0], 808464432
	mov	r0, x3
	call	__bit_xor
	jg	rax, x0, .LBB123_161
	jmp	.LBB123_160
.LBB123_162:                            // =>This Inner Loop Header: Depth=1
	mov	[x2], 808464432
add	x3, -4
	mov	r1, -2147483648
add	x2, 4
	mov	r0, x3
	call	__bit_xor
	jg	rax, x0, .LBB123_162
	jmp	.LBB123_163
.LBB123_163:                            // %.loopexit5.i89
	jz	x3, .LBB123_183
	jmp	.LBB123_164
.LBB123_164:                            // %.preheader105.preheader
	mov	x0, x2
.LBB123_165:                            // %.preheader105
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
add	x3, -1
	mov	r1, -256
add	x0, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	mov	x2, x0
	jz	x3, .LBB123_183
	jmp	.LBB123_165
.LBB123_166:
	mov	x4, x7
add	x4, -1
	mov	x3, 0
	jz	x4, .LBB123_169
	jmp	.LBB123_167
.LBB123_167:
	mov	x9, x14
	add	x9, x7
	add	x9, x15
add	x9, -1
	mov	x10, mcasm_static_bff1819c724c09c306780236d311fec2
	mov	x5, x8
.LBB123_168:                            // %memcpy.exit92
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 100
	mov	r0, x5
	call	__udivsi3
	mov	x8, rax
	mov	r0, x8
	mul	r0, -100
	add	x5, r0
	mov	r1, 1
	mov	r0, x5
	call	__bit_shl
	mov	x0, rax
	add	x0, x10
	mov	r0, [x0]
	mov	x11, x9
add	x11, -1
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x11]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	[x11], rax
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x9]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x9], rax
add	x3, 2
	mov	r1, -2147483648
add	x9, -2
	mov	r0, x4
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x3
	call	__bit_xor
	mov	x5, x8
	jl	rax, x0, .LBB123_168
	jmp	.LBB123_169
.LBB123_169:                            // %.loopexit108
	mov	r1, -2147483648
	mov	r0, x7
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x3
	call	__bit_xor
	jge	rax, x0, .LBB123_183
	jmp	.LBB123_170
.LBB123_170:
	mov	r1, 10
	mov	r0, x8
	call	__umodsi3
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	x0, rax
	mov	r0, x3
	call	__bit_not
	add	x2, x7
	add	x2, rax
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x2], rax
	jmp	.LBB123_183
.LBB123_171:
	mov	r0, [rsp+12]
	jz	r0, .LBB123_182
	jmp	.LBB123_172
.LBB123_172:
	mov	x5, x15
	add	x5, x14
	mov	r1, -2147483648
	mov	x0, 0
	mov	r0, x8
	call	__bit_xor
	mov	r0, -2147473648
	mov	x9, x5
	add	x9, x7
	jl	rax, r0, .LBB123_176
	jmp	.LBB123_173
.LBB123_173:
	mov	[rsp+40], x14
	mov	[rsp+16], x12
	mov	x10, 0
	mov	x11, mcasm_static_bff1819c724c09c306780236d311fec2
	mov	x12, -2047483649
.LBB123_174:                            // %memcpy.exit93
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 10000
	mov	x2, x8
	mov	r0, x2
	call	__udivsi3
	mov	x8, rax
	mov	x0, x8
	mul	x0, -10000
	add	x0, x2
	mov	r1, 100
	mov	r0, x0
	call	__udivsi3
	mov	x3, rax
	mov	r0, x3
	mul	r0, -100
	add	r0, x0
	mov	r1, 1
	call	__bit_shl
	mov	x0, rax
	mov	x13, x9
	add	x13, x10
	add	x0, x11
	mov	r0, [x0]
	mov	x14, x13
add	x14, -1
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x14]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x14], rax
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x13]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	[x13], rax
	mov	r0, x3
	call	__bit_shl
	mov	x0, rax
	add	x0, x11
	mov	r0, [x0]
	mov	x4, x13
add	x4, -3
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x4]
	mov	x1, rax
	mov	r1, -256
add	x13, -2
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x13]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x13], rax
	mov	r1, -2147483648
add	x10, -4
	mov	r0, x2
	call	__bit_xor
	jg	rax, x12, .LBB123_174
	jmp	.LBB123_175
.LBB123_175:                            // %.loopexit104.loopexit
	mov	x0, 0
	sub	x0, x10
	mov	x12, [rsp+16]
	mov	x14, [rsp+40]
.LBB123_176:                            // %.loopexit104
	mov	r0, 100
	jl	x8, r0, .LBB123_178
	jmp	.LBB123_177
.LBB123_177:                            // %memcpy.exit95.loopexit
	mov	r1, 65532
	mov	r0, x8
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shr
	mul	rax, 5243
	mov	r1, 17
	mov	r0, rax
	call	__bit_shr
	mov	x2, rax
	mov	r0, x2
	mul	r0, -100
	add	r0, x8
	mov	r1, 65535
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_shl
	sub	x9, x0
	mov	x3, mcasm_static_bff1819c724c09c306780236d311fec2
	add	x3, rax
	mov	r0, [x3]
	mov	x4, x9
add	x4, -1
	mov	r1, 255
add	x3, 1
	call	__bit_and
	mov	r0, [x4]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x9]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x9], rax
	mov	x8, x2
.LBB123_178:                            // %memcpy.exit95
	mov	r0, 10
	jl	x8, r0, .LBB123_180
	jmp	.LBB123_179
.LBB123_179:
	mov	r1, 1
	mov	r0, x8
	call	__bit_shl
	mov	x2, mcasm_static_bff1819c724c09c306780236d311fec2
	add	x2, rax
	mov	r0, x2
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x3, x5
add	x3, 2
	mov	r0, [x3]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	x0, x5
add	x0, 1
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	jmp	.LBB123_181
.LBB123_180:
	mov	x0, x5
add	x0, 1
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	r1, 48
	mov	[x0], rax
	mov	r0, x8
	call	__bit_or
.LBB123_181:
	mov	x0, [x5]
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
add	x7, 1
	jmp	.LBB123_183
.LBB123_182:
	mov	x2, x15
	add	x2, x14
	mov	x0, [x2]
add	x8, 48
	mov	r1, 255
	mov	r0, x8
	call	__bit_and
	mov	r1, -256
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	[x2], rax
	mov	x7, 1
.LBB123_183:                            // %memset.exit91
	add	x7, x14
	jz	x6, .LBB123_196
	jmp	.LBB123_184
.LBB123_184:
	mov	x0, 0
	jz	x7, .LBB123_190
	jmp	.LBB123_185
.LBB123_185:                            // %.preheader103.preheader
	mov	x1, x15
add	x1, -1
	mov	x4, 46
	mov	x5, 57
	mov	x3, x7
.LBB123_186:                            // %.preheader103
                                        // =>This Inner Loop Header: Depth=1
	mov	x2, x1
	add	x2, x3
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	je	rax, x4, .LBB123_195
	jmp	.LBB123_187
.LBB123_187:                            // %.preheader103
                                        //   in Loop: Header=BB123_186 Depth=1
	je	rax, x5, .LBB123_191
	jmp	.LBB123_188
.LBB123_188:                            // %.preheader103
	mov	r0, 45
	jne	rax, r0, .LBB123_192
	jmp	.LBB123_189
.LBB123_189:                            // %.preheader103..loopexit.loopexit_crit_edge
	mov	x0, x3
.LBB123_190:                            // %.loopexit
	add	x0, x15
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 49
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
add	x12, 1
	jmp	.LBB123_196
.LBB123_191:                            //   in Loop: Header=BB123_186 Depth=1
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	mov	x6, 1
	jmp	.LBB123_195
.LBB123_192:
	mov	r1, 1
	mov	x1, rax
	mov	r0, rax
	call	__bit_and
	mov	r0, 2
	jne	x6, r0, .LBB123_194
	jmp	.LBB123_193
.LBB123_193:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB123_196
	jmp	.LBB123_194
.LBB123_194:
	mov	x0, [x2]
	mov	r0, x1
add	r0, 1
	mov	r1, 255
	call	__bit_and
	mov	r1, -256
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	[x2], rax
	jmp	.LBB123_196
.LBB123_195:                            //   in Loop: Header=BB123_186 Depth=1
add	x3, -1
	jz	x3, .LBB123_190
	jmp	.LBB123_186
.LBB123_196:
	mov	x3, x15
	add	x3, x7
	mov	r0, [x3]
	mov	r1, -256
	call	__bit_and
	mov	r1, 101
	mov	r0, rax
	call	__bit_or
	mov	r1, -2147483648
	mov	[x3], rax
	mov	r0, x12
	call	__bit_xor
	mov	x0, rax
	mov	r0, x0
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -2147483648
	mov	r0, rax
	mov	r1, x0
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 2
	mov	r0, rax
	call	__bit_and
	mov	r0, -1
add	rax, 43
	jg	x12, r0, .LBB123_198
	jmp	.LBB123_197
.LBB123_197:
	mov	r0, 0
	sub	r0, x12
	mov	x12, r0
.LBB123_198:
	mov	x2, x3
add	x2, 1
	mov	x0, [x2]
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	[x2], rax
	mov	x0, x7
	mov	r0, 100
add	x0, 2
	jl	x12, r0, .LBB123_200
	jmp	.LBB123_199
.LBB123_199:                            // %memcpy.exit96
	mov	r1, 10
	mov	r0, x12
	call	__udivsi3
	mov	x2, rax
	mov	r1, 1
	add	x15, x0
	mov	r0, x2
	call	__bit_shl
	mov	x4, mcasm_static_bff1819c724c09c306780236d311fec2
	add	x4, rax
	mov	r0, [x4]
	mov	r1, 255
add	x4, 1
	call	__bit_and
	mov	r0, [x15]
	mov	x0, rax
	mov	x5, x15
	mov	r1, -256
add	x5, 1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x15], rax
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x5]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mul	x2, 246
	add	x2, x12
	mov	r1, 48
	mov	[x5], rax
	mov	r0, x2
	call	__bit_or
add	x3, 4
	mov	x0, [x3]
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x0
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
add	x7, 5
	jmp	.LBB123_201
.LBB123_200:                            // %memcpy.exit97
	mov	r1, 1
	add	x15, x0
	mov	r0, x12
	call	__bit_shl
	mov	x2, mcasm_static_bff1819c724c09c306780236d311fec2
	add	x2, rax
	mov	r0, [x2]
	mov	r1, 255
add	x2, 1
	call	__bit_and
	mov	r0, [x15]
	mov	x0, rax
	mov	x3, x15
	mov	r1, -256
add	x3, 1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x15], rax
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x3]
	mov	r1, -256
	mov	x0, rax
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
add	x7, 4
.LBB123_201:                            // %memcpy.exit63
	mov	rax, x7
	mov	x15, [rsp+72]
	mov	x14, [rsp+76]
	mov	x13, [rsp+80]
	mov	x12, [rsp+84]
	mov	x11, [rsp+88]
	mov	x10, [rsp+92]
	mov	x9, [rsp+96]
	mov	x8, [rsp+100]
	mov	x7, [rsp+104]
	mov	x6, [rsp+108]
	mov	x5, [rsp+112]
	mov	x4, [rsp+116]
	mov	x3, [rsp+120]
	mov	x2, [rsp+124]
	mov	x1, [rsp+128]
	mov	x0, [rsp+132]
add	rsp, 136
	ret
// -- End function
// -- Begin function d2exp_buffered
d2exp_buffered:                         // @d2exp_buffered
// %bb.0:
sub	rsp, 8
	mov	[rsp+4], x0
	mov	[rsp], x1
	mov	x0, r3
	call	d2exp_buffered_n
	mov	x1, rax
	add	x1, x0
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x1, [rsp]
	mov	x0, [rsp+4]
add	rsp, 8
	ret
// -- End function
// -- Begin function d2exp
d2exp:                                  // @d2exp
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r0
	mov	r0, 2000
	mov	x1, r2
	mov	x2, r1
	call	malloc
	mov	x3, rax
	mov	r0, x0
	mov	r1, x2
	mov	r2, x1
	mov	r3, x3
	call	d2exp_buffered_n
	mov	x0, rax
	add	x0, x3
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	rax, x3
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function strtol
strtol:                                 // @strtol
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
	mov	r1, -2147483648
	mov	x3, r2
	mov	x1, r0
	mov	r0, x3
	call	__bit_xor
	mov	r0, -2147483612
	jg	rax, r0, .LBB126_3
	jmp	.LBB126_1
.LBB126_1:
	mov	r0, 1
	je	x3, r0, .LBB126_3
	jmp	.LBB126_2
.LBB126_2:                              // %.preheader6.preheader
	mov	x6, x1
add	x6, 1
	mov	x2, -2147483643
	mov	x4, 32
	jmp	.LBB126_5
.LBB126_3:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 22
	mov	x5, 0
	jz	x0, .LBB126_40
	jmp	.LBB126_4
.LBB126_4:
	mov	[x0], x1
	jmp	.LBB126_40
.LBB126_5:                              // %.preheader6
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x6
add	r0, -1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x5, rax
	mov	r0, x5
add	r0, -9
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, x2, .LBB126_9
	jmp	.LBB126_6
.LBB126_6:                              // %.preheader6
                                        //   in Loop: Header=BB126_5 Depth=1
	je	x5, x4, .LBB126_9
	jmp	.LBB126_7
.LBB126_7:                              // %.preheader6
	mov	r0, 43
	je	x5, r0, .LBB126_11
	jmp	.LBB126_8
.LBB126_8:                              // %.preheader6
	mov	r0, 45
	je	x5, r0, .LBB126_10
	jmp	.LBB126_13
.LBB126_9:                              // %.preheader6.backedge
                                        //   in Loop: Header=BB126_5 Depth=1
add	x6, 1
	jmp	.LBB126_5
.LBB126_10:                             // %.loopexit8.loopexit
	mov	x2, 1
	jmp	.LBB126_12
.LBB126_11:                             // %.loopexit8.loopexit1
	mov	x2, 0
.LBB126_12:                             // %.loopexit8
	mov	r0, [x6]
	mov	r1, 255
add	x6, 1
	call	__bit_and
	mov	x5, rax
	jmp	.LBB126_14
.LBB126_13:                             // %.loopexit7.loopexit
	mov	x2, 0
.LBB126_14:                             // %.loopexit7
	mov	r1, 255
	mov	r0, x5
	call	__bit_and
	mov	r0, 48
	jne	rax, r0, .LBB126_20
	jmp	.LBB126_15
.LBB126_15:
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	mov	r1, -33
	mov	r0, rax
	call	__bit_and
	mov	r1, 47
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	jnz	rax, .LBB126_18
	jmp	.LBB126_16
.LBB126_16:
	mov	r1, 255
	mov	r0, x4
	call	__bit_and
	mov	r0, 88
	jne	rax, r0, .LBB126_18
	jmp	.LBB126_17
.LBB126_17:
	mov	r0, x6
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x5, rax
	mov	x9, x6
add	x9, 2
	mov	x4, 16
	mov	x1, x6
	jmp	.LBB126_22
.LBB126_18:
	mov	x4, 8
	mov	x5, 48
	mov	x9, x6
	jz	x3, .LBB126_22
	jmp	.LBB126_19
.LBB126_19:
	mov	x9, x6
	mov	x4, x3
	jmp	.LBB126_22
.LBB126_20:
	mov	x4, 10
	mov	x9, x6
	jz	x3, .LBB126_22
	jmp	.LBB126_21
.LBB126_21:
	mov	x9, x6
	mov	x4, x3
.LBB126_22:
	mov	x3, x2
add	x3, 2147483647
	mov	r0, x3
	mov	r1, x4
	call	__udivsi3
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	x5, rax
	mov	r0, x5
add	r0, -1
	mov	r1, 32
	call	__bit_or
	mov	x7, rax
	mov	r1, -2147483648
add	x7, -38
	mov	r0, x5
	call	__bit_xor
	mov	r0, -2147483591
	jg	rax, r0, .LBB126_24
	jmp	.LBB126_23
.LBB126_23:
	mov	x7, x5
.LBB126_24:
add	x7, -48
	mov	r1, -2147483648
	mov	x5, 0
	mov	r0, x4
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x7
	call	__bit_xor
	jge	rax, x8, .LBB126_34
	jmp	.LBB126_25
.LBB126_25:                             // %.preheader.preheader
	mov	r0, x6
	mul	r0, x4
	mov	x8, x3
	sub	x8, r0
add	x9, -1
	mov	x10, -2147483591
	mov	x1, x9
.LBB126_26:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x5
	call	__bit_xor
	jg	rax, x9, .LBB126_29
	jmp	.LBB126_27
.LBB126_27:                             //   in Loop: Header=BB126_26 Depth=1
	mov	r1, -2147483648
	mov	r0, x8
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x7
	call	__bit_xor
	jle	rax, x9, .LBB126_30
	jmp	.LBB126_28
.LBB126_28:                             //   in Loop: Header=BB126_26 Depth=1
	jne	x5, x6, .LBB126_30
	jmp	.LBB126_29
.LBB126_29:                             //   in Loop: Header=BB126_26 Depth=1
	mov	r1, 2
	mov	r0, x2
	call	__bit_or
	mov	x2, rax
	jmp	.LBB126_31
.LBB126_30:                             //   in Loop: Header=BB126_26 Depth=1
	mul	x5, x4
	add	x5, x7
.LBB126_31:                             //   in Loop: Header=BB126_26 Depth=1
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x9, rax
	mov	r0, x9
add	r0, -1
	mov	r1, 32
	call	__bit_or
	mov	x7, rax
	mov	r1, -2147483648
add	x7, -38
	mov	r0, x9
	call	__bit_xor
	jg	rax, x10, .LBB126_33
	jmp	.LBB126_32
.LBB126_32:                             //   in Loop: Header=BB126_26 Depth=1
	mov	x7, x9
.LBB126_33:                             //   in Loop: Header=BB126_26 Depth=1
	mov	r1, -2147483648
add	x7, -48
	mov	r0, x4
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x7
	call	__bit_xor
	jl	rax, x9, .LBB126_26
	jmp	.LBB126_34
.LBB126_34:                             // %.loopexit
	jz	x0, .LBB126_36
	jmp	.LBB126_35
.LBB126_35:
	mov	[x0], x1
.LBB126_36:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 1
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB126_38
	jmp	.LBB126_37
.LBB126_37:
	mov	r0, 0
	sub	r0, x5
	mov	x5, r0
.LBB126_38:
	mov	r1, 2
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB126_40
	jmp	.LBB126_39
.LBB126_39:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 34
	mov	x5, x3
.LBB126_40:
	mov	rax, x5
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
// -- Begin function strtoll
strtoll:                                // @strtoll
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
	mov	r1, -2147483648
	mov	x4, r2
	mov	x1, r0
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483612
	jg	rax, r0, .LBB127_3
	jmp	.LBB127_1
.LBB127_1:
	mov	r0, 1
	je	x4, r0, .LBB127_3
	jmp	.LBB127_2
.LBB127_2:                              // %.preheader.preheader
	mov	x3, -2147483643
	mov	x5, 32
	mov	x9, x1
	jmp	.LBB127_5
.LBB127_3:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 22
	mov	x7, 0
	mov	x6, 0
	jz	x0, .LBB127_46
	jmp	.LBB127_4
.LBB127_4:
	mov	[x0], x1
	jmp	.LBB127_46
.LBB127_5:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
	mov	r0, x2
add	r0, -9
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, x3, .LBB127_9
	jmp	.LBB127_6
.LBB127_6:                              // %.preheader
                                        //   in Loop: Header=BB127_5 Depth=1
	je	x2, x5, .LBB127_9
	jmp	.LBB127_7
.LBB127_7:                              // %.preheader
	mov	r0, 43
	je	x2, r0, .LBB127_10
	jmp	.LBB127_8
.LBB127_8:                              // %.preheader
	mov	r0, 45
	je	x2, r0, .LBB127_10
	jmp	.LBB127_11
.LBB127_9:                              // %isspace.exit
                                        //   in Loop: Header=BB127_5 Depth=1
add	x9, 1
	jmp	.LBB127_5
.LBB127_10:
	mov	r1, 255
add	x9, 1
	mov	r0, x2
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
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
	mov	x2, rax
	jmp	.LBB127_12
.LBB127_11:                             // %.loopexit51.loopexit
	mov	x2, 1
.LBB127_12:                             // %.loopexit51
	mov	r1, 16
	mov	x5, 16
	mov	r0, x4
	call	__bit_or
	mov	x3, x4
	je	rax, x5, .LBB127_13
	jmp	.LBB127_18
.LBB127_13:
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	mov	r0, 48
	mov	x3, 10
	jne	rax, r0, .LBB127_16
	jmp	.LBB127_14
.LBB127_14:
	mov	r0, x9
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 32
	mov	x3, 8
	mov	r0, rax
	call	__bit_or
	mov	r0, 120
	je	rax, r0, .LBB127_15
	jmp	.LBB127_16
.LBB127_15:
add	x9, 2
	mov	x3, 16
	jmp	.LBB127_18
.LBB127_16:
	jz	x4, .LBB127_18
	jmp	.LBB127_17
.LBB127_17:
	mov	x3, x4
.LBB127_18:
	mov	x4, 2147483647
	mov	x5, -1
	jnz	x2, .LBB127_20
	jmp	.LBB127_19
.LBB127_19:
	mov	x4, -2147483648
	mov	x5, 0
.LBB127_20:
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	mov	x6, rax
	mov	x8, x6
add	x8, -48
	mov	r1, -2147483648
	mov	r0, x8
	call	__bit_xor
	mov	r0, -2147483638
	jl	rax, r0, .LBB127_25
	jmp	.LBB127_21
.LBB127_21:
	mov	r0, x6
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	x7, -2147483622
	jl	rax, x7, .LBB127_24
	jmp	.LBB127_22
.LBB127_22:
	mov	r0, x6
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	x6, -87
	mov	r0, rax
	call	__bit_xor
	mov	x8, x6
	jl	rax, x7, .LBB127_25
	jmp	.LBB127_23
.LBB127_23:
	mov	x8, 36
	jmp	.LBB127_25
.LBB127_24:
add	x6, -55
	mov	x8, x6
.LBB127_25:
	mov	x7, 0
	mov	x6, 0
	jge	x8, x3, .LBB127_42
	jmp	.LBB127_26
.LBB127_26:
add	x9, 1
	mov	x13, -2147483638
	mov	x14, -2147483623
	mov	x15, -2147483622
	mov	x1, x9
	mov	x7, x8
.LBB127_27:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x9, rax
	mov	x8, x9
add	x8, -48
	mov	r1, -2147483648
	mov	r0, x8
	call	__bit_xor
	jl	rax, x13, .LBB127_32
	jmp	.LBB127_28
.LBB127_28:                             //   in Loop: Header=BB127_27 Depth=1
	mov	r0, x9
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, x14, .LBB127_30
	jmp	.LBB127_29
.LBB127_29:                             //   in Loop: Header=BB127_27 Depth=1
add	x9, -55
	mov	x8, x9
	jmp	.LBB127_32
.LBB127_30:                             //   in Loop: Header=BB127_27 Depth=1
	mov	r0, x9
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	x9, -87
	mov	r0, rax
	call	__bit_xor
	mov	x8, x9
	jl	rax, x15, .LBB127_32
	jmp	.LBB127_31
.LBB127_31:                             //   in Loop: Header=BB127_27 Depth=1
	mov	x8, 36
.LBB127_32:                             //   in Loop: Header=BB127_27 Depth=1
	jge	x8, x3, .LBB127_42
	jmp	.LBB127_33
.LBB127_33:                             //   in Loop: Header=BB127_27 Depth=1
	mov	r3, 0
	mov	r0, x5
	mov	r1, x4
	mov	r2, x8
	call	__subdi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x3
	call	__udivdi3
	mov	x11, rax
	mov	x9, t0
	mov	r0, x9
	mov	r1, x6
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x9
	sub	r1, x6
	mov	r0, rax
	call	__bit_and
	mov	x10, rax
	mov	r0, x9
	call	__bit_not
	mov	r0, rax
	mov	r1, x6
	call	__bit_and
	mov	r0, rax
	mov	r1, x10
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
	mov	r0, x11
	mov	r1, x7
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x11
	sub	r1, x7
	mov	r0, rax
	call	__bit_and
	mov	x12, rax
	mov	r0, x11
	call	__bit_not
	mov	r0, rax
	mov	r1, x7
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
	mov	x11, rax
	sub	x11, x10
	mov	r0, x6
	mov	r1, x9
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
add	rax, 1
	mov	r0, rax
	mov	r1, x11
	call	__bit_and
	add	rax, x10
	jnz	rax, .LBB127_41
	jmp	.LBB127_34
.LBB127_34:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 34
	mov	x9, -2147483638
	mov	x10, -2147483623
	mov	x11, -2147483622
.LBB127_35:                             // =>This Inner Loop Header: Depth=1
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x6, rax
	mov	x8, x6
add	x8, -48
	mov	r1, -2147483648
	mov	r0, x8
	call	__bit_xor
	jl	rax, x9, .LBB127_40
	jmp	.LBB127_36
.LBB127_36:                             //   in Loop: Header=BB127_35 Depth=1
	mov	r0, x6
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, x10, .LBB127_38
	jmp	.LBB127_37
.LBB127_37:                             //   in Loop: Header=BB127_35 Depth=1
add	x6, -55
	mov	x8, x6
	jmp	.LBB127_40
.LBB127_38:                             //   in Loop: Header=BB127_35 Depth=1
	mov	r0, x6
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	x6, -87
	mov	r0, rax
	call	__bit_xor
	mov	x8, x6
	jl	rax, x11, .LBB127_40
	jmp	.LBB127_39
.LBB127_39:                             //   in Loop: Header=BB127_35 Depth=1
	mov	x8, 36
.LBB127_40:                             //   in Loop: Header=BB127_35 Depth=1
	mov	x7, x5
	mov	x6, x4
	jl	x8, x3, .LBB127_35
	jmp	.LBB127_42
.LBB127_41:                             //   in Loop: Header=BB127_27 Depth=1
	mov	r3, 0
	mov	r0, x7
	mov	r1, x6
	mov	r2, x3
	call	__muldi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x8
	call	__adddi3
	mov	x7, rax
	mov	x6, t0
add	x1, 1
	jmp	.LBB127_27
.LBB127_42:                             // %.loopexit
	jz	x0, .LBB127_44
	jmp	.LBB127_43
.LBB127_43:
	mov	[x0], x1
.LBB127_44:
	mov	r0, 0
	mov	r1, 0
	mov	r2, x7
	mov	r3, x6
	call	__subdi3
	jnz	x2, .LBB127_46
	jmp	.LBB127_45
.LBB127_45:
	mov	x7, rax
	mov	x6, t0
.LBB127_46:
	mov	rax, x7
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
// -- Begin function strtoul
strtoul:                                // @strtoul
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
	mov	r1, -2147483648
	mov	x4, r2
	mov	x1, r0
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483612
	jg	rax, r0, .LBB128_3
	jmp	.LBB128_1
.LBB128_1:
	mov	r0, 1
	je	x4, r0, .LBB128_3
	jmp	.LBB128_2
.LBB128_2:                              // %.preheader6.preheader
	mov	x5, x1
add	x5, 1
	mov	x2, -2147483643
	mov	x3, 32
	jmp	.LBB128_5
.LBB128_3:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 22
	mov	x4, 0
	jz	x0, .LBB128_40
	jmp	.LBB128_4
.LBB128_4:
	mov	[x0], x1
	jmp	.LBB128_40
.LBB128_5:                              // %.preheader6
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x5
add	r0, -1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x7, rax
	mov	r0, x7
add	r0, -9
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, x2, .LBB128_9
	jmp	.LBB128_6
.LBB128_6:                              // %.preheader6
                                        //   in Loop: Header=BB128_5 Depth=1
	je	x7, x3, .LBB128_9
	jmp	.LBB128_7
.LBB128_7:                              // %.preheader6
	mov	r0, 43
	je	x7, r0, .LBB128_11
	jmp	.LBB128_8
.LBB128_8:                              // %.preheader6
	mov	r0, 45
	je	x7, r0, .LBB128_10
	jmp	.LBB128_13
.LBB128_9:                              // %.preheader6.backedge
                                        //   in Loop: Header=BB128_5 Depth=1
add	x5, 1
	jmp	.LBB128_5
.LBB128_10:                             // %.loopexit8.loopexit
	mov	x2, 1
	jmp	.LBB128_12
.LBB128_11:                             // %.loopexit8.loopexit1
	mov	x2, 0
.LBB128_12:                             // %.loopexit8
	mov	r0, [x5]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x7, rax
	jmp	.LBB128_14
.LBB128_13:                             // %.loopexit7.loopexit
	mov	x2, 0
.LBB128_14:                             // %.loopexit7
	mov	r1, 255
	mov	r0, x7
	call	__bit_and
	mov	r0, 48
	jne	rax, r0, .LBB128_20
	jmp	.LBB128_15
.LBB128_15:
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, -33
	mov	r0, rax
	call	__bit_and
	mov	r1, 47
	mov	x3, rax
	mov	r0, x4
	call	__bit_and
	jnz	rax, .LBB128_18
	jmp	.LBB128_16
.LBB128_16:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r0, 88
	jne	rax, r0, .LBB128_18
	jmp	.LBB128_17
.LBB128_17:
	mov	r0, x5
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x7, rax
	mov	x10, x5
add	x10, 2
	mov	x3, 16
	mov	x1, x5
	jmp	.LBB128_22
.LBB128_18:
	mov	x7, 48
	mov	x3, 8
	mov	x10, x5
	jz	x4, .LBB128_22
	jmp	.LBB128_19
.LBB128_19:
	mov	x3, x4
	mov	x10, x5
	jmp	.LBB128_22
.LBB128_20:
	mov	x3, 10
	mov	x10, x5
	jz	x4, .LBB128_22
	jmp	.LBB128_21
.LBB128_21:
	mov	x3, x4
	mov	x10, x5
.LBB128_22:
	mov	r0, -1
	mov	r1, x3
	call	__udivsi3
	mov	x5, rax
	mov	r0, x5
	mul	r0, x3
	call	__bit_not
	mov	r1, 255
	mov	x6, rax
	mov	r0, x7
	call	__bit_and
	mov	x4, rax
	mov	r0, x4
add	r0, -1
	mov	r1, 32
	call	__bit_or
	mov	x7, rax
	mov	r1, -2147483648
add	x7, -38
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483591
	jg	rax, r0, .LBB128_24
	jmp	.LBB128_23
.LBB128_23:
	mov	x7, x4
.LBB128_24:
add	x7, -48
	mov	r1, -2147483648
	mov	x4, 0
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x7
	call	__bit_xor
	jge	rax, x8, .LBB128_34
	jmp	.LBB128_25
.LBB128_25:                             // %.preheader.preheader
add	x10, -1
	mov	x9, -2147483591
	mov	x1, x10
.LBB128_26:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x4
	call	__bit_xor
	jg	rax, x8, .LBB128_29
	jmp	.LBB128_27
.LBB128_27:                             //   in Loop: Header=BB128_26 Depth=1
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x7
	call	__bit_xor
	jle	rax, x8, .LBB128_30
	jmp	.LBB128_28
.LBB128_28:                             //   in Loop: Header=BB128_26 Depth=1
	jne	x4, x5, .LBB128_30
	jmp	.LBB128_29
.LBB128_29:                             //   in Loop: Header=BB128_26 Depth=1
	mov	r1, 2
	mov	r0, x2
	call	__bit_or
	mov	x2, rax
	jmp	.LBB128_31
.LBB128_30:                             //   in Loop: Header=BB128_26 Depth=1
	mul	x4, x3
	add	x4, x7
.LBB128_31:                             //   in Loop: Header=BB128_26 Depth=1
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x8, rax
	mov	r0, x8
add	r0, -1
	mov	r1, 32
	call	__bit_or
	mov	x7, rax
	mov	r1, -2147483648
add	x7, -38
	mov	r0, x8
	call	__bit_xor
	jg	rax, x9, .LBB128_33
	jmp	.LBB128_32
.LBB128_32:                             //   in Loop: Header=BB128_26 Depth=1
	mov	x7, x8
.LBB128_33:                             //   in Loop: Header=BB128_26 Depth=1
	mov	r1, -2147483648
add	x7, -48
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x7
	call	__bit_xor
	jl	rax, x8, .LBB128_26
	jmp	.LBB128_34
.LBB128_34:                             // %.loopexit
	jz	x0, .LBB128_36
	jmp	.LBB128_35
.LBB128_35:
	mov	[x0], x1
.LBB128_36:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 1
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB128_38
	jmp	.LBB128_37
.LBB128_37:
	mov	r0, 0
	sub	r0, x4
	mov	x4, r0
.LBB128_38:
	mov	r1, 2
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB128_40
	jmp	.LBB128_39
.LBB128_39:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 34
	mov	x4, -1
.LBB128_40:
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
// -- Begin function strtoull
strtoull:                               // @strtoull
// %bb.0:
sub	rsp, 56
	mov	[rsp+52], x0
	mov	[rsp+48], x1
	mov	[rsp+44], x2
	mov	[rsp+40], x3
	mov	[rsp+36], x4
	mov	[rsp+32], x5
	mov	[rsp+28], x6
	mov	[rsp+24], x7
	mov	[rsp+20], x8
	mov	[rsp+16], x9
	mov	[rsp+12], x10
	mov	[rsp+8], x11
	mov	[rsp+4], x12
	mov	[rsp], x13
	mov	x0, r1
	mov	r1, -2147483648
	mov	x4, r2
	mov	x1, r0
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483612
	jg	rax, r0, .LBB129_3
	jmp	.LBB129_1
.LBB129_1:
	mov	r0, 1
	je	x4, r0, .LBB129_3
	jmp	.LBB129_2
.LBB129_2:                              // %.preheader.preheader
	mov	x3, -2147483643
	mov	x5, 32
	mov	x7, x1
	jmp	.LBB129_5
.LBB129_3:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 22
	mov	x4, 0
	mov	x5, 0
	jz	x0, .LBB129_44
	jmp	.LBB129_4
.LBB129_4:
	mov	[x0], x1
	jmp	.LBB129_44
.LBB129_5:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
	mov	r0, x2
add	r0, -9
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, x3, .LBB129_9
	jmp	.LBB129_6
.LBB129_6:                              // %.preheader
                                        //   in Loop: Header=BB129_5 Depth=1
	je	x2, x5, .LBB129_9
	jmp	.LBB129_7
.LBB129_7:                              // %.preheader
	mov	r0, 43
	je	x2, r0, .LBB129_10
	jmp	.LBB129_8
.LBB129_8:                              // %.preheader
	mov	r0, 45
	je	x2, r0, .LBB129_10
	jmp	.LBB129_11
.LBB129_9:                              // %isspace.exit
                                        //   in Loop: Header=BB129_5 Depth=1
add	x7, 1
	jmp	.LBB129_5
.LBB129_10:
	mov	r1, 255
add	x7, 1
	mov	r0, x2
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
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
	mov	x2, rax
	jmp	.LBB129_12
.LBB129_11:                             // %.loopexit51.loopexit
	mov	x2, 1
.LBB129_12:                             // %.loopexit51
	mov	r1, 16
	mov	x5, 16
	mov	r0, x4
	call	__bit_or
	mov	x3, x4
	je	rax, x5, .LBB129_13
	jmp	.LBB129_18
.LBB129_13:
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	r0, 48
	mov	x3, 10
	jne	rax, r0, .LBB129_16
	jmp	.LBB129_14
.LBB129_14:
	mov	r0, x7
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 32
	mov	x3, 8
	mov	r0, rax
	call	__bit_or
	mov	r0, 120
	je	rax, r0, .LBB129_15
	jmp	.LBB129_16
.LBB129_15:
add	x7, 2
	mov	x3, 16
	jmp	.LBB129_18
.LBB129_16:
	jz	x4, .LBB129_18
	jmp	.LBB129_17
.LBB129_17:
	mov	x3, x4
.LBB129_18:
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	mov	x6, x4
add	x6, -48
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	mov	r0, -2147483638
	jl	rax, r0, .LBB129_23
	jmp	.LBB129_19
.LBB129_19:
	mov	r0, x4
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	x5, -2147483622
	jl	rax, x5, .LBB129_22
	jmp	.LBB129_20
.LBB129_20:
	mov	r0, x4
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	x4, -87
	mov	r0, rax
	call	__bit_xor
	mov	x6, x4
	jl	rax, x5, .LBB129_23
	jmp	.LBB129_21
.LBB129_21:
	mov	x6, 36
	jmp	.LBB129_23
.LBB129_22:
add	x4, -55
	mov	x6, x4
.LBB129_23:
	mov	x4, 0
	mov	x5, 0
	jge	x6, x3, .LBB129_40
	jmp	.LBB129_24
.LBB129_24:
add	x7, 1
	mov	x11, -2147483638
	mov	x12, -2147483623
	mov	x13, -2147483622
	mov	x1, x7
	mov	x4, x6
.LBB129_25:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x7, rax
	mov	x6, x7
add	x6, -48
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	jl	rax, x11, .LBB129_30
	jmp	.LBB129_26
.LBB129_26:                             //   in Loop: Header=BB129_25 Depth=1
	mov	r0, x7
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, x12, .LBB129_28
	jmp	.LBB129_27
.LBB129_27:                             //   in Loop: Header=BB129_25 Depth=1
add	x7, -55
	mov	x6, x7
	jmp	.LBB129_30
.LBB129_28:                             //   in Loop: Header=BB129_25 Depth=1
	mov	r0, x7
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	x7, -87
	mov	r0, rax
	call	__bit_xor
	mov	x6, x7
	jl	rax, x13, .LBB129_30
	jmp	.LBB129_29
.LBB129_29:                             //   in Loop: Header=BB129_25 Depth=1
	mov	x6, 36
.LBB129_30:                             //   in Loop: Header=BB129_25 Depth=1
	jge	x6, x3, .LBB129_40
	jmp	.LBB129_31
.LBB129_31:                             //   in Loop: Header=BB129_25 Depth=1
	mov	r0, x6
	call	__bit_not
	mov	r1, -1
	mov	r3, 0
	mov	r0, rax
	mov	r2, x3
	call	__udivdi3
	mov	x9, rax
	mov	x7, t0
	mov	r0, x7
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x7
	sub	r1, x5
	mov	r0, rax
	call	__bit_and
	mov	x8, rax
	mov	r0, x7
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	r0, rax
	mov	r1, x8
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
	mov	x8, rax
	mov	r0, x9
	mov	r1, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x9
	sub	r1, x4
	mov	r0, rax
	call	__bit_and
	mov	x10, rax
	mov	r0, x9
	call	__bit_not
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	r0, rax
	mov	r1, x10
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
	mov	x9, rax
	sub	x9, x8
	mov	r0, x5
	mov	r1, x7
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
add	rax, 1
	mov	r0, rax
	mov	r1, x9
	call	__bit_and
	add	rax, x8
	jnz	rax, .LBB129_39
	jmp	.LBB129_32
.LBB129_32:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 34
	mov	x7, -2147483638
	mov	x8, -2147483623
	mov	x9, -2147483622
	mov	x5, -1
.LBB129_33:                             // =>This Inner Loop Header: Depth=1
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	mov	x6, x4
add	x6, -48
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	jl	rax, x7, .LBB129_38
	jmp	.LBB129_34
.LBB129_34:                             //   in Loop: Header=BB129_33 Depth=1
	mov	r0, x4
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, x8, .LBB129_36
	jmp	.LBB129_35
.LBB129_35:                             //   in Loop: Header=BB129_33 Depth=1
add	x4, -55
	mov	x6, x4
	jmp	.LBB129_38
.LBB129_36:                             //   in Loop: Header=BB129_33 Depth=1
	mov	r0, x4
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	x4, -87
	mov	r0, rax
	call	__bit_xor
	mov	x6, x4
	jl	rax, x9, .LBB129_38
	jmp	.LBB129_37
.LBB129_37:                             //   in Loop: Header=BB129_33 Depth=1
	mov	x6, 36
.LBB129_38:                             //   in Loop: Header=BB129_33 Depth=1
	mov	x4, -1
	jl	x6, x3, .LBB129_33
	jmp	.LBB129_40
.LBB129_39:                             //   in Loop: Header=BB129_25 Depth=1
	mov	r3, 0
	mov	r0, x4
	mov	r1, x5
	mov	r2, x3
	call	__muldi3
	mov	r3, 0
	mov	r1, t0
	mov	r0, rax
	mov	r2, x6
	call	__adddi3
	mov	x4, rax
	mov	x5, t0
add	x1, 1
	jmp	.LBB129_25
.LBB129_40:                             // %.loopexit
	jz	x0, .LBB129_42
	jmp	.LBB129_41
.LBB129_41:
	mov	[x0], x1
.LBB129_42:
	mov	r0, 0
	mov	r1, 0
	mov	r2, x4
	mov	r3, x5
	call	__subdi3
	jnz	x2, .LBB129_44
	jmp	.LBB129_43
.LBB129_43:
	mov	x4, rax
	mov	x5, t0
.LBB129_44:
	mov	rax, x4
	mov	t0, x5
	mov	x13, [rsp]
	mov	x12, [rsp+4]
	mov	x11, [rsp+8]
	mov	x10, [rsp+12]
	mov	x9, [rsp+16]
	mov	x8, [rsp+20]
	mov	x7, [rsp+24]
	mov	x6, [rsp+28]
	mov	x5, [rsp+32]
	mov	x4, [rsp+36]
	mov	x3, [rsp+40]
	mov	x2, [rsp+44]
	mov	x1, [rsp+48]
	mov	x0, [rsp+52]
add	rsp, 56
	ret
// -- End function
// -- Begin function bcmp
bcmp:                                   // @bcmp
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r1
	mov	r1, -2147483648
	mov	x1, r2
	mov	x2, r0
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB130_5
	jmp	.LBB130_1
.LBB130_1:
	mov	r0, x0
	mov	r1, x2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB130_6
	jmp	.LBB130_2
.LBB130_2:                              // %.preheader.i.preheader
	mov	x3, -2147483645
.LBB130_3:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
	mov	r1, [x0]
	jne	r0, r1, .LBB130_6
	jmp	.LBB130_4
.LBB130_4:                              //   in Loop: Header=BB130_3 Depth=1
add	x2, 4
add	x1, -4
	mov	r1, -2147483648
add	x0, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x3, .LBB130_3
	jmp	.LBB130_5
.LBB130_5:                              // %.loopexit8.i
	mov	rax, 0
	jz	x1, .LBB130_10
	jmp	.LBB130_6
.LBB130_6:                              // %.loopexit7.i.preheader
.LBB130_7:                              // %.loopexit7.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x0]
	mov	r1, 255
	mov	x3, rax
	call	__bit_and
	je	x3, rax, .LBB130_9
	jmp	.LBB130_8
.LBB130_8:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x3
	call	__bit_and
	sub	rax, x0
	jmp	.LBB130_10
.LBB130_9:                              //   in Loop: Header=BB130_7 Depth=1
add	x1, -1
add	x2, 1
add	x0, 1
	mov	rax, 0
	jnz	x1, .LBB130_7
	jmp	.LBB130_10
.LBB130_10:                             // %memcmp.exit
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function bcopy
bcopy:                                  // @bcopy
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x1, r1
	mov	r1, -2147483648
	mov	x0, r2
	mov	x2, r0
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x3, .LBB131_10
	jmp	.LBB131_1
.LBB131_1:
	mov	x3, x2
	add	x3, x0
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x1
	call	__bit_xor
	jge	rax, x4, .LBB131_10
	jmp	.LBB131_2
.LBB131_2:
	mov	x4, x1
	mov	r1, -2147483648
	add	x4, x0
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB131_7
	jmp	.LBB131_3
.LBB131_3:
	mov	r0, x3
	mov	r1, x4
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB131_8
	jmp	.LBB131_4
.LBB131_4:                              // %.preheader.i.preheader
	mov	x3, -2147483645
.LBB131_5:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x2
	add	r0, x0
add	r0, -4
	mov	r0, [r0]
	mov	r2, x1
	add	r2, x0
add	r2, -4
add	x0, -4
	mov	r1, -2147483648
	mov	[r2], r0
	mov	r0, x0
	call	__bit_xor
	jg	rax, x3, .LBB131_5
	jmp	.LBB131_6
.LBB131_6:                              // %.loopexit9.i.loopexit
	add	x2, x0
	add	x1, x0
	mov	x4, x1
	mov	x3, x2
.LBB131_7:                              // %.loopexit9.i
	jz	x0, .LBB131_21
	jmp	.LBB131_8
.LBB131_8:                              // %.preheader
add	x3, -1
add	x4, -1
.LBB131_9:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
	mov	r1, 255
add	x0, -1
	call	__bit_and
	mov	r0, [x4]
	mov	r1, -256
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
add	x3, -1
add	x4, -1
	jz	x0, .LBB131_21
	jmp	.LBB131_9
.LBB131_10:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB131_18
	jmp	.LBB131_11
.LBB131_11:
	mov	r0, x1
	mov	r1, x2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB131_19
	jmp	.LBB131_12
.LBB131_12:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB131_14
	jmp	.LBB131_13
.LBB131_13:                             // %.preheader12.i.preheader
	mov	x3, -2147483633
	jmp	.LBB131_16
.LBB131_14:                             // %.preheader54
	mov	x3, -2147483645
	jmp	.LBB131_17
.LBB131_15:
	mov	r0, 3
	jg	x0, r0, .LBB131_14
	jmp	.LBB131_18
.LBB131_16:                             // %.preheader12.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
	mov	r1, x2
add	r1, 4
	mov	[x1], r0
	mov	r0, [r1]
	mov	r1, x1
add	r1, 4
	mov	r2, x2
add	r2, 8
	mov	r3, x1
	mov	[r1], r0
	mov	r0, [r2]
add	r3, 8
	mov	r1, x2
add	r1, 12
	mov	r2, x1
add	r2, 12
	mov	[r3], r0
add	x2, 16
	mov	r0, [r1]
add	x1, 16
add	x0, -16
	mov	r1, -2147483648
	mov	[r2], r0
	mov	r0, x0
	call	__bit_xor
	jg	rax, x3, .LBB131_16
	jmp	.LBB131_15
.LBB131_17:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
add	x2, 4
	mov	[x1], r0
add	x0, -4
	mov	r1, -2147483648
add	x1, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x3, .LBB131_17
	jmp	.LBB131_18
.LBB131_18:                             // %.loopexit11.i
	jz	x0, .LBB131_21
	jmp	.LBB131_19
.LBB131_19:                             // %.preheader49
	mov	x5, x1
.LBB131_20:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
add	x0, -1
	mov	r1, 255
add	x2, 1
	call	__bit_and
	mov	r0, [x1]
	mov	x3, rax
	mov	r1, -256
add	x5, 1
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
	mov	x1, x5
	jnz	x0, .LBB131_20
	jmp	.LBB131_21
.LBB131_21:                             // %memmove.exit
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function bzero
bzero:                                  // @bzero
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r1
	mov	r1, 3
	mov	x1, r0
	call	__bit_and
	jz	rax, .LBB132_4
	jmp	.LBB132_1
.LBB132_1:                              // %.preheader1.preheader
	mov	x2, x1
add	x2, 1
	mov	x3, x1
.LBB132_2:                              // %.preheader1
                                        // =>This Inner Loop Header: Depth=1
	jz	x0, .LBB132_14
	jmp	.LBB132_3
.LBB132_3:                              //   in Loop: Header=BB132_2 Depth=1
	mov	r0, [x3]
add	x0, -1
	mov	x1, x3
	mov	r1, -256
add	x1, 1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	r1, 3
	mov	[x3], rax
	mov	r0, x2
	call	__bit_and
add	x2, 1
	mov	x3, x1
	jnz	rax, .LBB132_2
	jmp	.LBB132_4
.LBB132_4:                              // %.loopexit7.i
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB132_11
	jmp	.LBB132_5
.LBB132_5:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB132_7
	jmp	.LBB132_6
.LBB132_6:                              // %.preheader.i.preheader
	mov	x2, -2147483633
	jmp	.LBB132_9
.LBB132_7:                              // %.preheader30
	mov	x2, -2147483645
	jmp	.LBB132_10
.LBB132_8:
	mov	r0, 3
	jg	x0, r0, .LBB132_7
	jmp	.LBB132_11
.LBB132_9:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x1
add	r0, 4
	mov	[x1], 0
	mov	r1, x1
add	r1, 8
	mov	[r0], 0
	mov	r0, x1
add	r0, 12
	mov	[r1], 0
add	x1, 16
add	x0, -16
	mov	r1, -2147483648
	mov	[r0], 0
	mov	r0, x0
	call	__bit_xor
	jg	rax, x2, .LBB132_9
	jmp	.LBB132_8
.LBB132_10:                             // =>This Inner Loop Header: Depth=1
	mov	[x1], 0
add	x0, -4
	mov	r1, -2147483648
add	x1, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x2, .LBB132_10
	jmp	.LBB132_11
.LBB132_11:                             // %.loopexit5.i
	jz	x0, .LBB132_14
	jmp	.LBB132_12
.LBB132_12:                             // %.preheader.preheader
	mov	x2, x1
.LBB132_13:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
add	x0, -1
	mov	r1, -256
add	x2, 1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x1, x2
	jnz	x0, .LBB132_13
	jmp	.LBB132_14
.LBB132_14:                             // %memset.exit
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function index
index:                                  // @index
// %bb.0:
sub	rsp, 28
	mov	[rsp+24], x0
	mov	[rsp+20], x1
	mov	[rsp+16], x2
	mov	[rsp+12], x3
	mov	[rsp+8], x4
	mov	[rsp+4], x5
	mov	[rsp], x6
	mov	x1, r1
	mov	r1, 255
	mov	x0, r0
	mov	r0, x1
	call	__bit_and
	mov	r1, 3
	mov	x2, rax
	mov	r0, x0
	call	__bit_and
	jz	x2, .LBB133_3
	jmp	.LBB133_1
.LBB133_1:
	jz	rax, .LBB133_11
	jmp	.LBB133_2
.LBB133_2:
	mov	x4, x0
add	x4, 1
	jmp	.LBB133_13
.LBB133_3:
	mov	x3, x0
	jz	rax, .LBB133_7
	jmp	.LBB133_4
.LBB133_4:                              // %.preheader2.i.preheader
	mov	x1, x0
add	x1, 1
	mov	x3, x0
.LBB133_5:                              // %.preheader2.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB133_22
	jmp	.LBB133_6
.LBB133_6:                              //   in Loop: Header=BB133_5 Depth=1
	mov	r1, 3
add	x3, 1
	mov	r0, x1
	call	__bit_and
add	x1, 1
	jnz	rax, .LBB133_5
	jmp	.LBB133_7
.LBB133_7:                              // %.loopexit4.i.preheader
add	x3, -5
	mov	x0, -2139062144
.LBB133_8:                              // %.loopexit4.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
add	r0, 5
	mov	r1, [r0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x3, 4
	je	rax, x0, .LBB133_8
	jmp	.LBB133_9
.LBB133_9:                              // %.preheader.i.preheader
.LBB133_10:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
add	x3, 1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB133_22
	jmp	.LBB133_10
.LBB133_11:                             // %.loopexit9.i
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	x4, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB133_18
	jmp	.LBB133_12
.LBB133_12:                             // %.preheader5.i.preheader
	mul	x2, 16843009
	jmp	.LBB133_16
.LBB133_13:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x5, rax
	mov	x3, 0
	jz	x5, .LBB133_22
	jmp	.LBB133_14
.LBB133_14:                             //   in Loop: Header=BB133_13 Depth=1
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	x3, x0
	je	rax, x6, .LBB133_22
	jmp	.LBB133_15
.LBB133_15:                             //   in Loop: Header=BB133_13 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x4
	call	__bit_and
add	x4, 1
	jz	rax, .LBB133_11
	jmp	.LBB133_13
.LBB133_16:                             // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
	mov	r1, x2
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB133_18
	jmp	.LBB133_17
.LBB133_17:                             //   in Loop: Header=BB133_16 Depth=1
add	x0, 4
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x4, .LBB133_16
	jmp	.LBB133_18
.LBB133_18:                             // %.loopexit6.i
add	x0, -1
.LBB133_19:                             // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
	jz	x2, .LBB133_21
	jmp	.LBB133_20
.LBB133_20:                             //   in Loop: Header=BB133_19 Depth=1
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	jne	rax, x3, .LBB133_19
	jmp	.LBB133_21
.LBB133_21:
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_xor
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
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x3, rax
.LBB133_22:                             // %strchr.exit
	mov	rax, x3
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
// -- Begin function memccpy
memccpy:                                // @memccpy
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
	mov	x0, r1
	mov	r1, -2147483648
	mov	x1, r3
	mov	x2, r2
	mov	x3, r0
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB134_5
	jmp	.LBB134_1
.LBB134_1:
	mov	r0, x0
	mov	r1, x3
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB134_5
	jmp	.LBB134_2
.LBB134_2:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	x4, rax
	mul	x4, 16843009
	mov	x6, -2139062144
	mov	x7, -2147483645
.LBB134_3:                              // =>This Inner Loop Header: Depth=1
	mov	x5, [x0]
	mov	r0, x5
	mov	r1, x4
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x6, .LBB134_5
	jmp	.LBB134_4
.LBB134_4:                              //   in Loop: Header=BB134_3 Depth=1
add	x0, 4
	mov	[x3], x5
add	x1, -4
	mov	r1, -2147483648
add	x3, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x7, .LBB134_3
	jmp	.LBB134_5
.LBB134_5:                              // %.loopexit
.LBB134_6:                              // =>This Inner Loop Header: Depth=1
	mov	x4, 0
	jz	x1, .LBB134_8
	jmp	.LBB134_7
.LBB134_7:                              //   in Loop: Header=BB134_6 Depth=1
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r0, [x0]
	mov	x5, rax
add	x1, -1
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x3]
	mov	x6, rax
	mov	x4, x3
	mov	r1, -256
add	x4, 1
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mov	x3, x4
	jne	x6, x5, .LBB134_6
	jmp	.LBB134_8
.LBB134_8:
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
// -- Begin function memchr
memchr:                                 // @memchr
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x0, r1
	mov	r1, 3
	mov	x1, r2
	mov	x2, r0
	call	__bit_and
	jz	rax, .LBB135_5
	jmp	.LBB135_1
.LBB135_1:
	mov	x3, x2
add	x3, 1
.LBB135_2:                              // =>This Inner Loop Header: Depth=1
	mov	rax, 0
	jz	x1, .LBB135_13
	jmp	.LBB135_3
.LBB135_3:                              //   in Loop: Header=BB135_2 Depth=1
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
	mov	r0, [x2]
	mov	r1, 255
	mov	x4, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, x2
	je	r0, x4, .LBB135_13
	jmp	.LBB135_4
.LBB135_4:                              //   in Loop: Header=BB135_2 Depth=1
	mov	r1, 3
add	x2, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
add	x1, -1
	jnz	rax, .LBB135_2
	jmp	.LBB135_5
.LBB135_5:                              // %.loopexit9
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB135_9
	jmp	.LBB135_6
.LBB135_6:
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
	mov	x3, rax
	mul	x3, 16843009
	mov	x4, -2139062144
	mov	x5, -2147483645
.LBB135_7:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
	mov	r1, x3
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB135_10
	jmp	.LBB135_8
.LBB135_8:                              //   in Loop: Header=BB135_7 Depth=1
add	x1, -4
	mov	r1, -2147483648
add	x2, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x5, .LBB135_7
	jmp	.LBB135_9
.LBB135_9:                              // %.loopexit6
	mov	rax, 0
	jz	x1, .LBB135_13
	jmp	.LBB135_10
.LBB135_10:                             // %.loopexit5
.LBB135_11:                             // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
	mov	r0, [x2]
	mov	r1, 255
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, x2
	je	r0, x3, .LBB135_13
	jmp	.LBB135_12
.LBB135_12:                             //   in Loop: Header=BB135_11 Depth=1
add	x1, -1
add	x2, 1
	mov	rax, 0
	jnz	x1, .LBB135_11
	jmp	.LBB135_13
.LBB135_13:                             // %.loopexit
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function memcmp
memcmp:                                 // @memcmp
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r1
	mov	r1, -2147483648
	mov	x1, r2
	mov	x2, r0
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB136_5
	jmp	.LBB136_1
.LBB136_1:
	mov	r0, x0
	mov	r1, x2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB136_6
	jmp	.LBB136_2
.LBB136_2:                              // %.preheader.preheader
	mov	x3, -2147483645
.LBB136_3:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
	mov	r1, [x0]
	jne	r0, r1, .LBB136_6
	jmp	.LBB136_4
.LBB136_4:                              //   in Loop: Header=BB136_3 Depth=1
add	x2, 4
add	x1, -4
	mov	r1, -2147483648
add	x0, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x3, .LBB136_3
	jmp	.LBB136_5
.LBB136_5:                              // %.loopexit8
	mov	rax, 0
	jz	x1, .LBB136_10
	jmp	.LBB136_6
.LBB136_6:                              // %.loopexit7.preheader
.LBB136_7:                              // %.loopexit7
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x0]
	mov	r1, 255
	mov	x3, rax
	call	__bit_and
	je	x3, rax, .LBB136_9
	jmp	.LBB136_8
.LBB136_8:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x3
	call	__bit_and
	sub	rax, x0
	jmp	.LBB136_10
.LBB136_9:                              //   in Loop: Header=BB136_7 Depth=1
add	x1, -1
add	x2, 1
add	x0, 1
	mov	rax, 0
	jnz	x1, .LBB136_7
	jmp	.LBB136_10
.LBB136_10:                             // %.loopexit
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function memcpy
memcpy:                                 // @memcpy
// %bb.0:
sub	rsp, 56
	mov	[rsp+52], x0
	mov	[rsp+48], x1
	mov	[rsp+44], x2
	mov	[rsp+40], x3
	mov	[rsp+36], x4
	mov	[rsp+32], x5
	mov	[rsp+28], x6
	mov	[rsp+24], x7
	mov	[rsp+20], x8
	mov	[rsp+16], x9
	mov	[rsp+12], x10
	mov	[rsp+8], x11
	mov	[rsp+4], x12
	mov	[rsp], x13
	mov	x1, r1
	mov	r1, -2147483648
	mov	x5, r2
	mov	x0, r0
	mov	r0, x5
	call	__bit_xor
	mov	r0, -2147483632
	mov	x6, x0
	mov	x2, x5
	jl	rax, r0, .LBB137_13
	jmp	.LBB137_1
.LBB137_1:
	mov	r1, 3
	mov	r0, x0
	call	__bit_and
	mov	x2, rax
	mov	x7, 8
	sub	x7, x2
	mov	x10, 0
	mov	x3, x1
.LBB137_2:                              // =>This Inner Loop Header: Depth=1
	mov	r0, x1
	add	r0, x10
	mov	r0, [r0]
	mov	x8, x0
	mov	r1, 255
	add	x8, x10
	call	__bit_and
	mov	r0, [x8]
	mov	r1, -256
	mov	x4, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x8], rax
add	x10, 1
add	x3, 1
	jne	x7, x10, .LBB137_2
	jmp	.LBB137_3
.LBB137_3:
	mov	r1, -8
	mov	r0, x2
	call	__bit_or
	mov	x2, rax
	mov	x4, x1
	add	x4, x10
	mov	r1, 3
	add	x2, x5
	mov	r0, x4
	call	__bit_and
	jnz	rax, .LBB137_10
	jmp	.LBB137_4
.LBB137_4:
	mov	x6, x0
	mov	r1, -2147483648
	add	x6, x10
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB137_7
	jmp	.LBB137_5
.LBB137_5:                              // %.preheader.preheader
	mov	x6, x0
	add	x6, x10
	add	x1, x10
	mov	x3, 0
	mov	x4, -2147483633
	jmp	.LBB137_8
.LBB137_6:
	add	x1, x3
	mov	r0, 4
	add	x6, x3
	mov	x4, x1
	jl	x2, r0, .LBB137_13
	jmp	.LBB137_7
.LBB137_7:                              // %.preheader59
	mov	x3, -2147483645
	mov	x1, x4
	jmp	.LBB137_9
.LBB137_8:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x1
	add	r0, x3
	mov	r1, x6
	mov	r2, [r0]
	mov	r3, r0
add	r3, 4
	mov	r3, [r3]
	add	r1, x3
	mov	[r1], r2
	mov	r2, r1
add	r2, 4
	mov	[r2], r3
	mov	r2, r0
add	r2, 8
	mov	r2, [r2]
	mov	r3, r1
add	r0, 12
	mov	r0, [r0]
add	r3, 8
	mov	[r3], r2
add	r1, 12
	mov	[r1], r0
add	x2, -16
	mov	r1, -2147483648
add	x3, 16
	mov	r0, x2
	call	__bit_xor
	jg	rax, x4, .LBB137_8
	jmp	.LBB137_6
.LBB137_9:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
add	x1, 4
	mov	[x6], r0
add	x2, -4
	mov	r1, -2147483648
add	x6, 4
	mov	r0, x2
	call	__bit_xor
	jg	rax, x3, .LBB137_9
	jmp	.LBB137_13
.LBB137_10:
	mov	r1, 3
	mov	r0, rax
	mov	x7, rax
	call	__bit_shl
	mov	x5, rax
	mov	x6, 8
	mov	r1, 3
	sub	x6, x7
	mov	r0, x3
	call	__bit_and
	mov	x12, x1
	sub	x12, rax
	mov	r0, x12
	add	r0, x10
	mov	x7, [r0]
add	x12, 4
	mov	x11, 0
.LBB137_11:                             // =>This Inner Loop Header: Depth=1
	mov	x13, x0
	mov	r0, x10
	add	r0, x11
	add	r0, x12
	mov	x8, [r0]
	add	x13, x11
	mov	r1, 31
	add	x13, x10
	mov	r0, x5
	call	__bit_and
	mov	r0, x7
	mov	r1, rax
	call	__bit_shr
	mov	x7, rax
	mov	r0, x5
	call	__bit_not
	mov	r1, 31
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
	mov	x9, rax
	mov	r0, x8
	call	__bit_shl
	mov	r0, rax
	mov	r1, x9
	call	__bit_shl
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	mov	[x13], rax
add	x2, -4
	mov	r1, -2147483648
add	x11, 4
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x2
	call	__bit_xor
	mov	x7, x8
	jge	rax, x9, .LBB137_11
	jmp	.LBB137_12
.LBB137_12:
	mov	r1, -4
	mov	r0, x4
	call	__bit_or
	mov	x4, rax
	mov	r1, 3
	add	x4, x11
	mov	r0, x3
	call	__bit_and
	sub	x1, rax
	add	x1, x4
	add	x1, x10
	add	x10, x0
	add	x10, x11
add	x1, 4
	mov	x6, x10
	jmp	.LBB137_14
.LBB137_13:                             // %.loopexit8
	jz	x2, .LBB137_16
	jmp	.LBB137_14
.LBB137_14:                             // %.preheader56
	mov	x5, x6
.LBB137_15:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
add	x2, -1
	mov	r1, 255
add	x1, 1
	call	__bit_and
	mov	r0, [x6]
	mov	x3, rax
	mov	r1, -256
add	x5, 1
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x6], rax
	mov	x6, x5
	jnz	x2, .LBB137_15
	jmp	.LBB137_16
.LBB137_16:                             // %.loopexit
	mov	rax, x0
	mov	x13, [rsp]
	mov	x12, [rsp+4]
	mov	x11, [rsp+8]
	mov	x10, [rsp+12]
	mov	x9, [rsp+16]
	mov	x8, [rsp+20]
	mov	x7, [rsp+24]
	mov	x6, [rsp+28]
	mov	x5, [rsp+32]
	mov	x4, [rsp+36]
	mov	x3, [rsp+40]
	mov	x2, [rsp+44]
	mov	x1, [rsp+48]
	mov	x0, [rsp+52]
add	rsp, 56
	ret
// -- End function
// -- Begin function two_way_long_needle
two_way_long_needle:                    // @two_way_long_needle
// %bb.0:
sub	rsp, 1108
	mov	[rsp+1104], x0
	mov	[rsp+1100], x1
	mov	[rsp+1096], x2
	mov	[rsp+1092], x3
	mov	[rsp+1088], x4
	mov	[rsp+1084], x5
	mov	[rsp+1080], x6
	mov	[rsp+1076], x7
	mov	[rsp+1072], x8
	mov	[rsp+1068], x9
	mov	[rsp+1064], x10
	mov	[rsp+1060], x11
	mov	[rsp+1056], x12
	mov	[rsp+1052], x13
	mov	[rsp+1048], x14
	mov	[rsp+1044], x15
	mov	x0, r3
	mov	x2, r2
	mov	[rsp+12], r1
	mov	[rsp+16], r0
	mov	x11, 0
	mov	r1, -2147483648
	mov	x4, 1
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483646
	mov	x5, 0
	jl	rax, r0, .LBB138_22
	jmp	.LBB138_1
.LBB138_1:                              // %.preheader30.preheader
	mov	x6, -1
	mov	x10, 0
	mov	x5, 1
	mov	x1, 1
.LBB138_2:                              // %.preheader30
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x2
	add	r0, x5
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, x2
	add	r0, x6
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	mov	x7, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x8
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x7
	call	__bit_xor
	jge	rax, x9, .LBB138_4
	jmp	.LBB138_3
.LBB138_3:                              //   in Loop: Header=BB138_2 Depth=1
	mov	x4, x5
	sub	x4, x6
	mov	x1, 1
	jmp	.LBB138_9
.LBB138_4:                              //   in Loop: Header=BB138_2 Depth=1
	mov	r1, 255
	mov	r0, x8
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x7
	call	__bit_and
	jne	rax, x5, .LBB138_8
	jmp	.LBB138_5
.LBB138_5:                              //   in Loop: Header=BB138_2 Depth=1
	je	x1, x4, .LBB138_7
	jmp	.LBB138_6
.LBB138_6:                              //   in Loop: Header=BB138_2 Depth=1
add	x1, 1
	mov	x5, x10
	jmp	.LBB138_9
.LBB138_7:                              //   in Loop: Header=BB138_2 Depth=1
	add	x10, x4
	mov	x1, 1
	mov	x5, x10
	jmp	.LBB138_9
.LBB138_8:                              //   in Loop: Header=BB138_2 Depth=1
	mov	x5, x10
add	x5, 1
	mov	x1, 1
	mov	x6, x10
	mov	x4, 1
.LBB138_9:                              //   in Loop: Header=BB138_2 Depth=1
	mov	x10, x5
	mov	x5, x1
	mov	r1, -2147483648
	add	x5, x10
	mov	r0, x0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x7, rax
	mov	r0, x5
	call	__bit_xor
	jl	rax, x7, .LBB138_2
	jmp	.LBB138_10
.LBB138_10:                             // %.preheader29.preheader
	mov	x5, -1
	mov	x13, 0
	mov	x7, 1
	mov	x1, 1
	mov	x12, 1
.LBB138_11:                             // %.preheader29
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x2
	add	r0, x7
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, x2
	add	r0, x5
	add	r0, x12
	mov	r0, [r0]
	mov	r1, 255
	mov	x8, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x8
	call	__bit_xor
	mov	r1, -2147483648
	mov	x10, rax
	mov	r0, x9
	call	__bit_xor
	jge	rax, x10, .LBB138_13
	jmp	.LBB138_12
.LBB138_12:                             //   in Loop: Header=BB138_11 Depth=1
	mov	x1, x7
	sub	x1, x5
	mov	x12, 1
	jmp	.LBB138_18
.LBB138_13:                             //   in Loop: Header=BB138_11 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x8
	call	__bit_and
	jne	rax, x7, .LBB138_17
	jmp	.LBB138_14
.LBB138_14:                             //   in Loop: Header=BB138_11 Depth=1
	je	x12, x1, .LBB138_16
	jmp	.LBB138_15
.LBB138_15:                             //   in Loop: Header=BB138_11 Depth=1
add	x12, 1
	mov	x7, x13
	jmp	.LBB138_18
.LBB138_16:                             //   in Loop: Header=BB138_11 Depth=1
	add	x13, x1
	mov	x12, 1
	mov	x7, x13
	jmp	.LBB138_18
.LBB138_17:                             //   in Loop: Header=BB138_11 Depth=1
	mov	x7, x13
add	x7, 1
	mov	x12, 1
	mov	x5, x13
	mov	x1, 1
.LBB138_18:                             //   in Loop: Header=BB138_11 Depth=1
	mov	x13, x7
	mov	x7, x12
	mov	r1, -2147483648
	add	x7, x13
	mov	r0, x0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x7
	call	__bit_xor
	jl	rax, x8, .LBB138_11
	jmp	.LBB138_19
.LBB138_19:
add	x6, 1
	mov	r1, -2147483648
add	x5, 1
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x7, rax
	mov	r0, x5
	call	__bit_xor
	jl	rax, x7, .LBB138_21
	jmp	.LBB138_20
.LBB138_20:
	mov	x4, x1
.LBB138_21:
	mov	r0, x6
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	x7, rax
	mov	r0, x6
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x6
	sub	r1, x5
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	sub	x5, x6
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	x5, rax
	add	x5, x6
.LBB138_22:
	mov	r0, 1024
	jmp	.LBB138_25
.LBB138_23:
	jz	x0, .LBB138_27
	jmp	.LBB138_24
.LBB138_24:                             // %.preheader27.preheader
	mov	x1, x0
add	x1, -1
	mov	x3, -1
	mov	x6, x2
	jmp	.LBB138_26
.LBB138_25:                             // =>This Inner Loop Header: Depth=1
	mov	r1, rsp
add	r1, 20
	add	r1, x11
add	x11, 4
	mov	[r1], x0
	je	x11, r0, .LBB138_23
	jmp	.LBB138_25
.LBB138_26:                             // %.preheader27
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shl
	mov	r0, rsp
add	r0, 20
	add	r0, rax
	mov	[r0], x1
add	x1, -1
add	x6, 1
	jne	x1, x3, .LBB138_26
	jmp	.LBB138_27
.LBB138_27:                             // %.loopexit28
	mov	x6, x2
	mov	r1, -2147483648
	add	x6, x4
	mov	r0, x5
	call	__bit_xor
	mov	r0, -2147483644
	mov	x7, x5
	mov	x1, x2
	jl	rax, r0, .LBB138_33
	jmp	.LBB138_28
.LBB138_28:
	mov	r0, x6
	mov	r1, x2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	x7, x5
	mov	x1, x2
	jnz	rax, .LBB138_35
	jmp	.LBB138_29
.LBB138_29:                             // %.preheader.i.preheader
	mov	x3, -2147483645
	mov	x1, x2
	mov	x7, x5
.LBB138_30:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	x6, x1
	add	x6, x4
	mov	r0, [x1]
	mov	r1, [x6]
	jne	r0, r1, .LBB138_34
	jmp	.LBB138_31
.LBB138_31:                             //   in Loop: Header=BB138_30 Depth=1
add	x7, -4
	mov	r1, -2147483648
add	x1, 4
	mov	r0, x7
	call	__bit_xor
	jg	rax, x3, .LBB138_30
	jmp	.LBB138_32
.LBB138_32:                             // %.loopexit8.i.loopexit
	mov	x6, x1
	add	x6, x4
.LBB138_33:                             // %.loopexit8.i
	jz	x7, .LBB138_38
	jmp	.LBB138_35
.LBB138_34:                             // %.loopexit7.i.preheader.loopexit
.LBB138_35:                             // %.loopexit7.i.preheader
.LBB138_36:                             // %.loopexit7.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x6]
	mov	r1, 255
	mov	x8, rax
	call	__bit_and
	jne	x8, rax, .LBB138_53
	jmp	.LBB138_37
.LBB138_37:                             //   in Loop: Header=BB138_36 Depth=1
add	x7, -1
add	x1, 1
add	x6, 1
	jnz	x7, .LBB138_36
	jmp	.LBB138_38
.LBB138_38:                             // %memcmp.exit.thread
	mov	r0, [rsp+12]
	sub	r0, x0
	mov	[rsp+12], r0
	mov	x14, x0
	sub	x14, x4
	mov	r0, x0
add	r0, -1
	mov	[rsp+8], r0
	mov	r0, 1
	sub	r0, x5
	mov	[rsp], r0
	mov	r0, [rsp+16]
add	r0, -1
	mov	[rsp+4], r0
	mov	x1, x2
add	x1, -1
	mov	x3, 0
	mov	x8, 0
.LBB138_39:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB138_47 Depth 2
                                        //     Child Loop BB138_49 Depth 2
	mov	x6, [rsp+16]
	add	x6, x8
	mov	r0, x6
	add	r0, x0
add	r0, -1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shl
	mov	r0, rsp
add	r0, 20
	add	r0, rax
	mov	x11, [r0]
	jz	x11, .LBB138_44
	jmp	.LBB138_40
.LBB138_40:                             //   in Loop: Header=BB138_39 Depth=1
	mov	x9, 0
	jz	x3, .LBB138_43
	jmp	.LBB138_41
.LBB138_41:                             //   in Loop: Header=BB138_39 Depth=1
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x11
	call	__bit_xor
	jge	rax, x6, .LBB138_43
	jmp	.LBB138_42
.LBB138_42:                             //   in Loop: Header=BB138_39 Depth=1
	mov	x11, x14
.LBB138_43:                             //   in Loop: Header=BB138_39 Depth=1
	add	x8, x11
	mov	r1, -2147483648
	mov	x6, 0
	mov	r0, [rsp+12]
	call	__bit_xor
	mov	r1, -2147483648
	mov	x10, rax
	mov	r0, x8
	call	__bit_xor
	mov	x3, x9
	jg	rax, x10, .LBB138_65
	jmp	.LBB138_39
.LBB138_44:                             //   in Loop: Header=BB138_39 Depth=1
	mov	r0, x3
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	x11, rax
	mov	r0, x3
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	x10, x3
	sub	x10, x5
	mov	r0, rax
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, x5
	sub	r1, x3
	mov	r0, rax
	call	__bit_and
	mov	x12, rax
	add	x12, x3
	mov	r1, -2147483648
	mov	r0, x12
	call	__bit_xor
	mov	r1, -2147483648
	mov	x11, rax
	mov	r0, [rsp+8]
	call	__bit_xor
	jge	x11, rax, .LBB138_46
	jmp	.LBB138_45
.LBB138_45:                             // %.preheader.preheader
                                        //   in Loop: Header=BB138_39 Depth=1
	mov	x11, [rsp]
	add	x11, x12
	mov	x7, [rsp+8]
	sub	x7, x12
	mov	x15, x2
	add	x15, x12
	add	x12, x8
	mov	r0, [rsp+16]
	add	x12, r0
	jmp	.LBB138_47
.LBB138_46:                             // %.loopexit
                                        //   in Loop: Header=BB138_39 Depth=1
	mov	r0, x3
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	x11, rax
	mov	r0, x3
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r0, rax
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x10
	call	__bit_and
	mov	x10, rax
	add	x10, x5
	mov	x7, [rsp+4]
	add	x7, x8
	mov	x11, x5
	jmp	.LBB138_49
.LBB138_47:                             // %.preheader
                                        //   Parent Loop BB138_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x15]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x12]
	mov	r1, 255
	mov	x13, rax
	call	__bit_and
	mov	x9, 0
	jne	x13, rax, .LBB138_43
	jmp	.LBB138_48
.LBB138_48:                             //   in Loop: Header=BB138_47 Depth=2
add	x11, 1
add	x7, -1
add	x15, 1
add	x12, 1
	jz	x7, .LBB138_46
	jmp	.LBB138_47
.LBB138_49:                             //   Parent Loop BB138_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, -2147483648
	mov	r0, x11
	call	__bit_xor
	mov	r1, -2147483648
	mov	x12, rax
	mov	r0, x3
	call	__bit_xor
	jge	rax, x12, .LBB138_52
	jmp	.LBB138_50
.LBB138_50:                             //   in Loop: Header=BB138_49 Depth=2
	mov	r0, x1
	add	r0, x11
	mov	r0, [r0]
	mov	x9, x11
	mov	r1, 255
add	x9, -1
	call	__bit_and
	add	x11, x7
	mov	r0, [x11]
	mov	r1, 255
	mov	x12, rax
	call	__bit_and
	mov	x11, x9
	je	x12, rax, .LBB138_49
	jmp	.LBB138_51
.LBB138_51:                             // %._crit_edge
                                        //   in Loop: Header=BB138_39 Depth=1
add	x9, 1
	mov	x10, x9
.LBB138_52:                             //   in Loop: Header=BB138_39 Depth=1
add	x3, 1
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x10
	call	__bit_xor
	mov	x11, x4
	mov	x9, x14
	jl	rax, x3, .LBB138_65
	jmp	.LBB138_43
.LBB138_53:                             // %memcmp.exit
	mov	x6, x0
	sub	x6, x5
	mov	r0, x6
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	x4, rax
	mov	r0, x6
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x6
	sub	r1, x5
	mov	r0, rax
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, x5
	sub	r1, x6
	mov	r0, rax
	call	__bit_and
	mov	x4, rax
	add	x4, x6
	mov	x7, x0
add	x7, -1
	mov	r0, [rsp+12]
	sub	r0, x0
	mov	[rsp+12], r0
	mov	x1, x7
	sub	x1, x5
	mov	x10, x2
	add	x10, x5
	mov	x12, [rsp+16]
	mov	x11, x12
	add	x11, x5
add	x12, -1
add	x2, -1
	mov	x8, 0
.LBB138_54:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB138_59 Depth 2
                                        //     Child Loop BB138_62 Depth 2
	mov	x6, [rsp+16]
	add	x6, x8
	mov	r0, x6
	add	r0, x0
add	r0, -1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shl
	mov	r0, rsp
add	r0, 20
	add	r0, rax
	mov	r0, [r0]
	jnz	r0, .LBB138_57
	jmp	.LBB138_55
.LBB138_55:                             //   in Loop: Header=BB138_54 Depth=1
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x7
	call	__bit_xor
	jle	rax, x9, .LBB138_61
	jmp	.LBB138_56
.LBB138_56:                             // %.preheader24.preheader
                                        //   in Loop: Header=BB138_54 Depth=1
	mov	x13, x11
	add	x13, x8
	mov	x3, 0
	jmp	.LBB138_59
.LBB138_57:                             //   in Loop: Header=BB138_54 Depth=1
	add	x8, r0
.LBB138_58:                             //   in Loop: Header=BB138_54 Depth=1
	mov	r1, -2147483648
	mov	x6, 0
	mov	r0, [rsp+12]
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x8
	call	__bit_xor
	jg	rax, x9, .LBB138_65
	jmp	.LBB138_54
.LBB138_59:                             // %.preheader24
                                        //   Parent Loop BB138_54 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x10
	add	r0, x3
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, x13
	add	r0, x3
	mov	r0, [r0]
	mov	r1, 255
	mov	x9, rax
	call	__bit_and
	jne	x9, rax, .LBB138_64
	jmp	.LBB138_60
.LBB138_60:                             //   in Loop: Header=BB138_59 Depth=2
add	x3, 1
	jne	x1, x3, .LBB138_59
	jmp	.LBB138_61
.LBB138_61:                             // %.loopexit25.preheader
                                        //   in Loop: Header=BB138_54 Depth=1
	mov	x13, x12
	add	x13, x8
	mov	x14, x5
.LBB138_62:                             // %.loopexit25
                                        //   Parent Loop BB138_54 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	jz	x14, .LBB138_65
	jmp	.LBB138_63
.LBB138_63:                             //   in Loop: Header=BB138_62 Depth=2
	mov	r0, x2
	add	r0, x14
	mov	r0, [r0]
	mov	x3, x14
	mov	r1, 255
add	x3, -1
	call	__bit_and
	add	x14, x13
	mov	r0, [x14]
	mov	r1, 255
	mov	x9, rax
	call	__bit_and
	mov	x14, x3
	mov	x3, x4
	je	x9, rax, .LBB138_62
	jmp	.LBB138_64
.LBB138_64:                             // %.loopexit23
                                        //   in Loop: Header=BB138_54 Depth=1
	add	x8, x3
add	x8, 1
	jmp	.LBB138_58
.LBB138_65:                             // %.loopexit21
	mov	rax, x6
	mov	x15, [rsp+1044]
	mov	x14, [rsp+1048]
	mov	x13, [rsp+1052]
	mov	x12, [rsp+1056]
	mov	x11, [rsp+1060]
	mov	x10, [rsp+1064]
	mov	x9, [rsp+1068]
	mov	x8, [rsp+1072]
	mov	x7, [rsp+1076]
	mov	x6, [rsp+1080]
	mov	x5, [rsp+1084]
	mov	x4, [rsp+1088]
	mov	x3, [rsp+1092]
	mov	x2, [rsp+1096]
	mov	x1, [rsp+1100]
	mov	x0, [rsp+1104]
add	rsp, 1108
	ret
// -- End function
// -- Begin function memmem
memmem:                                 // @memmem
// %bb.0:
sub	rsp, 312
	mov	[rsp+308], x0
	mov	[rsp+304], x1
	mov	[rsp+300], x2
	mov	[rsp+296], x3
	mov	[rsp+292], x4
	mov	[rsp+288], x5
	mov	[rsp+284], x6
	mov	[rsp+280], x7
	mov	[rsp+276], x8
	mov	[rsp+272], x9
	mov	[rsp+268], x10
	mov	[rsp+264], x11
	mov	[rsp+260], x12
	mov	[rsp+256], x13
	mov	x3, r3
	mov	x2, r2
	mov	x4, r1
	mov	x0, r0
	mov	x6, x0
	jz	x3, .LBB139_78
	jmp	.LBB139_1
.LBB139_1:
	mov	r0, 1
	jne	x3, r0, .LBB139_15
	jmp	.LBB139_2
.LBB139_2:
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	r1, 3
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB139_7
	jmp	.LBB139_3
.LBB139_3:                              // %.preheader25.preheader
	mov	x2, x0
add	x2, 1
.LBB139_4:                              // %.preheader25
                                        // =>This Inner Loop Header: Depth=1
	mov	x6, 0
	jz	x4, .LBB139_78
	jmp	.LBB139_5
.LBB139_5:                              //   in Loop: Header=BB139_4 Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x1
	call	__bit_and
	mov	x6, x0
	je	x3, rax, .LBB139_78
	jmp	.LBB139_6
.LBB139_6:                              //   in Loop: Header=BB139_4 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x2
	call	__bit_and
add	x2, 1
add	x4, -1
	jnz	rax, .LBB139_4
	jmp	.LBB139_7
.LBB139_7:                              // %.loopexit9.i
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB139_11
	jmp	.LBB139_8
.LBB139_8:
	mov	x2, x1
	mul	x2, 16843009
	mov	x3, -2139062144
	mov	x5, -2147483645
.LBB139_9:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, x2
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x3, .LBB139_12
	jmp	.LBB139_10
.LBB139_10:                             //   in Loop: Header=BB139_9 Depth=1
add	x4, -4
	mov	r1, -2147483648
add	x0, 4
	mov	r0, x4
	call	__bit_xor
	jg	rax, x5, .LBB139_9
	jmp	.LBB139_11
.LBB139_11:                             // %.loopexit6.i
	mov	x6, 0
	jz	x4, .LBB139_78
	jmp	.LBB139_12
.LBB139_12:                             // %.loopexit5.i.preheader
.LBB139_13:                             // %.loopexit5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	x6, x0
	je	x2, rax, .LBB139_78
	jmp	.LBB139_14
.LBB139_14:                             //   in Loop: Header=BB139_13 Depth=1
add	x4, -1
add	x0, 1
	mov	x6, 0
	jz	x4, .LBB139_78
	jmp	.LBB139_13
.LBB139_15:
	mov	r1, -2147483648
	mov	x6, 0
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x4
	call	__bit_xor
	jl	rax, x1, .LBB139_78
	jmp	.LBB139_16
.LBB139_16:
	mov	x7, x4
	sub	x7, x3
	mov	x1, x0
	mov	r0, 2
	add	x1, x7
	jne	x3, r0, .LBB139_24
	jmp	.LBB139_17
.LBB139_17:
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	r1, 16
	mov	r0, rax
	call	__bit_shl
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	mov	x2, rax
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, [x0]
	mov	r1, 255
	mov	x2, rax
	call	__bit_and
	mov	r1, 16
	mov	r0, rax
	call	__bit_shl
	mov	r0, x0
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	mov	x3, rax
	call	__bit_and
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r0, 1
	mov	x3, rax
	jl	x7, r0, .LBB139_23
	jmp	.LBB139_18
.LBB139_18:
	je	x3, x2, .LBB139_23
	jmp	.LBB139_19
.LBB139_19:                             // %.preheader.preheader
add	x0, 2
.LBB139_20:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 16
	mov	x4, x0
	mov	r0, x3
	call	__bit_shl
	mov	r0, [x4]
	mov	r1, 255
	mov	x3, rax
	call	__bit_and
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	x3, rax
	mov	r1, -2147483648
add	x0, 1
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x4
	call	__bit_xor
	jg	rax, x5, .LBB139_22
	jmp	.LBB139_21
.LBB139_21:                             // %.preheader
                                        //   in Loop: Header=BB139_20 Depth=1
	jne	x3, x2, .LBB139_20
	jmp	.LBB139_22
.LBB139_22:                             // %.loopexit.loopexit
add	x0, -2
.LBB139_23:                             // %.loopexit
	mov	r0, x3
	mov	r1, x2
	call	__bit_xor
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
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x6, rax
	jmp	.LBB139_78
.LBB139_24:
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r0, -2147483391
	jl	rax, r0, .LBB139_26
	jmp	.LBB139_25
.LBB139_25:
	mov	r0, x0
	mov	r1, x4
	mov	r2, x2
	mov	r3, x3
	call	two_way_long_needle
	mov	x6, rax
	jmp	.LBB139_78
.LBB139_26:
	mov	x4, rsp
	mov	r1, 3
	mov	r0, x4
	call	__bit_and
	mov	x5, 256
	jz	rax, .LBB139_31
	jmp	.LBB139_27
.LBB139_27:                             // %.preheader22.preheader
	mov	r0, rsp
	mov	r1, 3
	call	__bit_and
	mov	r1, 3
	mov	r0, rax
	call	__bit_xor
	mov	x4, rax
add	x4, 1
.LBB139_28:                             // =>This Inner Loop Header: Depth=1
	mov	x5, rsp
	add	x5, x6
	mov	r0, [x5]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
add	x6, 1
	mov	[x5], rax
	jne	x4, x6, .LBB139_28
	jmp	.LBB139_29
.LBB139_29:                             // %.loopexit7.i
	mov	r0, 257
	sub	r0, x6
	mov	x4, rsp
	add	x4, x6
	mov	x5, 256
	mov	r1, -2147483648
	sub	x5, x6
	call	__bit_xor
	mov	r0, -2147483643
	jl	rax, r0, .LBB139_36
	jmp	.LBB139_30
.LBB139_30:                             // %.loopexit7.i.thread
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB139_32
	jmp	.LBB139_31
.LBB139_31:                             // %.preheader.i.preheader
	mov	x6, -2147483633
	jmp	.LBB139_34
.LBB139_32:                             // %.preheader239
	mov	x6, -2147483645
	jmp	.LBB139_35
.LBB139_33:
	mov	r0, x5
add	r0, 16
	mov	r1, 19
	jg	r0, r1, .LBB139_32
	jmp	.LBB139_36
.LBB139_34:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x4
add	r0, 4
	mov	[x4], 0
	mov	r1, x4
add	r1, 8
	mov	[r0], 0
	mov	r0, x4
add	r0, 12
	mov	[r1], 0
add	x4, 16
add	x5, -16
	mov	r1, -2147483648
	mov	[r0], 0
	mov	r0, x5
	call	__bit_xor
	jg	rax, x6, .LBB139_34
	jmp	.LBB139_33
.LBB139_35:                             // =>This Inner Loop Header: Depth=1
	mov	[x4], 0
add	x5, -4
	mov	r1, -2147483648
add	x4, 4
	mov	r0, x5
	call	__bit_xor
	jg	rax, x6, .LBB139_35
	jmp	.LBB139_36
.LBB139_36:                             // %.loopexit5.i6
	jz	x5, .LBB139_39
	jmp	.LBB139_37
.LBB139_37:                             // %.preheader21.preheader
	mov	x6, x4
.LBB139_38:                             // %.preheader21
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x4]
add	x5, -1
	mov	r1, -256
add	x6, 1
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x4], rax
	mov	x4, x6
	jnz	x5, .LBB139_38
	jmp	.LBB139_39
.LBB139_39:                             // %memset.exit.preheader
	mov	x4, x3
add	x4, -1
	mov	x8, x3
add	x8, -2
	mov	x5, 0
.LBB139_40:                             // %memset.exit
                                        // =>This Inner Loop Header: Depth=1
	mov	x6, x2
	add	x6, x5
	mov	r0, x6
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	r0, [x6]
	mov	r1, 255
	mov	x6, rax
	call	__bit_and
	mov	r1, 3
	mov	r0, rax
	call	__bit_shl
	sub	x6, rax
	mov	r1, 255
	mov	r0, x6
	call	__bit_and
	mov	x9, rsp
	add	x9, rax
	mov	r0, [x9]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x9], rax
	jne	x8, x5, .LBB139_40
	jmp	.LBB139_41
.LBB139_41:
	mov	x5, x2
	add	x5, x4
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
add	x5, -1
	mov	r0, [x5]
	mov	r1, 255
	mov	x5, rax
	call	__bit_and
	mov	r1, 3
	mov	r0, rax
	call	__bit_shl
	sub	x5, rax
	mov	r1, 255
	mov	r0, x5
	call	__bit_and
	mov	x8, rsp
	add	x8, rax
	mov	x5, [x8]
	mov	r1, 255
	mov	r0, x5
	call	__bit_and
	mov	x10, x4
	mov	r1, -256
	sub	x10, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	x5, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	r0, 17
	mov	[x8], rax
	jl	x3, r0, .LBB139_43
	jmp	.LBB139_42
.LBB139_42:                             // %.preheader19.preheader
	mov	x11, -2147483645
	jmp	.LBB139_59
.LBB139_43:                             // %.preheader14
	mov	x6, 0
	jl	x7, x6, .LBB139_77
	jmp	.LBB139_44
.LBB139_44:                             // %.preheader13.lr.ph
	mov	x7, -2147483643
	mov	x8, -2147483645
.LBB139_45:                             // %.preheader13
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB139_52 Depth 2
                                        //     Child Loop BB139_56 Depth 2
	mov	x6, x0
	add	x6, x4
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	mov	r0, x6
add	r0, -1
	mov	r0, [r0]
	mov	r1, 255
	mov	x0, rax
	call	__bit_and
	mov	r1, 3
	mov	r0, rax
	call	__bit_shl
	sub	x0, rax
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
	mov	r0, rsp
	add	r0, rax
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x6
	call	__bit_xor
	jg	rax, x0, .LBB139_47
	jmp	.LBB139_46
.LBB139_46:                             // %.preheader13
                                        //   in Loop: Header=BB139_45 Depth=1
	mov	r1, 255
	mov	r0, x5
	call	__bit_and
	mov	x0, x6
	jz	rax, .LBB139_45
	jmp	.LBB139_47
.LBB139_47:                             //   in Loop: Header=BB139_45 Depth=1
	mov	r1, 255
	mov	r0, x5
	call	__bit_and
	mov	r1, -2147483648
	sub	x6, rax
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x4
	call	__bit_xor
	jle	rax, x0, .LBB139_49
	jmp	.LBB139_48
.LBB139_48:                             //   in Loop: Header=BB139_45 Depth=1
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x6
	call	__bit_xor
	mov	x0, x6
	mov	x6, 0
	jg	rax, x5, .LBB139_77
	jmp	.LBB139_45
.LBB139_49:                             //   in Loop: Header=BB139_45 Depth=1
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	x0, x4
	mov	x11, x6
	mov	x9, x2
	jl	rax, x7, .LBB139_54
	jmp	.LBB139_50
.LBB139_50:                             //   in Loop: Header=BB139_45 Depth=1
	mov	r0, x6
	mov	r1, x2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	x0, x4
	mov	x9, x2
	mov	x11, x6
	jnz	rax, .LBB139_55
	jmp	.LBB139_51
.LBB139_51:                             // %.preheader.i8.preheader
                                        //   in Loop: Header=BB139_45 Depth=1
	mov	x9, x2
	mov	x11, x6
	mov	x0, x4
.LBB139_52:                             // %.preheader.i8
                                        //   Parent Loop BB139_45 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x11]
	mov	r1, [x9]
	jne	r0, r1, .LBB139_55
	jmp	.LBB139_53
.LBB139_53:                             //   in Loop: Header=BB139_52 Depth=2
add	x11, 4
add	x0, -4
	mov	r1, -2147483648
add	x9, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x8, .LBB139_52
	jmp	.LBB139_54
.LBB139_54:                             // %.loopexit8.i
                                        //   in Loop: Header=BB139_45 Depth=1
	jz	x0, .LBB139_77
	jmp	.LBB139_55
.LBB139_55:                             // %.loopexit7.i7.preheader
                                        //   in Loop: Header=BB139_45 Depth=1
.LBB139_56:                             // %.loopexit7.i7
                                        //   Parent Loop BB139_45 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x9]
	mov	r1, 255
	mov	x5, rax
	call	__bit_and
	jne	x5, rax, .LBB139_58
	jmp	.LBB139_57
.LBB139_57:                             //   in Loop: Header=BB139_56 Depth=2
add	x0, -1
add	x11, 1
add	x9, 1
	jz	x0, .LBB139_77
	jmp	.LBB139_56
.LBB139_58:                             // %memcmp.exit
                                        //   in Loop: Header=BB139_45 Depth=1
	add	x6, x10
	jmp	.LBB139_48
.LBB139_59:                             // %.preheader19
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB139_60 Depth 2
                                        //       Child Loop BB139_62 Depth 3
	mov	x8, x0
.LBB139_60:                             //   Parent Loop BB139_59 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB139_62 Depth 3
	mov	x0, x8
	mov	r1, -2147483648
	mov	x6, 0
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x7, rax
	mov	r0, x0
	call	__bit_xor
	jg	rax, x7, .LBB139_77
	jmp	.LBB139_61
.LBB139_61:                             // %.preheader16.preheader
                                        //   in Loop: Header=BB139_60 Depth=2
	mov	x9, x0
	add	x9, x3
	mov	x12, 0
.LBB139_62:                             // %.preheader16
                                        //   Parent Loop BB139_59 Depth=1
                                        //     Parent Loop BB139_60 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	x6, x9
	add	x6, x12
	mov	x7, x6
add	x7, -1
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
add	x6, -2
	mov	r0, [x6]
	mov	r1, 255
	mov	x6, rax
	call	__bit_and
	mov	r1, 3
	mov	r0, rax
	call	__bit_shl
	sub	x6, rax
	mov	r1, 255
	mov	r0, x6
	call	__bit_and
	mov	r0, rsp
	add	r0, rax
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x6, rax
	mov	r1, -2147483648
	add	x12, x4
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x7
	call	__bit_xor
	jg	rax, x8, .LBB139_64
	jmp	.LBB139_63
.LBB139_63:                             // %.preheader16
                                        //   in Loop: Header=BB139_62 Depth=3
	mov	r1, 255
	mov	r0, x6
	call	__bit_and
	jz	rax, .LBB139_62
	jmp	.LBB139_64
.LBB139_64:                             //   in Loop: Header=BB139_60 Depth=2
	mov	r1, 255
	mov	r0, x6
	call	__bit_and
	mov	x8, x0
	sub	x8, rax
	mov	r1, -2147483648
	add	x8, x12
	mov	r0, rax
	call	__bit_xor
	mov	r1, -2147483648
	mov	x7, rax
	mov	r0, x4
	call	__bit_xor
	jg	rax, x7, .LBB139_60
	jmp	.LBB139_65
.LBB139_65:                             //   in Loop: Header=BB139_59 Depth=1
	mov	r1, 255
	mov	r0, x6
	call	__bit_and
	mov	x13, x5
	add	x13, x0
	mov	x7, rax
	mov	x9, x13
	sub	x9, x7
	mov	x8, x2
	add	x8, x5
	add	x9, x12
	mov	r0, x9
	mov	r1, x8
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB139_67
	jmp	.LBB139_66
.LBB139_66:                             // %.preheader.i10.preheader
                                        //   in Loop: Header=BB139_59 Depth=1
	mov	r0, [x9]
	mov	r1, [x8]
	je	r0, r1, .LBB139_71
	jmp	.LBB139_67
.LBB139_67:                             // %.loopexit7.i9
                                        //   in Loop: Header=BB139_59 Depth=1
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x8]
	mov	r1, 255
	mov	x9, rax
	call	__bit_and
	jne	x9, rax, .LBB139_75
	jmp	.LBB139_68
.LBB139_68:                             // %.loopexit7.i9.1
                                        //   in Loop: Header=BB139_59 Depth=1
	mov	r1, 255
	mov	r0, x6
	call	__bit_and
	mov	r0, x13
	sub	r0, rax
	add	r0, x12
add	r0, 1
	mov	r0, [r0]
	mov	x9, x8
	mov	r1, 255
add	x9, 1
	call	__bit_and
	mov	r0, [x9]
	mov	r1, 255
	mov	x9, rax
	call	__bit_and
	jne	x9, rax, .LBB139_75
	jmp	.LBB139_69
.LBB139_69:                             // %.loopexit7.i9.2
                                        //   in Loop: Header=BB139_59 Depth=1
	mov	r1, 255
	mov	r0, x6
	call	__bit_and
	mov	r0, x13
	sub	r0, rax
	add	r0, x12
add	r0, 2
	mov	r0, [r0]
	mov	x9, x8
	mov	r1, 255
add	x9, 2
	call	__bit_and
	mov	r0, [x9]
	mov	r1, 255
	mov	x9, rax
	call	__bit_and
	jne	x9, rax, .LBB139_75
	jmp	.LBB139_70
.LBB139_70:                             // %.loopexit7.i9.3
                                        //   in Loop: Header=BB139_59 Depth=1
	mov	r1, 255
	mov	r0, x6
	call	__bit_and
	sub	x13, rax
	add	x13, x12
add	x13, 3
	mov	r0, [x13]
	mov	r1, 255
add	x8, 3
	call	__bit_and
	mov	r0, [x8]
	mov	r1, 255
	mov	x8, rax
	call	__bit_and
	jne	x8, rax, .LBB139_75
	jmp	.LBB139_71
.LBB139_71:                             // %memcmp.exit12.thread
                                        //   in Loop: Header=BB139_59 Depth=1
	mov	r0, x0
	sub	r0, x7
	add	r0, x12
	mov	r1, x2
	mov	r2, x4
	call	memcmp
	jz	rax, .LBB139_76
	jmp	.LBB139_72
.LBB139_72:                             //   in Loop: Header=BB139_59 Depth=1
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	jg	rax, x11, .LBB139_74
	jmp	.LBB139_73
.LBB139_73:                             //   in Loop: Header=BB139_59 Depth=1
	mov	x5, x4
.LBB139_74:                             //   in Loop: Header=BB139_59 Depth=1
add	x5, -4
.LBB139_75:                             // %memcmp.exit12
                                        //   in Loop: Header=BB139_59 Depth=1
	mov	r1, 255
	mov	r0, x6
	call	__bit_and
	add	x0, x10
	sub	x0, rax
	add	x0, x12
	jmp	.LBB139_59
.LBB139_76:                             // %memcmp.exit.thread.loopexit4
	mov	r1, 255
	mov	r0, x6
	call	__bit_and
	sub	x0, rax
	add	x0, x12
	mov	x6, x0
.LBB139_77:                             // %memcmp.exit.thread
.LBB139_78:                             // %memchr.exit
	mov	rax, x6
	mov	x13, [rsp+256]
	mov	x12, [rsp+260]
	mov	x11, [rsp+264]
	mov	x10, [rsp+268]
	mov	x9, [rsp+272]
	mov	x8, [rsp+276]
	mov	x7, [rsp+280]
	mov	x6, [rsp+284]
	mov	x5, [rsp+288]
	mov	x4, [rsp+292]
	mov	x3, [rsp+296]
	mov	x2, [rsp+300]
	mov	x1, [rsp+304]
	mov	x0, [rsp+308]
add	rsp, 312
	ret
// -- End function
// -- Begin function memmove
memmove:                                // @memmove
// %bb.0:
sub	rsp, 28
	mov	[rsp+24], x0
	mov	[rsp+20], x1
	mov	[rsp+16], x2
	mov	[rsp+12], x3
	mov	[rsp+8], x4
	mov	[rsp+4], x5
	mov	[rsp], x6
	mov	x2, r1
	mov	r1, -2147483648
	mov	x1, r2
	mov	x0, r0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x3, .LBB140_10
	jmp	.LBB140_1
.LBB140_1:
	mov	x3, x2
	add	x3, x1
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x0
	call	__bit_xor
	jge	rax, x4, .LBB140_10
	jmp	.LBB140_2
.LBB140_2:
	mov	x4, x0
	mov	r1, -2147483648
	add	x4, x1
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB140_7
	jmp	.LBB140_3
.LBB140_3:
	mov	r0, x3
	mov	r1, x4
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB140_8
	jmp	.LBB140_4
.LBB140_4:                              // %.preheader.preheader
	mov	x3, -2147483645
.LBB140_5:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x2
	add	r0, x1
add	r0, -4
	mov	r0, [r0]
	mov	r2, x0
	add	r2, x1
add	r2, -4
add	x1, -4
	mov	r1, -2147483648
	mov	[r2], r0
	mov	r0, x1
	call	__bit_xor
	jg	rax, x3, .LBB140_5
	jmp	.LBB140_6
.LBB140_6:                              // %.loopexit9.loopexit
	add	x2, x1
	mov	x4, x0
	add	x4, x1
	mov	x3, x2
.LBB140_7:                              // %.loopexit9
	jz	x1, .LBB140_21
	jmp	.LBB140_8
.LBB140_8:                              // %.preheader56
add	x3, -1
add	x4, -1
.LBB140_9:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
	mov	r1, 255
add	x1, -1
	call	__bit_and
	mov	r0, [x4]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
add	x3, -1
add	x4, -1
	jz	x1, .LBB140_21
	jmp	.LBB140_9
.LBB140_10:
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	mov	x5, x0
	jl	rax, r0, .LBB140_18
	jmp	.LBB140_11
.LBB140_11:
	mov	r0, x2
	mov	r1, x0
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	x5, x0
	jnz	rax, .LBB140_19
	jmp	.LBB140_12
.LBB140_12:
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483632
	mov	x5, x0
	jl	rax, r0, .LBB140_15
	jmp	.LBB140_13
.LBB140_13:                             // %.preheader12.preheader
	mov	x3, -2147483633
	mov	x5, x0
	jmp	.LBB140_16
.LBB140_14:
	mov	r0, 4
	jl	x1, r0, .LBB140_18
	jmp	.LBB140_15
.LBB140_15:                             // %.preheader66
	mov	x3, -2147483645
	jmp	.LBB140_17
.LBB140_16:                             // %.preheader12
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
	mov	r1, x2
add	r1, 4
	mov	[x5], r0
	mov	r0, [r1]
	mov	r1, x5
add	r1, 4
	mov	r2, x2
add	r2, 8
	mov	r3, x5
	mov	[r1], r0
	mov	r0, [r2]
add	r3, 8
	mov	r1, x2
add	r1, 12
	mov	r2, x5
add	r2, 12
	mov	[r3], r0
add	x2, 16
	mov	r0, [r1]
add	x5, 16
add	x1, -16
	mov	r1, -2147483648
	mov	[r2], r0
	mov	r0, x1
	call	__bit_xor
	jg	rax, x3, .LBB140_16
	jmp	.LBB140_14
.LBB140_17:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
add	x2, 4
	mov	[x5], r0
add	x1, -4
	mov	r1, -2147483648
add	x5, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x3, .LBB140_17
	jmp	.LBB140_18
.LBB140_18:                             // %.loopexit11
	jz	x1, .LBB140_21
	jmp	.LBB140_19
.LBB140_19:                             // %.preheader61
	mov	x6, x5
.LBB140_20:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
add	x1, -1
	mov	r1, 255
add	x2, 1
	call	__bit_and
	mov	r0, [x5]
	mov	x3, rax
	mov	r1, -256
add	x6, 1
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	mov	x5, x6
	jnz	x1, .LBB140_20
	jmp	.LBB140_21
.LBB140_21:                             // %.loopexit
	mov	rax, x0
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
// -- Begin function mempcpy
mempcpy:                                // @mempcpy
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x0, r1
	mov	r1, -2147483648
	mov	x2, r2
	mov	x1, r0
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB141_8
	jmp	.LBB141_1
.LBB141_1:
	mov	r0, x0
	mov	r1, x1
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB141_9
	jmp	.LBB141_2
.LBB141_2:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB141_5
	jmp	.LBB141_3
.LBB141_3:                              // %.preheader.preheader
	mov	x3, -2147483633
	jmp	.LBB141_6
.LBB141_4:
	mov	r0, 4
	jl	x2, r0, .LBB141_8
	jmp	.LBB141_5
.LBB141_5:                              // %.preheader35
	mov	x3, -2147483645
	jmp	.LBB141_7
.LBB141_6:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, x0
add	r1, 4
	mov	[x1], r0
	mov	r0, [r1]
	mov	r1, x1
add	r1, 4
	mov	r2, x0
add	r2, 8
	mov	r3, x1
	mov	[r1], r0
	mov	r0, [r2]
add	r3, 8
	mov	r1, x0
add	r1, 12
	mov	r2, x1
add	r2, 12
	mov	[r3], r0
add	x0, 16
	mov	r0, [r1]
add	x1, 16
add	x2, -16
	mov	r1, -2147483648
	mov	[r2], r0
	mov	r0, x2
	call	__bit_xor
	jg	rax, x3, .LBB141_6
	jmp	.LBB141_4
.LBB141_7:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
add	x0, 4
	mov	[x1], r0
add	x2, -4
	mov	r1, -2147483648
add	x1, 4
	mov	r0, x2
	call	__bit_xor
	jg	rax, x3, .LBB141_7
	jmp	.LBB141_8
.LBB141_8:                              // %.loopexit4
	jz	x2, .LBB141_11
	jmp	.LBB141_9
.LBB141_9:                              // %.preheader32
	mov	x5, x1
.LBB141_10:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
add	x2, -1
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x5]
	mov	x3, rax
	mov	r1, -256
add	x1, 1
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	mov	x5, x1
	jnz	x2, .LBB141_10
	jmp	.LBB141_11
.LBB141_11:                             // %.loopexit
	mov	rax, x1
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function memrchr
memrchr:                                // @memrchr
// %bb.0:
sub	rsp, 40
	mov	[rsp+36], x0
	mov	[rsp+32], x1
	mov	[rsp+28], x2
	mov	[rsp+24], x3
	mov	[rsp+20], x4
	mov	[rsp+16], x5
	mov	[rsp+12], x6
	mov	[rsp+8], x7
	mov	[rsp+4], x8
	mov	[rsp], x9
	mov	x2, r2
	mov	x0, r1
	mov	x3, r0
	mov	r0, x2
	add	r0, x3
	mov	r1, 3
	call	__bit_and
	mov	x1, x2
	sub	x1, rax
	mov	x5, 0
	mov	x7, x3
.LBB142_1:                              // =>This Inner Loop Header: Depth=1
	mov	x6, x3
	mov	r0, x2
	add	r0, x7
	mov	r1, 3
	add	x6, x2
	call	__bit_and
	jz	rax, .LBB142_4
	jmp	.LBB142_2
.LBB142_2:                              //   in Loop: Header=BB142_1 Depth=1
	mov	rax, 0
	je	x2, x5, .LBB142_16
	jmp	.LBB142_3
.LBB142_3:                              //   in Loop: Header=BB142_1 Depth=1
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
add	x6, -1
	mov	r0, [x6]
	mov	r1, 255
	mov	x4, rax
	call	__bit_and
add	x5, 1
add	x3, -1
add	x7, -1
	je	rax, x4, .LBB142_15
	jmp	.LBB142_1
.LBB142_4:
	mov	x4, x6
	mov	r1, -2147483648
add	x4, -1
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB142_11
	jmp	.LBB142_5
.LBB142_5:
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
	mov	x4, rax
	mul	x4, 16843009
	mov	x7, 0
	mov	x8, -2139062144
	mov	x9, -2147483645
.LBB142_6:                              // =>This Inner Loop Header: Depth=1
	mov	r0, x2
	add	r0, x7
	add	r0, x3
add	r0, -4
	mov	r0, [r0]
	mov	r1, x4
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x8, .LBB142_8
	jmp	.LBB142_7
.LBB142_7:                              //   in Loop: Header=BB142_6 Depth=1
add	x7, -4
	mov	x5, x1
	add	x5, x7
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	jg	rax, x9, .LBB142_6
	jmp	.LBB142_9
.LBB142_8:                              // %split
	add	x6, x7
	add	x1, x7
	mov	x4, x6
	jmp	.LBB142_10
.LBB142_9:                              // %._crit_edge
	add	x6, x7
	mov	x4, x6
	mov	x1, x5
.LBB142_10:
add	x4, -1
.LBB142_11:
	mov	rax, 0
	jz	x1, .LBB142_16
	jmp	.LBB142_12
.LBB142_12:                             // %.preheader.preheader
.LBB142_13:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
	mov	r0, [x4]
	mov	r1, 255
	mov	x2, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, x4
	je	r0, x2, .LBB142_16
	jmp	.LBB142_14
.LBB142_14:                             //   in Loop: Header=BB142_13 Depth=1
add	x1, -1
add	x4, -1
	mov	rax, 0
	jz	x1, .LBB142_16
	jmp	.LBB142_13
.LBB142_15:                             // %..loopexit.loopexit1_crit_edge
	add	x3, x2
	mov	rax, x3
.LBB142_16:                             // %.loopexit
	mov	x9, [rsp]
	mov	x8, [rsp+4]
	mov	x7, [rsp+8]
	mov	x6, [rsp+12]
	mov	x5, [rsp+16]
	mov	x4, [rsp+20]
	mov	x3, [rsp+24]
	mov	x2, [rsp+28]
	mov	x1, [rsp+32]
	mov	x0, [rsp+36]
add	rsp, 40
	ret
// -- End function
// -- Begin function memset
memset:                                 // @memset
// %bb.0:
sub	rsp, 36
	mov	[rsp+32], x0
	mov	[rsp+28], x1
	mov	[rsp+24], x2
	mov	[rsp+20], x3
	mov	[rsp+16], x4
	mov	[rsp+12], x5
	mov	[rsp+8], x6
	mov	[rsp+4], x7
	mov	[rsp], x8
	mov	x0, r1
	mov	r1, 255
	mov	x2, r2
	mov	x1, r0
	mov	r0, x0
	call	__bit_and
	mov	r1, 3
	mov	x3, rax
	mov	r0, x1
	call	__bit_and
	mov	x7, x1
	jz	rax, .LBB143_4
	jmp	.LBB143_1
.LBB143_1:
	mov	x4, x1
add	x4, 1
	mov	x8, x1
.LBB143_2:                              // =>This Inner Loop Header: Depth=1
	jz	x2, .LBB143_14
	jmp	.LBB143_3
.LBB143_3:                              //   in Loop: Header=BB143_2 Depth=1
	mov	x5, [x8]
add	x2, -1
	mov	x7, x8
	mov	r1, 255
add	x7, 1
	mov	r0, x0
	call	__bit_and
	mov	r1, -256
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x6
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	r1, 3
	mov	[x8], rax
	mov	r0, x4
	call	__bit_and
add	x4, 1
	mov	x8, x7
	jnz	rax, .LBB143_2
	jmp	.LBB143_4
.LBB143_4:                              // %.loopexit7
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB143_11
	jmp	.LBB143_5
.LBB143_5:
	mov	r1, -2147483648
	mul	x3, 16843009
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB143_8
	jmp	.LBB143_6
.LBB143_6:                              // %.preheader.preheader
	mov	x4, -2147483633
	jmp	.LBB143_9
.LBB143_7:
	mov	r0, 4
	jl	x2, r0, .LBB143_11
	jmp	.LBB143_8
.LBB143_8:                              // %.preheader35
	mov	x4, -2147483645
	jmp	.LBB143_10
.LBB143_9:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x7
add	r0, 4
	mov	[x7], x3
	mov	r1, x7
add	r1, 8
	mov	[r0], x3
	mov	r0, x7
add	r0, 12
	mov	[r1], x3
add	x7, 16
add	x2, -16
	mov	r1, -2147483648
	mov	[r0], x3
	mov	r0, x2
	call	__bit_xor
	jg	rax, x4, .LBB143_9
	jmp	.LBB143_7
.LBB143_10:                             // =>This Inner Loop Header: Depth=1
	mov	[x7], x3
add	x2, -4
	mov	r1, -2147483648
add	x7, 4
	mov	r0, x2
	call	__bit_xor
	jg	rax, x4, .LBB143_10
	jmp	.LBB143_11
.LBB143_11:                             // %.loopexit5
	jz	x2, .LBB143_14
	jmp	.LBB143_12
.LBB143_12:
	mov	x5, x7
.LBB143_13:                             // =>This Inner Loop Header: Depth=1
	mov	x3, [x7]
add	x2, -1
	mov	r1, 255
add	x5, 1
	mov	r0, x0
	call	__bit_and
	mov	r1, -256
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mov	x7, x5
	jnz	x2, .LBB143_13
	jmp	.LBB143_14
.LBB143_14:                             // %.loopexit
	mov	rax, x1
	mov	x8, [rsp]
	mov	x7, [rsp+4]
	mov	x6, [rsp+8]
	mov	x5, [rsp+12]
	mov	x4, [rsp+16]
	mov	x3, [rsp+20]
	mov	x2, [rsp+24]
	mov	x1, [rsp+28]
	mov	x0, [rsp+32]
add	rsp, 36
	ret
// -- End function
// -- Begin function rawmemchr
rawmemchr:                              // @rawmemchr
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r1
	mov	r1, 3
	mov	x1, r0
	call	__bit_and
	jz	rax, .LBB144_4
	jmp	.LBB144_1
.LBB144_1:
	mov	x2, x1
add	x2, 1
.LBB144_2:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
	mov	r0, [x1]
	mov	r1, 255
	mov	x3, rax
	call	__bit_and
	je	rax, x3, .LBB144_8
	jmp	.LBB144_3
.LBB144_3:                              //   in Loop: Header=BB144_2 Depth=1
	mov	r1, 3
add	x1, 1
	mov	r0, x2
	call	__bit_and
add	x2, 1
	jnz	rax, .LBB144_2
	jmp	.LBB144_4
.LBB144_4:                              // %.loopexit2
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
	mov	x2, rax
	mul	x2, 16843009
add	x1, -5
	mov	x3, -2139062144
.LBB144_5:                              // =>This Inner Loop Header: Depth=1
	mov	r0, x1
add	r0, 5
	mov	r0, [r0]
	mov	r1, x2
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x1, 4
	je	rax, x3, .LBB144_5
	jmp	.LBB144_6
.LBB144_6:
.LBB144_7:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	mov	x2, rax
	call	__bit_and
	jne	rax, x2, .LBB144_7
	jmp	.LBB144_8
.LBB144_8:                              // %.loopexit
	mov	rax, x1
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function rindex
rindex:                                 // @rindex
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
	mov	x2, r1
	mov	r1, 255
	mov	x1, r0
	mov	r0, x2
	call	__bit_and
	mov	x3, rax
	jz	x3, .LBB145_16
	jmp	.LBB145_1
.LBB145_1:                              // %.preheader.split.preheader.i
	mul	x3, 16843009
	mov	x0, 0
	mov	x7, -2139062144
.LBB145_2:                              // %.preheader.split.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB145_6 Depth 2
                                        //     Child Loop BB145_9 Depth 2
                                        //     Child Loop BB145_12 Depth 2
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	jz	rax, .LBB145_4
	jmp	.LBB145_3
.LBB145_3:                              // %.preheader29.i.preheader
                                        //   in Loop: Header=BB145_2 Depth=1
	mov	x4, x1
add	x4, 1
	jmp	.LBB145_6
.LBB145_4:                              // %.loopexit9.i.i
                                        //   in Loop: Header=BB145_2 Depth=1
	mov	x4, [x1]
	mov	r0, 16843008
	sub	r0, x4
	mov	r1, x4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x7, .LBB145_11
	jmp	.LBB145_5
.LBB145_5:                              // %.preheader5.i.i.preheader
                                        //   in Loop: Header=BB145_2 Depth=1
	jmp	.LBB145_9
.LBB145_6:                              // %.preheader29.i
                                        //   Parent Loop BB145_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x5, rax
	jz	x5, .LBB145_24
	jmp	.LBB145_7
.LBB145_7:                              //   in Loop: Header=BB145_6 Depth=2
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	je	rax, x6, .LBB145_15
	jmp	.LBB145_8
.LBB145_8:                              //   in Loop: Header=BB145_6 Depth=2
	mov	r1, 3
add	x1, 1
	mov	r0, x4
	call	__bit_and
add	x4, 1
	jz	rax, .LBB145_4
	jmp	.LBB145_6
.LBB145_9:                              // %.preheader5.i.i
                                        //   Parent Loop BB145_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x4
	mov	r1, x3
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x7, .LBB145_11
	jmp	.LBB145_10
.LBB145_10:                             //   in Loop: Header=BB145_9 Depth=2
add	x1, 4
	mov	x4, [x1]
	mov	r0, 16843008
	sub	r0, x4
	mov	r1, x4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x7, .LBB145_9
	jmp	.LBB145_11
.LBB145_11:                             // %.loopexit6.i.i.preheader
                                        //   in Loop: Header=BB145_2 Depth=1
add	x1, -1
.LBB145_12:                             // %.loopexit6.i.i
                                        //   Parent Loop BB145_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	jz	x4, .LBB145_14
	jmp	.LBB145_13
.LBB145_13:                             // %.loopexit6.i.i
                                        //   in Loop: Header=BB145_12 Depth=2
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	jne	rax, x5, .LBB145_12
	jmp	.LBB145_14
.LBB145_14:                             //   in Loop: Header=BB145_2 Depth=1
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	jne	rax, x5, .LBB145_24
	jmp	.LBB145_15
.LBB145_15:                             // %strchr.exit.i
                                        //   in Loop: Header=BB145_2 Depth=1
	mov	r0, x1
add	r0, 1
	mov	x0, x1
	mov	x1, r0
	jmp	.LBB145_2
.LBB145_16:
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	x0, x1
	jz	rax, .LBB145_20
	jmp	.LBB145_17
.LBB145_17:                             // %.preheader2.i1.i.preheader
	mov	x2, x1
add	x2, 1
	mov	x0, x1
.LBB145_18:                             // %.preheader2.i1.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB145_24
	jmp	.LBB145_19
.LBB145_19:                             //   in Loop: Header=BB145_18 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x2
	call	__bit_and
add	x2, 1
	jnz	rax, .LBB145_18
	jmp	.LBB145_20
.LBB145_20:                             // %.loopexit4.i2.i.preheader
add	x0, -5
	mov	x1, -2139062144
.LBB145_21:                             // %.loopexit4.i2.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x0
add	r0, 5
	mov	r1, [r0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x0, 4
	je	rax, x1, .LBB145_21
	jmp	.LBB145_22
.LBB145_22:                             // %.preheader.i3.i.preheader
.LBB145_23:                             // %.preheader.i3.i
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB145_23
	jmp	.LBB145_24
.LBB145_24:                             // %strrchr.exit
	mov	rax, x0
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
// -- Begin function stpcpy
stpcpy:                                 // @stpcpy
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x1, r1
	mov	x0, r0
	mov	r0, x1
	mov	r1, x0
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB146_4
	jmp	.LBB146_1
.LBB146_1:
	mov	x2, [x1]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	x3, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x3, .LBB146_4
	jmp	.LBB146_2
.LBB146_2:                              // %.preheader.preheader
.LBB146_3:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	x1, 4
	mov	[x0], x2
	mov	x2, [x1]
	mov	r0, 16843008
	sub	r0, x2
add	x0, 4
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x3, .LBB146_3
	jmp	.LBB146_4
.LBB146_4:                              // %.loopexit.preheader
add	x0, -1
.LBB146_5:                              // %.loopexit
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
add	x0, 1
	mov	r1, 255
add	x1, 1
	call	__bit_and
	mov	r0, [x0]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
	jnz	x2, .LBB146_5
	jmp	.LBB146_6
.LBB146_6:
	mov	rax, x0
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function stpncpy
stpncpy:                                // @stpncpy
// %bb.0:
sub	rsp, 28
	mov	[rsp+24], x0
	mov	[rsp+20], x1
	mov	[rsp+16], x2
	mov	[rsp+12], x3
	mov	[rsp+8], x4
	mov	[rsp+4], x5
	mov	[rsp], x6
	mov	x1, r2
	mov	x2, r1
	mov	x0, r0
	mov	r0, x2
	mov	r1, x0
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB147_5
	jmp	.LBB147_1
.LBB147_1:
	jnz	x3, .LBB147_5
	jmp	.LBB147_2
.LBB147_2:                              // %.preheader5.preheader
	mov	x4, -2139062144
	mov	x5, -2147483645
.LBB147_3:                              // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	x3, [x2]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB147_5
	jmp	.LBB147_4
.LBB147_4:                              //   in Loop: Header=BB147_3 Depth=1
add	x1, -4
add	x2, 4
	mov	[x0], x3
	mov	r1, -2147483648
add	x0, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x5, .LBB147_3
	jmp	.LBB147_5
.LBB147_5:                              // %.loopexit6.preheader
	mov	x5, 0
.LBB147_6:                              // %.loopexit6
                                        // =>This Inner Loop Header: Depth=1
	je	x1, x5, .LBB147_12
	jmp	.LBB147_7
.LBB147_7:                              //   in Loop: Header=BB147_6 Depth=1
	mov	r0, x2
	add	r0, x5
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x6, x0
	add	x6, x5
	mov	r0, [x6]
	mov	r1, -256
	mov	x3, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x6], rax
add	x5, 1
	jnz	x3, .LBB147_6
	jmp	.LBB147_8
.LBB147_8:
	mov	x3, x0
	add	x3, x5
	mov	x2, x3
add	x2, -1
	je	x1, x5, .LBB147_13
	jmp	.LBB147_9
.LBB147_9:                              // %.preheader.preheader
	sub	x1, x5
	mov	x3, 0
.LBB147_10:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	x4, x0
	add	x4, x3
	add	x4, x5
	mov	r0, [x4]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
add	x3, 1
	mov	[x4], rax
	jne	x1, x3, .LBB147_10
	jmp	.LBB147_11
.LBB147_11:                             // %.loopexit.loopexit
	add	x0, x5
	add	x0, x3
	mov	x3, x0
	jmp	.LBB147_13
.LBB147_12:                             // %.loopexit.loopexit1
	add	x0, x5
	mov	x2, 0
	mov	x3, x0
.LBB147_13:                             // %.loopexit
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
	sub	x3, x2
add	rax, 1
	mov	r0, rax
	mov	r1, x3
	call	__bit_and
	add	rax, x2
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
// -- Begin function strcat
strcat:                                 // @strcat
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x0, r1
	mov	r1, 3
	mov	x1, r0
	call	__bit_and
	mov	x2, x1
	jz	rax, .LBB148_4
	jmp	.LBB148_1
.LBB148_1:                              // %.preheader2.preheader
	mov	x3, x1
add	x3, 1
	mov	x2, x1
.LBB148_2:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB148_9
	jmp	.LBB148_3
.LBB148_3:                              //   in Loop: Header=BB148_2 Depth=1
	mov	r1, 3
add	x2, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
	jnz	rax, .LBB148_2
	jmp	.LBB148_4
.LBB148_4:                              // %.loopexit4
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB148_9
	jmp	.LBB148_5
.LBB148_5:                              // %.preheader1.preheader
add	x2, -5
	mov	x3, -2139062144
.LBB148_6:                              // %.preheader1
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x2
add	r0, 5
	mov	r1, [r0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x2, 4
	je	rax, x3, .LBB148_6
	jmp	.LBB148_7
.LBB148_7:                              // %.preheader.preheader
.LBB148_8:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB148_8
	jmp	.LBB148_9
.LBB148_9:                              // %.loopexit
	mov	r0, x2
	mov	r1, x0
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB148_13
	jmp	.LBB148_10
.LBB148_10:
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	x4, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB148_13
	jmp	.LBB148_11
.LBB148_11:                             // %.preheader.i.preheader
.LBB148_12:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
add	x0, 4
	mov	[x2], x3
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
add	x2, 4
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x4, .LBB148_12
	jmp	.LBB148_13
.LBB148_13:                             // %.loopexit.i.preheader
	mov	x5, x2
.LBB148_14:                             // %.loopexit.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x2]
	mov	x3, rax
	mov	r1, -256
add	x5, 1
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x2], rax
	mov	x2, x5
	jnz	x3, .LBB148_14
	jmp	.LBB148_15
.LBB148_15:                             // %strcpy.exit
	mov	rax, x1
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function strchr
strchr:                                 // @strchr
// %bb.0:
sub	rsp, 28
	mov	[rsp+24], x0
	mov	[rsp+20], x1
	mov	[rsp+16], x2
	mov	[rsp+12], x3
	mov	[rsp+8], x4
	mov	[rsp+4], x5
	mov	[rsp], x6
	mov	x1, r1
	mov	r1, 255
	mov	x0, r0
	mov	r0, x1
	call	__bit_and
	mov	r1, 3
	mov	x2, rax
	mov	r0, x0
	call	__bit_and
	jz	x2, .LBB149_3
	jmp	.LBB149_1
.LBB149_1:
	jz	rax, .LBB149_11
	jmp	.LBB149_2
.LBB149_2:
	mov	x4, x0
add	x4, 1
	jmp	.LBB149_13
.LBB149_3:
	mov	x3, x0
	jz	rax, .LBB149_7
	jmp	.LBB149_4
.LBB149_4:                              // %.preheader2.preheader
	mov	x1, x0
add	x1, 1
	mov	x3, x0
.LBB149_5:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB149_22
	jmp	.LBB149_6
.LBB149_6:                              //   in Loop: Header=BB149_5 Depth=1
	mov	r1, 3
add	x3, 1
	mov	r0, x1
	call	__bit_and
add	x1, 1
	jnz	rax, .LBB149_5
	jmp	.LBB149_7
.LBB149_7:                              // %.loopexit4.preheader
add	x3, -5
	mov	x0, -2139062144
.LBB149_8:                              // %.loopexit4
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
add	r0, 5
	mov	r1, [r0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x3, 4
	je	rax, x0, .LBB149_8
	jmp	.LBB149_9
.LBB149_9:                              // %.preheader.preheader
.LBB149_10:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	x3, 1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB149_22
	jmp	.LBB149_10
.LBB149_11:                             // %.loopexit9
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	x4, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB149_18
	jmp	.LBB149_12
.LBB149_12:                             // %.preheader5.preheader
	mul	x2, 16843009
	jmp	.LBB149_16
.LBB149_13:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x5, rax
	mov	x3, 0
	jz	x5, .LBB149_22
	jmp	.LBB149_14
.LBB149_14:                             //   in Loop: Header=BB149_13 Depth=1
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	x3, x0
	je	rax, x6, .LBB149_22
	jmp	.LBB149_15
.LBB149_15:                             //   in Loop: Header=BB149_13 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x4
	call	__bit_and
add	x4, 1
	jz	rax, .LBB149_11
	jmp	.LBB149_13
.LBB149_16:                             // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
	mov	r1, x2
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB149_18
	jmp	.LBB149_17
.LBB149_17:                             //   in Loop: Header=BB149_16 Depth=1
add	x0, 4
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x4, .LBB149_16
	jmp	.LBB149_18
.LBB149_18:                             // %.loopexit6
add	x0, -1
.LBB149_19:                             // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
	jz	x2, .LBB149_21
	jmp	.LBB149_20
.LBB149_20:                             //   in Loop: Header=BB149_19 Depth=1
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	jne	rax, x3, .LBB149_19
	jmp	.LBB149_21
.LBB149_21:
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	r1, x1
	call	__bit_xor
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
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x3, rax
.LBB149_22:                             // %.loopexit
	mov	rax, x3
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
// -- Begin function strchrnul
strchrnul:                              // @strchrnul
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
	mov	x3, r1
	mov	r1, 255
	mov	x1, r0
	mov	r0, x3
	call	__bit_and
	mov	r1, 3
	mov	x4, rax
	mov	r0, x1
	call	__bit_and
	mov	x2, rax
	jz	x4, .LBB150_3
	jmp	.LBB150_1
.LBB150_1:
	mov	x0, x1
	jz	x2, .LBB150_11
	jmp	.LBB150_2
.LBB150_2:
	mov	x5, x1
add	x5, 1
	mov	x0, x1
	jmp	.LBB150_13
.LBB150_3:
	mov	x0, x1
	jz	x2, .LBB150_7
	jmp	.LBB150_4
.LBB150_4:                              // %.preheader2.i.preheader
	mov	x2, x1
add	x2, 1
	mov	x0, x1
.LBB150_5:                              // %.preheader2.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB150_32
	jmp	.LBB150_6
.LBB150_6:                              //   in Loop: Header=BB150_5 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x2
	call	__bit_and
add	x2, 1
	jnz	rax, .LBB150_5
	jmp	.LBB150_7
.LBB150_7:                              // %.loopexit4.i.preheader
add	x0, -5
	mov	x1, -2139062144
.LBB150_8:                              // %.loopexit4.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x0
add	r0, 5
	mov	r1, [r0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x0, 4
	je	rax, x1, .LBB150_8
	jmp	.LBB150_9
.LBB150_9:                              // %.preheader.i.preheader
.LBB150_10:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB150_32
	jmp	.LBB150_10
.LBB150_11:                             // %.loopexit9.i
	mov	x5, [x0]
	mov	r0, 16843008
	sub	r0, x5
	mov	r1, x5
	call	__bit_or
	mov	r1, -2139062144
	mov	x6, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x6, .LBB150_18
	jmp	.LBB150_12
.LBB150_12:                             // %.preheader5.i.preheader
	mul	x4, 16843009
	jmp	.LBB150_16
.LBB150_13:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x6, rax
	jz	x6, .LBB150_22
	jmp	.LBB150_14
.LBB150_14:                             //   in Loop: Header=BB150_13 Depth=1
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	je	rax, x7, .LBB150_32
	jmp	.LBB150_15
.LBB150_15:                             //   in Loop: Header=BB150_13 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x5
	call	__bit_and
add	x5, 1
	jz	rax, .LBB150_11
	jmp	.LBB150_13
.LBB150_16:                             // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x5
	mov	r1, x4
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x6, .LBB150_18
	jmp	.LBB150_17
.LBB150_17:                             //   in Loop: Header=BB150_16 Depth=1
add	x0, 4
	mov	x5, [x0]
	mov	r0, 16843008
	sub	r0, x5
	mov	r1, x5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x6, .LBB150_16
	jmp	.LBB150_18
.LBB150_18:                             // %.loopexit6.i
add	x0, -1
.LBB150_19:                             // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	jz	x4, .LBB150_21
	jmp	.LBB150_20
.LBB150_20:                             //   in Loop: Header=BB150_19 Depth=1
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	jne	rax, x5, .LBB150_19
	jmp	.LBB150_21
.LBB150_21:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x4
	call	__bit_and
	je	rax, x3, .LBB150_32
	jmp	.LBB150_22
.LBB150_22:                             // %strchr.exit
	jz	x2, .LBB150_27
	jmp	.LBB150_23
.LBB150_23:
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x0, x1
	jz	rax, .LBB150_31
	jmp	.LBB150_24
.LBB150_24:                             // %.preheader1.i.preheader
	mov	r0, x1
add	r0, 1
	mov	x0, x1
	mov	x1, r0
	jmp	.LBB150_26
.LBB150_25:                             //   in Loop: Header=BB150_26 Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB150_31
	jmp	.LBB150_26
.LBB150_26:                             // %.preheader1.i
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r1, 3
	mov	r0, x0
	call	__bit_and
	jnz	rax, .LBB150_25
	jmp	.LBB150_27
.LBB150_27:                             // %.loopexit.i.preheader
	mov	x2, x1
add	x2, -1
	mov	x3, -2139062144
.LBB150_28:                             // %.loopexit.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [x1]
	mov	r0, 16843008
	sub	r0, r1
	mov	x0, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x1, 4
add	x2, 4
	je	rax, x3, .LBB150_28
	jmp	.LBB150_29
.LBB150_29:                             // %.preheader.i1.preheader
	mov	x2, -4
.LBB150_30:                             // %.preheader.i1
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x1
	add	r0, x2
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x0, 1
add	x2, 1
	jnz	rax, .LBB150_30
	jmp	.LBB150_31
.LBB150_31:                             // %strlen.exit
.LBB150_32:                             // %strchr.exit.thread
	mov	rax, x0
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
// -- Begin function strcmp
strcmp:                                 // @strcmp
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x0, r1
	mov	x1, r0
	mov	r0, x0
	mov	r1, x1
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB151_2
	jmp	.LBB151_1
.LBB151_1:
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
	jmp	.LBB151_7
.LBB151_2:
	mov	x2, [x1]
	mov	r0, [x0]
	jne	x2, r0, .LBB151_7
	jmp	.LBB151_3
.LBB151_3:                              // %.preheader5.preheader
	mov	x4, -2139062144
	mov	x3, 0
.LBB151_4:                              // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB151_13
	jmp	.LBB151_5
.LBB151_5:                              //   in Loop: Header=BB151_4 Depth=1
add	x1, 4
add	x0, 4
	mov	x2, [x1]
	mov	r0, [x0]
	je	x2, r0, .LBB151_4
	jmp	.LBB151_6
.LBB151_6:
.LBB151_7:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	x3, 0
	jz	rax, .LBB151_12
	jmp	.LBB151_8
.LBB151_8:                              // %.preheader.preheader
add	x1, 1
.LBB151_9:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, x2
	jne	rax, x3, .LBB151_11
	jmp	.LBB151_10
.LBB151_10:                             //   in Loop: Header=BB151_9 Depth=1
	mov	r0, [x1]
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	x2, rax
add	x1, 1
	mov	r0, 0
	jnz	x2, .LBB151_9
	jmp	.LBB151_11
.LBB151_11:
	mov	r1, 255
	call	__bit_and
	mov	x3, rax
.LBB151_12:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	sub	x3, rax
.LBB151_13:                             // %.loopexit
	mov	rax, x3
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function strcpy
strcpy:                                 // @strcpy
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x1, r1
	mov	x0, r0
	mov	r0, x1
	mov	r1, x0
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	x4, x0
	jnz	rax, .LBB152_4
	jmp	.LBB152_1
.LBB152_1:
	mov	x2, [x1]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	x3, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	x4, x0
	jne	rax, x3, .LBB152_4
	jmp	.LBB152_2
.LBB152_2:                              // %.preheader.preheader
	mov	x4, x0
.LBB152_3:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	x1, 4
	mov	[x4], x2
	mov	x2, [x1]
	mov	r0, 16843008
	sub	r0, x2
add	x4, 4
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x3, .LBB152_3
	jmp	.LBB152_4
.LBB152_4:                              // %.loopexit.preheader
	mov	x5, x4
.LBB152_5:                              // %.loopexit
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
	mov	r1, 255
add	x1, 1
	call	__bit_and
	mov	r0, [x4]
	mov	x2, rax
	mov	r1, -256
add	x5, 1
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x4], rax
	mov	x4, x5
	jnz	x2, .LBB152_5
	jmp	.LBB152_6
.LBB152_6:
	mov	rax, x0
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function strcspn
strcspn:                                // @strcspn
// %bb.0:
sub	rsp, 28
	mov	[rsp+24], x0
	mov	[rsp+20], x1
	mov	[rsp+16], x2
	mov	[rsp+12], x3
	mov	[rsp+8], x4
	mov	[rsp+4], x5
	mov	[rsp], x6
	mov	x0, r0
	mov	r0, [x0]
	mov	x1, r1
	mov	r1, 255
	call	__bit_and
	mov	x3, rax
	mov	x2, x0
	jz	x3, .LBB153_9
	jmp	.LBB153_1
.LBB153_1:
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	jz	x4, .LBB153_3
	jmp	.LBB153_2
.LBB153_2:                              // %.preheader4.preheader
add	x1, 1
	mov	x2, x0
	jmp	.LBB153_5
.LBB153_3:                              // %.preheader.preheader
	mov	x2, x0
.LBB153_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB153_9
	jmp	.LBB153_4
.LBB153_5:                              // %.preheader4
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB153_7 Depth 2
	mov	x6, x1
	mov	rax, x4
	jmp	.LBB153_7
.LBB153_6:                              //   in Loop: Header=BB153_7 Depth=2
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
add	x6, 1
	jz	rax, .LBB153_8
	jmp	.LBB153_7
.LBB153_7:                              //   Parent Loop BB153_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x3
	call	__bit_and
	je	rax, x5, .LBB153_9
	jmp	.LBB153_6
.LBB153_8:                              //   in Loop: Header=BB153_5 Depth=1
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	x3, rax
	jnz	x3, .LBB153_5
	jmp	.LBB153_9
.LBB153_9:                              // %.loopexit
	sub	x2, x0
	mov	rax, x2
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
// -- Begin function strdup
strdup:                                 // @strdup
// %bb.0:
sub	rsp, 56
	mov	[rsp+52], x0
	mov	[rsp+48], x1
	mov	[rsp+44], x2
	mov	[rsp+40], x3
	mov	[rsp+36], x4
	mov	[rsp+32], x5
	mov	[rsp+28], x6
	mov	[rsp+24], x7
	mov	[rsp+20], x8
	mov	[rsp+16], x9
	mov	[rsp+12], x10
	mov	[rsp+8], x11
	mov	[rsp+4], x12
	mov	[rsp], x13
	mov	r1, 3
	mov	x0, r0
	call	__bit_and
	mov	x1, x0
	jz	rax, .LBB154_5
	jmp	.LBB154_1
.LBB154_1:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x3, x0
	jz	rax, .LBB154_9
	jmp	.LBB154_2
.LBB154_2:                              // %.preheader1.i.preheader
	mov	x1, x0
add	x1, 1
	mov	x3, x0
	jmp	.LBB154_4
.LBB154_3:                              //   in Loop: Header=BB154_4 Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB154_9
	jmp	.LBB154_4
.LBB154_4:                              // %.preheader1.i
                                        // =>This Inner Loop Header: Depth=1
add	x3, 1
	mov	r1, 3
	mov	r0, x3
	call	__bit_and
	jnz	rax, .LBB154_3
	jmp	.LBB154_5
.LBB154_5:                              // %.loopexit.i.preheader
	mov	x2, x1
add	x2, -1
	mov	x4, -2139062144
.LBB154_6:                              // %.loopexit.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [x1]
	mov	r0, 16843008
	sub	r0, r1
	mov	x3, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x1, 4
add	x2, 4
	je	rax, x4, .LBB154_6
	jmp	.LBB154_7
.LBB154_7:                              // %.preheader.i.preheader
	mov	x2, -4
.LBB154_8:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x1
	add	r0, x2
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x3, 1
add	x2, 1
	jnz	rax, .LBB154_8
	jmp	.LBB154_9
.LBB154_9:                              // %strlen.exit
	sub	x3, x0
add	x3, 1
	mov	r0, x3
	call	malloc
	mov	x1, rax
	jz	x1, .LBB154_26
	jmp	.LBB154_10
.LBB154_10:
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r0, -2147483632
	mov	x6, x1
	jl	rax, r0, .LBB154_23
	jmp	.LBB154_11
.LBB154_11:
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	x2, rax
	mov	x7, 8
	sub	x7, x2
	mov	x10, 0
	mov	x4, x0
.LBB154_12:                             // =>This Inner Loop Header: Depth=1
	mov	r0, x0
	add	r0, x10
	mov	r0, [r0]
	mov	x8, x1
	mov	r1, 255
	add	x8, x10
	call	__bit_and
	mov	r0, [x8]
	mov	r1, -256
	mov	x5, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x8], rax
add	x10, 1
add	x4, 1
	jne	x7, x10, .LBB154_12
	jmp	.LBB154_13
.LBB154_13:
	mov	r1, -8
	mov	r0, x2
	call	__bit_or
	mov	x2, rax
	mov	x5, x0
	add	x5, x10
	mov	r1, 3
	add	x2, x3
	mov	r0, x5
	call	__bit_and
	jnz	rax, .LBB154_20
	jmp	.LBB154_14
.LBB154_14:
	mov	x6, x1
	mov	r1, -2147483648
	add	x6, x10
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB154_16
	jmp	.LBB154_15
.LBB154_15:                             // %.preheader.i2.preheader
	mov	x6, x1
	add	x6, x10
	add	x0, x10
	mov	x3, 0
	mov	x4, -2147483633
	jmp	.LBB154_18
.LBB154_16:                             // %.preheader77
	mov	x4, -2147483645
	mov	x3, x2
	mov	x0, x5
	jmp	.LBB154_19
.LBB154_17:
	add	x0, x3
	mov	r0, 3
	add	x6, x3
	mov	x5, x0
	mov	x3, x2
	jg	x2, r0, .LBB154_16
	jmp	.LBB154_23
.LBB154_18:                             // %.preheader.i2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x0
	add	r0, x3
	mov	r1, [r0]
	mov	r2, x6
	add	r2, x3
	mov	[r2], r1
	mov	r1, r0
add	r1, 4
	mov	r1, [r1]
	mov	r3, r2
add	r3, 4
	mov	[r3], r1
	mov	r1, r0
add	r1, 8
	mov	r1, [r1]
	mov	r3, r2
add	r3, 8
	mov	[r3], r1
add	r0, 12
	mov	r0, [r0]
add	r2, 12
	mov	[r2], r0
add	x2, -16
	mov	r1, -2147483648
add	x3, 16
	mov	r0, x2
	call	__bit_xor
	jg	rax, x4, .LBB154_18
	jmp	.LBB154_17
.LBB154_19:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
add	x0, 4
	mov	[x6], r0
add	x3, -4
	mov	r1, -2147483648
add	x6, 4
	mov	r0, x3
	call	__bit_xor
	jg	rax, x4, .LBB154_19
	jmp	.LBB154_23
.LBB154_20:
	mov	r1, 3
	mov	r0, rax
	mov	x7, rax
	call	__bit_shl
	mov	x3, rax
	mov	x6, 8
	mov	r1, 3
	sub	x6, x7
	mov	r0, x4
	call	__bit_and
	mov	x12, x0
	sub	x12, rax
	mov	r0, x12
	add	r0, x10
	mov	x7, [r0]
add	x12, 4
	mov	x11, 0
.LBB154_21:                             // =>This Inner Loop Header: Depth=1
	mov	x13, x1
	mov	r0, x10
	add	r0, x11
	add	r0, x12
	mov	x8, [r0]
	add	x13, x11
	mov	r1, 31
	add	x13, x10
	mov	r0, x3
	call	__bit_and
	mov	r0, x7
	mov	r1, rax
	call	__bit_shr
	mov	x7, rax
	mov	r0, x3
	call	__bit_not
	mov	r1, 31
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
	mov	x9, rax
	mov	r0, x8
	call	__bit_shl
	mov	r0, rax
	mov	r1, x9
	call	__bit_shl
	mov	r0, rax
	mov	r1, x7
	call	__bit_or
	mov	[x13], rax
add	x2, -4
	mov	r1, -2147483648
add	x11, 4
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x2
	call	__bit_xor
	mov	x7, x8
	jge	rax, x9, .LBB154_21
	jmp	.LBB154_22
.LBB154_22:
	mov	r1, -4
	mov	r0, x5
	call	__bit_or
	mov	x3, rax
	mov	r1, 3
	add	x3, x11
	mov	r0, x4
	call	__bit_and
	sub	x0, rax
	add	x0, x3
	add	x0, x10
add	x0, 4
	mov	x6, x1
	add	x6, x10
	add	x6, x11
	jmp	.LBB154_24
.LBB154_23:                             // %.loopexit8.i
	mov	x2, x3
	jz	x3, .LBB154_26
	jmp	.LBB154_24
.LBB154_24:                             // %.preheader
	mov	x5, x6
.LBB154_25:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
add	x2, -1
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x6]
	mov	x3, rax
	mov	r1, -256
add	x5, 1
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x6], rax
	mov	x6, x5
	jnz	x2, .LBB154_25
	jmp	.LBB154_26
.LBB154_26:                             // %memcpy.exit
	mov	rax, x1
	mov	x13, [rsp]
	mov	x12, [rsp+4]
	mov	x11, [rsp+8]
	mov	x10, [rsp+12]
	mov	x9, [rsp+16]
	mov	x8, [rsp+20]
	mov	x7, [rsp+24]
	mov	x6, [rsp+28]
	mov	x5, [rsp+32]
	mov	x4, [rsp+36]
	mov	x3, [rsp+40]
	mov	x2, [rsp+44]
	mov	x1, [rsp+48]
	mov	x0, [rsp+52]
add	rsp, 56
	ret
// -- End function
// -- Begin function strlen
strlen:                                 // @strlen
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	r1, 3
	mov	x0, r0
	call	__bit_and
	mov	x2, x0
	jz	rax, .LBB155_5
	jmp	.LBB155_1
.LBB155_1:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x1, x0
	jz	rax, .LBB155_9
	jmp	.LBB155_2
.LBB155_2:                              // %.preheader1.preheader
	mov	x2, x0
add	x2, 1
	mov	x1, x0
	jmp	.LBB155_4
.LBB155_3:                              //   in Loop: Header=BB155_4 Depth=1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
add	x2, 1
	jz	rax, .LBB155_9
	jmp	.LBB155_4
.LBB155_4:                              // %.preheader1
                                        // =>This Inner Loop Header: Depth=1
add	x1, 1
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	jnz	rax, .LBB155_3
	jmp	.LBB155_5
.LBB155_5:                              // %.loopexit.preheader
	mov	x3, x2
add	x3, -1
	mov	x4, -2139062144
.LBB155_6:                              // %.loopexit
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [x2]
	mov	r0, 16843008
	sub	r0, r1
	mov	x1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x2, 4
add	x3, 4
	je	rax, x4, .LBB155_6
	jmp	.LBB155_7
.LBB155_7:                              // %.preheader.preheader
	mov	x3, -4
.LBB155_8:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x2
	add	r0, x3
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x1, 1
add	x3, 1
	jnz	rax, .LBB155_8
	jmp	.LBB155_9
.LBB155_9:                              // %.loopexit2
	sub	x1, x0
	mov	rax, x1
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function strncat
strncat:                                // @strncat
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x1, r1
	mov	r1, 3
	mov	x2, r2
	mov	x0, r0
	call	__bit_and
	mov	x5, x0
	jz	rax, .LBB156_4
	jmp	.LBB156_1
.LBB156_1:                              // %.preheader5.preheader
	mov	x3, x0
add	x3, 1
	mov	x5, x0
.LBB156_2:                              // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB156_9
	jmp	.LBB156_3
.LBB156_3:                              //   in Loop: Header=BB156_2 Depth=1
	mov	r1, 3
add	x5, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
	jnz	rax, .LBB156_2
	jmp	.LBB156_4
.LBB156_4:                              // %.loopexit7
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB156_9
	jmp	.LBB156_5
.LBB156_5:                              // %.preheader4.preheader
add	x5, -5
	mov	x3, -2139062144
.LBB156_6:                              // %.preheader4
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x5
add	r0, 5
	mov	r1, [r0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x5, 4
	je	rax, x3, .LBB156_6
	jmp	.LBB156_7
.LBB156_7:                              // %.preheader2.preheader
.LBB156_8:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
add	x5, 1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB156_8
	jmp	.LBB156_9
.LBB156_9:                              // %.loopexit3
	jz	x2, .LBB156_14
	jmp	.LBB156_10
.LBB156_10:                             // %.preheader.preheader
.LBB156_11:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x5]
	mov	r1, -256
	mov	x3, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	jz	x3, .LBB156_14
	jmp	.LBB156_12
.LBB156_12:                             //   in Loop: Header=BB156_11 Depth=1
add	x5, 1
add	x2, -1
add	x1, 1
	jnz	x2, .LBB156_11
	jmp	.LBB156_13
.LBB156_13:
	mov	r0, [x5]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x5], rax
.LBB156_14:                             // %.loopexit
	mov	rax, x0
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function strncmp
strncmp:                                // @strncmp
// %bb.0:
sub	rsp, 28
	mov	[rsp+24], x0
	mov	[rsp+20], x1
	mov	[rsp+16], x2
	mov	[rsp+12], x3
	mov	[rsp+8], x4
	mov	[rsp+4], x5
	mov	[rsp], x6
	mov	x1, r2
	mov	x2, r1
	mov	x3, r0
	mov	x0, 0
	jz	x1, .LBB157_14
	jmp	.LBB157_1
.LBB157_1:
	mov	r0, x2
	mov	r1, x3
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB157_8
	jmp	.LBB157_2
.LBB157_2:
	jnz	x4, .LBB157_8
	jmp	.LBB157_3
.LBB157_3:                              // %.preheader10.preheader
	mov	x4, 4
	mov	x5, -2139062144
	mov	x6, -2147483645
.LBB157_4:                              // %.preheader10
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [x3]
	mov	r0, [x2]
	jne	r1, r0, .LBB157_8
	jmp	.LBB157_5
.LBB157_5:                              //   in Loop: Header=BB157_4 Depth=1
	je	x1, x4, .LBB157_14
	jmp	.LBB157_6
.LBB157_6:                              //   in Loop: Header=BB157_4 Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x5, .LBB157_14
	jmp	.LBB157_7
.LBB157_7:                              //   in Loop: Header=BB157_4 Depth=1
add	x1, -4
add	x3, 4
	mov	r1, -2147483648
add	x2, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x6, .LBB157_4
	jmp	.LBB157_8
.LBB157_8:                              // %.loopexit11
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x2]
	mov	r1, 255
	mov	x4, rax
	call	__bit_and
	jne	x4, rax, .LBB157_13
	jmp	.LBB157_9
.LBB157_9:                              // %.preheader.preheader
add	x1, -1
add	x2, 1
add	x3, 1
.LBB157_10:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, x4
	call	__bit_and
	jz	rax, .LBB157_14
	jmp	.LBB157_11
.LBB157_11:                             // %.preheader
                                        //   in Loop: Header=BB157_10 Depth=1
	jz	x1, .LBB157_14
	jmp	.LBB157_12
.LBB157_12:                             //   in Loop: Header=BB157_10 Depth=1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x2]
	mov	r1, 255
	mov	x4, rax
	call	__bit_and
add	x1, -1
add	x2, 1
add	x3, 1
	je	x4, rax, .LBB157_10
	jmp	.LBB157_13
.LBB157_13:                             // %.loopexit9
	mov	r1, 255
	mov	r0, x4
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	sub	x0, rax
.LBB157_14:                             // %.loopexit
	mov	rax, x0
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
// -- Begin function strncpy
strncpy:                                // @strncpy
// %bb.0:
sub	rsp, 36
	mov	[rsp+32], x0
	mov	[rsp+28], x1
	mov	[rsp+24], x2
	mov	[rsp+20], x3
	mov	[rsp+16], x4
	mov	[rsp+12], x5
	mov	[rsp+8], x6
	mov	[rsp+4], x7
	mov	[rsp], x8
	mov	x0, r2
	mov	x2, r1
	mov	x1, r0
	mov	r0, x2
	mov	r1, x1
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483644
	mov	x5, x1
	jl	rax, r0, .LBB158_5
	jmp	.LBB158_1
.LBB158_1:
	mov	x5, x1
	jnz	x3, .LBB158_5
	jmp	.LBB158_2
.LBB158_2:                              // %.preheader4.preheader
	mov	x4, -2139062144
	mov	x6, -2147483645
	mov	x5, x1
.LBB158_3:                              // %.preheader4
                                        // =>This Inner Loop Header: Depth=1
	mov	x3, [x2]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB158_6
	jmp	.LBB158_4
.LBB158_4:                              //   in Loop: Header=BB158_3 Depth=1
add	x0, -4
add	x2, 4
	mov	[x5], x3
	mov	r1, -2147483648
add	x5, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x6, .LBB158_3
	jmp	.LBB158_5
.LBB158_5:                              // %.loopexit6
	jz	x0, .LBB158_12
	jmp	.LBB158_6
.LBB158_6:                              // %.loopexit5.preheader
	mov	x6, 1
.LBB158_7:                              // %.loopexit5
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
	mov	x8, x5
	mov	x7, x0
	mov	r1, 255
add	x0, -1
	call	__bit_and
	mov	r0, [x8]
	mov	x3, rax
	mov	r1, -256
add	x5, 1
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x4
	mov	r1, rax
	call	__bit_or
	mov	[x8], rax
	jz	x3, .LBB158_9
	jmp	.LBB158_8
.LBB158_8:                              // %.loopexit5
                                        //   in Loop: Header=BB158_7 Depth=1
add	x2, 1
	jne	x7, x6, .LBB158_7
	jmp	.LBB158_9
.LBB158_9:
	jz	x0, .LBB158_12
	jmp	.LBB158_10
.LBB158_10:                             // %.preheader.preheader
	mov	x2, 0
.LBB158_11:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	x3, x5
	add	x3, x2
	mov	r0, [x3]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
add	x2, 1
	mov	[x3], rax
	jne	x0, x2, .LBB158_11
	jmp	.LBB158_12
.LBB158_12:                             // %.loopexit
	mov	rax, x1
	mov	x8, [rsp]
	mov	x7, [rsp+4]
	mov	x6, [rsp+8]
	mov	x5, [rsp+12]
	mov	x4, [rsp+16]
	mov	x3, [rsp+20]
	mov	x2, [rsp+24]
	mov	x1, [rsp+28]
	mov	x0, [rsp+32]
add	rsp, 36
	ret
// -- End function
// -- Begin function strndup
strndup:                                // @strndup
// %bb.0:
sub	rsp, 60
	mov	[rsp+56], x0
	mov	[rsp+52], x1
	mov	[rsp+48], x2
	mov	[rsp+44], x3
	mov	[rsp+40], x4
	mov	[rsp+36], x5
	mov	[rsp+32], x6
	mov	[rsp+28], x7
	mov	[rsp+24], x8
	mov	[rsp+20], x9
	mov	[rsp+16], x10
	mov	[rsp+12], x11
	mov	[rsp+8], x12
	mov	[rsp+4], x13
	mov	[rsp], x14
	mov	x1, r1
	mov	x0, r0
	mov	x2, x0
	jz	x1, .LBB159_4
	jmp	.LBB159_1
.LBB159_1:
	mov	x3, x0
	add	x3, x1
	mov	x4, x0
.LBB159_2:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	x2, x4
	jz	rax, .LBB159_4
	jmp	.LBB159_3
.LBB159_3:                              //   in Loop: Header=BB159_2 Depth=1
add	x1, -1
add	x4, 1
	mov	x2, x3
	jnz	x1, .LBB159_2
	jmp	.LBB159_4
.LBB159_4:                              // %.loopexit
	sub	x2, x0
	mov	r0, x2
add	r0, 1
	call	malloc
	mov	x1, rax
	jz	x1, .LBB159_22
	jmp	.LBB159_5
.LBB159_5:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483632
	mov	x6, x1
	mov	x3, x2
	jl	rax, r0, .LBB159_18
	jmp	.LBB159_6
.LBB159_6:
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	x3, rax
	mov	x7, 8
	sub	x7, x3
	mov	x11, 0
	mov	x4, x0
.LBB159_7:                              // =>This Inner Loop Header: Depth=1
	mov	r0, x0
	add	r0, x11
	mov	r0, [r0]
	mov	x8, x1
	mov	r1, 255
	add	x8, x11
	call	__bit_and
	mov	r0, [x8]
	mov	r1, -256
	mov	x5, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x8], rax
add	x11, 1
add	x4, 1
	jne	x7, x11, .LBB159_7
	jmp	.LBB159_8
.LBB159_8:
	mov	r1, -8
	mov	r0, x3
	call	__bit_or
	mov	x3, rax
	mov	x5, x0
	add	x5, x11
	mov	r1, 3
	add	x3, x2
	mov	r0, x5
	call	__bit_and
	jnz	rax, .LBB159_15
	jmp	.LBB159_9
.LBB159_9:
	mov	x6, x1
	mov	r1, -2147483648
	add	x6, x11
	mov	r0, x3
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB159_11
	jmp	.LBB159_10
.LBB159_10:                             // %.preheader.i.preheader
	mov	x6, x1
	add	x6, x11
	add	x0, x11
	mov	x4, 0
	mov	x5, -2147483633
	jmp	.LBB159_13
.LBB159_11:                             // %.preheader55
	mov	x4, -2147483645
	mov	x0, x5
	jmp	.LBB159_14
.LBB159_12:
	add	x0, x4
	mov	r0, 3
	add	x6, x4
	mov	x5, x0
	jg	x3, r0, .LBB159_11
	jmp	.LBB159_18
.LBB159_13:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x0
	add	r0, x4
	mov	r1, [r0]
	mov	r2, x6
	add	r2, x4
	mov	[r2], r1
	mov	r1, r0
add	r1, 4
	mov	r1, [r1]
	mov	r3, r2
add	r3, 4
	mov	[r3], r1
	mov	r1, r0
add	r1, 8
	mov	r1, [r1]
	mov	r3, r2
add	r3, 8
	mov	[r3], r1
add	r0, 12
	mov	r0, [r0]
add	r2, 12
	mov	[r2], r0
add	x3, -16
	mov	r1, -2147483648
add	x4, 16
	mov	r0, x3
	call	__bit_xor
	jg	rax, x5, .LBB159_13
	jmp	.LBB159_12
.LBB159_14:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
add	x0, 4
	mov	[x6], r0
add	x3, -4
	mov	r1, -2147483648
add	x6, 4
	mov	r0, x3
	call	__bit_xor
	jg	rax, x4, .LBB159_14
	jmp	.LBB159_18
.LBB159_15:
	mov	r1, 3
	mov	r0, rax
	mov	x8, rax
	call	__bit_shl
	mov	x6, rax
	mov	x7, 8
	mov	r1, 3
	sub	x7, x8
	mov	r0, x4
	call	__bit_and
	mov	x13, x0
	sub	x13, rax
	mov	r0, x13
	add	r0, x11
	mov	x8, [r0]
add	x13, 4
	mov	x12, 0
.LBB159_16:                             // =>This Inner Loop Header: Depth=1
	mov	x14, x1
	mov	r0, x11
	add	r0, x12
	add	r0, x13
	mov	x9, [r0]
	add	x14, x12
	mov	r1, 31
	add	x14, x11
	mov	r0, x6
	call	__bit_and
	mov	r0, x8
	mov	r1, rax
	call	__bit_shr
	mov	x8, rax
	mov	r0, x6
	call	__bit_not
	mov	r1, 31
	mov	r0, rax
	call	__bit_and
	mov	r1, 1
	mov	x10, rax
	mov	r0, x9
	call	__bit_shl
	mov	r0, rax
	mov	r1, x10
	call	__bit_shl
	mov	r0, rax
	mov	r1, x8
	call	__bit_or
	mov	[x14], rax
add	x3, -4
	mov	r1, -2147483648
add	x12, 4
	mov	r0, x7
	call	__bit_xor
	mov	r1, -2147483648
	mov	x10, rax
	mov	r0, x3
	call	__bit_xor
	mov	x8, x9
	jge	rax, x10, .LBB159_16
	jmp	.LBB159_17
.LBB159_17:
	mov	r1, -4
	mov	r0, x5
	call	__bit_or
	mov	x5, rax
	mov	r1, 3
	add	x5, x12
	mov	r0, x4
	call	__bit_and
	sub	x0, rax
	add	x0, x5
	add	x0, x11
	add	x11, x1
	add	x11, x12
add	x0, 4
	mov	x6, x11
	jmp	.LBB159_19
.LBB159_18:                             // %.loopexit8.i
	jz	x3, .LBB159_21
	jmp	.LBB159_19
.LBB159_19:                             // %.preheader
	mov	x7, x6
.LBB159_20:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
add	x3, -1
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	r0, [x6]
	mov	x4, rax
	mov	r1, -256
add	x7, 1
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	[x6], rax
	mov	x6, x7
	jnz	x3, .LBB159_20
	jmp	.LBB159_21
.LBB159_21:                             // %memcpy.exit
	mov	x0, x1
	add	x0, x2
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
.LBB159_22:
	mov	rax, x1
	mov	x14, [rsp]
	mov	x13, [rsp+4]
	mov	x12, [rsp+8]
	mov	x11, [rsp+12]
	mov	x10, [rsp+16]
	mov	x9, [rsp+20]
	mov	x8, [rsp+24]
	mov	x7, [rsp+28]
	mov	x6, [rsp+32]
	mov	x5, [rsp+36]
	mov	x4, [rsp+40]
	mov	x3, [rsp+44]
	mov	x2, [rsp+48]
	mov	x1, [rsp+52]
	mov	x0, [rsp+56]
add	rsp, 60
	ret
// -- End function
// -- Begin function strnlen
strnlen:                                // @strnlen
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x1, r1
	mov	x0, r0
	mov	rax, x0
	jz	x1, .LBB160_4
	jmp	.LBB160_1
.LBB160_1:
	mov	x2, x0
	add	x2, x1
	mov	x3, x0
.LBB160_2:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, x3
	jz	r0, .LBB160_4
	jmp	.LBB160_3
.LBB160_3:                              //   in Loop: Header=BB160_2 Depth=1
add	x1, -1
add	x3, 1
	mov	rax, x2
	jnz	x1, .LBB160_2
	jmp	.LBB160_4
.LBB160_4:                              // %.loopexit
	sub	rax, x0
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function strnstr
strnstr:                                // @strnstr
// %bb.0:
sub	rsp, 28
	mov	[rsp+24], x0
	mov	[rsp+20], x1
	mov	[rsp+16], x2
	mov	[rsp+12], x3
	mov	[rsp+8], x4
	mov	[rsp+4], x5
	mov	[rsp], x6
	mov	x2, r2
	mov	x1, r1
	mov	x0, r0
	mov	x3, x1
	jz	x2, .LBB161_4
	jmp	.LBB161_1
.LBB161_1:
	mov	x4, x1
	add	x4, x2
	mov	x5, x2
	mov	x6, x1
.LBB161_2:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	mov	x3, x6
	jz	rax, .LBB161_4
	jmp	.LBB161_3
.LBB161_3:                              //   in Loop: Header=BB161_2 Depth=1
add	x5, -1
add	x6, 1
	mov	x3, x4
	jnz	x5, .LBB161_2
	jmp	.LBB161_4
.LBB161_4:                              // %strnlen.exit
	mov	r1, -2147483648
	sub	x3, x1
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x3
	call	__bit_xor
	jl	rax, x4, .LBB161_6
	jmp	.LBB161_5
.LBB161_5:
	mov	r0, x1
	add	r0, x3
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 0
	jnz	r0, .LBB161_21
	jmp	.LBB161_6
.LBB161_6:
	mov	r0, x0
	mov	r1, x2
	mov	r2, x1
	mov	r3, x3
	call	memmem
	mov	x1, rax
	mov	rax, 0
	jz	x1, .LBB161_21
	jmp	.LBB161_7
.LBB161_7:
	mov	x2, x1
	mov	r1, 3
	sub	x2, x0
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB161_13
	jmp	.LBB161_8
.LBB161_8:                              // %.preheader2.preheader
	mov	x3, x0
.LBB161_9:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
	mov	rax, x1
	je	x1, x3, .LBB161_21
	jmp	.LBB161_10
.LBB161_10:                             //   in Loop: Header=BB161_9 Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 0
	jz	r0, .LBB161_21
	jmp	.LBB161_11
.LBB161_11:                             //   in Loop: Header=BB161_9 Depth=1
add	x3, 1
	mov	r1, 3
add	x0, 1
	mov	r0, x3
	call	__bit_and
	jnz	rax, .LBB161_9
	jmp	.LBB161_12
.LBB161_12:                             // %.loopexit9.i.loopexit
	mov	x2, x1
	sub	x2, x3
.LBB161_13:                             // %.loopexit9.i
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB161_17
	jmp	.LBB161_14
.LBB161_14:                             // %.preheader.preheader
	mov	x3, -2139062144
	mov	x4, -2147483645
.LBB161_15:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [x0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x3, .LBB161_18
	jmp	.LBB161_16
.LBB161_16:                             //   in Loop: Header=BB161_15 Depth=1
add	x2, -4
	mov	r1, -2147483648
add	x0, 4
	mov	r0, x2
	call	__bit_xor
	jg	rax, x4, .LBB161_15
	jmp	.LBB161_17
.LBB161_17:                             // %.loopexit6.i
	mov	rax, x1
	jz	x2, .LBB161_21
	jmp	.LBB161_18
.LBB161_18:                             // %.loopexit5.i.preheader
.LBB161_19:                             // %.loopexit5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 0
	jz	r0, .LBB161_21
	jmp	.LBB161_20
.LBB161_20:                             //   in Loop: Header=BB161_19 Depth=1
add	x2, -1
add	x0, 1
	mov	rax, x1
	jnz	x2, .LBB161_19
	jmp	.LBB161_21
.LBB161_21:                             // %memchr.exit
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
// -- Begin function strpbrk
strpbrk:                                // @strpbrk
// %bb.0:
sub	rsp, 24
	mov	[rsp+20], x0
	mov	[rsp+16], x1
	mov	[rsp+12], x2
	mov	[rsp+8], x3
	mov	[rsp+4], x4
	mov	[rsp], x5
	mov	x4, r0
	mov	r0, [x4]
	mov	x0, r1
	mov	r1, 255
	call	__bit_and
	mov	x1, rax
	mov	x2, 0
	jz	x1, .LBB162_7
	jmp	.LBB162_1
.LBB162_1:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x3, rax
	jz	x3, .LBB162_7
	jmp	.LBB162_2
.LBB162_2:                              // %.preheader.preheader
add	x0, 1
.LBB162_3:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB162_5 Depth 2
	mov	x2, x4
	mov	x5, x0
	mov	rax, x3
	jmp	.LBB162_5
.LBB162_4:                              //   in Loop: Header=BB162_5 Depth=2
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
add	x5, 1
	jz	rax, .LBB162_6
	jmp	.LBB162_5
.LBB162_5:                              //   Parent Loop BB162_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x1
	call	__bit_and
	je	rax, x4, .LBB162_7
	jmp	.LBB162_4
.LBB162_6:                              //   in Loop: Header=BB162_3 Depth=1
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	x1, rax
	mov	x4, x2
	mov	x2, 0
	jnz	x1, .LBB162_3
	jmp	.LBB162_7
.LBB162_7:                              // %.loopexit
	mov	rax, x2
	mov	x5, [rsp]
	mov	x4, [rsp+4]
	mov	x3, [rsp+8]
	mov	x2, [rsp+12]
	mov	x1, [rsp+16]
	mov	x0, [rsp+20]
add	rsp, 24
	ret
// -- End function
// -- Begin function strrchr
strrchr:                                // @strrchr
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
	mov	x2, r1
	mov	r1, 255
	mov	x1, r0
	mov	r0, x2
	call	__bit_and
	mov	x3, rax
	jz	x3, .LBB163_16
	jmp	.LBB163_1
.LBB163_1:                              // %.preheader.split.preheader
	mul	x3, 16843009
	mov	x0, 0
	mov	x7, -2139062144
.LBB163_2:                              // %.preheader.split
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB163_6 Depth 2
                                        //     Child Loop BB163_9 Depth 2
                                        //     Child Loop BB163_12 Depth 2
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	jz	rax, .LBB163_4
	jmp	.LBB163_3
.LBB163_3:                              // %.preheader29.preheader
                                        //   in Loop: Header=BB163_2 Depth=1
	mov	x4, x1
add	x4, 1
	jmp	.LBB163_6
.LBB163_4:                              // %.loopexit9.i
                                        //   in Loop: Header=BB163_2 Depth=1
	mov	x4, [x1]
	mov	r0, 16843008
	sub	r0, x4
	mov	r1, x4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x7, .LBB163_11
	jmp	.LBB163_5
.LBB163_5:                              // %.preheader5.i.preheader
                                        //   in Loop: Header=BB163_2 Depth=1
	jmp	.LBB163_9
.LBB163_6:                              // %.preheader29
                                        //   Parent Loop BB163_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x5, rax
	jz	x5, .LBB163_24
	jmp	.LBB163_7
.LBB163_7:                              //   in Loop: Header=BB163_6 Depth=2
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	je	rax, x6, .LBB163_15
	jmp	.LBB163_8
.LBB163_8:                              //   in Loop: Header=BB163_6 Depth=2
	mov	r1, 3
add	x1, 1
	mov	r0, x4
	call	__bit_and
add	x4, 1
	jz	rax, .LBB163_4
	jmp	.LBB163_6
.LBB163_9:                              // %.preheader5.i
                                        //   Parent Loop BB163_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x4
	mov	r1, x3
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x7, .LBB163_11
	jmp	.LBB163_10
.LBB163_10:                             //   in Loop: Header=BB163_9 Depth=2
add	x1, 4
	mov	x4, [x1]
	mov	r0, 16843008
	sub	r0, x4
	mov	r1, x4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x7, .LBB163_9
	jmp	.LBB163_11
.LBB163_11:                             // %.loopexit6.i.preheader
                                        //   in Loop: Header=BB163_2 Depth=1
add	x1, -1
.LBB163_12:                             // %.loopexit6.i
                                        //   Parent Loop BB163_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	jz	x4, .LBB163_14
	jmp	.LBB163_13
.LBB163_13:                             // %.loopexit6.i
                                        //   in Loop: Header=BB163_12 Depth=2
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	jne	rax, x5, .LBB163_12
	jmp	.LBB163_14
.LBB163_14:                             //   in Loop: Header=BB163_2 Depth=1
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	jne	rax, x5, .LBB163_24
	jmp	.LBB163_15
.LBB163_15:                             // %strchr.exit
                                        //   in Loop: Header=BB163_2 Depth=1
	mov	r0, x1
add	r0, 1
	mov	x0, x1
	mov	x1, r0
	jmp	.LBB163_2
.LBB163_16:
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	x0, x1
	jz	rax, .LBB163_20
	jmp	.LBB163_17
.LBB163_17:                             // %.preheader2.i1.preheader
	mov	x2, x1
add	x2, 1
	mov	x0, x1
.LBB163_18:                             // %.preheader2.i1
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB163_24
	jmp	.LBB163_19
.LBB163_19:                             //   in Loop: Header=BB163_18 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x2
	call	__bit_and
add	x2, 1
	jnz	rax, .LBB163_18
	jmp	.LBB163_20
.LBB163_20:                             // %.loopexit4.i2.preheader
add	x0, -5
	mov	x1, -2139062144
.LBB163_21:                             // %.loopexit4.i2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x0
add	r0, 5
	mov	r1, [r0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x0, 4
	je	rax, x1, .LBB163_21
	jmp	.LBB163_22
.LBB163_22:                             // %.preheader.i3.preheader
.LBB163_23:                             // %.preheader.i3
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB163_23
	jmp	.LBB163_24
.LBB163_24:                             // %strchr.exit4
	mov	rax, x0
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
// -- Begin function strsep
strsep:                                 // @strsep
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
	mov	x0, r0
	mov	x4, [x0]
	mov	x1, r1
	mov	rax, 0
	jz	x4, .LBB164_14
	jmp	.LBB164_1
.LBB164_1:
	mov	r0, [x4]
	mov	x5, x4
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x2, rax
	mov	x6, x1
.LBB164_2:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB164_5
	jmp	.LBB164_3
.LBB164_3:                              //   in Loop: Header=BB164_2 Depth=1
	mov	r1, 255
add	x6, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	jne	rax, x3, .LBB164_2
	jmp	.LBB164_4
.LBB164_4:
	mov	[x0], x5
	mov	r0, [x4]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x4], rax
	mov	rax, x4
	jmp	.LBB164_14
.LBB164_5:                              // %.loopexit.i
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	jz	rax, .LBB164_7
	jmp	.LBB164_6
.LBB164_6:                              // %.preheader.i.preheader
	jmp	.LBB164_8
.LBB164_7:
	mov	[x0], 0
	mov	rax, 0
	jmp	.LBB164_14
.LBB164_8:                              // %.preheader.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB164_9 Depth 2
	mov	x6, x5
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x2, rax
	mov	x7, x1
.LBB164_9:                              //   Parent Loop BB164_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	jne	x3, rax, .LBB164_13
	jmp	.LBB164_10
.LBB164_10:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r0, 0
	jz	rax, .LBB164_12
	jmp	.LBB164_11
.LBB164_11:
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x6], rax
	mov	r0, x5
.LBB164_12:
	mov	[x0], r0
	mov	rax, x4
	jmp	.LBB164_14
.LBB164_13:                             //   in Loop: Header=BB164_9 Depth=2
	mov	r1, 255
add	x7, 1
	mov	r0, x3
	call	__bit_and
	jz	rax, .LBB164_8
	jmp	.LBB164_9
.LBB164_14:                             // %__strtok_r.exit
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
// -- Begin function strspn
strspn:                                 // @strspn
// %bb.0:
sub	rsp, 28
	mov	[rsp+24], x0
	mov	[rsp+20], x1
	mov	[rsp+16], x2
	mov	[rsp+12], x3
	mov	[rsp+8], x4
	mov	[rsp+4], x5
	mov	[rsp], x6
	mov	x0, r0
	mov	r0, [x0]
	mov	x1, r1
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
	mov	x4, x0
	jz	x2, .LBB165_7
	jmp	.LBB165_1
.LBB165_1:
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x3, rax
	mov	x4, x0
	jz	x3, .LBB165_7
	jmp	.LBB165_2
.LBB165_2:                              // %.preheader.preheader
add	x1, 1
	mov	x4, x0
.LBB165_3:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB165_5 Depth 2
	mov	x6, x1
	mov	rax, x3
	jmp	.LBB165_5
.LBB165_4:                              //   in Loop: Header=BB165_5 Depth=2
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
add	x6, 1
	jz	rax, .LBB165_7
	jmp	.LBB165_5
.LBB165_5:                              //   Parent Loop BB165_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x2
	call	__bit_and
	jne	rax, x5, .LBB165_4
	jmp	.LBB165_6
.LBB165_6:                              //   in Loop: Header=BB165_3 Depth=1
add	x4, 1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
	jnz	x2, .LBB165_3
	jmp	.LBB165_7
.LBB165_7:                              // %.loopexit
	sub	x4, x0
	mov	rax, x4
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
// -- Begin function two_way_long_needle.65
two_way_long_needle.65:                 // @two_way_long_needle.65
// %bb.0:
sub	rsp, 1116
	mov	[rsp+1112], x0
	mov	[rsp+1108], x1
	mov	[rsp+1104], x2
	mov	[rsp+1100], x3
	mov	[rsp+1096], x4
	mov	[rsp+1092], x5
	mov	[rsp+1088], x6
	mov	[rsp+1084], x7
	mov	[rsp+1080], x8
	mov	[rsp+1076], x9
	mov	[rsp+1072], x10
	mov	[rsp+1068], x11
	mov	[rsp+1064], x12
	mov	[rsp+1060], x13
	mov	[rsp+1056], x14
	mov	[rsp+1052], x15
	mov	x0, r3
	mov	x15, r2
	mov	x2, r1
	mov	[rsp+24], r0
	mov	x1, 0
	mov	r1, -2147483648
	mov	x14, 1
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483646
	mov	x4, 0
	jl	rax, r0, .LBB166_22
	jmp	.LBB166_1
.LBB166_1:                              // %.preheader31.preheader
	mov	x6, -1
	mov	x11, 0
	mov	x5, 1
	mov	x10, 1
.LBB166_2:                              // %.preheader31
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x15
	add	r0, x5
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, x15
	add	r0, x6
	add	r0, x10
	mov	r0, [r0]
	mov	r1, 255
	mov	x7, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x8
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x7
	call	__bit_xor
	jge	rax, x9, .LBB166_4
	jmp	.LBB166_3
.LBB166_3:                              //   in Loop: Header=BB166_2 Depth=1
	mov	x14, x5
	sub	x14, x6
	mov	x10, 1
	jmp	.LBB166_9
.LBB166_4:                              //   in Loop: Header=BB166_2 Depth=1
	mov	r1, 255
	mov	r0, x8
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x7
	call	__bit_and
	jne	rax, x5, .LBB166_8
	jmp	.LBB166_5
.LBB166_5:                              //   in Loop: Header=BB166_2 Depth=1
	je	x10, x14, .LBB166_7
	jmp	.LBB166_6
.LBB166_6:                              //   in Loop: Header=BB166_2 Depth=1
add	x10, 1
	mov	x5, x11
	jmp	.LBB166_9
.LBB166_7:                              //   in Loop: Header=BB166_2 Depth=1
	add	x11, x14
	mov	x10, 1
	mov	x5, x11
	jmp	.LBB166_9
.LBB166_8:                              //   in Loop: Header=BB166_2 Depth=1
	mov	x5, x11
add	x5, 1
	mov	x10, 1
	mov	x6, x11
	mov	x14, 1
.LBB166_9:                              //   in Loop: Header=BB166_2 Depth=1
	mov	x11, x5
	mov	x5, x10
	mov	r1, -2147483648
	add	x5, x11
	mov	r0, x0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x7, rax
	mov	r0, x5
	call	__bit_xor
	jl	rax, x7, .LBB166_2
	jmp	.LBB166_10
.LBB166_10:                             // %.preheader30.preheader
	mov	x5, -1
	mov	x13, 0
	mov	x7, 1
	mov	x11, 1
	mov	x12, 1
.LBB166_11:                             // %.preheader30
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x15
	add	r0, x7
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, x15
	add	r0, x5
	add	r0, x12
	mov	r0, [r0]
	mov	r1, 255
	mov	x8, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x8
	call	__bit_xor
	mov	r1, -2147483648
	mov	x10, rax
	mov	r0, x9
	call	__bit_xor
	jge	rax, x10, .LBB166_13
	jmp	.LBB166_12
.LBB166_12:                             //   in Loop: Header=BB166_11 Depth=1
	mov	x11, x7
	sub	x11, x5
	mov	x12, 1
	jmp	.LBB166_18
.LBB166_13:                             //   in Loop: Header=BB166_11 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x8
	call	__bit_and
	jne	rax, x7, .LBB166_17
	jmp	.LBB166_14
.LBB166_14:                             //   in Loop: Header=BB166_11 Depth=1
	je	x12, x11, .LBB166_16
	jmp	.LBB166_15
.LBB166_15:                             //   in Loop: Header=BB166_11 Depth=1
add	x12, 1
	mov	x7, x13
	jmp	.LBB166_18
.LBB166_16:                             //   in Loop: Header=BB166_11 Depth=1
	add	x13, x11
	mov	x12, 1
	mov	x7, x13
	jmp	.LBB166_18
.LBB166_17:                             //   in Loop: Header=BB166_11 Depth=1
	mov	x7, x13
add	x7, 1
	mov	x12, 1
	mov	x5, x13
	mov	x11, 1
.LBB166_18:                             //   in Loop: Header=BB166_11 Depth=1
	mov	x13, x7
	mov	x7, x12
	mov	r1, -2147483648
	add	x7, x13
	mov	r0, x0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x7
	call	__bit_xor
	jl	rax, x8, .LBB166_11
	jmp	.LBB166_19
.LBB166_19:
add	x6, 1
	mov	r1, -2147483648
add	x5, 1
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x7, rax
	mov	r0, x5
	call	__bit_xor
	jl	rax, x7, .LBB166_21
	jmp	.LBB166_20
.LBB166_20:
	mov	x14, x11
.LBB166_21:
	mov	r0, x6
	call	__bit_not
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	x7, rax
	mov	r0, x6
	mov	r1, x5
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x6
	sub	r1, x5
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	sub	x5, x6
	mov	r0, rax
	mov	r1, x5
	call	__bit_and
	mov	x4, rax
	add	x4, x6
.LBB166_22:
	mov	r0, 1024
	jmp	.LBB166_25
.LBB166_23:
	jz	x0, .LBB166_27
	jmp	.LBB166_24
.LBB166_24:                             // %.preheader28.preheader
	mov	x1, x0
add	x1, -1
	mov	x3, -1
	mov	x6, x15
	jmp	.LBB166_26
.LBB166_25:                             // =>This Inner Loop Header: Depth=1
	mov	r1, rsp
add	r1, 28
	add	r1, x1
add	x1, 4
	mov	[r1], x0
	je	x1, r0, .LBB166_23
	jmp	.LBB166_25
.LBB166_26:                             // %.preheader28
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shl
	mov	r0, rsp
add	r0, 28
	add	r0, rax
	mov	[r0], x1
add	x1, -1
add	x6, 1
	jne	x1, x3, .LBB166_26
	jmp	.LBB166_27
.LBB166_27:                             // %.loopexit29
	mov	x6, x15
	mov	r1, -2147483648
	add	x6, x14
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483644
	mov	x7, x4
	mov	x1, x15
	jl	rax, r0, .LBB166_33
	jmp	.LBB166_28
.LBB166_28:
	mov	r0, x6
	mov	r1, x15
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	x7, x4
	mov	x1, x15
	jnz	rax, .LBB166_35
	jmp	.LBB166_29
.LBB166_29:                             // %.preheader.i.preheader
	mov	x3, -2147483645
	mov	x1, x15
	mov	x7, x4
.LBB166_30:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	x6, x1
	add	x6, x14
	mov	r0, [x1]
	mov	r1, [x6]
	jne	r0, r1, .LBB166_34
	jmp	.LBB166_31
.LBB166_31:                             //   in Loop: Header=BB166_30 Depth=1
add	x7, -4
	mov	r1, -2147483648
add	x1, 4
	mov	r0, x7
	call	__bit_xor
	jg	rax, x3, .LBB166_30
	jmp	.LBB166_32
.LBB166_32:                             // %.loopexit8.i.loopexit
	mov	x6, x1
	add	x6, x14
.LBB166_33:                             // %.loopexit8.i
	jz	x7, .LBB166_38
	jmp	.LBB166_35
.LBB166_34:                             // %.loopexit7.i.preheader.loopexit
.LBB166_35:                             // %.loopexit7.i.preheader
.LBB166_36:                             // %.loopexit7.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x6]
	mov	r1, 255
	mov	x8, rax
	call	__bit_and
	jne	x8, rax, .LBB166_58
	jmp	.LBB166_37
.LBB166_37:                             //   in Loop: Header=BB166_36 Depth=1
add	x7, -1
add	x1, 1
add	x6, 1
	jnz	x7, .LBB166_36
	jmp	.LBB166_38
.LBB166_38:                             // %memcmp.exit.thread
	mov	r1, 2048
	mov	r0, x0
	call	__bit_or
	mov	[rsp+8], rax
	mov	r0, x0
	mov	[rsp+20], x14
	sub	r0, x14
	mov	[rsp+16], r0
	mov	r0, x0
add	r0, -1
	mov	[rsp+12], r0
	mov	r0, 1
	sub	r0, x4
	mov	[rsp], r0
	mov	r0, [rsp+24]
add	r0, -1
	mov	[rsp+4], r0
	mov	x1, x15
add	x1, -1
	mov	x9, 0
	mov	x7, 0
.LBB166_39:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB166_41 Depth 2
                                        //     Child Loop BB166_52 Depth 2
                                        //     Child Loop BB166_54 Depth 2
	mov	r0, x2
	sub	r0, x0
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x9
	call	__bit_xor
	jle	rax, x6, .LBB166_44
	jmp	.LBB166_40
.LBB166_40:                             //   in Loop: Header=BB166_39 Depth=1
	mov	x3, [rsp+24]
	add	x3, x2
	mov	x6, x3
	mov	x5, [rsp+8]
	add	x6, x5
	mov	x8, x3
.LBB166_41:                             //   Parent Loop BB166_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x8]
	mov	r1, 255
	call	__bit_and
	mov	r0, x8
	jz	rax, .LBB166_43
	jmp	.LBB166_42
.LBB166_42:                             //   in Loop: Header=BB166_41 Depth=2
add	x5, -1
add	x8, 1
	mov	r0, x6
	jnz	x5, .LBB166_41
	jmp	.LBB166_43
.LBB166_43:                             // %strnlen.exit
                                        //   in Loop: Header=BB166_39 Depth=1
	sub	r0, x3
	add	x2, r0
	mov	r0, x2
	sub	r0, x0
	mov	r1, -2147483648
	mov	x6, 0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x11, rax
	mov	r0, x9
	call	__bit_xor
	jg	rax, x11, .LBB166_74
	jmp	.LBB166_44
.LBB166_44:                             //   in Loop: Header=BB166_39 Depth=1
	mov	x6, [rsp+24]
	add	x6, x9
	mov	r0, x6
	add	r0, x0
add	r0, -1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shl
	mov	r0, rsp
add	r0, 28
	add	r0, rax
	mov	x12, [r0]
	jz	x12, .LBB166_49
	jmp	.LBB166_45
.LBB166_45:                             //   in Loop: Header=BB166_39 Depth=1
	mov	x10, 0
	jz	x7, .LBB166_48
	jmp	.LBB166_46
.LBB166_46:                             //   in Loop: Header=BB166_39 Depth=1
	mov	r1, -2147483648
	mov	r0, [rsp+20]
	call	__bit_xor
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x12
	call	__bit_xor
	jge	rax, x6, .LBB166_48
	jmp	.LBB166_47
.LBB166_47:                             //   in Loop: Header=BB166_39 Depth=1
	mov	x12, [rsp+16]
.LBB166_48:                             //   in Loop: Header=BB166_39 Depth=1
	add	x9, x12
	mov	x7, x10
	jmp	.LBB166_39
.LBB166_49:                             //   in Loop: Header=BB166_39 Depth=1
	mov	r0, x7
	call	__bit_not
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	x12, rax
	mov	r0, x7
	mov	r1, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	x11, x7
	sub	x11, x4
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, x4
	sub	r1, x7
	mov	r0, rax
	call	__bit_and
	mov	x13, rax
	add	x13, x7
	mov	r1, -2147483648
	mov	r0, x13
	call	__bit_xor
	mov	r1, -2147483648
	mov	x12, rax
	mov	r0, [rsp+12]
	call	__bit_xor
	jge	x12, rax, .LBB166_51
	jmp	.LBB166_50
.LBB166_50:                             // %.preheader.preheader
                                        //   in Loop: Header=BB166_39 Depth=1
	mov	x12, [rsp]
	add	x12, x13
	mov	x8, [rsp+12]
	sub	x8, x13
	mov	x3, x15
	add	x3, x13
	add	x13, x9
	mov	r0, [rsp+24]
	add	x13, r0
	jmp	.LBB166_52
.LBB166_51:                             // %.loopexit
                                        //   in Loop: Header=BB166_39 Depth=1
	mov	r0, x7
	call	__bit_not
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	x12, rax
	mov	r0, x7
	mov	r1, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x11
	call	__bit_and
	mov	x11, rax
	add	x11, x4
	mov	x3, [rsp+4]
	add	x3, x9
	mov	x12, x4
	mov	x8, [rsp+20]
	jmp	.LBB166_54
.LBB166_52:                             // %.preheader
                                        //   Parent Loop BB166_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x13]
	mov	r1, 255
	mov	x14, rax
	call	__bit_and
	mov	x10, 0
	jne	x14, rax, .LBB166_48
	jmp	.LBB166_53
.LBB166_53:                             //   in Loop: Header=BB166_52 Depth=2
add	x12, 1
add	x8, -1
add	x3, 1
add	x13, 1
	jz	x8, .LBB166_51
	jmp	.LBB166_52
.LBB166_54:                             //   Parent Loop BB166_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, -2147483648
	mov	r0, x12
	call	__bit_xor
	mov	r1, -2147483648
	mov	x13, rax
	mov	r0, x7
	call	__bit_xor
	jge	rax, x13, .LBB166_57
	jmp	.LBB166_55
.LBB166_55:                             //   in Loop: Header=BB166_54 Depth=2
	mov	r0, x1
	add	r0, x12
	mov	r0, [r0]
	mov	x5, x12
	mov	r1, 255
add	x5, -1
	call	__bit_and
	add	x12, x3
	mov	r0, [x12]
	mov	r1, 255
	mov	x13, rax
	call	__bit_and
	mov	x12, x5
	je	x13, rax, .LBB166_54
	jmp	.LBB166_56
.LBB166_56:                             // %._crit_edge
                                        //   in Loop: Header=BB166_39 Depth=1
add	x5, 1
	mov	x11, x5
.LBB166_57:                             //   in Loop: Header=BB166_39 Depth=1
add	x7, 1
	mov	r1, -2147483648
	mov	r0, x7
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x11
	call	__bit_xor
	mov	x12, x8
	mov	x10, [rsp+16]
	jl	rax, x3, .LBB166_74
	jmp	.LBB166_48
.LBB166_58:                             // %memcmp.exit
	mov	x6, x0
	sub	x6, x4
	mov	r0, x6
	call	__bit_not
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	x1, rax
	mov	r0, x6
	mov	r1, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x6
	sub	r1, x4
	mov	r0, rax
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, x4
	sub	r1, x6
	mov	r0, rax
	call	__bit_and
	mov	x12, rax
	mov	r1, 2048
	add	x12, x6
	mov	r0, x0
	call	__bit_or
	mov	x7, x0
add	x7, -1
	mov	x8, rax
	mov	x1, x7
	sub	x1, x4
	mov	x11, x15
	add	x11, x4
	mov	x13, [rsp+24]
	mov	r0, x13
	add	r0, x4
	mov	[rsp+20], r0
add	x13, -1
add	x15, -1
	mov	x9, 0
.LBB166_59:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB166_61 Depth 2
                                        //     Child Loop BB166_68 Depth 2
                                        //     Child Loop BB166_71 Depth 2
	mov	r0, x2
	sub	r0, x0
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x9
	call	__bit_xor
	jle	rax, x6, .LBB166_64
	jmp	.LBB166_60
.LBB166_60:                             //   in Loop: Header=BB166_59 Depth=1
	mov	x3, [rsp+24]
	add	x3, x2
	mov	x6, x3
	add	x6, x8
	mov	x5, x8
	mov	x10, x3
.LBB166_61:                             //   Parent Loop BB166_59 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x10]
	mov	r1, 255
	call	__bit_and
	mov	r0, x10
	jz	rax, .LBB166_63
	jmp	.LBB166_62
.LBB166_62:                             //   in Loop: Header=BB166_61 Depth=2
add	x5, -1
add	x10, 1
	mov	r0, x6
	jnz	x5, .LBB166_61
	jmp	.LBB166_63
.LBB166_63:                             // %strnlen.exit21
                                        //   in Loop: Header=BB166_59 Depth=1
	sub	r0, x3
	add	x2, r0
	mov	r0, x2
	sub	r0, x0
	mov	r1, -2147483648
	mov	x6, 0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x10, rax
	mov	r0, x9
	call	__bit_xor
	jg	rax, x10, .LBB166_74
	jmp	.LBB166_64
.LBB166_64:                             //   in Loop: Header=BB166_59 Depth=1
	mov	x6, [rsp+24]
	add	x6, x9
	mov	r0, x6
	add	r0, x0
add	r0, -1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 2
	mov	r0, rax
	call	__bit_shl
	mov	r0, rsp
add	r0, 28
	add	r0, rax
	mov	r0, [r0]
	jnz	r0, .LBB166_67
	jmp	.LBB166_65
.LBB166_65:                             //   in Loop: Header=BB166_59 Depth=1
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r1, -2147483648
	mov	x10, rax
	mov	r0, x7
	call	__bit_xor
	jle	rax, x10, .LBB166_70
	jmp	.LBB166_66
.LBB166_66:                             // %.preheader25.preheader
                                        //   in Loop: Header=BB166_59 Depth=1
	mov	x14, [rsp+20]
	add	x14, x9
	mov	x3, 0
	jmp	.LBB166_68
.LBB166_67:                             //   in Loop: Header=BB166_59 Depth=1
	add	x9, r0
	jmp	.LBB166_59
.LBB166_68:                             // %.preheader25
                                        //   Parent Loop BB166_59 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x11
	add	r0, x3
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, x14
	add	r0, x3
	mov	r0, [r0]
	mov	r1, 255
	mov	x10, rax
	call	__bit_and
	jne	x10, rax, .LBB166_73
	jmp	.LBB166_69
.LBB166_69:                             //   in Loop: Header=BB166_68 Depth=2
add	x3, 1
	jne	x1, x3, .LBB166_68
	jmp	.LBB166_70
.LBB166_70:                             // %.loopexit26.preheader
                                        //   in Loop: Header=BB166_59 Depth=1
	mov	x14, x13
	add	x14, x9
	mov	x5, x4
.LBB166_71:                             // %.loopexit26
                                        //   Parent Loop BB166_59 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	jz	x5, .LBB166_74
	jmp	.LBB166_72
.LBB166_72:                             //   in Loop: Header=BB166_71 Depth=2
	mov	r0, x15
	add	r0, x5
	mov	r0, [r0]
	mov	x3, x5
	mov	r1, 255
add	x3, -1
	call	__bit_and
	add	x5, x14
	mov	r0, [x5]
	mov	r1, 255
	mov	x10, rax
	call	__bit_and
	mov	x5, x3
	mov	x3, x12
	je	x10, rax, .LBB166_71
	jmp	.LBB166_73
.LBB166_73:                             // %.loopexit24
                                        //   in Loop: Header=BB166_59 Depth=1
	add	x9, x3
add	x9, 1
	jmp	.LBB166_59
.LBB166_74:                             // %.loopexit22
	mov	rax, x6
	mov	x15, [rsp+1052]
	mov	x14, [rsp+1056]
	mov	x13, [rsp+1060]
	mov	x12, [rsp+1064]
	mov	x11, [rsp+1068]
	mov	x10, [rsp+1072]
	mov	x9, [rsp+1076]
	mov	x8, [rsp+1080]
	mov	x7, [rsp+1084]
	mov	x6, [rsp+1088]
	mov	x5, [rsp+1092]
	mov	x4, [rsp+1096]
	mov	x3, [rsp+1100]
	mov	x2, [rsp+1104]
	mov	x1, [rsp+1108]
	mov	x0, [rsp+1112]
add	rsp, 1116
	ret
// -- End function
// -- Begin function strstr
strstr:                                 // @strstr
// %bb.0:
sub	rsp, 108
	mov	[rsp+104], x0
	mov	[rsp+100], x1
	mov	[rsp+96], x2
	mov	[rsp+92], x3
	mov	[rsp+88], x4
	mov	[rsp+84], x5
	mov	[rsp+80], x6
	mov	[rsp+76], x7
	mov	[rsp+72], x8
	mov	[rsp+68], x9
	mov	[rsp+64], x10
	mov	x1, r1
	mov	r2, [x1]
	mov	r1, 255
	mov	x0, r0
	mov	r0, r2
	call	__bit_and
	mov	x2, rax
	mov	x4, x0
	jz	x2, .LBB167_91
	jmp	.LBB167_1
.LBB167_1:
	mov	x6, x1
add	x6, 1
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	jnz	x4, .LBB167_15
	jmp	.LBB167_2
.LBB167_2:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 3
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB167_4
	jmp	.LBB167_3
.LBB167_3:                              // %.preheader.preheader
	mov	x3, x0
add	x3, 1
	jmp	.LBB167_6
.LBB167_4:                              // %.loopexit9.i
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	x4, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB167_11
	jmp	.LBB167_5
.LBB167_5:                              // %.preheader5.i.preheader
	mul	x1, 16843009
	jmp	.LBB167_9
.LBB167_6:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x5, rax
	mov	x4, 0
	jz	x5, .LBB167_91
	jmp	.LBB167_7
.LBB167_7:                              //   in Loop: Header=BB167_6 Depth=1
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	x4, x0
	je	rax, x6, .LBB167_91
	jmp	.LBB167_8
.LBB167_8:                              //   in Loop: Header=BB167_6 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
	jz	rax, .LBB167_4
	jmp	.LBB167_6
.LBB167_9:                              // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
	mov	r1, x1
	call	__bit_xor
	mov	r0, 16843008
	sub	r0, rax
	mov	r1, rax
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB167_11
	jmp	.LBB167_10
.LBB167_10:                             //   in Loop: Header=BB167_9 Depth=1
add	x0, 4
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x4, .LBB167_9
	jmp	.LBB167_11
.LBB167_11:                             // %.loopexit6.i.preheader
add	x0, -1
.LBB167_12:                             // %.loopexit6.i
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x1, rax
	jz	x1, .LBB167_14
	jmp	.LBB167_13
.LBB167_13:                             // %.loopexit6.i
                                        //   in Loop: Header=BB167_12 Depth=1
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x1
	call	__bit_and
	jne	rax, x3, .LBB167_12
	jmp	.LBB167_14
.LBB167_14:
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_xor
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
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x4, rax
	jmp	.LBB167_91
.LBB167_15:
	mov	r0, x1
add	r0, 2
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x3, rax
	jnz	x3, .LBB167_21
	jmp	.LBB167_16
.LBB167_16:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 16
	mov	r0, rax
	call	__bit_shl
	mov	r1, 255
	mov	x1, rax
	mov	r0, x4
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r0, [x0]
	mov	r1, 255
	mov	x1, rax
	call	__bit_and
	mov	x3, rax
	mov	x4, 0
	jz	x3, .LBB167_91
	jmp	.LBB167_17
.LBB167_17:                             // %.preheader24.preheader
add	x0, -2
	mov	x2, 0
.LBB167_18:                             // %.preheader24
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r1, 16
	mov	x3, rax
	mov	r0, x2
	call	__bit_shl
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	r0, x0
add	r0, 3
	mov	r0, [r0]
	mov	r1, 255
	mov	x2, rax
	call	__bit_and
	mov	x3, rax
add	x0, 1
	je	x1, x2, .LBB167_20
	jmp	.LBB167_19
.LBB167_19:                             // %.preheader24
                                        //   in Loop: Header=BB167_18 Depth=1
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	jnz	rax, .LBB167_18
	jmp	.LBB167_20
.LBB167_20:
	mov	r0, x1
	mov	r1, x2
	call	__bit_xor
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
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x4, rax
	jmp	.LBB167_91
.LBB167_21:
	mov	r0, x1
add	r0, 3
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x5, rax
	jnz	x5, .LBB167_27
	jmp	.LBB167_22
.LBB167_22:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r1, 255
	mov	x1, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 16
	mov	r0, rax
	call	__bit_shl
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r1, 255
	mov	x1, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 8
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r0, [x0]
	mov	r1, 255
	mov	x1, rax
	call	__bit_and
	mov	x2, rax
	mov	x4, 0
	jz	x2, .LBB167_91
	jmp	.LBB167_23
.LBB167_23:                             // %.preheader25.preheader
add	x0, -3
	mov	x3, 0
.LBB167_24:                             // %.preheader25
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	r1, 8
	mov	r0, rax
	call	__bit_shl
	mov	r0, x0
add	r0, 4
	mov	r0, [r0]
	mov	r1, 255
	mov	x3, rax
	call	__bit_and
	mov	x2, rax
add	x0, 1
	je	x1, x3, .LBB167_26
	jmp	.LBB167_25
.LBB167_25:                             // %.preheader25
                                        //   in Loop: Header=BB167_24 Depth=1
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	jnz	rax, .LBB167_24
	jmp	.LBB167_26
.LBB167_26:
	mov	r0, x1
	mov	r1, x3
	call	__bit_xor
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
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x4, rax
	jmp	.LBB167_91
.LBB167_27:
	mov	r0, x1
add	r0, 4
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB167_33
	jmp	.LBB167_28
.LBB167_28:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r1, 255
	mov	x1, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 16
	mov	r0, rax
	call	__bit_shl
	mov	r0, rax
	mov	r1, x1
	call	__bit_or
	mov	r1, 255
	mov	x1, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 8
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 255
	mov	x1, rax
	mov	r0, x5
	call	__bit_and
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r0, [x0]
	mov	r1, 255
	mov	x1, rax
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB167_91
	jmp	.LBB167_29
.LBB167_29:                             // %.preheader26.preheader
add	x0, -4
	mov	x2, 0
.LBB167_30:                             // %.preheader26
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 8
	mov	x3, rax
	mov	r0, x2
	call	__bit_shl
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	r0, x0
add	r0, 5
	mov	r0, [r0]
	mov	r1, 255
	mov	x2, rax
	call	__bit_and
add	x0, 1
	jz	rax, .LBB167_32
	jmp	.LBB167_31
.LBB167_31:                             // %.preheader26
                                        //   in Loop: Header=BB167_30 Depth=1
	jne	x1, x2, .LBB167_30
	jmp	.LBB167_32
.LBB167_32:
	mov	r0, x1
	mov	r1, x2
	call	__bit_xor
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
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x4, rax
	jmp	.LBB167_91
.LBB167_33:
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	x3, x1
	jz	rax, .LBB167_37
	jmp	.LBB167_34
.LBB167_34:                             // %.preheader1.i.preheader
	mov	x2, x1
	mov	x3, x6
	jmp	.LBB167_36
.LBB167_35:                             //   in Loop: Header=BB167_36 Depth=1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
add	x3, 1
	jz	rax, .LBB167_41
	jmp	.LBB167_36
.LBB167_36:                             // %.preheader1.i
                                        // =>This Inner Loop Header: Depth=1
add	x2, 1
	mov	r1, 3
	mov	r0, x2
	call	__bit_and
	jnz	rax, .LBB167_35
	jmp	.LBB167_37
.LBB167_37:                             // %.loopexit.i.preheader
	mov	x4, x3
add	x4, -1
	mov	x5, -2139062144
.LBB167_38:                             // %.loopexit.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [x3]
	mov	r0, 16843008
	sub	r0, r1
	mov	x2, x4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x3, 4
add	x4, 4
	je	rax, x5, .LBB167_38
	jmp	.LBB167_39
.LBB167_39:                             // %.preheader.i14.preheader
	mov	x4, -4
.LBB167_40:                             // %.preheader.i14
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
	add	r0, x4
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x2, 1
add	x4, 1
	jnz	rax, .LBB167_40
	jmp	.LBB167_41
.LBB167_41:                             // %strlen.exit
	sub	x2, x1
	mov	r1, 512
	mov	r0, x2
	call	__bit_or
	mov	x3, rax
	mov	x4, x3
	add	x3, x0
	mov	x5, 0
.LBB167_42:                             // =>This Inner Loop Header: Depth=1
	mov	x6, x0
	add	x6, x5
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB167_44
	jmp	.LBB167_43
.LBB167_43:                             //   in Loop: Header=BB167_42 Depth=1
add	x5, 1
	je	x4, x5, .LBB167_45
	jmp	.LBB167_42
.LBB167_44:                             // %.strnlen.exit_crit_edge
	mov	x3, x6
.LBB167_45:                             // %strnlen.exit
	sub	x3, x0
	mov	r1, -2147483648
	mov	x4, 0
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x3
	call	__bit_xor
	jl	rax, x5, .LBB167_91
	jmp	.LBB167_46
.LBB167_46:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483394
	jg	rax, r0, .LBB167_90
	jmp	.LBB167_47
.LBB167_47:
	add	x3, x0
	mov	x4, x2
add	x4, 1
	mov	x5, rsp
	mov	r1, 3
	mov	x8, 3
	mov	r0, x5
	call	__bit_and
	mov	x6, 64
	jz	rax, .LBB167_52
	jmp	.LBB167_48
.LBB167_48:
	mov	r0, rsp
	mov	r1, 3
	call	__bit_and
	mov	x5, rsp
add	x5, 1
	mov	r0, [rsp]
	mov	r1, -256
	mov	x7, rax
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[rsp], rax
	mov	x6, 63
	je	x7, x8, .LBB167_52
	jmp	.LBB167_49
.LBB167_49:
	mov	x5, rsp
add	x5, 2
	mov	x8, rsp
add	x8, 1
	mov	r0, [x8]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x8], rax
	mov	r0, 2
	mov	x6, 62
	je	x7, r0, .LBB167_52
	jmp	.LBB167_50
.LBB167_50:
	mov	x5, rsp
add	x5, 3
	mov	x8, rsp
add	x8, 2
	mov	r0, [x8]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x8], rax
	mov	r0, 1
	mov	x6, 61
	je	x7, r0, .LBB167_52
	jmp	.LBB167_51
.LBB167_51:
	mov	x5, rsp
add	x5, 4
	mov	x7, rsp
add	x7, 3
	mov	r0, [x7]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x6
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mov	x6, 60
.LBB167_52:                             // %.preheader.i17.preheader
	sub	x3, x2
	mov	x7, x4
	mul	x7, 16843009
	mov	x8, -2147483633
	jmp	.LBB167_55
.LBB167_53:
	mov	r0, x6
add	r0, 16
	mov	r1, 20
	jl	r0, r1, .LBB167_57
	jmp	.LBB167_54
.LBB167_54:                             // %.preheader194.preheader
	mov	x8, -2147483645
	jmp	.LBB167_56
.LBB167_55:                             // %.preheader.i17
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x5
add	r0, 4
	mov	[x5], x7
	mov	r1, x5
add	r1, 8
	mov	[r0], x7
	mov	r0, x5
add	r0, 12
	mov	[r1], x7
add	x5, 16
add	x6, -16
	mov	r1, -2147483648
	mov	[r0], x7
	mov	r0, x6
	call	__bit_xor
	jg	rax, x8, .LBB167_55
	jmp	.LBB167_53
.LBB167_56:                             // %.preheader194
                                        // =>This Inner Loop Header: Depth=1
	mov	[x5], x7
add	x6, -4
	mov	r1, -2147483648
add	x5, 4
	mov	r0, x6
	call	__bit_xor
	jg	rax, x8, .LBB167_56
	jmp	.LBB167_57
.LBB167_57:                             // %.loopexit5.i
	jz	x6, .LBB167_60
	jmp	.LBB167_58
.LBB167_58:
	mov	x8, x5
.LBB167_59:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
add	x6, -1
	mov	r1, -256
add	x8, 1
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x7
	mov	r1, rax
	call	__bit_or
	mov	[x5], rax
	mov	x5, x8
	jnz	x6, .LBB167_59
	jmp	.LBB167_60
.LBB167_60:                             // %memset.exit
	jz	x2, .LBB167_63
	jmp	.LBB167_61
.LBB167_61:                             // %.preheader30.preheader
	mov	x6, x1
	mov	x4, x2
.LBB167_62:                             // %.preheader30
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	mov	r1, 63
	mov	r0, rax
	call	__bit_and
	mov	x7, rsp
	add	x7, rax
	mov	r0, [x7]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
add	x4, -1
add	x6, 1
	jnz	x4, .LBB167_62
	jmp	.LBB167_63
.LBB167_63:                             // %.loopexit31
	mov	x6, 2047
	mov	x7, -2147483644
	mov	x8, -2147483645
.LBB167_64:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB167_73 Depth 2
                                        //       Child Loop BB167_75 Depth 3
                                        //       Child Loop BB167_80 Depth 3
                                        //     Child Loop BB167_69 Depth 2
                                        //       Child Loop BB167_70 Depth 3
                                        //     Child Loop BB167_86 Depth 2
add	x0, -1
	mov	r0, x0
	add	r0, x2
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 63
	mov	r0, rax
	call	__bit_and
	mov	r0, rsp
	add	r0, rax
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	mov	r1, -2147483648
	add	x4, x0
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x4
	call	__bit_xor
	jg	rax, x0, .LBB167_83
	jmp	.LBB167_65
.LBB167_65:                             // %.preheader27
                                        //   in Loop: Header=BB167_64 Depth=1
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	jl	rax, x7, .LBB167_67
	jmp	.LBB167_66
.LBB167_66:                             // %.preheader27.split.preheader
                                        //   in Loop: Header=BB167_64 Depth=1
	jmp	.LBB167_73
.LBB167_67:                             // %.preheader27.split.us
                                        //   in Loop: Header=BB167_64 Depth=1
	jz	x2, .LBB167_89
	jmp	.LBB167_68
.LBB167_68:                             // %.loopexit8.i.us.preheader
                                        //   in Loop: Header=BB167_64 Depth=1
.LBB167_69:                             // %.loopexit8.i.us
                                        //   Parent Loop BB167_64 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB167_70 Depth 3
	mov	x5, 0
.LBB167_70:                             //   Parent Loop BB167_64 Depth=1
                                        //     Parent Loop BB167_69 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r0, x4
	add	r0, x5
	mov	r0, [r0]
	mov	x0, x1
	mov	r1, 255
	add	x0, x5
	call	__bit_and
	mov	r0, [x0]
	mov	r1, 255
	mov	x0, rax
	call	__bit_and
	je	x0, rax, .LBB167_72
	jmp	.LBB167_71
.LBB167_71:                             // %memcmp.exit.us
                                        //   in Loop: Header=BB167_69 Depth=2
	mov	r0, x4
	add	r0, x2
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 63
	mov	r0, rax
	call	__bit_and
	mov	r0, rsp
	add	r0, rax
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	add	x4, rax
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x4
	call	__bit_xor
	jg	rax, x0, .LBB167_83
	jmp	.LBB167_69
.LBB167_72:                             //   in Loop: Header=BB167_70 Depth=3
add	x5, 1
	je	x2, x5, .LBB167_89
	jmp	.LBB167_70
.LBB167_73:                             // %.preheader27.split
                                        //   Parent Loop BB167_64 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB167_75 Depth 3
                                        //       Child Loop BB167_80 Depth 3
	mov	r0, x4
	mov	r1, x1
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	x0, x2
	mov	x9, x1
	mov	x10, x4
	jnz	rax, .LBB167_79
	jmp	.LBB167_74
.LBB167_74:                             // %.preheader.i20.preheader
                                        //   in Loop: Header=BB167_73 Depth=2
	mov	x5, 0
	mov	x0, x2
.LBB167_75:                             // %.preheader.i20
                                        //   Parent Loop BB167_64 Depth=1
                                        //     Parent Loop BB167_73 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	x9, x1
	add	x9, x5
	mov	x10, x4
	add	x10, x5
	mov	r0, [x10]
	mov	r1, [x9]
	jne	r0, r1, .LBB167_78
	jmp	.LBB167_76
.LBB167_76:                             //   in Loop: Header=BB167_75 Depth=3
add	x0, -4
	mov	r1, -2147483648
add	x5, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x8, .LBB167_75
	jmp	.LBB167_77
.LBB167_77:                             // %.loopexit8.i.loopexit
                                        //   in Loop: Header=BB167_73 Depth=2
	mov	x9, x1
	add	x9, x5
	add	x5, x4
	mov	x10, x5
	jz	x0, .LBB167_89
	jmp	.LBB167_79
.LBB167_78:                             // %.loopexit7.i18.preheader.loopexit
                                        //   in Loop: Header=BB167_73 Depth=2
.LBB167_79:                             // %.loopexit7.i18.preheader
                                        //   in Loop: Header=BB167_73 Depth=2
.LBB167_80:                             // %.loopexit7.i18
                                        //   Parent Loop BB167_64 Depth=1
                                        //     Parent Loop BB167_73 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r0, [x10]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x9]
	mov	r1, 255
	mov	x5, rax
	call	__bit_and
	jne	x5, rax, .LBB167_82
	jmp	.LBB167_81
.LBB167_81:                             //   in Loop: Header=BB167_80 Depth=3
add	x0, -1
add	x10, 1
add	x9, 1
	jz	x0, .LBB167_89
	jmp	.LBB167_80
.LBB167_82:                             // %memcmp.exit
                                        //   in Loop: Header=BB167_73 Depth=2
	mov	r0, x4
	add	r0, x2
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 63
	mov	r0, rax
	call	__bit_and
	mov	r0, rsp
	add	r0, rax
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	add	x4, rax
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x4
	call	__bit_xor
	jle	rax, x0, .LBB167_73
	jmp	.LBB167_83
.LBB167_83:                             // %.loopexit
                                        //   in Loop: Header=BB167_64 Depth=1
	mov	x5, x3
	add	x5, x2
	mov	r0, [x5]
	mov	r1, 255
	mov	x0, x4
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB167_89
	jmp	.LBB167_84
.LBB167_84:                             //   in Loop: Header=BB167_64 Depth=1
	mov	x4, x5
add	x4, 2048
	mov	x9, 0
	jmp	.LBB167_86
.LBB167_85:                             // %thread-pre-split
                                        //   in Loop: Header=BB167_86 Depth=2
	mov	r0, x5
	add	r0, x9
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x9, 1
	jz	rax, .LBB167_87
	jmp	.LBB167_86
.LBB167_86:                             //   Parent Loop BB167_64 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	je	x9, x6, .LBB167_88
	jmp	.LBB167_85
.LBB167_87:                             // %thread-pre-split.strnlen.exit22_crit_edge
                                        //   in Loop: Header=BB167_64 Depth=1
	add	x9, x5
	mov	x4, x9
.LBB167_88:                             // %strnlen.exit22
                                        //   in Loop: Header=BB167_64 Depth=1
	sub	x4, x5
	add	x3, x4
	mov	r1, -2147483648
	mov	x4, 0
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x0
	call	__bit_xor
	jle	rax, x5, .LBB167_64
	jmp	.LBB167_89
.LBB167_89:                             // %memcmp.exit.thread
	jmp	.LBB167_91
.LBB167_90:
	mov	r0, x0
	mov	r1, x3
	mov	r2, x1
	mov	r3, x2
	call	two_way_long_needle.65
	mov	x4, rax
.LBB167_91:                             // %strchr.exit
	mov	rax, x4
	mov	x10, [rsp+64]
	mov	x9, [rsp+68]
	mov	x8, [rsp+72]
	mov	x7, [rsp+76]
	mov	x6, [rsp+80]
	mov	x5, [rsp+84]
	mov	x4, [rsp+88]
	mov	x3, [rsp+92]
	mov	x2, [rsp+96]
	mov	x1, [rsp+100]
	mov	x0, [rsp+104]
add	rsp, 108
	ret
// -- End function
// -- Begin function strtok
strtok:                                 // @strtok
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
	mov	x1, r1
	mov	x0, r0
	jnz	x0, .LBB168_2
	jmp	.LBB168_1
.LBB168_1:
	mov	r0, mcasm_static_f3650f04f4d64e4e708b5a29025db952
	mov	x0, [r0]
	mov	rax, 0
	jz	x0, .LBB168_14
	jmp	.LBB168_2
.LBB168_2:                              // %.preheader7.i.preheader
.LBB168_3:                              // %.preheader7.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB168_4 Depth 2
	mov	x4, x0
	mov	r0, [x4]
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	x2, rax
	mov	x5, x1
.LBB168_4:                              //   Parent Loop BB168_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB168_6
	jmp	.LBB168_5
.LBB168_5:                              //   in Loop: Header=BB168_4 Depth=2
	mov	r1, 255
add	x5, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	je	rax, x3, .LBB168_3
	jmp	.LBB168_4
.LBB168_6:                              // %.loopexit.i
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	x5, 0
	mov	rax, 0
	jz	r0, .LBB168_13
	jmp	.LBB168_7
.LBB168_7:                              // %.preheader.i.preheader
.LBB168_8:                              // %.preheader.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB168_9 Depth 2
	mov	x6, x0
	mov	r0, [x6]
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	x2, rax
	mov	x7, x1
.LBB168_9:                              //   Parent Loop BB168_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	jne	x3, rax, .LBB168_12
	jmp	.LBB168_10
.LBB168_10:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	rax, x4
	jz	r0, .LBB168_13
	jmp	.LBB168_11
.LBB168_11:
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x6], rax
	mov	x5, x0
	mov	rax, x4
	jmp	.LBB168_13
.LBB168_12:                             //   in Loop: Header=BB168_9 Depth=2
	mov	r1, 255
add	x7, 1
	mov	r0, x3
	call	__bit_and
	jz	rax, .LBB168_8
	jmp	.LBB168_9
.LBB168_13:                             // %__strtok_r.exit.sink.split
	mov	r0, mcasm_static_f3650f04f4d64e4e708b5a29025db952
	mov	[r0], x5
.LBB168_14:                             // %__strtok_r.exit
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
// -- Begin function __strtok_r
__strtok_r:                             // @__strtok_r
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
	mov	x1, r2
	mov	x2, r1
	mov	x0, r0
	jnz	x0, .LBB169_2
	jmp	.LBB169_1
.LBB169_1:
	mov	x0, [x1]
	mov	rax, 0
	jz	x0, .LBB169_20
	jmp	.LBB169_2
.LBB169_2:
	jz	r3, .LBB169_4
	jmp	.LBB169_3
.LBB169_3:                              // %.preheader7.preheader
	mov	x5, x0
	jmp	.LBB169_7
.LBB169_4:
	mov	r0, [x0]
	mov	x5, x0
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
	mov	x6, x2
.LBB169_5:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB169_11
	jmp	.LBB169_6
.LBB169_6:                              //   in Loop: Header=BB169_5 Depth=1
	mov	r1, 255
add	x6, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	je	rax, x4, .LBB169_10
	jmp	.LBB169_5
.LBB169_7:                              // %.preheader7
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB169_8 Depth 2
	mov	x0, x5
	mov	r0, [x0]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
	mov	x6, x2
.LBB169_8:                              //   Parent Loop BB169_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB169_11
	jmp	.LBB169_9
.LBB169_9:                              //   in Loop: Header=BB169_8 Depth=2
	mov	r1, 255
add	x6, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	je	rax, x4, .LBB169_7
	jmp	.LBB169_8
.LBB169_10:
	mov	[x1], x5
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	rax, x0
	jmp	.LBB169_20
.LBB169_11:                             // %.loopexit
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	jz	rax, .LBB169_13
	jmp	.LBB169_12
.LBB169_12:                             // %.preheader.preheader
	jmp	.LBB169_14
.LBB169_13:
	mov	[x1], 0
	mov	rax, 0
	jmp	.LBB169_20
.LBB169_14:                             // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB169_15 Depth 2
	mov	x6, x5
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
	mov	x7, x2
.LBB169_15:                             //   Parent Loop BB169_14 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	jne	x4, rax, .LBB169_19
	jmp	.LBB169_16
.LBB169_16:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r0, 0
	jz	rax, .LBB169_18
	jmp	.LBB169_17
.LBB169_17:
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x6], rax
	mov	r0, x5
.LBB169_18:
	mov	[x1], r0
	mov	rax, x0
	jmp	.LBB169_20
.LBB169_19:                             //   in Loop: Header=BB169_15 Depth=2
	mov	r1, 255
add	x7, 1
	mov	r0, x4
	call	__bit_and
	jz	rax, .LBB169_14
	jmp	.LBB169_15
.LBB169_20:
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
// -- Begin function strtok_r
strtok_r:                               // @strtok_r
// %bb.0:
sub	rsp, 36
	mov	[rsp+32], x0
	mov	[rsp+28], x1
	mov	[rsp+24], x2
	mov	[rsp+20], x3
	mov	[rsp+16], x4
	mov	[rsp+12], x5
	mov	[rsp+8], x6
	mov	[rsp+4], x7
	mov	[rsp], x8
	mov	x0, r2
	mov	x2, r1
	mov	x1, r0
	jnz	x1, .LBB170_2
	jmp	.LBB170_1
.LBB170_1:
	mov	x1, [x0]
	mov	rax, 0
	jz	x1, .LBB170_14
	jmp	.LBB170_2
.LBB170_2:                              // %.preheader31
.LBB170_3:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB170_4 Depth 2
	mov	x5, x1
	mov	r0, [x5]
	mov	r1, 255
add	x1, 1
	call	__bit_and
	mov	x3, rax
	mov	x6, x2
.LBB170_4:                              //   Parent Loop BB170_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB170_6
	jmp	.LBB170_5
.LBB170_5:                              //   in Loop: Header=BB170_4 Depth=2
	mov	r1, 255
add	x6, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	je	rax, x4, .LBB170_3
	jmp	.LBB170_4
.LBB170_6:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r0, rax
	mov	x7, 0
	mov	rax, 0
	jz	r0, .LBB170_13
	jmp	.LBB170_7
.LBB170_7:                              // %.preheader.preheader
.LBB170_8:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB170_9 Depth 2
	mov	x6, x1
	mov	r0, [x6]
	mov	r1, 255
add	x1, 1
	call	__bit_and
	mov	x3, rax
	mov	x8, x2
.LBB170_9:                              //   Parent Loop BB170_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x8]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	jne	x4, rax, .LBB170_12
	jmp	.LBB170_10
.LBB170_10:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r0, rax
	mov	rax, x5
	jz	r0, .LBB170_13
	jmp	.LBB170_11
.LBB170_11:
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x6], rax
	mov	x7, x1
	mov	rax, x5
	jmp	.LBB170_13
.LBB170_12:                             //   in Loop: Header=BB170_9 Depth=2
	mov	r1, 255
add	x8, 1
	mov	r0, x4
	call	__bit_and
	jz	rax, .LBB170_8
	jmp	.LBB170_9
.LBB170_13:
	mov	[x0], x7
.LBB170_14:
	mov	x8, [rsp]
	mov	x7, [rsp+4]
	mov	x6, [rsp+8]
	mov	x5, [rsp+12]
	mov	x4, [rsp+16]
	mov	x3, [rsp+20]
	mov	x2, [rsp+24]
	mov	x1, [rsp+28]
	mov	x0, [rsp+32]
add	rsp, 36
	ret
// -- End function
// -- Begin function mbrtoc16
mbrtoc16:                               // @mbrtoc16
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r0
	mov	x1, 0
                                        // implicit-def: $x2
	jz	r1, .LBB171_5
	jmp	.LBB171_1
.LBB171_1:
	mov	x1, -2
	jz	r2, .LBB171_7
	jmp	.LBB171_2
.LBB171_2:
	mov	r0, [r1]
	mov	r1, 255
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r1, 24
	mov	r0, rax
	call	__bit_sar
	mov	x1, -1
	jg	rax, x1, .LBB171_4
	jmp	.LBB171_3
.LBB171_3:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 84
	jmp	.LBB171_7
.LBB171_4:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
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
	call	__bit_and
	mov	x1, rax
.LBB171_5:                              // %mbrtowc.exit
	jz	x0, .LBB171_7
	jmp	.LBB171_6
.LBB171_6:
	mov	x3, [x0]
	mov	r1, 65535
	mov	r0, x2
	call	__bit_and
	mov	r1, -65536
	mov	x2, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 65535
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x0], rax
.LBB171_7:                              // %mbrtowc.exit.thread
	mov	rax, x1
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function c16rtomb
c16rtomb:                               // @c16rtomb
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x2, r1
	mov	x1, r0
	mov	x0, 1
	jz	x1, .LBB172_4
	jmp	.LBB172_1
.LBB172_1:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483520
	jl	rax, r0, .LBB172_3
	jmp	.LBB172_2
.LBB172_2:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 84
	mov	x0, -1
	jmp	.LBB172_4
.LBB172_3:
	mov	x3, [x1]
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, -256
	mov	x2, rax
	mov	r0, x3
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
.LBB172_4:                              // %wcrtomb.exit
	mov	rax, x0
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function mbrtoc32
mbrtoc32:                               // @mbrtoc32
// %bb.0:
sub	rsp, 8
	mov	[rsp+4], x0
	mov	[rsp], x1
	mov	rax, 0
                                        // implicit-def: $x0
	jz	r1, .LBB173_5
	jmp	.LBB173_1
.LBB173_1:
	mov	rax, -2
	jz	r2, .LBB173_7
	jmp	.LBB173_2
.LBB173_2:
	mov	x1, r0
	mov	r0, [r1]
	mov	r1, 255
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r1, 24
	mov	r0, rax
	call	__bit_sar
	mov	r0, rax
	mov	rax, -1
	jg	r0, rax, .LBB173_4
	jmp	.LBB173_3
.LBB173_3:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 84
	jmp	.LBB173_7
.LBB173_4:
	mov	r1, 255
	call	__bit_and
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
	mov	r0, x1
.LBB173_5:                              // %mbrtowc.exit
	jz	r0, .LBB173_7
	jmp	.LBB173_6
.LBB173_6:
	mov	[r0], x0
.LBB173_7:                              // %mbrtowc.exit.thread
	mov	x1, [rsp]
	mov	x0, [rsp+4]
add	rsp, 8
	ret
// -- End function
// -- Begin function c32rtomb
c32rtomb:                               // @c32rtomb
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x2, r1
	mov	x1, r0
	mov	x0, 1
	jz	x1, .LBB174_4
	jmp	.LBB174_1
.LBB174_1:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483520
	jl	rax, r0, .LBB174_3
	jmp	.LBB174_2
.LBB174_2:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 84
	mov	x0, -1
	jmp	.LBB174_4
.LBB174_3:
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
.LBB174_4:                              // %wcrtomb.exit
	mov	rax, x0
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function btowc
btowc:                                  // @btowc
// %bb.0:
sub	rsp, 8
	mov	[rsp+4], x0
	mov	[rsp], x1
	mov	x0, r0
	mov	r1, -2147483648
	mov	x1, -1
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB175_2
	jmp	.LBB175_1
.LBB175_1:
	mov	x1, x0
.LBB175_2:
	mov	rax, x1
	mov	x1, [rsp]
	mov	x0, [rsp+4]
add	rsp, 8
	ret
// -- End function
// -- Begin function wctob
wctob:                                  // @wctob
// %bb.0:
sub	rsp, 8
	mov	[rsp+4], x0
	mov	[rsp], x1
	mov	x0, r0
	mov	r1, -2147483648
	mov	x1, -1
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB176_2
	jmp	.LBB176_1
.LBB176_1:
	mov	x1, x0
.LBB176_2:
	mov	rax, x1
	mov	x1, [rsp]
	mov	x0, [rsp+4]
add	rsp, 8
	ret
// -- End function
// -- Begin function mbsinit
mbsinit:                                // @mbsinit
// %bb.0:
sub	rsp, 4
	mov	[rsp], x0
	mov	rax, 1
	jz	r0, .LBB177_2
	jmp	.LBB177_1
.LBB177_1:
	mov	x0, [r0]
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
.LBB177_2:
	mov	x0, [rsp]
add	rsp, 4
	ret
// -- End function
// -- Begin function mbrtowc
mbrtowc:                                // @mbrtowc
// %bb.0:
sub	rsp, 8
	mov	[rsp+4], x0
	mov	[rsp], x1
	mov	rax, 0
	jz	r1, .LBB178_7
	jmp	.LBB178_1
.LBB178_1:
	mov	rax, -2
	jz	r2, .LBB178_7
	jmp	.LBB178_2
.LBB178_2:
	mov	x1, r0
	mov	r0, [r1]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	mov	r1, 128
	mov	r0, rax
	call	__bit_xor
	mov	r0, rax
add	r0, -128
	mov	rax, -1
	jg	r0, rax, .LBB178_4
	jmp	.LBB178_3
.LBB178_3:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 84
	jmp	.LBB178_7
.LBB178_4:
	jz	x1, .LBB178_6
	jmp	.LBB178_5
.LBB178_5:
	mov	[x1], x0
.LBB178_6:
	mov	r1, 255
	call	__bit_and
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
.LBB178_7:
	mov	x1, [rsp]
	mov	x0, [rsp+4]
add	rsp, 8
	ret
// -- End function
// -- Begin function mbrlen
mbrlen:                                 // @mbrlen
// %bb.0:
sub	rsp, 4
	mov	[rsp], x0
	mov	rax, 0
	jz	r0, .LBB179_5
	jmp	.LBB179_1
.LBB179_1:
	mov	rax, -2
	jz	r1, .LBB179_5
	jmp	.LBB179_2
.LBB179_2:
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r1, 24
	mov	r0, rax
	call	__bit_sar
	mov	r0, rax
	mov	rax, -1
	jg	r0, rax, .LBB179_4
	jmp	.LBB179_3
.LBB179_3:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 84
	jmp	.LBB179_5
.LBB179_4:
	mov	r1, 255
	call	__bit_and
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
.LBB179_5:
	mov	x0, [rsp]
add	rsp, 4
	ret
// -- End function
// -- Begin function wcrtomb
wcrtomb:                                // @wcrtomb
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x2, r1
	mov	x1, r0
	mov	x0, 1
	jz	x1, .LBB180_4
	jmp	.LBB180_1
.LBB180_1:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483520
	jl	rax, r0, .LBB180_3
	jmp	.LBB180_2
.LBB180_2:
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 84
	mov	x0, -1
	jmp	.LBB180_4
.LBB180_3:
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x3
	mov	r1, rax
	call	__bit_or
	mov	[x1], rax
.LBB180_4:
	mov	rax, x0
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function mbstowcs
mbstowcs:                               // @mbstowcs
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
	mov	x1, r2
	mov	x3, r1
	mov	x0, r0
	jz	x0, .LBB181_2
	jmp	.LBB181_1
.LBB181_1:                              // %.preheader9.preheader
	mov	x2, 0
	mov	x6, -1
	mov	x7, x0
	jmp	.LBB181_6
.LBB181_2:
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, 0
	jz	rax, .LBB181_15
	jmp	.LBB181_3
.LBB181_3:                              // %.preheader.preheader
add	x3, 1
	mov	x4, 0
	mov	x2, 0
.LBB181_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 128
	mov	r0, rax
	call	__bit_xor
add	rax, -128
	jl	rax, x4, .LBB181_8
	jmp	.LBB181_5
.LBB181_5:                              //   in Loop: Header=BB181_4 Depth=1
	mov	r0, x3
	add	r0, x2
	mov	r0, [r0]
	mov	r1, 255
add	x2, 1
	call	__bit_and
	jz	rax, .LBB181_12
	jmp	.LBB181_4
.LBB181_6:                              // %.preheader9
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
	add	r0, x2
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r1, 24
	mov	r0, rax
	call	__bit_sar
	mov	x5, rax
	jz	x5, .LBB181_12
	jmp	.LBB181_7
.LBB181_7:                              //   in Loop: Header=BB181_6 Depth=1
	mov	r1, 255
	mov	r0, x5
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x5
	call	__bit_and
	mov	r1, 128
	mov	r0, rax
	call	__bit_xor
add	rax, -128
	jg	rax, x6, .LBB181_9
	jmp	.LBB181_8
.LBB181_8:                              // %.loopexit
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 84
	mov	r0, -1
	jmp	.LBB181_15
.LBB181_9:                              //   in Loop: Header=BB181_6 Depth=1
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x5, .LBB181_11
	jmp	.LBB181_10
.LBB181_10:                             //   in Loop: Header=BB181_6 Depth=1
	mov	[x7], x4
.LBB181_11:                             //   in Loop: Header=BB181_6 Depth=1
add	x2, 1
add	x7, 4
	mov	r0, x1
	je	x1, x2, .LBB181_15
	jmp	.LBB181_6
.LBB181_12:                             // %.loopexit8
	mov	r0, x2
	jz	x0, .LBB181_15
	jmp	.LBB181_13
.LBB181_13:                             // %.loopexit8
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, x2
	jge	rax, x1, .LBB181_15
	jmp	.LBB181_14
.LBB181_14:
	mov	r1, 2
	mov	r0, x2
	call	__bit_shl
	add	x0, rax
	mov	[x0], 0
	mov	r0, x2
.LBB181_15:                             // %.loopexit12
	mov	rax, r0
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
// -- Begin function wcstombs
wcstombs:                               // @wcstombs
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
	mov	x2, r2
	mov	x3, r1
	mov	x0, r0
	jz	x0, .LBB182_2
	jmp	.LBB182_1
.LBB182_1:                              // %.preheader9.preheader
	mov	x1, 0
	mov	x6, -2147483520
	jmp	.LBB182_6
.LBB182_2:
	mov	r0, [x3]
	mov	rax, 0
	jz	r0, .LBB182_15
	jmp	.LBB182_3
.LBB182_3:                              // %.preheader.preheader
add	x3, 4
	mov	x1, 0
	mov	x4, -2147483521
.LBB182_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	jg	rax, x4, .LBB182_8
	jmp	.LBB182_5
.LBB182_5:                              //   in Loop: Header=BB182_4 Depth=1
	mov	r0, [x3]
add	x1, 1
add	x3, 4
	jz	r0, .LBB182_12
	jmp	.LBB182_4
.LBB182_6:                              // %.preheader9
                                        // =>This Inner Loop Header: Depth=1
	mov	x4, [x3]
	jz	x4, .LBB182_12
	jmp	.LBB182_7
.LBB182_7:                              //   in Loop: Header=BB182_6 Depth=1
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	jl	rax, x6, .LBB182_9
	jmp	.LBB182_8
.LBB182_8:                              // %.loopexit
	mov	r0, mcasm_static_55a045921e650fe1b60398bd75bf5028
	mov	[r0], 84
	mov	rax, -1
	jmp	.LBB182_15
.LBB182_9:                              //   in Loop: Header=BB182_6 Depth=1
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x1
	call	__bit_xor
	jge	rax, x5, .LBB182_11
	jmp	.LBB182_10
.LBB182_10:                             //   in Loop: Header=BB182_6 Depth=1
	mov	x7, x0
	add	x7, x1
	mov	r0, [x7]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x5
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
.LBB182_11:                             //   in Loop: Header=BB182_6 Depth=1
add	x1, 1
add	x3, 4
	mov	rax, x2
	je	x2, x1, .LBB182_15
	jmp	.LBB182_6
.LBB182_12:                             // %.loopexit8
	mov	rax, x1
	jz	x0, .LBB182_15
	jmp	.LBB182_13
.LBB182_13:                             // %.loopexit8
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	mov	rax, x1
	jge	r0, x2, .LBB182_15
	jmp	.LBB182_14
.LBB182_14:
	add	x0, x1
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	rax, x1
.LBB182_15:                             // %.loopexit12
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
// -- Begin function wcslen
wcslen:                                 // @wcslen
// %bb.0:
	mov	rax, -1
.LBB183_1:                              // =>This Inner Loop Header: Depth=1
	mov	r1, [r0]
add	rax, 1
add	r0, 4
	jnz	r1, .LBB183_1
	jmp	.LBB183_2
.LBB183_2:
	ret
// -- End function
// -- Begin function wcscpy
wcscpy:                                 // @wcscpy
// %bb.0:
	mov	rax, r0
	mov	r0, 0
.LBB184_1:                              // =>This Inner Loop Header: Depth=1
	mov	r2, r1
	add	r2, r0
	mov	r2, [r2]
	mov	r3, rax
	add	r3, r0
	mov	[r3], r2
add	r0, 4
	jnz	r2, .LBB184_1
	jmp	.LBB184_2
.LBB184_2:
	ret
// -- End function
// -- Begin function wcsncpy
wcsncpy:                                // @wcsncpy
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r2
	mov	x1, r0
	mov	x2, 0
	jz	x0, .LBB185_4
	jmp	.LBB185_1
.LBB185_1:                              // %.preheader3.preheader
	mov	r0, x1
.LBB185_2:                              // %.preheader3
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, [r1]
	jz	r2, .LBB185_4
	jmp	.LBB185_3
.LBB185_3:                              //   in Loop: Header=BB185_2 Depth=1
	mov	[r0], r2
add	x2, 1
add	r0, 4
add	r1, 4
	je	x0, x2, .LBB185_7
	jmp	.LBB185_2
.LBB185_4:                              // %.loopexit4
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x0
	call	__bit_xor
	jle	rax, x3, .LBB185_7
	jmp	.LBB185_5
.LBB185_5:                              // %.preheader.preheader
	mov	r1, 2
	sub	x0, x2
	mov	r0, x2
	call	__bit_shl
	add	rax, x1
.LBB185_6:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	[rax], 0
add	x0, -1
add	rax, 4
	jnz	x0, .LBB185_6
	jmp	.LBB185_7
.LBB185_7:                              // %.loopexit
	mov	rax, x1
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function wcscat
wcscat:                                 // @wcscat
// %bb.0:
	mov	rax, r0
	mov	r0, 0
.LBB186_1:                              // =>This Inner Loop Header: Depth=1
	mov	r2, rax
	add	r2, r0
	mov	r2, [r2]
add	r0, 4
	jnz	r2, .LBB186_1
	jmp	.LBB186_2
.LBB186_2:
add	r0, -4
.LBB186_3:                              // =>This Inner Loop Header: Depth=1
	mov	r2, [r1]
	mov	r3, rax
	add	r3, r0
add	r1, 4
	mov	[r3], r2
add	r0, 4
	jnz	r2, .LBB186_3
	jmp	.LBB186_4
.LBB186_4:
	ret
// -- End function
// -- Begin function wcsncat
wcsncat:                                // @wcsncat
// %bb.0:
sub	rsp, 8
	mov	[rsp+4], x0
	mov	[rsp], x1
	mov	x0, r0
	mov	x1, x0
add	x1, -4
.LBB187_1:                              // =>This Inner Loop Header: Depth=1
add	x1, 4
	mov	r0, [x1]
	jnz	r0, .LBB187_1
	jmp	.LBB187_2
.LBB187_2:
	mov	r0, 0
	jz	r2, .LBB187_6
	jmp	.LBB187_3
.LBB187_3:                              // %.preheader.preheader
	mov	r3, 0
	mov	r4, x1
.LBB187_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r5, [r1]
	mov	r0, r3
	jz	r5, .LBB187_6
	jmp	.LBB187_5
.LBB187_5:                              //   in Loop: Header=BB187_4 Depth=1
	mov	[r4], r5
add	r3, 1
add	r4, 4
add	r1, 4
	mov	r0, r2
	jne	r2, r3, .LBB187_4
	jmp	.LBB187_6
.LBB187_6:                              // %.loopexit
	mov	r1, 2
	call	__bit_shl
	add	x1, rax
	mov	[x1], 0
	mov	rax, x0
	mov	x1, [rsp]
	mov	x0, [rsp+4]
add	rsp, 8
	ret
// -- End function
// -- Begin function wcscmp
wcscmp:                                 // @wcscmp
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	r3, [r0]
	mov	r2, 0
	jz	r3, .LBB188_4
	jmp	.LBB188_1
.LBB188_1:                              // %.preheader.preheader
add	r0, 4
.LBB188_2:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r4, [r1]
	mov	r2, r3
	jne	r3, r4, .LBB188_4
	jmp	.LBB188_3
.LBB188_3:                              //   in Loop: Header=BB188_2 Depth=1
	mov	r3, [r0]
add	r1, 4
add	r0, 4
	mov	r2, 0
	jnz	r3, .LBB188_2
	jmp	.LBB188_4
.LBB188_4:                              // %.loopexit
	mov	x0, [r1]
	mov	r1, -2147483648
	mov	r0, r2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x0
	call	__bit_xor
	mov	x0, rax
	mov	r0, x1
	mov	r1, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x1
	sub	r1, x0
	mov	r0, rax
	call	__bit_and
	mov	x2, rax
	mov	r0, x1
	call	__bit_not
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	x2, rax
	mov	r0, x0
	mov	r1, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
	sub	r1, x1
	mov	r0, rax
	call	__bit_and
	mov	x3, rax
	mov	r0, x0
	call	__bit_not
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
	mov	r0, x0
	call	__bit_not
add	x2, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	add	rax, x0
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function wcsncmp
wcsncmp:                                // @wcsncmp
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	rax, 0
	jz	r2, .LBB189_6
	jmp	.LBB189_1
.LBB189_1:                              // %.preheader.preheader
	jmp	.LBB189_3
.LBB189_2:                              //   in Loop: Header=BB189_3 Depth=1
add	r2, -1
add	r1, 4
add	r0, 4
	jz	r2, .LBB189_6
	jmp	.LBB189_3
.LBB189_3:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r3, [r0]
	mov	x0, [r1]
	jz	r3, .LBB189_5
	jmp	.LBB189_4
.LBB189_4:                              // %.preheader
                                        //   in Loop: Header=BB189_3 Depth=1
	je	r3, x0, .LBB189_2
	jmp	.LBB189_5
.LBB189_5:
	mov	r1, -2147483648
	mov	r0, r3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x0
	call	__bit_xor
	mov	x0, rax
	mov	r0, x1
	mov	r1, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x1
	sub	r1, x0
	mov	r0, rax
	call	__bit_and
	mov	x2, rax
	mov	r0, x1
	call	__bit_not
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
	mov	x2, rax
	mov	r0, x0
	mov	r1, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
	sub	r1, x1
	mov	r0, rax
	call	__bit_and
	mov	x3, rax
	mov	r0, x0
	call	__bit_not
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, rax
	mov	r1, x3
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x0, rax
	mov	r0, x0
	call	__bit_not
add	x2, 1
	mov	r0, x2
	mov	r1, rax
	call	__bit_and
	add	rax, x0
.LBB189_6:                              // %.loopexit
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function wcschr
wcschr:                                 // @wcschr
// %bb.0:
.LBB190_1:                              // =>This Inner Loop Header: Depth=1
	mov	r2, [r0]
	mov	rax, r0
	je	r2, r1, .LBB190_3
	jmp	.LBB190_2
.LBB190_2:                              //   in Loop: Header=BB190_1 Depth=1
add	r0, 4
	mov	rax, 0
	jnz	r2, .LBB190_1
	jmp	.LBB190_3
.LBB190_3:
	ret
// -- End function
// -- Begin function wcsrchr
wcsrchr:                                // @wcsrchr
// %bb.0:
sub	rsp, 20
	mov	[rsp+16], x0
	mov	[rsp+12], x1
	mov	[rsp+8], x2
	mov	[rsp+4], x3
	mov	[rsp], x4
	mov	x0, r1
	mov	x1, r0
	mov	rax, 0
.LBB191_1:                              // =>This Inner Loop Header: Depth=1
	mov	x2, [x1]
	mov	x4, rax
	mov	r0, x2
	mov	r1, x0
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
	mov	r1, x1
	sub	r1, x4
	mov	r0, rax
	call	__bit_and
	add	rax, x4
add	x1, 4
	jnz	x2, .LBB191_1
	jmp	.LBB191_2
.LBB191_2:
	mov	x4, [rsp]
	mov	x3, [rsp+4]
	mov	x2, [rsp+8]
	mov	x1, [rsp+12]
	mov	x0, [rsp+16]
add	rsp, 20
	ret
// -- End function
// -- Begin function wcsspn
wcsspn:                                 // @wcsspn
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	mov	r0, [x0]
	mov	x1, r1
	mov	x2, 0
	jz	r0, .LBB192_6
	jmp	.LBB192_1
.LBB192_1:                              // %.preheader.preheader
.LBB192_2:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB192_3 Depth 2
	mov	r1, x1
.LBB192_3:                              //   Parent Loop BB192_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r2, [r1]
	je	r2, r0, .LBB192_5
	jmp	.LBB192_4
.LBB192_4:                              //   in Loop: Header=BB192_3 Depth=2
add	r1, 4
	jz	r2, .LBB192_6
	jmp	.LBB192_3
.LBB192_5:                              //   in Loop: Header=BB192_2 Depth=1
add	x2, 1
	mov	r1, 2
	mov	r0, x2
	call	__bit_shl
	add	rax, x0
	mov	r0, [rax]
	jnz	r0, .LBB192_2
	jmp	.LBB192_6
.LBB192_6:                              // %.loopexit
	mov	rax, x2
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function wcscspn
wcscspn:                                // @wcscspn
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	mov	r0, [x0]
	mov	x1, r1
	mov	x2, 0
	jz	r0, .LBB193_6
	jmp	.LBB193_1
.LBB193_1:                              // %.preheader.preheader
.LBB193_2:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB193_3 Depth 2
	mov	r1, x1
.LBB193_3:                              //   Parent Loop BB193_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r2, [r1]
	je	r2, r0, .LBB193_6
	jmp	.LBB193_4
.LBB193_4:                              //   in Loop: Header=BB193_3 Depth=2
add	r1, 4
	jnz	r2, .LBB193_3
	jmp	.LBB193_5
.LBB193_5:                              //   in Loop: Header=BB193_2 Depth=1
add	x2, 1
	mov	r1, 2
	mov	r0, x2
	call	__bit_shl
	add	rax, x0
	mov	r0, [rax]
	jnz	r0, .LBB193_2
	jmp	.LBB193_6
.LBB193_6:                              // %.loopexit
	mov	rax, x2
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function wcspbrk
wcspbrk:                                // @wcspbrk
// %bb.0:
	mov	r2, [r0]
	mov	rax, 0
	jz	r2, .LBB194_6
	jmp	.LBB194_1
.LBB194_1:                              // %.preheader.preheader
.LBB194_2:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB194_3 Depth 2
	mov	rax, r0
	mov	r0, r1
.LBB194_3:                              //   Parent Loop BB194_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r3, [r0]
	je	r3, r2, .LBB194_6
	jmp	.LBB194_4
.LBB194_4:                              //   in Loop: Header=BB194_3 Depth=2
add	r0, 4
	jnz	r3, .LBB194_3
	jmp	.LBB194_5
.LBB194_5:                              //   in Loop: Header=BB194_2 Depth=1
add	rax, 4
	mov	r2, [rax]
	mov	r0, rax
	mov	rax, 0
	jnz	r2, .LBB194_2
	jmp	.LBB194_6
.LBB194_6:                              // %.loopexit
	ret
// -- End function
// -- Begin function wcsstr
wcsstr:                                 // @wcsstr
// %bb.0:
	mov	r2, -1
	mov	r3, r1
.LBB195_1:                              // =>This Inner Loop Header: Depth=1
	mov	r4, [r3]
add	r2, 1
add	r3, 4
	jnz	r4, .LBB195_1
	jmp	.LBB195_2
.LBB195_2:
	mov	rax, r0
	jz	r2, .LBB195_11
	jmp	.LBB195_3
.LBB195_3:
	mov	r3, [r0]
	mov	rax, 0
	jz	r3, .LBB195_11
	jmp	.LBB195_4
.LBB195_4:                              // %.preheader.preheader
.LBB195_5:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB195_7 Depth 2
	mov	rax, r0
	mov	r0, 0
	mov	r3, r2
	jmp	.LBB195_7
.LBB195_6:                              //   in Loop: Header=BB195_7 Depth=2
add	r3, -1
add	r0, 4
	jz	r3, .LBB195_11
	jmp	.LBB195_7
.LBB195_7:                              //   Parent Loop BB195_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r4, rax
	add	r4, r0
	mov	r4, [r4]
	mov	r5, r1
	add	r5, r0
	mov	r5, [r5]
	jz	r4, .LBB195_9
	jmp	.LBB195_8
.LBB195_8:                              //   in Loop: Header=BB195_7 Depth=2
	je	r4, r5, .LBB195_6
	jmp	.LBB195_9
.LBB195_9:                              //   in Loop: Header=BB195_5 Depth=1
	je	r4, r5, .LBB195_11
	jmp	.LBB195_10
.LBB195_10:                             //   in Loop: Header=BB195_5 Depth=1
add	rax, 4
	mov	r3, [rax]
	mov	r0, rax
	mov	rax, 0
	jnz	r3, .LBB195_5
	jmp	.LBB195_11
.LBB195_11:                             // %.loopexit
	ret
// -- End function
// -- Begin function iswalnum
iswalnum:                               // @iswalnum
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r0
	mov	r1, -2147483648
	mov	x1, 0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB196_2
	jmp	.LBB196_1
.LBB196_1:
	mov	r1, 95
	mov	r0, x0
	call	__bit_and
	mov	x1, rax
	mov	x2, x1
add	x2, -65
	mov	r0, x2
	call	__bit_not
	mov	r1, 26
	mov	r0, rax
	call	__bit_and
	mov	r1, 26
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -91
	mov	r0, rax
	mov	r1, x1
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
	mov	x1, x0
add	x1, -48
	mov	x2, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, 10
	mov	r0, rax
	call	__bit_and
	mov	r1, 10
	mov	x3, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -58
	mov	r0, rax
	mov	r1, x0
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
	mov	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
.LBB196_2:
	mov	rax, x1
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function iswalpha
iswalpha:                               // @iswalpha
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r0
	call	__bit_not
	mov	r1, 128
	mov	r0, rax
	call	__bit_and
	mov	r1, 128
	mov	x1, rax
	mov	r0, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
add	r1, -128
	mov	r0, rax
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
	mov	r1, -33
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	x0, rax
	mov	x2, x0
add	x2, -65
	mov	r0, x2
	call	__bit_not
	mov	r1, 26
	mov	r0, rax
	call	__bit_and
	mov	r1, 26
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -91
	mov	r0, rax
	mov	r1, x0
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
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function iswblank
iswblank:                               // @iswblank
// %bb.0:
sub	rsp, 8
	mov	[rsp+4], x0
	mov	[rsp], x1
	mov	r1, 32
	mov	x0, r0
	call	__bit_xor
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
	mov	r1, 9
	mov	x1, rax
	mov	r0, x0
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
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, [rsp]
	mov	x0, [rsp+4]
add	rsp, 8
	ret
// -- End function
// -- Begin function iswcntrl
iswcntrl:                               // @iswcntrl
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	call	__bit_not
	mov	r1, 128
	mov	x2, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 128
	mov	x1, rax
	mov	r0, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
add	r1, -128
	mov	r0, rax
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
	mov	r1, 32
	mov	x1, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 32
	mov	x2, rax
	mov	r0, x0
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
add	r1, -32
	mov	r0, rax
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 127
	mov	x2, rax
	mov	r0, x0
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
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r0, x1
	mov	r1, rax
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function iswdigit
iswdigit:                               // @iswdigit
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	mov	x1, x0
add	x1, -48
	mov	r0, x1
	call	__bit_not
	mov	r1, 10
	mov	r0, rax
	call	__bit_and
	mov	r1, 10
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -58
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
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
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function iswgraph
iswgraph:                               // @iswgraph
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	mov	x1, x0
add	x1, -33
	mov	r0, x1
	call	__bit_not
	mov	r1, 94
	mov	r0, rax
	call	__bit_and
	mov	r1, 94
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -127
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
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
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function iswlower
iswlower:                               // @iswlower
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	mov	x1, x0
add	x1, -97
	mov	r0, x1
	call	__bit_not
	mov	r1, 26
	mov	r0, rax
	call	__bit_and
	mov	r1, 26
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -123
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
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
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function iswprint
iswprint:                               // @iswprint
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	mov	x1, x0
add	x1, -32
	mov	r0, x1
	call	__bit_not
	mov	r1, 95
	mov	r0, rax
	call	__bit_and
	mov	r1, 95
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -127
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
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
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function iswpunct
iswpunct:                               // @iswpunct
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r0
add	r0, -127
	mov	r1, -2147483648
	mov	x1, 0
	call	__bit_xor
	mov	r0, 2147483554
	jl	rax, r0, .LBB204_2
	jmp	.LBB204_1
.LBB204_1:
	mov	r1, 95
	mov	r0, x0
	call	__bit_and
	mov	x1, rax
	mov	x2, x1
add	x2, -91
	mov	r0, x2
	call	__bit_not
	mov	r1, -26
	mov	r0, rax
	call	__bit_and
	mov	r1, -26
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -65
	mov	r0, rax
	mov	r1, x1
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
	mov	x1, x0
add	x1, -58
	mov	x2, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, -10
	mov	r0, rax
	call	__bit_and
	mov	r1, -10
	mov	x3, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -48
	mov	r0, rax
	mov	r1, x0
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
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
.LBB204_2:                              // %ispunct.exit
	mov	rax, x1
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function iswspace
iswspace:                               // @iswspace
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	mov	r1, -2147483648
	mov	x1, 0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB205_5
	jmp	.LBB205_1
.LBB205_1:
	mov	r0, x0
add	r0, -9
	mov	r1, -2147483648
	mov	x1, 1
	call	__bit_xor
	mov	x2, -2147483646
	jl	rax, x2, .LBB205_5
	jmp	.LBB205_2
.LBB205_2:
	mov	r0, x0
add	r0, -12
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, x2, .LBB205_5
	jmp	.LBB205_3
.LBB205_3:
	mov	r0, 32
	je	x0, r0, .LBB205_5
	jmp	.LBB205_4
.LBB205_4:
	mov	r1, 11
	mov	r0, x0
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
.LBB205_5:                              // %isspace.exit
	mov	rax, x1
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function iswupper
iswupper:                               // @iswupper
// %bb.0:
sub	rsp, 12
	mov	[rsp+8], x0
	mov	[rsp+4], x1
	mov	[rsp], x2
	mov	x0, r0
	mov	x1, x0
add	x1, -65
	mov	r0, x1
	call	__bit_not
	mov	r1, 26
	mov	r0, rax
	call	__bit_and
	mov	r1, 26
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -91
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
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
	mov	x2, [rsp]
	mov	x1, [rsp+4]
	mov	x0, [rsp+8]
add	rsp, 12
	ret
// -- End function
// -- Begin function iswxdigit
iswxdigit:                              // @iswxdigit
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r0
	mov	r1, -2147483648
	mov	x1, 0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB207_2
	jmp	.LBB207_1
.LBB207_1:
	mov	x1, x0
add	x1, -48
	mov	r0, x1
	call	__bit_not
	mov	r1, 10
	mov	r0, rax
	call	__bit_and
	mov	r1, 10
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
add	r1, -58
	mov	r0, rax
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 95
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	x0, rax
	mov	x2, x0
add	x2, -65
	mov	r0, x2
	call	__bit_not
	mov	r1, 6
	mov	r0, rax
	call	__bit_and
	mov	r1, 6
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -71
	mov	r0, rax
	mov	r1, x0
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
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
.LBB207_2:
	mov	rax, x1
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function towlower
towlower:                               // @towlower
// %bb.0:
sub	rsp, 4
	mov	[rsp], x0
	mov	x0, r0
add	r0, -91
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483622
	jl	rax, r0, .LBB208_2
	jmp	.LBB208_1
.LBB208_1:
add	x0, 32
.LBB208_2:
	mov	rax, x0
	mov	x0, [rsp]
add	rsp, 4
	ret
// -- End function
// -- Begin function towupper
towupper:                               // @towupper
// %bb.0:
sub	rsp, 4
	mov	[rsp], x0
	mov	x0, r0
add	r0, -123
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483622
	jl	rax, r0, .LBB209_2
	jmp	.LBB209_1
.LBB209_1:
add	x0, -32
.LBB209_2:
	mov	rax, x0
	mov	x0, [rsp]
add	rsp, 4
	ret
// -- End function
// -- Begin function wctype
wctype:                                 // @wctype
// %bb.0:
sub	rsp, 28
	mov	[rsp+24], x0
	mov	[rsp+20], x1
	mov	[rsp+16], x2
	mov	[rsp+12], x3
	mov	[rsp+8], x4
	mov	[rsp+4], x5
	mov	[rsp], x6
	mov	r1, 3
	mov	x0, r0
	call	__bit_and
	mov	x2, rax
	jz	x2, .LBB210_2
	jmp	.LBB210_1
.LBB210_1:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x1, rax
	mov	x5, mcasm_static_49a5109f92ceefa38800cc72e4ca6ad3
	mov	x3, x1
	mov	x6, x0
	jmp	.LBB210_7
.LBB210_2:
	mov	x1, [x0]
	mov	r1, 1970170977
	mov	x5, mcasm_static_49a5109f92ceefa38800cc72e4ca6ad3
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB210_7
	jmp	.LBB210_3
.LBB210_3:                              // %.preheader5.i.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB210_4:                              // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 1
	jne	r0, x3, .LBB210_113
	jmp	.LBB210_5
.LBB210_5:                              //   in Loop: Header=BB210_4 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB210_4
	jmp	.LBB210_6
.LBB210_6:
	mov	x3, r1
.LBB210_7:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB210_12
	jmp	.LBB210_8
.LBB210_8:                              // %.preheader.i.preheader
add	x6, 1
.LBB210_9:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB210_11
	jmp	.LBB210_10
.LBB210_10:                             //   in Loop: Header=BB210_9 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB210_9
	jmp	.LBB210_11
.LBB210_11:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB210_12:                             // %strcmp.exit
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 1
	je	x4, r0, .LBB210_113
	jmp	.LBB210_13
.LBB210_13:
	mov	x5, mcasm_static_4b9b09ee6f896879697b4a47d8c9c5fc
	mov	x3, x1
	mov	x6, x0
	jnz	x2, .LBB210_19
	jmp	.LBB210_14
.LBB210_14:
	mov	x1, [x0]
	mov	r1, 1752198241
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB210_19
	jmp	.LBB210_15
.LBB210_15:                             // %.preheader5.i2.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB210_16:                             // %.preheader5.i2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 2
	jne	r0, x3, .LBB210_113
	jmp	.LBB210_17
.LBB210_17:                             //   in Loop: Header=BB210_16 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB210_16
	jmp	.LBB210_18
.LBB210_18:
	mov	x3, r1
.LBB210_19:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB210_24
	jmp	.LBB210_20
.LBB210_20:                             // %.preheader.i1.preheader
add	x6, 1
.LBB210_21:                             // %.preheader.i1
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB210_23
	jmp	.LBB210_22
.LBB210_22:                             //   in Loop: Header=BB210_21 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB210_21
	jmp	.LBB210_23
.LBB210_23:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB210_24:                             // %strcmp.exit3
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 2
	je	x4, r0, .LBB210_113
	jmp	.LBB210_25
.LBB210_25:
	mov	x5, mcasm_static_831c3fe9d24a16a87d2b67ceb4c3d643
	mov	x3, x1
	mov	x6, x0
	jnz	x2, .LBB210_31
	jmp	.LBB210_26
.LBB210_26:
	mov	x1, [x0]
	mov	r1, 1851878498
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB210_31
	jmp	.LBB210_27
.LBB210_27:                             // %.preheader5.i5.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB210_28:                             // %.preheader5.i5
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 3
	jne	r0, x3, .LBB210_113
	jmp	.LBB210_29
.LBB210_29:                             //   in Loop: Header=BB210_28 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB210_28
	jmp	.LBB210_30
.LBB210_30:
	mov	x3, r1
.LBB210_31:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB210_36
	jmp	.LBB210_32
.LBB210_32:                             // %.preheader.i4.preheader
add	x6, 1
.LBB210_33:                             // %.preheader.i4
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB210_35
	jmp	.LBB210_34
.LBB210_34:                             //   in Loop: Header=BB210_33 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB210_33
	jmp	.LBB210_35
.LBB210_35:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB210_36:                             // %strcmp.exit6
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 3
	je	x4, r0, .LBB210_113
	jmp	.LBB210_37
.LBB210_37:
	mov	x5, mcasm_static_2ff774bcb9014c3a911380781c7ac4c8
	mov	x3, x1
	mov	x6, x0
	jnz	x2, .LBB210_43
	jmp	.LBB210_38
.LBB210_38:
	mov	x1, [x0]
	mov	r1, 1920233059
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB210_43
	jmp	.LBB210_39
.LBB210_39:                             // %.preheader5.i8.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB210_40:                             // %.preheader5.i8
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 4
	jne	r0, x3, .LBB210_113
	jmp	.LBB210_41
.LBB210_41:                             //   in Loop: Header=BB210_40 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB210_40
	jmp	.LBB210_42
.LBB210_42:
	mov	x3, r1
.LBB210_43:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB210_48
	jmp	.LBB210_44
.LBB210_44:                             // %.preheader.i7.preheader
add	x6, 1
.LBB210_45:                             // %.preheader.i7
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB210_47
	jmp	.LBB210_46
.LBB210_46:                             //   in Loop: Header=BB210_45 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB210_45
	jmp	.LBB210_47
.LBB210_47:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB210_48:                             // %strcmp.exit9
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 4
	je	x4, r0, .LBB210_113
	jmp	.LBB210_49
.LBB210_49:
	mov	x5, mcasm_static_f95ff8e7835d8141f46ea1fcd089b140
	mov	x3, x1
	mov	x6, x0
	jnz	x2, .LBB210_55
	jmp	.LBB210_50
.LBB210_50:
	mov	x1, [x0]
	mov	r1, 1768384868
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB210_55
	jmp	.LBB210_51
.LBB210_51:                             // %.preheader5.i11.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB210_52:                             // %.preheader5.i11
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 5
	jne	r0, x3, .LBB210_113
	jmp	.LBB210_53
.LBB210_53:                             //   in Loop: Header=BB210_52 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB210_52
	jmp	.LBB210_54
.LBB210_54:
	mov	x3, r1
.LBB210_55:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB210_60
	jmp	.LBB210_56
.LBB210_56:                             // %.preheader.i10.preheader
add	x6, 1
.LBB210_57:                             // %.preheader.i10
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB210_59
	jmp	.LBB210_58
.LBB210_58:                             //   in Loop: Header=BB210_57 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB210_57
	jmp	.LBB210_59
.LBB210_59:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB210_60:                             // %strcmp.exit12
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 5
	je	x4, r0, .LBB210_113
	jmp	.LBB210_61
.LBB210_61:
	mov	x5, mcasm_static_3cc2643f484014ba60d082a3adc8ff40
	mov	x3, x1
	mov	x6, x0
	jnz	x2, .LBB210_67
	jmp	.LBB210_62
.LBB210_62:
	mov	x1, [x0]
	mov	r1, 1885434471
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB210_67
	jmp	.LBB210_63
.LBB210_63:                             // %.preheader5.i14.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB210_64:                             // %.preheader5.i14
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 6
	jne	r0, x3, .LBB210_113
	jmp	.LBB210_65
.LBB210_65:                             //   in Loop: Header=BB210_64 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB210_64
	jmp	.LBB210_66
.LBB210_66:
	mov	x3, r1
.LBB210_67:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB210_72
	jmp	.LBB210_68
.LBB210_68:                             // %.preheader.i13.preheader
add	x6, 1
.LBB210_69:                             // %.preheader.i13
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB210_71
	jmp	.LBB210_70
.LBB210_70:                             //   in Loop: Header=BB210_69 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB210_69
	jmp	.LBB210_71
.LBB210_71:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB210_72:                             // %strcmp.exit15
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 6
	je	x4, r0, .LBB210_113
	jmp	.LBB210_73
.LBB210_73:
	mov	x5, mcasm_static_8b857911b53176404d907e1698ae13bd
	mov	x3, x1
	mov	x6, x0
	jnz	x2, .LBB210_79
	jmp	.LBB210_74
.LBB210_74:
	mov	x1, [x0]
	mov	r1, 1702326124
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB210_79
	jmp	.LBB210_75
.LBB210_75:                             // %.preheader5.i17.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB210_76:                             // %.preheader5.i17
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 7
	jne	r0, x3, .LBB210_113
	jmp	.LBB210_77
.LBB210_77:                             //   in Loop: Header=BB210_76 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB210_76
	jmp	.LBB210_78
.LBB210_78:
	mov	x3, r1
.LBB210_79:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB210_84
	jmp	.LBB210_80
.LBB210_80:                             // %.preheader.i16.preheader
add	x6, 1
.LBB210_81:                             // %.preheader.i16
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB210_83
	jmp	.LBB210_82
.LBB210_82:                             //   in Loop: Header=BB210_81 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB210_81
	jmp	.LBB210_83
.LBB210_83:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB210_84:                             // %strcmp.exit18
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 7
	je	x4, r0, .LBB210_113
	jmp	.LBB210_85
.LBB210_85:
	mov	x5, mcasm_static_6a452fd7e76ec8d0e228954ea70781ff
	mov	x3, x1
	mov	x6, x0
	jnz	x2, .LBB210_91
	jmp	.LBB210_86
.LBB210_86:
	mov	x1, [x0]
	mov	r1, 1852404336
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB210_91
	jmp	.LBB210_87
.LBB210_87:                             // %.preheader5.i20.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB210_88:                             // %.preheader5.i20
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 8
	jne	r0, x3, .LBB210_113
	jmp	.LBB210_89
.LBB210_89:                             //   in Loop: Header=BB210_88 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB210_88
	jmp	.LBB210_90
.LBB210_90:
	mov	x3, r1
.LBB210_91:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB210_96
	jmp	.LBB210_92
.LBB210_92:                             // %.preheader.i19.preheader
add	x6, 1
.LBB210_93:                             // %.preheader.i19
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB210_95
	jmp	.LBB210_94
.LBB210_94:                             //   in Loop: Header=BB210_93 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB210_93
	jmp	.LBB210_95
.LBB210_95:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB210_96:                             // %strcmp.exit21
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 8
	je	x4, r0, .LBB210_113
	jmp	.LBB210_97
.LBB210_97:
	mov	x3, mcasm_static_196cd0402715f554a45f30ca8d022c9b
	mov	x4, x0
	jnz	x2, .LBB210_103
	jmp	.LBB210_98
.LBB210_98:
	mov	x1, [x0]
	mov	r1, 1668183408
	mov	x4, x0
	jne	x1, r1, .LBB210_103
	jmp	.LBB210_99
.LBB210_99:                             // %.preheader5.i23.preheader
	mov	x1, -2139062144
	mov	x4, x0
.LBB210_100:                            // %.preheader5.i23
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 9
	jne	r0, x1, .LBB210_113
	jmp	.LBB210_101
.LBB210_101:                            //   in Loop: Header=BB210_100 Depth=1
add	x4, 4
add	x3, 4
	mov	r1, [x4]
	mov	r0, [x3]
	je	r1, r0, .LBB210_100
	jmp	.LBB210_102
.LBB210_102:
	mov	x1, r1
.LBB210_103:
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	x2, 0
	jz	rax, .LBB210_108
	jmp	.LBB210_104
.LBB210_104:                            // %.preheader.i22.preheader
add	x4, 1
.LBB210_105:                            // %.preheader.i22
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, x1
	jne	rax, x2, .LBB210_107
	jmp	.LBB210_106
.LBB210_106:                            //   in Loop: Header=BB210_105 Depth=1
	mov	r0, [x4]
	mov	r1, 255
add	x3, 1
	call	__bit_and
	mov	x1, rax
add	x4, 1
	mov	r0, 0
	jnz	x1, .LBB210_105
	jmp	.LBB210_107
.LBB210_107:
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
.LBB210_108:                            // %strcmp.exit24
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 9
	je	x2, r0, .LBB210_113
	jmp	.LBB210_109
.LBB210_109:
	mov	r1, mcasm_static_69a5bd66c23542b255208638cb53437e
	mov	r0, x0
	call	strcmp
	mov	r0, rax
	mov	rax, 10
	jz	r0, .LBB210_113
	jmp	.LBB210_110
.LBB210_110:
	mov	r1, mcasm_static_1e5cb7442438447ddc3b1b8f42d5f9b7
	mov	r0, x0
	call	strcmp
	mov	r0, rax
	mov	rax, 11
	jz	r0, .LBB210_113
	jmp	.LBB210_111
.LBB210_111:
	mov	r1, mcasm_static_e22da8b3b8a126110747d7382875f9a6
	mov	r0, x0
	call	strcmp
	mov	r0, rax
	mov	rax, 12
	jz	r0, .LBB210_113
	jmp	.LBB210_112
.LBB210_112:
	mov	rax, 0
.LBB210_113:                            // %strcmp.exit.thread
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
// -- Begin function iswctype
iswctype:                               // @iswctype
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	x0, r0
	mov	r0, 6
	mov	x1, 0
	jg	r1, r0, .LBB211_8
	jmp	.LBB211_1
.LBB211_1:
	mov	r0, 3
	jg	r1, r0, .LBB211_5
	jmp	.LBB211_2
.LBB211_2:
	mov	r0, 1
	je	r1, r0, .LBB211_15
	jmp	.LBB211_3
.LBB211_3:
	mov	r0, 2
	je	r1, r0, .LBB211_17
	jmp	.LBB211_4
.LBB211_4:
	mov	r0, 3
	je	r1, r0, .LBB211_19
	jmp	.LBB211_40
.LBB211_5:
	mov	r0, 4
	je	r1, r0, .LBB211_21
	jmp	.LBB211_6
.LBB211_6:
	mov	r0, 5
	je	r1, r0, .LBB211_23
	jmp	.LBB211_7
.LBB211_7:
	mov	r0, 6
	je	r1, r0, .LBB211_25
	jmp	.LBB211_40
.LBB211_8:
	mov	r0, 9
	jg	r1, r0, .LBB211_12
	jmp	.LBB211_9
.LBB211_9:
	mov	r0, 7
	je	r1, r0, .LBB211_27
	jmp	.LBB211_10
.LBB211_10:
	mov	r0, 8
	je	r1, r0, .LBB211_29
	jmp	.LBB211_11
.LBB211_11:
	mov	r0, 9
	je	r1, r0, .LBB211_31
	jmp	.LBB211_40
.LBB211_12:
	mov	r0, 10
	je	r1, r0, .LBB211_33
	jmp	.LBB211_13
.LBB211_13:
	mov	r0, 11
	je	r1, r0, .LBB211_35
	jmp	.LBB211_14
.LBB211_14:
	mov	r0, 12
	je	r1, r0, .LBB211_37
	jmp	.LBB211_40
.LBB211_15:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB211_40
	jmp	.LBB211_16
.LBB211_16:
	mov	r1, 95
	mov	r0, x0
	call	__bit_and
	mov	x1, rax
	mov	x2, x1
add	x2, -65
	mov	r0, x2
	call	__bit_not
	mov	r1, 26
	mov	r0, rax
	call	__bit_and
	mov	r1, 26
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -91
	mov	r0, rax
	mov	r1, x1
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
	mov	x1, x0
add	x1, -48
	mov	x2, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, 10
	mov	r0, rax
	call	__bit_and
	mov	r1, 10
	mov	x3, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -58
	mov	r0, rax
	mov	r1, x0
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
	mov	r0, rax
	mov	r1, x2
	call	__bit_or
	mov	x1, rax
	jmp	.LBB211_40
.LBB211_17:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB211_40
	jmp	.LBB211_18
.LBB211_18:
	mov	r1, 95
	mov	r0, x0
	call	__bit_and
	mov	x0, rax
	mov	x1, x0
add	x1, -65
	mov	r0, x1
	call	__bit_not
	mov	r1, 26
	mov	r0, rax
	call	__bit_and
	mov	r1, 26
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -91
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	jmp	.LBB211_40
.LBB211_19:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB211_40
	jmp	.LBB211_20
.LBB211_20:
	mov	r1, 32
	mov	r0, x0
	call	__bit_xor
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
	mov	r1, 9
	mov	x1, rax
	mov	r0, x0
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
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	x1, rax
	jmp	.LBB211_40
.LBB211_21:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB211_40
	jmp	.LBB211_22
.LBB211_22:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	x1, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, -2147483616
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483616
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, 2147483616
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 127
	mov	x1, rax
	mov	r0, x0
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
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	x1, rax
	jmp	.LBB211_40
.LBB211_23:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB211_40
	jmp	.LBB211_24
.LBB211_24:
	mov	x1, x0
add	x1, -48
	mov	r0, x1
	call	__bit_not
	mov	r1, 10
	mov	r0, rax
	call	__bit_and
	mov	r1, 10
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -58
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	jmp	.LBB211_40
.LBB211_25:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB211_40
	jmp	.LBB211_26
.LBB211_26:
	mov	x1, x0
add	x1, -33
	mov	r0, x1
	call	__bit_not
	mov	r1, 94
	mov	r0, rax
	call	__bit_and
	mov	r1, 94
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -127
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	jmp	.LBB211_40
.LBB211_27:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB211_40
	jmp	.LBB211_28
.LBB211_28:
	mov	x1, x0
add	x1, -97
	mov	r0, x1
	call	__bit_not
	mov	r1, 26
	mov	r0, rax
	call	__bit_and
	mov	r1, 26
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -123
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	jmp	.LBB211_40
.LBB211_29:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB211_40
	jmp	.LBB211_30
.LBB211_30:
	mov	x1, x0
add	x1, -32
	mov	r0, x1
	call	__bit_not
	mov	r1, 95
	mov	r0, rax
	call	__bit_and
	mov	r1, 95
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -127
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	jmp	.LBB211_40
.LBB211_31:
	mov	r0, x0
add	r0, -127
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483554
	jl	rax, r0, .LBB211_40
	jmp	.LBB211_32
.LBB211_32:
	mov	r1, 95
	mov	r0, x0
	call	__bit_and
	mov	x1, rax
	mov	x2, x1
add	x2, -91
	mov	r0, x2
	call	__bit_not
	mov	r1, -26
	mov	r0, rax
	call	__bit_and
	mov	r1, -26
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x1, -65
	mov	r0, rax
	mov	r1, x1
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
	mov	x1, x0
add	x1, -58
	mov	x2, rax
	mov	r0, x1
	call	__bit_not
	mov	r1, -10
	mov	r0, rax
	call	__bit_and
	mov	r1, -10
	mov	x3, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -48
	mov	r0, rax
	mov	r1, x0
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
	mov	r0, rax
	mov	r1, x2
	call	__bit_and
	mov	x1, rax
	jmp	.LBB211_40
.LBB211_33:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB211_40
	jmp	.LBB211_34
.LBB211_34:
add	x0, -9
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483624
	jl	rax, r0, .LBB211_39
	jmp	.LBB211_40
.LBB211_35:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB211_40
	jmp	.LBB211_36
.LBB211_36:
	mov	x1, x0
add	x1, -65
	mov	r0, x1
	call	__bit_not
	mov	r1, 26
	mov	r0, rax
	call	__bit_and
	mov	r1, 26
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -91
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
	jmp	.LBB211_40
.LBB211_37:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB211_40
	jmp	.LBB211_38
.LBB211_38:
	mov	x1, x0
add	x1, -48
	mov	r0, x1
	call	__bit_not
	mov	r1, 10
	mov	r0, rax
	call	__bit_and
	mov	r1, 10
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x0
add	r1, -58
	mov	r0, rax
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
	call	__bit_or
	mov	r1, 31
	mov	r0, rax
	call	__bit_shr
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 95
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	mov	x0, rax
	mov	x2, x0
add	x2, -65
	mov	r0, x2
	call	__bit_not
	mov	r1, 6
	mov	r0, rax
	call	__bit_and
	mov	r1, 6
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x0, -71
	mov	r0, rax
	mov	r1, x0
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
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	x1, rax
	jmp	.LBB211_40
.LBB211_39:                             // %switch.lookup
	mov	r0, 8388639
	mov	r1, x0
	call	__bit_shr
	mov	x1, rax
.LBB211_40:                             // %ispunct.exit
	mov	r1, 1
	mov	r0, x1
	call	__bit_and
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function wctrans
wctrans:                                // @wctrans
// %bb.0:
sub	rsp, 28
	mov	[rsp+24], x0
	mov	[rsp+20], x1
	mov	[rsp+16], x2
	mov	[rsp+12], x3
	mov	[rsp+8], x4
	mov	[rsp+4], x5
	mov	[rsp], x6
	mov	r1, 3
	mov	x0, r0
	call	__bit_and
	mov	x2, rax
	jz	x2, .LBB212_2
	jmp	.LBB212_1
.LBB212_1:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x1, rax
	mov	x5, mcasm_static_0053a90d2c942d43821afc7ac8b1b700
	mov	x3, x1
	mov	x6, x0
	jmp	.LBB212_7
.LBB212_2:
	mov	x1, [x0]
	mov	r1, 1869377396
	mov	x5, mcasm_static_0053a90d2c942d43821afc7ac8b1b700
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB212_7
	jmp	.LBB212_3
.LBB212_3:                              // %.preheader5.i.preheader
	mov	x4, -2139062144
	mov	x6, x0
	mov	x3, 1
.LBB212_4:                              // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB212_26
	jmp	.LBB212_5
.LBB212_5:                              //   in Loop: Header=BB212_4 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB212_4
	jmp	.LBB212_6
.LBB212_6:
	mov	x3, r1
.LBB212_7:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB212_12
	jmp	.LBB212_8
.LBB212_8:                              // %.preheader.i.preheader
add	x6, 1
.LBB212_9:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB212_11
	jmp	.LBB212_10
.LBB212_10:                             //   in Loop: Header=BB212_9 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB212_9
	jmp	.LBB212_11
.LBB212_11:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB212_12:                             // %strcmp.exit
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	x3, 1
	je	x4, rax, .LBB212_26
	jmp	.LBB212_13
.LBB212_13:
	mov	x4, mcasm_static_19ad3e1c80ad677f1138e983332510aa
	jnz	x2, .LBB212_19
	jmp	.LBB212_14
.LBB212_14:
	mov	x1, [x0]
	mov	r1, 1886744436
	jne	x1, r1, .LBB212_19
	jmp	.LBB212_15
.LBB212_15:                             // %.preheader5.i2.preheader
	mov	x1, -2139062144
.LBB212_16:                             // %.preheader5.i2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x1, .LBB212_25
	jmp	.LBB212_17
.LBB212_17:                             //   in Loop: Header=BB212_16 Depth=1
add	x0, 4
add	x4, 4
	mov	r1, [x0]
	mov	r0, [x4]
	je	r1, r0, .LBB212_16
	jmp	.LBB212_18
.LBB212_18:
	mov	x1, r1
.LBB212_19:
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	x3, 0
	mov	x2, 0
	jz	rax, .LBB212_24
	jmp	.LBB212_20
.LBB212_20:                             // %.preheader.i1.preheader
add	x0, 1
.LBB212_21:                             // %.preheader.i1
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, x1
	jne	rax, x2, .LBB212_23
	jmp	.LBB212_22
.LBB212_22:                             //   in Loop: Header=BB212_21 Depth=1
	mov	r0, [x0]
	mov	r1, 255
add	x4, 1
	call	__bit_and
	mov	x1, rax
add	x0, 1
	mov	r0, 0
	jnz	x1, .LBB212_21
	jmp	.LBB212_23
.LBB212_23:
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
.LBB212_24:                             // %strcmp.exit3
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	r0, x2
	mov	r1, rax
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
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB212_26
	jmp	.LBB212_25
.LBB212_25:                             // %strcmp.exit3.thread
	mov	x3, 2
.LBB212_26:                             // %strcmp.exit.thread
	mov	rax, x3
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
// -- Begin function towctrans
towctrans:                              // @towctrans
// %bb.0:
sub	rsp, 4
	mov	[rsp], x0
	mov	r2, 2
	mov	x0, r0
	je	r1, r2, .LBB213_5
	jmp	.LBB213_1
.LBB213_1:
	mov	r0, 1
	jne	r1, r0, .LBB213_8
	jmp	.LBB213_2
.LBB213_2:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB213_8
	jmp	.LBB213_3
.LBB213_3:
	mov	r0, x0
add	r0, -91
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483622
	jl	rax, r0, .LBB213_8
	jmp	.LBB213_4
.LBB213_4:
add	x0, 32
	jmp	.LBB213_8
.LBB213_5:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB213_8
	jmp	.LBB213_6
.LBB213_6:
	mov	r0, x0
add	r0, -123
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483622
	jl	rax, r0, .LBB213_8
	jmp	.LBB213_7
.LBB213_7:
add	x0, -32
.LBB213_8:
	mov	rax, x0
	mov	x0, [rsp]
add	rsp, 4
	ret
// -- End function
static mcasm_static_996e1d748484e5eb9a065a5aad9ce076 [67, 0]
static mcasm_static_d9ce338f646ea8c30ea22778eb9060c2 [67, 0]
static mcasm_static_d5660bed37806e0ae012cfdeb23a8ae3 [80, 79, 83, 73, 88, 0]
static mcasm_static_5cf5ce2b3b11ee416e97c5e21586bede [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 127, 127, 127, 127, 127, 127, 127]
static mcasm_static_ba9cc985c3e97735719239e45e344e99 [46, 0]
static mcasm_static_20b8c81a6351a7dfad9331791a7cca59 [0]
static mcasm_static_6bc8db79278211dbe9528318ee407262 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
static mcasm_static_00ac4c2001e59a84fcd276db8d985f14 [0, 0, 0, 0]
static mcasm_static_f4f5ec55549b356ae56eb42848b711eb [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
static mcasm_static_3a492ebf99720d2e4b84550316b037ff [40, 110, 117, 108, 108, 41, 0]
static mcasm_static_65a9b514e1127679337fc429ce44df2f [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 0]
static mcasm_static_15400d789abfe0b4765dc732902f6f37 [0]
static mcasm_static_1cb923c0b8a727a5738b7ee997983bc0 [78, 65, 78, 0]
static mcasm_static_dd3f7305ff93b472d41bcd9472f338ce [73, 78, 70, 0]
static mcasm_static_6f7acf3033ec5284dc119ee615ec1d1a [78, 97, 78, 0]
static mcasm_static_d6be6aa1de7347d31fe38817b7c46b0b [110, 97, 110, 0]
static mcasm_static_b1a7585fb8349acaafdbdb40ab01c310 [73, 110, 102, 105, 110, 105, 116, 121, 0]
static mcasm_static_b9e802fbaf641deea9821b02daddc0fb [105, 110, 102, 0]
static mcasm_static_557d67ef4a6ee5836caf0dd5d257f148 [45, 73, 110, 102, 105, 110, 105, 116, 121, 0]
static mcasm_static_fab2707d6a59281c3d2f28ed4a57dc87 [45, 105, 110, 102, 0]
static mcasm_static_c362db4c2893882ec2b44d8077bc5bcb [48, 48, 48, 49, 48, 50, 48, 51, 48, 52, 48, 53, 48, 54, 48, 55, 48, 56, 48, 57, 49, 48, 49, 49, 49, 50, 49, 51, 49, 52, 49, 53, 49, 54, 49, 55, 49, 56, 49, 57, 50, 48, 50, 49, 50, 50, 50, 51, 50, 52, 50, 53, 50, 54, 50, 55, 50, 56, 50, 57, 51, 48, 51, 49, 51, 50, 51, 51, 51, 52, 51, 53, 51, 54, 51, 55, 51, 56, 51, 57, 52, 48, 52, 49, 52, 50, 52, 51, 52, 52, 52, 53, 52, 54, 52, 55, 52, 56, 52, 57, 53, 48, 53, 49, 53, 50, 53, 51, 53, 52, 53, 53, 53, 54, 53, 55, 53, 56, 53, 57, 54, 48, 54, 49, 54, 50, 54, 51, 54, 52, 54, 53, 54, 54, 54, 55, 54, 56, 54, 57, 55, 48, 55, 49, 55, 50, 55, 51, 55, 52, 55, 53, 55, 54, 55, 55, 55, 56, 55, 57, 56, 48, 56, 49, 56, 50, 56, 51, 56, 52, 56, 53, 56, 54, 56, 55, 56, 56, 56, 57, 57, 48, 57, 49, 57, 50, 57, 51, 57, 52, 57, 53, 57, 54, 57, 55, 57, 56, 57, 57, 0]
static mcasm_static_ccbdd611d38f580638dd57066fcc265d [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 0]
static mcasm_static_bff1819c724c09c306780236d311fec2 [48, 48, 48, 49, 48, 50, 48, 51, 48, 52, 48, 53, 48, 54, 48, 55, 48, 56, 48, 57, 49, 48, 49, 49, 49, 50, 49, 51, 49, 52, 49, 53, 49, 54, 49, 55, 49, 56, 49, 57, 50, 48, 50, 49, 50, 50, 50, 51, 50, 52, 50, 53, 50, 54, 50, 55, 50, 56, 50, 57, 51, 48, 51, 49, 51, 50, 51, 51, 51, 52, 51, 53, 51, 54, 51, 55, 51, 56, 51, 57, 52, 48, 52, 49, 52, 50, 52, 51, 52, 52, 52, 53, 52, 54, 52, 55, 52, 56, 52, 57, 53, 48, 53, 49, 53, 50, 53, 51, 53, 52, 53, 53, 53, 54, 53, 55, 53, 56, 53, 57, 54, 48, 54, 49, 54, 50, 54, 51, 54, 52, 54, 53, 54, 54, 54, 55, 54, 56, 54, 57, 55, 48, 55, 49, 55, 50, 55, 51, 55, 52, 55, 53, 55, 54, 55, 55, 55, 56, 55, 57, 56, 48, 56, 49, 56, 50, 56, 51, 56, 52, 56, 53, 56, 54, 56, 55, 56, 56, 56, 57, 57, 48, 57, 49, 57, 50, 57, 51, 57, 52, 57, 53, 57, 54, 57, 55, 57, 56, 57, 57]
static mcasm_static_f3650f04f4d64e4e708b5a29025db952 [0, 0, 0, 0]
static mcasm_static_55a045921e650fe1b60398bd75bf5028 [0, 0, 0, 0]
static mcasm_static_49a5109f92ceefa38800cc72e4ca6ad3 [97, 108, 110, 117, 109, 0]
static mcasm_static_4b9b09ee6f896879697b4a47d8c9c5fc [97, 108, 112, 104, 97, 0]
static mcasm_static_831c3fe9d24a16a87d2b67ceb4c3d643 [98, 108, 97, 110, 107, 0]
static mcasm_static_2ff774bcb9014c3a911380781c7ac4c8 [99, 110, 116, 114, 108, 0]
static mcasm_static_f95ff8e7835d8141f46ea1fcd089b140 [100, 105, 103, 105, 116, 0]
static mcasm_static_3cc2643f484014ba60d082a3adc8ff40 [103, 114, 97, 112, 104, 0]
static mcasm_static_8b857911b53176404d907e1698ae13bd [108, 111, 119, 101, 114, 0]
static mcasm_static_6a452fd7e76ec8d0e228954ea70781ff [112, 114, 105, 110, 116, 0]
static mcasm_static_196cd0402715f554a45f30ca8d022c9b [112, 117, 110, 99, 116, 0]
static mcasm_static_69a5bd66c23542b255208638cb53437e [115, 112, 97, 99, 101, 0]
static mcasm_static_1e5cb7442438447ddc3b1b8f42d5f9b7 [117, 112, 112, 101, 114, 0]
static mcasm_static_e22da8b3b8a126110747d7382875f9a6 [120, 100, 105, 103, 105, 116, 0]
static mcasm_static_0053a90d2c942d43821afc7ac8b1b700 [116, 111, 108, 111, 119, 101, 114, 0]
static mcasm_static_19ad3e1c80ad677f1138e983332510aa [116, 111, 117, 112, 112, 101, 114, 0]
static mcasm_static_77e79dfff1fa7189edfb2c373341cbb9 [0, 0, 0, 0, 0, 0, 0, 0]

export _ll_shared:z/putchar_0:
    inline data modify storage std:vm s1 set value {str: "", next: ""}
    inline $data modify storage std:vm s1.str set from storage std:vm char2str_map."$(a)"
	ret

export _ll_shared:z/putchar_1:
    inline $data modify storage std:vm s1.next set from storage std:vm char2str_map."$(a)"
	ret
