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
	mov	x2, mcasm_static_fd611fc114a120251d3bb0779527cffa
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
	mov	r0, mcasm_static_364a465b9a8c8cccb7995ee4c8f39368
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
	mov	r0, mcasm_static_364a465b9a8c8cccb7995ee4c8f39368
	add	r0, x5
	mov	x4, 0
	jmp	.LBB30_11
.LBB30_10:                              // %.preheader.i.strcmp.exit_crit_edge
	mov	r0, mcasm_static_364a465b9a8c8cccb7995ee4c8f39368
	add	r0, x5
.LBB30_11:                              // %strcmp.exit
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	mov	x2, mcasm_static_fd611fc114a120251d3bb0779527cffa
	je	rax, x5, .LBB30_25
	jmp	.LBB30_12
.LBB30_12:
	mov	x4, mcasm_static_c0751ee5d80153739077df0eb22d8cf2
	jnz	x3, .LBB30_18
	jmp	.LBB30_13
.LBB30_13:                              // %.thread24
	mov	x1, [x0]
	mov	r1, 1230196560
	mov	x4, mcasm_static_c0751ee5d80153739077df0eb22d8cf2
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
	mov	x2, mcasm_static_fd611fc114a120251d3bb0779527cffa
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
	mov	rax, mcasm_static_ebdf0acee9ce76a249b6e991dee08477
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
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
	mov	r0, mcasm_static_6c512c1d8a49073aa4033892406fe6f0
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
	mov	r0, mcasm_static_6c512c1d8a49073aa4033892406fe6f0
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
// -- Begin function __mc_string_begin
__mc_string_begin:                      // @__mc_string_begin
// %bb.0:
sub	rsp, 4
	mov	[rsp], x0
	mov	x0, r0
	jnz	x0, .LBB82_2
	jmp	.LBB82_1
.LBB82_1:
	call	abort
.LBB82_2:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB82_4
	jmp	.LBB82_3
.LBB82_3:
	inline data modify storage std:vm s1 set value {str: "", next: ""}
	jmp	.LBB82_7
.LBB82_4:
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_0 with storage std:vm ls0
	mov	r0, x0
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB82_7
	jmp	.LBB82_5
.LBB82_5:                               // %.preheader.preheader
add	x0, 2
.LBB82_6:                               // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_1 with storage std:vm ls0
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
add	x0, 1
	jnz	rax, .LBB82_6
	jmp	.LBB82_7
.LBB82_7:                               // %.loopexit
	mov	x0, [rsp]
add	rsp, 4
	ret
// -- End function
// -- Begin function __mc_string_append
__mc_string_append:                     // @__mc_string_append
// %bb.0:
sub	rsp, 4
	mov	[rsp], x0
	mov	x0, r0
	jnz	x0, .LBB83_2
	jmp	.LBB83_1
.LBB83_1:
	call	abort
.LBB83_2:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB83_6
	jmp	.LBB83_3
.LBB83_3:
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_1 with storage std:vm ls0
	mov	r0, x0
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB83_6
	jmp	.LBB83_4
.LBB83_4:                               // %.preheader.preheader
add	x0, 2
.LBB83_5:                               // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_1 with storage std:vm ls0
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
add	x0, 1
	jnz	rax, .LBB83_5
	jmp	.LBB83_6
.LBB83_6:                               // %.loopexit
	mov	x0, [rsp]
add	rsp, 4
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
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	r1, 255
	mov	x1, r0
	call	__bit_and
	mov	r0, mcasm_static_2078a7cad13418b7d6bb79f41d8e5039
	mov	x2, [r0]
	mov	r0, 10
	mov	x0, rax
	jne	x0, r0, .LBB85_7
	jmp	.LBB85_1
.LBB85_1:
	mov	x1, mcasm_static_ee73e91b2ce062de0e51c818d378164b
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
	jnz	rax, .LBB85_3
	jmp	.LBB85_2
.LBB85_2:
	inline data modify storage std:vm s1 set value {str: "", next: ""}
	jmp	.LBB85_6
.LBB85_3:
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_0 with storage std:vm ls0
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB85_6
	jmp	.LBB85_4
.LBB85_4:                               // %.preheader.i.i.i.preheader
	mov	x1, mcasm_static_ee73e91b2ce062de0e51c818d378164b
add	x1, 2
.LBB85_5:                               // %.preheader.i.i.i
                                        // =>This Inner Loop Header: Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_1 with storage std:vm ls0
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jnz	rax, .LBB85_5
	jmp	.LBB85_6
.LBB85_6:                               // %puts.exit.i
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
	mov	r0, mcasm_static_2078a7cad13418b7d6bb79f41d8e5039
	mov	[r0], 0
	jmp	.LBB85_15
.LBB85_7:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147482625
	jl	rax, r0, .LBB85_14
	jmp	.LBB85_8
.LBB85_8:
	mov	x3, mcasm_static_ee73e91b2ce062de0e51c818d378164b
	add	x2, x3
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB85_10
	jmp	.LBB85_9
.LBB85_9:
	inline data modify storage std:vm s1 set value {str: "", next: ""}
	jmp	.LBB85_13
.LBB85_10:
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_0 with storage std:vm ls0
add	x3, 1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB85_13
	jmp	.LBB85_11
.LBB85_11:                              // %.preheader.i.i2.i.preheader
	mov	x2, mcasm_static_ee73e91b2ce062de0e51c818d378164b
add	x2, 2
.LBB85_12:                              // %.preheader.i.i2.i
                                        // =>This Inner Loop Header: Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_1 with storage std:vm ls0
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
add	x2, 1
	jnz	rax, .LBB85_12
	jmp	.LBB85_13
.LBB85_13:                              // %puts.exit3.i
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
	mov	x2, 0
.LBB85_14:
	mov	r0, x2
add	r0, 1
	mov	x3, mcasm_static_ee73e91b2ce062de0e51c818d378164b
	add	x3, x2
	mov	x2, [x3]
	mov	r2, mcasm_static_2078a7cad13418b7d6bb79f41d8e5039
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
.LBB85_15:                              // %__stdout_linebuf_putc.exit
	mov	rax, x0
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
	ret
// -- End function
// -- Begin function puts
puts:                                   // @puts
// %bb.0:
sub	rsp, 4
	mov	[rsp], x0
	mov	x0, r0
	jnz	x0, .LBB86_2
	jmp	.LBB86_1
.LBB86_1:
	call	abort
.LBB86_2:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB86_4
	jmp	.LBB86_3
.LBB86_3:
	inline data modify storage std:vm s1 set value {str: "", next: ""}
	jmp	.LBB86_7
.LBB86_4:
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_0 with storage std:vm ls0
	mov	r0, x0
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB86_7
	jmp	.LBB86_5
.LBB86_5:                               // %.preheader.i.preheader
add	x0, 2
.LBB86_6:                               // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_1 with storage std:vm ls0
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
add	x0, 1
	jnz	rax, .LBB86_6
	jmp	.LBB86_7
.LBB86_7:                               // %__mc_string_begin.exit
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
	mov	r0, mcasm_static_2078a7cad13418b7d6bb79f41d8e5039
	mov	x1, [r0]
	jz	x1, .LBB89_7
	jmp	.LBB89_1
.LBB89_1:
	mov	x0, mcasm_static_ee73e91b2ce062de0e51c818d378164b
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
	jnz	rax, .LBB89_3
	jmp	.LBB89_2
.LBB89_2:
	inline data modify storage std:vm s1 set value {str: "", next: ""}
	jmp	.LBB89_6
.LBB89_3:
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_0 with storage std:vm ls0
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB89_6
	jmp	.LBB89_4
.LBB89_4:                               // %.preheader.i.i.preheader
	mov	x0, mcasm_static_ee73e91b2ce062de0e51c818d378164b
add	x0, 2
.LBB89_5:                               // %.preheader.i.i
                                        // =>This Inner Loop Header: Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_1 with storage std:vm ls0
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
add	x0, 1
	jnz	rax, .LBB89_5
	jmp	.LBB89_6
.LBB89_6:                               // %puts.exit
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
	mov	r0, mcasm_static_2078a7cad13418b7d6bb79f41d8e5039
	mov	[r0], 0
.LBB89_7:
	mov	rax, 0
	mov	x1, [rsp]
	mov	x0, [rsp+4]
add	rsp, 8
	ret
// -- End function
// -- Begin function __stdout_linebuf_putc
__stdout_linebuf_putc:                  // @__stdout_linebuf_putc
// %bb.0:
sub	rsp, 16
	mov	[rsp+12], x0
	mov	[rsp+8], x1
	mov	[rsp+4], x2
	mov	[rsp], x3
	mov	r1, 255
	mov	x1, r0
	call	__bit_and
	mov	r0, mcasm_static_2078a7cad13418b7d6bb79f41d8e5039
	mov	x2, [r0]
	mov	r0, 10
	mov	x0, rax
	jne	x0, r0, .LBB90_7
	jmp	.LBB90_1
.LBB90_1:
	mov	x1, mcasm_static_ee73e91b2ce062de0e51c818d378164b
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
	jnz	rax, .LBB90_3
	jmp	.LBB90_2
.LBB90_2:
	inline data modify storage std:vm s1 set value {str: "", next: ""}
	jmp	.LBB90_6
.LBB90_3:
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_0 with storage std:vm ls0
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB90_6
	jmp	.LBB90_4
.LBB90_4:                               // %.preheader.i.i.preheader
	mov	x1, mcasm_static_ee73e91b2ce062de0e51c818d378164b
add	x1, 2
.LBB90_5:                               // %.preheader.i.i
                                        // =>This Inner Loop Header: Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_1 with storage std:vm ls0
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jnz	rax, .LBB90_5
	jmp	.LBB90_6
.LBB90_6:                               // %puts.exit
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
	mov	r0, mcasm_static_2078a7cad13418b7d6bb79f41d8e5039
	mov	[r0], 0
	jmp	.LBB90_15
.LBB90_7:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147482625
	jl	rax, r0, .LBB90_14
	jmp	.LBB90_8
.LBB90_8:
	mov	x3, mcasm_static_ee73e91b2ce062de0e51c818d378164b
	add	x2, x3
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB90_10
	jmp	.LBB90_9
.LBB90_9:
	inline data modify storage std:vm s1 set value {str: "", next: ""}
	jmp	.LBB90_13
.LBB90_10:
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_0 with storage std:vm ls0
add	x3, 1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB90_13
	jmp	.LBB90_11
.LBB90_11:                              // %.preheader.i.i2.preheader
	mov	x2, mcasm_static_ee73e91b2ce062de0e51c818d378164b
add	x2, 2
.LBB90_12:                              // %.preheader.i.i2
                                        // =>This Inner Loop Header: Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_1 with storage std:vm ls0
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
add	x2, 1
	jnz	rax, .LBB90_12
	jmp	.LBB90_13
.LBB90_13:                              // %puts.exit3
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
	mov	x2, 0
.LBB90_14:
	mov	r0, x2
add	r0, 1
	mov	x3, mcasm_static_ee73e91b2ce062de0e51c818d378164b
	add	x3, x2
	mov	x2, [x3]
	mov	r2, mcasm_static_2078a7cad13418b7d6bb79f41d8e5039
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
.LBB90_15:
	mov	rax, x0
	mov	x3, [rsp]
	mov	x2, [rsp+4]
	mov	x1, [rsp+8]
	mov	x0, [rsp+12]
add	rsp, 16
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
	jz	x0, .LBB91_52
	jmp	.LBB91_1
.LBB91_1:                               // %.preheader10.preheader
	mov	x5, 10
	mov	x9, -2147483645
	mov	x10, mcasm_static_2078a7cad13418b7d6bb79f41d8e5039
	mov	r0, mcasm_static_ee73e91b2ce062de0e51c818d378164b
add	r0, 1
	mov	[rsp+8], r0
	mov	x11, -2147483632
	mov	x12, -2147482625
.LBB91_2:                               // %.preheader10
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB91_4 Depth 2
                                        //     Child Loop BB91_9 Depth 2
                                        //     Child Loop BB91_13 Depth 2
                                        //     Child Loop BB91_19 Depth 2
                                        //       Child Loop BB91_21 Depth 3
                                        //       Child Loop BB91_30 Depth 3
                                        //       Child Loop BB91_27 Depth 3
                                        //       Child Loop BB91_28 Depth 3
                                        //       Child Loop BB91_34 Depth 3
                                        //       Child Loop BB91_41 Depth 3
                                        //     Child Loop BB91_49 Depth 2
	mov	r1, 3
	mov	r0, x13
	call	__bit_and
	mov	x2, x0
	mov	x4, x13
	jz	rax, .LBB91_7
	jmp	.LBB91_3
.LBB91_3:                               // %.preheader7.preheader
                                        //   in Loop: Header=BB91_2 Depth=1
	mov	x3, x13
add	x3, 1
	mov	x4, x13
	mov	x2, x0
.LBB91_4:                               // %.preheader7
                                        //   Parent Loop BB91_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, 0
	jz	x2, .LBB91_15
	jmp	.LBB91_5
.LBB91_5:                               //   in Loop: Header=BB91_4 Depth=2
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	r0, x4
	je	rax, x5, .LBB91_15
	jmp	.LBB91_6
.LBB91_6:                               //   in Loop: Header=BB91_4 Depth=2
	mov	r1, 3
add	x4, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
add	x2, -1
	jnz	rax, .LBB91_4
	jmp	.LBB91_7
.LBB91_7:                               // %.loopexit9.i
                                        //   in Loop: Header=BB91_2 Depth=1
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB91_11
	jmp	.LBB91_8
.LBB91_8:                               // %.preheader.preheader
                                        //   in Loop: Header=BB91_2 Depth=1
.LBB91_9:                               // %.preheader
                                        //   Parent Loop BB91_2 Depth=1
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
	jne	rax, r0, .LBB91_12
	jmp	.LBB91_10
.LBB91_10:                              //   in Loop: Header=BB91_9 Depth=2
add	x2, -4
	mov	r1, -2147483648
add	x4, 4
	mov	r0, x2
	call	__bit_xor
	jg	rax, x9, .LBB91_9
	jmp	.LBB91_11
.LBB91_11:                              // %.loopexit6.i
                                        //   in Loop: Header=BB91_2 Depth=1
	mov	r0, 0
	jz	x2, .LBB91_15
	jmp	.LBB91_12
.LBB91_12:                              // %.loopexit5.i.preheader
                                        //   in Loop: Header=BB91_2 Depth=1
.LBB91_13:                              // %.loopexit5.i
                                        //   Parent Loop BB91_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	r0, x4
	je	rax, x5, .LBB91_15
	jmp	.LBB91_14
.LBB91_14:                              //   in Loop: Header=BB91_13 Depth=2
add	x2, -1
add	x4, 1
	mov	r0, 0
	jnz	x2, .LBB91_13
	jmp	.LBB91_15
.LBB91_15:                              // %memchr.exit
                                        //   in Loop: Header=BB91_2 Depth=1
	mov	x2, x0
	jz	r0, .LBB91_17
	jmp	.LBB91_16
.LBB91_16:                              //   in Loop: Header=BB91_2 Depth=1
	mov	x2, r0
	sub	x2, x13
.LBB91_17:                              //   in Loop: Header=BB91_2 Depth=1
	mov	[rsp], r0
	jz	x2, .LBB91_44
	jmp	.LBB91_18
.LBB91_18:                              //   in Loop: Header=BB91_2 Depth=1
	mov	x5, [x10]
	mov	r0, mcasm_static_ee73e91b2ce062de0e51c818d378164b
add	r0, 2
	mov	[rsp+4], r0
.LBB91_19:                              //   Parent Loop BB91_2 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB91_21 Depth 3
                                        //       Child Loop BB91_30 Depth 3
                                        //       Child Loop BB91_27 Depth 3
                                        //       Child Loop BB91_28 Depth 3
                                        //       Child Loop BB91_34 Depth 3
                                        //       Child Loop BB91_41 Depth 3
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
	mov	x14, mcasm_static_ee73e91b2ce062de0e51c818d378164b
	mov	r1, -2147483648
	add	x14, x5
	mov	r0, x3
	call	__bit_xor
	mov	x7, x13
	mov	x6, x3
	jl	rax, x11, .LBB91_32
	jmp	.LBB91_20
.LBB91_20:                              //   in Loop: Header=BB91_19 Depth=2
	mov	r1, 3
	mov	r0, x14
	call	__bit_and
	mov	x6, rax
	mov	x1, 8
	sub	x1, x6
	mov	x10, 0
	mov	x11, 1
	mov	x8, x13
.LBB91_21:                              //   Parent Loop BB91_2 Depth=1
                                        //     Parent Loop BB91_19 Depth=2
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
	jne	x1, x10, .LBB91_21
	jmp	.LBB91_22
.LBB91_22:                              //   in Loop: Header=BB91_19 Depth=2
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
	jnz	rax, .LBB91_29
	jmp	.LBB91_23
.LBB91_23:                              //   in Loop: Header=BB91_19 Depth=2
	mov	r1, -2147483648
	add	x14, x10
	mov	r0, x6
	call	__bit_xor
	mov	x9, -2147483645
	mov	x10, mcasm_static_2078a7cad13418b7d6bb79f41d8e5039
	mov	x11, -2147483632
	mov	x12, -2147482625
	mov	x1, -2147483633
	jl	rax, x11, .LBB91_25
	jmp	.LBB91_24
.LBB91_24:                              // %.preheader.i.preheader
                                        //   in Loop: Header=BB91_19 Depth=2
	jmp	.LBB91_27
.LBB91_25:                              // %.preheader124
                                        //   in Loop: Header=BB91_19 Depth=2
	jmp	.LBB91_28
.LBB91_26:                              //   in Loop: Header=BB91_19 Depth=2
	mov	r0, 3
	jg	x6, r0, .LBB91_25
	jmp	.LBB91_32
.LBB91_27:                              // %.preheader.i
                                        //   Parent Loop BB91_2 Depth=1
                                        //     Parent Loop BB91_19 Depth=2
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
	jg	rax, x1, .LBB91_27
	jmp	.LBB91_26
.LBB91_28:                              //   Parent Loop BB91_2 Depth=1
                                        //     Parent Loop BB91_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r0, [x7]
add	x7, 4
	mov	[x14], r0
add	x6, -4
	mov	r1, -2147483648
add	x14, 4
	mov	r0, x6
	call	__bit_xor
	jg	rax, x9, .LBB91_28
	jmp	.LBB91_32
.LBB91_29:                              //   in Loop: Header=BB91_19 Depth=2
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
.LBB91_30:                              //   Parent Loop BB91_2 Depth=1
                                        //     Parent Loop BB91_19 Depth=2
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
	jge	rax, x12, .LBB91_30
	jmp	.LBB91_31
.LBB91_31:                              //   in Loop: Header=BB91_19 Depth=2
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
	mov	x10, mcasm_static_2078a7cad13418b7d6bb79f41d8e5039
	mov	x11, -2147483632
	mov	x12, -2147482625
	jmp	.LBB91_33
.LBB91_32:                              // %.loopexit8.i
                                        //   in Loop: Header=BB91_19 Depth=2
	jz	x6, .LBB91_36
	jmp	.LBB91_33
.LBB91_33:                              // %.preheader121
                                        //   in Loop: Header=BB91_19 Depth=2
	mov	x1, x14
.LBB91_34:                              //   Parent Loop BB91_2 Depth=1
                                        //     Parent Loop BB91_19 Depth=2
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
	jnz	x6, .LBB91_34
	jmp	.LBB91_35
.LBB91_35:                              // %memcpy.exit.loopexit
                                        //   in Loop: Header=BB91_19 Depth=2
	mov	x5, [x10]
.LBB91_36:                              // %memcpy.exit
                                        //   in Loop: Header=BB91_19 Depth=2
	add	x5, x3
	mov	r1, -2147483648
	mov	[x10], x5
	mov	r0, x5
	call	__bit_xor
	jl	rax, x12, .LBB91_43
	jmp	.LBB91_37
.LBB91_37:                              //   in Loop: Header=BB91_19 Depth=2
	mov	x1, mcasm_static_ee73e91b2ce062de0e51c818d378164b
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
	jnz	rax, .LBB91_39
	jmp	.LBB91_38
.LBB91_38:                              //   in Loop: Header=BB91_19 Depth=2
	inline data modify storage std:vm s1 set value {str: "", next: ""}
	jmp	.LBB91_42
.LBB91_39:                              //   in Loop: Header=BB91_19 Depth=2
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_0 with storage std:vm ls0
	mov	r0, [rsp+8]
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB91_42
	jmp	.LBB91_40
.LBB91_40:                              // %.preheader.i.i.preheader
                                        //   in Loop: Header=BB91_19 Depth=2
	mov	x1, [rsp+4]
.LBB91_41:                              // %.preheader.i.i
                                        //   Parent Loop BB91_2 Depth=1
                                        //     Parent Loop BB91_19 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_1 with storage std:vm ls0
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jnz	rax, .LBB91_41
	jmp	.LBB91_42
.LBB91_42:                              // %puts.exit
                                        //   in Loop: Header=BB91_19 Depth=2
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
	mov	[x10], 0
	mov	x5, 0
.LBB91_43:                              //   in Loop: Header=BB91_19 Depth=2
	add	x13, x3
	sub	x2, x3
	sub	x0, x3
	jnz	x2, .LBB91_19
	jmp	.LBB91_44
.LBB91_44:                              // %.loopexit
                                        //   in Loop: Header=BB91_2 Depth=1
	mov	x5, 10
	mov	r0, [rsp]
	jz	r0, .LBB91_51
	jmp	.LBB91_45
.LBB91_45:                              //   in Loop: Header=BB91_2 Depth=1
	mov	x1, mcasm_static_ee73e91b2ce062de0e51c818d378164b
	add	x1, [x10]
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, mcasm_static_ee73e91b2ce062de0e51c818d378164b
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB91_47
	jmp	.LBB91_46
.LBB91_46:                              //   in Loop: Header=BB91_2 Depth=1
	inline data modify storage std:vm s1 set value {str: "", next: ""}
	jmp	.LBB91_50
.LBB91_47:                              //   in Loop: Header=BB91_2 Depth=1
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_0 with storage std:vm ls0
	mov	r0, [rsp+8]
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB91_50
	jmp	.LBB91_48
.LBB91_48:                              // %.preheader.i.i5.preheader
                                        //   in Loop: Header=BB91_2 Depth=1
	mov	x1, mcasm_static_ee73e91b2ce062de0e51c818d378164b
add	x1, 2
.LBB91_49:                              // %.preheader.i.i5
                                        //   Parent Loop BB91_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	inline data modify storage std:vm ls0 set value {a: -1}
	inline execute store result storage std:vm ls0.a int 1 run scoreboard players get rax vm_regs
	inline function _ll_shared:z/__mc_string_begin_1 with storage std:vm ls0
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jnz	rax, .LBB91_49
	jmp	.LBB91_50
.LBB91_50:                              // %puts.exit6
                                        //   in Loop: Header=BB91_2 Depth=1
add	x13, 1
add	x0, -1
	inline tellraw @a {"storage": "std:vm", "nbt": "s1.str"}
	mov	[x10], 0
.LBB91_51:                              //   in Loop: Header=BB91_2 Depth=1
	jnz	x0, .LBB91_2
	jmp	.LBB91_52
.LBB91_52:                              // %.loopexit11
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
	jl	x3, r0, .LBB92_41
	jmp	.LBB92_1
.LBB92_1:
	mov	r0, 511
	jg	x3, r0, .LBB92_3
	jmp	.LBB92_2
.LBB92_2:                               // %.thread
	mov	r0, rsp
	mov	r1, x3
	call	__stdout_linebuf_write
	mov	x1, x3
	jmp	.LBB92_41
.LBB92_3:
add	x3, 1
	mov	r0, x3
	call	malloc
	mov	x0, rax
	jnz	x0, .LBB92_5
	jmp	.LBB92_4
.LBB92_4:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 12
	jmp	.LBB92_41
.LBB92_5:
	mov	r3, [rsp+516]
	mov	[rsp+512], r3
	mov	r0, x0
	mov	r1, x3
	mov	r2, x2
	call	vsnprintf
	mov	r0, -1
	mov	x1, rax
	jg	x1, r0, .LBB92_23
	jmp	.LBB92_6
.LBB92_6:
	mov	r0, 131072
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB92_8
	jmp	.LBB92_7
.LBB92_7:
	mov	[r0], 1296125004
	mov	r0, 131073
	mov	[r0], 131075
	mov	r0, 131074
	mov	[r0], 0
	mov	x3, x0
add	x3, -1
	mov	x1, [x3]
	mov	x4, 0
	mov	x2, 0
	mov	rax, 0
	jmp	.LBB92_13
.LBB92_8:
	mov	r0, 131074
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
	jz	x2, .LBB92_13
	jmp	.LBB92_9
.LBB92_9:
	jge	x2, x3, .LBB92_13
	jmp	.LBB92_10
.LBB92_10:                              // %.preheader.i.preheader
.LBB92_11:                              // %.preheader.i
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
	jz	x2, .LBB92_13
	jmp	.LBB92_12
.LBB92_12:                              // %.preheader.i
                                        //   in Loop: Header=BB92_11 Depth=1
	jl	x2, x3, .LBB92_11
	jmp	.LBB92_13
.LBB92_13:                              // %.loopexit.i
	jne	x2, x3, .LBB92_15
	jmp	.LBB92_14
.LBB92_14:
	call	abort
.LBB92_15:
	mov	r0, 131074
	jz	x4, .LBB92_19
	jmp	.LBB92_16
.LBB92_16:
	mov	r0, [x4]
	mov	r1, r0
	add	r1, x4
	jne	r1, x3, .LBB92_18
	jmp	.LBB92_17
.LBB92_17:
	add	r0, x1
	mov	[x4], r0
	mov	x3, x4
	jmp	.LBB92_20
.LBB92_18:
add	x4, 1
	mov	r0, x4
.LBB92_19:
	mov	[r0], x3
	mov	[x0], x2
.LBB92_20:
	mov	r1, 1
	mov	x1, -1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB92_41
	jmp	.LBB92_21
.LBB92_21:
	mov	r0, [x3]
	mov	r1, r0
	add	r1, x3
	jne	r1, x2, .LBB92_41
	jmp	.LBB92_22
.LBB92_22:
	add	r0, [x2]
	mov	[x3], r0
add	x2, 1
	mov	r0, [x2]
add	x3, 1
	mov	[x3], r0
	jmp	.LBB92_41
.LBB92_23:
	mov	r0, x0
	mov	r1, x1
	call	__stdout_linebuf_write
	mov	r0, rsp
	je	x0, r0, .LBB92_41
	jmp	.LBB92_24
.LBB92_24:
	mov	r0, 131072
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB92_26
	jmp	.LBB92_25
.LBB92_25:
	mov	[r0], 1296125004
	mov	r0, 131073
	mov	[r0], 131075
	mov	r0, 131074
	mov	[r0], 0
	mov	x3, x0
add	x3, -1
	mov	x4, [x3]
	mov	x5, 0
	mov	x2, 0
	mov	rax, 0
	jmp	.LBB92_31
.LBB92_26:
	mov	r0, 131074
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
	jz	x2, .LBB92_31
	jmp	.LBB92_27
.LBB92_27:
	jge	x2, x3, .LBB92_31
	jmp	.LBB92_28
.LBB92_28:                              // %.preheader.i5.preheader
.LBB92_29:                              // %.preheader.i5
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
	jz	x2, .LBB92_31
	jmp	.LBB92_30
.LBB92_30:                              // %.preheader.i5
                                        //   in Loop: Header=BB92_29 Depth=1
	jl	x2, x3, .LBB92_29
	jmp	.LBB92_31
.LBB92_31:                              // %.loopexit.i4
	jne	x2, x3, .LBB92_33
	jmp	.LBB92_32
.LBB92_32:
	call	abort
.LBB92_33:
	mov	r0, 131074
	jz	x5, .LBB92_37
	jmp	.LBB92_34
.LBB92_34:
	mov	r0, [x5]
	mov	r1, r0
	add	r1, x5
	jne	r1, x3, .LBB92_36
	jmp	.LBB92_35
.LBB92_35:
	add	r0, x4
	mov	[x5], r0
	mov	x3, x5
	jmp	.LBB92_38
.LBB92_36:
add	x5, 1
	mov	r0, x5
.LBB92_37:
	mov	[r0], x3
	mov	[x0], x2
.LBB92_38:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB92_41
	jmp	.LBB92_39
.LBB92_39:
	mov	r0, [x3]
	mov	r1, r0
	add	r1, x3
	jne	r1, x2, .LBB92_41
	jmp	.LBB92_40
.LBB92_40:
	add	r0, [x2]
	mov	[x3], r0
add	x2, 1
	mov	r0, [x2]
add	x3, 1
	mov	[x3], r0
.LBB92_41:                              // %free.exit
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
sub	rsp, 572
	mov	[rsp+568], x0
	mov	[rsp+564], x1
	mov	[rsp+560], x2
	mov	[rsp+556], x3
	mov	[rsp+552], x4
	mov	[rsp+548], x5
	mov	[rsp+544], x6
	mov	[rsp+540], x7
	mov	[rsp+536], x8
	mov	[rsp+532], x9
	mov	[rsp+528], x10
	mov	[rsp+524], x11
	mov	[rsp+520], x12
	mov	[rsp+516], x13
	mov	[rsp+512], x14
	mov	[rsp+508], x15
	mov	x4, r2
	mov	[rsp+88], r3
	mov	[rsp+76], r0
	mov	r0, rsp
add	r0, 80
	mov	[r0], r1
	mov	r0, rsp
add	r0, 84
	mov	[r0], 0
	mov	x1, rsp
add	x1, 92
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	r1, 3
	mov	[rsp+52], rax
	mov	r0, x1
	call	__bit_and
	mov	r1, 3
	mov	r0, rax
	call	__bit_xor
	mov	r0, rsp
add	r0, 94
	mov	[rsp+28], r0
add	rax, 1
	mov	[rsp+36], rax
	mov	r0, rsp
add	r0, 93
	mov	[rsp+48], r0
	mov	x15, rsp
add	x15, 413
	mov	r0, rsp
add	r0, 347
	mov	[rsp+32], r0
	mov	r0, rsp
add	r0, 411
	mov	[rsp+40], r0
	mov	x11, 37
	mov	x3, 42
	mov	x0, 1
	mov	r0, mcasm_static_ec102b563ba176d293dc88ca08ecc96e
	mov	r1, mcasm_static_19710b3210d64aff7e9537bfb47c693a
	sub	r1, r0
	mov	[rsp+24], r1
	mov	r0, mcasm_static_40f2bddad2b29e06c8c77391a68e96be
	mov	r1, mcasm_static_5b24bee0a469059477a316866143d333
	sub	r1, r0
	mov	[rsp+44], r1
	mov	[rsp+64], x15
.LBB93_1:                               // =>This Loop Header: Depth=1
                                        //     Child Loop BB93_44 Depth 2
                                        //       Child Loop BB93_40 Depth 3
                                        //         Child Loop BB93_36 Depth 4
                                        //           Child Loop BB93_16 Depth 5
                                        //             Child Loop BB93_24 Depth 6
                                        //             Child Loop BB93_8 Depth 6
                                        //     Child Loop BB93_58 Depth 2
                                        //     Child Loop BB93_64 Depth 2
                                        //     Child Loop BB93_449 Depth 2
                                        //     Child Loop BB93_451 Depth 2
                                        //     Child Loop BB93_453 Depth 2
                                        //     Child Loop BB93_462 Depth 2
                                        //     Child Loop BB93_471 Depth 2
                                        //     Child Loop BB93_481 Depth 2
                                        //     Child Loop BB93_180 Depth 2
                                        //     Child Loop BB93_164 Depth 2
                                        //     Child Loop BB93_505 Depth 2
                                        //     Child Loop BB93_518 Depth 2
                                        //     Child Loop BB93_211 Depth 2
                                        //     Child Loop BB93_215 Depth 2
                                        //     Child Loop BB93_223 Depth 2
                                        //     Child Loop BB93_225 Depth 2
                                        //     Child Loop BB93_230 Depth 2
                                        //     Child Loop BB93_204 Depth 2
                                        //     Child Loop BB93_206 Depth 2
                                        //     Child Loop BB93_208 Depth 2
                                        //     Child Loop BB93_314 Depth 2
                                        //     Child Loop BB93_317 Depth 2
                                        //     Child Loop BB93_320 Depth 2
                                        //     Child Loop BB93_326 Depth 2
                                        //     Child Loop BB93_329 Depth 2
                                        //     Child Loop BB93_332 Depth 2
                                        //     Child Loop BB93_338 Depth 2
                                        //     Child Loop BB93_340 Depth 2
                                        //     Child Loop BB93_342 Depth 2
                                        //     Child Loop BB93_352 Depth 2
                                        //     Child Loop BB93_355 Depth 2
                                        //     Child Loop BB93_358 Depth 2
                                        //     Child Loop BB93_368 Depth 2
                                        //     Child Loop BB93_370 Depth 2
                                        //     Child Loop BB93_372 Depth 2
                                        //     Child Loop BB93_377 Depth 2
                                        //     Child Loop BB93_380 Depth 2
                                        //     Child Loop BB93_387 Depth 2
                                        //     Child Loop BB93_394 Depth 2
                                        //     Child Loop BB93_396 Depth 2
                                        //     Child Loop BB93_398 Depth 2
                                        //     Child Loop BB93_303 Depth 2
                                        //     Child Loop BB93_305 Depth 2
                                        //     Child Loop BB93_307 Depth 2
                                        //     Child Loop BB93_255 Depth 2
                                        //     Child Loop BB93_257 Depth 2
                                        //     Child Loop BB93_258 Depth 2
                                        //     Child Loop BB93_264 Depth 2
                                        //     Child Loop BB93_268 Depth 2
                                        //     Child Loop BB93_274 Depth 2
                                        //     Child Loop BB93_280 Depth 2
                                        //     Child Loop BB93_283 Depth 2
                                        //     Child Loop BB93_289 Depth 2
                                        //     Child Loop BB93_243 Depth 2
                                        //     Child Loop BB93_245 Depth 2
                                        //     Child Loop BB93_247 Depth 2
                                        //     Child Loop BB93_406 Depth 2
                                        //     Child Loop BB93_421 Depth 2
                                        //     Child Loop BB93_430 Depth 2
                                        //     Child Loop BB93_440 Depth 2
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	je	rax, x11, .LBB93_3
	jmp	.LBB93_2
.LBB93_2:                               //   in Loop: Header=BB93_1 Depth=1
	jz	rax, .LBB93_529
	jmp	.LBB93_4
.LBB93_3:                               // %.preheader165.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x10, 0
	mov	x8, 32
	mov	x14, x4
	mov	x9, 0
	mov	x1, 0
	mov	x13, 0
	mov	x5, 0
	mov	x7, -2147483638
	mov	x6, 43
	jmp	.LBB93_44
.LBB93_4:                               //   in Loop: Header=BB93_1 Depth=1
	mov	x2, rax
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 84
	mov	x1, [r1]
	mov	x5, x1
add	x5, 1
	jz	r0, .LBB93_7
	jmp	.LBB93_5
.LBB93_5:                               //   in Loop: Header=BB93_1 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x5
	call	__bit_xor
	jge	rax, x6, .LBB93_7
	jmp	.LBB93_6
.LBB93_6:                               //   in Loop: Header=BB93_1 Depth=1
	add	x1, [rsp+76]
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
add	r0, 84
	mov	x5, 1
	add	x5, [r0]
.LBB93_7:                               //   in Loop: Header=BB93_1 Depth=1
add	x4, 1
	mov	r0, rsp
add	r0, 84
	mov	[r0], x5
	jmp	.LBB93_1
.LBB93_8:                               // %.preheader
                                        //   Parent Loop BB93_1 Depth=1
                                        //     Parent Loop BB93_44 Depth=2
                                        //       Parent Loop BB93_40 Depth=3
                                        //         Parent Loop BB93_36 Depth=4
                                        //           Parent Loop BB93_16 Depth=5
                                        // =>          This Inner Loop Header: Depth=6
add	x14, 1
	mov	r0, [x14]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	je	x4, x2, .LBB93_8
	jmp	.LBB93_9
.LBB93_9:                               // %.preheader
                                        //   in Loop: Header=BB93_16 Depth=5
	mov	r0, 41
	jg	x4, r0, .LBB93_12
	jmp	.LBB93_10
.LBB93_10:                              // %.preheader
                                        //   in Loop: Header=BB93_36 Depth=4
	mov	r0, 32
	je	x4, r0, .LBB93_33
	jmp	.LBB93_11
.LBB93_11:                              // %.preheader
                                        //   in Loop: Header=BB93_40 Depth=3
	mov	r0, 35
	je	x4, r0, .LBB93_37
	jmp	.LBB93_53
.LBB93_12:                              // %.preheader
                                        //   in Loop: Header=BB93_16 Depth=5
	je	x4, x3, .LBB93_45
	jmp	.LBB93_13
.LBB93_13:                              // %.preheader
                                        //   in Loop: Header=BB93_16 Depth=5
	mov	r0, 48
	je	x4, r0, .LBB93_41
	jmp	.LBB93_14
.LBB93_14:                              // %.preheader
                                        //   in Loop: Header=BB93_16 Depth=5
	jne	x4, x6, .LBB93_53
	jmp	.LBB93_15
.LBB93_15:                              // %.loopexit99.outer.loopexit
                                        //   in Loop: Header=BB93_16 Depth=5
	mov	x13, 1
	mov	x5, 1
.LBB93_16:                              // %.loopexit99.outer
                                        //   Parent Loop BB93_1 Depth=1
                                        //     Parent Loop BB93_44 Depth=2
                                        //       Parent Loop BB93_40 Depth=3
                                        //         Parent Loop BB93_36 Depth=4
                                        // =>        This Loop Header: Depth=5
                                        //             Child Loop BB93_24 Depth 6
                                        //             Child Loop BB93_8 Depth 6
	mov	x2, x14
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	jg	x4, x3, .LBB93_20
	jmp	.LBB93_17
.LBB93_17:                              // %.loopexit99.outer
                                        //   in Loop: Header=BB93_36 Depth=4
	mov	r0, 32
	je	x4, r0, .LBB93_35
	jmp	.LBB93_18
.LBB93_18:                              // %.loopexit99.outer
                                        //   in Loop: Header=BB93_40 Depth=3
	mov	r0, 35
	je	x4, r0, .LBB93_39
	jmp	.LBB93_19
.LBB93_19:                              // %.loopexit99.outer
                                        //   in Loop: Header=BB93_1 Depth=1
	je	x4, x3, .LBB93_47
	jmp	.LBB93_55
.LBB93_20:                              // %.loopexit99.outer
                                        //   in Loop: Header=BB93_16 Depth=5
	je	x4, x6, .LBB93_23
	jmp	.LBB93_21
.LBB93_21:                              // %.loopexit99.outer
                                        //   in Loop: Header=BB93_16 Depth=5
	mov	r0, 45
	je	x4, r0, .LBB93_32
	jmp	.LBB93_22
.LBB93_22:                              // %.loopexit99.outer
                                        //   in Loop: Header=BB93_44 Depth=2
	mov	r0, 48
	je	x4, r0, .LBB93_43
	jmp	.LBB93_55
.LBB93_23:                              // %.loopexit99.preheader
                                        //   in Loop: Header=BB93_16 Depth=5
.LBB93_24:                              // %.loopexit99
                                        //   Parent Loop BB93_1 Depth=1
                                        //     Parent Loop BB93_44 Depth=2
                                        //       Parent Loop BB93_40 Depth=3
                                        //         Parent Loop BB93_36 Depth=4
                                        //           Parent Loop BB93_16 Depth=5
                                        // =>          This Inner Loop Header: Depth=6
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	je	x4, x6, .LBB93_24
	jmp	.LBB93_25
.LBB93_25:                              // %.loopexit99
                                        //   in Loop: Header=BB93_16 Depth=5
	mov	r0, 41
	jg	x4, r0, .LBB93_28
	jmp	.LBB93_26
.LBB93_26:                              // %.loopexit99
                                        //   in Loop: Header=BB93_36 Depth=4
	mov	r0, 32
	je	x4, r0, .LBB93_34
	jmp	.LBB93_27
.LBB93_27:                              // %.loopexit99
                                        //   in Loop: Header=BB93_40 Depth=3
	mov	r0, 35
	je	x4, r0, .LBB93_38
	jmp	.LBB93_54
.LBB93_28:                              // %.loopexit99
                                        //   in Loop: Header=BB93_16 Depth=5
	je	x4, x3, .LBB93_46
	jmp	.LBB93_29
.LBB93_29:                              // %.loopexit99
                                        //   in Loop: Header=BB93_16 Depth=5
	mov	r0, 48
	je	x4, r0, .LBB93_42
	jmp	.LBB93_30
.LBB93_30:                              // %.loopexit99
                                        //   in Loop: Header=BB93_16 Depth=5
	mov	r0, 45
	jne	x4, r0, .LBB93_54
	jmp	.LBB93_31
.LBB93_31:                              // %.preheader.preheader.loopexit
                                        //   in Loop: Header=BB93_16 Depth=5
	mov	x13, 1
.LBB93_32:                              // %.preheader.preheader
                                        //   in Loop: Header=BB93_16 Depth=5
	mov	x14, x2
	mov	x2, 45
	jmp	.LBB93_8
.LBB93_33:                              // %.loopexit100.backedge.loopexit
                                        //   in Loop: Header=BB93_36 Depth=4
	mov	x1, 1
	mov	x5, 1
	jmp	.LBB93_36
.LBB93_34:                              // %.loopexit100.backedge.loopexit2
                                        //   in Loop: Header=BB93_36 Depth=4
	mov	x1, 1
	mov	x14, x2
	mov	x13, 1
	jmp	.LBB93_36
.LBB93_35:                              // %.loopexit100.backedge.loopexit7
                                        //   in Loop: Header=BB93_36 Depth=4
	mov	x1, 1
	mov	x14, x2
.LBB93_36:                              // %.loopexit100
                                        //   Parent Loop BB93_1 Depth=1
                                        //     Parent Loop BB93_44 Depth=2
                                        //       Parent Loop BB93_40 Depth=3
                                        // =>      This Loop Header: Depth=4
                                        //           Child Loop BB93_16 Depth 5
                                        //             Child Loop BB93_24 Depth 6
                                        //             Child Loop BB93_8 Depth 6
	jmp	.LBB93_16
.LBB93_37:                              // %.loopexit101.backedge.loopexit
                                        //   in Loop: Header=BB93_40 Depth=3
	mov	x9, 1
	mov	x5, 1
	jmp	.LBB93_40
.LBB93_38:                              // %.loopexit101.backedge.loopexit3
                                        //   in Loop: Header=BB93_40 Depth=3
	mov	x9, 1
	mov	x14, x2
	mov	x13, 1
	jmp	.LBB93_40
.LBB93_39:                              // %.loopexit101.backedge.loopexit8
                                        //   in Loop: Header=BB93_40 Depth=3
	mov	x9, 1
	mov	x14, x2
.LBB93_40:                              // %.loopexit101
                                        //   Parent Loop BB93_1 Depth=1
                                        //     Parent Loop BB93_44 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB93_36 Depth 4
                                        //           Child Loop BB93_16 Depth 5
                                        //             Child Loop BB93_24 Depth 6
                                        //             Child Loop BB93_8 Depth 6
	jmp	.LBB93_36
.LBB93_41:                              // %.preheader165.backedge.loopexit
                                        //   in Loop: Header=BB93_44 Depth=2
	mov	x10, 1
	mov	x8, x4
	mov	x5, 1
	jmp	.LBB93_44
.LBB93_42:                              // %.preheader165.backedge.loopexit4
                                        //   in Loop: Header=BB93_44 Depth=2
	mov	x10, 1
	mov	x14, x2
	mov	x8, x4
	mov	x13, 1
	jmp	.LBB93_44
.LBB93_43:                              // %.preheader165.backedge.loopexit9
                                        //   in Loop: Header=BB93_44 Depth=2
	mov	x10, 1
	mov	x14, x2
	mov	x8, x4
.LBB93_44:                              // %.preheader165
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB93_40 Depth 3
                                        //         Child Loop BB93_36 Depth 4
                                        //           Child Loop BB93_16 Depth 5
                                        //             Child Loop BB93_24 Depth 6
                                        //             Child Loop BB93_8 Depth 6
	jmp	.LBB93_40
.LBB93_45:                              // %.loopexit103.loopexit
                                        //   in Loop: Header=BB93_1 Depth=1
add	x14, -1
	mov	x5, 1
	jmp	.LBB93_48
.LBB93_46:                              // %.loopexit103.loopexit5
                                        //   in Loop: Header=BB93_1 Depth=1
add	x2, -1
	mov	x13, 1
	mov	x14, x2
	jmp	.LBB93_48
.LBB93_47:                              // %.loopexit103.loopexit10
                                        //   in Loop: Header=BB93_1 Depth=1
.LBB93_48:                              // %.loopexit103
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	r0, [r0]
	mov	x6, r0
	mov	r1, -1
	jg	r0, r1, .LBB93_50
	jmp	.LBB93_49
.LBB93_49:                              //   in Loop: Header=BB93_1 Depth=1
	mov	x6, 0
	sub	x6, r0
.LBB93_50:                              //   in Loop: Header=BB93_1 Depth=1
	mov	x2, 1
	mov	r1, 0
	jl	r0, r1, .LBB93_52
	jmp	.LBB93_51
.LBB93_51:                              //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x5
.LBB93_52:                              //   in Loop: Header=BB93_1 Depth=1
	mov	[rsp+72], x10
add	x14, 2
	mov	r0, [x14]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	mov	x5, x2
	jmp	.LBB93_59
.LBB93_53:                              // %.loopexit.loopexit
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x5, 1
	jmp	.LBB93_56
.LBB93_54:                              // %.loopexit.loopexit1
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x13, 1
	mov	x14, x2
	jmp	.LBB93_56
.LBB93_55:                              // %.loopexit.loopexit6
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x14, x2
.LBB93_56:                              // %.loopexit
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	[rsp+72], x10
	mov	r0, x4
add	r0, -48
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	x6, 0
	mov	r0, rax
	call	__bit_xor
	mov	r0, -2147483639
	jg	rax, r0, .LBB93_59
	jmp	.LBB93_57
.LBB93_57:                              // %.preheader163.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
.LBB93_58:                              // %.preheader163
                                        //   Parent Loop BB93_1 Depth=1
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
	jl	rax, x7, .LBB93_58
	jmp	.LBB93_59
.LBB93_59:                              // %.loopexit164
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x4
	call	__bit_and
	mov	x12, -1
	mov	r0, 46
	jne	rax, r0, .LBB93_65
	jmp	.LBB93_60
.LBB93_60:                              //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x14
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	jne	x4, x3, .LBB93_62
	jmp	.LBB93_61
.LBB93_61:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
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
	mov	x10, rax
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
	jmp	.LBB93_65
.LBB93_62:                              //   in Loop: Header=BB93_1 Depth=1
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
	jg	rax, r0, .LBB93_65
	jmp	.LBB93_63
.LBB93_63:                              // %.preheader161.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x14, x2
.LBB93_64:                              // %.preheader161
                                        //   Parent Loop BB93_1 Depth=1
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
	jl	rax, x7, .LBB93_64
	jmp	.LBB93_65
.LBB93_65:                              // %.loopexit162
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x4
	call	__bit_and
	mov	x2, 0
	mov	r0, 107
	jg	rax, r0, .LBB93_68
	jmp	.LBB93_66
.LBB93_66:                              // %.loopexit162
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 76
	je	rax, r0, .LBB93_75
	jmp	.LBB93_67
.LBB93_67:                              // %.loopexit162
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 104
	je	rax, r0, .LBB93_71
	jmp	.LBB93_78
.LBB93_68:                              // %.loopexit162
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 108
	je	rax, r0, .LBB93_73
	jmp	.LBB93_69
.LBB93_69:                              // %.loopexit162
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 116
	je	rax, r0, .LBB93_77
	jmp	.LBB93_70
.LBB93_70:                              // %.loopexit162
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 122
	je	rax, r0, .LBB93_76
	jmp	.LBB93_78
.LBB93_71:                              //   in Loop: Header=BB93_1 Depth=1
	mov	x4, x14
add	x4, 1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	x10, rax
	mov	x2, 2
	mov	r0, 104
	jne	x10, r0, .LBB93_79
	jmp	.LBB93_72
.LBB93_72:                              //   in Loop: Header=BB93_1 Depth=1
add	x14, 2
	mov	x2, 1
	jmp	.LBB93_78
.LBB93_73:                              //   in Loop: Header=BB93_1 Depth=1
	mov	x4, x14
add	x4, 1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	x10, rax
	mov	x2, 3
	mov	r0, 108
	jne	x10, r0, .LBB93_79
	jmp	.LBB93_74
.LBB93_74:                              //   in Loop: Header=BB93_1 Depth=1
add	x14, 2
	mov	x2, 4
	jmp	.LBB93_78
.LBB93_75:                              //   in Loop: Header=BB93_1 Depth=1
add	x14, 1
	mov	x2, 5
	jmp	.LBB93_78
.LBB93_76:                              //   in Loop: Header=BB93_1 Depth=1
add	x14, 1
	mov	x2, 6
	jmp	.LBB93_78
.LBB93_77:                              //   in Loop: Header=BB93_1 Depth=1
add	x14, 1
	mov	x2, 7
.LBB93_78:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [x14]
	mov	r1, 255
	call	__bit_and
	mov	x10, rax
	mov	x4, x14
.LBB93_79:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x10
	call	__bit_and
	jz	rax, .LBB93_529
	jmp	.LBB93_80
.LBB93_80:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
add	x4, 1
	mov	r0, x10
	call	__bit_and
	mov	r0, 100
	jg	rax, r0, .LBB93_87
	jmp	.LBB93_81
.LBB93_81:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 87
	jg	rax, r0, .LBB93_84
	jmp	.LBB93_82
.LBB93_82:                              //   in Loop: Header=BB93_1 Depth=1
	mov	x2, rax
	mov	r0, rax
add	r0, -69
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, -2147483645
	jl	rax, r0, .LBB93_184
	jmp	.LBB93_83
.LBB93_83:                              //   in Loop: Header=BB93_1 Depth=1
	je	x2, x11, .LBB93_500
	jmp	.LBB93_522
.LBB93_84:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 88
	je	rax, r0, .LBB93_129
	jmp	.LBB93_85
.LBB93_85:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 99
	je	rax, r0, .LBB93_159
	jmp	.LBB93_86
.LBB93_86:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 100
	je	rax, r0, .LBB93_97
	jmp	.LBB93_522
.LBB93_87:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 110
	jg	rax, r0, .LBB93_91
	jmp	.LBB93_88
.LBB93_88:                              //   in Loop: Header=BB93_1 Depth=1
	mov	x7, rax
	mov	r0, rax
add	r0, -101
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, -2147483645
	jl	rax, r0, .LBB93_184
	jmp	.LBB93_89
.LBB93_89:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 105
	je	x7, r0, .LBB93_97
	jmp	.LBB93_90
.LBB93_90:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 110
	je	x7, r0, .LBB93_486
	jmp	.LBB93_522
.LBB93_91:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 114
	jg	rax, r0, .LBB93_94
	jmp	.LBB93_92
.LBB93_92:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 111
	je	rax, r0, .LBB93_144
	jmp	.LBB93_93
.LBB93_93:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 112
	je	rax, r0, .LBB93_485
	jmp	.LBB93_522
.LBB93_94:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 115
	je	rax, r0, .LBB93_445
	jmp	.LBB93_95
.LBB93_95:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 117
	je	rax, r0, .LBB93_114
	jmp	.LBB93_96
.LBB93_96:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 120
	je	rax, r0, .LBB93_129
	jmp	.LBB93_522
.LBB93_97:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 3
	jg	x2, r0, .LBB93_101
	jmp	.LBB93_98
.LBB93_98:                              //   in Loop: Header=BB93_1 Depth=1
	je	x2, x0, .LBB93_104
	jmp	.LBB93_99
.LBB93_99:                              //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 2
	je	x2, r0, .LBB93_105
	jmp	.LBB93_100
.LBB93_100:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 3
	je	x2, r0, .LBB93_106
	jmp	.LBB93_110
.LBB93_101:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 4
	je	x2, r0, .LBB93_107
	jmp	.LBB93_102
.LBB93_102:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 6
	je	x2, r0, .LBB93_108
	jmp	.LBB93_103
.LBB93_103:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 7
	je	x2, r0, .LBB93_109
	jmp	.LBB93_110
.LBB93_104:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
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
	jmp	.LBB93_111
.LBB93_105:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
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
	jmp	.LBB93_111
.LBB93_106:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	x8, [r0]
	mov	r1, 31
	mov	r0, x8
	call	__bit_sar
	jmp	.LBB93_111
.LBB93_107:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	x8, [r0]
add	r0, 8
	mov	[rsp+88], r0
	mov	rax, [r1]
	jmp	.LBB93_111
.LBB93_108:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	x8, [r0]
	mov	r1, 31
	mov	r0, x8
	call	__bit_sar
	jmp	.LBB93_111
.LBB93_109:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	x8, [r0]
	mov	r1, 31
	mov	r0, x8
	call	__bit_sar
	jmp	.LBB93_111
.LBB93_110:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	x8, [r0]
	mov	r1, 31
	mov	r0, x8
	call	__bit_sar
.LBB93_111:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, -1
	jg	rax, r0, .LBB93_113
	jmp	.LBB93_112
.LBB93_112:                             //   in Loop: Header=BB93_1 Depth=1
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
	mov	r0, [rsp+72]
	mov	[r3], r0
add	r4, 4
	mov	[r4], x1
	mov	[rsp], x13
	mov	r0, rsp
add	r0, 76
	mov	r3, 1
	mov	r4, 10
	mov	r5, 0
	mov	r6, 0
	mov	r1, rax
	mov	r7, x5
	call	format_integer
	jmp	.LBB93_1
.LBB93_113:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
	mov	r1, rsp
	mov	r2, rsp
	mov	r3, rsp
add	r0, 16
	mov	[r0], x12
add	r1, 12
	mov	[r1], x6
add	r2, 8
	mov	r0, [rsp+72]
	mov	[r2], r0
add	r3, 4
	mov	[r3], x1
	mov	[rsp], x13
	mov	r0, rsp
add	r0, 76
	mov	r3, 0
	mov	r4, 10
	mov	r5, 0
	mov	r6, 0
	mov	r1, x8
	mov	r2, rax
	mov	r7, x5
	call	format_integer
	jmp	.LBB93_1
.LBB93_114:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 3
	jg	x2, r0, .LBB93_118
	jmp	.LBB93_115
.LBB93_115:                             //   in Loop: Header=BB93_1 Depth=1
	je	x2, x0, .LBB93_121
	jmp	.LBB93_116
.LBB93_116:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 2
	je	x2, r0, .LBB93_122
	jmp	.LBB93_117
.LBB93_117:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 3
	je	x2, r0, .LBB93_123
	jmp	.LBB93_127
.LBB93_118:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 4
	je	x2, r0, .LBB93_124
	jmp	.LBB93_119
.LBB93_119:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 6
	je	x2, r0, .LBB93_125
	jmp	.LBB93_120
.LBB93_120:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 7
	je	x2, r0, .LBB93_126
	jmp	.LBB93_127
.LBB93_121:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, rax
	mov	r2, 0
	jmp	.LBB93_128
.LBB93_122:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	r0, [r0]
	mov	r1, 65535
	call	__bit_and
	mov	r1, rax
	mov	r2, 0
	jmp	.LBB93_128
.LBB93_123:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	r1, [r0]
	mov	r2, 0
	jmp	.LBB93_128
.LBB93_124:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r2, r0
add	r2, 4
	mov	[rsp+88], r2
	mov	r1, [r0]
add	r0, 8
	mov	[rsp+88], r0
	mov	r2, [r2]
	jmp	.LBB93_128
.LBB93_125:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	r1, [r0]
	mov	r2, 0
	jmp	.LBB93_128
.LBB93_126:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	x2, [r0]
	mov	r1, 31
	mov	r0, x2
	call	__bit_sar
	mov	r1, x2
	mov	r2, rax
	jmp	.LBB93_128
.LBB93_127:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	r1, [r0]
	mov	r2, 0
.LBB93_128:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
	mov	r3, rsp
	mov	r4, rsp
	mov	r5, rsp
add	r0, 16
	mov	[r0], x12
add	r3, 12
	mov	[r3], x6
add	r4, 8
	mov	r0, [rsp+72]
	mov	[r4], r0
add	r5, 4
	mov	[r5], 0
	mov	[rsp], 0
	mov	r0, rsp
add	r0, 76
	mov	r3, 0
	mov	r4, 10
	mov	r5, 0
	mov	r6, 0
	mov	r7, x5
	call	format_integer
	jmp	.LBB93_1
.LBB93_129:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 3
	jg	x2, r0, .LBB93_133
	jmp	.LBB93_130
.LBB93_130:                             //   in Loop: Header=BB93_1 Depth=1
	je	x2, x0, .LBB93_136
	jmp	.LBB93_131
.LBB93_131:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 2
	je	x2, r0, .LBB93_137
	jmp	.LBB93_132
.LBB93_132:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 3
	je	x2, r0, .LBB93_138
	jmp	.LBB93_142
.LBB93_133:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 4
	je	x2, r0, .LBB93_139
	jmp	.LBB93_134
.LBB93_134:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 6
	je	x2, r0, .LBB93_140
	jmp	.LBB93_135
.LBB93_135:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 7
	je	x2, r0, .LBB93_141
	jmp	.LBB93_142
.LBB93_136:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x8, rax
	mov	x11, 0
	jmp	.LBB93_143
.LBB93_137:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	r0, [r0]
	mov	r1, 65535
	call	__bit_and
	mov	x8, rax
	mov	x11, 0
	jmp	.LBB93_143
.LBB93_138:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	x8, [r0]
	mov	x11, 0
	jmp	.LBB93_143
.LBB93_139:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	x8, [r0]
add	r0, 8
	mov	[rsp+88], r0
	mov	x11, [r1]
	jmp	.LBB93_143
.LBB93_140:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	x8, [r0]
	mov	x11, 0
	jmp	.LBB93_143
.LBB93_141:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	x8, [r0]
	mov	r1, 31
	mov	r0, x8
	call	__bit_sar
	mov	x11, rax
	jmp	.LBB93_143
.LBB93_142:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	x8, [r0]
	mov	x11, 0
.LBB93_143:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x10
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
	mov	r0, [rsp+72]
	mov	[r2], r0
add	r3, 4
	mov	[r3], 0
	mov	[rsp], 0
	mov	r0, rsp
add	r0, 76
	mov	r3, 0
	mov	r4, 16
	mov	r1, x8
	mov	r2, x11
	mov	r5, rax
	mov	r6, x9
	mov	r7, x5
	call	format_integer
	mov	x11, 37
	jmp	.LBB93_1
.LBB93_144:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 3
	jg	x2, r0, .LBB93_148
	jmp	.LBB93_145
.LBB93_145:                             //   in Loop: Header=BB93_1 Depth=1
	je	x2, x0, .LBB93_151
	jmp	.LBB93_146
.LBB93_146:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 2
	je	x2, r0, .LBB93_152
	jmp	.LBB93_147
.LBB93_147:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 3
	je	x2, r0, .LBB93_153
	jmp	.LBB93_157
.LBB93_148:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 4
	je	x2, r0, .LBB93_154
	jmp	.LBB93_149
.LBB93_149:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 6
	je	x2, r0, .LBB93_155
	jmp	.LBB93_150
.LBB93_150:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 7
	je	x2, r0, .LBB93_156
	jmp	.LBB93_157
.LBB93_151:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, rax
	mov	r2, 0
	jmp	.LBB93_158
.LBB93_152:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	r0, [r0]
	mov	r1, 65535
	call	__bit_and
	mov	r1, rax
	mov	r2, 0
	jmp	.LBB93_158
.LBB93_153:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	r1, [r0]
	mov	r2, 0
	jmp	.LBB93_158
.LBB93_154:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r2, r0
add	r2, 4
	mov	[rsp+88], r2
	mov	r1, [r0]
add	r0, 8
	mov	[rsp+88], r0
	mov	r2, [r2]
	jmp	.LBB93_158
.LBB93_155:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	r1, [r0]
	mov	r2, 0
	jmp	.LBB93_158
.LBB93_156:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	x2, [r0]
	mov	r1, 31
	mov	r0, x2
	call	__bit_sar
	mov	r1, x2
	mov	r2, rax
	jmp	.LBB93_158
.LBB93_157:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	r1, [r0]
	mov	r2, 0
.LBB93_158:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
	mov	r3, rsp
	mov	r4, rsp
	mov	r5, rsp
add	r0, 16
	mov	[r0], x12
add	r3, 12
	mov	[r3], x6
add	r4, 8
	mov	r0, [rsp+72]
	mov	[r4], r0
add	r5, 4
	mov	[r5], 0
	mov	[rsp], 0
	mov	r0, rsp
add	r0, 76
	mov	r3, 0
	mov	r4, 8
	mov	r5, 0
	mov	r6, x9
	mov	r7, x5
	call	format_integer
	jmp	.LBB93_1
.LBB93_159:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	x7, [r0]
	mov	x8, x6
add	x8, -1
	jnz	x5, .LBB93_172
	jmp	.LBB93_160
.LBB93_160:                             //   in Loop: Header=BB93_1 Depth=1
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
add	r0, 80
	mov	x8, [r0]
	mov	r0, rsp
add	r0, 84
	mov	x5, [r0]
	mov	x6, rax
	jz	x6, .LBB93_168
	jmp	.LBB93_161
.LBB93_161:                             //   in Loop: Header=BB93_1 Depth=1
	jz	x8, .LBB93_163
	jmp	.LBB93_162
.LBB93_162:                             // %.preheader113.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
add	x6, 1
	mov	x1, x5
	jmp	.LBB93_164
.LBB93_163:                             //   in Loop: Header=BB93_1 Depth=1
	add	x5, x6
	jmp	.LBB93_171
.LBB93_164:                             // %.preheader113
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x5, 1
	jz	x8, .LBB93_167
	jmp	.LBB93_165
.LBB93_165:                             // %.preheader113
                                        //   in Loop: Header=BB93_164 Depth=2
	mov	r1, -2147483648
	mov	r0, x8
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x5
	call	__bit_xor
	jge	rax, x2, .LBB93_167
	jmp	.LBB93_166
.LBB93_166:                             //   in Loop: Header=BB93_164 Depth=2
	add	x1, [rsp+76]
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, rsp
add	r0, 84
	mov	x5, 1
	add	x5, [r0]
	mov	r0, rsp
add	r0, 80
	mov	x8, [r0]
.LBB93_167:                             //   in Loop: Header=BB93_164 Depth=2
	mov	r0, rsp
add	r0, 84
add	x6, -1
	mov	[r0], x5
	mov	x1, x5
	jg	x6, x0, .LBB93_164
	jmp	.LBB93_168
.LBB93_168:                             // %.loopexit114
                                        //   in Loop: Header=BB93_1 Depth=1
	jz	x8, .LBB93_171
	jmp	.LBB93_169
.LBB93_169:                             // %.loopexit114
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x5
	mov	r1, -2147483648
add	x2, 1
	mov	r0, x8
	call	__bit_xor
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x6, .LBB93_171
	jmp	.LBB93_170
.LBB93_170:                             //   in Loop: Header=BB93_1 Depth=1
	add	x5, [rsp+76]
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
add	r0, 84
	mov	x5, [r0]
.LBB93_171:                             //   in Loop: Header=BB93_1 Depth=1
add	x5, 1
	mov	r0, rsp
add	r0, 84
	mov	[r0], x5
	jmp	.LBB93_1
.LBB93_172:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 84
	mov	x1, [r1]
	mov	x5, x1
add	x5, 1
	jz	r0, .LBB93_175
	jmp	.LBB93_173
.LBB93_173:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x5
	call	__bit_xor
	jge	rax, x2, .LBB93_175
	jmp	.LBB93_174
.LBB93_174:                             //   in Loop: Header=BB93_1 Depth=1
	add	x1, [rsp+76]
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
add	r0, 84
	mov	x1, [r0]
	mov	x5, x1
add	x5, 1
.LBB93_175:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 84
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
	jz	x6, .LBB93_1
	jmp	.LBB93_176
.LBB93_176:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	jz	r0, .LBB93_178
	jmp	.LBB93_177
.LBB93_177:                             // %.preheader115.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x5
	jmp	.LBB93_180
.LBB93_178:                             //   in Loop: Header=BB93_1 Depth=1
add	x6, 1
	add	x1, x6
	mov	r0, rsp
add	r0, 84
	mov	[r0], x1
	jmp	.LBB93_1
.LBB93_179:                             //   in Loop: Header=BB93_180 Depth=2
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
add	x6, -1
	mov	x5, x2
.LBB93_180:                             // %.preheader115
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB93_183
	jmp	.LBB93_181
.LBB93_181:                             // %.preheader115
                                        //   in Loop: Header=BB93_180 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x7, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x7, .LBB93_183
	jmp	.LBB93_182
.LBB93_182:                             //   in Loop: Header=BB93_180 Depth=2
	add	x5, [rsp+76]
	mov	r0, [x5]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x5], rax
	mov	r0, rsp
add	r0, 84
	mov	x2, 1
	add	x2, [r0]
.LBB93_183:                             //   in Loop: Header=BB93_180 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	[r0], x2
	jg	x6, x0, .LBB93_179
	jmp	.LBB93_1
.LBB93_184:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
	mov	x15, [r0]
add	r0, 8
	mov	[rsp+88], r0
	mov	x14, [r1]
	mov	r1, 255
	mov	r0, x10
	call	__bit_and
	mov	r1, 128
	mov	r0, rax
	call	__bit_xor
	mov	x8, rax
	mov	r1, 255
add	x8, -128
	mov	r0, x10
	call	__bit_and
	mov	r1, 32
	mov	x2, rax
	mov	r0, x2
	call	__bit_or
	mov	r0, 91
	jl	x8, r0, .LBB93_186
	jmp	.LBB93_185
.LBB93_185:                             //   in Loop: Header=BB93_1 Depth=1
	mov	rax, x2
.LBB93_186:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, -1
	mov	x2, 101
	jg	x14, r0, .LBB93_188
	jmp	.LBB93_187
.LBB93_187:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, -2147483648
	mov	r0, x14
	mov	x1, rax
	call	__bit_xor
	mov	x14, rax
	mov	rax, x1
	mov	r1, 45
	mov	r0, 0
	mov	x8, -1
	jmp	.LBB93_191
.LBB93_188:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 43
	mov	r0, 0
	mov	x8, -1
	jnz	x13, .LBB93_191
	jmp	.LBB93_189
.LBB93_189:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x8, 0
	mov	r0, 1
	mov	r1, 0
	jz	x1, .LBB93_191
	jmp	.LBB93_190
.LBB93_190:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 32
	mov	r0, 0
	mov	x8, -1
.LBB93_191:                             //   in Loop: Header=BB93_1 Depth=1
	mov	[rsp+60], r1
	mov	[rsp+68], r0
	je	rax, x2, .LBB93_233
	jmp	.LBB93_192
.LBB93_192:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 103
	je	rax, r0, .LBB93_293
	jmp	.LBB93_193
.LBB93_193:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x11, 0
	mov	x13, mcasm_static_f8e19bb548063f7e0853088bf1742635
	mov	r0, 102
	jne	rax, r0, .LBB93_400
	jmp	.LBB93_194
.LBB93_194:                             //   in Loop: Header=BB93_1 Depth=1
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
	jl	x12, r0, .LBB93_196
	jmp	.LBB93_195
.LBB93_195:                             //   in Loop: Header=BB93_1 Depth=1
add	rax, 9
	mov	x13, rax
.LBB93_196:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, x15
	mov	r1, x14
	mov	r2, x15
	mov	r3, x14
	call	__unorddf2
	jz	rax, .LBB93_198
	jmp	.LBB93_197
.LBB93_197:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x10
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
	mov	r1, [rsp+24]
	call	__bit_and
	mov	x10, rax
	mov	r0, mcasm_static_ec102b563ba176d293dc88ca08ecc96e
	add	x10, r0
	jmp	.LBB93_200
.LBB93_198:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r2, -1
	mov	r3, 2146435071
	mov	r0, x15
	mov	r1, x14
	call	__gtdf2
	jl	rax, x0, .LBB93_210
	jmp	.LBB93_199
.LBB93_199:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x10
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
	mov	r1, [rsp+44]
	call	__bit_and
	mov	x10, rax
	mov	r0, mcasm_static_40f2bddad2b29e06c8c77391a68e96be
	add	x10, r0
.LBB93_200:                             // %memcpy.exit
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [x10]
	mov	x1, x10
	mov	r1, 255
add	x1, 1
	call	__bit_and
	mov	r0, [rsp+92]
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
	mov	[rsp+92], rax
	mov	x1, x10
	mov	r1, 255
add	x1, 2
	call	__bit_and
	mov	x7, rsp
add	x7, 93
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
add	x1, 94
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
add	x1, 95
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
add	x1, 92
	mov	r0, [rsp+52]
	mov	x7, -2139062144
	jz	r0, .LBB93_205
	jmp	.LBB93_201
.LBB93_201:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	x11, rsp
add	x11, 92
	mov	r0, x9
	call	__bit_and
	jz	rax, .LBB93_209
	jmp	.LBB93_202
.LBB93_202:                             // %.preheader1.i.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x11, rsp
add	x11, 92
	mov	x1, [rsp+48]
	jmp	.LBB93_204
.LBB93_203:                             //   in Loop: Header=BB93_204 Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB93_209
	jmp	.LBB93_204
.LBB93_204:                             // %.preheader1.i
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x11, 1
	mov	r1, 3
	mov	r0, x11
	call	__bit_and
	jnz	rax, .LBB93_203
	jmp	.LBB93_205
.LBB93_205:                             // %.loopexit.i.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x1
add	x2, -4
add	x1, -1
.LBB93_206:                             // %.loopexit.i
                                        //   Parent Loop BB93_1 Depth=1
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
	je	rax, x7, .LBB93_206
	jmp	.LBB93_207
.LBB93_207:                             // %.preheader.i.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x1, 0
.LBB93_208:                             // %.preheader.i
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x11, 1
add	x1, 1
	jnz	rax, .LBB93_208
	jmp	.LBB93_209
.LBB93_209:                             // %strlen.exit
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 92
	sub	x11, r0
	jmp	.LBB93_232
.LBB93_210:                             //   in Loop: Header=BB93_1 Depth=1
	mov	[rsp+56], x8
	mov	r0, x15
	mov	r1, x14
	call	__fixdfsi
	mov	x2, rax
	mov	r0, x2
	call	__floatsidf
	mov	r3, t0
	mov	r0, x15
	mov	r1, x14
	mov	r2, rax
	call	__ltdf2
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	x10, rax
	mov	r0, x10
	call	__bit_not
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x11, rax
	mov	r0, x10
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
add	x10, -2147483648
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
	mov	x10, rax
	add	x10, x2
add	x10, 1
	mov	r0, x10
	call	__floatsidf
	mov	r3, t0
	mov	r0, x15
	mov	r1, x14
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
	mov	x7, x13
add	x7, 1
.LBB93_211:                             //   Parent Loop BB93_1 Depth=1
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
	mov	x8, rsp
add	x8, 348
	add	x8, x1
	mov	x14, [x8]
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
	mov	[x8], rax
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
	jne	x7, x1, .LBB93_211
	jmp	.LBB93_212
.LBB93_212:                             //   in Loop: Header=BB93_1 Depth=1
	jz	x13, .LBB93_219
	jmp	.LBB93_213
.LBB93_213:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 348
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
	mov	x3, [rsp+32]
	mov	r0, 53
	mov	x8, mcasm_static_f5c19d5e962478431864f85657b6afe2
	jl	rax, r0, .LBB93_220
	jmp	.LBB93_214
.LBB93_214:                             // %.preheader128.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x13
	mov	x7, 57
.LBB93_215:                             // %.preheader128
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x1, x3
	add	x1, x2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	jne	rax, x7, .LBB93_217
	jmp	.LBB93_216
.LBB93_216:                             //   in Loop: Header=BB93_215 Depth=2
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
	jg	r0, x0, .LBB93_215
	jmp	.LBB93_218
.LBB93_217:                             //   in Loop: Header=BB93_1 Depth=1
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
	jmp	.LBB93_220
.LBB93_218:                             //   in Loop: Header=BB93_1 Depth=1
add	x10, 1
	jmp	.LBB93_220
.LBB93_219:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+348]
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
	add	x10, rax
	mov	x8, mcasm_static_f5c19d5e962478431864f85657b6afe2
.LBB93_220:                             //   in Loop: Header=BB93_1 Depth=1
	jz	x10, .LBB93_222
	jmp	.LBB93_221
.LBB93_221:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x1, 0
	mov	x15, 0
	mov	x11, 0
	mov	x3, 42
	jmp	.LBB93_223
.LBB93_222:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+412]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[rsp+412], rax
	mov	x11, 1
	mov	x3, 42
	jmp	.LBB93_224
.LBB93_223:                             //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r2, 10
	mov	r3, 0
	mov	r0, x10
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
	mov	r2, x10
	mov	r3, x15
	call	__adddi3
	add	rax, x8
	mov	r0, [rax]
	mov	r1, 255
	call	__bit_and
	mov	x7, rsp
add	x7, 412
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
	mov	r0, x10
	call	__bit_and
	mov	r1, 9
	mov	x1, rax
	mov	r0, x10
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, 9
	sub	r1, x10
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
	mov	x10, x12
	mov	x15, x14
	jnz	rax, .LBB93_223
	jmp	.LBB93_224
.LBB93_224:                             // %.loopexit127
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x7, 0
	mov	x8, [rsp+40]
.LBB93_225:                             //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x8
	add	r0, x11
	mov	r0, [r0]
	mov	r1, 255
	mov	x1, x7
	call	__bit_and
	mov	x10, rsp
add	x10, 92
	add	x10, x1
	mov	r0, [x10]
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
	mov	[x10], rax
add	x8, -1
	jne	x11, x7, .LBB93_225
	jmp	.LBB93_226
.LBB93_226:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, x13
	mov	r1, x9
	call	__bit_or
	jz	rax, .LBB93_228
	jmp	.LBB93_227
.LBB93_227:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x1, rsp
add	x1, 92
	add	x1, x11
	mov	r0, [x1]
	mov	r1, -256
add	x7, 1
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x11, x7
.LBB93_228:                             //   in Loop: Header=BB93_1 Depth=1
	jz	x13, .LBB93_231
	jmp	.LBB93_229
.LBB93_229:                             // %.preheader125.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x7, rsp
add	x7, 348
	mov	x1, x11
.LBB93_230:                             // %.preheader125
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	x8, rsp
add	x8, 92
	add	x8, x1
	mov	r0, [x8]
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
	mov	[x8], rax
add	x13, -1
add	x7, 1
	mov	x1, x11
	jnz	x13, .LBB93_230
	jmp	.LBB93_231
.LBB93_231:                             // %.loopexit126
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x1, rsp
add	x1, 92
	add	x1, x11
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x8, [rsp+56]
.LBB93_232:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x13, rsp
add	x13, 92
	jmp	.LBB93_400
.LBB93_233:                             //   in Loop: Header=BB93_1 Depth=1
	mov	[rsp+56], x8
	mov	x8, 6
	mov	r0, 0
	jl	x12, r0, .LBB93_235
	jmp	.LBB93_234
.LBB93_234:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x8, x12
.LBB93_235:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, x15
	mov	r1, x14
	mov	r2, x15
	mov	r3, x14
	call	__unorddf2
	jz	rax, .LBB93_237
	jmp	.LBB93_236
.LBB93_236:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x10
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
	mov	r1, [rsp+24]
	call	__bit_and
	mov	x10, rax
	mov	r0, mcasm_static_ec102b563ba176d293dc88ca08ecc96e
	add	x10, r0
	jmp	.LBB93_239
.LBB93_237:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r2, -1
	mov	r3, 2146435071
	mov	r0, x15
	mov	r1, x14
	call	__gtdf2
	jl	rax, x0, .LBB93_249
	jmp	.LBB93_238
.LBB93_238:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x10
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
	mov	r1, [rsp+44]
	call	__bit_and
	mov	x10, rax
	mov	r0, mcasm_static_40f2bddad2b29e06c8c77391a68e96be
	add	x10, r0
.LBB93_239:                             // %memcpy.exit57
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [x10]
	mov	x2, x10
	mov	r1, 255
add	x2, 1
	call	__bit_and
	mov	r0, [rsp+92]
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
	mov	[rsp+92], rax
	mov	x7, x10
	mov	r1, 255
add	x7, 2
	call	__bit_and
	mov	x8, rsp
add	x8, 93
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
add	x7, 94
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
add	x7, 95
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
add	x1, 92
	mov	r0, [rsp+52]
	mov	x7, -2139062144
	mov	x8, [rsp+56]
	jz	r0, .LBB93_244
	jmp	.LBB93_240
.LBB93_240:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	x11, rsp
add	x11, 92
	mov	r0, x9
	call	__bit_and
	jz	rax, .LBB93_248
	jmp	.LBB93_241
.LBB93_241:                             // %.preheader1.i58.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x11, rsp
add	x11, 92
	mov	x1, [rsp+48]
	jmp	.LBB93_243
.LBB93_242:                             //   in Loop: Header=BB93_243 Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB93_248
	jmp	.LBB93_243
.LBB93_243:                             // %.preheader1.i58
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x11, 1
	mov	r1, 3
	mov	r0, x11
	call	__bit_and
	jnz	rax, .LBB93_242
	jmp	.LBB93_244
.LBB93_244:                             // %.loopexit.i59.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x1
add	x2, -4
add	x1, -1
.LBB93_245:                             // %.loopexit.i59
                                        //   Parent Loop BB93_1 Depth=1
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
	je	rax, x7, .LBB93_245
	jmp	.LBB93_246
.LBB93_246:                             // %.preheader.i60.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x1, 0
.LBB93_247:                             // %.preheader.i60
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x11, 1
add	x1, 1
	jnz	rax, .LBB93_247
	jmp	.LBB93_248
.LBB93_248:                             // %strlen.exit61
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 92
	sub	x11, r0
	jmp	.LBB93_292
.LBB93_249:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r2, 0
	mov	r3, 0
	mov	r0, x15
	mov	r1, x14
	call	__eqdf2
	jz	rax, .LBB93_252
	jmp	.LBB93_250
.LBB93_250:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r2, 0
	mov	r3, 1076101120
	mov	x12, 0
	mov	r0, x15
	mov	r1, x14
	call	__gedf2
	mov	x1, 0
	jl	rax, x12, .LBB93_253
	jmp	.LBB93_251
.LBB93_251:                             // %.preheader137.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	jmp	.LBB93_255
.LBB93_252:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x1, rsp
add	x1, 413
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	x12, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x14, 48
	jmp	.LBB93_271
.LBB93_253:                             // %.loopexit138
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r2, 0
	mov	r3, 1072693248
	mov	r0, x15
	mov	r1, x14
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB93_256
	jmp	.LBB93_254
.LBB93_254:                             // %.preheader135.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	jmp	.LBB93_257
.LBB93_255:                             // %.preheader137
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r2, -1717986918
	mov	r3, 1069128089
	mov	r0, x15
	mov	r1, x14
	call	__muldf3
	mov	x15, rax
	mov	x14, t0
	mov	r2, 0
	mov	r3, 1076101120
add	x12, 1
	mov	r0, x15
	mov	r1, x14
	call	__ltdf2
	jl	rax, x1, .LBB93_253
	jmp	.LBB93_255
.LBB93_256:                             // %.loopexit136
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, x8
add	r0, 1
	mov	[rsp+20], r0
	mov	x13, x8
add	x13, 2
	mov	x7, 0
	jmp	.LBB93_258
.LBB93_257:                             // %.preheader135
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r2, 0
	mov	r3, 1076101120
	mov	r0, x15
	mov	r1, x14
	call	__muldf3
	mov	x15, rax
	mov	x14, t0
	mov	r2, 0
	mov	r3, 1072693248
add	x12, -1
	mov	r0, x15
	mov	r1, x14
	call	__ltdf2
	jl	rax, x1, .LBB93_257
	jmp	.LBB93_256
.LBB93_258:                             //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x15
	mov	r1, x14
	call	__fixdfsi
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x1
	call	__bit_xor
	mov	r1, 2147483647
	mov	x2, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, -2147483648
	mov	x11, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, -2147483648
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
	mov	r0, rax
	call	__bit_not
add	rax, 1
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483639
	mov	x2, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x2
add	r1, 2147483639
	mov	r0, rax
	call	__bit_and
	mov	x11, rax
	mov	r0, x2
	call	__bit_not
	mov	r1, -2147483639
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	r1, x11
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
add	x1, -9
	mov	r0, rax
	mov	r1, x1
	call	__bit_and
	mov	x1, rax
add	x1, 9
	mov	r1, 48
	mov	r0, x1
	call	__bit_or
	mov	x3, rsp
add	x3, 412
	add	x3, x7
	mov	r0, [x3]
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
	mov	[x3], rax
	mov	r0, x1
	call	__floatunsidf
	mov	r3, t0
	mov	r0, x15
	mov	r1, x14
	mov	r2, rax
	call	__subdf3
	mov	r2, 0
	mov	r3, 1076101120
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
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
	mov	x1, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, x1
add	r1, -2147483648
	mov	r0, rax
	call	__bit_and
	mov	x14, rax
	mov	r0, x1
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
	mov	x1, rax
add	x1, 1
	mov	r1, 0
	sub	r1, x2
	mov	r0, x1
	call	__bit_and
	mov	x14, rax
	mov	r1, 0
	sub	r1, x11
	add	x14, x2
	mov	r0, x1
	call	__bit_and
	mov	x15, rax
add	x7, 1
	add	x15, x11
	jne	x13, x7, .LBB93_258
	jmp	.LBB93_259
.LBB93_259:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 412
	mov	x13, [rsp+20]
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
	mov	x1, 0
	mov	r0, 53
	jg	rax, r0, .LBB93_263
	jmp	.LBB93_260
.LBB93_260:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r0, 53
	jne	rax, r0, .LBB93_270
	jmp	.LBB93_261
.LBB93_261:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r2, -400107883
	mov	r3, 1041313291
	mov	r0, x15
	mov	r1, x14
	call	__gtdf2
	jg	rax, x1, .LBB93_263
	jmp	.LBB93_262
.LBB93_262:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 412
	add	r0, x8
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB93_270
	jmp	.LBB93_263
.LBB93_263:                             // %.preheader1036
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x1, x8
	mov	x3, 57
.LBB93_264:                             //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, rsp
add	r0, 412
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jne	rax, x3, .LBB93_267
	jmp	.LBB93_265
.LBB93_265:                             //   in Loop: Header=BB93_264 Depth=2
	mov	x2, rsp
add	x2, 412
	add	x2, x1
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	r0, x1
add	x1, -1
add	r0, 1
	mov	[x2], rax
	jg	r0, x0, .LBB93_264
	jmp	.LBB93_266
.LBB93_266:                             // %.preheader134.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x11, x8
	mov	x7, x11
	jmp	.LBB93_268
.LBB93_267:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x3, rsp
add	x3, 412
	add	x3, x1
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
	jmp	.LBB93_270
.LBB93_268:                             // %.preheader134
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x3, rsp
add	x3, 412
	add	x3, x11
	mov	r0, [x3]
	mov	r1, 255
add	x3, 1
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
add	x7, -1
	mov	r0, x11
add	r0, 1
	mov	[x3], rax
	mov	x11, x7
	jg	r0, x0, .LBB93_268
	jmp	.LBB93_269
.LBB93_269:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+412]
	mov	r1, -256
	call	__bit_and
	mov	r1, 49
	mov	r0, rax
	call	__bit_or
	mov	[rsp+412], rax
add	x12, 1
.LBB93_270:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x1, rsp
add	x1, 412
	add	x1, x13
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, [rsp+412]
	mov	r1, 255
	call	__bit_and
	mov	x14, rax
.LBB93_271:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x1, [rsp+92]
	mov	r1, 255
	mov	r0, x14
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
	mov	[rsp+92], rax
	mov	r0, x8
	mov	r1, x9
	call	__bit_or
	mov	x11, 1
	mov	x9, [rsp+64]
	mov	x15, 9
	jz	rax, .LBB93_276
	jmp	.LBB93_272
.LBB93_272:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x1, rsp
add	x1, 93
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x11, 2
	jz	x8, .LBB93_276
	jmp	.LBB93_273
.LBB93_273:                             // %.preheader132.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x11, 0
	mov	x7, [rsp+28]
.LBB93_274:                             // %.preheader132
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x9
	add	r0, x11
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x3, x7
	add	x3, x11
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
add	x11, 1
	mov	[x3], rax
	jne	x8, x11, .LBB93_274
	jmp	.LBB93_275
.LBB93_275:                             // %.loopexit133.loopexit
                                        //   in Loop: Header=BB93_1 Depth=1
add	x11, 2
.LBB93_276:                             // %.loopexit133
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x10
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
	mov	x7, rsp
add	x7, 92
	add	x7, x11
	mov	x1, [x7]
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
	mov	[x7], rax
	mov	r0, x12
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
	jg	x12, r0, .LBB93_278
	jmp	.LBB93_277
.LBB93_277:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 0
	sub	r0, x12
	mov	x12, r0
.LBB93_278:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x3, x7
add	x3, 1
	mov	x1, [x3]
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
	mov	[x3], rax
	mov	x8, x11
add	x8, 2
	mov	r0, 100
	jl	x12, r0, .LBB93_284
	jmp	.LBB93_279
.LBB93_279:                             // %.preheader131.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x7, [rsp+48]
	add	x7, x11
.LBB93_280:                             // %.preheader131
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 10
	mov	x1, x12
	mov	x9, x7
	mov	r0, x1
	call	__udivsi3
	mov	x12, rax
	mov	r0, x12
	mul	r0, 246
	add	r0, x1
	mov	r1, 48
	call	__bit_or
	mov	x3, rsp
add	x3, 92
	add	x3, x11
add	x3, 2
	mov	x2, [x3]
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
	mov	[x3], rax
add	x11, 1
add	x7, 1
	jg	x1, x15, .LBB93_280
	jmp	.LBB93_281
.LBB93_281:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, x11
add	r0, 1
add	x11, 2
	mov	x15, -2147483623
	jge	x8, r0, .LBB93_286
	jmp	.LBB93_282
.LBB93_282:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x14, rsp
add	x14, 92
	add	x14, x8
	mov	x12, x14
	mov	x7, x9
.LBB93_283:                             //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x1, [x14]
	mov	x3, x9
	mov	r1, 255
add	x3, 1
	mov	r0, x1
	call	__bit_and
	mov	r0, [x3]
	mov	r1, 255
	mov	x2, rax
	call	__bit_and
	mov	x13, rax
	mov	r1, -256
add	x12, 1
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
	mov	[x14], rax
	mov	r0, [x3]
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
	mov	[x3], rax
	mov	r1, -2147483648
add	x7, -1
	mov	r0, x9
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x12
	call	__bit_xor
	mov	x9, x7
	mov	x14, x12
	jl	rax, x1, .LBB93_283
	jmp	.LBB93_285
.LBB93_284:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, x12
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
	mov	x3, rsp
add	x3, 92
	add	x3, x8
	mov	r0, [x3]
	mov	r1, -256
	mov	x2, rax
	call	__bit_and
	mov	r1, 255
	mov	x9, rax
	mov	r0, x2
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x9
	mov	r1, rax
	call	__bit_or
	mov	[x3], rax
	mul	x1, -10
	add	x1, x12
add	x7, 3
	mov	x2, [x7]
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
	mov	[x7], rax
	mov	x15, -2147483623
	jmp	.LBB93_286
.LBB93_285:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+92]
	mov	r1, 255
	call	__bit_and
	mov	x14, rax
.LBB93_286:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x10
	call	__bit_and
	mov	x2, rsp
add	x2, 92
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
	mov	x3, 42
	mov	r0, -2147483558
	mov	x8, [rsp+56]
	jg	rax, r0, .LBB93_292
	jmp	.LBB93_287
.LBB93_287:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x14
	call	__bit_and
	jz	rax, .LBB93_292
	jmp	.LBB93_288
.LBB93_288:                             // %.preheader129.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x7, [rsp+48]
.LBB93_289:                             // %.preheader129
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x14
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, x15, .LBB93_291
	jmp	.LBB93_290
.LBB93_290:                             //   in Loop: Header=BB93_289 Depth=2
	mov	x3, x7
add	x3, -1
	mov	x1, [x3]
add	x14, -32
	mov	r1, 255
	mov	r0, x14
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
	mov	x3, 42
.LBB93_291:                             //   in Loop: Header=BB93_289 Depth=2
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	x14, rax
add	x7, 1
	jnz	x14, .LBB93_289
	jmp	.LBB93_292
.LBB93_292:                             // %.loopexit130
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x13, rsp
add	x13, 92
	jmp	.LBB93_400
.LBB93_293:                             //   in Loop: Header=BB93_1 Depth=1
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
	mov	x2, 6
	mov	r0, 0
	jl	x12, r0, .LBB93_295
	jmp	.LBB93_294
.LBB93_294:                             //   in Loop: Header=BB93_1 Depth=1
add	rax, 1
	mov	x2, rax
.LBB93_295:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, x15
	mov	r1, x14
	mov	r2, x15
	mov	r3, x14
	call	__unorddf2
	jz	rax, .LBB93_297
	jmp	.LBB93_296
.LBB93_296:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x10
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
	mov	r1, [rsp+24]
	call	__bit_and
	mov	x10, rax
	mov	r0, mcasm_static_ec102b563ba176d293dc88ca08ecc96e
	add	x10, r0
	jmp	.LBB93_299
.LBB93_297:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r2, -1
	mov	r3, 2146435071
	mov	r0, x15
	mov	r1, x14
	call	__gtdf2
	jl	rax, x0, .LBB93_309
	jmp	.LBB93_298
.LBB93_298:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x10
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
	mov	r1, [rsp+44]
	call	__bit_and
	mov	x10, rax
	mov	r0, mcasm_static_40f2bddad2b29e06c8c77391a68e96be
	add	x10, r0
.LBB93_299:                             // %memcpy.exit63
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [x10]
	mov	x2, x10
	mov	r1, 255
add	x2, 1
	call	__bit_and
	mov	r0, [rsp+92]
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
	mov	[rsp+92], rax
	mov	x3, x10
	mov	r1, 255
add	x3, 2
	call	__bit_and
	mov	x7, rsp
add	x7, 93
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
	mov	r0, [x3]
	mov	[x7], rax
	mov	r1, 255
add	x10, 3
	call	__bit_and
	mov	x3, rsp
add	x3, 94
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
	mov	r0, [x10]
	mov	r1, 255
	mov	[x3], rax
	call	__bit_and
	mov	x3, rsp
add	x3, 95
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
	mov	x1, rsp
add	x1, 92
	mov	r0, [rsp+52]
	mov	x3, 42
	mov	x7, -2139062144
	jz	r0, .LBB93_304
	jmp	.LBB93_300
.LBB93_300:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	x11, rsp
add	x11, 92
	mov	r0, x9
	call	__bit_and
	jz	rax, .LBB93_308
	jmp	.LBB93_301
.LBB93_301:                             // %.preheader1.i64.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x11, rsp
add	x11, 92
	mov	x1, [rsp+48]
	jmp	.LBB93_303
.LBB93_302:                             //   in Loop: Header=BB93_303 Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB93_308
	jmp	.LBB93_303
.LBB93_303:                             // %.preheader1.i64
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x11, 1
	mov	r1, 3
	mov	r0, x11
	call	__bit_and
	jnz	rax, .LBB93_302
	jmp	.LBB93_304
.LBB93_304:                             // %.loopexit.i65.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x1
add	x2, -4
add	x1, -1
.LBB93_305:                             // %.loopexit.i65
                                        //   Parent Loop BB93_1 Depth=1
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
	je	rax, x7, .LBB93_305
	jmp	.LBB93_306
.LBB93_306:                             // %.preheader.i66.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x1, 0
.LBB93_307:                             // %.preheader.i66
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x11, 1
add	x1, 1
	jnz	rax, .LBB93_307
	jmp	.LBB93_308
.LBB93_308:                             // %strlen.exit67
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x13, rsp
add	x13, 92
	sub	x11, x13
	jmp	.LBB93_400
.LBB93_309:                             //   in Loop: Header=BB93_1 Depth=1
	mov	[rsp+56], x8
	mov	r3, rsp
add	r3, 92
	mov	r0, x15
	mov	r1, x14
	mov	r2, x2
	call	gcvt_fast
	mov	x8, -2139062144
	mov	x15, -2147483623
	jz	x9, .LBB93_384
	jmp	.LBB93_310
.LBB93_310:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x9, rsp
add	x9, 92
	mov	r0, [rsp+52]
	mov	x7, 101
	mov	x11, 69
	jz	r0, .LBB93_312
	jmp	.LBB93_311
.LBB93_311:                             // %.preheader152.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x9, rsp
add	x9, 92
	mov	x1, [rsp+36]
	jmp	.LBB93_314
.LBB93_312:                             // %.loopexit9.i
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, [x9]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x8, .LBB93_319
	jmp	.LBB93_313
.LBB93_313:                             // %.preheader5.i.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	jmp	.LBB93_317
.LBB93_314:                             // %.preheader152
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB93_322
	jmp	.LBB93_315
.LBB93_315:                             // %.preheader152
                                        //   in Loop: Header=BB93_314 Depth=2
	je	rax, x7, .LBB93_347
	jmp	.LBB93_316
.LBB93_316:                             //   in Loop: Header=BB93_314 Depth=2
add	x1, -1
add	x9, 1
	jz	x1, .LBB93_312
	jmp	.LBB93_314
.LBB93_317:                             // %.preheader5.i
                                        //   Parent Loop BB93_1 Depth=1
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
	jne	rax, x8, .LBB93_319
	jmp	.LBB93_318
.LBB93_318:                             //   in Loop: Header=BB93_317 Depth=2
add	x9, 4
	mov	x2, [x9]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x8, .LBB93_317
	jmp	.LBB93_319
.LBB93_319:                             // %.loopexit6.i.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
add	x9, -1
.LBB93_320:                             // %.loopexit6.i
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x9, 1
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	je	rax, x7, .LBB93_346
	jmp	.LBB93_321
.LBB93_321:                             // %.loopexit6.i
                                        //   in Loop: Header=BB93_320 Depth=2
	jnz	rax, .LBB93_320
	jmp	.LBB93_322
.LBB93_322:                             // %.loopexit150
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x9, rsp
add	x9, 92
	mov	r0, [rsp+52]
	jz	r0, .LBB93_324
	jmp	.LBB93_323
.LBB93_323:                             // %.preheader146.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x9, rsp
add	x9, 92
	mov	x1, [rsp+36]
	jmp	.LBB93_326
.LBB93_324:                             // %.loopexit9.i69
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, [x9]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x8, .LBB93_331
	jmp	.LBB93_325
.LBB93_325:                             // %.preheader5.i72.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	jmp	.LBB93_329
.LBB93_326:                             // %.preheader146
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB93_334
	jmp	.LBB93_327
.LBB93_327:                             // %.preheader146
                                        //   in Loop: Header=BB93_326 Depth=2
	je	rax, x11, .LBB93_345
	jmp	.LBB93_328
.LBB93_328:                             //   in Loop: Header=BB93_326 Depth=2
add	x1, -1
add	x9, 1
	jz	x1, .LBB93_324
	jmp	.LBB93_326
.LBB93_329:                             // %.preheader5.i72
                                        //   Parent Loop BB93_1 Depth=1
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
	jne	rax, x8, .LBB93_331
	jmp	.LBB93_330
.LBB93_330:                             //   in Loop: Header=BB93_329 Depth=2
add	x9, 4
	mov	x2, [x9]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x8, .LBB93_329
	jmp	.LBB93_331
.LBB93_331:                             // %.loopexit6.i70.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
add	x9, -1
.LBB93_332:                             // %.loopexit6.i70
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x9, 1
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	je	rax, x11, .LBB93_344
	jmp	.LBB93_333
.LBB93_333:                             // %.loopexit6.i70
                                        //   in Loop: Header=BB93_332 Depth=2
	jnz	rax, .LBB93_332
	jmp	.LBB93_334
.LBB93_334:                             // %.loopexit144
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x1, rsp
add	x1, 92
	mov	r0, [rsp+52]
	jz	r0, .LBB93_339
	jmp	.LBB93_335
.LBB93_335:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x9, rsp
add	x9, 92
	mov	r0, [rsp+92]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB93_343
	jmp	.LBB93_336
.LBB93_336:                             // %.preheader1.i74.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x9, rsp
add	x9, 92
	mov	x1, [rsp+48]
	jmp	.LBB93_338
.LBB93_337:                             //   in Loop: Header=BB93_338 Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB93_343
	jmp	.LBB93_338
.LBB93_338:                             // %.preheader1.i74
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x9, 1
	mov	r1, 3
	mov	r0, x9
	call	__bit_and
	jnz	rax, .LBB93_337
	jmp	.LBB93_339
.LBB93_339:                             // %.loopexit.i75.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x1
add	x2, -4
add	x1, -1
.LBB93_340:                             // %.loopexit.i75
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 4
	mov	r1, [x2]
	mov	r0, 16843008
	sub	r0, r1
	mov	x9, x1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x1, 4
	je	rax, x8, .LBB93_340
	jmp	.LBB93_341
.LBB93_341:                             // %.preheader.i76.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x1, 0
.LBB93_342:                             // %.preheader.i76
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x9, 1
add	x1, 1
	jnz	rax, .LBB93_342
	jmp	.LBB93_343
.LBB93_343:                             // %strlen.exit77
                                        //   in Loop: Header=BB93_1 Depth=1
	jmp	.LBB93_348
.LBB93_344:                             // %strchr.exit.loopexit
                                        //   in Loop: Header=BB93_1 Depth=1
	jmp	.LBB93_348
.LBB93_345:                             // %strchr.exit.loopexit13
                                        //   in Loop: Header=BB93_1 Depth=1
	jmp	.LBB93_348
.LBB93_346:                             // %strchr.exit.loopexit14
                                        //   in Loop: Header=BB93_1 Depth=1
	jmp	.LBB93_348
.LBB93_347:                             // %strchr.exit.loopexit16
                                        //   in Loop: Header=BB93_1 Depth=1
.LBB93_348:                             // %strchr.exit
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x11, rsp
add	x11, 92
	mov	r0, [rsp+52]
	jz	r0, .LBB93_350
	jmp	.LBB93_349
.LBB93_349:                             // %.preheader143.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x11, rsp
add	x11, 92
	mov	x1, [rsp+36]
	jmp	.LBB93_352
.LBB93_350:                             // %.loopexit9.i78
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, [x11]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x8, .LBB93_357
	jmp	.LBB93_351
.LBB93_351:                             // %.preheader5.i81.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	jmp	.LBB93_355
.LBB93_352:                             // %.preheader143
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB93_364
	jmp	.LBB93_353
.LBB93_353:                             // %.preheader143
                                        //   in Loop: Header=BB93_352 Depth=2
	mov	r0, 46
	je	rax, r0, .LBB93_361
	jmp	.LBB93_354
.LBB93_354:                             //   in Loop: Header=BB93_352 Depth=2
add	x1, -1
add	x11, 1
	jz	x1, .LBB93_350
	jmp	.LBB93_352
.LBB93_355:                             // %.preheader5.i81
                                        //   Parent Loop BB93_1 Depth=1
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
	jne	rax, x8, .LBB93_357
	jmp	.LBB93_356
.LBB93_356:                             //   in Loop: Header=BB93_355 Depth=2
add	x11, 4
	mov	x2, [x11]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x8, .LBB93_355
	jmp	.LBB93_357
.LBB93_357:                             // %.loopexit6.i79.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
add	x11, -1
.LBB93_358:                             // %.loopexit6.i79
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x11, 1
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	mov	r0, 46
	je	rax, r0, .LBB93_360
	jmp	.LBB93_359
.LBB93_359:                             // %.loopexit6.i79
                                        //   in Loop: Header=BB93_358 Depth=2
	jnz	rax, .LBB93_358
	jmp	.LBB93_360
.LBB93_360:                             //   in Loop: Header=BB93_1 Depth=1
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
	jmp	.LBB93_362
.LBB93_361:                             // %strchr.exit82.loopexit
                                        //   in Loop: Header=BB93_1 Depth=1
.LBB93_362:                             // %strchr.exit82
                                        //   in Loop: Header=BB93_1 Depth=1
	jz	x11, .LBB93_364
	jmp	.LBB93_363
.LBB93_363:                             // %strchr.exit82
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r1, -2147483648
	mov	r0, x9
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x11
	call	__bit_xor
	jl	rax, x1, .LBB93_384
	jmp	.LBB93_364
.LBB93_364:                             // %strchr.exit82.thread
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x11, x9
	mov	r1, 3
add	x11, 1
	mov	r0, x9
	call	__bit_and
	mov	x1, x9
	jz	rax, .LBB93_369
	jmp	.LBB93_365
.LBB93_365:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	mov	x13, x9
	jz	rax, .LBB93_373
	jmp	.LBB93_366
.LBB93_366:                             // %.preheader1.i83.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x13, x9
	mov	x1, x11
	jmp	.LBB93_368
.LBB93_367:                             //   in Loop: Header=BB93_368 Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB93_373
	jmp	.LBB93_368
.LBB93_368:                             // %.preheader1.i83
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x13, 1
	mov	r1, 3
	mov	r0, x13
	call	__bit_and
	jnz	rax, .LBB93_367
	jmp	.LBB93_369
.LBB93_369:                             // %.loopexit.i84.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x1
add	x2, -4
add	x1, -1
.LBB93_370:                             // %.loopexit.i84
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 4
	mov	r1, [x2]
	mov	r0, 16843008
	sub	r0, r1
	mov	x13, x1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
add	x1, 4
	je	rax, x8, .LBB93_370
	jmp	.LBB93_371
.LBB93_371:                             // %.preheader.i85.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x1, 0
.LBB93_372:                             // %.preheader.i85
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x13, 1
add	x1, 1
	jnz	rax, .LBB93_372
	jmp	.LBB93_373
.LBB93_373:                             // %strlen.exit86
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x12, x13
	sub	x12, x9
add	x12, 1
	mov	r0, 2
	jl	x12, r0, .LBB93_381
	jmp	.LBB93_374
.LBB93_374:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x14, x13
add	x14, 1
	mov	r1, -2147483648
	add	x11, x12
	mov	r0, x12
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB93_379
	jmp	.LBB93_375
.LBB93_375:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, x14
	mov	r1, x11
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB93_379
	jmp	.LBB93_376
.LBB93_376:                             // %.preheader.i88.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x11, x9
	add	x11, x13
	mov	x1, 0
add	x13, 1
	sub	x1, x9
	mov	x12, x13
	mov	x2, -2147483645
.LBB93_377:                             // %.preheader.i88
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x11
	add	r0, x1
	mov	r1, r0
add	r1, -3
	mov	r1, [r1]
add	r0, -2
	mov	[r0], r1
add	x12, -4
	mov	r0, x1
	add	r0, x12
	mov	r1, -2147483648
add	x11, -4
	call	__bit_xor
	jg	rax, x2, .LBB93_377
	jmp	.LBB93_378
.LBB93_378:                             // %.loopexit9.i89
                                        //   in Loop: Header=BB93_1 Depth=1
	sub	x11, x9
	sub	x12, x9
	mov	x14, x11
add	x14, 1
add	x11, 2
	jz	x12, .LBB93_383
	jmp	.LBB93_379
.LBB93_379:                             // %.loopexit9.i89.thread.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
add	x14, -1
add	x11, -1
.LBB93_380:                             // %.loopexit9.i89.thread
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x14]
	mov	r1, 255
add	x12, -1
	call	__bit_and
	mov	r0, [x11]
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
	mov	[x11], rax
add	x14, -1
add	x11, -1
	jz	x12, .LBB93_383
	jmp	.LBB93_380
.LBB93_381:                             // %.loopexit11.i
                                        //   in Loop: Header=BB93_1 Depth=1
	jz	x12, .LBB93_383
	jmp	.LBB93_382
.LBB93_382:                             // %memmove.exit.loopexit359
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	mov	x3, x9
add	x3, 1
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
	mov	x3, 42
.LBB93_383:                             // %memmove.exit
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [x9]
	mov	r1, -256
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x9], rax
.LBB93_384:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x10
	call	__bit_and
	mov	r0, [rsp+92]
	mov	r1, 255
	mov	x1, rax
	call	__bit_and
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483558
	jg	rax, r0, .LBB93_390
	jmp	.LBB93_385
.LBB93_385:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	jz	rax, .LBB93_390
	jmp	.LBB93_386
.LBB93_386:                             // %.preheader139.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x7, [rsp+48]
.LBB93_387:                             // %.preheader139
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, x15, .LBB93_389
	jmp	.LBB93_388
.LBB93_388:                             //   in Loop: Header=BB93_387 Depth=2
	mov	x3, x7
add	x3, -1
	mov	x1, [x3]
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
	mov	[x3], rax
	mov	x3, 42
.LBB93_389:                             //   in Loop: Header=BB93_387 Depth=2
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
add	x7, 1
	jnz	x2, .LBB93_387
	jmp	.LBB93_390
.LBB93_390:                             // %.loopexit140
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x1, rsp
add	x1, 92
	mov	r0, [rsp+52]
	jz	r0, .LBB93_395
	jmp	.LBB93_391
.LBB93_391:                             //   in Loop: Header=BB93_1 Depth=1
	mov	x11, rsp
add	x11, 92
	mov	r0, [rsp+92]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB93_399
	jmp	.LBB93_392
.LBB93_392:                             // %.preheader1.i90.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x11, rsp
add	x11, 92
	mov	x1, [rsp+48]
	jmp	.LBB93_394
.LBB93_393:                             //   in Loop: Header=BB93_394 Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB93_399
	jmp	.LBB93_394
.LBB93_394:                             // %.preheader1.i90
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x11, 1
	mov	r1, 3
	mov	r0, x11
	call	__bit_and
	jnz	rax, .LBB93_393
	jmp	.LBB93_395
.LBB93_395:                             // %.loopexit.i91.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x1
add	x2, -4
add	x1, -1
.LBB93_396:                             // %.loopexit.i91
                                        //   Parent Loop BB93_1 Depth=1
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
	je	rax, x8, .LBB93_396
	jmp	.LBB93_397
.LBB93_397:                             // %.preheader.i92.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x1, 0
.LBB93_398:                             // %.preheader.i92
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x11, 1
add	x1, 1
	jnz	rax, .LBB93_398
	jmp	.LBB93_399
.LBB93_399:                             // %strlen.exit93
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x13, rsp
add	x13, 92
	sub	x11, x13
	mov	x8, [rsp+56]
.LBB93_400:                             //   in Loop: Header=BB93_1 Depth=1
	sub	x6, x11
	add	x6, x8
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
	mov	x10, [rsp+72]
	mov	r1, x10
	call	__bit_or
	mov	x15, [rsp+64]
	jnz	rax, .LBB93_410
	jmp	.LBB93_401
.LBB93_401:                             //   in Loop: Header=BB93_1 Depth=1
	jl	x6, x0, .LBB93_410
	jmp	.LBB93_402
.LBB93_402:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 84
	mov	x8, [r1]
	jz	r0, .LBB93_404
	jmp	.LBB93_403
.LBB93_403:                             // %.preheader123.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x7, x9
	mov	x2, x8
	jmp	.LBB93_406
.LBB93_404:                             //   in Loop: Header=BB93_1 Depth=1
	add	x8, x9
	mov	r0, rsp
add	r0, 84
	mov	[r0], x8
	jmp	.LBB93_410
.LBB93_405:                             //   in Loop: Header=BB93_406 Depth=2
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
add	x7, -1
	mov	x8, x2
.LBB93_406:                             // %.preheader123
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB93_409
	jmp	.LBB93_407
.LBB93_407:                             // %.preheader123
                                        //   in Loop: Header=BB93_406 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB93_409
	jmp	.LBB93_408
.LBB93_408:                             //   in Loop: Header=BB93_406 Depth=2
	add	x8, [rsp+76]
	mov	r0, [x8]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x8], rax
	mov	r0, rsp
add	r0, 84
	mov	x2, 1
	add	x2, [r0]
.LBB93_409:                             //   in Loop: Header=BB93_406 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	[r0], x2
	jg	x7, x0, .LBB93_405
	jmp	.LBB93_410
.LBB93_410:                             // %.loopexit124
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+68]
	jnz	r0, .LBB93_415
	jmp	.LBB93_411
.LBB93_411:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 84
	mov	x7, [r1]
	mov	x2, x7
add	x2, 1
	jz	r0, .LBB93_414
	jmp	.LBB93_412
.LBB93_412:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB93_414
	jmp	.LBB93_413
.LBB93_413:                             //   in Loop: Header=BB93_1 Depth=1
	add	x7, [rsp+76]
	mov	r0, [x7]
	mov	r1, -256
	call	__bit_and
	mov	r1, 255
	mov	x1, rax
	mov	r0, [rsp+60]
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_shl
	mov	r0, x1
	mov	r1, rax
	call	__bit_or
	mov	[x7], rax
	mov	r0, rsp
add	r0, 84
	mov	x2, 1
	add	x2, [r0]
.LBB93_414:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	[r0], x2
.LBB93_415:                             //   in Loop: Header=BB93_1 Depth=1
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
	jnz	rax, .LBB93_425
	jmp	.LBB93_416
.LBB93_416:                             //   in Loop: Header=BB93_1 Depth=1
	jl	x6, x0, .LBB93_425
	jmp	.LBB93_417
.LBB93_417:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 84
	mov	x8, [r1]
	jz	r0, .LBB93_419
	jmp	.LBB93_418
.LBB93_418:                             // %.preheader121.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x7, x9
	mov	x2, x8
	jmp	.LBB93_421
.LBB93_419:                             //   in Loop: Header=BB93_1 Depth=1
	add	x8, x9
	mov	r0, rsp
add	r0, 84
	mov	[r0], x8
	jmp	.LBB93_425
.LBB93_420:                             //   in Loop: Header=BB93_421 Depth=2
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
add	x7, -1
	mov	x8, x2
.LBB93_421:                             // %.preheader121
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB93_424
	jmp	.LBB93_422
.LBB93_422:                             // %.preheader121
                                        //   in Loop: Header=BB93_421 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB93_424
	jmp	.LBB93_423
.LBB93_423:                             //   in Loop: Header=BB93_421 Depth=2
	add	x8, [rsp+76]
	mov	r0, [x8]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x8], rax
	mov	r0, rsp
add	r0, 84
	mov	x2, 1
	add	x2, [r0]
.LBB93_424:                             //   in Loop: Header=BB93_421 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	[r0], x2
	jg	x7, x0, .LBB93_420
	jmp	.LBB93_425
.LBB93_425:                             // %.loopexit122
                                        //   in Loop: Header=BB93_1 Depth=1
	jz	x11, .LBB93_434
	jmp	.LBB93_426
.LBB93_426:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 84
	mov	x7, [r1]
	jz	r0, .LBB93_428
	jmp	.LBB93_427
.LBB93_427:                             // %.preheader119.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
add	x11, -1
	mov	x2, x7
	jmp	.LBB93_430
.LBB93_428:                             //   in Loop: Header=BB93_1 Depth=1
	add	x7, x11
	mov	r0, rsp
add	r0, 84
	mov	[r0], x7
	jmp	.LBB93_434
.LBB93_429:                             //   in Loop: Header=BB93_430 Depth=2
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
add	x13, 1
add	x11, -1
	mov	x7, x2
.LBB93_430:                             // %.preheader119
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB93_433
	jmp	.LBB93_431
.LBB93_431:                             // %.preheader119
                                        //   in Loop: Header=BB93_430 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB93_433
	jmp	.LBB93_432
.LBB93_432:                             //   in Loop: Header=BB93_430 Depth=2
	mov	r0, [x13]
	mov	r1, 255
	call	__bit_and
	add	x7, [rsp+76]
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
add	r0, 84
	mov	x2, 1
	add	x2, [r0]
.LBB93_433:                             //   in Loop: Header=BB93_430 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	[r0], x2
	jnz	x11, .LBB93_429
	jmp	.LBB93_434
.LBB93_434:                             // %.loopexit120
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x11, 37
	jz	x5, .LBB93_444
	jmp	.LBB93_435
.LBB93_435:                             // %.loopexit120
                                        //   in Loop: Header=BB93_1 Depth=1
	jl	x6, x0, .LBB93_444
	jmp	.LBB93_436
.LBB93_436:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 84
	mov	x5, [r1]
	jz	r0, .LBB93_438
	jmp	.LBB93_437
.LBB93_437:                             // %.preheader117.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x5
	jmp	.LBB93_440
.LBB93_438:                             //   in Loop: Header=BB93_1 Depth=1
	add	x5, x9
	mov	r0, rsp
add	r0, 84
	mov	[r0], x5
	jmp	.LBB93_444
.LBB93_439:                             //   in Loop: Header=BB93_440 Depth=2
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
add	x9, -1
	mov	x5, x2
.LBB93_440:                             // %.preheader117
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB93_443
	jmp	.LBB93_441
.LBB93_441:                             // %.preheader117
                                        //   in Loop: Header=BB93_440 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB93_443
	jmp	.LBB93_442
.LBB93_442:                             //   in Loop: Header=BB93_440 Depth=2
	add	x5, [rsp+76]
	mov	r0, [x5]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x5], rax
	mov	r0, rsp
add	r0, 84
	mov	x2, 1
	add	x2, [r0]
.LBB93_443:                             //   in Loop: Header=BB93_440 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	[r0], x2
	jg	x9, x0, .LBB93_439
	jmp	.LBB93_444
.LBB93_444:                             // %.loopexit118
                                        //   in Loop: Header=BB93_1 Depth=1
	jmp	.LBB93_1
.LBB93_445:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
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
	mov	r1, mcasm_static_a4e7dd8d428b46688e58083d59991365
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
	jz	rax, .LBB93_450
	jmp	.LBB93_446
.LBB93_446:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	x8, x7
	jz	rax, .LBB93_454
	jmp	.LBB93_447
.LBB93_447:                             // %.preheader1.i94.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x1, x7
add	x1, 1
	mov	x8, x7
	jmp	.LBB93_449
.LBB93_448:                             //   in Loop: Header=BB93_449 Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB93_454
	jmp	.LBB93_449
.LBB93_449:                             // %.preheader1.i94
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x8, 1
	mov	r1, 3
	mov	r0, x8
	call	__bit_and
	jnz	rax, .LBB93_448
	jmp	.LBB93_450
.LBB93_450:                             // %.loopexit.i95.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x1
add	x2, -4
add	x1, -1
	mov	x9, -2139062144
.LBB93_451:                             // %.loopexit.i95
                                        //   Parent Loop BB93_1 Depth=1
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
	je	rax, x9, .LBB93_451
	jmp	.LBB93_452
.LBB93_452:                             // %.preheader.i96.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x1, 0
.LBB93_453:                             // %.preheader.i96
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, x2
	add	r0, x1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x8, 1
add	x1, 1
	jnz	rax, .LBB93_453
	jmp	.LBB93_454
.LBB93_454:                             // %strlen.exit97
                                        //   in Loop: Header=BB93_1 Depth=1
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
	jl	x12, r0, .LBB93_456
	jmp	.LBB93_455
.LBB93_455:                             //   in Loop: Header=BB93_1 Depth=1
	add	x8, rax
.LBB93_456:                             //   in Loop: Header=BB93_1 Depth=1
	jnz	x5, .LBB93_466
	jmp	.LBB93_457
.LBB93_457:                             //   in Loop: Header=BB93_1 Depth=1
	jle	x6, x8, .LBB93_466
	jmp	.LBB93_458
.LBB93_458:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 84
	mov	x10, [r1]
	mov	x9, x6
	sub	x9, x8
	jz	r0, .LBB93_460
	jmp	.LBB93_459
.LBB93_459:                             // %.preheader159.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x10
	jmp	.LBB93_462
.LBB93_460:                             //   in Loop: Header=BB93_1 Depth=1
	add	x10, x9
	mov	r0, rsp
add	r0, 84
	mov	[r0], x10
	jmp	.LBB93_466
.LBB93_461:                             //   in Loop: Header=BB93_462 Depth=2
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
add	x9, -1
	mov	x10, x2
.LBB93_462:                             // %.preheader159
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB93_465
	jmp	.LBB93_463
.LBB93_463:                             // %.preheader159
                                        //   in Loop: Header=BB93_462 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB93_465
	jmp	.LBB93_464
.LBB93_464:                             //   in Loop: Header=BB93_462 Depth=2
	add	x10, [rsp+76]
	mov	r0, [x10]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x10], rax
	mov	r0, rsp
add	r0, 84
	mov	x2, 1
	add	x2, [r0]
.LBB93_465:                             //   in Loop: Header=BB93_462 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	[r0], x2
	jg	x9, x0, .LBB93_461
	jmp	.LBB93_466
.LBB93_466:                             // %.loopexit160
                                        //   in Loop: Header=BB93_1 Depth=1
	jz	x8, .LBB93_475
	jmp	.LBB93_467
.LBB93_467:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 84
	mov	x10, [r1]
	jz	r0, .LBB93_469
	jmp	.LBB93_468
.LBB93_468:                             // %.preheader157.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x9, x8
add	x9, -1
	mov	x2, x10
	jmp	.LBB93_471
.LBB93_469:                             //   in Loop: Header=BB93_1 Depth=1
	add	x10, x8
	mov	r0, rsp
add	r0, 84
	mov	[r0], x10
	jmp	.LBB93_475
.LBB93_470:                             //   in Loop: Header=BB93_471 Depth=2
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
add	x7, 1
add	x9, -1
	mov	x10, x2
.LBB93_471:                             // %.preheader157
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB93_474
	jmp	.LBB93_472
.LBB93_472:                             // %.preheader157
                                        //   in Loop: Header=BB93_471 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB93_474
	jmp	.LBB93_473
.LBB93_473:                             //   in Loop: Header=BB93_471 Depth=2
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	add	x10, [rsp+76]
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
add	r0, 84
	mov	x2, 1
	add	x2, [r0]
.LBB93_474:                             //   in Loop: Header=BB93_471 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	[r0], x2
	jnz	x9, .LBB93_470
	jmp	.LBB93_475
.LBB93_475:                             // %.loopexit158
                                        //   in Loop: Header=BB93_1 Depth=1
	jz	x5, .LBB93_1
	jmp	.LBB93_476
.LBB93_476:                             // %.loopexit158
                                        //   in Loop: Header=BB93_1 Depth=1
	jle	x6, x8, .LBB93_1
	jmp	.LBB93_477
.LBB93_477:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	mov	r1, rsp
add	r1, 84
	mov	x5, [r1]
	sub	x6, x8
	jz	r0, .LBB93_479
	jmp	.LBB93_478
.LBB93_478:                             // %.preheader155.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x5
	jmp	.LBB93_481
.LBB93_479:                             //   in Loop: Header=BB93_1 Depth=1
	add	x5, x6
	mov	r0, rsp
add	r0, 84
	mov	[r0], x5
	jmp	.LBB93_1
.LBB93_480:                             //   in Loop: Header=BB93_481 Depth=2
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
add	x6, -1
	mov	x5, x2
.LBB93_481:                             // %.preheader155
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB93_484
	jmp	.LBB93_482
.LBB93_482:                             // %.preheader155
                                        //   in Loop: Header=BB93_481 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB93_484
	jmp	.LBB93_483
.LBB93_483:                             //   in Loop: Header=BB93_481 Depth=2
	add	x5, [rsp+76]
	mov	r0, [x5]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x5], rax
	mov	r0, rsp
add	r0, 84
	mov	x2, 1
	add	x2, [r0]
.LBB93_484:                             //   in Loop: Header=BB93_481 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	[r0], x2
	jg	x6, x0, .LBB93_480
	jmp	.LBB93_1
.LBB93_485:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, [rsp+88]
	mov	r1, r0
add	r1, 4
	mov	[rsp+88], r1
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
	mov	r0, [rsp+72]
	mov	[r3], r0
add	r4, 4
	mov	[r4], 0
	mov	[rsp], 0
	mov	r0, rsp
add	r0, 76
	mov	r2, 0
	mov	r3, 0
	mov	r4, 16
	mov	r5, 0
	mov	r6, 1
	mov	r7, x5
	call	format_integer
	jmp	.LBB93_1
.LBB93_486:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	r0, [r0]
	mov	r1, 3
	jg	x2, r1, .LBB93_490
	jmp	.LBB93_487
.LBB93_487:                             //   in Loop: Header=BB93_1 Depth=1
	je	x2, x0, .LBB93_493
	jmp	.LBB93_488
.LBB93_488:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 2
	je	x2, r1, .LBB93_494
	jmp	.LBB93_489
.LBB93_489:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 3
	mov	x3, 42
	je	x2, r1, .LBB93_495
	jmp	.LBB93_499
.LBB93_490:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 4
	je	x2, r1, .LBB93_496
	jmp	.LBB93_491
.LBB93_491:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 6
	je	x2, r1, .LBB93_497
	jmp	.LBB93_492
.LBB93_492:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, 7
	je	x2, r1, .LBB93_498
	jmp	.LBB93_499
.LBB93_493:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, [rsp+88]
	mov	r2, r1
add	r2, 4
	mov	[rsp+88], r2
	mov	x3, [r1]
	mov	x1, [x3]
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
	mov	[x3], rax
	mov	x3, 42
	jmp	.LBB93_1
.LBB93_494:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, [rsp+88]
	mov	r2, r1
add	r2, 4
	mov	[rsp+88], r2
	mov	x3, [r1]
	mov	x1, [x3]
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
	mov	[x3], rax
	mov	x3, 42
	jmp	.LBB93_1
.LBB93_495:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, [rsp+88]
	mov	r2, r1
add	r2, 4
	mov	[rsp+88], r2
	mov	r1, [r1]
	mov	[r1], r0
	jmp	.LBB93_1
.LBB93_496:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, [rsp+88]
	mov	r2, r1
add	r2, 4
	mov	[rsp+88], r2
	mov	r1, [r1]
	mov	[r1], r0
add	r1, 4
	mov	[r1], 0
	jmp	.LBB93_1
.LBB93_497:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, [rsp+88]
	mov	r2, r1
add	r2, 4
	mov	[rsp+88], r2
	mov	r1, [r1]
	mov	[r1], r0
	jmp	.LBB93_1
.LBB93_498:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, [rsp+88]
	mov	r2, r1
add	r2, 4
	mov	[rsp+88], r2
	mov	r1, [r1]
	mov	[r1], r0
	jmp	.LBB93_1
.LBB93_499:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, [rsp+88]
	mov	r2, r1
add	r2, 4
	mov	[rsp+88], r2
	mov	r1, [r1]
	mov	[r1], r0
	jmp	.LBB93_1
.LBB93_500:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 80
	mov	x9, [r0]
	mov	r0, rsp
add	r0, 84
	mov	x7, [r0]
	jnz	x5, .LBB93_509
	jmp	.LBB93_501
.LBB93_501:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 2
	jl	x6, r0, .LBB93_509
	jmp	.LBB93_502
.LBB93_502:                             //   in Loop: Header=BB93_1 Depth=1
	jz	x9, .LBB93_504
	jmp	.LBB93_503
.LBB93_503:                             // %.preheader111.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x10, x6
add	x10, 1
	mov	x11, x7
	jmp	.LBB93_505
.LBB93_504:                             //   in Loop: Header=BB93_1 Depth=1
	add	x7, x6
	mov	r0, rsp
add	r0, 84
	mov	[r0], x7
	mov	x11, 37
	jmp	.LBB93_1
.LBB93_505:                             // %.preheader111
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x7, 1
	jz	x9, .LBB93_508
	jmp	.LBB93_506
.LBB93_506:                             // %.preheader111
                                        //   in Loop: Header=BB93_505 Depth=2
	mov	r1, -2147483648
	mov	r0, x9
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x7
	call	__bit_xor
	jge	rax, x1, .LBB93_508
	jmp	.LBB93_507
.LBB93_507:                             //   in Loop: Header=BB93_505 Depth=2
	add	x11, [rsp+76]
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
add	r0, 84
	mov	x7, 1
	add	x7, [r0]
	mov	r0, rsp
add	r0, 80
	mov	x9, [r0]
.LBB93_508:                             //   in Loop: Header=BB93_505 Depth=2
	mov	r0, rsp
add	r0, 84
add	x10, -1
	mov	[r0], x7
	mov	x11, x7
	mov	r0, 2
	jg	x10, r0, .LBB93_505
	jmp	.LBB93_509
.LBB93_509:                             // %.loopexit112
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x8, x7
add	x8, 1
	jz	x9, .LBB93_512
	jmp	.LBB93_510
.LBB93_510:                             // %.loopexit112
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	r1, -2147483648
	mov	r0, x9
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x8
	call	__bit_xor
	jge	rax, x1, .LBB93_512
	jmp	.LBB93_511
.LBB93_511:                             //   in Loop: Header=BB93_1 Depth=1
	add	x7, [rsp+76]
	mov	r0, [x7]
	mov	r1, -256
	call	__bit_and
	mov	r1, 37
	mov	r0, rax
	call	__bit_or
	mov	[x7], rax
	mov	r0, rsp
add	r0, 84
	mov	x7, [r0]
	mov	x8, x7
add	x8, 1
.LBB93_512:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	[r0], x8
	mov	x11, 37
	jz	x5, .LBB93_1
	jmp	.LBB93_513
.LBB93_513:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, 2
	jl	x6, r0, .LBB93_1
	jmp	.LBB93_514
.LBB93_514:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
	jz	r0, .LBB93_516
	jmp	.LBB93_515
.LBB93_515:                             // %.preheader109.preheader
                                        //   in Loop: Header=BB93_1 Depth=1
	mov	x2, x8
	jmp	.LBB93_518
.LBB93_516:                             //   in Loop: Header=BB93_1 Depth=1
	add	x7, x6
	mov	r0, rsp
add	r0, 84
	mov	[r0], x7
	jmp	.LBB93_1
.LBB93_517:                             //   in Loop: Header=BB93_518 Depth=2
	mov	r0, rsp
add	r0, 80
	mov	r0, [r0]
add	x6, -1
	mov	x8, x2
.LBB93_518:                             // %.preheader109
                                        //   Parent Loop BB93_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x2, 1
	jz	r0, .LBB93_521
	jmp	.LBB93_519
.LBB93_519:                             // %.preheader109
                                        //   in Loop: Header=BB93_518 Depth=2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB93_521
	jmp	.LBB93_520
.LBB93_520:                             //   in Loop: Header=BB93_518 Depth=2
	add	x8, [rsp+76]
	mov	r0, [x8]
	mov	r1, -256
	call	__bit_and
	mov	r1, 32
	mov	r0, rax
	call	__bit_or
	mov	[x8], rax
	mov	r0, rsp
add	r0, 84
	mov	x2, 1
	add	x2, [r0]
.LBB93_521:                             //   in Loop: Header=BB93_518 Depth=2
	mov	r0, rsp
add	r0, 84
	mov	[r0], x2
	mov	r0, 2
	jg	x6, r0, .LBB93_517
	jmp	.LBB93_1
.LBB93_522:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 80
	mov	x6, [r0]
	mov	r0, rsp
add	r0, 84
	mov	x2, [r0]
	mov	x5, x2
add	x5, 1
	jz	x6, .LBB93_528
	jmp	.LBB93_523
.LBB93_523:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x5
	call	__bit_xor
	jge	rax, x1, .LBB93_525
	jmp	.LBB93_524
.LBB93_524:                             //   in Loop: Header=BB93_1 Depth=1
	add	x2, [rsp+76]
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 37
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	mov	r0, rsp
add	r0, 80
	mov	x6, [r0]
	mov	r0, rsp
add	r0, 84
	mov	x2, [r0]
	mov	x5, x2
add	x5, 1
.LBB93_525:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r0, rsp
add	r0, 84
	mov	[r0], x5
	jz	x6, .LBB93_528
	jmp	.LBB93_526
.LBB93_526:                             //   in Loop: Header=BB93_1 Depth=1
	mov	r1, -2147483648
add	x2, 2
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x1, .LBB93_528
	jmp	.LBB93_527
.LBB93_527:                             //   in Loop: Header=BB93_1 Depth=1
	add	x5, [rsp+76]
	mov	x1, [x5]
	mov	r1, 255
	mov	r0, x10
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
add	r0, 84
	mov	x5, [r0]
.LBB93_528:                             //   in Loop: Header=BB93_1 Depth=1
add	x5, 1
	mov	r0, rsp
add	r0, 84
	mov	[r0], x5
	jmp	.LBB93_1
.LBB93_529:
	mov	r0, rsp
add	r0, 80
	mov	x1, [r0]
	mov	r0, rsp
add	r0, 84
	mov	x0, [r0]
	jz	x1, .LBB93_531
	jmp	.LBB93_530
.LBB93_530:
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
	add	x0, [rsp+76]
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	r0, rsp
add	r0, 84
	mov	x0, [r0]
.LBB93_531:
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
	mov	x15, [rsp+508]
	mov	x14, [rsp+512]
	mov	x13, [rsp+516]
	mov	x12, [rsp+520]
	mov	x11, [rsp+524]
	mov	x10, [rsp+528]
	mov	x9, [rsp+532]
	mov	x8, [rsp+536]
	mov	x7, [rsp+540]
	mov	x6, [rsp+544]
	mov	x5, [rsp+548]
	mov	x4, [rsp+552]
	mov	x3, [rsp+556]
	mov	x2, [rsp+560]
	mov	x1, [rsp+564]
	mov	x0, [rsp+568]
add	rsp, 572
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
	jnz	x9, .LBB94_2
	jmp	.LBB94_1
.LBB94_1:
	mov	x14, 0
	jz	x15, .LBB94_6
	jmp	.LBB94_2
.LBB94_2:
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
	mov	x1, mcasm_static_33e910d9c02b581815e9f2b4c5abb7e7
	mov	r1, mcasm_static_f5c19d5e962478431864f85657b6afe2
	sub	r1, x1
add	rax, 1
	mov	r0, rax
	call	__bit_and
	jnz	x4, .LBB94_4
	jmp	.LBB94_3
.LBB94_3:
	add	x1, rax
	mov	x12, 0
	mov	x11, x6
	mov	x10, x5
	mov	x14, 0
	jmp	.LBB94_5
.LBB94_4:
	mov	r0, [rsp+20]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[rsp+20], rax
	jmp	.LBB94_6
.LBB94_5:                               // =>This Inner Loop Header: Depth=1
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
	jnz	rax, .LBB94_5
	jmp	.LBB94_6
.LBB94_6:                               // %.loopexit22
	mov	rax, 45
	mov	x1, 0
	mov	x10, 0
	jnz	x8, .LBB94_9
	jmp	.LBB94_7
.LBB94_7:
	mov	r0, [rsp+148]
	mov	rax, 43
	jnz	r0, .LBB94_9
	jmp	.LBB94_8
.LBB94_8:
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
.LBB94_9:
	mov	[rsp], rax
	mov	x4, 0
	mov	x9, 0
	mov	x11, 0
	mov	r1, 0
	mov	r0, [rsp+12]
	jz	r0, .LBB94_17
	jmp	.LBB94_10
.LBB94_10:
	mov	r0, 8
	jne	x3, r0, .LBB94_14
	jmp	.LBB94_11
.LBB94_11:
	jz	x14, .LBB94_13
	jmp	.LBB94_12
.LBB94_12:
	mov	r0, rsp
add	r0, 20
	add	r0, x14
add	r0, -1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, 48
	mov	r1, 0
	je	rax, r0, .LBB94_17
	jmp	.LBB94_13
.LBB94_13:
	mov	x1, 48
	mov	x4, 1
	mov	x11, 1
	jmp	.LBB94_17
.LBB94_14:
	mov	r0, x6
	mov	r1, x5
	call	__bit_or
	mov	r1, 0
	jz	rax, .LBB94_17
	jmp	.LBB94_15
.LBB94_15:
	mov	r0, 16
	jne	x3, r0, .LBB94_17
	jmp	.LBB94_16
.LBB94_16:
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
.LBB94_17:
	mov	x13, x15
	sub	x13, x14
	jg	x15, x14, .LBB94_19
	jmp	.LBB94_18
.LBB94_18:
	mov	x13, 0
.LBB94_19:
	mov	r0, -1
	mov	x5, x13
	jg	x15, r0, .LBB94_21
	jmp	.LBB94_20
.LBB94_20:
	mov	x5, 0
.LBB94_21:
	mov	[rsp+4], r1
	mov	x3, [rsp+160]
	mov	x2, 0
	jg	x15, r0, .LBB94_23
	jmp	.LBB94_22
.LBB94_22:
	mov	x2, [rsp+156]
.LBB94_23:
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
	jg	x3, rax, .LBB94_25
	jmp	.LBB94_24
.LBB94_24:
	mov	x1, 0
.LBB94_25:
	mov	r0, x2
	mov	r1, [rsp+16]
	call	__bit_or
	mov	x11, x0
add	x11, 4
	mov	x7, x0
add	x7, 8
	jnz	rax, .LBB94_35
	jmp	.LBB94_26
.LBB94_26:
	mov	r0, 1
	jl	x1, r0, .LBB94_35
	jmp	.LBB94_27
.LBB94_27:
	mov	r0, [x11]
	mov	x8, [x7]
	jz	r0, .LBB94_29
	jmp	.LBB94_28
.LBB94_28:                              // %.preheader20.preheader
	mov	x15, 1
	mov	x6, x12
	mov	x3, x8
	jmp	.LBB94_31
.LBB94_29:
	add	x8, x1
	mov	[x7], x8
	jmp	.LBB94_35
.LBB94_30:                              //   in Loop: Header=BB94_31 Depth=1
	mov	r0, [x11]
add	x6, -1
	mov	x8, x3
.LBB94_31:                              // %.preheader20
                                        // =>This Inner Loop Header: Depth=1
add	x3, 1
	jz	r0, .LBB94_34
	jmp	.LBB94_32
.LBB94_32:                              // %.preheader20
                                        //   in Loop: Header=BB94_31 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x3
	call	__bit_xor
	jge	rax, x5, .LBB94_34
	jmp	.LBB94_33
.LBB94_33:                              //   in Loop: Header=BB94_31 Depth=1
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
.LBB94_34:                              //   in Loop: Header=BB94_31 Depth=1
	mov	[x7], x3
	jg	x6, x15, .LBB94_30
	jmp	.LBB94_35
.LBB94_35:                              // %.loopexit21
	jnz	x10, .LBB94_40
	jmp	.LBB94_36
.LBB94_36:
	mov	r0, [x11]
	jz	r0, .LBB94_39
	jmp	.LBB94_37
.LBB94_37:
	mov	x6, [x7]
	mov	x3, x6
	mov	r1, -2147483648
add	x3, 1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x3
	call	__bit_xor
	jge	rax, x5, .LBB94_39
	jmp	.LBB94_38
.LBB94_38:
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
.LBB94_39:
	add	[x7], 1
.LBB94_40:
	mov	x8, x1
	jz	x4, .LBB94_45
	jmp	.LBB94_41
.LBB94_41:
	mov	r0, [x11]
	jz	r0, .LBB94_44
	jmp	.LBB94_42
.LBB94_42:
	mov	x4, [x7]
	mov	x3, x4
	mov	r1, -2147483648
add	x3, 1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x3
	call	__bit_xor
	jge	rax, x5, .LBB94_44
	jmp	.LBB94_43
.LBB94_43:
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
.LBB94_44:
	add	[x7], 1
.LBB94_45:
	jz	x9, .LBB94_50
	jmp	.LBB94_46
.LBB94_46:
	mov	r0, [x11]
	jz	r0, .LBB94_49
	jmp	.LBB94_47
.LBB94_47:
	mov	x5, [x7]
	mov	x3, x5
	mov	r1, -2147483648
add	x3, 1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x3
	call	__bit_xor
	jge	rax, x4, .LBB94_49
	jmp	.LBB94_48
.LBB94_48:
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
.LBB94_49:
	add	[x7], 1
.LBB94_50:
	mov	r0, [rsp+16]
	jnz	r0, .LBB94_61
	jmp	.LBB94_51
.LBB94_51:
	jz	x2, .LBB94_61
	jmp	.LBB94_52
.LBB94_52:
	mov	r0, 1
	jl	x8, r0, .LBB94_61
	jmp	.LBB94_53
.LBB94_53:
	mov	r0, [x11]
	mov	x6, [x7]
	jz	r0, .LBB94_55
	jmp	.LBB94_54
.LBB94_54:                              // %.preheader18.preheader
	mov	x4, 1
	mov	x5, x12
	mov	x2, x6
	jmp	.LBB94_57
.LBB94_55:
	add	x6, x8
	mov	[x7], x6
	jmp	.LBB94_61
.LBB94_56:                              //   in Loop: Header=BB94_57 Depth=1
	mov	r0, [x11]
add	x5, -1
	mov	x6, x2
.LBB94_57:                              // %.preheader18
                                        // =>This Inner Loop Header: Depth=1
add	x2, 1
	jz	r0, .LBB94_60
	jmp	.LBB94_58
.LBB94_58:                              // %.preheader18
                                        //   in Loop: Header=BB94_57 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x3, .LBB94_60
	jmp	.LBB94_59
.LBB94_59:                              //   in Loop: Header=BB94_57 Depth=1
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
.LBB94_60:                              //   in Loop: Header=BB94_57 Depth=1
	mov	[x7], x2
	jg	x5, x4, .LBB94_56
	jmp	.LBB94_61
.LBB94_61:                              // %.loopexit19
	mov	x4, 1
	mov	r1, [rsp+12]
	jl	r1, x4, .LBB94_70
	jmp	.LBB94_62
.LBB94_62:
	mov	r0, [x11]
	mov	x5, [x7]
	jz	r0, .LBB94_64
	jmp	.LBB94_63
.LBB94_63:                              // %.preheader16.preheader
	mov	x1, 1
	mov	x2, x5
	jmp	.LBB94_66
.LBB94_64:
	add	x5, r1
	mov	[x7], x5
	jmp	.LBB94_70
.LBB94_65:                              //   in Loop: Header=BB94_66 Depth=1
	mov	r0, [x11]
add	x13, -1
	mov	x5, x2
.LBB94_66:                              // %.preheader16
                                        // =>This Inner Loop Header: Depth=1
add	x2, 1
	jz	r0, .LBB94_69
	jmp	.LBB94_67
.LBB94_67:                              // %.preheader16
                                        //   in Loop: Header=BB94_66 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x3, .LBB94_69
	jmp	.LBB94_68
.LBB94_68:                              //   in Loop: Header=BB94_66 Depth=1
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
.LBB94_69:                              //   in Loop: Header=BB94_66 Depth=1
	mov	[x7], x2
	jg	x13, x1, .LBB94_65
	jmp	.LBB94_70
.LBB94_70:                              // %.loopexit17
	jl	x14, x4, .LBB94_79
	jmp	.LBB94_71
.LBB94_71:
	mov	r0, [x11]
	mov	x5, [x7]
	jz	r0, .LBB94_73
	jmp	.LBB94_72
.LBB94_72:                              // %.preheader14.preheader
	mov	x1, rsp
add	x1, 19
	mov	x4, 1
	mov	x2, x5
	jmp	.LBB94_75
.LBB94_73:
	add	x5, x14
	mov	[x7], x5
	jmp	.LBB94_79
.LBB94_74:                              //   in Loop: Header=BB94_75 Depth=1
	mov	r0, [x11]
add	x14, -1
	mov	x5, x2
.LBB94_75:                              // %.preheader14
                                        // =>This Inner Loop Header: Depth=1
add	x2, 1
	jz	r0, .LBB94_78
	jmp	.LBB94_76
.LBB94_76:                              // %.preheader14
                                        //   in Loop: Header=BB94_75 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x3, .LBB94_78
	jmp	.LBB94_77
.LBB94_77:                              //   in Loop: Header=BB94_75 Depth=1
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
.LBB94_78:                              //   in Loop: Header=BB94_75 Depth=1
	mov	[x7], x2
	jg	x14, x4, .LBB94_74
	jmp	.LBB94_79
.LBB94_79:                              // %.loopexit15
	mov	r0, [rsp+16]
	jz	r0, .LBB94_89
	jmp	.LBB94_80
.LBB94_80:                              // %.loopexit15
	mov	r0, 1
	jl	x8, r0, .LBB94_89
	jmp	.LBB94_81
.LBB94_81:
	mov	r0, [x11]
	mov	x4, [x7]
	jz	r0, .LBB94_83
	jmp	.LBB94_82
.LBB94_82:                              // %.preheader.preheader
	mov	x3, 1
	mov	x1, x4
	jmp	.LBB94_85
.LBB94_83:
	add	x4, x8
	mov	[x7], x4
	jmp	.LBB94_89
.LBB94_84:                              //   in Loop: Header=BB94_85 Depth=1
	mov	r0, [x11]
add	x12, -1
	mov	x4, x1
.LBB94_85:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	x1, 1
	jz	r0, .LBB94_88
	jmp	.LBB94_86
.LBB94_86:                              // %.preheader
                                        //   in Loop: Header=BB94_85 Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	jge	rax, x2, .LBB94_88
	jmp	.LBB94_87
.LBB94_87:                              //   in Loop: Header=BB94_85 Depth=1
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
.LBB94_88:                              //   in Loop: Header=BB94_85 Depth=1
	mov	[x7], x1
	jg	x12, x3, .LBB94_84
	jmp	.LBB94_89
.LBB94_89:                              // %.loopexit
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
.LBB96_1:                               // =>This Inner Loop Header: Depth=1
	jmp	.LBB96_1
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
	jg	rax, r1, .LBB98_2
	jmp	.LBB98_1
.LBB98_1:
	mov	r0, 0
	sub	r0, rax
	mov	rax, r0
.LBB98_2:
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
	jz	x0, .LBB105_115
	jmp	.LBB105_1
.LBB105_1:
	mov	r0, 0
	jg	x2, r0, .LBB105_3
	jmp	.LBB105_2
.LBB105_2:
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	jmp	.LBB105_115
.LBB105_3:
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
	jl	x2, r0, .LBB105_6
	jmp	.LBB105_4
.LBB105_4:
	mov	r0, x6
	call	malloc
	mov	x1, rax
	jnz	x1, .LBB105_6
	jmp	.LBB105_5
.LBB105_5:
	mov	r0, x4
	mov	r1, x3
	mov	r2, x2
	mov	r3, x0
	call	gcvt_fast
	jmp	.LBB105_115
.LBB105_6:
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
	jl	x8, rax, .LBB105_8
	jmp	.LBB105_7
.LBB105_7:
	mov	x7, x5
.LBB105_8:
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
	jz	x8, .LBB105_10
	jmp	.LBB105_9
.LBB105_9:
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x7, rax
	jmp	.LBB105_11
.LBB105_10:
	mov	x7, [x1]
	mov	r0, 5136718
	je	x7, r0, .LBB105_25
	jmp	.LBB105_11
.LBB105_11:
	mov	r1, 255
	mov	r0, x7
	call	__bit_and
	mov	x9, 0
	mov	x11, mcasm_static_0bad95a651bdc2c03a026766d861797a
	jz	rax, .LBB105_16
	jmp	.LBB105_12
.LBB105_12:                             // %.preheader.i.preheader
	mov	x12, x1
add	x12, 1
	mov	x9, x7
.LBB105_13:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x10, rax
	mov	r0, x9
	call	__bit_and
	mov	r0, x9
	jne	rax, x10, .LBB105_15
	jmp	.LBB105_14
.LBB105_14:                             //   in Loop: Header=BB105_13 Depth=1
	mov	r0, [x12]
	mov	r1, 255
add	x11, 1
	call	__bit_and
	mov	x9, rax
add	x12, 1
	mov	r0, 0
	jnz	x9, .LBB105_13
	jmp	.LBB105_15
.LBB105_15:
	mov	r1, 255
	call	__bit_and
	mov	x9, rax
.LBB105_16:                             // %strcmp.exit
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	je	x9, rax, .LBB105_25
	jmp	.LBB105_17
.LBB105_17:
	jnz	x8, .LBB105_19
	jmp	.LBB105_18
.LBB105_18:
	mov	x7, [x1]
	mov	r0, 7233902
	je	x7, r0, .LBB105_25
	jmp	.LBB105_19
.LBB105_19:
	mov	r1, 255
	mov	r0, x7
	call	__bit_and
	mov	x9, 0
	mov	x11, mcasm_static_ec102b563ba176d293dc88ca08ecc96e
	jz	rax, .LBB105_24
	jmp	.LBB105_20
.LBB105_20:                             // %.preheader.i4.preheader
	mov	x12, x1
add	x12, 1
	mov	x9, x7
.LBB105_21:                             // %.preheader.i4
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x10, rax
	mov	r0, x9
	call	__bit_and
	mov	r0, x9
	jne	rax, x10, .LBB105_23
	jmp	.LBB105_22
.LBB105_22:                             //   in Loop: Header=BB105_21 Depth=1
	mov	r0, [x12]
	mov	r1, 255
add	x11, 1
	call	__bit_and
	mov	x9, rax
add	x12, 1
	mov	r0, 0
	jnz	x9, .LBB105_21
	jmp	.LBB105_23
.LBB105_23:
	mov	r1, 255
	call	__bit_and
	mov	x9, rax
.LBB105_24:                             // %strcmp.exit6
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	jne	x9, rax, .LBB105_43
	jmp	.LBB105_25
.LBB105_25:                             // %strcmp.exit.thread
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
	jl	rax, r0, .LBB105_115
	jmp	.LBB105_26
.LBB105_26:
	mov	r0, 131072
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB105_28
	jmp	.LBB105_27
.LBB105_27:
	mov	[r0], 1296125004
	mov	r0, 131073
	mov	[r0], 131075
	mov	r0, 131074
	mov	[r0], 0
	mov	x3, x1
add	x3, -1
	mov	x4, [x3]
	mov	x5, 0
	mov	x2, 0
	mov	rax, 0
	jmp	.LBB105_33
.LBB105_28:
	mov	r0, 131074
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
	jz	x2, .LBB105_33
	jmp	.LBB105_29
.LBB105_29:
	jge	x2, x3, .LBB105_33
	jmp	.LBB105_30
.LBB105_30:                             // %.preheader.i7.preheader
.LBB105_31:                             // %.preheader.i7
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
	jz	x2, .LBB105_33
	jmp	.LBB105_32
.LBB105_32:                             // %.preheader.i7
                                        //   in Loop: Header=BB105_31 Depth=1
	jl	x2, x3, .LBB105_31
	jmp	.LBB105_33
.LBB105_33:                             // %.loopexit.i
	jne	x2, x3, .LBB105_35
	jmp	.LBB105_34
.LBB105_34:
	call	abort
.LBB105_35:
	mov	r0, 131074
	jz	x5, .LBB105_39
	jmp	.LBB105_36
.LBB105_36:
	mov	r0, [x5]
	mov	r1, r0
	add	r1, x5
	jne	r1, x3, .LBB105_38
	jmp	.LBB105_37
.LBB105_37:
	add	r0, x4
	mov	[x5], r0
	mov	x3, x5
	jmp	.LBB105_40
.LBB105_38:
add	x5, 1
	mov	r0, x5
.LBB105_39:
	mov	[r0], x3
	mov	[x1], x2
.LBB105_40:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB105_115
	jmp	.LBB105_41
.LBB105_41:
	mov	r0, [x3]
	mov	r1, r0
	add	r1, x3
	jne	r1, x2, .LBB105_115
	jmp	.LBB105_42
.LBB105_42:
	add	r0, [x2]
	mov	[x3], r0
add	x2, 1
	mov	r0, [x2]
add	x3, 1
	mov	[x3], r0
	jmp	.LBB105_115
.LBB105_43:
	mov	x11, mcasm_static_99deb3aad5ed05717e1eac3570660880
	mov	x9, x7
	mov	x12, x1
	jnz	x8, .LBB105_49
	jmp	.LBB105_44
.LBB105_44:
	mov	x7, [x1]
	mov	r1, 1768320585
	mov	x9, x7
	mov	x12, x1
	jne	x7, r1, .LBB105_49
	jmp	.LBB105_45
.LBB105_45:                             // %.preheader5.i10.preheader
	mov	x9, -2139062144
	mov	x12, x1
.LBB105_46:                             // %.preheader5.i10
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x9, .LBB105_63
	jmp	.LBB105_47
.LBB105_47:                             //   in Loop: Header=BB105_46 Depth=1
add	x12, 4
add	x11, 4
	mov	r1, [x12]
	mov	r0, [x11]
	je	r1, r0, .LBB105_46
	jmp	.LBB105_48
.LBB105_48:
	mov	x9, r1
.LBB105_49:
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	x10, 0
	jz	rax, .LBB105_54
	jmp	.LBB105_50
.LBB105_50:                             // %.preheader.i8.preheader
add	x12, 1
.LBB105_51:                             // %.preheader.i8
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x10, rax
	mov	r0, x9
	call	__bit_and
	mov	r0, x9
	jne	rax, x10, .LBB105_53
	jmp	.LBB105_52
.LBB105_52:                             //   in Loop: Header=BB105_51 Depth=1
	mov	r0, [x12]
	mov	r1, 255
add	x11, 1
	call	__bit_and
	mov	x9, rax
add	x12, 1
	mov	r0, 0
	jnz	x9, .LBB105_51
	jmp	.LBB105_53
.LBB105_53:
	mov	r1, 255
	call	__bit_and
	mov	x10, rax
.LBB105_54:                             // %strcmp.exit11
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	je	x10, rax, .LBB105_63
	jmp	.LBB105_55
.LBB105_55:
	jnz	x8, .LBB105_57
	jmp	.LBB105_56
.LBB105_56:
	mov	x7, [x1]
	mov	r0, 6712937
	je	x7, r0, .LBB105_63
	jmp	.LBB105_57
.LBB105_57:
	mov	r1, 255
	mov	r0, x7
	call	__bit_and
	mov	x9, 0
	mov	x11, mcasm_static_40f2bddad2b29e06c8c77391a68e96be
	jz	rax, .LBB105_62
	jmp	.LBB105_58
.LBB105_58:                             // %.preheader.i12.preheader
	mov	x12, x1
add	x12, 1
	mov	x9, x7
.LBB105_59:                             // %.preheader.i12
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x10, rax
	mov	r0, x9
	call	__bit_and
	mov	r0, x9
	jne	rax, x10, .LBB105_61
	jmp	.LBB105_60
.LBB105_60:                             //   in Loop: Header=BB105_59 Depth=1
	mov	r0, [x12]
	mov	r1, 255
add	x11, 1
	call	__bit_and
	mov	x9, rax
add	x12, 1
	mov	r0, 0
	jnz	x9, .LBB105_59
	jmp	.LBB105_61
.LBB105_61:
	mov	r1, 255
	call	__bit_and
	mov	x9, rax
.LBB105_62:                             // %strcmp.exit15
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	jne	x9, rax, .LBB105_81
	jmp	.LBB105_63
.LBB105_63:                             // %strcmp.exit11.thread
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
	jl	rax, r0, .LBB105_115
	jmp	.LBB105_64
.LBB105_64:
	mov	r0, 131072
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB105_66
	jmp	.LBB105_65
.LBB105_65:
	mov	[r0], 1296125004
	mov	r0, 131073
	mov	[r0], 131075
	mov	r0, 131074
	mov	[r0], 0
	mov	x3, x1
add	x3, -1
	mov	x4, [x3]
	mov	x5, 0
	mov	x2, 0
	mov	rax, 0
	jmp	.LBB105_71
.LBB105_66:
	mov	r0, 131074
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
	jz	x2, .LBB105_71
	jmp	.LBB105_67
.LBB105_67:
	jge	x2, x3, .LBB105_71
	jmp	.LBB105_68
.LBB105_68:                             // %.preheader.i19.preheader
.LBB105_69:                             // %.preheader.i19
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
	jz	x2, .LBB105_71
	jmp	.LBB105_70
.LBB105_70:                             // %.preheader.i19
                                        //   in Loop: Header=BB105_69 Depth=1
	jl	x2, x3, .LBB105_69
	jmp	.LBB105_71
.LBB105_71:                             // %.loopexit.i18
	jne	x2, x3, .LBB105_73
	jmp	.LBB105_72
.LBB105_72:
	call	abort
.LBB105_73:
	mov	r0, 131074
	jz	x5, .LBB105_77
	jmp	.LBB105_74
.LBB105_74:
	mov	r0, [x5]
	mov	r1, r0
	add	r1, x5
	jne	r1, x3, .LBB105_76
	jmp	.LBB105_75
.LBB105_75:
	add	r0, x4
	mov	[x5], r0
	mov	x3, x5
	jmp	.LBB105_78
.LBB105_76:
add	x5, 1
	mov	r0, x5
.LBB105_77:
	mov	[r0], x3
	mov	[x1], x2
.LBB105_78:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB105_115
	jmp	.LBB105_79
.LBB105_79:
	mov	r0, [x3]
	mov	r1, r0
	add	r1, x3
	jne	r1, x2, .LBB105_115
	jmp	.LBB105_80
.LBB105_80:
	add	r0, [x2]
	mov	[x3], r0
add	x2, 1
	mov	r0, [x2]
add	x3, 1
	mov	[x3], r0
	jmp	.LBB105_115
.LBB105_81:
	mov	x11, mcasm_static_b86553a1da086346353b901a180db000
	mov	x9, x7
	mov	x12, x1
	jnz	x8, .LBB105_87
	jmp	.LBB105_82
.LBB105_82:
	mov	x7, [x1]
	mov	r1, 1718503725
	mov	x9, x7
	mov	x12, x1
	jne	x7, r1, .LBB105_87
	jmp	.LBB105_83
.LBB105_83:                             // %.preheader5.i23.preheader
	mov	x9, -2139062144
	mov	x12, x1
.LBB105_84:                             // %.preheader5.i23
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x9, .LBB105_105
	jmp	.LBB105_85
.LBB105_85:                             //   in Loop: Header=BB105_84 Depth=1
add	x12, 4
add	x11, 4
	mov	r1, [x12]
	mov	r0, [x11]
	je	r1, r0, .LBB105_84
	jmp	.LBB105_86
.LBB105_86:
	mov	x9, r1
.LBB105_87:
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	x10, 0
	jz	rax, .LBB105_92
	jmp	.LBB105_88
.LBB105_88:                             // %.preheader.i21.preheader
add	x12, 1
.LBB105_89:                             // %.preheader.i21
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x10, rax
	mov	r0, x9
	call	__bit_and
	mov	r0, x9
	jne	rax, x10, .LBB105_91
	jmp	.LBB105_90
.LBB105_90:                             //   in Loop: Header=BB105_89 Depth=1
	mov	r0, [x12]
	mov	r1, 255
add	x11, 1
	call	__bit_and
	mov	x9, rax
add	x12, 1
	mov	r0, 0
	jnz	x9, .LBB105_89
	jmp	.LBB105_91
.LBB105_91:
	mov	r1, 255
	call	__bit_and
	mov	x10, rax
.LBB105_92:                             // %strcmp.exit24
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	je	x10, rax, .LBB105_105
	jmp	.LBB105_93
.LBB105_93:
	mov	x9, mcasm_static_c6baa867edf1c8a44886c01357c4c77a
	mov	x10, x1
	jnz	x8, .LBB105_99
	jmp	.LBB105_94
.LBB105_94:
	mov	x7, [x1]
	mov	r1, 1718511917
	mov	x10, x1
	jne	x7, r1, .LBB105_99
	jmp	.LBB105_95
.LBB105_95:                             // %.preheader5.i27.preheader
	mov	x7, -2139062144
	mov	x10, x1
.LBB105_96:                             // %.preheader5.i27
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x7, .LBB105_105
	jmp	.LBB105_97
.LBB105_97:                             //   in Loop: Header=BB105_96 Depth=1
add	x10, 4
add	x9, 4
	mov	r1, [x10]
	mov	r0, [x9]
	je	r1, r0, .LBB105_96
	jmp	.LBB105_98
.LBB105_98:
	mov	x7, r1
.LBB105_99:
	mov	r1, 255
	mov	r0, x7
	call	__bit_and
	mov	x8, 0
	jz	rax, .LBB105_104
	jmp	.LBB105_100
.LBB105_100:                            // %.preheader.i25.preheader
add	x10, 1
.LBB105_101:                            // %.preheader.i25
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x8, rax
	mov	r0, x7
	call	__bit_and
	mov	r0, x7
	jne	rax, x8, .LBB105_103
	jmp	.LBB105_102
.LBB105_102:                            //   in Loop: Header=BB105_101 Depth=1
	mov	r0, [x10]
	mov	r1, 255
add	x9, 1
	call	__bit_and
	mov	x7, rax
add	x10, 1
	mov	r0, 0
	jnz	x7, .LBB105_101
	jmp	.LBB105_103
.LBB105_103:
	mov	r1, 255
	call	__bit_and
	mov	x8, rax
.LBB105_104:                            // %strcmp.exit28
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	jne	x8, rax, .LBB105_107
	jmp	.LBB105_105
.LBB105_105:                            // %strcmp.exit24.thread
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
	jl	rax, r0, .LBB105_115
	jmp	.LBB105_106
.LBB105_106:
	mov	r0, x1
	call	free
	jmp	.LBB105_115
.LBB105_107:
	mov	r1, rsp
	mov	r0, x1
	call	parse_exp10
	jnz	rax, .LBB105_113
	jmp	.LBB105_108
.LBB105_108:
	mov	r0, [rsp]
	mov	r1, -4
	jl	r0, r1, .LBB105_113
	jmp	.LBB105_109
.LBB105_109:
	jge	r0, x2, .LBB105_113
	jmp	.LBB105_110
.LBB105_110:
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
	jl	x4, rax, .LBB105_112
	jmp	.LBB105_111
.LBB105_111:
	mov	x3, x5
.LBB105_112:
	add	x3, x1
	mov	r0, [x3]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x3], rax
.LBB105_113:
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
	jl	rax, r0, .LBB105_115
	jmp	.LBB105_114
.LBB105_114:
	mov	r0, x1
	call	free
.LBB105_115:                            // %free.exit
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
	jz	x2, .LBB106_2
	jmp	.LBB106_1
.LBB106_1:                              // %.preheader12.preheader
	mov	x3, x1
add	x3, 1
	mov	x5, 101
	mov	x4, x1
	jmp	.LBB106_4
.LBB106_2:                              // %.loopexit9.i
	mov	x3, [x4]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	x5, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x5, .LBB106_9
	jmp	.LBB106_3
.LBB106_3:                              // %.preheader5.i.preheader
	jmp	.LBB106_7
.LBB106_4:                              // %.preheader12
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB106_12
	jmp	.LBB106_5
.LBB106_5:                              // %.preheader12
                                        //   in Loop: Header=BB106_4 Depth=1
	je	rax, x5, .LBB106_27
	jmp	.LBB106_6
.LBB106_6:                              //   in Loop: Header=BB106_4 Depth=1
	mov	r1, 3
add	x4, 1
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
	jne	rax, x5, .LBB106_9
	jmp	.LBB106_8
.LBB106_8:                              //   in Loop: Header=BB106_7 Depth=1
add	x4, 4
	mov	x3, [x4]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x5, .LBB106_7
	jmp	.LBB106_9
.LBB106_9:                              // %.loopexit6.i.preheader
add	x4, -1
	mov	x3, 101
.LBB106_10:                             // %.loopexit6.i
                                        // =>This Inner Loop Header: Depth=1
add	x4, 1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	je	rax, x3, .LBB106_26
	jmp	.LBB106_11
.LBB106_11:                             // %.loopexit6.i
                                        //   in Loop: Header=BB106_10 Depth=1
	jnz	rax, .LBB106_10
	jmp	.LBB106_12
.LBB106_12:                             // %.loopexit
	jz	x2, .LBB106_14
	jmp	.LBB106_13
.LBB106_13:                             // %.preheader7.preheader
	mov	x2, x1
add	x2, 1
	mov	x3, 69
	jmp	.LBB106_16
.LBB106_14:                             // %.loopexit9.i2
	mov	x2, [x1]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	x3, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x3, .LBB106_21
	jmp	.LBB106_15
.LBB106_15:                             // %.preheader5.i4.preheader
	jmp	.LBB106_19
.LBB106_16:                             // %.preheader7
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB106_37
	jmp	.LBB106_17
.LBB106_17:                             // %.preheader7
                                        //   in Loop: Header=BB106_16 Depth=1
	je	rax, x3, .LBB106_25
	jmp	.LBB106_18
.LBB106_18:                             //   in Loop: Header=BB106_16 Depth=1
	mov	r1, 3
add	x1, 1
	mov	r0, x2
	call	__bit_and
add	x2, 1
	jz	rax, .LBB106_14
	jmp	.LBB106_16
.LBB106_19:                             // %.preheader5.i4
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
	jne	rax, x3, .LBB106_21
	jmp	.LBB106_20
.LBB106_20:                             //   in Loop: Header=BB106_19 Depth=1
add	x1, 4
	mov	x2, [x1]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x3, .LBB106_19
	jmp	.LBB106_21
.LBB106_21:                             // %.loopexit6.i3.preheader
add	x1, -1
	mov	x2, 69
.LBB106_22:                             // %.loopexit6.i3
                                        // =>This Inner Loop Header: Depth=1
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB106_36
	jmp	.LBB106_23
.LBB106_23:                             // %.loopexit6.i3
                                        //   in Loop: Header=BB106_22 Depth=1
	jne	rax, x2, .LBB106_22
	jmp	.LBB106_24
.LBB106_24:                             // %strchr.exit.loopexit
	jmp	.LBB106_28
.LBB106_25:                             // %strchr.exit.loopexit2
	jmp	.LBB106_28
.LBB106_26:                             // %strchr.exit.loopexit3
	mov	x1, x4
	jmp	.LBB106_28
.LBB106_27:                             // %strchr.exit.loopexit5
	mov	x1, x4
.LBB106_28:                             // %strchr.exit
	mov	x3, x1
add	x3, 1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, 45
	je	rax, r0, .LBB106_31
	jmp	.LBB106_29
.LBB106_29:                             // %strchr.exit
	mov	r0, 43
	mov	x4, 1
	jne	rax, r0, .LBB106_32
	jmp	.LBB106_30
.LBB106_30:
add	x1, 2
	mov	x3, x1
	jmp	.LBB106_32
.LBB106_31:
add	x1, 2
	mov	x4, -1
	mov	x3, x1
.LBB106_32:
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
	jl	rax, r0, .LBB106_38
	jmp	.LBB106_33
.LBB106_33:                             // %.preheader.preheader
add	x3, 1
	mov	x2, 0
	mov	x5, -2147483638
.LBB106_34:                             // %.preheader
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
	jl	rax, x5, .LBB106_34
	jmp	.LBB106_35
.LBB106_35:
	mul	x2, x4
	mov	[x0], x2
	mov	x2, 0
	jmp	.LBB106_38
.LBB106_36:                             // %strchr.exit5.thread.loopexit
	mov	x2, -1
	jmp	.LBB106_38
.LBB106_37:                             // %strchr.exit5.thread.loopexit1
	mov	x2, -1
.LBB106_38:                             // %strchr.exit5.thread
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
	jz	x2, .LBB107_2
	jmp	.LBB107_1
.LBB107_1:                              // %.preheader31.preheader
	mov	x3, x1
add	x3, 1
	mov	x4, 101
	mov	x0, x1
	jmp	.LBB107_4
.LBB107_2:                              // %.loopexit9.i
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	x4, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB107_9
	jmp	.LBB107_3
.LBB107_3:                              // %.preheader5.i.preheader
	jmp	.LBB107_7
.LBB107_4:                              // %.preheader31
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB107_12
	jmp	.LBB107_5
.LBB107_5:                              // %.preheader31
                                        //   in Loop: Header=BB107_4 Depth=1
	je	rax, x4, .LBB107_37
	jmp	.LBB107_6
.LBB107_6:                              //   in Loop: Header=BB107_4 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
	jz	rax, .LBB107_2
	jmp	.LBB107_4
.LBB107_7:                              // %.preheader5.i
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
	jne	rax, x4, .LBB107_9
	jmp	.LBB107_8
.LBB107_8:                              //   in Loop: Header=BB107_7 Depth=1
add	x0, 4
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x4, .LBB107_7
	jmp	.LBB107_9
.LBB107_9:                              // %.loopexit6.i.preheader
add	x0, -1
	mov	x3, 101
.LBB107_10:                             // %.loopexit6.i
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	je	rax, x3, .LBB107_36
	jmp	.LBB107_11
.LBB107_11:                             // %.loopexit6.i
                                        //   in Loop: Header=BB107_10 Depth=1
	jnz	rax, .LBB107_10
	jmp	.LBB107_12
.LBB107_12:                             // %.loopexit29
	mov	x0, x1
	jz	x2, .LBB107_14
	jmp	.LBB107_13
.LBB107_13:                             // %.preheader25.preheader
	mov	x3, x1
add	x3, 1
	mov	x4, 69
	mov	x0, x1
	jmp	.LBB107_16
.LBB107_14:                             // %.loopexit9.i5
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	x4, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB107_21
	jmp	.LBB107_15
.LBB107_15:                             // %.preheader5.i7.preheader
	jmp	.LBB107_19
.LBB107_16:                             // %.preheader25
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB107_24
	jmp	.LBB107_17
.LBB107_17:                             // %.preheader25
                                        //   in Loop: Header=BB107_16 Depth=1
	je	rax, x4, .LBB107_35
	jmp	.LBB107_18
.LBB107_18:                             //   in Loop: Header=BB107_16 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
	jz	rax, .LBB107_14
	jmp	.LBB107_16
.LBB107_19:                             // %.preheader5.i7
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
	jne	rax, x4, .LBB107_21
	jmp	.LBB107_20
.LBB107_20:                             //   in Loop: Header=BB107_19 Depth=1
add	x0, 4
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x4, .LBB107_19
	jmp	.LBB107_21
.LBB107_21:                             // %.loopexit6.i6.preheader
add	x0, -1
	mov	x3, 69
.LBB107_22:                             // %.loopexit6.i6
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	je	rax, x3, .LBB107_34
	jmp	.LBB107_23
.LBB107_23:                             // %.loopexit6.i6
                                        //   in Loop: Header=BB107_22 Depth=1
	jnz	rax, .LBB107_22
	jmp	.LBB107_24
.LBB107_24:                             // %.loopexit
	mov	x3, x1
	jz	x2, .LBB107_29
	jmp	.LBB107_25
.LBB107_25:
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x0, x1
	jz	rax, .LBB107_33
	jmp	.LBB107_26
.LBB107_26:                             // %.preheader1.i.preheader
	mov	x3, x1
add	x3, 1
	mov	x0, x1
	jmp	.LBB107_28
.LBB107_27:                             //   in Loop: Header=BB107_28 Depth=1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
add	x3, 1
	jz	rax, .LBB107_33
	jmp	.LBB107_28
.LBB107_28:                             // %.preheader1.i
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r1, 3
	mov	r0, x0
	call	__bit_and
	jnz	rax, .LBB107_27
	jmp	.LBB107_29
.LBB107_29:                             // %.loopexit.i.preheader
	mov	x4, x3
add	x4, -1
	mov	x5, -2139062144
.LBB107_30:                             // %.loopexit.i
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
	je	rax, x5, .LBB107_30
	jmp	.LBB107_31
.LBB107_31:                             // %.preheader.i.preheader
	mov	x4, -4
.LBB107_32:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
	add	r0, x4
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x0, 1
add	x4, 1
	jnz	rax, .LBB107_32
	jmp	.LBB107_33
.LBB107_33:                             // %strlen.exit
	jmp	.LBB107_38
.LBB107_34:                             // %strchr.exit.loopexit
	jmp	.LBB107_38
.LBB107_35:                             // %strchr.exit.loopexit4
	jmp	.LBB107_38
.LBB107_36:                             // %strchr.exit.loopexit5
	jmp	.LBB107_38
.LBB107_37:                             // %strchr.exit.loopexit7
.LBB107_38:                             // %strchr.exit
	jz	x2, .LBB107_40
	jmp	.LBB107_39
.LBB107_39:                             // %.preheader.preheader
	mov	x2, x1
add	x2, 1
	mov	x3, 46
	jmp	.LBB107_42
.LBB107_40:                             // %.loopexit9.i9
	mov	x2, [x1]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	x3, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x3, .LBB107_47
	jmp	.LBB107_41
.LBB107_41:                             // %.preheader5.i12.preheader
	jmp	.LBB107_45
.LBB107_42:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB107_87
	jmp	.LBB107_43
.LBB107_43:                             // %.preheader
                                        //   in Loop: Header=BB107_42 Depth=1
	je	rax, x3, .LBB107_51
	jmp	.LBB107_44
.LBB107_44:                             //   in Loop: Header=BB107_42 Depth=1
	mov	r1, 3
add	x1, 1
	mov	r0, x2
	call	__bit_and
add	x2, 1
	jz	rax, .LBB107_40
	jmp	.LBB107_42
.LBB107_45:                             // %.preheader5.i12
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
	jne	rax, x3, .LBB107_47
	jmp	.LBB107_46
.LBB107_46:                             //   in Loop: Header=BB107_45 Depth=1
add	x1, 4
	mov	x2, [x1]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x3, .LBB107_45
	jmp	.LBB107_47
.LBB107_47:                             // %.loopexit6.i10.preheader
add	x1, -1
	mov	x2, 46
.LBB107_48:                             // %.loopexit6.i10
                                        // =>This Inner Loop Header: Depth=1
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	je	rax, x2, .LBB107_50
	jmp	.LBB107_49
.LBB107_49:                             // %.loopexit6.i10
                                        //   in Loop: Header=BB107_48 Depth=1
	jnz	rax, .LBB107_48
	jmp	.LBB107_50
.LBB107_50:
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
	jmp	.LBB107_52
.LBB107_51:                             // %strchr.exit13.loopexit
.LBB107_52:                             // %strchr.exit13
	jz	x1, .LBB107_87
	jmp	.LBB107_53
.LBB107_53:                             // %strchr.exit13
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	jge	rax, x2, .LBB107_87
	jmp	.LBB107_54
.LBB107_54:
add	x1, 1
	mov	r0, 1
	mov	r2, 0
	mov	r3, -3
	mov	x4, 48
	mov	x3, x0
.LBB107_55:                             // =>This Inner Loop Header: Depth=1
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
	jle	rax, x3, .LBB107_57
	jmp	.LBB107_56
.LBB107_56:                             //   in Loop: Header=BB107_55 Depth=1
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
	je	rax, x4, .LBB107_55
	jmp	.LBB107_57
.LBB107_57:
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
	jz	rax, .LBB107_62
	jmp	.LBB107_58
.LBB107_58:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x4, x0
	jz	rax, .LBB107_66
	jmp	.LBB107_59
.LBB107_59:                             // %.preheader1.i14.preheader
	mov	x1, x0
add	x1, 1
	mov	x4, x0
	jmp	.LBB107_61
.LBB107_60:                             //   in Loop: Header=BB107_61 Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB107_66
	jmp	.LBB107_61
.LBB107_61:                             // %.preheader1.i14
                                        // =>This Inner Loop Header: Depth=1
add	x4, 1
	mov	r1, 3
	mov	r0, x4
	call	__bit_and
	jnz	rax, .LBB107_60
	jmp	.LBB107_62
.LBB107_62:                             // %.loopexit.i15.preheader
	mov	x5, x1
add	x5, -1
	mov	x6, -2139062144
.LBB107_63:                             // %.loopexit.i15
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
	je	rax, x6, .LBB107_63
	jmp	.LBB107_64
.LBB107_64:                             // %.preheader.i16.preheader
	mov	x5, -4
.LBB107_65:                             // %.preheader.i16
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x1
	add	r0, x5
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x4, 1
add	x5, 1
	jnz	rax, .LBB107_65
	jmp	.LBB107_66
.LBB107_66:                             // %strlen.exit17
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
	jge	rax, x5, .LBB107_76
	jmp	.LBB107_67
.LBB107_67:
	mov	x5, x0
	add	x5, x1
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x6, .LBB107_76
	jmp	.LBB107_68
.LBB107_68:
	mov	r1, -2147483648
	add	x2, x1
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB107_73
	jmp	.LBB107_69
.LBB107_69:
	mov	r0, x5
	mov	r1, x2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB107_74
	jmp	.LBB107_70
.LBB107_70:                             // %.preheader.i19.preheader
	mov	x2, 0
	sub	x2, x0
	mov	x5, x0
	add	x5, x4
	add	x7, x3
	add	x8, x3
	mov	x3, -2147483645
.LBB107_71:                             // %.preheader.i19
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
	jg	rax, x3, .LBB107_71
	jmp	.LBB107_72
.LBB107_72:                             // %.loopexit9.i20.loopexit
	add	x0, x1
	add	x7, x4
	mov	x2, x7
	mov	x5, x0
.LBB107_73:                             // %.loopexit9.i20
	jz	x1, .LBB107_87
	jmp	.LBB107_74
.LBB107_74:                             // %.preheader227
add	x5, -1
add	x2, -1
.LBB107_75:                             // =>This Inner Loop Header: Depth=1
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
	jz	x1, .LBB107_87
	jmp	.LBB107_75
.LBB107_76:
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB107_84
	jmp	.LBB107_77
.LBB107_77:
	mov	r0, x2
	mov	r1, x0
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB107_85
	jmp	.LBB107_78
.LBB107_78:
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB107_80
	jmp	.LBB107_79
.LBB107_79:                             // %.preheader12.i.preheader
	add	x3, x9
	mov	x2, -2147483633
	mov	r0, x0
	jmp	.LBB107_82
.LBB107_80:                             // %.preheader237
	mov	x3, -2147483645
	jmp	.LBB107_83
.LBB107_81:
	add	x3, x0
	mov	r0, 3
	mov	x2, x3
	jg	x1, r0, .LBB107_80
	jmp	.LBB107_84
.LBB107_82:                             // %.preheader12.i
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
	jg	rax, x2, .LBB107_82
	jmp	.LBB107_81
.LBB107_83:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
add	x0, 4
	mov	[x2], r0
add	x1, -4
	mov	r1, -2147483648
add	x2, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x3, .LBB107_83
	jmp	.LBB107_84
.LBB107_84:                             // %.loopexit11.i
	jz	x1, .LBB107_87
	jmp	.LBB107_85
.LBB107_85:                             // %.preheader232
	mov	x5, x2
.LBB107_86:                             // =>This Inner Loop Header: Depth=1
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
	jnz	x1, .LBB107_86
	jmp	.LBB107_87
.LBB107_87:                             // %memmove.exit
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
	mov	x5, r1
	mov	x6, r0
	jz	x0, .LBB108_102
	jmp	.LBB108_1
.LBB108_1:
	mov	r0, 0
	jg	x3, r0, .LBB108_3
	jmp	.LBB108_2
.LBB108_2:
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	jmp	.LBB108_102
.LBB108_3:
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
	mov	r0, x6
	mov	r1, x5
	mov	r2, x6
	mov	r3, x5
	call	__unorddf2
	jz	rax, .LBB108_5
	jmp	.LBB108_4
.LBB108_4:
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
	jmp	.LBB108_102
.LBB108_5:
	mov	r1, 2147483647
	mov	r0, x5
	call	__bit_and
	mov	r2, -1
	mov	r3, 2146435071
	mov	x2, -1
	mov	r0, x6
	mov	r1, rax
	call	__gtdf2
	jl	rax, x1, .LBB108_9
	jmp	.LBB108_6
.LBB108_6:
	mov	r2, 0
	mov	r3, 0
	mov	r0, x6
	mov	r1, x5
	call	__ltdf2
	mov	x1, x0
	jg	rax, x2, .LBB108_8
	jmp	.LBB108_7
.LBB108_7:
	mov	r0, [x0]
	mov	x1, x0
	mov	r1, -256
add	x1, 1
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
.LBB108_8:
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
	jmp	.LBB108_102
.LBB108_9:
	mov	r2, 0
	mov	r3, 0
	mov	r0, x6
	mov	r1, x5
	call	__ltdf2
	mov	x1, x0
	jg	rax, x2, .LBB108_11
	jmp	.LBB108_10
.LBB108_10:
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
	mov	r0, x5
	call	__bit_xor
	mov	x5, rax
.LBB108_11:
	mov	r2, 0
	mov	r3, 0
	mov	x2, 0
	mov	r0, x6
	mov	r1, x5
	call	__nedf2
	jnz	rax, .LBB108_13
	jmp	.LBB108_12
.LBB108_12:
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
	jmp	.LBB108_102
.LBB108_13:
	mov	r2, 0
	mov	r3, 0
add	x4, 63
	mov	r0, x6
	mov	r1, x5
	call	__ltdf2
	jl	rax, x2, .LBB108_43
	jmp	.LBB108_14
.LBB108_14:
	mov	r2, -4194304
	mov	r3, 1105199103
	mov	r0, x6
	mov	r1, x5
	call	__gtdf2
	mov	r0, 0
	jg	rax, r0, .LBB108_43
	jmp	.LBB108_15
.LBB108_15:
	mov	r0, x6
	mov	r1, x5
	call	__fixdfsi
	mov	x2, rax
	mov	r0, x2
	call	__floatsidf
	mov	r3, t0
	mov	r0, x6
	mov	r1, x5
	mov	r2, rax
	call	__nedf2
	jnz	rax, .LBB108_28
	jmp	.LBB108_16
.LBB108_16:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483638
	jl	rax, r0, .LBB108_22
	jmp	.LBB108_17
.LBB108_17:                             // %.preheader38.preheader
	mov	x9, 0
	mov	x10, -2147483549
	mov	x7, x2
.LBB108_18:                             // %.preheader38
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 10
	mov	r0, x7
	call	__udivsi3
	mov	x8, rax
	mov	r1, -2147483648
add	x9, 1
	mov	r0, x7
	call	__bit_xor
	mov	x7, x8
	jg	rax, x10, .LBB108_18
	jmp	.LBB108_19
.LBB108_19:
	jge	x9, x4, .LBB108_43
	jmp	.LBB108_20
.LBB108_20:
.LBB108_21:                             // %.preheader183
	mov	x6, 0
	mov	x7, -2147483639
	jmp	.LBB108_24
.LBB108_22:
	jnz	x2, .LBB108_21
	jmp	.LBB108_23
.LBB108_23:
	mov	r0, [x1]
	mov	x4, x1
	mov	r1, -256
add	x4, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	jmp	.LBB108_27
.LBB108_24:                             // =>This Inner Loop Header: Depth=1
	mov	r1, 10
	mov	x4, x6
	mov	r0, x2
	call	__udivsi3
	mov	x3, rax
	mov	r0, x3
	mul	r0, 246
	add	r0, x2
	mov	r1, 48
	call	__bit_or
	mov	x8, rsp
	add	x8, x4
	mov	x4, [x8]
	mov	r1, 255
add	x6, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x5, rax
	mov	r0, x4
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
	mov	r1, -2147483648
	mov	[x8], rax
	mov	r0, x2
	call	__bit_xor
	mov	x2, x3
	jg	rax, x7, .LBB108_24
	jmp	.LBB108_25
.LBB108_25:                             // %.preheader36.preheader
add	x6, -1
	mov	x5, 1
	mov	x4, x1
	mov	x7, x6
.LBB108_26:                             // %.preheader36
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, rsp
	add	r0, x6
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x1]
	mov	x2, rax
	mov	r1, -256
add	x4, 1
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
add	x7, -1
	mov	r0, x6
add	r0, 1
	mov	[x1], rax
	mov	x6, x7
	mov	x1, x4
	jg	r0, x5, .LBB108_26
	jmp	.LBB108_27
.LBB108_27:                             // %.loopexit37
	mov	r0, [x4]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x4], rax
	jmp	.LBB108_102
.LBB108_28:
	mov	r0, 1
	je	x3, r0, .LBB108_43
	jmp	.LBB108_29
.LBB108_29:
	mov	r2, -8388608
	mov	r3, 1104150527
	mov	r0, x6
	mov	r1, x5
	call	__ledf2
	mov	r0, 0
	jg	rax, r0, .LBB108_43
	jmp	.LBB108_30
.LBB108_30:
	mov	r0, x6
	mov	r1, x5
	mov	r2, x6
	mov	r3, x5
	call	__adddf3
	mov	x2, rax
	mov	x8, t0
	mov	r0, x2
	mov	r1, x8
	call	__fixdfsi
	mov	x7, rax
	mov	r0, x7
	call	__floatsidf
	mov	r3, t0
	mov	r0, x2
	mov	r1, x8
	mov	r2, rax
	call	__nedf2
	mov	r1, 1
	mov	x2, rax
	mov	r0, x7
	call	__bit_and
	jnz	x2, .LBB108_43
	jmp	.LBB108_31
.LBB108_31:
	jz	rax, .LBB108_43
	jmp	.LBB108_32
.LBB108_32:
	mov	x2, x7
	div	x2, 2
	mov	r1, -2147483648
	mov	x10, 1
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483638
	jl	rax, r0, .LBB108_35
	jmp	.LBB108_33
.LBB108_33:                             // %.preheader42.preheader
	mov	x11, -2147483549
	mov	x8, x2
.LBB108_34:                             // %.preheader42
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 10
	mov	r0, x8
	call	__udivsi3
	mov	x9, rax
	mov	r1, -2147483648
add	x10, 1
	mov	r0, x8
	call	__bit_xor
	mov	x8, x9
	jg	rax, x11, .LBB108_34
	jmp	.LBB108_35
.LBB108_35:                             // %.loopexit43
	jge	x10, x4, .LBB108_43
	jmp	.LBB108_36
.LBB108_36:
add	x7, 1
	mov	r1, -2147483648
	mov	r0, x7
	call	__bit_xor
	mov	r0, -2147483645
	jl	rax, r0, .LBB108_38
	jmp	.LBB108_37
.LBB108_37:                             // %.preheader41.preheader
	mov	x6, 0
	mov	x7, -2147483639
	jmp	.LBB108_39
.LBB108_38:
	mov	r0, [x1]
	mov	x4, x1
	mov	r1, -256
add	x4, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	jmp	.LBB108_42
.LBB108_39:                             // %.preheader41
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 10
	mov	x4, x6
	mov	r0, x2
	call	__udivsi3
	mov	x3, rax
	mov	r0, x3
	mul	r0, 246
	add	r0, x2
	mov	r1, 48
	call	__bit_or
	mov	x8, rsp
	add	x8, x4
	mov	x4, [x8]
	mov	r1, 255
add	x6, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, -256
	mov	x5, rax
	mov	r0, x4
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
	mov	r1, -2147483648
	mov	[x8], rax
	mov	r0, x2
	call	__bit_xor
	mov	x2, x3
	jg	rax, x7, .LBB108_39
	jmp	.LBB108_40
.LBB108_40:                             // %.preheader39.preheader
add	x6, -1
	mov	x5, 1
	mov	x4, x1
	mov	x7, x6
.LBB108_41:                             // %.preheader39
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, rsp
	add	r0, x6
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x1]
	mov	x2, rax
	mov	r1, -256
add	x4, 1
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
add	x7, -1
	mov	r0, x6
add	r0, 1
	mov	[x1], rax
	mov	x6, x7
	mov	x1, x4
	jg	r0, x5, .LBB108_41
	jmp	.LBB108_42
.LBB108_42:                             // %.loopexit40
	mov	r0, [x4]
	mov	x1, x4
	mov	r1, -256
add	x1, 1
	call	__bit_and
	mov	r1, 46
	mov	r0, rax
	call	__bit_or
	mov	[x4], rax
	mov	r0, [x1]
	mov	r1, -256
add	x4, 2
	call	__bit_and
	mov	r1, 53
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	r0, [x4]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x4], rax
	jmp	.LBB108_102
.LBB108_43:
	mov	r2, 0
	mov	r3, 1076101120
	mov	x2, 0
	mov	r0, x6
	mov	r1, x5
	call	__gedf2
	jl	rax, x2, .LBB108_45
	jmp	.LBB108_44
.LBB108_44:                             // %.preheader34.preheader
	mov	x7, 0
	jmp	.LBB108_47
.LBB108_45:                             // %.loopexit35
	mov	r2, 0
	mov	r3, 1072693248
	mov	x10, 0
	mov	r0, x6
	mov	r1, x5
	call	__ltdf2
	mov	r0, -1
	jg	rax, r0, .LBB108_48
	jmp	.LBB108_46
.LBB108_46:                             // %.preheader32.preheader
	mov	x7, 0
	jmp	.LBB108_49
.LBB108_47:                             // %.preheader34
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, -1717986918
	mov	r3, 1069128089
	mov	r0, x6
	mov	r1, x5
	call	__muldf3
	mov	x6, rax
	mov	x5, t0
	mov	r2, 0
	mov	r3, 1076101120
add	x2, 1
	mov	r0, x6
	mov	r1, x5
	call	__ltdf2
	jl	rax, x7, .LBB108_45
	jmp	.LBB108_47
.LBB108_48:                             // %.loopexit33
	mov	x11, x4
add	x11, 1
	jmp	.LBB108_50
.LBB108_49:                             // %.preheader32
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, 0
	mov	r3, 1076101120
	mov	r0, x6
	mov	r1, x5
	call	__muldf3
	mov	x6, rax
	mov	x5, t0
	mov	r2, 0
	mov	r3, 1072693248
add	x2, -1
	mov	r0, x6
	mov	r1, x5
	call	__ltdf2
	jl	rax, x7, .LBB108_49
	jmp	.LBB108_48
.LBB108_50:                             // =>This Inner Loop Header: Depth=1
	mov	r0, x6
	mov	r1, x5
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
	mov	r0, x6
	mov	r1, x5
	mov	r2, rax
	call	__subdf3
	mov	r2, 0
	mov	r3, 1076101120
	mov	r1, t0
	mov	r0, rax
	call	__muldf3
add	x10, 1
	mov	x6, rax
	mov	x5, t0
	jne	x11, x10, .LBB108_50
	jmp	.LBB108_51
.LBB108_51:
	mov	x7, rsp
	add	x7, x4
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	r1, 24
	mov	r0, rax
	call	__bit_shl
	mov	r1, 24
	mov	r0, rax
	call	__bit_sar
	mov	x8, 53
	jg	rax, x8, .LBB108_55
	jmp	.LBB108_52
.LBB108_52:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jne	rax, x8, .LBB108_62
	jmp	.LBB108_53
.LBB108_53:
	mov	r2, -400107883
	mov	r3, 1041313291
	mov	r0, x6
	mov	r1, x5
	call	__gtdf2
	mov	r0, 0
	jg	rax, r0, .LBB108_55
	jmp	.LBB108_54
.LBB108_54:
add	x7, -1
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB108_62
	jmp	.LBB108_55
.LBB108_55:                             // %.preheader172
	mov	x5, x4
add	x5, -1
	mov	x6, 57
	mov	x7, 1
.LBB108_56:                             // =>This Inner Loop Header: Depth=1
	mov	r0, rsp
	add	r0, x5
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jne	rax, x6, .LBB108_59
	jmp	.LBB108_57
.LBB108_57:                             //   in Loop: Header=BB108_56 Depth=1
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
	jg	r0, x7, .LBB108_56
	jmp	.LBB108_58
.LBB108_58:                             // %.preheader31.preheader
	mov	x7, 1
	mov	x8, x4
	jmp	.LBB108_60
.LBB108_59:
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
	jmp	.LBB108_62
.LBB108_60:                             // %.preheader31
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
	jg	x9, x7, .LBB108_60
	jmp	.LBB108_61
.LBB108_61:
	mov	r0, [rsp]
	mov	r1, -256
	call	__bit_and
	mov	r1, 49
	mov	r0, rax
	call	__bit_or
	mov	[rsp], rax
add	x2, 1
.LBB108_62:
	mov	r0, 1
	mov	x5, x4
	je	x3, r0, .LBB108_68
	jmp	.LBB108_63
.LBB108_63:                             // %.preheader29.preheader
	mov	x6, x4
add	x6, -1
	mov	x3, 48
	mov	x7, 2
	mov	x5, 1
.LBB108_64:                             // %.preheader29
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, rsp
	add	r0, x6
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jne	rax, x3, .LBB108_66
	jmp	.LBB108_65
.LBB108_65:                             //   in Loop: Header=BB108_64 Depth=1
	mov	r0, x6
add	x6, -1
add	r0, 1
	jg	r0, x7, .LBB108_64
	jmp	.LBB108_68
.LBB108_66:
	mov	x5, x6
	mov	r0, -4
add	x5, 1
	jl	x2, r0, .LBB108_71
	jmp	.LBB108_67
.LBB108_67:
	jge	x2, x4, .LBB108_71
	jmp	.LBB108_85
.LBB108_68:                             // %.loopexit30
	mov	r0, -4
	jl	x2, r0, .LBB108_70
	jmp	.LBB108_69
.LBB108_69:                             // %.loopexit30
	jl	x2, x4, .LBB108_85
	jmp	.LBB108_70
.LBB108_70:
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
	jmp	.LBB108_75
.LBB108_71:
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
	jl	x5, r0, .LBB108_75
	jmp	.LBB108_72
.LBB108_72:                             // %.preheader27.preheader
	mov	x5, rsp
add	x5, 1
.LBB108_73:                             // %.preheader27
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
	jne	x6, x7, .LBB108_73
	jmp	.LBB108_74
.LBB108_74:                             // %.loopexit28.loopexit
	add	x1, x7
.LBB108_75:                             // %.loopexit28
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
	jg	x2, r0, .LBB108_77
	jmp	.LBB108_76
.LBB108_76:
	mov	r0, 0
	sub	r0, x2
	mov	x2, r0
.LBB108_77:
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
	jl	x2, r0, .LBB108_79
	jmp	.LBB108_78
.LBB108_78:                             // %.preheader.preheader
	mov	x8, x1
add	x8, 2
	mov	x7, 99
	mov	x3, x2
	jmp	.LBB108_80
.LBB108_79:
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
	jmp	.LBB108_84
.LBB108_80:                             // %.preheader
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
	jg	x4, x7, .LBB108_80
	jmp	.LBB108_81
.LBB108_81:
	add	x1, x9
add	x9, 1
	mov	x7, x1
	mov	r0, 3
add	x7, 2
	jl	x9, r0, .LBB108_84
	jmp	.LBB108_82
.LBB108_82:
	mov	x3, x8
	mov	x9, x1
.LBB108_83:                             // =>This Inner Loop Header: Depth=1
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
	jl	rax, x4, .LBB108_83
	jmp	.LBB108_84
.LBB108_84:                             // %.loopexit
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
	jmp	.LBB108_101
.LBB108_85:
	mov	r0, 0
	jl	x2, r0, .LBB108_93
	jmp	.LBB108_86
.LBB108_86:                             // %.preheader136.preheader
.LBB108_87:                             // %.preheader136
                                        // =>This Inner Loop Header: Depth=1
	mov	x7, r0
	mov	r0, 48
	jge	x7, x5, .LBB108_89
	jmp	.LBB108_88
.LBB108_88:                             //   in Loop: Header=BB108_87 Depth=1
	mov	r0, rsp
	add	r0, x7
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
.LBB108_89:                             //   in Loop: Header=BB108_87 Depth=1
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
	jne	x7, x2, .LBB108_87
	jmp	.LBB108_90
.LBB108_90:
	mov	r0, x2
add	r0, 1
	jle	x5, r0, .LBB108_101
	jmp	.LBB108_91
.LBB108_91:
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
.LBB108_92:                             // =>This Inner Loop Header: Depth=1
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
	je	x5, x4, .LBB108_100
	jmp	.LBB108_92
.LBB108_93:
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
	je	x2, x3, .LBB108_96
	jmp	.LBB108_94
.LBB108_94:                             // %.preheader25.preheader
	mov	x4, 2
	jmp	.LBB108_98
.LBB108_95:                             // %.loopexit26.loopexit
	add	x1, x4
	mov	x6, x1
.LBB108_96:                             // %.loopexit26
	mov	r0, 1
	jl	x5, r0, .LBB108_101
	jmp	.LBB108_97
.LBB108_97:                             // %.preheader23.preheader
	mov	x3, rsp
	mov	x4, x6
	jmp	.LBB108_99
.LBB108_98:                             // %.preheader25
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
	je	rax, x3, .LBB108_95
	jmp	.LBB108_98
.LBB108_99:                             // %.preheader23
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
	jz	x5, .LBB108_101
	jmp	.LBB108_99
.LBB108_100:                            // %.loopexit22.loopexit
	add	x6, x4
.LBB108_101:                            // %.loopexit22
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x6], rax
.LBB108_102:
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
	jg	rax, r0, .LBB109_2
	jmp	.LBB109_1
.LBB109_1:
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	x0, 0
	jmp	.LBB109_20
.LBB109_2:
	mov	r0, -1
	jg	x1, r0, .LBB109_5
	jmp	.LBB109_3
.LBB109_3:
	mov	r0, 10
	jne	x2, r0, .LBB109_5
	jmp	.LBB109_4
.LBB109_4:
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
	jmp	.LBB109_7
.LBB109_5:
	mov	r0, 10
	mov	x6, 0
	je	x2, r0, .LBB109_7
	jmp	.LBB109_6
.LBB109_6:                              // %.preheader8.preheader
	mov	x7, mcasm_static_f5c19d5e962478431864f85657b6afe2
	jmp	.LBB109_16
.LBB109_7:
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
	jl	rax, r0, .LBB109_10
	jmp	.LBB109_8
.LBB109_8:                              // %.preheader.preheader
	mov	x8, mcasm_static_5ad1204a25ebfbceb67ccbbb51b2ba29
	mov	x9, -2147473649
	mov	x2, x1
.LBB109_9:                              // %.preheader
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
	jg	rax, x9, .LBB109_9
	jmp	.LBB109_10
.LBB109_10:                             // %.loopexit5
	mov	r0, 9
	add	x6, x0
	jg	x1, r0, .LBB109_12
	jmp	.LBB109_11
.LBB109_11:
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
	jmp	.LBB109_13
.LBB109_12:
	mov	x5, x7
	mov	r1, 1
add	x5, -1
	mov	r0, x1
	call	__bit_shl
	mov	x8, mcasm_static_5ad1204a25ebfbceb67ccbbb51b2ba29
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
	je	x1, r0, .LBB109_15
	jmp	.LBB109_13
.LBB109_13:
	add	x3, x7
add	x3, 1
	mov	x4, 0
.LBB109_14:                             // =>This Inner Loop Header: Depth=1
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
	jnz	rax, .LBB109_14
	jmp	.LBB109_15
.LBB109_15:                             // %.loopexit
	add	x6, x4
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x6], rax
	jmp	.LBB109_20
.LBB109_16:                             // %.preheader8
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
	jle	rax, x4, .LBB109_16
	jmp	.LBB109_17
.LBB109_17:
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
	je	x6, r0, .LBB109_20
	jmp	.LBB109_18
.LBB109_18:                             // %.preheader6.preheader
add	x6, -1
.LBB109_19:                             // %.preheader6
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
	jl	x4, x6, .LBB109_19
	jmp	.LBB109_20
.LBB109_20:                             // %.loopexit7
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
	jg	rax, r1, .LBB110_2
	jmp	.LBB110_1
.LBB110_1:
	mov	r0, 0
	sub	r0, rax
	mov	rax, r0
.LBB110_2:
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
	mov	r1, 131072
	mov	r2, [r1]
	mov	r3, 1296125004
	mov	x0, r0
	je	r2, r3, .LBB112_2
	jmp	.LBB112_1
.LBB112_1:
	mov	[r1], 1296125004
	mov	r0, 131073
	mov	[r0], 131075
	mov	r0, 131074
	mov	x1, x0
add	x1, 1
	mov	r1, -3
	mov	[r0], 0
	mov	r0, x1
	call	__bit_and
	mov	r1, 2
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, 1
	sub	r1, x0
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
add	x0, -1
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x0, rax
add	x0, 2
	jmp	.LBB112_17
.LBB112_2:
	mov	r0, 131074
	mov	x4, [r0]
	mov	x1, x0
add	x1, 1
	mov	r1, -3
	mov	r0, x1
	call	__bit_and
	mov	r1, 2
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, 1
	sub	r1, x0
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
add	x0, -1
	mov	r0, rax
	mov	r1, x0
	call	__bit_and
	mov	x0, rax
add	x0, 2
	jz	x4, .LBB112_17
	jmp	.LBB112_3
.LBB112_3:                              // %.preheader.preheader
	mov	r0, 0
.LBB112_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	x6, x4
	mov	x2, [x6]
	mov	x5, x6
add	x5, 1
	mov	x4, [x5]
	mov	r1, -2147483648
	mov	x1, r0
	mov	r0, x0
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	jl	rax, x3, .LBB112_12
	jmp	.LBB112_5
.LBB112_5:
	mov	r0, x0
add	r0, 2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x3, .LBB112_9
	jmp	.LBB112_6
.LBB112_6:
	jnz	x1, .LBB112_8
	jmp	.LBB112_7
.LBB112_7:
	mov	r0, 131074
	mov	[r0], x4
	mov	x3, x5
	jmp	.LBB112_20
.LBB112_8:
add	x1, 1
	mov	[x1], x4
	mov	x3, x5
	jmp	.LBB112_20
.LBB112_9:
	mov	r0, x6
	add	r0, x0
	sub	x2, x0
	mov	[r0], x2
	mov	r1, r0
add	r1, 1
	mov	[r1], x4
	mov	[x6], x0
	jnz	x1, .LBB112_11
	jmp	.LBB112_10
.LBB112_10:
	mov	r1, 131074
	mov	[r1], r0
	mov	x3, x5
	jmp	.LBB112_20
.LBB112_11:
add	x1, 1
	mov	[x1], r0
	mov	x3, x5
	jmp	.LBB112_20
.LBB112_12:                             //   in Loop: Header=BB112_4 Depth=1
	mov	r0, x6
	jnz	x4, .LBB112_4
	jmp	.LBB112_13
.LBB112_13:
	mov	r0, 131073
	mov	x7, [r0]
	mov	r0, x2
	add	r0, x6
	jne	x7, r0, .LBB112_17
	jmp	.LBB112_14
.LBB112_14:
	mov	r0, x7
add	r0, -8388609
	mov	r1, -2147483648
	mov	x3, 0
	call	__bit_xor
	mov	r0, 2139226114
	jl	rax, r0, .LBB112_20
	jmp	.LBB112_15
.LBB112_15:
	mov	x4, x0
	mov	r0, 8388608
	sub	r0, x7
	mov	r1, -2147483648
	sub	x4, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x4
	call	__bit_xor
	jg	rax, x2, .LBB112_20
	jmp	.LBB112_16
.LBB112_16:
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
	mov	r1, 131073
	sub	r1, x1
add	rax, 1
	mov	x1, 131073
	mov	r0, rax
	call	__bit_and
	add	rax, x2
	mov	[rax], 0
	mov	r0, x6
	add	r0, x0
	mov	[x1], r0
	mov	[x6], x0
	mov	x3, x5
	jmp	.LBB112_20
.LBB112_17:
	mov	r0, 131073
	mov	x2, [r0]
	mov	r0, x2
add	r0, -8388609
	mov	r1, -2147483648
	mov	x3, 0
	call	__bit_xor
	mov	r0, 2139226114
	jl	rax, r0, .LBB112_20
	jmp	.LBB112_18
.LBB112_18:
	mov	r0, 8388608
	sub	r0, x2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x0
	call	__bit_xor
	jg	rax, x1, .LBB112_20
	jmp	.LBB112_19
.LBB112_19:
	mov	r0, x2
	add	r0, x0
	mov	r1, 131073
	mov	[r1], r0
	mov	[x2], x0
add	x2, 1
	mov	x3, x2
.LBB112_20:
	mov	rax, x3
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
	jz	x1, .LBB113_18
	jmp	.LBB113_1
.LBB113_1:
	mov	r0, 131072
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB113_3
	jmp	.LBB113_2
.LBB113_2:
	mov	[r0], 1296125004
	mov	r0, 131073
	mov	[r0], 131075
	mov	r0, 131074
	mov	[r0], 0
	mov	x2, x1
add	x2, -1
	mov	x3, [x2]
	mov	x4, 0
	mov	x0, 0
	mov	rax, 0
	jmp	.LBB113_8
.LBB113_3:
	mov	r0, 131074
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
	jz	x0, .LBB113_8
	jmp	.LBB113_4
.LBB113_4:
	jge	x0, x2, .LBB113_8
	jmp	.LBB113_5
.LBB113_5:                              // %.preheader.preheader
.LBB113_6:                              // %.preheader
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
	jz	x0, .LBB113_8
	jmp	.LBB113_7
.LBB113_7:                              // %.preheader
                                        //   in Loop: Header=BB113_6 Depth=1
	jl	x0, x2, .LBB113_6
	jmp	.LBB113_8
.LBB113_8:                              // %.loopexit
	jne	x0, x2, .LBB113_10
	jmp	.LBB113_9
.LBB113_9:
	call	abort
.LBB113_10:
	mov	r0, 131074
	jz	x4, .LBB113_14
	jmp	.LBB113_11
.LBB113_11:
	mov	r0, [x4]
	mov	r1, r0
	add	r1, x4
	jne	r1, x2, .LBB113_13
	jmp	.LBB113_12
.LBB113_12:
	add	r0, x3
	mov	[x4], r0
	mov	x2, x4
	jmp	.LBB113_15
.LBB113_13:
add	x4, 1
	mov	r0, x4
.LBB113_14:
	mov	[r0], x2
	mov	[x1], x0
.LBB113_15:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB113_18
	jmp	.LBB113_16
.LBB113_16:
	mov	r0, [x2]
	mov	r1, r0
	add	r1, x2
	jne	r1, x0, .LBB113_18
	jmp	.LBB113_17
.LBB113_17:
	add	r0, [x0]
	mov	[x2], r0
add	x0, 1
	mov	r0, [x0]
add	x2, 1
	mov	[x2], r0
.LBB113_18:
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
	mov	x4, r1
	mov	x0, r0
	jnz	x0, .LBB114_2
	jmp	.LBB114_1
.LBB114_1:
	mov	r0, x4
	call	malloc
	jmp	.LBB114_92
.LBB114_2:
	mov	r0, 131072
	mov	r0, [r0]
	jnz	x4, .LBB114_20
	jmp	.LBB114_3
.LBB114_3:
	mov	r1, 1296125004
	je	r0, r1, .LBB114_5
	jmp	.LBB114_4
.LBB114_4:
	mov	r0, 131072
	mov	[r0], 1296125004
	mov	r0, 131073
	mov	[r0], 131075
	mov	r0, 131074
	mov	[r0], 0
	mov	x2, x0
add	x2, -1
	mov	x3, [x2]
	mov	x4, 0
	mov	x1, 0
	mov	rax, 0
	jmp	.LBB114_10
.LBB114_5:
	mov	r0, 131074
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
	jz	x1, .LBB114_10
	jmp	.LBB114_6
.LBB114_6:
	jge	x1, x2, .LBB114_10
	jmp	.LBB114_7
.LBB114_7:                              // %.preheader.preheader
.LBB114_8:                              // %.preheader
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
	jz	x1, .LBB114_10
	jmp	.LBB114_9
.LBB114_9:                              // %.preheader
                                        //   in Loop: Header=BB114_8 Depth=1
	jl	x1, x2, .LBB114_8
	jmp	.LBB114_10
.LBB114_10:                             // %.loopexit
	jne	x1, x2, .LBB114_12
	jmp	.LBB114_11
.LBB114_11:
	call	abort
.LBB114_12:
	mov	r0, 131074
	jz	x4, .LBB114_16
	jmp	.LBB114_13
.LBB114_13:
	mov	r0, [x4]
	mov	r1, r0
	add	r1, x4
	jne	r1, x2, .LBB114_15
	jmp	.LBB114_14
.LBB114_14:
	add	r0, x3
	mov	[x4], r0
	mov	x2, x4
	jmp	.LBB114_17
.LBB114_15:
add	x4, 1
	mov	r0, x4
.LBB114_16:
	mov	[r0], x2
	mov	[x0], x1
.LBB114_17:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 0
	jz	r0, .LBB114_92
	jmp	.LBB114_18
.LBB114_18:
	mov	r0, [x2]
	mov	r1, r0
	add	r1, x2
	jne	r1, x1, .LBB114_92
	jmp	.LBB114_19
.LBB114_19:
	add	r0, [x1]
	mov	[x2], r0
add	x1, 1
	mov	r0, [x1]
add	x2, 1
	mov	[x2], r0
	jmp	.LBB114_92
.LBB114_20:
	mov	r1, 1296125004
	je	r0, r1, .LBB114_22
	jmp	.LBB114_21
.LBB114_21:
	mov	r0, 131072
	mov	[r0], 1296125004
	mov	r0, 131073
	mov	[r0], 131075
	mov	r0, 131074
	mov	[r0], 0
.LBB114_22:
	mov	x11, x0
add	x11, -1
	mov	x3, [x11]
	mov	x1, x4
add	x1, 1
	mov	r1, -3
	mov	r0, x1
	call	__bit_and
	mov	r1, 2
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	mov	r1, 1
	sub	r1, x4
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
	mov	r1, x4
add	r1, -1
	mov	r0, rax
	call	__bit_and
	mov	x1, rax
add	x1, 2
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x3
	call	__bit_xor
	jge	rax, x2, .LBB114_73
	jmp	.LBB114_23
.LBB114_23:
	mov	r0, 131073
	mov	r0, [r0]
	mov	x6, x3
	add	x6, x11
	mov	x5, x1
	sub	x5, x3
	je	x6, r0, .LBB114_27
	jmp	.LBB114_24
.LBB114_24:
	mov	r0, 131074
	mov	r0, [r0]
	mov	x2, 0
	jz	r0, .LBB114_32
	jmp	.LBB114_25
.LBB114_25:
	jge	r0, x6, .LBB114_32
	jmp	.LBB114_26
.LBB114_26:                             // %.preheader28.preheader
	jmp	.LBB114_30
.LBB114_27:
	mov	r0, x6
add	r0, -8388609
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2139226114
	jl	rax, r0, .LBB114_39
	jmp	.LBB114_28
.LBB114_28:
	mov	r0, 8388608
	sub	r0, x6
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x5
	call	__bit_xor
	jg	rax, x2, .LBB114_39
	jmp	.LBB114_29
.LBB114_29:
	mov	r0, x1
	add	r0, x11
	mov	r1, 131073
	mov	[r1], r0
	mov	[x11], x1
	mov	rax, x0
	jmp	.LBB114_92
.LBB114_30:                             // %.preheader28
                                        // =>This Inner Loop Header: Depth=1
	mov	x2, r0
add	r0, 1
	mov	r0, [r0]
	jz	r0, .LBB114_32
	jmp	.LBB114_31
.LBB114_31:                             // %.preheader28
                                        //   in Loop: Header=BB114_30 Depth=1
	jl	r0, x6, .LBB114_30
	jmp	.LBB114_32
.LBB114_32:                             // %.loopexit29
	jne	r0, x6, .LBB114_39
	jmp	.LBB114_33
.LBB114_33:
	mov	x6, [x6]
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	mov	r1, -2147483648
	mov	x7, rax
	mov	r0, x6
	call	__bit_xor
	jl	rax, x7, .LBB114_39
	jmp	.LBB114_34
.LBB114_34:
	mov	r0, x3
	add	r0, x0
	mov	x7, [r0]
	mov	r0, x5
add	r0, 2
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x6
	call	__bit_xor
	jge	rax, x4, .LBB114_38
	jmp	.LBB114_35
.LBB114_35:
	add	x6, x3
	mov	[x11], x6
	jnz	x2, .LBB114_37
	jmp	.LBB114_36
.LBB114_36:
	mov	r0, 131074
	mov	[r0], x7
	mov	rax, x0
	jmp	.LBB114_92
.LBB114_37:
add	x2, 1
	mov	[x2], x7
	mov	rax, x0
	jmp	.LBB114_92
.LBB114_38:
	mov	x3, x1
	add	x3, x11
	sub	x6, x5
	mov	[x3], x6
	mov	r0, x1
	add	r0, x0
	mov	[r0], x7
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
	mov	x4, x2
add	x4, 1
	mov	r0, rax
	call	__bit_not
	mov	r1, 131073
	sub	r1, x2
add	rax, 1
	mov	r0, rax
	call	__bit_and
	add	rax, x4
	mov	[rax], x3
	mov	[x11], x1
	mov	rax, x0
	jmp	.LBB114_92
.LBB114_39:
	mov	r0, x4
	call	malloc
	mov	x2, rax
	mov	rax, 0
	jz	x2, .LBB114_92
	jmp	.LBB114_40
.LBB114_40:
add	x3, -1
	mov	x7, x2
	mov	r0, x3
	call	__bit_not
	mov	r0, rax
	mov	r1, x4
	call	__bit_and
	mov	x1, rax
	mov	r0, x3
	mov	r1, x4
	call	__bit_xor
	mov	r0, rax
	call	__bit_not
	sub	x3, x4
	mov	r0, rax
	mov	r1, x3
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
	mov	r1, x3
	call	__bit_and
	mov	x6, rax
	add	x6, x4
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	mov	r0, -2147483632
	mov	x4, x0
	mov	x1, x7
	jl	rax, r0, .LBB114_53
	jmp	.LBB114_41
.LBB114_41:
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	x3, rax
	mov	x8, 8
	sub	x8, x3
	mov	x12, 0
	mov	x5, x0
.LBB114_42:                             // =>This Inner Loop Header: Depth=1
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
	jne	x8, x12, .LBB114_42
	jmp	.LBB114_43
.LBB114_43:
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
	jnz	rax, .LBB114_50
	jmp	.LBB114_44
.LBB114_44:
	mov	x7, x2
	mov	r1, -2147483648
	add	x7, x12
	mov	r0, x3
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB114_46
	jmp	.LBB114_45
.LBB114_45:                             // %.preheader.i.preheader
	add	x2, x12
	add	x12, x0
	mov	x4, 0
	mov	x5, -2147483633
	jmp	.LBB114_48
.LBB114_46:                             // %.preheader161
	mov	x2, -2147483645
	mov	x6, x3
	jmp	.LBB114_49
.LBB114_47:
	add	x2, x4
	add	x12, x4
	mov	r0, 3
	mov	x7, x2
	mov	x4, x12
	mov	x6, x3
	jg	x3, r0, .LBB114_46
	jmp	.LBB114_53
.LBB114_48:                             // %.preheader.i
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
	jg	rax, x5, .LBB114_48
	jmp	.LBB114_47
.LBB114_49:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x4]
add	x4, 4
	mov	[x7], r0
add	x6, -4
	mov	r1, -2147483648
add	x7, 4
	mov	r0, x6
	call	__bit_xor
	jg	rax, x2, .LBB114_49
	jmp	.LBB114_53
.LBB114_50:
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
.LBB114_51:                             // =>This Inner Loop Header: Depth=1
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
	jge	rax, x10, .LBB114_51
	jmp	.LBB114_52
.LBB114_52:
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
	jmp	.LBB114_54
.LBB114_53:                             // %.loopexit8.i
	mov	x3, x6
	jz	x6, .LBB114_56
	jmp	.LBB114_54
.LBB114_54:                             // %.preheader158
	mov	x6, x7
.LBB114_55:                             // =>This Inner Loop Header: Depth=1
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
	jnz	x3, .LBB114_55
	jmp	.LBB114_56
.LBB114_56:                             // %memcpy.exit
	mov	r0, 131072
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB114_58
	jmp	.LBB114_57
.LBB114_57:
	mov	[r0], 1296125004
	mov	r0, 131073
	mov	[r0], 131075
	mov	r0, 131074
	mov	[r0], 0
	mov	x3, [x11]
	mov	x4, 0
	mov	x2, 0
	mov	rax, 0
	jmp	.LBB114_63
.LBB114_58:
	mov	r0, 131074
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
	jz	x2, .LBB114_63
	jmp	.LBB114_59
.LBB114_59:
	jge	x2, x11, .LBB114_63
	jmp	.LBB114_60
.LBB114_60:                             // %.preheader26.preheader
.LBB114_61:                             // %.preheader26
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
	jz	x2, .LBB114_63
	jmp	.LBB114_62
.LBB114_62:                             // %.preheader26
                                        //   in Loop: Header=BB114_61 Depth=1
	jl	x2, x11, .LBB114_61
	jmp	.LBB114_63
.LBB114_63:                             // %.loopexit27
	jne	x2, x11, .LBB114_65
	jmp	.LBB114_64
.LBB114_64:
	call	abort
.LBB114_65:
	mov	r0, 131074
	jz	x4, .LBB114_69
	jmp	.LBB114_66
.LBB114_66:
	mov	r0, [x4]
	mov	r1, r0
	add	r1, x4
	jne	r1, x11, .LBB114_68
	jmp	.LBB114_67
.LBB114_67:
	add	r0, x3
	mov	[x4], r0
	mov	x11, x4
	jmp	.LBB114_70
.LBB114_68:
add	x4, 1
	mov	r0, x4
.LBB114_69:
	mov	[r0], x11
	mov	[x0], x2
.LBB114_70:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, x1
	jz	r0, .LBB114_92
	jmp	.LBB114_71
.LBB114_71:
	mov	r0, [x11]
	mov	r1, r0
	add	r1, x11
	jne	r1, x2, .LBB114_92
	jmp	.LBB114_72
.LBB114_72:
	add	r0, [x2]
	mov	[x11], r0
add	x2, 1
	mov	r0, [x2]
add	x11, 1
	mov	[x11], r0
	jmp	.LBB114_92
.LBB114_73:
	sub	x3, x1
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483646
	mov	r0, rax
	mov	rax, x0
	jl	r0, r1, .LBB114_92
	jmp	.LBB114_74
.LBB114_74:
	mov	r0, x1
	add	r0, x11
	mov	[x11], x1
	add	x1, x0
	mov	[r0], x3
	mov	rax, x0
	jz	x1, .LBB114_92
	jmp	.LBB114_75
.LBB114_75:
	mov	r0, 131072
	mov	r1, [r0]
	mov	r2, 1296125004
	je	r1, r2, .LBB114_77
	jmp	.LBB114_76
.LBB114_76:
	mov	[r0], 1296125004
	mov	r0, 131073
	mov	[r0], 131075
	mov	r0, 131074
	mov	[r0], 0
	mov	x3, x1
add	x3, -1
	mov	x4, [x3]
	mov	x5, 0
	mov	x2, 0
	mov	rax, 0
	jmp	.LBB114_82
.LBB114_77:
	mov	r0, 131074
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
	jz	x2, .LBB114_82
	jmp	.LBB114_78
.LBB114_78:
	jge	x2, x3, .LBB114_82
	jmp	.LBB114_79
.LBB114_79:                             // %.preheader30.preheader
.LBB114_80:                             // %.preheader30
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
	jz	x2, .LBB114_82
	jmp	.LBB114_81
.LBB114_81:                             // %.preheader30
                                        //   in Loop: Header=BB114_80 Depth=1
	jl	x2, x3, .LBB114_80
	jmp	.LBB114_82
.LBB114_82:                             // %.loopexit31
	jne	x2, x3, .LBB114_84
	jmp	.LBB114_83
.LBB114_83:
	call	abort
.LBB114_84:
	mov	r0, 131074
	jz	x5, .LBB114_88
	jmp	.LBB114_85
.LBB114_85:
	mov	r0, [x5]
	mov	r1, r0
	add	r1, x5
	jne	r1, x3, .LBB114_87
	jmp	.LBB114_86
.LBB114_86:
	add	r0, x4
	mov	[x5], r0
	mov	x3, x5
	jmp	.LBB114_89
.LBB114_87:
add	x5, 1
	mov	r0, x5
.LBB114_88:
	mov	[r0], x3
	mov	[x1], x2
.LBB114_89:
	mov	r1, 1
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, x0
	jz	r0, .LBB114_92
	jmp	.LBB114_90
.LBB114_90:
	mov	r0, [x3]
	mov	r1, r0
	add	r1, x3
	mov	rax, x0
	jne	r1, x2, .LBB114_92
	jmp	.LBB114_91
.LBB114_91:
	add	r0, [x2]
	mov	[x3], r0
add	x2, 1
	mov	r0, [x2]
add	x3, 1
	mov	[x3], r0
	mov	rax, x0
.LBB114_92:
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
	jz	x2, .LBB115_2
	jmp	.LBB115_1
.LBB115_1:
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
	jnz	rax, .LBB115_18
	jmp	.LBB115_2
.LBB115_2:
	mul	x0, x2
	mov	r0, x0
	call	malloc
	mov	x2, rax
	mov	x1, 0
	jz	x2, .LBB115_18
	jmp	.LBB115_3
.LBB115_3:
	mov	r1, 3
	mov	x1, x2
	mov	r0, x1
	call	__bit_and
	jz	rax, .LBB115_8
	jmp	.LBB115_4
.LBB115_4:                              // %.preheader2.preheader
	mov	x4, x2
add	x4, 1
	mov	x3, 0
.LBB115_5:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
	je	x0, x3, .LBB115_18
	jmp	.LBB115_6
.LBB115_6:                              //   in Loop: Header=BB115_5 Depth=1
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
	jnz	rax, .LBB115_5
	jmp	.LBB115_7
.LBB115_7:                              // %.loopexit7.i.loopexit
	add	x2, x3
	sub	x0, x3
.LBB115_8:                              // %.loopexit7.i
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB115_15
	jmp	.LBB115_9
.LBB115_9:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB115_11
	jmp	.LBB115_10
.LBB115_10:                             // %.preheader.i.preheader
	mov	x3, -2147483633
	jmp	.LBB115_13
.LBB115_11:                             // %.preheader33
	mov	x3, -2147483645
	jmp	.LBB115_14
.LBB115_12:
	mov	r0, 3
	jg	x0, r0, .LBB115_11
	jmp	.LBB115_15
.LBB115_13:                             // %.preheader.i
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
	jg	rax, x3, .LBB115_13
	jmp	.LBB115_12
.LBB115_14:                             // =>This Inner Loop Header: Depth=1
	mov	[x2], 0
add	x0, -4
	mov	r1, -2147483648
add	x2, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x3, .LBB115_14
	jmp	.LBB115_15
.LBB115_15:                             // %.loopexit5.i
	jz	x0, .LBB115_18
	jmp	.LBB115_16
.LBB115_16:                             // %.preheader.preheader
	mov	x3, x2
.LBB115_17:                             // %.preheader
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
	jnz	x0, .LBB115_17
	jmp	.LBB115_18
.LBB115_18:                             // %memset.exit
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
	jg	rax, r0, .LBB116_3
	jmp	.LBB116_1
.LBB116_1:
	mov	r0, 1
	je	x3, r0, .LBB116_3
	jmp	.LBB116_2
.LBB116_2:                              // %.preheader6.preheader
	mov	x6, x1
add	x6, 1
	mov	x2, -2147483643
	mov	x4, 32
	jmp	.LBB116_5
.LBB116_3:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 22
	mov	x5, 0
	jz	x0, .LBB116_40
	jmp	.LBB116_4
.LBB116_4:
	mov	[x0], x1
	jmp	.LBB116_40
.LBB116_5:                              // %.preheader6
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
	jl	rax, x2, .LBB116_9
	jmp	.LBB116_6
.LBB116_6:                              // %.preheader6
                                        //   in Loop: Header=BB116_5 Depth=1
	je	x5, x4, .LBB116_9
	jmp	.LBB116_7
.LBB116_7:                              // %.preheader6
	mov	r0, 43
	je	x5, r0, .LBB116_11
	jmp	.LBB116_8
.LBB116_8:                              // %.preheader6
	mov	r0, 45
	je	x5, r0, .LBB116_10
	jmp	.LBB116_13
.LBB116_9:                              // %.preheader6.backedge
                                        //   in Loop: Header=BB116_5 Depth=1
add	x6, 1
	jmp	.LBB116_5
.LBB116_10:                             // %.loopexit8.loopexit
	mov	x2, 1
	jmp	.LBB116_12
.LBB116_11:                             // %.loopexit8.loopexit1
	mov	x2, 0
.LBB116_12:                             // %.loopexit8
	mov	r0, [x6]
	mov	r1, 255
add	x6, 1
	call	__bit_and
	mov	x5, rax
	jmp	.LBB116_14
.LBB116_13:                             // %.loopexit7.loopexit
	mov	x2, 0
.LBB116_14:                             // %.loopexit7
	mov	r1, 255
	mov	r0, x5
	call	__bit_and
	mov	r0, 48
	jne	rax, r0, .LBB116_20
	jmp	.LBB116_15
.LBB116_15:
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
	jnz	rax, .LBB116_18
	jmp	.LBB116_16
.LBB116_16:
	mov	r1, 255
	mov	r0, x4
	call	__bit_and
	mov	r0, 88
	jne	rax, r0, .LBB116_18
	jmp	.LBB116_17
.LBB116_17:
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
	jmp	.LBB116_22
.LBB116_18:
	mov	x4, 8
	mov	x5, 48
	mov	x9, x6
	jz	x3, .LBB116_22
	jmp	.LBB116_19
.LBB116_19:
	mov	x9, x6
	mov	x4, x3
	jmp	.LBB116_22
.LBB116_20:
	mov	x4, 10
	mov	x9, x6
	jz	x3, .LBB116_22
	jmp	.LBB116_21
.LBB116_21:
	mov	x9, x6
	mov	x4, x3
.LBB116_22:
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
	jg	rax, r0, .LBB116_24
	jmp	.LBB116_23
.LBB116_23:
	mov	x7, x5
.LBB116_24:
add	x7, -48
	mov	r1, -2147483648
	mov	x5, 0
	mov	r0, x4
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x7
	call	__bit_xor
	jge	rax, x8, .LBB116_34
	jmp	.LBB116_25
.LBB116_25:                             // %.preheader.preheader
	mov	r0, x6
	mul	r0, x4
	mov	x8, x3
	sub	x8, r0
add	x9, -1
	mov	x10, -2147483591
	mov	x1, x9
.LBB116_26:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x5
	call	__bit_xor
	jg	rax, x9, .LBB116_29
	jmp	.LBB116_27
.LBB116_27:                             //   in Loop: Header=BB116_26 Depth=1
	mov	r1, -2147483648
	mov	r0, x8
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x7
	call	__bit_xor
	jle	rax, x9, .LBB116_30
	jmp	.LBB116_28
.LBB116_28:                             //   in Loop: Header=BB116_26 Depth=1
	jne	x5, x6, .LBB116_30
	jmp	.LBB116_29
.LBB116_29:                             //   in Loop: Header=BB116_26 Depth=1
	mov	r1, 2
	mov	r0, x2
	call	__bit_or
	mov	x2, rax
	jmp	.LBB116_31
.LBB116_30:                             //   in Loop: Header=BB116_26 Depth=1
	mul	x5, x4
	add	x5, x7
.LBB116_31:                             //   in Loop: Header=BB116_26 Depth=1
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
	jg	rax, x10, .LBB116_33
	jmp	.LBB116_32
.LBB116_32:                             //   in Loop: Header=BB116_26 Depth=1
	mov	x7, x9
.LBB116_33:                             //   in Loop: Header=BB116_26 Depth=1
	mov	r1, -2147483648
add	x7, -48
	mov	r0, x4
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x7
	call	__bit_xor
	jl	rax, x9, .LBB116_26
	jmp	.LBB116_34
.LBB116_34:                             // %.loopexit
	jz	x0, .LBB116_36
	jmp	.LBB116_35
.LBB116_35:
	mov	[x0], x1
.LBB116_36:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 1
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB116_38
	jmp	.LBB116_37
.LBB116_37:
	mov	r0, 0
	sub	r0, x5
	mov	x5, r0
.LBB116_38:
	mov	r1, 2
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB116_40
	jmp	.LBB116_39
.LBB116_39:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 34
	mov	x5, x3
.LBB116_40:
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
	jg	rax, r0, .LBB117_3
	jmp	.LBB117_1
.LBB117_1:
	mov	r0, 1
	je	x4, r0, .LBB117_3
	jmp	.LBB117_2
.LBB117_2:                              // %.preheader.preheader
	mov	x3, -2147483643
	mov	x5, 32
	mov	x9, x1
	jmp	.LBB117_5
.LBB117_3:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 22
	mov	x7, 0
	mov	x6, 0
	jz	x0, .LBB117_46
	jmp	.LBB117_4
.LBB117_4:
	mov	[x0], x1
	jmp	.LBB117_46
.LBB117_5:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
	mov	r0, x2
add	r0, -9
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, x3, .LBB117_9
	jmp	.LBB117_6
.LBB117_6:                              // %.preheader
                                        //   in Loop: Header=BB117_5 Depth=1
	je	x2, x5, .LBB117_9
	jmp	.LBB117_7
.LBB117_7:                              // %.preheader
	mov	r0, 43
	je	x2, r0, .LBB117_10
	jmp	.LBB117_8
.LBB117_8:                              // %.preheader
	mov	r0, 45
	je	x2, r0, .LBB117_10
	jmp	.LBB117_11
.LBB117_9:                              // %isspace.exit
                                        //   in Loop: Header=BB117_5 Depth=1
add	x9, 1
	jmp	.LBB117_5
.LBB117_10:
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
	jmp	.LBB117_12
.LBB117_11:                             // %.loopexit51.loopexit
	mov	x2, 1
.LBB117_12:                             // %.loopexit51
	mov	r1, 16
	mov	x5, 16
	mov	r0, x4
	call	__bit_or
	mov	x3, x4
	je	rax, x5, .LBB117_13
	jmp	.LBB117_18
.LBB117_13:
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	mov	r0, 48
	mov	x3, 10
	jne	rax, r0, .LBB117_16
	jmp	.LBB117_14
.LBB117_14:
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
	je	rax, r0, .LBB117_15
	jmp	.LBB117_16
.LBB117_15:
add	x9, 2
	mov	x3, 16
	jmp	.LBB117_18
.LBB117_16:
	jz	x4, .LBB117_18
	jmp	.LBB117_17
.LBB117_17:
	mov	x3, x4
.LBB117_18:
	mov	x4, 2147483647
	mov	x5, -1
	jnz	x2, .LBB117_20
	jmp	.LBB117_19
.LBB117_19:
	mov	x4, -2147483648
	mov	x5, 0
.LBB117_20:
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
	jl	rax, r0, .LBB117_25
	jmp	.LBB117_21
.LBB117_21:
	mov	r0, x6
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	x7, -2147483622
	jl	rax, x7, .LBB117_24
	jmp	.LBB117_22
.LBB117_22:
	mov	r0, x6
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	x6, -87
	mov	r0, rax
	call	__bit_xor
	mov	x8, x6
	jl	rax, x7, .LBB117_25
	jmp	.LBB117_23
.LBB117_23:
	mov	x8, 36
	jmp	.LBB117_25
.LBB117_24:
add	x6, -55
	mov	x8, x6
.LBB117_25:
	mov	x7, 0
	mov	x6, 0
	jge	x8, x3, .LBB117_42
	jmp	.LBB117_26
.LBB117_26:
add	x9, 1
	mov	x13, -2147483638
	mov	x14, -2147483623
	mov	x15, -2147483622
	mov	x1, x9
	mov	x7, x8
.LBB117_27:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x9, rax
	mov	x8, x9
add	x8, -48
	mov	r1, -2147483648
	mov	r0, x8
	call	__bit_xor
	jl	rax, x13, .LBB117_32
	jmp	.LBB117_28
.LBB117_28:                             //   in Loop: Header=BB117_27 Depth=1
	mov	r0, x9
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, x14, .LBB117_30
	jmp	.LBB117_29
.LBB117_29:                             //   in Loop: Header=BB117_27 Depth=1
add	x9, -55
	mov	x8, x9
	jmp	.LBB117_32
.LBB117_30:                             //   in Loop: Header=BB117_27 Depth=1
	mov	r0, x9
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	x9, -87
	mov	r0, rax
	call	__bit_xor
	mov	x8, x9
	jl	rax, x15, .LBB117_32
	jmp	.LBB117_31
.LBB117_31:                             //   in Loop: Header=BB117_27 Depth=1
	mov	x8, 36
.LBB117_32:                             //   in Loop: Header=BB117_27 Depth=1
	jge	x8, x3, .LBB117_42
	jmp	.LBB117_33
.LBB117_33:                             //   in Loop: Header=BB117_27 Depth=1
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
	jnz	rax, .LBB117_41
	jmp	.LBB117_34
.LBB117_34:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 34
	mov	x9, -2147483638
	mov	x10, -2147483623
	mov	x11, -2147483622
.LBB117_35:                             // =>This Inner Loop Header: Depth=1
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
	jl	rax, x9, .LBB117_40
	jmp	.LBB117_36
.LBB117_36:                             //   in Loop: Header=BB117_35 Depth=1
	mov	r0, x6
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, x10, .LBB117_38
	jmp	.LBB117_37
.LBB117_37:                             //   in Loop: Header=BB117_35 Depth=1
add	x6, -55
	mov	x8, x6
	jmp	.LBB117_40
.LBB117_38:                             //   in Loop: Header=BB117_35 Depth=1
	mov	r0, x6
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	x6, -87
	mov	r0, rax
	call	__bit_xor
	mov	x8, x6
	jl	rax, x11, .LBB117_40
	jmp	.LBB117_39
.LBB117_39:                             //   in Loop: Header=BB117_35 Depth=1
	mov	x8, 36
.LBB117_40:                             //   in Loop: Header=BB117_35 Depth=1
	mov	x7, x5
	mov	x6, x4
	jl	x8, x3, .LBB117_35
	jmp	.LBB117_42
.LBB117_41:                             //   in Loop: Header=BB117_27 Depth=1
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
	jmp	.LBB117_27
.LBB117_42:                             // %.loopexit
	jz	x0, .LBB117_44
	jmp	.LBB117_43
.LBB117_43:
	mov	[x0], x1
.LBB117_44:
	mov	r0, 0
	mov	r1, 0
	mov	r2, x7
	mov	r3, x6
	call	__subdi3
	jnz	x2, .LBB117_46
	jmp	.LBB117_45
.LBB117_45:
	mov	x7, rax
	mov	x6, t0
.LBB117_46:
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
	jg	rax, r0, .LBB118_3
	jmp	.LBB118_1
.LBB118_1:
	mov	r0, 1
	je	x4, r0, .LBB118_3
	jmp	.LBB118_2
.LBB118_2:                              // %.preheader6.preheader
	mov	x5, x1
add	x5, 1
	mov	x2, -2147483643
	mov	x3, 32
	jmp	.LBB118_5
.LBB118_3:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 22
	mov	x4, 0
	jz	x0, .LBB118_40
	jmp	.LBB118_4
.LBB118_4:
	mov	[x0], x1
	jmp	.LBB118_40
.LBB118_5:                              // %.preheader6
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
	jl	rax, x2, .LBB118_9
	jmp	.LBB118_6
.LBB118_6:                              // %.preheader6
                                        //   in Loop: Header=BB118_5 Depth=1
	je	x7, x3, .LBB118_9
	jmp	.LBB118_7
.LBB118_7:                              // %.preheader6
	mov	r0, 43
	je	x7, r0, .LBB118_11
	jmp	.LBB118_8
.LBB118_8:                              // %.preheader6
	mov	r0, 45
	je	x7, r0, .LBB118_10
	jmp	.LBB118_13
.LBB118_9:                              // %.preheader6.backedge
                                        //   in Loop: Header=BB118_5 Depth=1
add	x5, 1
	jmp	.LBB118_5
.LBB118_10:                             // %.loopexit8.loopexit
	mov	x2, 1
	jmp	.LBB118_12
.LBB118_11:                             // %.loopexit8.loopexit1
	mov	x2, 0
.LBB118_12:                             // %.loopexit8
	mov	r0, [x5]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x7, rax
	jmp	.LBB118_14
.LBB118_13:                             // %.loopexit7.loopexit
	mov	x2, 0
.LBB118_14:                             // %.loopexit7
	mov	r1, 255
	mov	r0, x7
	call	__bit_and
	mov	r0, 48
	jne	rax, r0, .LBB118_20
	jmp	.LBB118_15
.LBB118_15:
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
	jnz	rax, .LBB118_18
	jmp	.LBB118_16
.LBB118_16:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r0, 88
	jne	rax, r0, .LBB118_18
	jmp	.LBB118_17
.LBB118_17:
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
	jmp	.LBB118_22
.LBB118_18:
	mov	x7, 48
	mov	x3, 8
	mov	x10, x5
	jz	x4, .LBB118_22
	jmp	.LBB118_19
.LBB118_19:
	mov	x3, x4
	mov	x10, x5
	jmp	.LBB118_22
.LBB118_20:
	mov	x3, 10
	mov	x10, x5
	jz	x4, .LBB118_22
	jmp	.LBB118_21
.LBB118_21:
	mov	x3, x4
	mov	x10, x5
.LBB118_22:
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
	jg	rax, r0, .LBB118_24
	jmp	.LBB118_23
.LBB118_23:
	mov	x7, x4
.LBB118_24:
add	x7, -48
	mov	r1, -2147483648
	mov	x4, 0
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x7
	call	__bit_xor
	jge	rax, x8, .LBB118_34
	jmp	.LBB118_25
.LBB118_25:                             // %.preheader.preheader
add	x10, -1
	mov	x9, -2147483591
	mov	x1, x10
.LBB118_26:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x4
	call	__bit_xor
	jg	rax, x8, .LBB118_29
	jmp	.LBB118_27
.LBB118_27:                             //   in Loop: Header=BB118_26 Depth=1
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x7
	call	__bit_xor
	jle	rax, x8, .LBB118_30
	jmp	.LBB118_28
.LBB118_28:                             //   in Loop: Header=BB118_26 Depth=1
	jne	x4, x5, .LBB118_30
	jmp	.LBB118_29
.LBB118_29:                             //   in Loop: Header=BB118_26 Depth=1
	mov	r1, 2
	mov	r0, x2
	call	__bit_or
	mov	x2, rax
	jmp	.LBB118_31
.LBB118_30:                             //   in Loop: Header=BB118_26 Depth=1
	mul	x4, x3
	add	x4, x7
.LBB118_31:                             //   in Loop: Header=BB118_26 Depth=1
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
	jg	rax, x9, .LBB118_33
	jmp	.LBB118_32
.LBB118_32:                             //   in Loop: Header=BB118_26 Depth=1
	mov	x7, x8
.LBB118_33:                             //   in Loop: Header=BB118_26 Depth=1
	mov	r1, -2147483648
add	x7, -48
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x8, rax
	mov	r0, x7
	call	__bit_xor
	jl	rax, x8, .LBB118_26
	jmp	.LBB118_34
.LBB118_34:                             // %.loopexit
	jz	x0, .LBB118_36
	jmp	.LBB118_35
.LBB118_35:
	mov	[x0], x1
.LBB118_36:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 1
	mov	x0, rax
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB118_38
	jmp	.LBB118_37
.LBB118_37:
	mov	r0, 0
	sub	r0, x4
	mov	x4, r0
.LBB118_38:
	mov	r1, 2
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB118_40
	jmp	.LBB118_39
.LBB118_39:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 34
	mov	x4, -1
.LBB118_40:
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
	jg	rax, r0, .LBB119_3
	jmp	.LBB119_1
.LBB119_1:
	mov	r0, 1
	je	x4, r0, .LBB119_3
	jmp	.LBB119_2
.LBB119_2:                              // %.preheader.preheader
	mov	x3, -2147483643
	mov	x5, 32
	mov	x7, x1
	jmp	.LBB119_5
.LBB119_3:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 22
	mov	x4, 0
	mov	x5, 0
	jz	x0, .LBB119_44
	jmp	.LBB119_4
.LBB119_4:
	mov	[x0], x1
	jmp	.LBB119_44
.LBB119_5:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
	mov	r0, x2
add	r0, -9
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, x3, .LBB119_9
	jmp	.LBB119_6
.LBB119_6:                              // %.preheader
                                        //   in Loop: Header=BB119_5 Depth=1
	je	x2, x5, .LBB119_9
	jmp	.LBB119_7
.LBB119_7:                              // %.preheader
	mov	r0, 43
	je	x2, r0, .LBB119_10
	jmp	.LBB119_8
.LBB119_8:                              // %.preheader
	mov	r0, 45
	je	x2, r0, .LBB119_10
	jmp	.LBB119_11
.LBB119_9:                              // %isspace.exit
                                        //   in Loop: Header=BB119_5 Depth=1
add	x7, 1
	jmp	.LBB119_5
.LBB119_10:
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
	jmp	.LBB119_12
.LBB119_11:                             // %.loopexit51.loopexit
	mov	x2, 1
.LBB119_12:                             // %.loopexit51
	mov	r1, 16
	mov	x5, 16
	mov	r0, x4
	call	__bit_or
	mov	x3, x4
	je	rax, x5, .LBB119_13
	jmp	.LBB119_18
.LBB119_13:
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	r0, 48
	mov	x3, 10
	jne	rax, r0, .LBB119_16
	jmp	.LBB119_14
.LBB119_14:
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
	je	rax, r0, .LBB119_15
	jmp	.LBB119_16
.LBB119_15:
add	x7, 2
	mov	x3, 16
	jmp	.LBB119_18
.LBB119_16:
	jz	x4, .LBB119_18
	jmp	.LBB119_17
.LBB119_17:
	mov	x3, x4
.LBB119_18:
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
	jl	rax, r0, .LBB119_23
	jmp	.LBB119_19
.LBB119_19:
	mov	r0, x4
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	mov	x5, -2147483622
	jl	rax, x5, .LBB119_22
	jmp	.LBB119_20
.LBB119_20:
	mov	r0, x4
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	x4, -87
	mov	r0, rax
	call	__bit_xor
	mov	x6, x4
	jl	rax, x5, .LBB119_23
	jmp	.LBB119_21
.LBB119_21:
	mov	x6, 36
	jmp	.LBB119_23
.LBB119_22:
add	x4, -55
	mov	x6, x4
.LBB119_23:
	mov	x4, 0
	mov	x5, 0
	jge	x6, x3, .LBB119_40
	jmp	.LBB119_24
.LBB119_24:
add	x7, 1
	mov	x11, -2147483638
	mov	x12, -2147483623
	mov	x13, -2147483622
	mov	x1, x7
	mov	x4, x6
.LBB119_25:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x7, rax
	mov	x6, x7
add	x6, -48
	mov	r1, -2147483648
	mov	r0, x6
	call	__bit_xor
	jl	rax, x11, .LBB119_30
	jmp	.LBB119_26
.LBB119_26:                             //   in Loop: Header=BB119_25 Depth=1
	mov	r0, x7
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, x12, .LBB119_28
	jmp	.LBB119_27
.LBB119_27:                             //   in Loop: Header=BB119_25 Depth=1
add	x7, -55
	mov	x6, x7
	jmp	.LBB119_30
.LBB119_28:                             //   in Loop: Header=BB119_25 Depth=1
	mov	r0, x7
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	x7, -87
	mov	r0, rax
	call	__bit_xor
	mov	x6, x7
	jl	rax, x13, .LBB119_30
	jmp	.LBB119_29
.LBB119_29:                             //   in Loop: Header=BB119_25 Depth=1
	mov	x6, 36
.LBB119_30:                             //   in Loop: Header=BB119_25 Depth=1
	jge	x6, x3, .LBB119_40
	jmp	.LBB119_31
.LBB119_31:                             //   in Loop: Header=BB119_25 Depth=1
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
	jnz	rax, .LBB119_39
	jmp	.LBB119_32
.LBB119_32:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 34
	mov	x7, -2147483638
	mov	x8, -2147483623
	mov	x9, -2147483622
	mov	x5, -1
.LBB119_33:                             // =>This Inner Loop Header: Depth=1
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
	jl	rax, x7, .LBB119_38
	jmp	.LBB119_34
.LBB119_34:                             //   in Loop: Header=BB119_33 Depth=1
	mov	r0, x4
add	r0, -65
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
	mov	r0, rax
	call	__bit_xor
	jg	rax, x8, .LBB119_36
	jmp	.LBB119_35
.LBB119_35:                             //   in Loop: Header=BB119_33 Depth=1
add	x4, -55
	mov	x6, x4
	jmp	.LBB119_38
.LBB119_36:                             //   in Loop: Header=BB119_33 Depth=1
	mov	r0, x4
add	r0, -97
	mov	r1, 255
	call	__bit_and
	mov	r1, -2147483648
add	x4, -87
	mov	r0, rax
	call	__bit_xor
	mov	x6, x4
	jl	rax, x9, .LBB119_38
	jmp	.LBB119_37
.LBB119_37:                             //   in Loop: Header=BB119_33 Depth=1
	mov	x6, 36
.LBB119_38:                             //   in Loop: Header=BB119_33 Depth=1
	mov	x4, -1
	jl	x6, x3, .LBB119_33
	jmp	.LBB119_40
.LBB119_39:                             //   in Loop: Header=BB119_25 Depth=1
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
	jmp	.LBB119_25
.LBB119_40:                             // %.loopexit
	jz	x0, .LBB119_42
	jmp	.LBB119_41
.LBB119_41:
	mov	[x0], x1
.LBB119_42:
	mov	r0, 0
	mov	r1, 0
	mov	r2, x4
	mov	r3, x5
	call	__subdi3
	jnz	x2, .LBB119_44
	jmp	.LBB119_43
.LBB119_43:
	mov	x4, rax
	mov	x5, t0
.LBB119_44:
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
	jne	x0, x2, .LBB120_6
	jmp	.LBB120_1
.LBB120_1:
	mov	r0, x9
	mov	r1, x15
	call	__bit_or
	jz	rax, .LBB120_3
	jmp	.LBB120_2
.LBB120_2:                              // %memcpy.exit38.loopexit175
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
	jmp	.LBB120_183
.LBB120_3:
	mov	r0, -1
	mov	x7, 8
	jg	x6, r0, .LBB120_5
	jmp	.LBB120_4
.LBB120_4:
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x7, 9
.LBB120_5:                              // %memcpy.exit38.loopexit
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
	jmp	.LBB120_183
.LBB120_6:
	mov	r0, x9
	mov	r1, x15
	call	__bit_or
	jnz	rax, .LBB120_26
	jmp	.LBB120_7
.LBB120_7:
	jnz	x0, .LBB120_26
	jmp	.LBB120_8
.LBB120_8:
	mov	r0, -1
	mov	x3, 0
	jg	x6, r0, .LBB120_10
	jmp	.LBB120_9
.LBB120_9:
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x3, 1
.LBB120_10:
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
	jz	x5, .LBB120_183
	jmp	.LBB120_11
.LBB120_11:
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
	jz	rax, .LBB120_15
	jmp	.LBB120_12
.LBB120_12:                             // %.preheader78.preheader
add	x4, 3
	mov	x2, x1
	mov	x0, x5
.LBB120_13:                             // %.preheader78
                                        // =>This Inner Loop Header: Depth=1
	jz	x0, .LBB120_25
	jmp	.LBB120_14
.LBB120_14:                             //   in Loop: Header=BB120_13 Depth=1
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
	jnz	rax, .LBB120_13
	jmp	.LBB120_15
.LBB120_15:                             // %.loopexit7.i
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB120_22
	jmp	.LBB120_16
.LBB120_16:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB120_18
	jmp	.LBB120_17
.LBB120_17:                             // %.preheader.i.preheader
	mov	x2, -2147483633
	jmp	.LBB120_20
.LBB120_18:                             // %.preheader432
	mov	x2, -2147483645
	jmp	.LBB120_21
.LBB120_19:
	mov	r0, 3
	jg	x0, r0, .LBB120_18
	jmp	.LBB120_22
.LBB120_20:                             // %.preheader.i
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
	jg	rax, x2, .LBB120_20
	jmp	.LBB120_19
.LBB120_21:                             // =>This Inner Loop Header: Depth=1
	mov	[x1], 808464432
add	x0, -4
	mov	r1, -2147483648
add	x1, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x2, .LBB120_21
	jmp	.LBB120_22
.LBB120_22:                             // %.loopexit5.i
	jz	x0, .LBB120_25
	jmp	.LBB120_23
.LBB120_23:                             // %.preheader.preheader
	mov	x2, x1
.LBB120_24:                             // %.preheader
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
	jnz	x0, .LBB120_24
	jmp	.LBB120_25
.LBB120_25:                             // %memset.exit
	add	x3, x5
	mov	x7, x3
	jmp	.LBB120_183
.LBB120_26:
	mov	r1, 1048576
	mov	r0, x15
	call	__bit_or
	jz	x0, .LBB120_28
	jmp	.LBB120_27
.LBB120_27:
	mov	x15, rax
.LBB120_28:
	mov	x2, -1074
	jz	x0, .LBB120_30
	jmp	.LBB120_29
.LBB120_29:
add	x0, -1075
	mov	x2, x0
.LBB120_30:
	mov	[rsp+8], x5
	mov	r0, -1
	mov	x7, 0
	jg	x6, r0, .LBB120_32
	jmp	.LBB120_31
.LBB120_31:
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	mov	x7, 1
.LBB120_32:
	mov	r0, -52
	mov	[rsp+28], x9
	mov	[rsp+32], x15
	mov	[rsp+12], x2
	jl	x2, r0, .LBB120_76
	jmp	.LBB120_33
.LBB120_33:
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
	mov	x2, mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb
	mov	x0, 99999999
	mov	x10, x8
	mov	[rsp+20], x14
	mov	[rsp+24], x4
.LBB120_34:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB120_38 Depth 2
                                        //     Child Loop BB120_66 Depth 2
                                        //     Child Loop BB120_47 Depth 2
                                        //     Child Loop BB120_50 Depth 2
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
	jnz	x3, .LBB120_39
	jmp	.LBB120_35
.LBB120_35:                             //   in Loop: Header=BB120_34 Depth=1
	mov	x3, 1
	jnz	x11, .LBB120_53
	jmp	.LBB120_36
.LBB120_36:                             //   in Loop: Header=BB120_34 Depth=1
	mov	r0, 2
	jl	x8, r0, .LBB120_76
	jmp	.LBB120_37
.LBB120_37:                             // %.preheader98.preheader
                                        //   in Loop: Header=BB120_34 Depth=1
.LBB120_38:                             // %.preheader98
                                        //   Parent Loop BB120_34 Depth=1
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
	jz	x11, .LBB120_75
	jmp	.LBB120_52
.LBB120_39:                             //   in Loop: Header=BB120_34 Depth=1
	mov	x12, x1
	add	x12, x7
	jz	x11, .LBB120_41
	jmp	.LBB120_40
.LBB120_40:                             // %memcpy.exit40
                                        //   in Loop: Header=BB120_34 Depth=1
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
	jmp	.LBB120_51
.LBB120_41:                             //   in Loop: Header=BB120_34 Depth=1
	mov	r1, 3
	mov	r0, x12
	call	__bit_and
	mov	x6, 9
	mov	x11, x12
	jz	rax, .LBB120_46
	jmp	.LBB120_42
.LBB120_42:                             // %.preheader95.preheader
                                        //   in Loop: Header=BB120_34 Depth=1
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
	jz	rax, .LBB120_46
	jmp	.LBB120_43
.LBB120_43:                             // %.preheader95.1
                                        //   in Loop: Header=BB120_34 Depth=1
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
	jz	rax, .LBB120_46
	jmp	.LBB120_44
.LBB120_44:                             // %.preheader95.2
                                        //   in Loop: Header=BB120_34 Depth=1
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
	jz	rax, .LBB120_46
	jmp	.LBB120_45
.LBB120_45:                             // %.preheader95.3
                                        //   in Loop: Header=BB120_34 Depth=1
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
.LBB120_46:                             // %.thread.preheader
                                        //   in Loop: Header=BB120_34 Depth=1
	mov	x3, -2147483645
.LBB120_47:                             // %.thread
                                        //   Parent Loop BB120_34 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	[x11], 808464432
add	x6, -4
	mov	r1, -2147483648
add	x11, 4
	mov	r0, x6
	call	__bit_xor
	jg	rax, x3, .LBB120_47
	jmp	.LBB120_48
.LBB120_48:                             // %.loopexit5.i45
                                        //   in Loop: Header=BB120_34 Depth=1
	jz	x6, .LBB120_51
	jmp	.LBB120_49
.LBB120_49:                             // %.preheader94.preheader
                                        //   in Loop: Header=BB120_34 Depth=1
	mov	x3, 0
.LBB120_50:                             // %.preheader94
                                        //   Parent Loop BB120_34 Depth=1
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
	jne	x6, x3, .LBB120_50
	jmp	.LBB120_51
.LBB120_51:                             // %memset.exit47
                                        //   in Loop: Header=BB120_34 Depth=1
add	x7, 9
	mov	x4, [rsp+24]
	jmp	.LBB120_74
.LBB120_52:                             // %.loopexit99.loopexit
                                        //   in Loop: Header=BB120_34 Depth=1
add	x8, -1
.LBB120_53:                             // %.loopexit99
                                        //   in Loop: Header=BB120_34 Depth=1
	mov	r1, -2147483648
	mov	r0, x11
	call	__bit_xor
	mov	r0, -1147483648
	jl	rax, r0, .LBB120_55
	jmp	.LBB120_54
.LBB120_54:
	call	abort
.LBB120_55:                             //   in Loop: Header=BB120_34 Depth=1
	mov	r1, 9
	jg	x11, x0, .LBB120_65
	jmp	.LBB120_56
.LBB120_56:                             //   in Loop: Header=BB120_34 Depth=1
	mov	r1, 8
	mov	r0, 9999999
	jg	x11, r0, .LBB120_65
	jmp	.LBB120_57
.LBB120_57:                             //   in Loop: Header=BB120_34 Depth=1
	mov	r1, 7
	mov	r0, 999999
	jg	x11, r0, .LBB120_65
	jmp	.LBB120_58
.LBB120_58:                             //   in Loop: Header=BB120_34 Depth=1
	mov	r1, 6
	mov	r0, 99999
	jg	x11, r0, .LBB120_65
	jmp	.LBB120_59
.LBB120_59:                             //   in Loop: Header=BB120_34 Depth=1
	mov	r1, 5
	mov	r0, 9999
	jg	x11, r0, .LBB120_65
	jmp	.LBB120_60
.LBB120_60:                             //   in Loop: Header=BB120_34 Depth=1
	mov	x4, 4
	mov	r0, 999
	jg	x11, r0, .LBB120_64
	jmp	.LBB120_61
.LBB120_61:                             //   in Loop: Header=BB120_34 Depth=1
	mov	x4, 3
	mov	r0, 99
	jg	x11, r0, .LBB120_64
	jmp	.LBB120_62
.LBB120_62:                             //   in Loop: Header=BB120_34 Depth=1
	mov	x4, 2
	mov	r0, 9
	jg	x11, r0, .LBB120_64
	jmp	.LBB120_63
.LBB120_63:                             //   in Loop: Header=BB120_34 Depth=1
	mov	x4, 1
.LBB120_64:                             //   in Loop: Header=BB120_34 Depth=1
	mov	x12, 0
	jmp	.LBB120_68
.LBB120_65:                             //   in Loop: Header=BB120_34 Depth=1
	mov	x15, [rsp+4]
	mov	[rsp+36], x7
	add	x15, x7
	mov	[rsp+16], r1
	add	x15, r1
	mov	x4, 0
.LBB120_66:                             // %memcpy.exit48
                                        //   Parent Loop BB120_34 Depth=1
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
	jg	x12, x0, .LBB120_66
	jmp	.LBB120_67
.LBB120_67:                             // %.loopexit97.loopexit
                                        //   in Loop: Header=BB120_34 Depth=1
	mov	x12, 0
	sub	x12, x4
	mov	x7, [rsp+36]
	mov	x9, [rsp+28]
	mov	x15, [rsp+32]
	mov	x4, [rsp+16]
.LBB120_68:                             // %.loopexit97
                                        //   in Loop: Header=BB120_34 Depth=1
	mov	x14, x1
	add	x14, x7
	mov	r0, 100
	jl	x11, r0, .LBB120_70
	jmp	.LBB120_69
.LBB120_69:                             // %memcpy.exit50
                                        //   in Loop: Header=BB120_34 Depth=1
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
.LBB120_70:                             //   in Loop: Header=BB120_34 Depth=1
	mov	r0, 10
	jl	x11, r0, .LBB120_72
	jmp	.LBB120_71
.LBB120_71:                             // %memcpy.exit51.loopexit
                                        //   in Loop: Header=BB120_34 Depth=1
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
	jmp	.LBB120_73
.LBB120_72:                             //   in Loop: Header=BB120_34 Depth=1
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
.LBB120_73:                             // %memcpy.exit51
                                        //   in Loop: Header=BB120_34 Depth=1
	add	x7, x4
	mov	x14, [rsp+20]
	mov	x4, [rsp+24]
.LBB120_74:                             //   in Loop: Header=BB120_34 Depth=1
	mov	x3, 1
	mov	r0, x8
	mov	x8, x10
	jg	r0, x3, .LBB120_34
	jmp	.LBB120_77
.LBB120_75:                             //   in Loop: Header=BB120_38 Depth=2
add	x8, -1
	jg	x8, x3, .LBB120_38
	jmp	.LBB120_76
.LBB120_76:                             // %.loopexit100
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
.LBB120_77:                             // %.loopexit102
	mov	x2, [rsp+8]
	jz	x2, .LBB120_79
	jmp	.LBB120_78
.LBB120_78:
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
.LBB120_79:
	mov	r0, -1
	mov	x3, [rsp+12]
	jg	x3, r0, .LBB120_168
	jmp	.LBB120_80
.LBB120_80:
	mov	r0, -52
	jl	x3, r0, .LBB120_82
	jmp	.LBB120_81
.LBB120_81:
	mov	r1, 9
	mov	r0, x2
	call	__udivsi3
	mov	x13, rax
	mov	x9, 0
	jmp	.LBB120_100
.LBB120_82:
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
	jge	x13, x5, .LBB120_98
	jmp	.LBB120_83
.LBB120_83:
	mov	x3, x1
	mov	x7, x0
	add	x3, x7
	mov	r1, 3
	mov	r0, x3
	call	__bit_and
	mov	x4, x2
	jz	rax, .LBB120_87
	jmp	.LBB120_84
.LBB120_84:                             // %.preheader81.preheader
	add	x1, x7
add	x1, 1
	mov	x0, x3
	mov	x4, x2
.LBB120_85:                             // %.preheader81
                                        // =>This Inner Loop Header: Depth=1
	jz	x4, .LBB120_97
	jmp	.LBB120_86
.LBB120_86:                             //   in Loop: Header=BB120_85 Depth=1
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
	jnz	rax, .LBB120_85
	jmp	.LBB120_87
.LBB120_87:                             // %.loopexit7.i52
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB120_94
	jmp	.LBB120_88
.LBB120_88:
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB120_90
	jmp	.LBB120_89
.LBB120_89:                             // %.preheader.i54.preheader
	mov	x0, -2147483633
	jmp	.LBB120_92
.LBB120_90:                             // %.preheader440
	mov	x0, -2147483645
	jmp	.LBB120_93
.LBB120_91:
	mov	r0, 3
	jg	x4, r0, .LBB120_90
	jmp	.LBB120_94
.LBB120_92:                             // %.preheader.i54
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
	jg	rax, x0, .LBB120_92
	jmp	.LBB120_91
.LBB120_93:                             // =>This Inner Loop Header: Depth=1
	mov	[x3], 808464432
add	x4, -4
	mov	r1, -2147483648
add	x3, 4
	mov	r0, x4
	call	__bit_xor
	jg	rax, x0, .LBB120_93
	jmp	.LBB120_94
.LBB120_94:                             // %.loopexit5.i53
	jz	x4, .LBB120_97
	jmp	.LBB120_95
.LBB120_95:                             // %.preheader80.preheader
	mov	x0, x3
.LBB120_96:                             // %.preheader80
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
	jnz	x4, .LBB120_96
	jmp	.LBB120_97
.LBB120_97:                             // %memset.exit55
	add	x7, x2
	jmp	.LBB120_183
.LBB120_98:
	mov	x9, 0
	mov	x7, x0
	jz	x5, .LBB120_100
	jmp	.LBB120_99
.LBB120_99:
	mov	r0, x1
	add	r0, x7
	mov	x6, x5
	mul	x6, 9
	mov	r1, 48
	mov	r2, x6
	call	memset
	add	x7, x6
	mov	x9, x5
.LBB120_100:
	mov	x2, 0
	sub	x2, x3
	jge	x9, x13, .LBB120_102
	jmp	.LBB120_101
.LBB120_101:
	mov	r0, x9
	mul	r0, 9
add	r0, 9
	jg	r0, x2, .LBB120_103
	jmp	.LBB120_102
.LBB120_102:
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
	jmp	.LBB120_118
.LBB120_103:                            // %.loopexit90
	mul	x9, -9
	mov	x3, x1
	add	x3, x7
	mov	r1, 3
	mov	r0, [rsp+8]
	add	x9, r0
	mov	r0, x3
	call	__bit_and
	mov	x2, x9
	jz	rax, .LBB120_107
	jmp	.LBB120_104
.LBB120_104:                            // %.preheader84.preheader
	add	x1, x7
add	x1, 1
	mov	x0, x3
	mov	x2, x9
.LBB120_105:                            // %.preheader84
                                        // =>This Inner Loop Header: Depth=1
	jz	x2, .LBB120_117
	jmp	.LBB120_106
.LBB120_106:                            //   in Loop: Header=BB120_105 Depth=1
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
	jnz	rax, .LBB120_105
	jmp	.LBB120_107
.LBB120_107:                            // %.loopexit7.i56
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB120_114
	jmp	.LBB120_108
.LBB120_108:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB120_110
	jmp	.LBB120_109
.LBB120_109:                            // %.preheader.i58.preheader
	mov	x0, -2147483633
	jmp	.LBB120_112
.LBB120_110:                            // %.preheader450
	mov	x0, -2147483645
	jmp	.LBB120_113
.LBB120_111:
	mov	r0, 3
	jg	x2, r0, .LBB120_110
	jmp	.LBB120_114
.LBB120_112:                            // %.preheader.i58
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
	jg	rax, x0, .LBB120_112
	jmp	.LBB120_111
.LBB120_113:                            // =>This Inner Loop Header: Depth=1
	mov	[x3], 808464432
add	x2, -4
	mov	r1, -2147483648
add	x3, 4
	mov	r0, x2
	call	__bit_xor
	jg	rax, x0, .LBB120_113
	jmp	.LBB120_114
.LBB120_114:                            // %.loopexit5.i57
	jz	x2, .LBB120_117
	jmp	.LBB120_115
.LBB120_115:                            // %.preheader83.preheader
	mov	x0, x3
.LBB120_116:                            // %.preheader83
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
	jnz	x2, .LBB120_116
	jmp	.LBB120_117
.LBB120_117:                            // %memset.exit59
	add	x7, x9
	jmp	.LBB120_183
.LBB120_118:                            // =>This Loop Header: Depth=1
                                        //     Child Loop BB120_127 Depth 2
                                        //     Child Loop BB120_130 Depth 2
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
	je	r0, x13, .LBB120_131
	jmp	.LBB120_119
.LBB120_119:                            //   in Loop: Header=BB120_118 Depth=1
	mov	x11, x1
	mov	x7, [rsp+36]
	add	x11, x7
	jz	rax, .LBB120_121
	jmp	.LBB120_120
.LBB120_120:                            // %memcpy.exit60
                                        //   in Loop: Header=BB120_118 Depth=1
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
	mov	x8, mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb
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
	jmp	.LBB120_149
.LBB120_121:                            //   in Loop: Header=BB120_118 Depth=1
	mov	r1, 3
	mov	r0, x11
	call	__bit_and
	mov	x6, 9
	mov	x10, x11
	jz	rax, .LBB120_126
	jmp	.LBB120_122
.LBB120_122:                            // %.preheader88.preheader
                                        //   in Loop: Header=BB120_118 Depth=1
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
	jz	rax, .LBB120_126
	jmp	.LBB120_123
.LBB120_123:                            // %.preheader88.1
                                        //   in Loop: Header=BB120_118 Depth=1
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
	jz	rax, .LBB120_126
	jmp	.LBB120_124
.LBB120_124:                            // %.preheader88.2
                                        //   in Loop: Header=BB120_118 Depth=1
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
	jz	rax, .LBB120_126
	jmp	.LBB120_125
.LBB120_125:                            // %.preheader88.3
                                        //   in Loop: Header=BB120_118 Depth=1
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
.LBB120_126:                            // %.thread73.preheader
                                        //   in Loop: Header=BB120_118 Depth=1
	mov	x15, [rsp+32]
	mov	x3, [rsp+20]
	mov	x0, -2147483645
.LBB120_127:                            // %.thread73
                                        //   Parent Loop BB120_118 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	[x10], 808464432
add	x6, -4
	mov	r1, -2147483648
add	x10, 4
	mov	r0, x6
	call	__bit_xor
	jg	rax, x0, .LBB120_127
	jmp	.LBB120_128
.LBB120_128:                            // %.loopexit5.i65
                                        //   in Loop: Header=BB120_118 Depth=1
	jz	x6, .LBB120_149
	jmp	.LBB120_129
.LBB120_129:                            // %.preheader87.preheader
                                        //   in Loop: Header=BB120_118 Depth=1
	mov	x0, 0
.LBB120_130:                            // %.preheader87
                                        //   Parent Loop BB120_118 Depth=1
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
	je	x6, x0, .LBB120_149
	jmp	.LBB120_130
.LBB120_131:
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
	je	x13, r1, .LBB120_135
	jmp	.LBB120_132
.LBB120_132:
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
	jmp	.LBB120_134
.LBB120_133:
	mov	x7, rax
	mov	r0, rax
	mul	r0, -10
	add	r0, x6
	mov	r1, 5
	je	r0, r1, .LBB120_136
	jmp	.LBB120_135
.LBB120_134:                            // =>This Inner Loop Header: Depth=1
	mov	r1, 10
	mov	x6, rax
	mov	r0, x6
	call	__udivsi3
add	x5, -1
	jz	x5, .LBB120_133
	jmp	.LBB120_134
.LBB120_135:
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
	jmp	.LBB120_142
.LBB120_136:
	mov	r0, x3
	call	__bit_not
	mov	x5, rax
	sub	x5, x10
	mov	r0, 1
	mov	x2, 2
	jl	x5, r0, .LBB120_142
	jmp	.LBB120_137
.LBB120_137:
	mov	r0, 59
	mov	x2, 1
	jg	x5, r0, .LBB120_142
	jmp	.LBB120_138
.LBB120_138:
	mov	r0, x8
	mov	r1, x9
	call	__bit_or
	jnz	rax, .LBB120_140
	jmp	.LBB120_139
.LBB120_139:
	call	abort
.LBB120_140:
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
	jz	rax, .LBB120_142
	jmp	.LBB120_141
.LBB120_141:
	mov	x2, 1
.LBB120_142:
	jz	x13, .LBB120_151
	jmp	.LBB120_143
.LBB120_143:
	mov	x10, x13
add	x10, -1
	mov	x3, 0
	mov	x5, x7
	jz	x10, .LBB120_146
	jmp	.LBB120_144
.LBB120_144:
	mov	x8, mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb
	mov	x6, x5
.LBB120_145:                            // %memcpy.exit68
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
	jl	rax, x0, .LBB120_145
	jmp	.LBB120_146
.LBB120_146:                            // %.loopexit
	mov	x6, x5
	mov	r1, -2147483648
	mov	r0, x13
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x3
	call	__bit_xor
	mov	x4, [rsp+36]
	jge	rax, x0, .LBB120_148
	jmp	.LBB120_147
.LBB120_147:
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
.LBB120_148:
	add	x4, x13
	mov	[rsp+36], x4
	jmp	.LBB120_151
.LBB120_149:                            // %memset.exit67
                                        //   in Loop: Header=BB120_118 Depth=1
add	x7, 9
add	x3, 9
	mov	x2, [rsp+16]
	jge	x9, x13, .LBB120_118
	jmp	.LBB120_150
.LBB120_150:                            // %memset.exit67
                                        //   in Loop: Header=BB120_118 Depth=1
	mov	r0, x9
	mul	r0, 9
add	r0, 9
	jg	r0, x2, .LBB120_103
	jmp	.LBB120_118
.LBB120_151:
	mov	x7, [rsp+36]
	jz	x2, .LBB120_183
	jmp	.LBB120_152
.LBB120_152:
	jz	x7, .LBB120_154
	jmp	.LBB120_153
.LBB120_153:                            // %.preheader86.preheader
	mov	x9, x1
add	x9, -1
	mov	x0, 0
	mov	x5, 46
	mov	x6, 57
	mov	x8, x7
	jmp	.LBB120_155
.LBB120_154:
	mov	r0, [x1]
	mov	r1, -256
	call	__bit_and
	mov	r1, 49
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	jmp	.LBB120_162
.LBB120_155:                            // %.preheader86
                                        // =>This Inner Loop Header: Depth=1
	mov	x3, x9
	add	x3, x8
	mov	r0, [x3]
	mov	r1, 255
add	x7, -1
	call	__bit_and
	je	rax, x5, .LBB120_158
	jmp	.LBB120_156
.LBB120_156:                            // %.preheader86
                                        //   in Loop: Header=BB120_155 Depth=1
	je	rax, x6, .LBB120_163
	jmp	.LBB120_157
.LBB120_157:                            // %.preheader86
	mov	r0, 45
	je	rax, r0, .LBB120_159
	jmp	.LBB120_164
.LBB120_158:                            // %.preheader86._crit_edge27
                                        //   in Loop: Header=BB120_155 Depth=1
	mov	x0, x7
	jmp	.LBB120_167
.LBB120_159:                            // %.preheader86._crit_edge
	mov	x3, x8
.LBB120_160:
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
	jl	x0, r0, .LBB120_162
	jmp	.LBB120_161
.LBB120_161:
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
.LBB120_162:
	add	x1, x7
	mov	r0, [x1]
	mov	r1, -256
add	x7, 1
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x1], rax
	jmp	.LBB120_183
.LBB120_163:                            //   in Loop: Header=BB120_155 Depth=1
	mov	r0, [x3]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x3], rax
	mov	x2, 1
	jmp	.LBB120_167
.LBB120_164:
	mov	r1, 1
	mov	x1, rax
	mov	r0, rax
	call	__bit_and
	mov	r0, 2
	mov	x7, [rsp+36]
	jne	x2, r0, .LBB120_166
	jmp	.LBB120_165
.LBB120_165:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB120_183
	jmp	.LBB120_166
.LBB120_166:
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
	jmp	.LBB120_183
.LBB120_167:                            //   in Loop: Header=BB120_155 Depth=1
	mov	x3, 0
	mov	x8, x7
	jz	x7, .LBB120_160
	jmp	.LBB120_155
.LBB120_168:
	mov	x3, x1
	add	x3, x7
	mov	r1, 3
	mov	r0, x3
	call	__bit_and
	mov	x4, x2
	jz	rax, .LBB120_172
	jmp	.LBB120_169
.LBB120_169:                            // %.preheader92.preheader
	add	x1, x7
add	x1, 1
	mov	x0, x3
	mov	x4, x2
.LBB120_170:                            // %.preheader92
                                        // =>This Inner Loop Header: Depth=1
	jz	x4, .LBB120_182
	jmp	.LBB120_171
.LBB120_171:                            //   in Loop: Header=BB120_170 Depth=1
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
	jnz	rax, .LBB120_170
	jmp	.LBB120_172
.LBB120_172:                            // %.loopexit7.i69
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB120_179
	jmp	.LBB120_173
.LBB120_173:
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB120_175
	jmp	.LBB120_174
.LBB120_174:                            // %.preheader.i71.preheader
	mov	x0, -2147483633
	jmp	.LBB120_177
.LBB120_175:                            // %.preheader481
	mov	x0, -2147483645
	jmp	.LBB120_178
.LBB120_176:
	mov	r0, 3
	jg	x4, r0, .LBB120_175
	jmp	.LBB120_179
.LBB120_177:                            // %.preheader.i71
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
	jg	rax, x0, .LBB120_177
	jmp	.LBB120_176
.LBB120_178:                            // =>This Inner Loop Header: Depth=1
	mov	[x3], 808464432
add	x4, -4
	mov	r1, -2147483648
add	x3, 4
	mov	r0, x4
	call	__bit_xor
	jg	rax, x0, .LBB120_178
	jmp	.LBB120_179
.LBB120_179:                            // %.loopexit5.i70
	jz	x4, .LBB120_182
	jmp	.LBB120_180
.LBB120_180:                            // %.preheader91.preheader
	mov	x0, x3
.LBB120_181:                            // %.preheader91
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
	jnz	x4, .LBB120_181
	jmp	.LBB120_182
.LBB120_182:                            // %memset.exit72
	add	x7, x2
.LBB120_183:                            // %memcpy.exit38
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
	jg	x2, r0, .LBB121_2
	jmp	.LBB121_1
.LBB121_1:
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
	jmp	.LBB121_19
.LBB121_2:
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
	jz	x1, .LBB121_9
	jmp	.LBB121_3
.LBB121_3:
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
.LBB121_4:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 1
	mov	r0, x1
	call	__bit_and
	jz	rax, .LBB121_6
	jmp	.LBB121_5
.LBB121_5:                              //   in Loop: Header=BB121_4 Depth=1
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
.LBB121_6:                              //   in Loop: Header=BB121_4 Depth=1
	mov	r1, 1
	mov	r0, x1
	call	__bit_shr
	mov	x1, rax
	jz	x1, .LBB121_8
	jmp	.LBB121_7
.LBB121_7:                              //   in Loop: Header=BB121_4 Depth=1
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
	jmp	.LBB121_4
.LBB121_8:
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
.LBB121_9:
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
	jne	rax, r0, .LBB121_13
	jmp	.LBB121_10
.LBB121_10:
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
	jnz	rax, .LBB121_13
	jmp	.LBB121_11
.LBB121_11:
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
	jnz	rax, .LBB121_13
	jmp	.LBB121_12
.LBB121_12:
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
.LBB121_13:
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
	jnz	rax, .LBB121_17
	jmp	.LBB121_14
.LBB121_14:
	mov	r1, 1000000000
	mov	r0, x6
	call	__bit_xor
	mov	r0, rax
	mov	r1, x5
	call	__bit_or
	jnz	rax, .LBB121_16
	jmp	.LBB121_15
.LBB121_15:
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
	jz	r0, .LBB121_18
	jmp	.LBB121_17
.LBB121_16:
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
	jnz	r0, .LBB121_18
	jmp	.LBB121_17
.LBB121_17:
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
.LBB121_18:
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
.LBB121_19:
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
	jz	x0, .LBB122_17
	jmp	.LBB122_1
.LBB122_1:
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
	jg	rax, r0, .LBB122_17
	jmp	.LBB122_2
.LBB122_2:
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
	jnz	x8, .LBB122_6
	jmp	.LBB122_3
.LBB122_3:
	mov	r0, 191
	mov	x9, x14
	mov	x14, 0
	jg	x0, r0, .LBB122_17
	jmp	.LBB122_4
.LBB122_4:
	mov	r0, x6
add	r0, 8
	mov	r1, x6
add	r1, 12
	mov	x2, [r1]
	mov	x3, [r0]
	mov	r0, 127
	jg	x0, r0, .LBB122_17
	jmp	.LBB122_5
.LBB122_5:
	mov	r0, x6
add	r0, 16
add	x6, 20
	mov	x11, [x6]
	mov	x12, [r0]
	jmp	.LBB122_17
.LBB122_6:
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
	je	x9, x15, .LBB122_8
	jmp	.LBB122_7
.LBB122_7:
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
.LBB122_8:
	mov	r0, 191
	mov	x3, 0
	mov	x12, 0
	mov	x11, 0
	mov	r1, [rsp+24]
	jg	r1, r0, .LBB122_15
	jmp	.LBB122_9
.LBB122_9:
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
	je	x13, x9, .LBB122_11
	jmp	.LBB122_10
.LBB122_10:
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
	jg	r1, r0, .LBB122_15
	jmp	.LBB122_13
.LBB122_11:
	mov	x13, 0
	mov	r0, 127
	mov	x14, 0
	mov	x12, 0
	mov	x9, [rsp+28]
	mov	r1, [rsp+24]
	jg	r1, r0, .LBB122_17
	jmp	.LBB122_12
.LBB122_12:
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
	jmp	.LBB122_14
.LBB122_13:
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
	je	r1, r0, .LBB122_17
	jmp	.LBB122_14
.LBB122_14:
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
.LBB122_15:
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
	jz	r0, .LBB122_17
	jmp	.LBB122_16
.LBB122_16:
	mov	x13, 0
	mov	x14, 0
.LBB122_17:
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
.LBB123_1:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 1
	mov	r0, x2
	call	__bit_and
	jz	rax, .LBB123_3
	jmp	.LBB123_2
.LBB123_2:                              //   in Loop: Header=BB123_1 Depth=1
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
.LBB123_3:                              //   in Loop: Header=BB123_1 Depth=1
	mov	r1, 1
	mov	r0, x2
	call	__bit_shr
	mov	x2, rax
	jz	x2, .LBB123_5
	jmp	.LBB123_4
.LBB123_4:                              //   in Loop: Header=BB123_1 Depth=1
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
	jmp	.LBB123_1
.LBB123_5:
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
	jnz	rax, .LBB123_9
	jmp	.LBB123_6
.LBB123_6:
	mov	r1, 1000000000
	mov	r0, x6
	call	__bit_xor
	mov	r0, rax
	mov	r1, x5
	call	__bit_or
	jnz	rax, .LBB123_8
	jmp	.LBB123_7
.LBB123_7:
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
	jz	r0, .LBB123_10
	jmp	.LBB123_9
.LBB123_8:
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
	jnz	r0, .LBB123_10
	jmp	.LBB123_9
.LBB123_9:
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
.LBB123_10:
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
	jl	x1, r0, .LBB124_3
	jmp	.LBB124_1
.LBB124_1:
	mov	r0, rax
	mov	r1, x0
	call	__bit_or
	jz	rax, .LBB124_3
	jmp	.LBB124_2
.LBB124_2:
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
.LBB124_3:
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
	jnz	rax, .LBB125_2
	jmp	.LBB125_1
.LBB125_1:
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
	jmp	.LBB125_41
.LBB125_2:
	mov	x4, [x1]
	mov	r0, 1
	jl	x4, r0, .LBB125_20
	jmp	.LBB125_3
.LBB125_3:
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
	jg	x4, r0, .LBB125_19
	jmp	.LBB125_4
.LBB125_4:
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
	jnz	x10, .LBB125_8
	jmp	.LBB125_5
.LBB125_5:
	mov	[x5], x8
	mov	r0, 191
	mov	[x2], x7
	jg	x4, r0, .LBB125_19
	jmp	.LBB125_6
.LBB125_6:
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
	jg	x4, r0, .LBB125_19
	jmp	.LBB125_7
.LBB125_7:
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
	jmp	.LBB125_19
.LBB125_8:
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
	je	x12, x14, .LBB125_10
	jmp	.LBB125_9
.LBB125_9:
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
.LBB125_10:
	mov	[x5], x7
	mov	r0, 191
	mov	[x2], x8
	mov	x13, [rsp+28]
	jg	x4, r0, .LBB125_17
	jmp	.LBB125_11
.LBB125_11:
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
	je	x12, x5, .LBB125_13
	jmp	.LBB125_12
.LBB125_12:
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
.LBB125_13:
	mov	[x1], x8
	mov	r0, 127
	mov	r1, [rsp+16]
	mov	[r1], x9
	jg	x4, r0, .LBB125_17
	jmp	.LBB125_14
.LBB125_14:
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
	je	x12, x2, .LBB125_16
	jmp	.LBB125_15
.LBB125_15:
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
.LBB125_16:
	mov	r0, [rsp+12]
	mov	[r0], x7
	mov	r0, [rsp+8]
	mov	[r0], x8
.LBB125_17:
	jnz	x12, .LBB125_19
	jmp	.LBB125_18
.LBB125_18:
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
.LBB125_19:
	jmp	.LBB125_41
.LBB125_20:
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
	jg	x5, r0, .LBB125_40
	jmp	.LBB125_21
.LBB125_21:
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
	jnz	x10, .LBB125_27
	jmp	.LBB125_22
.LBB125_22:
	mov	[x0], x8
	mov	r0, 191
	mov	[x4], x7
	jg	x5, r0, .LBB125_25
	jmp	.LBB125_23
.LBB125_23:
	mov	r0, r2
	mov	r1, r2
add	r1, 12
	mov	r1, [r1]
add	r0, 8
	mov	r0, [r0]
	mov	[x2], r1
	mov	r1, 127
	mov	[x1], r0
	jg	x5, r1, .LBB125_25
	jmp	.LBB125_24
.LBB125_24:
	mov	r0, r2
add	r0, 16
add	r2, 20
	mov	r1, [r2]
	mov	r0, [r0]
	mov	[x6], r1
	mov	[x9], r0
.LBB125_25:
	jnz	x13, .LBB125_40
	jmp	.LBB125_26
.LBB125_26:
	mov	r0, rsp
add	r0, 60
	mov	r1, rsp
add	r1, 64
	mov	rax, [r1]
	mov	x0, [r0]
	jmp	.LBB125_39
.LBB125_27:
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
	je	x13, x3, .LBB125_29
	jmp	.LBB125_28
.LBB125_28:
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
.LBB125_29:
	mov	[x0], x7
	mov	r0, 191
	mov	[x4], x8
	jg	x5, r0, .LBB125_37
	jmp	.LBB125_30
.LBB125_30:
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
	je	x0, x12, .LBB125_32
	jmp	.LBB125_31
.LBB125_31:
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
	jg	x5, r0, .LBB125_37
	jmp	.LBB125_34
.LBB125_32:
	mov	[x2], x10
	mov	r0, 127
	mov	[x1], x9
	jg	x5, r0, .LBB125_40
	jmp	.LBB125_33
.LBB125_33:
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
	jmp	.LBB125_35
.LBB125_34:
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
	je	x13, r0, .LBB125_36
	jmp	.LBB125_35
.LBB125_35:
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
.LBB125_36:
	mov	r0, [rsp+12]
	mov	[r0], x5
	mov	r0, [rsp+8]
	mov	[r0], x0
.LBB125_37:
	jnz	x13, .LBB125_40
	jmp	.LBB125_38
.LBB125_38:
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
.LBB125_39:
	mov	[x15], rax
	mov	[x14], x0
.LBB125_40:
.LBB125_41:
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
	jne	x2, x0, .LBB128_6
	jmp	.LBB128_1
.LBB128_1:
	mov	r0, x4
	mov	r1, x7
	call	__bit_or
	jz	rax, .LBB128_3
	jmp	.LBB128_2
.LBB128_2:                              // %memcpy.exit63.loopexit184
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
	jmp	.LBB128_201
.LBB128_3:
	mov	r0, -1
	mov	x7, 8
	jg	x1, r0, .LBB128_5
	jmp	.LBB128_4
.LBB128_4:
	mov	r0, [x15]
	mov	r1, -256
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x15], rax
	mov	x7, 9
.LBB128_5:                              // %memcpy.exit63.loopexit
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
	jmp	.LBB128_201
.LBB128_6:
	mov	r0, x4
	mov	r1, x7
	call	__bit_or
	jnz	rax, .LBB128_27
	jmp	.LBB128_7
.LBB128_7:
	jnz	x2, .LBB128_27
	jmp	.LBB128_8
.LBB128_8:
	mov	r0, -1
	mov	x2, 0
	jg	x1, r0, .LBB128_10
	jmp	.LBB128_9
.LBB128_9:
	mov	r0, [x15]
	mov	r1, -256
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x15], rax
	mov	x2, 1
.LBB128_10:
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
	jz	x6, .LBB128_26
	jmp	.LBB128_11
.LBB128_11:
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
	jz	rax, .LBB128_15
	jmp	.LBB128_12
.LBB128_12:                             // %.preheader101.preheader
add	x5, 3
	mov	x0, x3
	mov	x4, x6
.LBB128_13:                             // %.preheader101
                                        // =>This Inner Loop Header: Depth=1
	jz	x4, .LBB128_25
	jmp	.LBB128_14
.LBB128_14:                             //   in Loop: Header=BB128_13 Depth=1
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
	jnz	rax, .LBB128_13
	jmp	.LBB128_15
.LBB128_15:                             // %.loopexit7.i
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB128_22
	jmp	.LBB128_16
.LBB128_16:
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB128_18
	jmp	.LBB128_17
.LBB128_17:                             // %.preheader.i.preheader
	mov	x0, -2147483633
	jmp	.LBB128_20
.LBB128_18:                             // %.preheader418
	mov	x0, -2147483645
	jmp	.LBB128_21
.LBB128_19:
	mov	r0, 3
	jg	x4, r0, .LBB128_18
	jmp	.LBB128_22
.LBB128_20:                             // %.preheader.i
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
	jg	rax, x0, .LBB128_20
	jmp	.LBB128_19
.LBB128_21:                             // =>This Inner Loop Header: Depth=1
	mov	[x3], 808464432
add	x4, -4
	mov	r1, -2147483648
add	x3, 4
	mov	r0, x4
	call	__bit_xor
	jg	rax, x0, .LBB128_21
	jmp	.LBB128_22
.LBB128_22:                             // %.loopexit5.i
	jz	x4, .LBB128_25
	jmp	.LBB128_23
.LBB128_23:                             // %.preheader.preheader
	mov	x0, x3
.LBB128_24:                             // %.preheader
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
	jnz	x4, .LBB128_24
	jmp	.LBB128_25
.LBB128_25:                             // %memset.exit
	add	x1, x6
	mov	x7, x1
.LBB128_26:                             // %memcpy.exit65
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
	jmp	.LBB128_201
.LBB128_27:
	mov	r1, 1048576
	mov	r0, x7
	call	__bit_or
	jz	x2, .LBB128_29
	jmp	.LBB128_28
.LBB128_28:
	mov	x7, rax
.LBB128_29:
	mov	x0, -1074
	jz	x2, .LBB128_31
	jmp	.LBB128_30
.LBB128_30:
add	x2, -1075
	mov	x0, x2
.LBB128_31:
	mov	r0, -1
	mov	x14, 0
	jg	x1, r0, .LBB128_33
	jmp	.LBB128_32
.LBB128_32:
	mov	r0, [x15]
	mov	r1, -256
	call	__bit_and
	mov	r1, 45
	mov	r0, rax
	call	__bit_or
	mov	[x15], rax
	mov	x14, 1
.LBB128_33:
	mov	r1, x6
	mov	r0, -52
add	r1, 1
	mov	[rsp+44], r1
	mov	[rsp+24], x15
	mov	[rsp+28], x4
	mov	[rsp+36], x7
	mov	[rsp+12], x6
	mov	[rsp+4], x0
	jl	x0, r0, .LBB128_79
	jmp	.LBB128_34
.LBB128_34:
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
	mov	x5, mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb
	mov	x3, -2147483645
	mov	x12, 0
.LBB128_35:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB128_45 Depth 2
                                        //     Child Loop BB128_48 Depth 2
                                        //     Child Loop BB128_66 Depth 2
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
	jz	x9, .LBB128_50
	jmp	.LBB128_36
.LBB128_36:                             //   in Loop: Header=BB128_35 Depth=1
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
	jg	rax, x2, .LBB128_76
	jmp	.LBB128_37
.LBB128_37:                             //   in Loop: Header=BB128_35 Depth=1
	mov	x13, x15
	mov	x9, x14
	add	x13, x14
	jz	x8, .LBB128_39
	jmp	.LBB128_38
.LBB128_38:                             // %memcpy.exit66
                                        //   in Loop: Header=BB128_35 Depth=1
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
	jmp	.LBB128_49
.LBB128_39:                             //   in Loop: Header=BB128_35 Depth=1
	mov	r1, 3
	mov	r0, x13
	call	__bit_and
	mov	x14, 9
	mov	x8, x13
	jz	rax, .LBB128_44
	jmp	.LBB128_40
.LBB128_40:                             // %.preheader117.preheader
                                        //   in Loop: Header=BB128_35 Depth=1
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
	jz	rax, .LBB128_44
	jmp	.LBB128_41
.LBB128_41:                             // %.preheader117.1
                                        //   in Loop: Header=BB128_35 Depth=1
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
	jz	rax, .LBB128_44
	jmp	.LBB128_42
.LBB128_42:                             // %.preheader117.2
                                        //   in Loop: Header=BB128_35 Depth=1
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
	jz	rax, .LBB128_44
	jmp	.LBB128_43
.LBB128_43:                             // %.preheader117.3
                                        //   in Loop: Header=BB128_35 Depth=1
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
.LBB128_44:                             // %.thread.preheader
                                        //   in Loop: Header=BB128_35 Depth=1
.LBB128_45:                             // %.thread
                                        //   Parent Loop BB128_35 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	[x8], 808464432
add	x14, -4
	mov	r1, -2147483648
add	x8, 4
	mov	r0, x14
	call	__bit_xor
	jg	rax, x3, .LBB128_45
	jmp	.LBB128_46
.LBB128_46:                             // %.loopexit5.i71
                                        //   in Loop: Header=BB128_35 Depth=1
	jz	x14, .LBB128_49
	jmp	.LBB128_47
.LBB128_47:                             // %.preheader116.preheader
                                        //   in Loop: Header=BB128_35 Depth=1
	mov	x0, 0
.LBB128_48:                             // %.preheader116
                                        //   Parent Loop BB128_35 Depth=1
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
	jne	x14, x0, .LBB128_48
	jmp	.LBB128_49
.LBB128_49:                             // %memset.exit73
                                        //   in Loop: Header=BB128_35 Depth=1
	mov	x14, x9
add	x14, 9
	jmp	.LBB128_77
.LBB128_50:                             //   in Loop: Header=BB128_35 Depth=1
	mov	x10, 0
	jz	x8, .LBB128_77
	jmp	.LBB128_51
.LBB128_51:                             //   in Loop: Header=BB128_35 Depth=1
	mov	r1, -2147483648
	mov	r0, x8
	call	__bit_xor
	mov	r0, -1147483648
	jl	rax, r0, .LBB128_53
	jmp	.LBB128_52
.LBB128_52:
	call	abort
.LBB128_53:                             //   in Loop: Header=BB128_35 Depth=1
	mov	x13, 9
	jg	x8, x6, .LBB128_62
	jmp	.LBB128_54
.LBB128_54:                             //   in Loop: Header=BB128_35 Depth=1
	mov	x13, 8
	mov	r0, 9999999
	jg	x8, r0, .LBB128_62
	jmp	.LBB128_55
.LBB128_55:                             //   in Loop: Header=BB128_35 Depth=1
	mov	x13, 7
	mov	r0, 999999
	jg	x8, r0, .LBB128_62
	jmp	.LBB128_56
.LBB128_56:                             //   in Loop: Header=BB128_35 Depth=1
	mov	x13, 6
	mov	r0, 99999
	jg	x8, r0, .LBB128_62
	jmp	.LBB128_57
.LBB128_57:                             //   in Loop: Header=BB128_35 Depth=1
	mov	x13, 5
	mov	r0, 9999
	jg	x8, r0, .LBB128_62
	jmp	.LBB128_58
.LBB128_58:                             //   in Loop: Header=BB128_35 Depth=1
	mov	x13, 4
	mov	r0, 999
	jg	x8, r0, .LBB128_62
	jmp	.LBB128_59
.LBB128_59:                             //   in Loop: Header=BB128_35 Depth=1
	mov	x13, 3
	mov	r0, 99
	jg	x8, r0, .LBB128_62
	jmp	.LBB128_60
.LBB128_60:                             //   in Loop: Header=BB128_35 Depth=1
	mov	x13, 2
	mov	r0, 9
	jg	x8, r0, .LBB128_62
	jmp	.LBB128_61
.LBB128_61:                             //   in Loop: Header=BB128_35 Depth=1
	mov	x13, 1
.LBB128_62:                             //   in Loop: Header=BB128_35 Depth=1
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
	jg	rax, x2, .LBB128_76
	jmp	.LBB128_63
.LBB128_63:                             //   in Loop: Header=BB128_35 Depth=1
	mov	[rsp+8], x1
	mov	r0, [rsp+12]
	jz	r0, .LBB128_74
	jmp	.LBB128_64
.LBB128_64:                             //   in Loop: Header=BB128_35 Depth=1
	mov	[rsp+16], x12
	mov	x12, x15
	add	x12, x14
	mov	x6, 0
	mov	x4, x12
	add	x4, x13
	mov	r0, 10000
	jl	x8, r0, .LBB128_68
	jmp	.LBB128_65
.LBB128_65:                             //   in Loop: Header=BB128_35 Depth=1
	mov	[rsp+40], x14
	mov	x0, 0
	mov	x1, 99999999
.LBB128_66:                             // %memcpy.exit74
                                        //   Parent Loop BB128_35 Depth=1
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
	jg	x10, x1, .LBB128_66
	jmp	.LBB128_67
.LBB128_67:                             // %.loopexit115.loopexit
                                        //   in Loop: Header=BB128_35 Depth=1
	mov	x6, 0
	sub	x6, x0
	mov	x15, [rsp+24]
	mov	x14, [rsp+40]
	mov	x7, [rsp+36]
.LBB128_68:                             // %.loopexit115
                                        //   in Loop: Header=BB128_35 Depth=1
	mov	r0, 100
	jl	x8, r0, .LBB128_70
	jmp	.LBB128_69
.LBB128_69:                             // %memcpy.exit76.loopexit
                                        //   in Loop: Header=BB128_35 Depth=1
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
.LBB128_70:                             // %memcpy.exit76
                                        //   in Loop: Header=BB128_35 Depth=1
	mov	x0, x12
add	x0, 1
	mov	r0, 10
	jl	x8, r0, .LBB128_72
	jmp	.LBB128_71
.LBB128_71:                             //   in Loop: Header=BB128_35 Depth=1
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
	jmp	.LBB128_73
.LBB128_72:                             //   in Loop: Header=BB128_35 Depth=1
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
.LBB128_73:                             //   in Loop: Header=BB128_35 Depth=1
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
	jmp	.LBB128_75
.LBB128_74:                             //   in Loop: Header=BB128_35 Depth=1
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
.LBB128_75:                             //   in Loop: Header=BB128_35 Depth=1
	add	x14, r0
	mov	x10, x13
	mov	x6, 99999999
	jmp	.LBB128_77
.LBB128_76:
	mov	x10, x13
	jmp	.LBB128_130
.LBB128_77:                             //   in Loop: Header=BB128_35 Depth=1
	mov	r0, 1
	jg	x1, r0, .LBB128_35
	jmp	.LBB128_78
.LBB128_78:
	mov	[rsp+16], x12
	mov	x6, 0
	mov	r0, [rsp+4]
	mov	x4, 0
	jl	r0, x6, .LBB128_80
	jmp	.LBB128_129
.LBB128_79:
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
.LBB128_80:
	mov	r0, [rsp+4]
	sub	x4, r0
	mov	x9, x10
	mov	[rsp+20], x4
.LBB128_81:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB128_117 Depth 2
                                        //     Child Loop BB128_96 Depth 2
                                        //     Child Loop BB128_99 Depth 2
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
	jz	x11, .LBB128_83
	jmp	.LBB128_82
.LBB128_82:                             //   in Loop: Header=BB128_81 Depth=1
	mov	r0, x11
	mul	r0, 9
	jg	r0, x4, .LBB128_84
	jmp	.LBB128_83
.LBB128_83:                             //   in Loop: Header=BB128_81 Depth=1
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
	jz	x9, .LBB128_101
	jmp	.LBB128_85
.LBB128_84:                             //   in Loop: Header=BB128_81 Depth=1
	mov	x10, 0
	jz	x9, .LBB128_128
	jmp	.LBB128_86
.LBB128_85:                             //   in Loop: Header=BB128_81 Depth=1
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
	jg	rax, x0, .LBB128_127
	jmp	.LBB128_88
.LBB128_86:                             //   in Loop: Header=BB128_81 Depth=1
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
	jg	rax, x0, .LBB128_127
	jmp	.LBB128_87
.LBB128_87:                             //   in Loop: Header=BB128_81 Depth=1
	mov	x10, x15
	add	x10, x14
	jmp	.LBB128_90
.LBB128_88:                             //   in Loop: Header=BB128_81 Depth=1
	mov	x10, x15
	add	x10, x14
	jz	x8, .LBB128_90
	jmp	.LBB128_89
.LBB128_89:                             // %memcpy.exit77
                                        //   in Loop: Header=BB128_81 Depth=1
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
	mov	x9, mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb
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
	jmp	.LBB128_100
.LBB128_90:                             //   in Loop: Header=BB128_81 Depth=1
	mov	r1, 3
	mov	r0, x10
	call	__bit_and
	mov	x8, 9
	jz	rax, .LBB128_95
	jmp	.LBB128_91
.LBB128_91:                             // %.preheader111.preheader
                                        //   in Loop: Header=BB128_81 Depth=1
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
	jz	rax, .LBB128_95
	jmp	.LBB128_92
.LBB128_92:                             // %.preheader111.1
                                        //   in Loop: Header=BB128_81 Depth=1
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
	jz	rax, .LBB128_95
	jmp	.LBB128_93
.LBB128_93:                             // %.preheader111.2
                                        //   in Loop: Header=BB128_81 Depth=1
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
	jz	rax, .LBB128_95
	jmp	.LBB128_94
.LBB128_94:                             // %.preheader111.3
                                        //   in Loop: Header=BB128_81 Depth=1
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
.LBB128_95:                             // %.thread98.preheader
                                        //   in Loop: Header=BB128_81 Depth=1
	mov	x0, -2147483645
.LBB128_96:                             // %.thread98
                                        //   Parent Loop BB128_81 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	[x10], 808464432
add	x8, -4
	mov	r1, -2147483648
add	x10, 4
	mov	r0, x8
	call	__bit_xor
	jg	rax, x0, .LBB128_96
	jmp	.LBB128_97
.LBB128_97:                             // %.loopexit5.i82
                                        //   in Loop: Header=BB128_81 Depth=1
	jz	x8, .LBB128_100
	jmp	.LBB128_98
.LBB128_98:                             // %.preheader110.preheader
                                        //   in Loop: Header=BB128_81 Depth=1
	mov	x0, 0
.LBB128_99:                             // %.preheader110
                                        //   Parent Loop BB128_81 Depth=1
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
	jne	x8, x0, .LBB128_99
	jmp	.LBB128_100
.LBB128_100:                            // %memset.exit84
                                        //   in Loop: Header=BB128_81 Depth=1
add	x14, 9
	mov	x10, x11
	jmp	.LBB128_128
.LBB128_101:                            //   in Loop: Header=BB128_81 Depth=1
	mov	x10, 0
	mov	x15, [rsp+24]
	mov	x14, [rsp+40]
	mov	x7, [rsp+36]
	mov	x4, [rsp+20]
	mov	x6, [rsp+32]
	mov	x13, 99999999
	jz	x8, .LBB128_128
	jmp	.LBB128_102
.LBB128_102:                            //   in Loop: Header=BB128_81 Depth=1
	mov	r1, -2147483648
	mov	r0, x8
	call	__bit_xor
	mov	r0, -1147483648
	jl	rax, r0, .LBB128_104
	jmp	.LBB128_103
.LBB128_103:
	call	abort
.LBB128_104:                            //   in Loop: Header=BB128_81 Depth=1
	mov	x10, 9
	jg	x8, x13, .LBB128_113
	jmp	.LBB128_105
.LBB128_105:                            //   in Loop: Header=BB128_81 Depth=1
	mov	x10, 8
	mov	r0, 9999999
	jg	x8, r0, .LBB128_113
	jmp	.LBB128_106
.LBB128_106:                            //   in Loop: Header=BB128_81 Depth=1
	mov	x10, 7
	mov	r0, 999999
	jg	x8, r0, .LBB128_113
	jmp	.LBB128_107
.LBB128_107:                            //   in Loop: Header=BB128_81 Depth=1
	mov	x10, 6
	mov	r0, 99999
	jg	x8, r0, .LBB128_113
	jmp	.LBB128_108
.LBB128_108:                            //   in Loop: Header=BB128_81 Depth=1
	mov	x10, 5
	mov	r0, 9999
	jg	x8, r0, .LBB128_113
	jmp	.LBB128_109
.LBB128_109:                            //   in Loop: Header=BB128_81 Depth=1
	mov	x10, 4
	mov	r0, 999
	jg	x8, r0, .LBB128_113
	jmp	.LBB128_110
.LBB128_110:                            //   in Loop: Header=BB128_81 Depth=1
	mov	x10, 3
	mov	r0, 99
	jg	x8, r0, .LBB128_113
	jmp	.LBB128_111
.LBB128_111:                            //   in Loop: Header=BB128_81 Depth=1
	mov	x10, 2
	mov	r0, 9
	jg	x8, r0, .LBB128_113
	jmp	.LBB128_112
.LBB128_112:                            //   in Loop: Header=BB128_81 Depth=1
	mov	x10, 1
.LBB128_113:                            //   in Loop: Header=BB128_81 Depth=1
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
	jg	rax, x0, .LBB128_127
	jmp	.LBB128_114
.LBB128_114:                            //   in Loop: Header=BB128_81 Depth=1
	mov	r0, [rsp+12]
	jz	r0, .LBB128_125
	jmp	.LBB128_115
.LBB128_115:                            //   in Loop: Header=BB128_81 Depth=1
	mov	x3, x15
	add	x3, x14
	mov	x1, 0
	mov	r0, 10000
	jl	x8, r0, .LBB128_119
	jmp	.LBB128_116
.LBB128_116:                            //   in Loop: Header=BB128_81 Depth=1
	mov	[rsp+8], x3
	mov	x6, x3
	add	x6, x10
	mov	x5, 0
	mov	x3, mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb
.LBB128_117:                            // %memcpy.exit85
                                        //   Parent Loop BB128_81 Depth=1
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
	jg	x11, x13, .LBB128_117
	jmp	.LBB128_118
.LBB128_118:                            // %.loopexit113.loopexit
                                        //   in Loop: Header=BB128_81 Depth=1
	mov	x1, 0
	sub	x1, x5
	mov	x7, [rsp+36]
	mov	x6, [rsp+32]
	mov	x3, [rsp+8]
.LBB128_119:                            // %.loopexit113
                                        //   in Loop: Header=BB128_81 Depth=1
	mov	r0, 100
	jl	x8, r0, .LBB128_121
	jmp	.LBB128_120
.LBB128_120:                            // %memcpy.exit87.loopexit
                                        //   in Loop: Header=BB128_81 Depth=1
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
	mov	r0, mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb
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
.LBB128_121:                            // %memcpy.exit87
                                        //   in Loop: Header=BB128_81 Depth=1
	mov	r0, 10
	jl	x8, r0, .LBB128_123
	jmp	.LBB128_122
.LBB128_122:                            //   in Loop: Header=BB128_81 Depth=1
	mov	r1, 1
	mov	r0, x8
	call	__bit_shl
	mov	x0, rax
	mov	r0, mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb
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
	jmp	.LBB128_124
.LBB128_123:                            //   in Loop: Header=BB128_81 Depth=1
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
.LBB128_124:                            //   in Loop: Header=BB128_81 Depth=1
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
	jmp	.LBB128_126
.LBB128_125:                            //   in Loop: Header=BB128_81 Depth=1
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
.LBB128_126:                            //   in Loop: Header=BB128_81 Depth=1
	add	x14, r0
	jmp	.LBB128_128
.LBB128_127:
	mov	x12, [rsp+16]
	mov	x4, [rsp+28]
	jmp	.LBB128_130
.LBB128_128:                            //   in Loop: Header=BB128_81 Depth=1
	mov	x9, x10
	mov	r0, 200
	jne	x6, r0, .LBB128_81
	jmp	.LBB128_129
.LBB128_129:                            // %.loopexit114
	mov	x7, [rsp+44]
	sub	x7, x10
	mov	x2, 0
	mov	x9, x10
	mov	x8, 0
	mov	x12, [rsp+16]
	jmp	.LBB128_134
.LBB128_130:
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
	jle	rax, x0, .LBB128_134
	jmp	.LBB128_131
.LBB128_131:
	mov	x0, [rsp+12]
	sub	x0, x10
add	x0, 1
.LBB128_132:                            // =>This Inner Loop Header: Depth=1
	mov	r1, 10
	mov	x6, x8
	mov	r0, x6
	call	__udivsi3
add	x0, 1
	mov	x8, rax
	jne	x9, x0, .LBB128_132
	jmp	.LBB128_133
.LBB128_133:
	mov	x2, x8
	mul	x2, -10
	add	x2, x6
	mov	r0, 5
	je	x2, r0, .LBB128_135
	jmp	.LBB128_134
.LBB128_134:
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
	jmp	.LBB128_149
.LBB128_135:
	mov	r0, [rsp+44]
	sub	r0, x12
	mov	x10, r0
	mov	r1, [rsp+4]
	add	r1, r0
	mov	x2, 0
	sub	x2, r1
	mov	x3, 1
	jl	x2, x3, .LBB128_140
	jmp	.LBB128_136
.LBB128_136:
	mov	r0, 59
	mov	x6, 1
	jg	x2, r0, .LBB128_149
	jmp	.LBB128_137
.LBB128_137:
	mov	r0, x4
	mov	x6, [rsp+36]
	mov	r1, x6
	call	__bit_or
	jnz	rax, .LBB128_139
	jmp	.LBB128_138
.LBB128_138:
	call	abort
.LBB128_139:
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
.LBB128_140:
	mov	r0, -1
	jg	x10, r0, .LBB128_147
	jmp	.LBB128_141
.LBB128_141:
	mov	r1, 1
	mov	r0, x3
	call	__bit_and
	jz	rax, .LBB128_147
	jmp	.LBB128_142
.LBB128_142:
	mov	r0, x4
	mov	r1, [rsp+36]
	call	__bit_or
	jz	rax, .LBB128_144
	jmp	.LBB128_143
.LBB128_143:                            // %.preheader109.preheader
	mov	x1, 0
	sub	x1, x10
	mov	x5, -1
	mov	x2, [rsp+36]
	jmp	.LBB128_145
.LBB128_144:
	call	abort
.LBB128_145:                            // %.preheader109
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
	jnz	rax, .LBB128_145
	jmp	.LBB128_146
.LBB128_146:
	mov	r1, -2147483648
	mov	x6, 1
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x5
	call	__bit_xor
	jge	rax, x0, .LBB128_148
	jmp	.LBB128_149
.LBB128_147:
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
	jz	rax, .LBB128_149
	jmp	.LBB128_148
.LBB128_148:
	mov	x6, 2
.LBB128_149:
	jz	x9, .LBB128_171
	jmp	.LBB128_150
.LBB128_150:
	mov	x2, x15
	add	x2, x14
	jnz	x8, .LBB128_166
	jmp	.LBB128_151
.LBB128_151:
	mov	r1, 3
	mov	r0, x2
	call	__bit_and
	mov	x3, x7
	jz	rax, .LBB128_156
	jmp	.LBB128_152
.LBB128_152:                            // %.preheader106.preheader
	mov	x1, x15
	add	x1, x14
add	x1, 1
	mov	x0, 0
.LBB128_153:                            // %.preheader106
                                        // =>This Inner Loop Header: Depth=1
	je	x7, x0, .LBB128_183
	jmp	.LBB128_154
.LBB128_154:                            //   in Loop: Header=BB128_153 Depth=1
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
	jnz	rax, .LBB128_153
	jmp	.LBB128_155
.LBB128_155:                            // %.loopexit7.i88.loopexit
	add	x2, x0
	mov	x3, x7
	sub	x3, x0
.LBB128_156:                            // %.loopexit7.i88
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB128_163
	jmp	.LBB128_157
.LBB128_157:
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB128_159
	jmp	.LBB128_158
.LBB128_158:                            // %.preheader.i90.preheader
	mov	x0, -2147483633
	jmp	.LBB128_161
.LBB128_159:                            // %.preheader435
	mov	x0, -2147483645
	jmp	.LBB128_162
.LBB128_160:
	mov	r0, 3
	jg	x3, r0, .LBB128_159
	jmp	.LBB128_163
.LBB128_161:                            // %.preheader.i90
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
	jg	rax, x0, .LBB128_161
	jmp	.LBB128_160
.LBB128_162:                            // =>This Inner Loop Header: Depth=1
	mov	[x2], 808464432
add	x3, -4
	mov	r1, -2147483648
add	x2, 4
	mov	r0, x3
	call	__bit_xor
	jg	rax, x0, .LBB128_162
	jmp	.LBB128_163
.LBB128_163:                            // %.loopexit5.i89
	jz	x3, .LBB128_183
	jmp	.LBB128_164
.LBB128_164:                            // %.preheader105.preheader
	mov	x0, x2
.LBB128_165:                            // %.preheader105
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
	jz	x3, .LBB128_183
	jmp	.LBB128_165
.LBB128_166:
	mov	x4, x7
add	x4, -1
	mov	x3, 0
	jz	x4, .LBB128_169
	jmp	.LBB128_167
.LBB128_167:
	mov	x9, x14
	add	x9, x7
	add	x9, x15
add	x9, -1
	mov	x10, mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb
	mov	x5, x8
.LBB128_168:                            // %memcpy.exit92
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
	jl	rax, x0, .LBB128_168
	jmp	.LBB128_169
.LBB128_169:                            // %.loopexit108
	mov	r1, -2147483648
	mov	r0, x7
	call	__bit_xor
	mov	r1, -2147483648
	mov	x0, rax
	mov	r0, x3
	call	__bit_xor
	jge	rax, x0, .LBB128_183
	jmp	.LBB128_170
.LBB128_170:
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
	jmp	.LBB128_183
.LBB128_171:
	mov	r0, [rsp+12]
	jz	r0, .LBB128_182
	jmp	.LBB128_172
.LBB128_172:
	mov	x5, x15
	add	x5, x14
	mov	r1, -2147483648
	mov	x0, 0
	mov	r0, x8
	call	__bit_xor
	mov	r0, -2147473648
	mov	x9, x5
	add	x9, x7
	jl	rax, r0, .LBB128_176
	jmp	.LBB128_173
.LBB128_173:
	mov	[rsp+40], x14
	mov	[rsp+16], x12
	mov	x10, 0
	mov	x11, mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb
	mov	x12, -2047483649
.LBB128_174:                            // %memcpy.exit93
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
	jg	rax, x12, .LBB128_174
	jmp	.LBB128_175
.LBB128_175:                            // %.loopexit104.loopexit
	mov	x0, 0
	sub	x0, x10
	mov	x12, [rsp+16]
	mov	x14, [rsp+40]
.LBB128_176:                            // %.loopexit104
	mov	r0, 100
	jl	x8, r0, .LBB128_178
	jmp	.LBB128_177
.LBB128_177:                            // %memcpy.exit95.loopexit
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
	mov	x3, mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb
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
.LBB128_178:                            // %memcpy.exit95
	mov	r0, 10
	jl	x8, r0, .LBB128_180
	jmp	.LBB128_179
.LBB128_179:
	mov	r1, 1
	mov	r0, x8
	call	__bit_shl
	mov	x2, mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb
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
	jmp	.LBB128_181
.LBB128_180:
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
.LBB128_181:
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
	jmp	.LBB128_183
.LBB128_182:
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
.LBB128_183:                            // %memset.exit91
	add	x7, x14
	jz	x6, .LBB128_196
	jmp	.LBB128_184
.LBB128_184:
	mov	x0, 0
	jz	x7, .LBB128_190
	jmp	.LBB128_185
.LBB128_185:                            // %.preheader103.preheader
	mov	x1, x15
add	x1, -1
	mov	x4, 46
	mov	x5, 57
	mov	x3, x7
.LBB128_186:                            // %.preheader103
                                        // =>This Inner Loop Header: Depth=1
	mov	x2, x1
	add	x2, x3
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	je	rax, x4, .LBB128_195
	jmp	.LBB128_187
.LBB128_187:                            // %.preheader103
                                        //   in Loop: Header=BB128_186 Depth=1
	je	rax, x5, .LBB128_191
	jmp	.LBB128_188
.LBB128_188:                            // %.preheader103
	mov	r0, 45
	jne	rax, r0, .LBB128_192
	jmp	.LBB128_189
.LBB128_189:                            // %.preheader103..loopexit.loopexit_crit_edge
	mov	x0, x3
.LBB128_190:                            // %.loopexit
	add	x0, x15
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 49
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
add	x12, 1
	jmp	.LBB128_196
.LBB128_191:                            //   in Loop: Header=BB128_186 Depth=1
	mov	r0, [x2]
	mov	r1, -256
	call	__bit_and
	mov	r1, 48
	mov	r0, rax
	call	__bit_or
	mov	[x2], rax
	mov	x6, 1
	jmp	.LBB128_195
.LBB128_192:
	mov	r1, 1
	mov	x1, rax
	mov	r0, rax
	call	__bit_and
	mov	r0, 2
	jne	x6, r0, .LBB128_194
	jmp	.LBB128_193
.LBB128_193:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	jz	rax, .LBB128_196
	jmp	.LBB128_194
.LBB128_194:
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
	jmp	.LBB128_196
.LBB128_195:                            //   in Loop: Header=BB128_186 Depth=1
add	x3, -1
	jz	x3, .LBB128_190
	jmp	.LBB128_186
.LBB128_196:
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
	jg	x12, r0, .LBB128_198
	jmp	.LBB128_197
.LBB128_197:
	mov	r0, 0
	sub	r0, x12
	mov	x12, r0
.LBB128_198:
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
	jl	x12, r0, .LBB128_200
	jmp	.LBB128_199
.LBB128_199:                            // %memcpy.exit96
	mov	r1, 10
	mov	r0, x12
	call	__udivsi3
	mov	x2, rax
	mov	r1, 1
	add	x15, x0
	mov	r0, x2
	call	__bit_shl
	mov	x4, mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb
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
	jmp	.LBB128_201
.LBB128_200:                            // %memcpy.exit97
	mov	r1, 1
	add	x15, x0
	mov	r0, x12
	call	__bit_shl
	mov	x2, mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb
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
.LBB128_201:                            // %memcpy.exit63
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
	jl	rax, r0, .LBB131_5
	jmp	.LBB131_1
.LBB131_1:
	mov	r0, x0
	mov	r1, x2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB131_6
	jmp	.LBB131_2
.LBB131_2:                              // %.preheader.i.preheader
	mov	x3, -2147483645
.LBB131_3:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
	mov	r1, [x0]
	jne	r0, r1, .LBB131_6
	jmp	.LBB131_4
.LBB131_4:                              //   in Loop: Header=BB131_3 Depth=1
add	x2, 4
add	x1, -4
	mov	r1, -2147483648
add	x0, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x3, .LBB131_3
	jmp	.LBB131_5
.LBB131_5:                              // %.loopexit8.i
	mov	rax, 0
	jz	x1, .LBB131_10
	jmp	.LBB131_6
.LBB131_6:                              // %.loopexit7.i.preheader
.LBB131_7:                              // %.loopexit7.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x0]
	mov	r1, 255
	mov	x3, rax
	call	__bit_and
	je	x3, rax, .LBB131_9
	jmp	.LBB131_8
.LBB131_8:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x3
	call	__bit_and
	sub	rax, x0
	jmp	.LBB131_10
.LBB131_9:                              //   in Loop: Header=BB131_7 Depth=1
add	x1, -1
add	x2, 1
add	x0, 1
	mov	rax, 0
	jnz	x1, .LBB131_7
	jmp	.LBB131_10
.LBB131_10:                             // %memcmp.exit
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
	jge	rax, x3, .LBB132_10
	jmp	.LBB132_1
.LBB132_1:
	mov	x3, x2
	add	x3, x0
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x1
	call	__bit_xor
	jge	rax, x4, .LBB132_10
	jmp	.LBB132_2
.LBB132_2:
	mov	x4, x1
	mov	r1, -2147483648
	add	x4, x0
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB132_7
	jmp	.LBB132_3
.LBB132_3:
	mov	r0, x3
	mov	r1, x4
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB132_8
	jmp	.LBB132_4
.LBB132_4:                              // %.preheader.i.preheader
	mov	x3, -2147483645
.LBB132_5:                              // %.preheader.i
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
	jg	rax, x3, .LBB132_5
	jmp	.LBB132_6
.LBB132_6:                              // %.loopexit9.i.loopexit
	add	x2, x0
	add	x1, x0
	mov	x4, x1
	mov	x3, x2
.LBB132_7:                              // %.loopexit9.i
	jz	x0, .LBB132_21
	jmp	.LBB132_8
.LBB132_8:                              // %.preheader
add	x3, -1
add	x4, -1
.LBB132_9:                              // =>This Inner Loop Header: Depth=1
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
	jz	x0, .LBB132_21
	jmp	.LBB132_9
.LBB132_10:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB132_18
	jmp	.LBB132_11
.LBB132_11:
	mov	r0, x1
	mov	r1, x2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB132_19
	jmp	.LBB132_12
.LBB132_12:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB132_14
	jmp	.LBB132_13
.LBB132_13:                             // %.preheader12.i.preheader
	mov	x3, -2147483633
	jmp	.LBB132_16
.LBB132_14:                             // %.preheader54
	mov	x3, -2147483645
	jmp	.LBB132_17
.LBB132_15:
	mov	r0, 3
	jg	x0, r0, .LBB132_14
	jmp	.LBB132_18
.LBB132_16:                             // %.preheader12.i
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
	jg	rax, x3, .LBB132_16
	jmp	.LBB132_15
.LBB132_17:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
add	x2, 4
	mov	[x1], r0
add	x0, -4
	mov	r1, -2147483648
add	x1, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x3, .LBB132_17
	jmp	.LBB132_18
.LBB132_18:                             // %.loopexit11.i
	jz	x0, .LBB132_21
	jmp	.LBB132_19
.LBB132_19:                             // %.preheader49
	mov	x5, x1
.LBB132_20:                             // =>This Inner Loop Header: Depth=1
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
	jnz	x0, .LBB132_20
	jmp	.LBB132_21
.LBB132_21:                             // %memmove.exit
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
	jz	rax, .LBB133_4
	jmp	.LBB133_1
.LBB133_1:                              // %.preheader1.preheader
	mov	x2, x1
add	x2, 1
	mov	x3, x1
.LBB133_2:                              // %.preheader1
                                        // =>This Inner Loop Header: Depth=1
	jz	x0, .LBB133_14
	jmp	.LBB133_3
.LBB133_3:                              //   in Loop: Header=BB133_2 Depth=1
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
	jnz	rax, .LBB133_2
	jmp	.LBB133_4
.LBB133_4:                              // %.loopexit7.i
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB133_11
	jmp	.LBB133_5
.LBB133_5:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB133_7
	jmp	.LBB133_6
.LBB133_6:                              // %.preheader.i.preheader
	mov	x2, -2147483633
	jmp	.LBB133_9
.LBB133_7:                              // %.preheader30
	mov	x2, -2147483645
	jmp	.LBB133_10
.LBB133_8:
	mov	r0, 3
	jg	x0, r0, .LBB133_7
	jmp	.LBB133_11
.LBB133_9:                              // %.preheader.i
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
	jg	rax, x2, .LBB133_9
	jmp	.LBB133_8
.LBB133_10:                             // =>This Inner Loop Header: Depth=1
	mov	[x1], 0
add	x0, -4
	mov	r1, -2147483648
add	x1, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x2, .LBB133_10
	jmp	.LBB133_11
.LBB133_11:                             // %.loopexit5.i
	jz	x0, .LBB133_14
	jmp	.LBB133_12
.LBB133_12:                             // %.preheader.preheader
	mov	x2, x1
.LBB133_13:                             // %.preheader
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
	jnz	x0, .LBB133_13
	jmp	.LBB133_14
.LBB133_14:                             // %memset.exit
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
	jz	x2, .LBB134_3
	jmp	.LBB134_1
.LBB134_1:
	jz	rax, .LBB134_11
	jmp	.LBB134_2
.LBB134_2:
	mov	x4, x0
add	x4, 1
	jmp	.LBB134_13
.LBB134_3:
	mov	x3, x0
	jz	rax, .LBB134_7
	jmp	.LBB134_4
.LBB134_4:                              // %.preheader2.i.preheader
	mov	x1, x0
add	x1, 1
	mov	x3, x0
.LBB134_5:                              // %.preheader2.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB134_22
	jmp	.LBB134_6
.LBB134_6:                              //   in Loop: Header=BB134_5 Depth=1
	mov	r1, 3
add	x3, 1
	mov	r0, x1
	call	__bit_and
add	x1, 1
	jnz	rax, .LBB134_5
	jmp	.LBB134_7
.LBB134_7:                              // %.loopexit4.i.preheader
add	x3, -5
	mov	x0, -2139062144
.LBB134_8:                              // %.loopexit4.i
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
	je	rax, x0, .LBB134_8
	jmp	.LBB134_9
.LBB134_9:                              // %.preheader.i.preheader
.LBB134_10:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
add	x3, 1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB134_22
	jmp	.LBB134_10
.LBB134_11:                             // %.loopexit9.i
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	x4, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB134_18
	jmp	.LBB134_12
.LBB134_12:                             // %.preheader5.i.preheader
	mul	x2, 16843009
	jmp	.LBB134_16
.LBB134_13:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x5, rax
	mov	x3, 0
	jz	x5, .LBB134_22
	jmp	.LBB134_14
.LBB134_14:                             //   in Loop: Header=BB134_13 Depth=1
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	x3, x0
	je	rax, x6, .LBB134_22
	jmp	.LBB134_15
.LBB134_15:                             //   in Loop: Header=BB134_13 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x4
	call	__bit_and
add	x4, 1
	jz	rax, .LBB134_11
	jmp	.LBB134_13
.LBB134_16:                             // %.preheader5.i
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
	jne	rax, x4, .LBB134_18
	jmp	.LBB134_17
.LBB134_17:                             //   in Loop: Header=BB134_16 Depth=1
add	x0, 4
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x4, .LBB134_16
	jmp	.LBB134_18
.LBB134_18:                             // %.loopexit6.i
add	x0, -1
.LBB134_19:                             // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
	jz	x2, .LBB134_21
	jmp	.LBB134_20
.LBB134_20:                             //   in Loop: Header=BB134_19 Depth=1
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	jne	rax, x3, .LBB134_19
	jmp	.LBB134_21
.LBB134_21:
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
.LBB134_22:                             // %strchr.exit
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
	jl	rax, r0, .LBB135_5
	jmp	.LBB135_1
.LBB135_1:
	mov	r0, x0
	mov	r1, x3
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB135_5
	jmp	.LBB135_2
.LBB135_2:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	x4, rax
	mul	x4, 16843009
	mov	x6, -2139062144
	mov	x7, -2147483645
.LBB135_3:                              // =>This Inner Loop Header: Depth=1
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
	jne	rax, x6, .LBB135_5
	jmp	.LBB135_4
.LBB135_4:                              //   in Loop: Header=BB135_3 Depth=1
add	x0, 4
	mov	[x3], x5
add	x1, -4
	mov	r1, -2147483648
add	x3, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x7, .LBB135_3
	jmp	.LBB135_5
.LBB135_5:                              // %.loopexit
.LBB135_6:                              // =>This Inner Loop Header: Depth=1
	mov	x4, 0
	jz	x1, .LBB135_8
	jmp	.LBB135_7
.LBB135_7:                              //   in Loop: Header=BB135_6 Depth=1
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
	jne	x6, x5, .LBB135_6
	jmp	.LBB135_8
.LBB135_8:
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
	jz	rax, .LBB136_5
	jmp	.LBB136_1
.LBB136_1:
	mov	x3, x2
add	x3, 1
.LBB136_2:                              // =>This Inner Loop Header: Depth=1
	mov	rax, 0
	jz	x1, .LBB136_13
	jmp	.LBB136_3
.LBB136_3:                              //   in Loop: Header=BB136_2 Depth=1
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
	mov	r0, [x2]
	mov	r1, 255
	mov	x4, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, x2
	je	r0, x4, .LBB136_13
	jmp	.LBB136_4
.LBB136_4:                              //   in Loop: Header=BB136_2 Depth=1
	mov	r1, 3
add	x2, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
add	x1, -1
	jnz	rax, .LBB136_2
	jmp	.LBB136_5
.LBB136_5:                              // %.loopexit9
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB136_9
	jmp	.LBB136_6
.LBB136_6:
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
	mov	x3, rax
	mul	x3, 16843009
	mov	x4, -2139062144
	mov	x5, -2147483645
.LBB136_7:                              // =>This Inner Loop Header: Depth=1
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
	jne	rax, x4, .LBB136_10
	jmp	.LBB136_8
.LBB136_8:                              //   in Loop: Header=BB136_7 Depth=1
add	x1, -4
	mov	r1, -2147483648
add	x2, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x5, .LBB136_7
	jmp	.LBB136_9
.LBB136_9:                              // %.loopexit6
	mov	rax, 0
	jz	x1, .LBB136_13
	jmp	.LBB136_10
.LBB136_10:                             // %.loopexit5
.LBB136_11:                             // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
	mov	r0, [x2]
	mov	r1, 255
	mov	x3, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, x2
	je	r0, x3, .LBB136_13
	jmp	.LBB136_12
.LBB136_12:                             //   in Loop: Header=BB136_11 Depth=1
add	x1, -1
add	x2, 1
	mov	rax, 0
	jnz	x1, .LBB136_11
	jmp	.LBB136_13
.LBB136_13:                             // %.loopexit
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
	jl	rax, r0, .LBB137_5
	jmp	.LBB137_1
.LBB137_1:
	mov	r0, x0
	mov	r1, x2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB137_6
	jmp	.LBB137_2
.LBB137_2:                              // %.preheader.preheader
	mov	x3, -2147483645
.LBB137_3:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
	mov	r1, [x0]
	jne	r0, r1, .LBB137_6
	jmp	.LBB137_4
.LBB137_4:                              //   in Loop: Header=BB137_3 Depth=1
add	x2, 4
add	x1, -4
	mov	r1, -2147483648
add	x0, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x3, .LBB137_3
	jmp	.LBB137_5
.LBB137_5:                              // %.loopexit8
	mov	rax, 0
	jz	x1, .LBB137_10
	jmp	.LBB137_6
.LBB137_6:                              // %.loopexit7.preheader
.LBB137_7:                              // %.loopexit7
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x0]
	mov	r1, 255
	mov	x3, rax
	call	__bit_and
	je	x3, rax, .LBB137_9
	jmp	.LBB137_8
.LBB137_8:
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x3
	call	__bit_and
	sub	rax, x0
	jmp	.LBB137_10
.LBB137_9:                              //   in Loop: Header=BB137_7 Depth=1
add	x1, -1
add	x2, 1
add	x0, 1
	mov	rax, 0
	jnz	x1, .LBB137_7
	jmp	.LBB137_10
.LBB137_10:                             // %.loopexit
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
	jl	rax, r0, .LBB138_13
	jmp	.LBB138_1
.LBB138_1:
	mov	r1, 3
	mov	r0, x0
	call	__bit_and
	mov	x2, rax
	mov	x7, 8
	sub	x7, x2
	mov	x10, 0
	mov	x3, x1
.LBB138_2:                              // =>This Inner Loop Header: Depth=1
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
	jne	x7, x10, .LBB138_2
	jmp	.LBB138_3
.LBB138_3:
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
	jnz	rax, .LBB138_10
	jmp	.LBB138_4
.LBB138_4:
	mov	x6, x0
	mov	r1, -2147483648
	add	x6, x10
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB138_7
	jmp	.LBB138_5
.LBB138_5:                              // %.preheader.preheader
	mov	x6, x0
	add	x6, x10
	add	x1, x10
	mov	x3, 0
	mov	x4, -2147483633
	jmp	.LBB138_8
.LBB138_6:
	add	x1, x3
	mov	r0, 4
	add	x6, x3
	mov	x4, x1
	jl	x2, r0, .LBB138_13
	jmp	.LBB138_7
.LBB138_7:                              // %.preheader59
	mov	x3, -2147483645
	mov	x1, x4
	jmp	.LBB138_9
.LBB138_8:                              // %.preheader
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
	jg	rax, x4, .LBB138_8
	jmp	.LBB138_6
.LBB138_9:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
add	x1, 4
	mov	[x6], r0
add	x2, -4
	mov	r1, -2147483648
add	x6, 4
	mov	r0, x2
	call	__bit_xor
	jg	rax, x3, .LBB138_9
	jmp	.LBB138_13
.LBB138_10:
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
.LBB138_11:                             // =>This Inner Loop Header: Depth=1
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
	jge	rax, x9, .LBB138_11
	jmp	.LBB138_12
.LBB138_12:
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
	jmp	.LBB138_14
.LBB138_13:                             // %.loopexit8
	jz	x2, .LBB138_16
	jmp	.LBB138_14
.LBB138_14:                             // %.preheader56
	mov	x5, x6
.LBB138_15:                             // =>This Inner Loop Header: Depth=1
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
	jnz	x2, .LBB138_15
	jmp	.LBB138_16
.LBB138_16:                             // %.loopexit
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
	jl	rax, r0, .LBB139_22
	jmp	.LBB139_1
.LBB139_1:                              // %.preheader30.preheader
	mov	x6, -1
	mov	x10, 0
	mov	x5, 1
	mov	x1, 1
.LBB139_2:                              // %.preheader30
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
	jge	rax, x9, .LBB139_4
	jmp	.LBB139_3
.LBB139_3:                              //   in Loop: Header=BB139_2 Depth=1
	mov	x4, x5
	sub	x4, x6
	mov	x1, 1
	jmp	.LBB139_9
.LBB139_4:                              //   in Loop: Header=BB139_2 Depth=1
	mov	r1, 255
	mov	r0, x8
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x7
	call	__bit_and
	jne	rax, x5, .LBB139_8
	jmp	.LBB139_5
.LBB139_5:                              //   in Loop: Header=BB139_2 Depth=1
	je	x1, x4, .LBB139_7
	jmp	.LBB139_6
.LBB139_6:                              //   in Loop: Header=BB139_2 Depth=1
add	x1, 1
	mov	x5, x10
	jmp	.LBB139_9
.LBB139_7:                              //   in Loop: Header=BB139_2 Depth=1
	add	x10, x4
	mov	x1, 1
	mov	x5, x10
	jmp	.LBB139_9
.LBB139_8:                              //   in Loop: Header=BB139_2 Depth=1
	mov	x5, x10
add	x5, 1
	mov	x1, 1
	mov	x6, x10
	mov	x4, 1
.LBB139_9:                              //   in Loop: Header=BB139_2 Depth=1
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
	jl	rax, x7, .LBB139_2
	jmp	.LBB139_10
.LBB139_10:                             // %.preheader29.preheader
	mov	x5, -1
	mov	x13, 0
	mov	x7, 1
	mov	x1, 1
	mov	x12, 1
.LBB139_11:                             // %.preheader29
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
	jge	rax, x10, .LBB139_13
	jmp	.LBB139_12
.LBB139_12:                             //   in Loop: Header=BB139_11 Depth=1
	mov	x1, x7
	sub	x1, x5
	mov	x12, 1
	jmp	.LBB139_18
.LBB139_13:                             //   in Loop: Header=BB139_11 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x8
	call	__bit_and
	jne	rax, x7, .LBB139_17
	jmp	.LBB139_14
.LBB139_14:                             //   in Loop: Header=BB139_11 Depth=1
	je	x12, x1, .LBB139_16
	jmp	.LBB139_15
.LBB139_15:                             //   in Loop: Header=BB139_11 Depth=1
add	x12, 1
	mov	x7, x13
	jmp	.LBB139_18
.LBB139_16:                             //   in Loop: Header=BB139_11 Depth=1
	add	x13, x1
	mov	x12, 1
	mov	x7, x13
	jmp	.LBB139_18
.LBB139_17:                             //   in Loop: Header=BB139_11 Depth=1
	mov	x7, x13
add	x7, 1
	mov	x12, 1
	mov	x5, x13
	mov	x1, 1
.LBB139_18:                             //   in Loop: Header=BB139_11 Depth=1
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
	jl	rax, x8, .LBB139_11
	jmp	.LBB139_19
.LBB139_19:
add	x6, 1
	mov	r1, -2147483648
add	x5, 1
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x7, rax
	mov	r0, x5
	call	__bit_xor
	jl	rax, x7, .LBB139_21
	jmp	.LBB139_20
.LBB139_20:
	mov	x4, x1
.LBB139_21:
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
.LBB139_22:
	mov	r0, 1024
	jmp	.LBB139_25
.LBB139_23:
	jz	x0, .LBB139_27
	jmp	.LBB139_24
.LBB139_24:                             // %.preheader27.preheader
	mov	x1, x0
add	x1, -1
	mov	x3, -1
	mov	x6, x2
	jmp	.LBB139_26
.LBB139_25:                             // =>This Inner Loop Header: Depth=1
	mov	r1, rsp
add	r1, 20
	add	r1, x11
add	x11, 4
	mov	[r1], x0
	je	x11, r0, .LBB139_23
	jmp	.LBB139_25
.LBB139_26:                             // %.preheader27
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
	jne	x1, x3, .LBB139_26
	jmp	.LBB139_27
.LBB139_27:                             // %.loopexit28
	mov	x6, x2
	mov	r1, -2147483648
	add	x6, x4
	mov	r0, x5
	call	__bit_xor
	mov	r0, -2147483644
	mov	x7, x5
	mov	x1, x2
	jl	rax, r0, .LBB139_33
	jmp	.LBB139_28
.LBB139_28:
	mov	r0, x6
	mov	r1, x2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	x7, x5
	mov	x1, x2
	jnz	rax, .LBB139_35
	jmp	.LBB139_29
.LBB139_29:                             // %.preheader.i.preheader
	mov	x3, -2147483645
	mov	x1, x2
	mov	x7, x5
.LBB139_30:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	x6, x1
	add	x6, x4
	mov	r0, [x1]
	mov	r1, [x6]
	jne	r0, r1, .LBB139_34
	jmp	.LBB139_31
.LBB139_31:                             //   in Loop: Header=BB139_30 Depth=1
add	x7, -4
	mov	r1, -2147483648
add	x1, 4
	mov	r0, x7
	call	__bit_xor
	jg	rax, x3, .LBB139_30
	jmp	.LBB139_32
.LBB139_32:                             // %.loopexit8.i.loopexit
	mov	x6, x1
	add	x6, x4
.LBB139_33:                             // %.loopexit8.i
	jz	x7, .LBB139_38
	jmp	.LBB139_35
.LBB139_34:                             // %.loopexit7.i.preheader.loopexit
.LBB139_35:                             // %.loopexit7.i.preheader
.LBB139_36:                             // %.loopexit7.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x6]
	mov	r1, 255
	mov	x8, rax
	call	__bit_and
	jne	x8, rax, .LBB139_53
	jmp	.LBB139_37
.LBB139_37:                             //   in Loop: Header=BB139_36 Depth=1
add	x7, -1
add	x1, 1
add	x6, 1
	jnz	x7, .LBB139_36
	jmp	.LBB139_38
.LBB139_38:                             // %memcmp.exit.thread
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
.LBB139_39:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB139_47 Depth 2
                                        //     Child Loop BB139_49 Depth 2
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
	jz	x11, .LBB139_44
	jmp	.LBB139_40
.LBB139_40:                             //   in Loop: Header=BB139_39 Depth=1
	mov	x9, 0
	jz	x3, .LBB139_43
	jmp	.LBB139_41
.LBB139_41:                             //   in Loop: Header=BB139_39 Depth=1
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x11
	call	__bit_xor
	jge	rax, x6, .LBB139_43
	jmp	.LBB139_42
.LBB139_42:                             //   in Loop: Header=BB139_39 Depth=1
	mov	x11, x14
.LBB139_43:                             //   in Loop: Header=BB139_39 Depth=1
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
	jg	rax, x10, .LBB139_65
	jmp	.LBB139_39
.LBB139_44:                             //   in Loop: Header=BB139_39 Depth=1
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
	jge	x11, rax, .LBB139_46
	jmp	.LBB139_45
.LBB139_45:                             // %.preheader.preheader
                                        //   in Loop: Header=BB139_39 Depth=1
	mov	x11, [rsp]
	add	x11, x12
	mov	x7, [rsp+8]
	sub	x7, x12
	mov	x15, x2
	add	x15, x12
	add	x12, x8
	mov	r0, [rsp+16]
	add	x12, r0
	jmp	.LBB139_47
.LBB139_46:                             // %.loopexit
                                        //   in Loop: Header=BB139_39 Depth=1
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
	jmp	.LBB139_49
.LBB139_47:                             // %.preheader
                                        //   Parent Loop BB139_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x15]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x12]
	mov	r1, 255
	mov	x13, rax
	call	__bit_and
	mov	x9, 0
	jne	x13, rax, .LBB139_43
	jmp	.LBB139_48
.LBB139_48:                             //   in Loop: Header=BB139_47 Depth=2
add	x11, 1
add	x7, -1
add	x15, 1
add	x12, 1
	jz	x7, .LBB139_46
	jmp	.LBB139_47
.LBB139_49:                             //   Parent Loop BB139_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, -2147483648
	mov	r0, x11
	call	__bit_xor
	mov	r1, -2147483648
	mov	x12, rax
	mov	r0, x3
	call	__bit_xor
	jge	rax, x12, .LBB139_52
	jmp	.LBB139_50
.LBB139_50:                             //   in Loop: Header=BB139_49 Depth=2
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
	je	x12, rax, .LBB139_49
	jmp	.LBB139_51
.LBB139_51:                             // %._crit_edge
                                        //   in Loop: Header=BB139_39 Depth=1
add	x9, 1
	mov	x10, x9
.LBB139_52:                             //   in Loop: Header=BB139_39 Depth=1
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
	jl	rax, x3, .LBB139_65
	jmp	.LBB139_43
.LBB139_53:                             // %memcmp.exit
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
.LBB139_54:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB139_59 Depth 2
                                        //     Child Loop BB139_62 Depth 2
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
	jnz	r0, .LBB139_57
	jmp	.LBB139_55
.LBB139_55:                             //   in Loop: Header=BB139_54 Depth=1
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x7
	call	__bit_xor
	jle	rax, x9, .LBB139_61
	jmp	.LBB139_56
.LBB139_56:                             // %.preheader24.preheader
                                        //   in Loop: Header=BB139_54 Depth=1
	mov	x13, x11
	add	x13, x8
	mov	x3, 0
	jmp	.LBB139_59
.LBB139_57:                             //   in Loop: Header=BB139_54 Depth=1
	add	x8, r0
.LBB139_58:                             //   in Loop: Header=BB139_54 Depth=1
	mov	r1, -2147483648
	mov	x6, 0
	mov	r0, [rsp+12]
	call	__bit_xor
	mov	r1, -2147483648
	mov	x9, rax
	mov	r0, x8
	call	__bit_xor
	jg	rax, x9, .LBB139_65
	jmp	.LBB139_54
.LBB139_59:                             // %.preheader24
                                        //   Parent Loop BB139_54 Depth=1
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
	jne	x9, rax, .LBB139_64
	jmp	.LBB139_60
.LBB139_60:                             //   in Loop: Header=BB139_59 Depth=2
add	x3, 1
	jne	x1, x3, .LBB139_59
	jmp	.LBB139_61
.LBB139_61:                             // %.loopexit25.preheader
                                        //   in Loop: Header=BB139_54 Depth=1
	mov	x13, x12
	add	x13, x8
	mov	x14, x5
.LBB139_62:                             // %.loopexit25
                                        //   Parent Loop BB139_54 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	jz	x14, .LBB139_65
	jmp	.LBB139_63
.LBB139_63:                             //   in Loop: Header=BB139_62 Depth=2
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
	je	x9, rax, .LBB139_62
	jmp	.LBB139_64
.LBB139_64:                             // %.loopexit23
                                        //   in Loop: Header=BB139_54 Depth=1
	add	x8, x3
add	x8, 1
	jmp	.LBB139_58
.LBB139_65:                             // %.loopexit21
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
	jz	x3, .LBB140_78
	jmp	.LBB140_1
.LBB140_1:
	mov	r0, 1
	jne	x3, r0, .LBB140_15
	jmp	.LBB140_2
.LBB140_2:
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	r1, 3
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB140_7
	jmp	.LBB140_3
.LBB140_3:                              // %.preheader25.preheader
	mov	x2, x0
add	x2, 1
.LBB140_4:                              // %.preheader25
                                        // =>This Inner Loop Header: Depth=1
	mov	x6, 0
	jz	x4, .LBB140_78
	jmp	.LBB140_5
.LBB140_5:                              //   in Loop: Header=BB140_4 Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x1
	call	__bit_and
	mov	x6, x0
	je	x3, rax, .LBB140_78
	jmp	.LBB140_6
.LBB140_6:                              //   in Loop: Header=BB140_4 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x2
	call	__bit_and
add	x2, 1
add	x4, -1
	jnz	rax, .LBB140_4
	jmp	.LBB140_7
.LBB140_7:                              // %.loopexit9.i
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB140_11
	jmp	.LBB140_8
.LBB140_8:
	mov	x2, x1
	mul	x2, 16843009
	mov	x3, -2139062144
	mov	x5, -2147483645
.LBB140_9:                              // =>This Inner Loop Header: Depth=1
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
	jne	rax, x3, .LBB140_12
	jmp	.LBB140_10
.LBB140_10:                             //   in Loop: Header=BB140_9 Depth=1
add	x4, -4
	mov	r1, -2147483648
add	x0, 4
	mov	r0, x4
	call	__bit_xor
	jg	rax, x5, .LBB140_9
	jmp	.LBB140_11
.LBB140_11:                             // %.loopexit6.i
	mov	x6, 0
	jz	x4, .LBB140_78
	jmp	.LBB140_12
.LBB140_12:                             // %.loopexit5.i.preheader
.LBB140_13:                             // %.loopexit5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	x6, x0
	je	x2, rax, .LBB140_78
	jmp	.LBB140_14
.LBB140_14:                             //   in Loop: Header=BB140_13 Depth=1
add	x4, -1
add	x0, 1
	mov	x6, 0
	jz	x4, .LBB140_78
	jmp	.LBB140_13
.LBB140_15:
	mov	r1, -2147483648
	mov	x6, 0
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x4
	call	__bit_xor
	jl	rax, x1, .LBB140_78
	jmp	.LBB140_16
.LBB140_16:
	mov	x7, x4
	sub	x7, x3
	mov	x1, x0
	mov	r0, 2
	add	x1, x7
	jne	x3, r0, .LBB140_24
	jmp	.LBB140_17
.LBB140_17:
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
	jl	x7, r0, .LBB140_23
	jmp	.LBB140_18
.LBB140_18:
	je	x3, x2, .LBB140_23
	jmp	.LBB140_19
.LBB140_19:                             // %.preheader.preheader
add	x0, 2
.LBB140_20:                             // %.preheader
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
	jg	rax, x5, .LBB140_22
	jmp	.LBB140_21
.LBB140_21:                             // %.preheader
                                        //   in Loop: Header=BB140_20 Depth=1
	jne	x3, x2, .LBB140_20
	jmp	.LBB140_22
.LBB140_22:                             // %.loopexit.loopexit
add	x0, -2
.LBB140_23:                             // %.loopexit
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
	jmp	.LBB140_78
.LBB140_24:
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r0, -2147483391
	jl	rax, r0, .LBB140_26
	jmp	.LBB140_25
.LBB140_25:
	mov	r0, x0
	mov	r1, x4
	mov	r2, x2
	mov	r3, x3
	call	two_way_long_needle
	mov	x6, rax
	jmp	.LBB140_78
.LBB140_26:
	mov	x4, rsp
	mov	r1, 3
	mov	r0, x4
	call	__bit_and
	mov	x5, 256
	jz	rax, .LBB140_31
	jmp	.LBB140_27
.LBB140_27:                             // %.preheader22.preheader
	mov	r0, rsp
	mov	r1, 3
	call	__bit_and
	mov	r1, 3
	mov	r0, rax
	call	__bit_xor
	mov	x4, rax
add	x4, 1
.LBB140_28:                             // =>This Inner Loop Header: Depth=1
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
	jne	x4, x6, .LBB140_28
	jmp	.LBB140_29
.LBB140_29:                             // %.loopexit7.i
	mov	r0, 257
	sub	r0, x6
	mov	x4, rsp
	add	x4, x6
	mov	x5, 256
	mov	r1, -2147483648
	sub	x5, x6
	call	__bit_xor
	mov	r0, -2147483643
	jl	rax, r0, .LBB140_36
	jmp	.LBB140_30
.LBB140_30:                             // %.loopexit7.i.thread
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB140_32
	jmp	.LBB140_31
.LBB140_31:                             // %.preheader.i.preheader
	mov	x6, -2147483633
	jmp	.LBB140_34
.LBB140_32:                             // %.preheader239
	mov	x6, -2147483645
	jmp	.LBB140_35
.LBB140_33:
	mov	r0, x5
add	r0, 16
	mov	r1, 19
	jg	r0, r1, .LBB140_32
	jmp	.LBB140_36
.LBB140_34:                             // %.preheader.i
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
	jg	rax, x6, .LBB140_34
	jmp	.LBB140_33
.LBB140_35:                             // =>This Inner Loop Header: Depth=1
	mov	[x4], 0
add	x5, -4
	mov	r1, -2147483648
add	x4, 4
	mov	r0, x5
	call	__bit_xor
	jg	rax, x6, .LBB140_35
	jmp	.LBB140_36
.LBB140_36:                             // %.loopexit5.i6
	jz	x5, .LBB140_39
	jmp	.LBB140_37
.LBB140_37:                             // %.preheader21.preheader
	mov	x6, x4
.LBB140_38:                             // %.preheader21
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
	jnz	x5, .LBB140_38
	jmp	.LBB140_39
.LBB140_39:                             // %memset.exit.preheader
	mov	x4, x3
add	x4, -1
	mov	x8, x3
add	x8, -2
	mov	x5, 0
.LBB140_40:                             // %memset.exit
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
	jne	x8, x5, .LBB140_40
	jmp	.LBB140_41
.LBB140_41:
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
	jl	x3, r0, .LBB140_43
	jmp	.LBB140_42
.LBB140_42:                             // %.preheader19.preheader
	mov	x11, -2147483645
	jmp	.LBB140_59
.LBB140_43:                             // %.preheader14
	mov	x6, 0
	jl	x7, x6, .LBB140_77
	jmp	.LBB140_44
.LBB140_44:                             // %.preheader13.lr.ph
	mov	x7, -2147483643
	mov	x8, -2147483645
.LBB140_45:                             // %.preheader13
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB140_52 Depth 2
                                        //     Child Loop BB140_56 Depth 2
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
	jg	rax, x0, .LBB140_47
	jmp	.LBB140_46
.LBB140_46:                             // %.preheader13
                                        //   in Loop: Header=BB140_45 Depth=1
	mov	r1, 255
	mov	r0, x5
	call	__bit_and
	mov	x0, x6
	jz	rax, .LBB140_45
	jmp	.LBB140_47
.LBB140_47:                             //   in Loop: Header=BB140_45 Depth=1
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
	jle	rax, x0, .LBB140_49
	jmp	.LBB140_48
.LBB140_48:                             //   in Loop: Header=BB140_45 Depth=1
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x6
	call	__bit_xor
	mov	x0, x6
	mov	x6, 0
	jg	rax, x5, .LBB140_77
	jmp	.LBB140_45
.LBB140_49:                             //   in Loop: Header=BB140_45 Depth=1
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	x0, x4
	mov	x11, x6
	mov	x9, x2
	jl	rax, x7, .LBB140_54
	jmp	.LBB140_50
.LBB140_50:                             //   in Loop: Header=BB140_45 Depth=1
	mov	r0, x6
	mov	r1, x2
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	x0, x4
	mov	x9, x2
	mov	x11, x6
	jnz	rax, .LBB140_55
	jmp	.LBB140_51
.LBB140_51:                             // %.preheader.i8.preheader
                                        //   in Loop: Header=BB140_45 Depth=1
	mov	x9, x2
	mov	x11, x6
	mov	x0, x4
.LBB140_52:                             // %.preheader.i8
                                        //   Parent Loop BB140_45 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x11]
	mov	r1, [x9]
	jne	r0, r1, .LBB140_55
	jmp	.LBB140_53
.LBB140_53:                             //   in Loop: Header=BB140_52 Depth=2
add	x11, 4
add	x0, -4
	mov	r1, -2147483648
add	x9, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x8, .LBB140_52
	jmp	.LBB140_54
.LBB140_54:                             // %.loopexit8.i
                                        //   in Loop: Header=BB140_45 Depth=1
	jz	x0, .LBB140_77
	jmp	.LBB140_55
.LBB140_55:                             // %.loopexit7.i7.preheader
                                        //   in Loop: Header=BB140_45 Depth=1
.LBB140_56:                             // %.loopexit7.i7
                                        //   Parent Loop BB140_45 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x11]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x9]
	mov	r1, 255
	mov	x5, rax
	call	__bit_and
	jne	x5, rax, .LBB140_58
	jmp	.LBB140_57
.LBB140_57:                             //   in Loop: Header=BB140_56 Depth=2
add	x0, -1
add	x11, 1
add	x9, 1
	jz	x0, .LBB140_77
	jmp	.LBB140_56
.LBB140_58:                             // %memcmp.exit
                                        //   in Loop: Header=BB140_45 Depth=1
	add	x6, x10
	jmp	.LBB140_48
.LBB140_59:                             // %.preheader19
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB140_60 Depth 2
                                        //       Child Loop BB140_62 Depth 3
	mov	x8, x0
.LBB140_60:                             //   Parent Loop BB140_59 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB140_62 Depth 3
	mov	x0, x8
	mov	r1, -2147483648
	mov	x6, 0
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x7, rax
	mov	r0, x0
	call	__bit_xor
	jg	rax, x7, .LBB140_77
	jmp	.LBB140_61
.LBB140_61:                             // %.preheader16.preheader
                                        //   in Loop: Header=BB140_60 Depth=2
	mov	x9, x0
	add	x9, x3
	mov	x12, 0
.LBB140_62:                             // %.preheader16
                                        //   Parent Loop BB140_59 Depth=1
                                        //     Parent Loop BB140_60 Depth=2
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
	jg	rax, x8, .LBB140_64
	jmp	.LBB140_63
.LBB140_63:                             // %.preheader16
                                        //   in Loop: Header=BB140_62 Depth=3
	mov	r1, 255
	mov	r0, x6
	call	__bit_and
	jz	rax, .LBB140_62
	jmp	.LBB140_64
.LBB140_64:                             //   in Loop: Header=BB140_60 Depth=2
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
	jg	rax, x7, .LBB140_60
	jmp	.LBB140_65
.LBB140_65:                             //   in Loop: Header=BB140_59 Depth=1
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
	jnz	rax, .LBB140_67
	jmp	.LBB140_66
.LBB140_66:                             // %.preheader.i10.preheader
                                        //   in Loop: Header=BB140_59 Depth=1
	mov	r0, [x9]
	mov	r1, [x8]
	je	r0, r1, .LBB140_71
	jmp	.LBB140_67
.LBB140_67:                             // %.loopexit7.i9
                                        //   in Loop: Header=BB140_59 Depth=1
	mov	r0, [x9]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x8]
	mov	r1, 255
	mov	x9, rax
	call	__bit_and
	jne	x9, rax, .LBB140_75
	jmp	.LBB140_68
.LBB140_68:                             // %.loopexit7.i9.1
                                        //   in Loop: Header=BB140_59 Depth=1
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
	jne	x9, rax, .LBB140_75
	jmp	.LBB140_69
.LBB140_69:                             // %.loopexit7.i9.2
                                        //   in Loop: Header=BB140_59 Depth=1
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
	jne	x9, rax, .LBB140_75
	jmp	.LBB140_70
.LBB140_70:                             // %.loopexit7.i9.3
                                        //   in Loop: Header=BB140_59 Depth=1
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
	jne	x8, rax, .LBB140_75
	jmp	.LBB140_71
.LBB140_71:                             // %memcmp.exit12.thread
                                        //   in Loop: Header=BB140_59 Depth=1
	mov	r0, x0
	sub	r0, x7
	add	r0, x12
	mov	r1, x2
	mov	r2, x4
	call	memcmp
	jz	rax, .LBB140_76
	jmp	.LBB140_72
.LBB140_72:                             //   in Loop: Header=BB140_59 Depth=1
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	jg	rax, x11, .LBB140_74
	jmp	.LBB140_73
.LBB140_73:                             //   in Loop: Header=BB140_59 Depth=1
	mov	x5, x4
.LBB140_74:                             //   in Loop: Header=BB140_59 Depth=1
add	x5, -4
.LBB140_75:                             // %memcmp.exit12
                                        //   in Loop: Header=BB140_59 Depth=1
	mov	r1, 255
	mov	r0, x6
	call	__bit_and
	add	x0, x10
	sub	x0, rax
	add	x0, x12
	jmp	.LBB140_59
.LBB140_76:                             // %memcmp.exit.thread.loopexit4
	mov	r1, 255
	mov	r0, x6
	call	__bit_and
	sub	x0, rax
	add	x0, x12
	mov	x6, x0
.LBB140_77:                             // %memcmp.exit.thread
.LBB140_78:                             // %memchr.exit
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
	jge	rax, x3, .LBB141_10
	jmp	.LBB141_1
.LBB141_1:
	mov	x3, x2
	add	x3, x1
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x0
	call	__bit_xor
	jge	rax, x4, .LBB141_10
	jmp	.LBB141_2
.LBB141_2:
	mov	x4, x0
	mov	r1, -2147483648
	add	x4, x1
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB141_7
	jmp	.LBB141_3
.LBB141_3:
	mov	r0, x3
	mov	r1, x4
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB141_8
	jmp	.LBB141_4
.LBB141_4:                              // %.preheader.preheader
	mov	x3, -2147483645
.LBB141_5:                              // %.preheader
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
	jg	rax, x3, .LBB141_5
	jmp	.LBB141_6
.LBB141_6:                              // %.loopexit9.loopexit
	add	x2, x1
	mov	x4, x0
	add	x4, x1
	mov	x3, x2
.LBB141_7:                              // %.loopexit9
	jz	x1, .LBB141_21
	jmp	.LBB141_8
.LBB141_8:                              // %.preheader56
add	x3, -1
add	x4, -1
.LBB141_9:                              // =>This Inner Loop Header: Depth=1
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
	jz	x1, .LBB141_21
	jmp	.LBB141_9
.LBB141_10:
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	mov	x5, x0
	jl	rax, r0, .LBB141_18
	jmp	.LBB141_11
.LBB141_11:
	mov	r0, x2
	mov	r1, x0
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	x5, x0
	jnz	rax, .LBB141_19
	jmp	.LBB141_12
.LBB141_12:
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483632
	mov	x5, x0
	jl	rax, r0, .LBB141_15
	jmp	.LBB141_13
.LBB141_13:                             // %.preheader12.preheader
	mov	x3, -2147483633
	mov	x5, x0
	jmp	.LBB141_16
.LBB141_14:
	mov	r0, 4
	jl	x1, r0, .LBB141_18
	jmp	.LBB141_15
.LBB141_15:                             // %.preheader66
	mov	x3, -2147483645
	jmp	.LBB141_17
.LBB141_16:                             // %.preheader12
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
	jg	rax, x3, .LBB141_16
	jmp	.LBB141_14
.LBB141_17:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
add	x2, 4
	mov	[x5], r0
add	x1, -4
	mov	r1, -2147483648
add	x5, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x3, .LBB141_17
	jmp	.LBB141_18
.LBB141_18:                             // %.loopexit11
	jz	x1, .LBB141_21
	jmp	.LBB141_19
.LBB141_19:                             // %.preheader61
	mov	x6, x5
.LBB141_20:                             // =>This Inner Loop Header: Depth=1
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
	jnz	x1, .LBB141_20
	jmp	.LBB141_21
.LBB141_21:                             // %.loopexit
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
	jl	rax, r0, .LBB142_8
	jmp	.LBB142_1
.LBB142_1:
	mov	r0, x0
	mov	r1, x1
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB142_9
	jmp	.LBB142_2
.LBB142_2:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB142_5
	jmp	.LBB142_3
.LBB142_3:                              // %.preheader.preheader
	mov	x3, -2147483633
	jmp	.LBB142_6
.LBB142_4:
	mov	r0, 4
	jl	x2, r0, .LBB142_8
	jmp	.LBB142_5
.LBB142_5:                              // %.preheader35
	mov	x3, -2147483645
	jmp	.LBB142_7
.LBB142_6:                              // %.preheader
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
	jg	rax, x3, .LBB142_6
	jmp	.LBB142_4
.LBB142_7:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
add	x0, 4
	mov	[x1], r0
add	x2, -4
	mov	r1, -2147483648
add	x1, 4
	mov	r0, x2
	call	__bit_xor
	jg	rax, x3, .LBB142_7
	jmp	.LBB142_8
.LBB142_8:                              // %.loopexit4
	jz	x2, .LBB142_11
	jmp	.LBB142_9
.LBB142_9:                              // %.preheader32
	mov	x5, x1
.LBB142_10:                             // =>This Inner Loop Header: Depth=1
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
	jnz	x2, .LBB142_10
	jmp	.LBB142_11
.LBB142_11:                             // %.loopexit
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
.LBB143_1:                              // =>This Inner Loop Header: Depth=1
	mov	x6, x3
	mov	r0, x2
	add	r0, x7
	mov	r1, 3
	add	x6, x2
	call	__bit_and
	jz	rax, .LBB143_4
	jmp	.LBB143_2
.LBB143_2:                              //   in Loop: Header=BB143_1 Depth=1
	mov	rax, 0
	je	x2, x5, .LBB143_16
	jmp	.LBB143_3
.LBB143_3:                              //   in Loop: Header=BB143_1 Depth=1
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
	je	rax, x4, .LBB143_15
	jmp	.LBB143_1
.LBB143_4:
	mov	x4, x6
	mov	r1, -2147483648
add	x4, -1
	mov	r0, x1
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB143_11
	jmp	.LBB143_5
.LBB143_5:
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
	mov	x4, rax
	mul	x4, 16843009
	mov	x7, 0
	mov	x8, -2139062144
	mov	x9, -2147483645
.LBB143_6:                              // =>This Inner Loop Header: Depth=1
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
	jne	rax, x8, .LBB143_8
	jmp	.LBB143_7
.LBB143_7:                              //   in Loop: Header=BB143_6 Depth=1
add	x7, -4
	mov	x5, x1
	add	x5, x7
	mov	r1, -2147483648
	mov	r0, x5
	call	__bit_xor
	jg	rax, x9, .LBB143_6
	jmp	.LBB143_9
.LBB143_8:                              // %split
	add	x6, x7
	add	x1, x7
	mov	x4, x6
	jmp	.LBB143_10
.LBB143_9:                              // %._crit_edge
	add	x6, x7
	mov	x4, x6
	mov	x1, x5
.LBB143_10:
add	x4, -1
.LBB143_11:
	mov	rax, 0
	jz	x1, .LBB143_16
	jmp	.LBB143_12
.LBB143_12:                             // %.preheader.preheader
.LBB143_13:                             // %.preheader
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
	je	r0, x2, .LBB143_16
	jmp	.LBB143_14
.LBB143_14:                             //   in Loop: Header=BB143_13 Depth=1
add	x1, -1
add	x4, -1
	mov	rax, 0
	jz	x1, .LBB143_16
	jmp	.LBB143_13
.LBB143_15:                             // %..loopexit.loopexit1_crit_edge
	add	x3, x2
	mov	rax, x3
.LBB143_16:                             // %.loopexit
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
	jz	rax, .LBB144_4
	jmp	.LBB144_1
.LBB144_1:
	mov	x4, x1
add	x4, 1
	mov	x8, x1
.LBB144_2:                              // =>This Inner Loop Header: Depth=1
	jz	x2, .LBB144_14
	jmp	.LBB144_3
.LBB144_3:                              //   in Loop: Header=BB144_2 Depth=1
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
	jnz	rax, .LBB144_2
	jmp	.LBB144_4
.LBB144_4:                              // %.loopexit7
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB144_11
	jmp	.LBB144_5
.LBB144_5:
	mov	r1, -2147483648
	mul	x3, 16843009
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB144_8
	jmp	.LBB144_6
.LBB144_6:                              // %.preheader.preheader
	mov	x4, -2147483633
	jmp	.LBB144_9
.LBB144_7:
	mov	r0, 4
	jl	x2, r0, .LBB144_11
	jmp	.LBB144_8
.LBB144_8:                              // %.preheader35
	mov	x4, -2147483645
	jmp	.LBB144_10
.LBB144_9:                              // %.preheader
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
	jg	rax, x4, .LBB144_9
	jmp	.LBB144_7
.LBB144_10:                             // =>This Inner Loop Header: Depth=1
	mov	[x7], x3
add	x2, -4
	mov	r1, -2147483648
add	x7, 4
	mov	r0, x2
	call	__bit_xor
	jg	rax, x4, .LBB144_10
	jmp	.LBB144_11
.LBB144_11:                             // %.loopexit5
	jz	x2, .LBB144_14
	jmp	.LBB144_12
.LBB144_12:
	mov	x5, x7
.LBB144_13:                             // =>This Inner Loop Header: Depth=1
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
	jnz	x2, .LBB144_13
	jmp	.LBB144_14
.LBB144_14:                             // %.loopexit
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
	jz	rax, .LBB145_4
	jmp	.LBB145_1
.LBB145_1:
	mov	x2, x1
add	x2, 1
.LBB145_2:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
	mov	r0, [x1]
	mov	r1, 255
	mov	x3, rax
	call	__bit_and
	je	rax, x3, .LBB145_8
	jmp	.LBB145_3
.LBB145_3:                              //   in Loop: Header=BB145_2 Depth=1
	mov	r1, 3
add	x1, 1
	mov	r0, x2
	call	__bit_and
add	x2, 1
	jnz	rax, .LBB145_2
	jmp	.LBB145_4
.LBB145_4:                              // %.loopexit2
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
	mov	x2, rax
	mul	x2, 16843009
add	x1, -5
	mov	x3, -2139062144
.LBB145_5:                              // =>This Inner Loop Header: Depth=1
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
	je	rax, x3, .LBB145_5
	jmp	.LBB145_6
.LBB145_6:
.LBB145_7:                              // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, x0
	call	__bit_and
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	mov	x2, rax
	call	__bit_and
	jne	rax, x2, .LBB145_7
	jmp	.LBB145_8
.LBB145_8:                              // %.loopexit
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
	jz	x3, .LBB146_16
	jmp	.LBB146_1
.LBB146_1:                              // %.preheader.split.preheader.i
	mul	x3, 16843009
	mov	x0, 0
	mov	x7, -2139062144
.LBB146_2:                              // %.preheader.split.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB146_6 Depth 2
                                        //     Child Loop BB146_9 Depth 2
                                        //     Child Loop BB146_12 Depth 2
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	jz	rax, .LBB146_4
	jmp	.LBB146_3
.LBB146_3:                              // %.preheader29.i.preheader
                                        //   in Loop: Header=BB146_2 Depth=1
	mov	x4, x1
add	x4, 1
	jmp	.LBB146_6
.LBB146_4:                              // %.loopexit9.i.i
                                        //   in Loop: Header=BB146_2 Depth=1
	mov	x4, [x1]
	mov	r0, 16843008
	sub	r0, x4
	mov	r1, x4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x7, .LBB146_11
	jmp	.LBB146_5
.LBB146_5:                              // %.preheader5.i.i.preheader
                                        //   in Loop: Header=BB146_2 Depth=1
	jmp	.LBB146_9
.LBB146_6:                              // %.preheader29.i
                                        //   Parent Loop BB146_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x5, rax
	jz	x5, .LBB146_24
	jmp	.LBB146_7
.LBB146_7:                              //   in Loop: Header=BB146_6 Depth=2
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	je	rax, x6, .LBB146_15
	jmp	.LBB146_8
.LBB146_8:                              //   in Loop: Header=BB146_6 Depth=2
	mov	r1, 3
add	x1, 1
	mov	r0, x4
	call	__bit_and
add	x4, 1
	jz	rax, .LBB146_4
	jmp	.LBB146_6
.LBB146_9:                              // %.preheader5.i.i
                                        //   Parent Loop BB146_2 Depth=1
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
	jne	rax, x7, .LBB146_11
	jmp	.LBB146_10
.LBB146_10:                             //   in Loop: Header=BB146_9 Depth=2
add	x1, 4
	mov	x4, [x1]
	mov	r0, 16843008
	sub	r0, x4
	mov	r1, x4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x7, .LBB146_9
	jmp	.LBB146_11
.LBB146_11:                             // %.loopexit6.i.i.preheader
                                        //   in Loop: Header=BB146_2 Depth=1
add	x1, -1
.LBB146_12:                             // %.loopexit6.i.i
                                        //   Parent Loop BB146_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	jz	x4, .LBB146_14
	jmp	.LBB146_13
.LBB146_13:                             // %.loopexit6.i.i
                                        //   in Loop: Header=BB146_12 Depth=2
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	jne	rax, x5, .LBB146_12
	jmp	.LBB146_14
.LBB146_14:                             //   in Loop: Header=BB146_2 Depth=1
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	jne	rax, x5, .LBB146_24
	jmp	.LBB146_15
.LBB146_15:                             // %strchr.exit.i
                                        //   in Loop: Header=BB146_2 Depth=1
	mov	r0, x1
add	r0, 1
	mov	x0, x1
	mov	x1, r0
	jmp	.LBB146_2
.LBB146_16:
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	x0, x1
	jz	rax, .LBB146_20
	jmp	.LBB146_17
.LBB146_17:                             // %.preheader2.i1.i.preheader
	mov	x2, x1
add	x2, 1
	mov	x0, x1
.LBB146_18:                             // %.preheader2.i1.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB146_24
	jmp	.LBB146_19
.LBB146_19:                             //   in Loop: Header=BB146_18 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x2
	call	__bit_and
add	x2, 1
	jnz	rax, .LBB146_18
	jmp	.LBB146_20
.LBB146_20:                             // %.loopexit4.i2.i.preheader
add	x0, -5
	mov	x1, -2139062144
.LBB146_21:                             // %.loopexit4.i2.i
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
	je	rax, x1, .LBB146_21
	jmp	.LBB146_22
.LBB146_22:                             // %.preheader.i3.i.preheader
.LBB146_23:                             // %.preheader.i3.i
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB146_23
	jmp	.LBB146_24
.LBB146_24:                             // %strrchr.exit
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
	jnz	rax, .LBB147_4
	jmp	.LBB147_1
.LBB147_1:
	mov	x2, [x1]
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	x3, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x3, .LBB147_4
	jmp	.LBB147_2
.LBB147_2:                              // %.preheader.preheader
.LBB147_3:                              // %.preheader
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
	je	rax, x3, .LBB147_3
	jmp	.LBB147_4
.LBB147_4:                              // %.loopexit.preheader
add	x0, -1
.LBB147_5:                              // %.loopexit
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
	jnz	x2, .LBB147_5
	jmp	.LBB147_6
.LBB147_6:
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
	jl	rax, r0, .LBB148_5
	jmp	.LBB148_1
.LBB148_1:
	jnz	x3, .LBB148_5
	jmp	.LBB148_2
.LBB148_2:                              // %.preheader5.preheader
	mov	x4, -2139062144
	mov	x5, -2147483645
.LBB148_3:                              // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	x3, [x2]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB148_5
	jmp	.LBB148_4
.LBB148_4:                              //   in Loop: Header=BB148_3 Depth=1
add	x1, -4
add	x2, 4
	mov	[x0], x3
	mov	r1, -2147483648
add	x0, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x5, .LBB148_3
	jmp	.LBB148_5
.LBB148_5:                              // %.loopexit6.preheader
	mov	x5, 0
.LBB148_6:                              // %.loopexit6
                                        // =>This Inner Loop Header: Depth=1
	je	x1, x5, .LBB148_12
	jmp	.LBB148_7
.LBB148_7:                              //   in Loop: Header=BB148_6 Depth=1
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
	jnz	x3, .LBB148_6
	jmp	.LBB148_8
.LBB148_8:
	mov	x3, x0
	add	x3, x5
	mov	x2, x3
add	x2, -1
	je	x1, x5, .LBB148_13
	jmp	.LBB148_9
.LBB148_9:                              // %.preheader.preheader
	sub	x1, x5
	mov	x3, 0
.LBB148_10:                             // %.preheader
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
	jne	x1, x3, .LBB148_10
	jmp	.LBB148_11
.LBB148_11:                             // %.loopexit.loopexit
	add	x0, x5
	add	x0, x3
	mov	x3, x0
	jmp	.LBB148_13
.LBB148_12:                             // %.loopexit.loopexit1
	add	x0, x5
	mov	x2, 0
	mov	x3, x0
.LBB148_13:                             // %.loopexit
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
	jz	rax, .LBB149_4
	jmp	.LBB149_1
.LBB149_1:                              // %.preheader2.preheader
	mov	x3, x1
add	x3, 1
	mov	x2, x1
.LBB149_2:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB149_9
	jmp	.LBB149_3
.LBB149_3:                              //   in Loop: Header=BB149_2 Depth=1
	mov	r1, 3
add	x2, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
	jnz	rax, .LBB149_2
	jmp	.LBB149_4
.LBB149_4:                              // %.loopexit4
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB149_9
	jmp	.LBB149_5
.LBB149_5:                              // %.preheader1.preheader
add	x2, -5
	mov	x3, -2139062144
.LBB149_6:                              // %.preheader1
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
	je	rax, x3, .LBB149_6
	jmp	.LBB149_7
.LBB149_7:                              // %.preheader.preheader
.LBB149_8:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB149_8
	jmp	.LBB149_9
.LBB149_9:                              // %.loopexit
	mov	r0, x2
	mov	r1, x0
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	jnz	rax, .LBB149_13
	jmp	.LBB149_10
.LBB149_10:
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	x4, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB149_13
	jmp	.LBB149_11
.LBB149_11:                             // %.preheader.i.preheader
.LBB149_12:                             // %.preheader.i
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
	je	rax, x4, .LBB149_12
	jmp	.LBB149_13
.LBB149_13:                             // %.loopexit.i.preheader
	mov	x5, x2
.LBB149_14:                             // %.loopexit.i
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
	jnz	x3, .LBB149_14
	jmp	.LBB149_15
.LBB149_15:                             // %strcpy.exit
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
	jz	x2, .LBB150_3
	jmp	.LBB150_1
.LBB150_1:
	jz	rax, .LBB150_11
	jmp	.LBB150_2
.LBB150_2:
	mov	x4, x0
add	x4, 1
	jmp	.LBB150_13
.LBB150_3:
	mov	x3, x0
	jz	rax, .LBB150_7
	jmp	.LBB150_4
.LBB150_4:                              // %.preheader2.preheader
	mov	x1, x0
add	x1, 1
	mov	x3, x0
.LBB150_5:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB150_22
	jmp	.LBB150_6
.LBB150_6:                              //   in Loop: Header=BB150_5 Depth=1
	mov	r1, 3
add	x3, 1
	mov	r0, x1
	call	__bit_and
add	x1, 1
	jnz	rax, .LBB150_5
	jmp	.LBB150_7
.LBB150_7:                              // %.loopexit4.preheader
add	x3, -5
	mov	x0, -2139062144
.LBB150_8:                              // %.loopexit4
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
	je	rax, x0, .LBB150_8
	jmp	.LBB150_9
.LBB150_9:                              // %.preheader.preheader
.LBB150_10:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	x3, 1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB150_22
	jmp	.LBB150_10
.LBB150_11:                             // %.loopexit9
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	x4, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB150_18
	jmp	.LBB150_12
.LBB150_12:                             // %.preheader5.preheader
	mul	x2, 16843009
	jmp	.LBB150_16
.LBB150_13:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x5, rax
	mov	x3, 0
	jz	x5, .LBB150_22
	jmp	.LBB150_14
.LBB150_14:                             //   in Loop: Header=BB150_13 Depth=1
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	x3, x0
	je	rax, x6, .LBB150_22
	jmp	.LBB150_15
.LBB150_15:                             //   in Loop: Header=BB150_13 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x4
	call	__bit_and
add	x4, 1
	jz	rax, .LBB150_11
	jmp	.LBB150_13
.LBB150_16:                             // %.preheader5
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
	jne	rax, x4, .LBB150_18
	jmp	.LBB150_17
.LBB150_17:                             //   in Loop: Header=BB150_16 Depth=1
add	x0, 4
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x4, .LBB150_16
	jmp	.LBB150_18
.LBB150_18:                             // %.loopexit6
add	x0, -1
.LBB150_19:                             // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
	jz	x2, .LBB150_21
	jmp	.LBB150_20
.LBB150_20:                             //   in Loop: Header=BB150_19 Depth=1
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	jne	rax, x3, .LBB150_19
	jmp	.LBB150_21
.LBB150_21:
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
.LBB150_22:                             // %.loopexit
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
	jz	x4, .LBB151_3
	jmp	.LBB151_1
.LBB151_1:
	mov	x0, x1
	jz	x2, .LBB151_11
	jmp	.LBB151_2
.LBB151_2:
	mov	x5, x1
add	x5, 1
	mov	x0, x1
	jmp	.LBB151_13
.LBB151_3:
	mov	x0, x1
	jz	x2, .LBB151_7
	jmp	.LBB151_4
.LBB151_4:                              // %.preheader2.i.preheader
	mov	x2, x1
add	x2, 1
	mov	x0, x1
.LBB151_5:                              // %.preheader2.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB151_32
	jmp	.LBB151_6
.LBB151_6:                              //   in Loop: Header=BB151_5 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x2
	call	__bit_and
add	x2, 1
	jnz	rax, .LBB151_5
	jmp	.LBB151_7
.LBB151_7:                              // %.loopexit4.i.preheader
add	x0, -5
	mov	x1, -2139062144
.LBB151_8:                              // %.loopexit4.i
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
	je	rax, x1, .LBB151_8
	jmp	.LBB151_9
.LBB151_9:                              // %.preheader.i.preheader
.LBB151_10:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB151_32
	jmp	.LBB151_10
.LBB151_11:                             // %.loopexit9.i
	mov	x5, [x0]
	mov	r0, 16843008
	sub	r0, x5
	mov	r1, x5
	call	__bit_or
	mov	r1, -2139062144
	mov	x6, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x6, .LBB151_18
	jmp	.LBB151_12
.LBB151_12:                             // %.preheader5.i.preheader
	mul	x4, 16843009
	jmp	.LBB151_16
.LBB151_13:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x6, rax
	jz	x6, .LBB151_22
	jmp	.LBB151_14
.LBB151_14:                             //   in Loop: Header=BB151_13 Depth=1
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x6
	call	__bit_and
	je	rax, x7, .LBB151_32
	jmp	.LBB151_15
.LBB151_15:                             //   in Loop: Header=BB151_13 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x5
	call	__bit_and
add	x5, 1
	jz	rax, .LBB151_11
	jmp	.LBB151_13
.LBB151_16:                             // %.preheader5.i
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
	jne	rax, x6, .LBB151_18
	jmp	.LBB151_17
.LBB151_17:                             //   in Loop: Header=BB151_16 Depth=1
add	x0, 4
	mov	x5, [x0]
	mov	r0, 16843008
	sub	r0, x5
	mov	r1, x5
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x6, .LBB151_16
	jmp	.LBB151_18
.LBB151_18:                             // %.loopexit6.i
add	x0, -1
.LBB151_19:                             // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	jz	x4, .LBB151_21
	jmp	.LBB151_20
.LBB151_20:                             //   in Loop: Header=BB151_19 Depth=1
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	jne	rax, x5, .LBB151_19
	jmp	.LBB151_21
.LBB151_21:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x4
	call	__bit_and
	je	rax, x3, .LBB151_32
	jmp	.LBB151_22
.LBB151_22:                             // %strchr.exit
	jz	x2, .LBB151_27
	jmp	.LBB151_23
.LBB151_23:
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x0, x1
	jz	rax, .LBB151_31
	jmp	.LBB151_24
.LBB151_24:                             // %.preheader1.i.preheader
	mov	r0, x1
add	r0, 1
	mov	x0, x1
	mov	x1, r0
	jmp	.LBB151_26
.LBB151_25:                             //   in Loop: Header=BB151_26 Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB151_31
	jmp	.LBB151_26
.LBB151_26:                             // %.preheader1.i
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r1, 3
	mov	r0, x0
	call	__bit_and
	jnz	rax, .LBB151_25
	jmp	.LBB151_27
.LBB151_27:                             // %.loopexit.i.preheader
	mov	x2, x1
add	x2, -1
	mov	x3, -2139062144
.LBB151_28:                             // %.loopexit.i
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
	je	rax, x3, .LBB151_28
	jmp	.LBB151_29
.LBB151_29:                             // %.preheader.i1.preheader
	mov	x2, -4
.LBB151_30:                             // %.preheader.i1
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x1
	add	r0, x2
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x0, 1
add	x2, 1
	jnz	rax, .LBB151_30
	jmp	.LBB151_31
.LBB151_31:                             // %strlen.exit
.LBB151_32:                             // %strchr.exit.thread
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
	jz	rax, .LBB152_2
	jmp	.LBB152_1
.LBB152_1:
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
	jmp	.LBB152_7
.LBB152_2:
	mov	x2, [x1]
	mov	r0, [x0]
	jne	x2, r0, .LBB152_7
	jmp	.LBB152_3
.LBB152_3:                              // %.preheader5.preheader
	mov	x4, -2139062144
	mov	x3, 0
.LBB152_4:                              // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, x2
	mov	r1, x2
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB152_13
	jmp	.LBB152_5
.LBB152_5:                              //   in Loop: Header=BB152_4 Depth=1
add	x1, 4
add	x0, 4
	mov	x2, [x1]
	mov	r0, [x0]
	je	x2, r0, .LBB152_4
	jmp	.LBB152_6
.LBB152_6:
.LBB152_7:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	x3, 0
	jz	rax, .LBB152_12
	jmp	.LBB152_8
.LBB152_8:                              // %.preheader.preheader
add	x1, 1
.LBB152_9:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	mov	r0, x2
	jne	rax, x3, .LBB152_11
	jmp	.LBB152_10
.LBB152_10:                             //   in Loop: Header=BB152_9 Depth=1
	mov	r0, [x1]
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	x2, rax
add	x1, 1
	mov	r0, 0
	jnz	x2, .LBB152_9
	jmp	.LBB152_11
.LBB152_11:
	mov	r1, 255
	call	__bit_and
	mov	x3, rax
.LBB152_12:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	sub	x3, rax
.LBB152_13:                             // %.loopexit
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
	jnz	rax, .LBB153_4
	jmp	.LBB153_1
.LBB153_1:
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
	jne	rax, x3, .LBB153_4
	jmp	.LBB153_2
.LBB153_2:                              // %.preheader.preheader
	mov	x4, x0
.LBB153_3:                              // %.preheader
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
	je	rax, x3, .LBB153_3
	jmp	.LBB153_4
.LBB153_4:                              // %.loopexit.preheader
	mov	x5, x4
.LBB153_5:                              // %.loopexit
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
	jnz	x2, .LBB153_5
	jmp	.LBB153_6
.LBB153_6:
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
	jz	x3, .LBB154_9
	jmp	.LBB154_1
.LBB154_1:
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	jz	x4, .LBB154_3
	jmp	.LBB154_2
.LBB154_2:                              // %.preheader4.preheader
add	x1, 1
	mov	x2, x0
	jmp	.LBB154_5
.LBB154_3:                              // %.preheader.preheader
	mov	x2, x0
.LBB154_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB154_9
	jmp	.LBB154_4
.LBB154_5:                              // %.preheader4
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB154_7 Depth 2
	mov	x6, x1
	mov	rax, x4
	jmp	.LBB154_7
.LBB154_6:                              //   in Loop: Header=BB154_7 Depth=2
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
add	x6, 1
	jz	rax, .LBB154_8
	jmp	.LBB154_7
.LBB154_7:                              //   Parent Loop BB154_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x3
	call	__bit_and
	je	rax, x5, .LBB154_9
	jmp	.LBB154_6
.LBB154_8:                              //   in Loop: Header=BB154_5 Depth=1
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	x3, rax
	jnz	x3, .LBB154_5
	jmp	.LBB154_9
.LBB154_9:                              // %.loopexit
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
	jz	rax, .LBB155_5
	jmp	.LBB155_1
.LBB155_1:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x3, x0
	jz	rax, .LBB155_9
	jmp	.LBB155_2
.LBB155_2:                              // %.preheader1.i.preheader
	mov	x1, x0
add	x1, 1
	mov	x3, x0
	jmp	.LBB155_4
.LBB155_3:                              //   in Loop: Header=BB155_4 Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
add	x1, 1
	jz	rax, .LBB155_9
	jmp	.LBB155_4
.LBB155_4:                              // %.preheader1.i
                                        // =>This Inner Loop Header: Depth=1
add	x3, 1
	mov	r1, 3
	mov	r0, x3
	call	__bit_and
	jnz	rax, .LBB155_3
	jmp	.LBB155_5
.LBB155_5:                              // %.loopexit.i.preheader
	mov	x2, x1
add	x2, -1
	mov	x4, -2139062144
.LBB155_6:                              // %.loopexit.i
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
	je	rax, x4, .LBB155_6
	jmp	.LBB155_7
.LBB155_7:                              // %.preheader.i.preheader
	mov	x2, -4
.LBB155_8:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x1
	add	r0, x2
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x3, 1
add	x2, 1
	jnz	rax, .LBB155_8
	jmp	.LBB155_9
.LBB155_9:                              // %strlen.exit
	sub	x3, x0
add	x3, 1
	mov	r0, x3
	call	malloc
	mov	x1, rax
	jz	x1, .LBB155_26
	jmp	.LBB155_10
.LBB155_10:
	mov	r1, -2147483648
	mov	r0, x3
	call	__bit_xor
	mov	r0, -2147483632
	mov	x6, x1
	jl	rax, r0, .LBB155_23
	jmp	.LBB155_11
.LBB155_11:
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	x2, rax
	mov	x7, 8
	sub	x7, x2
	mov	x10, 0
	mov	x4, x0
.LBB155_12:                             // =>This Inner Loop Header: Depth=1
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
	jne	x7, x10, .LBB155_12
	jmp	.LBB155_13
.LBB155_13:
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
	jnz	rax, .LBB155_20
	jmp	.LBB155_14
.LBB155_14:
	mov	x6, x1
	mov	r1, -2147483648
	add	x6, x10
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB155_16
	jmp	.LBB155_15
.LBB155_15:                             // %.preheader.i2.preheader
	mov	x6, x1
	add	x6, x10
	add	x0, x10
	mov	x3, 0
	mov	x4, -2147483633
	jmp	.LBB155_18
.LBB155_16:                             // %.preheader77
	mov	x4, -2147483645
	mov	x3, x2
	mov	x0, x5
	jmp	.LBB155_19
.LBB155_17:
	add	x0, x3
	mov	r0, 3
	add	x6, x3
	mov	x5, x0
	mov	x3, x2
	jg	x2, r0, .LBB155_16
	jmp	.LBB155_23
.LBB155_18:                             // %.preheader.i2
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
	jg	rax, x4, .LBB155_18
	jmp	.LBB155_17
.LBB155_19:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
add	x0, 4
	mov	[x6], r0
add	x3, -4
	mov	r1, -2147483648
add	x6, 4
	mov	r0, x3
	call	__bit_xor
	jg	rax, x4, .LBB155_19
	jmp	.LBB155_23
.LBB155_20:
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
.LBB155_21:                             // =>This Inner Loop Header: Depth=1
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
	jge	rax, x9, .LBB155_21
	jmp	.LBB155_22
.LBB155_22:
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
	jmp	.LBB155_24
.LBB155_23:                             // %.loopexit8.i
	mov	x2, x3
	jz	x3, .LBB155_26
	jmp	.LBB155_24
.LBB155_24:                             // %.preheader
	mov	x5, x6
.LBB155_25:                             // =>This Inner Loop Header: Depth=1
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
	jnz	x2, .LBB155_25
	jmp	.LBB155_26
.LBB155_26:                             // %memcpy.exit
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
	jz	rax, .LBB156_5
	jmp	.LBB156_1
.LBB156_1:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x1, x0
	jz	rax, .LBB156_9
	jmp	.LBB156_2
.LBB156_2:                              // %.preheader1.preheader
	mov	x2, x0
add	x2, 1
	mov	x1, x0
	jmp	.LBB156_4
.LBB156_3:                              //   in Loop: Header=BB156_4 Depth=1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
add	x2, 1
	jz	rax, .LBB156_9
	jmp	.LBB156_4
.LBB156_4:                              // %.preheader1
                                        // =>This Inner Loop Header: Depth=1
add	x1, 1
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	jnz	rax, .LBB156_3
	jmp	.LBB156_5
.LBB156_5:                              // %.loopexit.preheader
	mov	x3, x2
add	x3, -1
	mov	x4, -2139062144
.LBB156_6:                              // %.loopexit
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
	je	rax, x4, .LBB156_6
	jmp	.LBB156_7
.LBB156_7:                              // %.preheader.preheader
	mov	x3, -4
.LBB156_8:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x2
	add	r0, x3
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x1, 1
add	x3, 1
	jnz	rax, .LBB156_8
	jmp	.LBB156_9
.LBB156_9:                              // %.loopexit2
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
	jz	rax, .LBB157_4
	jmp	.LBB157_1
.LBB157_1:                              // %.preheader5.preheader
	mov	x3, x0
add	x3, 1
	mov	x5, x0
.LBB157_2:                              // %.preheader5
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB157_9
	jmp	.LBB157_3
.LBB157_3:                              //   in Loop: Header=BB157_2 Depth=1
	mov	r1, 3
add	x5, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
	jnz	rax, .LBB157_2
	jmp	.LBB157_4
.LBB157_4:                              // %.loopexit7
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB157_9
	jmp	.LBB157_5
.LBB157_5:                              // %.preheader4.preheader
add	x5, -5
	mov	x3, -2139062144
.LBB157_6:                              // %.preheader4
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
	je	rax, x3, .LBB157_6
	jmp	.LBB157_7
.LBB157_7:                              // %.preheader2.preheader
.LBB157_8:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
add	x5, 1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB157_8
	jmp	.LBB157_9
.LBB157_9:                              // %.loopexit3
	jz	x2, .LBB157_14
	jmp	.LBB157_10
.LBB157_10:                             // %.preheader.preheader
.LBB157_11:                             // %.preheader
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
	jz	x3, .LBB157_14
	jmp	.LBB157_12
.LBB157_12:                             //   in Loop: Header=BB157_11 Depth=1
add	x5, 1
add	x2, -1
add	x1, 1
	jnz	x2, .LBB157_11
	jmp	.LBB157_13
.LBB157_13:
	mov	r0, [x5]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x5], rax
.LBB157_14:                             // %.loopexit
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
	jz	x1, .LBB158_14
	jmp	.LBB158_1
.LBB158_1:
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
	jl	rax, r0, .LBB158_8
	jmp	.LBB158_2
.LBB158_2:
	jnz	x4, .LBB158_8
	jmp	.LBB158_3
.LBB158_3:                              // %.preheader10.preheader
	mov	x4, 4
	mov	x5, -2139062144
	mov	x6, -2147483645
.LBB158_4:                              // %.preheader10
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [x3]
	mov	r0, [x2]
	jne	r1, r0, .LBB158_8
	jmp	.LBB158_5
.LBB158_5:                              //   in Loop: Header=BB158_4 Depth=1
	je	x1, x4, .LBB158_14
	jmp	.LBB158_6
.LBB158_6:                              //   in Loop: Header=BB158_4 Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x5, .LBB158_14
	jmp	.LBB158_7
.LBB158_7:                              //   in Loop: Header=BB158_4 Depth=1
add	x1, -4
add	x3, 4
	mov	r1, -2147483648
add	x2, 4
	mov	r0, x1
	call	__bit_xor
	jg	rax, x6, .LBB158_4
	jmp	.LBB158_8
.LBB158_8:                              // %.loopexit11
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x2]
	mov	r1, 255
	mov	x4, rax
	call	__bit_and
	jne	x4, rax, .LBB158_13
	jmp	.LBB158_9
.LBB158_9:                              // %.preheader.preheader
add	x1, -1
add	x2, 1
add	x3, 1
.LBB158_10:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, x4
	call	__bit_and
	jz	rax, .LBB158_14
	jmp	.LBB158_11
.LBB158_11:                             // %.preheader
                                        //   in Loop: Header=BB158_10 Depth=1
	jz	x1, .LBB158_14
	jmp	.LBB158_12
.LBB158_12:                             //   in Loop: Header=BB158_10 Depth=1
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
	je	x4, rax, .LBB158_10
	jmp	.LBB158_13
.LBB158_13:                             // %.loopexit9
	mov	r1, 255
	mov	r0, x4
	mov	x1, rax
	call	__bit_and
	mov	r1, 255
	mov	x0, rax
	mov	r0, x1
	call	__bit_and
	sub	x0, rax
.LBB158_14:                             // %.loopexit
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
	jl	rax, r0, .LBB159_5
	jmp	.LBB159_1
.LBB159_1:
	mov	x5, x1
	jnz	x3, .LBB159_5
	jmp	.LBB159_2
.LBB159_2:                              // %.preheader4.preheader
	mov	x4, -2139062144
	mov	x6, -2147483645
	mov	x5, x1
.LBB159_3:                              // %.preheader4
                                        // =>This Inner Loop Header: Depth=1
	mov	x3, [x2]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB159_6
	jmp	.LBB159_4
.LBB159_4:                              //   in Loop: Header=BB159_3 Depth=1
add	x0, -4
add	x2, 4
	mov	[x5], x3
	mov	r1, -2147483648
add	x5, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x6, .LBB159_3
	jmp	.LBB159_5
.LBB159_5:                              // %.loopexit6
	jz	x0, .LBB159_12
	jmp	.LBB159_6
.LBB159_6:                              // %.loopexit5.preheader
	mov	x6, 1
.LBB159_7:                              // %.loopexit5
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
	jz	x3, .LBB159_9
	jmp	.LBB159_8
.LBB159_8:                              // %.loopexit5
                                        //   in Loop: Header=BB159_7 Depth=1
add	x2, 1
	jne	x7, x6, .LBB159_7
	jmp	.LBB159_9
.LBB159_9:
	jz	x0, .LBB159_12
	jmp	.LBB159_10
.LBB159_10:                             // %.preheader.preheader
	mov	x2, 0
.LBB159_11:                             // %.preheader
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
	jne	x0, x2, .LBB159_11
	jmp	.LBB159_12
.LBB159_12:                             // %.loopexit
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
	jz	x1, .LBB160_4
	jmp	.LBB160_1
.LBB160_1:
	mov	x3, x0
	add	x3, x1
	mov	x4, x0
.LBB160_2:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	x2, x4
	jz	rax, .LBB160_4
	jmp	.LBB160_3
.LBB160_3:                              //   in Loop: Header=BB160_2 Depth=1
add	x1, -1
add	x4, 1
	mov	x2, x3
	jnz	x1, .LBB160_2
	jmp	.LBB160_4
.LBB160_4:                              // %.loopexit
	sub	x2, x0
	mov	r0, x2
add	r0, 1
	call	malloc
	mov	x1, rax
	jz	x1, .LBB160_22
	jmp	.LBB160_5
.LBB160_5:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483632
	mov	x6, x1
	mov	x3, x2
	jl	rax, r0, .LBB160_18
	jmp	.LBB160_6
.LBB160_6:
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	x3, rax
	mov	x7, 8
	sub	x7, x3
	mov	x11, 0
	mov	x4, x0
.LBB160_7:                              // =>This Inner Loop Header: Depth=1
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
	jne	x7, x11, .LBB160_7
	jmp	.LBB160_8
.LBB160_8:
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
	jnz	rax, .LBB160_15
	jmp	.LBB160_9
.LBB160_9:
	mov	x6, x1
	mov	r1, -2147483648
	add	x6, x11
	mov	r0, x3
	call	__bit_xor
	mov	r0, -2147483632
	jl	rax, r0, .LBB160_11
	jmp	.LBB160_10
.LBB160_10:                             // %.preheader.i.preheader
	mov	x6, x1
	add	x6, x11
	add	x0, x11
	mov	x4, 0
	mov	x5, -2147483633
	jmp	.LBB160_13
.LBB160_11:                             // %.preheader55
	mov	x4, -2147483645
	mov	x0, x5
	jmp	.LBB160_14
.LBB160_12:
	add	x0, x4
	mov	r0, 3
	add	x6, x4
	mov	x5, x0
	jg	x3, r0, .LBB160_11
	jmp	.LBB160_18
.LBB160_13:                             // %.preheader.i
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
	jg	rax, x5, .LBB160_13
	jmp	.LBB160_12
.LBB160_14:                             // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
add	x0, 4
	mov	[x6], r0
add	x3, -4
	mov	r1, -2147483648
add	x6, 4
	mov	r0, x3
	call	__bit_xor
	jg	rax, x4, .LBB160_14
	jmp	.LBB160_18
.LBB160_15:
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
.LBB160_16:                             // =>This Inner Loop Header: Depth=1
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
	jge	rax, x10, .LBB160_16
	jmp	.LBB160_17
.LBB160_17:
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
	jmp	.LBB160_19
.LBB160_18:                             // %.loopexit8.i
	jz	x3, .LBB160_21
	jmp	.LBB160_19
.LBB160_19:                             // %.preheader
	mov	x7, x6
.LBB160_20:                             // =>This Inner Loop Header: Depth=1
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
	jnz	x3, .LBB160_20
	jmp	.LBB160_21
.LBB160_21:                             // %memcpy.exit
	mov	x0, x1
	add	x0, x2
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
.LBB160_22:
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
	jz	x1, .LBB161_4
	jmp	.LBB161_1
.LBB161_1:
	mov	x2, x0
	add	x2, x1
	mov	x3, x0
.LBB161_2:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, x3
	jz	r0, .LBB161_4
	jmp	.LBB161_3
.LBB161_3:                              //   in Loop: Header=BB161_2 Depth=1
add	x1, -1
add	x3, 1
	mov	rax, x2
	jnz	x1, .LBB161_2
	jmp	.LBB161_4
.LBB161_4:                              // %.loopexit
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
	jz	x2, .LBB162_4
	jmp	.LBB162_1
.LBB162_1:
	mov	x4, x1
	add	x4, x2
	mov	x5, x2
	mov	x6, x1
.LBB162_2:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	mov	x3, x6
	jz	rax, .LBB162_4
	jmp	.LBB162_3
.LBB162_3:                              //   in Loop: Header=BB162_2 Depth=1
add	x5, -1
add	x6, 1
	mov	x3, x4
	jnz	x5, .LBB162_2
	jmp	.LBB162_4
.LBB162_4:                              // %strnlen.exit
	mov	r1, -2147483648
	sub	x3, x1
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x4, rax
	mov	r0, x3
	call	__bit_xor
	jl	rax, x4, .LBB162_6
	jmp	.LBB162_5
.LBB162_5:
	mov	r0, x1
	add	r0, x3
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 0
	jnz	r0, .LBB162_21
	jmp	.LBB162_6
.LBB162_6:
	mov	r0, x0
	mov	r1, x2
	mov	r2, x1
	mov	r3, x3
	call	memmem
	mov	x1, rax
	mov	rax, 0
	jz	x1, .LBB162_21
	jmp	.LBB162_7
.LBB162_7:
	mov	x2, x1
	mov	r1, 3
	sub	x2, x0
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB162_13
	jmp	.LBB162_8
.LBB162_8:                              // %.preheader2.preheader
	mov	x3, x0
.LBB162_9:                              // %.preheader2
                                        // =>This Inner Loop Header: Depth=1
	mov	rax, x1
	je	x1, x3, .LBB162_21
	jmp	.LBB162_10
.LBB162_10:                             //   in Loop: Header=BB162_9 Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 0
	jz	r0, .LBB162_21
	jmp	.LBB162_11
.LBB162_11:                             //   in Loop: Header=BB162_9 Depth=1
add	x3, 1
	mov	r1, 3
add	x0, 1
	mov	r0, x3
	call	__bit_and
	jnz	rax, .LBB162_9
	jmp	.LBB162_12
.LBB162_12:                             // %.loopexit9.i.loopexit
	mov	x2, x1
	sub	x2, x3
.LBB162_13:                             // %.loopexit9.i
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483644
	jl	rax, r0, .LBB162_17
	jmp	.LBB162_14
.LBB162_14:                             // %.preheader.preheader
	mov	x3, -2139062144
	mov	x4, -2147483645
.LBB162_15:                             // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, [x0]
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x3, .LBB162_18
	jmp	.LBB162_16
.LBB162_16:                             //   in Loop: Header=BB162_15 Depth=1
add	x2, -4
	mov	r1, -2147483648
add	x0, 4
	mov	r0, x2
	call	__bit_xor
	jg	rax, x4, .LBB162_15
	jmp	.LBB162_17
.LBB162_17:                             // %.loopexit6.i
	mov	rax, x1
	jz	x2, .LBB162_21
	jmp	.LBB162_18
.LBB162_18:                             // %.loopexit5.i.preheader
.LBB162_19:                             // %.loopexit5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 0
	jz	r0, .LBB162_21
	jmp	.LBB162_20
.LBB162_20:                             //   in Loop: Header=BB162_19 Depth=1
add	x2, -1
add	x0, 1
	mov	rax, x1
	jnz	x2, .LBB162_19
	jmp	.LBB162_21
.LBB162_21:                             // %memchr.exit
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
	jz	x1, .LBB163_7
	jmp	.LBB163_1
.LBB163_1:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x3, rax
	jz	x3, .LBB163_7
	jmp	.LBB163_2
.LBB163_2:                              // %.preheader.preheader
add	x0, 1
.LBB163_3:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB163_5 Depth 2
	mov	x2, x4
	mov	x5, x0
	mov	rax, x3
	jmp	.LBB163_5
.LBB163_4:                              //   in Loop: Header=BB163_5 Depth=2
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
add	x5, 1
	jz	rax, .LBB163_6
	jmp	.LBB163_5
.LBB163_5:                              //   Parent Loop BB163_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x1
	call	__bit_and
	je	rax, x4, .LBB163_7
	jmp	.LBB163_4
.LBB163_6:                              //   in Loop: Header=BB163_3 Depth=1
add	x2, 1
	mov	r0, [x2]
	mov	r1, 255
	call	__bit_and
	mov	x1, rax
	mov	x4, x2
	mov	x2, 0
	jnz	x1, .LBB163_3
	jmp	.LBB163_7
.LBB163_7:                              // %.loopexit
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
	jz	x3, .LBB164_16
	jmp	.LBB164_1
.LBB164_1:                              // %.preheader.split.preheader
	mul	x3, 16843009
	mov	x0, 0
	mov	x7, -2139062144
.LBB164_2:                              // %.preheader.split
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB164_6 Depth 2
                                        //     Child Loop BB164_9 Depth 2
                                        //     Child Loop BB164_12 Depth 2
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	jz	rax, .LBB164_4
	jmp	.LBB164_3
.LBB164_3:                              // %.preheader29.preheader
                                        //   in Loop: Header=BB164_2 Depth=1
	mov	x4, x1
add	x4, 1
	jmp	.LBB164_6
.LBB164_4:                              // %.loopexit9.i
                                        //   in Loop: Header=BB164_2 Depth=1
	mov	x4, [x1]
	mov	r0, 16843008
	sub	r0, x4
	mov	r1, x4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x7, .LBB164_11
	jmp	.LBB164_5
.LBB164_5:                              // %.preheader5.i.preheader
                                        //   in Loop: Header=BB164_2 Depth=1
	jmp	.LBB164_9
.LBB164_6:                              // %.preheader29
                                        //   Parent Loop BB164_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x5, rax
	jz	x5, .LBB164_24
	jmp	.LBB164_7
.LBB164_7:                              //   in Loop: Header=BB164_6 Depth=2
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	je	rax, x6, .LBB164_15
	jmp	.LBB164_8
.LBB164_8:                              //   in Loop: Header=BB164_6 Depth=2
	mov	r1, 3
add	x1, 1
	mov	r0, x4
	call	__bit_and
add	x4, 1
	jz	rax, .LBB164_4
	jmp	.LBB164_6
.LBB164_9:                              // %.preheader5.i
                                        //   Parent Loop BB164_2 Depth=1
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
	jne	rax, x7, .LBB164_11
	jmp	.LBB164_10
.LBB164_10:                             //   in Loop: Header=BB164_9 Depth=2
add	x1, 4
	mov	x4, [x1]
	mov	r0, 16843008
	sub	r0, x4
	mov	r1, x4
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x7, .LBB164_9
	jmp	.LBB164_11
.LBB164_11:                             // %.loopexit6.i.preheader
                                        //   in Loop: Header=BB164_2 Depth=1
add	x1, -1
.LBB164_12:                             // %.loopexit6.i
                                        //   Parent Loop BB164_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
add	x1, 1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	jz	x4, .LBB164_14
	jmp	.LBB164_13
.LBB164_13:                             // %.loopexit6.i
                                        //   in Loop: Header=BB164_12 Depth=2
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	jne	rax, x5, .LBB164_12
	jmp	.LBB164_14
.LBB164_14:                             //   in Loop: Header=BB164_2 Depth=1
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x4
	call	__bit_and
	jne	rax, x5, .LBB164_24
	jmp	.LBB164_15
.LBB164_15:                             // %strchr.exit
                                        //   in Loop: Header=BB164_2 Depth=1
	mov	r0, x1
add	r0, 1
	mov	x0, x1
	mov	x1, r0
	jmp	.LBB164_2
.LBB164_16:
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	x0, x1
	jz	rax, .LBB164_20
	jmp	.LBB164_17
.LBB164_17:                             // %.preheader2.i1.preheader
	mov	x2, x1
add	x2, 1
	mov	x0, x1
.LBB164_18:                             // %.preheader2.i1
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB164_24
	jmp	.LBB164_19
.LBB164_19:                             //   in Loop: Header=BB164_18 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x2
	call	__bit_and
add	x2, 1
	jnz	rax, .LBB164_18
	jmp	.LBB164_20
.LBB164_20:                             // %.loopexit4.i2.preheader
add	x0, -5
	mov	x1, -2139062144
.LBB164_21:                             // %.loopexit4.i2
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
	je	rax, x1, .LBB164_21
	jmp	.LBB164_22
.LBB164_22:                             // %.preheader.i3.preheader
.LBB164_23:                             // %.preheader.i3
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB164_23
	jmp	.LBB164_24
.LBB164_24:                             // %strchr.exit4
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
	jz	x4, .LBB165_14
	jmp	.LBB165_1
.LBB165_1:
	mov	r0, [x4]
	mov	x5, x4
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x2, rax
	mov	x6, x1
.LBB165_2:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB165_5
	jmp	.LBB165_3
.LBB165_3:                              //   in Loop: Header=BB165_2 Depth=1
	mov	r1, 255
add	x6, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	jne	rax, x3, .LBB165_2
	jmp	.LBB165_4
.LBB165_4:
	mov	[x0], x5
	mov	r0, [x4]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x4], rax
	mov	rax, x4
	jmp	.LBB165_14
.LBB165_5:                              // %.loopexit.i
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	jz	rax, .LBB165_7
	jmp	.LBB165_6
.LBB165_6:                              // %.preheader.i.preheader
	jmp	.LBB165_8
.LBB165_7:
	mov	[x0], 0
	mov	rax, 0
	jmp	.LBB165_14
.LBB165_8:                              // %.preheader.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB165_9 Depth 2
	mov	x6, x5
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x2, rax
	mov	x7, x1
.LBB165_9:                              //   Parent Loop BB165_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	jne	x3, rax, .LBB165_13
	jmp	.LBB165_10
.LBB165_10:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r0, 0
	jz	rax, .LBB165_12
	jmp	.LBB165_11
.LBB165_11:
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x6], rax
	mov	r0, x5
.LBB165_12:
	mov	[x0], r0
	mov	rax, x4
	jmp	.LBB165_14
.LBB165_13:                             //   in Loop: Header=BB165_9 Depth=2
	mov	r1, 255
add	x7, 1
	mov	r0, x3
	call	__bit_and
	jz	rax, .LBB165_8
	jmp	.LBB165_9
.LBB165_14:                             // %__strtok_r.exit
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
	jz	x2, .LBB166_7
	jmp	.LBB166_1
.LBB166_1:
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	x3, rax
	mov	x4, x0
	jz	x3, .LBB166_7
	jmp	.LBB166_2
.LBB166_2:                              // %.preheader.preheader
add	x1, 1
	mov	x4, x0
.LBB166_3:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB166_5 Depth 2
	mov	x6, x1
	mov	rax, x3
	jmp	.LBB166_5
.LBB166_4:                              //   in Loop: Header=BB166_5 Depth=2
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
add	x6, 1
	jz	rax, .LBB166_7
	jmp	.LBB166_5
.LBB166_5:                              //   Parent Loop BB166_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x2
	call	__bit_and
	jne	rax, x5, .LBB166_4
	jmp	.LBB166_6
.LBB166_6:                              //   in Loop: Header=BB166_3 Depth=1
add	x4, 1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
	jnz	x2, .LBB166_3
	jmp	.LBB166_7
.LBB166_7:                              // %.loopexit
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
	jl	rax, r0, .LBB167_22
	jmp	.LBB167_1
.LBB167_1:                              // %.preheader31.preheader
	mov	x6, -1
	mov	x11, 0
	mov	x5, 1
	mov	x10, 1
.LBB167_2:                              // %.preheader31
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
	jge	rax, x9, .LBB167_4
	jmp	.LBB167_3
.LBB167_3:                              //   in Loop: Header=BB167_2 Depth=1
	mov	x14, x5
	sub	x14, x6
	mov	x10, 1
	jmp	.LBB167_9
.LBB167_4:                              //   in Loop: Header=BB167_2 Depth=1
	mov	r1, 255
	mov	r0, x8
	call	__bit_and
	mov	r1, 255
	mov	x5, rax
	mov	r0, x7
	call	__bit_and
	jne	rax, x5, .LBB167_8
	jmp	.LBB167_5
.LBB167_5:                              //   in Loop: Header=BB167_2 Depth=1
	je	x10, x14, .LBB167_7
	jmp	.LBB167_6
.LBB167_6:                              //   in Loop: Header=BB167_2 Depth=1
add	x10, 1
	mov	x5, x11
	jmp	.LBB167_9
.LBB167_7:                              //   in Loop: Header=BB167_2 Depth=1
	add	x11, x14
	mov	x10, 1
	mov	x5, x11
	jmp	.LBB167_9
.LBB167_8:                              //   in Loop: Header=BB167_2 Depth=1
	mov	x5, x11
add	x5, 1
	mov	x10, 1
	mov	x6, x11
	mov	x14, 1
.LBB167_9:                              //   in Loop: Header=BB167_2 Depth=1
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
	jl	rax, x7, .LBB167_2
	jmp	.LBB167_10
.LBB167_10:                             // %.preheader30.preheader
	mov	x5, -1
	mov	x13, 0
	mov	x7, 1
	mov	x11, 1
	mov	x12, 1
.LBB167_11:                             // %.preheader30
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
	jge	rax, x10, .LBB167_13
	jmp	.LBB167_12
.LBB167_12:                             //   in Loop: Header=BB167_11 Depth=1
	mov	x11, x7
	sub	x11, x5
	mov	x12, 1
	jmp	.LBB167_18
.LBB167_13:                             //   in Loop: Header=BB167_11 Depth=1
	mov	r1, 255
	mov	r0, x9
	call	__bit_and
	mov	r1, 255
	mov	x7, rax
	mov	r0, x8
	call	__bit_and
	jne	rax, x7, .LBB167_17
	jmp	.LBB167_14
.LBB167_14:                             //   in Loop: Header=BB167_11 Depth=1
	je	x12, x11, .LBB167_16
	jmp	.LBB167_15
.LBB167_15:                             //   in Loop: Header=BB167_11 Depth=1
add	x12, 1
	mov	x7, x13
	jmp	.LBB167_18
.LBB167_16:                             //   in Loop: Header=BB167_11 Depth=1
	add	x13, x11
	mov	x12, 1
	mov	x7, x13
	jmp	.LBB167_18
.LBB167_17:                             //   in Loop: Header=BB167_11 Depth=1
	mov	x7, x13
add	x7, 1
	mov	x12, 1
	mov	x5, x13
	mov	x11, 1
.LBB167_18:                             //   in Loop: Header=BB167_11 Depth=1
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
	jl	rax, x8, .LBB167_11
	jmp	.LBB167_19
.LBB167_19:
add	x6, 1
	mov	r1, -2147483648
add	x5, 1
	mov	r0, x6
	call	__bit_xor
	mov	r1, -2147483648
	mov	x7, rax
	mov	r0, x5
	call	__bit_xor
	jl	rax, x7, .LBB167_21
	jmp	.LBB167_20
.LBB167_20:
	mov	x14, x11
.LBB167_21:
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
.LBB167_22:
	mov	r0, 1024
	jmp	.LBB167_25
.LBB167_23:
	jz	x0, .LBB167_27
	jmp	.LBB167_24
.LBB167_24:                             // %.preheader28.preheader
	mov	x1, x0
add	x1, -1
	mov	x3, -1
	mov	x6, x15
	jmp	.LBB167_26
.LBB167_25:                             // =>This Inner Loop Header: Depth=1
	mov	r1, rsp
add	r1, 28
	add	r1, x1
add	x1, 4
	mov	[r1], x0
	je	x1, r0, .LBB167_23
	jmp	.LBB167_25
.LBB167_26:                             // %.preheader28
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
	jne	x1, x3, .LBB167_26
	jmp	.LBB167_27
.LBB167_27:                             // %.loopexit29
	mov	x6, x15
	mov	r1, -2147483648
	add	x6, x14
	mov	r0, x4
	call	__bit_xor
	mov	r0, -2147483644
	mov	x7, x4
	mov	x1, x15
	jl	rax, r0, .LBB167_33
	jmp	.LBB167_28
.LBB167_28:
	mov	r0, x6
	mov	r1, x15
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	x7, x4
	mov	x1, x15
	jnz	rax, .LBB167_35
	jmp	.LBB167_29
.LBB167_29:                             // %.preheader.i.preheader
	mov	x3, -2147483645
	mov	x1, x15
	mov	x7, x4
.LBB167_30:                             // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	x6, x1
	add	x6, x14
	mov	r0, [x1]
	mov	r1, [x6]
	jne	r0, r1, .LBB167_34
	jmp	.LBB167_31
.LBB167_31:                             //   in Loop: Header=BB167_30 Depth=1
add	x7, -4
	mov	r1, -2147483648
add	x1, 4
	mov	r0, x7
	call	__bit_xor
	jg	rax, x3, .LBB167_30
	jmp	.LBB167_32
.LBB167_32:                             // %.loopexit8.i.loopexit
	mov	x6, x1
	add	x6, x14
.LBB167_33:                             // %.loopexit8.i
	jz	x7, .LBB167_38
	jmp	.LBB167_35
.LBB167_34:                             // %.loopexit7.i.preheader.loopexit
.LBB167_35:                             // %.loopexit7.i.preheader
.LBB167_36:                             // %.loopexit7.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x1]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x6]
	mov	r1, 255
	mov	x8, rax
	call	__bit_and
	jne	x8, rax, .LBB167_58
	jmp	.LBB167_37
.LBB167_37:                             //   in Loop: Header=BB167_36 Depth=1
add	x7, -1
add	x1, 1
add	x6, 1
	jnz	x7, .LBB167_36
	jmp	.LBB167_38
.LBB167_38:                             // %memcmp.exit.thread
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
.LBB167_39:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB167_41 Depth 2
                                        //     Child Loop BB167_52 Depth 2
                                        //     Child Loop BB167_54 Depth 2
	mov	r0, x2
	sub	r0, x0
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x9
	call	__bit_xor
	jle	rax, x6, .LBB167_44
	jmp	.LBB167_40
.LBB167_40:                             //   in Loop: Header=BB167_39 Depth=1
	mov	x3, [rsp+24]
	add	x3, x2
	mov	x6, x3
	mov	x5, [rsp+8]
	add	x6, x5
	mov	x8, x3
.LBB167_41:                             //   Parent Loop BB167_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x8]
	mov	r1, 255
	call	__bit_and
	mov	r0, x8
	jz	rax, .LBB167_43
	jmp	.LBB167_42
.LBB167_42:                             //   in Loop: Header=BB167_41 Depth=2
add	x5, -1
add	x8, 1
	mov	r0, x6
	jnz	x5, .LBB167_41
	jmp	.LBB167_43
.LBB167_43:                             // %strnlen.exit
                                        //   in Loop: Header=BB167_39 Depth=1
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
	jg	rax, x11, .LBB167_74
	jmp	.LBB167_44
.LBB167_44:                             //   in Loop: Header=BB167_39 Depth=1
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
	jz	x12, .LBB167_49
	jmp	.LBB167_45
.LBB167_45:                             //   in Loop: Header=BB167_39 Depth=1
	mov	x10, 0
	jz	x7, .LBB167_48
	jmp	.LBB167_46
.LBB167_46:                             //   in Loop: Header=BB167_39 Depth=1
	mov	r1, -2147483648
	mov	r0, [rsp+20]
	call	__bit_xor
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x12
	call	__bit_xor
	jge	rax, x6, .LBB167_48
	jmp	.LBB167_47
.LBB167_47:                             //   in Loop: Header=BB167_39 Depth=1
	mov	x12, [rsp+16]
.LBB167_48:                             //   in Loop: Header=BB167_39 Depth=1
	add	x9, x12
	mov	x7, x10
	jmp	.LBB167_39
.LBB167_49:                             //   in Loop: Header=BB167_39 Depth=1
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
	jge	x12, rax, .LBB167_51
	jmp	.LBB167_50
.LBB167_50:                             // %.preheader.preheader
                                        //   in Loop: Header=BB167_39 Depth=1
	mov	x12, [rsp]
	add	x12, x13
	mov	x8, [rsp+12]
	sub	x8, x13
	mov	x3, x15
	add	x3, x13
	add	x13, x9
	mov	r0, [rsp+24]
	add	x13, r0
	jmp	.LBB167_52
.LBB167_51:                             // %.loopexit
                                        //   in Loop: Header=BB167_39 Depth=1
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
	jmp	.LBB167_54
.LBB167_52:                             // %.preheader
                                        //   Parent Loop BB167_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x13]
	mov	r1, 255
	mov	x14, rax
	call	__bit_and
	mov	x10, 0
	jne	x14, rax, .LBB167_48
	jmp	.LBB167_53
.LBB167_53:                             //   in Loop: Header=BB167_52 Depth=2
add	x12, 1
add	x8, -1
add	x3, 1
add	x13, 1
	jz	x8, .LBB167_51
	jmp	.LBB167_52
.LBB167_54:                             //   Parent Loop BB167_39 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r1, -2147483648
	mov	r0, x12
	call	__bit_xor
	mov	r1, -2147483648
	mov	x13, rax
	mov	r0, x7
	call	__bit_xor
	jge	rax, x13, .LBB167_57
	jmp	.LBB167_55
.LBB167_55:                             //   in Loop: Header=BB167_54 Depth=2
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
	je	x13, rax, .LBB167_54
	jmp	.LBB167_56
.LBB167_56:                             // %._crit_edge
                                        //   in Loop: Header=BB167_39 Depth=1
add	x5, 1
	mov	x11, x5
.LBB167_57:                             //   in Loop: Header=BB167_39 Depth=1
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
	jl	rax, x3, .LBB167_74
	jmp	.LBB167_48
.LBB167_58:                             // %memcmp.exit
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
.LBB167_59:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB167_61 Depth 2
                                        //     Child Loop BB167_68 Depth 2
                                        //     Child Loop BB167_71 Depth 2
	mov	r0, x2
	sub	r0, x0
	mov	r1, -2147483648
	call	__bit_xor
	mov	r1, -2147483648
	mov	x6, rax
	mov	r0, x9
	call	__bit_xor
	jle	rax, x6, .LBB167_64
	jmp	.LBB167_60
.LBB167_60:                             //   in Loop: Header=BB167_59 Depth=1
	mov	x3, [rsp+24]
	add	x3, x2
	mov	x6, x3
	add	x6, x8
	mov	x5, x8
	mov	x10, x3
.LBB167_61:                             //   Parent Loop BB167_59 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x10]
	mov	r1, 255
	call	__bit_and
	mov	r0, x10
	jz	rax, .LBB167_63
	jmp	.LBB167_62
.LBB167_62:                             //   in Loop: Header=BB167_61 Depth=2
add	x5, -1
add	x10, 1
	mov	r0, x6
	jnz	x5, .LBB167_61
	jmp	.LBB167_63
.LBB167_63:                             // %strnlen.exit21
                                        //   in Loop: Header=BB167_59 Depth=1
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
	jg	rax, x10, .LBB167_74
	jmp	.LBB167_64
.LBB167_64:                             //   in Loop: Header=BB167_59 Depth=1
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
	jnz	r0, .LBB167_67
	jmp	.LBB167_65
.LBB167_65:                             //   in Loop: Header=BB167_59 Depth=1
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	mov	r1, -2147483648
	mov	x10, rax
	mov	r0, x7
	call	__bit_xor
	jle	rax, x10, .LBB167_70
	jmp	.LBB167_66
.LBB167_66:                             // %.preheader25.preheader
                                        //   in Loop: Header=BB167_59 Depth=1
	mov	x14, [rsp+20]
	add	x14, x9
	mov	x3, 0
	jmp	.LBB167_68
.LBB167_67:                             //   in Loop: Header=BB167_59 Depth=1
	add	x9, r0
	jmp	.LBB167_59
.LBB167_68:                             // %.preheader25
                                        //   Parent Loop BB167_59 Depth=1
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
	jne	x10, rax, .LBB167_73
	jmp	.LBB167_69
.LBB167_69:                             //   in Loop: Header=BB167_68 Depth=2
add	x3, 1
	jne	x1, x3, .LBB167_68
	jmp	.LBB167_70
.LBB167_70:                             // %.loopexit26.preheader
                                        //   in Loop: Header=BB167_59 Depth=1
	mov	x14, x13
	add	x14, x9
	mov	x5, x4
.LBB167_71:                             // %.loopexit26
                                        //   Parent Loop BB167_59 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	jz	x5, .LBB167_74
	jmp	.LBB167_72
.LBB167_72:                             //   in Loop: Header=BB167_71 Depth=2
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
	je	x10, rax, .LBB167_71
	jmp	.LBB167_73
.LBB167_73:                             // %.loopexit24
                                        //   in Loop: Header=BB167_59 Depth=1
	add	x9, x3
add	x9, 1
	jmp	.LBB167_59
.LBB167_74:                             // %.loopexit22
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
	jz	x2, .LBB168_91
	jmp	.LBB168_1
.LBB168_1:
	mov	x6, x1
add	x6, 1
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
	jnz	x4, .LBB168_15
	jmp	.LBB168_2
.LBB168_2:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 3
	mov	x1, rax
	mov	r0, x0
	call	__bit_and
	jz	rax, .LBB168_4
	jmp	.LBB168_3
.LBB168_3:                              // %.preheader.preheader
	mov	x3, x0
add	x3, 1
	jmp	.LBB168_6
.LBB168_4:                              // %.loopexit9.i
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	x4, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB168_11
	jmp	.LBB168_5
.LBB168_5:                              // %.preheader5.i.preheader
	mul	x1, 16843009
	jmp	.LBB168_9
.LBB168_6:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x5, rax
	mov	x4, 0
	jz	x5, .LBB168_91
	jmp	.LBB168_7
.LBB168_7:                              //   in Loop: Header=BB168_6 Depth=1
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x6, rax
	mov	r0, x5
	call	__bit_and
	mov	x4, x0
	je	rax, x6, .LBB168_91
	jmp	.LBB168_8
.LBB168_8:                              //   in Loop: Header=BB168_6 Depth=1
	mov	r1, 3
add	x0, 1
	mov	r0, x3
	call	__bit_and
add	x3, 1
	jz	rax, .LBB168_4
	jmp	.LBB168_6
.LBB168_9:                              // %.preheader5.i
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
	jne	rax, x4, .LBB168_11
	jmp	.LBB168_10
.LBB168_10:                             //   in Loop: Header=BB168_9 Depth=1
add	x0, 4
	mov	x3, [x0]
	mov	r0, 16843008
	sub	r0, x3
	mov	r1, x3
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	je	rax, x4, .LBB168_9
	jmp	.LBB168_11
.LBB168_11:                             // %.loopexit6.i.preheader
add	x0, -1
.LBB168_12:                             // %.loopexit6.i
                                        // =>This Inner Loop Header: Depth=1
add	x0, 1
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x1, rax
	jz	x1, .LBB168_14
	jmp	.LBB168_13
.LBB168_13:                             // %.loopexit6.i
                                        //   in Loop: Header=BB168_12 Depth=1
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x1
	call	__bit_and
	jne	rax, x3, .LBB168_12
	jmp	.LBB168_14
.LBB168_14:
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
	jmp	.LBB168_91
.LBB168_15:
	mov	r0, x1
add	r0, 2
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x3, rax
	jnz	x3, .LBB168_21
	jmp	.LBB168_16
.LBB168_16:
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
	jz	x3, .LBB168_91
	jmp	.LBB168_17
.LBB168_17:                             // %.preheader24.preheader
add	x0, -2
	mov	x2, 0
.LBB168_18:                             // %.preheader24
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
	je	x1, x2, .LBB168_20
	jmp	.LBB168_19
.LBB168_19:                             // %.preheader24
                                        //   in Loop: Header=BB168_18 Depth=1
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	jnz	rax, .LBB168_18
	jmp	.LBB168_20
.LBB168_20:
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
	jmp	.LBB168_91
.LBB168_21:
	mov	r0, x1
add	r0, 3
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	mov	x5, rax
	jnz	x5, .LBB168_27
	jmp	.LBB168_22
.LBB168_22:
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
	jz	x2, .LBB168_91
	jmp	.LBB168_23
.LBB168_23:                             // %.preheader25.preheader
add	x0, -3
	mov	x3, 0
.LBB168_24:                             // %.preheader25
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
	je	x1, x3, .LBB168_26
	jmp	.LBB168_25
.LBB168_25:                             // %.preheader25
                                        //   in Loop: Header=BB168_24 Depth=1
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	jnz	rax, .LBB168_24
	jmp	.LBB168_26
.LBB168_26:
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
	jmp	.LBB168_91
.LBB168_27:
	mov	r0, x1
add	r0, 4
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
	jnz	rax, .LBB168_33
	jmp	.LBB168_28
.LBB168_28:
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
	jz	rax, .LBB168_91
	jmp	.LBB168_29
.LBB168_29:                             // %.preheader26.preheader
add	x0, -4
	mov	x2, 0
.LBB168_30:                             // %.preheader26
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
	jz	rax, .LBB168_32
	jmp	.LBB168_31
.LBB168_31:                             // %.preheader26
                                        //   in Loop: Header=BB168_30 Depth=1
	jne	x1, x2, .LBB168_30
	jmp	.LBB168_32
.LBB168_32:
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
	jmp	.LBB168_91
.LBB168_33:
	mov	r1, 3
	mov	r0, x1
	call	__bit_and
	mov	x3, x1
	jz	rax, .LBB168_37
	jmp	.LBB168_34
.LBB168_34:                             // %.preheader1.i.preheader
	mov	x2, x1
	mov	x3, x6
	jmp	.LBB168_36
.LBB168_35:                             //   in Loop: Header=BB168_36 Depth=1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
add	x3, 1
	jz	rax, .LBB168_41
	jmp	.LBB168_36
.LBB168_36:                             // %.preheader1.i
                                        // =>This Inner Loop Header: Depth=1
add	x2, 1
	mov	r1, 3
	mov	r0, x2
	call	__bit_and
	jnz	rax, .LBB168_35
	jmp	.LBB168_37
.LBB168_37:                             // %.loopexit.i.preheader
	mov	x4, x3
add	x4, -1
	mov	x5, -2139062144
.LBB168_38:                             // %.loopexit.i
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
	je	rax, x5, .LBB168_38
	jmp	.LBB168_39
.LBB168_39:                             // %.preheader.i14.preheader
	mov	x4, -4
.LBB168_40:                             // %.preheader.i14
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, x3
	add	r0, x4
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x2, 1
add	x4, 1
	jnz	rax, .LBB168_40
	jmp	.LBB168_41
.LBB168_41:                             // %strlen.exit
	sub	x2, x1
	mov	r1, 512
	mov	r0, x2
	call	__bit_or
	mov	x3, rax
	mov	x4, x3
	add	x3, x0
	mov	x5, 0
.LBB168_42:                             // =>This Inner Loop Header: Depth=1
	mov	x6, x0
	add	x6, x5
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB168_44
	jmp	.LBB168_43
.LBB168_43:                             //   in Loop: Header=BB168_42 Depth=1
add	x5, 1
	je	x4, x5, .LBB168_45
	jmp	.LBB168_42
.LBB168_44:                             // %.strnlen.exit_crit_edge
	mov	x3, x6
.LBB168_45:                             // %strnlen.exit
	sub	x3, x0
	mov	r1, -2147483648
	mov	x4, 0
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x3
	call	__bit_xor
	jl	rax, x5, .LBB168_91
	jmp	.LBB168_46
.LBB168_46:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483394
	jg	rax, r0, .LBB168_90
	jmp	.LBB168_47
.LBB168_47:
	add	x3, x0
	mov	x4, x2
add	x4, 1
	mov	x5, rsp
	mov	r1, 3
	mov	x8, 3
	mov	r0, x5
	call	__bit_and
	mov	x6, 64
	jz	rax, .LBB168_52
	jmp	.LBB168_48
.LBB168_48:
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
	je	x7, x8, .LBB168_52
	jmp	.LBB168_49
.LBB168_49:
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
	je	x7, r0, .LBB168_52
	jmp	.LBB168_50
.LBB168_50:
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
	je	x7, r0, .LBB168_52
	jmp	.LBB168_51
.LBB168_51:
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
.LBB168_52:                             // %.preheader.i17.preheader
	sub	x3, x2
	mov	x7, x4
	mul	x7, 16843009
	mov	x8, -2147483633
	jmp	.LBB168_55
.LBB168_53:
	mov	r0, x6
add	r0, 16
	mov	r1, 20
	jl	r0, r1, .LBB168_57
	jmp	.LBB168_54
.LBB168_54:                             // %.preheader194.preheader
	mov	x8, -2147483645
	jmp	.LBB168_56
.LBB168_55:                             // %.preheader.i17
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
	jg	rax, x8, .LBB168_55
	jmp	.LBB168_53
.LBB168_56:                             // %.preheader194
                                        // =>This Inner Loop Header: Depth=1
	mov	[x5], x7
add	x6, -4
	mov	r1, -2147483648
add	x5, 4
	mov	r0, x6
	call	__bit_xor
	jg	rax, x8, .LBB168_56
	jmp	.LBB168_57
.LBB168_57:                             // %.loopexit5.i
	jz	x6, .LBB168_60
	jmp	.LBB168_58
.LBB168_58:
	mov	x8, x5
.LBB168_59:                             // =>This Inner Loop Header: Depth=1
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
	jnz	x6, .LBB168_59
	jmp	.LBB168_60
.LBB168_60:                             // %memset.exit
	jz	x2, .LBB168_63
	jmp	.LBB168_61
.LBB168_61:                             // %.preheader30.preheader
	mov	x6, x1
	mov	x4, x2
.LBB168_62:                             // %.preheader30
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
	jnz	x4, .LBB168_62
	jmp	.LBB168_63
.LBB168_63:                             // %.loopexit31
	mov	x6, 2047
	mov	x7, -2147483644
	mov	x8, -2147483645
.LBB168_64:                             // =>This Loop Header: Depth=1
                                        //     Child Loop BB168_73 Depth 2
                                        //       Child Loop BB168_75 Depth 3
                                        //       Child Loop BB168_80 Depth 3
                                        //     Child Loop BB168_69 Depth 2
                                        //       Child Loop BB168_70 Depth 3
                                        //     Child Loop BB168_86 Depth 2
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
	jg	rax, x0, .LBB168_83
	jmp	.LBB168_65
.LBB168_65:                             // %.preheader27
                                        //   in Loop: Header=BB168_64 Depth=1
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	jl	rax, x7, .LBB168_67
	jmp	.LBB168_66
.LBB168_66:                             // %.preheader27.split.preheader
                                        //   in Loop: Header=BB168_64 Depth=1
	jmp	.LBB168_73
.LBB168_67:                             // %.preheader27.split.us
                                        //   in Loop: Header=BB168_64 Depth=1
	jz	x2, .LBB168_89
	jmp	.LBB168_68
.LBB168_68:                             // %.loopexit8.i.us.preheader
                                        //   in Loop: Header=BB168_64 Depth=1
.LBB168_69:                             // %.loopexit8.i.us
                                        //   Parent Loop BB168_64 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB168_70 Depth 3
	mov	x5, 0
.LBB168_70:                             //   Parent Loop BB168_64 Depth=1
                                        //     Parent Loop BB168_69 Depth=2
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
	je	x0, rax, .LBB168_72
	jmp	.LBB168_71
.LBB168_71:                             // %memcmp.exit.us
                                        //   in Loop: Header=BB168_69 Depth=2
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
	jg	rax, x0, .LBB168_83
	jmp	.LBB168_69
.LBB168_72:                             //   in Loop: Header=BB168_70 Depth=3
add	x5, 1
	je	x2, x5, .LBB168_89
	jmp	.LBB168_70
.LBB168_73:                             // %.preheader27.split
                                        //   Parent Loop BB168_64 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB168_75 Depth 3
                                        //       Child Loop BB168_80 Depth 3
	mov	r0, x4
	mov	r1, x1
	call	__bit_or
	mov	r1, 3
	mov	r0, rax
	call	__bit_and
	mov	x0, x2
	mov	x9, x1
	mov	x10, x4
	jnz	rax, .LBB168_79
	jmp	.LBB168_74
.LBB168_74:                             // %.preheader.i20.preheader
                                        //   in Loop: Header=BB168_73 Depth=2
	mov	x5, 0
	mov	x0, x2
.LBB168_75:                             // %.preheader.i20
                                        //   Parent Loop BB168_64 Depth=1
                                        //     Parent Loop BB168_73 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	x9, x1
	add	x9, x5
	mov	x10, x4
	add	x10, x5
	mov	r0, [x10]
	mov	r1, [x9]
	jne	r0, r1, .LBB168_78
	jmp	.LBB168_76
.LBB168_76:                             //   in Loop: Header=BB168_75 Depth=3
add	x0, -4
	mov	r1, -2147483648
add	x5, 4
	mov	r0, x0
	call	__bit_xor
	jg	rax, x8, .LBB168_75
	jmp	.LBB168_77
.LBB168_77:                             // %.loopexit8.i.loopexit
                                        //   in Loop: Header=BB168_73 Depth=2
	mov	x9, x1
	add	x9, x5
	add	x5, x4
	mov	x10, x5
	jz	x0, .LBB168_89
	jmp	.LBB168_79
.LBB168_78:                             // %.loopexit7.i18.preheader.loopexit
                                        //   in Loop: Header=BB168_73 Depth=2
.LBB168_79:                             // %.loopexit7.i18.preheader
                                        //   in Loop: Header=BB168_73 Depth=2
.LBB168_80:                             // %.loopexit7.i18
                                        //   Parent Loop BB168_64 Depth=1
                                        //     Parent Loop BB168_73 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	mov	r0, [x10]
	mov	r1, 255
	call	__bit_and
	mov	r0, [x9]
	mov	r1, 255
	mov	x5, rax
	call	__bit_and
	jne	x5, rax, .LBB168_82
	jmp	.LBB168_81
.LBB168_81:                             //   in Loop: Header=BB168_80 Depth=3
add	x0, -1
add	x10, 1
add	x9, 1
	jz	x0, .LBB168_89
	jmp	.LBB168_80
.LBB168_82:                             // %memcmp.exit
                                        //   in Loop: Header=BB168_73 Depth=2
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
	jle	rax, x0, .LBB168_73
	jmp	.LBB168_83
.LBB168_83:                             // %.loopexit
                                        //   in Loop: Header=BB168_64 Depth=1
	mov	x5, x3
	add	x5, x2
	mov	r0, [x5]
	mov	r1, 255
	mov	x0, x4
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB168_89
	jmp	.LBB168_84
.LBB168_84:                             //   in Loop: Header=BB168_64 Depth=1
	mov	x4, x5
add	x4, 2048
	mov	x9, 0
	jmp	.LBB168_86
.LBB168_85:                             // %thread-pre-split
                                        //   in Loop: Header=BB168_86 Depth=2
	mov	r0, x5
	add	r0, x9
add	r0, 1
	mov	r0, [r0]
	mov	r1, 255
	call	__bit_and
add	x9, 1
	jz	rax, .LBB168_87
	jmp	.LBB168_86
.LBB168_86:                             //   Parent Loop BB168_64 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	je	x9, x6, .LBB168_88
	jmp	.LBB168_85
.LBB168_87:                             // %thread-pre-split.strnlen.exit22_crit_edge
                                        //   in Loop: Header=BB168_64 Depth=1
	add	x9, x5
	mov	x4, x9
.LBB168_88:                             // %strnlen.exit22
                                        //   in Loop: Header=BB168_64 Depth=1
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
	jle	rax, x5, .LBB168_64
	jmp	.LBB168_89
.LBB168_89:                             // %memcmp.exit.thread
	jmp	.LBB168_91
.LBB168_90:
	mov	r0, x0
	mov	r1, x3
	mov	r2, x1
	mov	r3, x2
	call	two_way_long_needle.65
	mov	x4, rax
.LBB168_91:                             // %strchr.exit
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
	jnz	x0, .LBB169_2
	jmp	.LBB169_1
.LBB169_1:
	mov	r0, mcasm_static_9ee17463bf5b806f51f18903a3b6b403
	mov	x0, [r0]
	mov	rax, 0
	jz	x0, .LBB169_14
	jmp	.LBB169_2
.LBB169_2:                              // %.preheader7.i.preheader
.LBB169_3:                              // %.preheader7.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB169_4 Depth 2
	mov	x4, x0
	mov	r0, [x4]
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	x2, rax
	mov	x5, x1
.LBB169_4:                              //   Parent Loop BB169_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB169_6
	jmp	.LBB169_5
.LBB169_5:                              //   in Loop: Header=BB169_4 Depth=2
	mov	r1, 255
add	x5, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	je	rax, x3, .LBB169_3
	jmp	.LBB169_4
.LBB169_6:                              // %.loopexit.i
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	x5, 0
	mov	rax, 0
	jz	r0, .LBB169_13
	jmp	.LBB169_7
.LBB169_7:                              // %.preheader.i.preheader
.LBB169_8:                              // %.preheader.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB169_9 Depth 2
	mov	x6, x0
	mov	r0, [x6]
	mov	r1, 255
add	x0, 1
	call	__bit_and
	mov	x2, rax
	mov	x7, x1
.LBB169_9:                              //   Parent Loop BB169_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x3, rax
	mov	r0, x2
	call	__bit_and
	jne	x3, rax, .LBB169_12
	jmp	.LBB169_10
.LBB169_10:
	mov	r1, 255
	mov	r0, x2
	call	__bit_and
	mov	r0, rax
	mov	rax, x4
	jz	r0, .LBB169_13
	jmp	.LBB169_11
.LBB169_11:
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x6], rax
	mov	x5, x0
	mov	rax, x4
	jmp	.LBB169_13
.LBB169_12:                             //   in Loop: Header=BB169_9 Depth=2
	mov	r1, 255
add	x7, 1
	mov	r0, x3
	call	__bit_and
	jz	rax, .LBB169_8
	jmp	.LBB169_9
.LBB169_13:                             // %__strtok_r.exit.sink.split
	mov	r0, mcasm_static_9ee17463bf5b806f51f18903a3b6b403
	mov	[r0], x5
.LBB169_14:                             // %__strtok_r.exit
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
	jnz	x0, .LBB170_2
	jmp	.LBB170_1
.LBB170_1:
	mov	x0, [x1]
	mov	rax, 0
	jz	x0, .LBB170_20
	jmp	.LBB170_2
.LBB170_2:
	jz	r3, .LBB170_4
	jmp	.LBB170_3
.LBB170_3:                              // %.preheader7.preheader
	mov	x5, x0
	jmp	.LBB170_7
.LBB170_4:
	mov	r0, [x0]
	mov	x5, x0
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
	mov	x6, x2
.LBB170_5:                              // =>This Inner Loop Header: Depth=1
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB170_11
	jmp	.LBB170_6
.LBB170_6:                              //   in Loop: Header=BB170_5 Depth=1
	mov	r1, 255
add	x6, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	je	rax, x4, .LBB170_10
	jmp	.LBB170_5
.LBB170_7:                              // %.preheader7
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB170_8 Depth 2
	mov	x0, x5
	mov	r0, [x0]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
	mov	x6, x2
.LBB170_8:                              //   Parent Loop BB170_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB170_11
	jmp	.LBB170_9
.LBB170_9:                              //   in Loop: Header=BB170_8 Depth=2
	mov	r1, 255
add	x6, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	je	rax, x4, .LBB170_7
	jmp	.LBB170_8
.LBB170_10:
	mov	[x1], x5
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	rax, x0
	jmp	.LBB170_20
.LBB170_11:                             // %.loopexit
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	jz	rax, .LBB170_13
	jmp	.LBB170_12
.LBB170_12:                             // %.preheader.preheader
	jmp	.LBB170_14
.LBB170_13:
	mov	[x1], 0
	mov	rax, 0
	jmp	.LBB170_20
.LBB170_14:                             // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB170_15 Depth 2
	mov	x6, x5
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
	mov	x7, x2
.LBB170_15:                             //   Parent Loop BB170_14 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x7]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	jne	x4, rax, .LBB170_19
	jmp	.LBB170_16
.LBB170_16:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r0, 0
	jz	rax, .LBB170_18
	jmp	.LBB170_17
.LBB170_17:
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x6], rax
	mov	r0, x5
.LBB170_18:
	mov	[x1], r0
	mov	rax, x0
	jmp	.LBB170_20
.LBB170_19:                             //   in Loop: Header=BB170_15 Depth=2
	mov	r1, 255
add	x7, 1
	mov	r0, x4
	call	__bit_and
	jz	rax, .LBB170_14
	jmp	.LBB170_15
.LBB170_20:
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
	jnz	x1, .LBB171_2
	jmp	.LBB171_1
.LBB171_1:
	mov	x1, [x0]
	mov	rax, 0
	jz	x1, .LBB171_14
	jmp	.LBB171_2
.LBB171_2:                              // %.preheader31
.LBB171_3:                              // =>This Loop Header: Depth=1
                                        //     Child Loop BB171_4 Depth 2
	mov	x5, x1
	mov	r0, [x5]
	mov	r1, 255
add	x1, 1
	call	__bit_and
	mov	x3, rax
	mov	x6, x2
.LBB171_4:                              //   Parent Loop BB171_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x6]
	mov	r1, 255
	call	__bit_and
	jz	rax, .LBB171_6
	jmp	.LBB171_5
.LBB171_5:                              //   in Loop: Header=BB171_4 Depth=2
	mov	r1, 255
add	x6, 1
	mov	r0, rax
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	je	rax, x4, .LBB171_3
	jmp	.LBB171_4
.LBB171_6:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r0, rax
	mov	x7, 0
	mov	rax, 0
	jz	r0, .LBB171_13
	jmp	.LBB171_7
.LBB171_7:                              // %.preheader.preheader
.LBB171_8:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB171_9 Depth 2
	mov	x6, x1
	mov	r0, [x6]
	mov	r1, 255
add	x1, 1
	call	__bit_and
	mov	x3, rax
	mov	x8, x2
.LBB171_9:                              //   Parent Loop BB171_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r0, [x8]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	jne	x4, rax, .LBB171_12
	jmp	.LBB171_10
.LBB171_10:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	r0, rax
	mov	rax, x5
	jz	r0, .LBB171_13
	jmp	.LBB171_11
.LBB171_11:
	mov	r0, [x6]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x6], rax
	mov	x7, x1
	mov	rax, x5
	jmp	.LBB171_13
.LBB171_12:                             //   in Loop: Header=BB171_9 Depth=2
	mov	r1, 255
add	x8, 1
	mov	r0, x4
	call	__bit_and
	jz	rax, .LBB171_8
	jmp	.LBB171_9
.LBB171_13:
	mov	[x0], x7
.LBB171_14:
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
	jz	r1, .LBB172_5
	jmp	.LBB172_1
.LBB172_1:
	mov	x1, -2
	jz	r2, .LBB172_7
	jmp	.LBB172_2
.LBB172_2:
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
	jg	rax, x1, .LBB172_4
	jmp	.LBB172_3
.LBB172_3:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 84
	jmp	.LBB172_7
.LBB172_4:
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
.LBB172_5:                              // %mbrtowc.exit
	jz	x0, .LBB172_7
	jmp	.LBB172_6
.LBB172_6:
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
.LBB172_7:                              // %mbrtowc.exit.thread
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
	jz	x1, .LBB173_4
	jmp	.LBB173_1
.LBB173_1:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483520
	jl	rax, r0, .LBB173_3
	jmp	.LBB173_2
.LBB173_2:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 84
	mov	x0, -1
	jmp	.LBB173_4
.LBB173_3:
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
.LBB173_4:                              // %wcrtomb.exit
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
	jz	r1, .LBB174_5
	jmp	.LBB174_1
.LBB174_1:
	mov	rax, -2
	jz	r2, .LBB174_7
	jmp	.LBB174_2
.LBB174_2:
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
	jg	r0, rax, .LBB174_4
	jmp	.LBB174_3
.LBB174_3:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 84
	jmp	.LBB174_7
.LBB174_4:
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
.LBB174_5:                              // %mbrtowc.exit
	jz	r0, .LBB174_7
	jmp	.LBB174_6
.LBB174_6:
	mov	[r0], x0
.LBB174_7:                              // %mbrtowc.exit.thread
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
	jz	x1, .LBB175_4
	jmp	.LBB175_1
.LBB175_1:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483520
	jl	rax, r0, .LBB175_3
	jmp	.LBB175_2
.LBB175_2:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 84
	mov	x0, -1
	jmp	.LBB175_4
.LBB175_3:
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
.LBB175_4:                              // %wcrtomb.exit
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
	jg	rax, r0, .LBB177_2
	jmp	.LBB177_1
.LBB177_1:
	mov	x1, x0
.LBB177_2:
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
	jz	r0, .LBB178_2
	jmp	.LBB178_1
.LBB178_1:
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
.LBB178_2:
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
	jz	r1, .LBB179_7
	jmp	.LBB179_1
.LBB179_1:
	mov	rax, -2
	jz	r2, .LBB179_7
	jmp	.LBB179_2
.LBB179_2:
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
	jg	r0, rax, .LBB179_4
	jmp	.LBB179_3
.LBB179_3:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 84
	jmp	.LBB179_7
.LBB179_4:
	jz	x1, .LBB179_6
	jmp	.LBB179_5
.LBB179_5:
	mov	[x1], x0
.LBB179_6:
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
.LBB179_7:
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
	jz	r0, .LBB180_5
	jmp	.LBB180_1
.LBB180_1:
	mov	rax, -2
	jz	r1, .LBB180_5
	jmp	.LBB180_2
.LBB180_2:
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
	jg	r0, rax, .LBB180_4
	jmp	.LBB180_3
.LBB180_3:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 84
	jmp	.LBB180_5
.LBB180_4:
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
.LBB180_5:
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
	jz	x1, .LBB181_4
	jmp	.LBB181_1
.LBB181_1:
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r0, -2147483520
	jl	rax, r0, .LBB181_3
	jmp	.LBB181_2
.LBB181_2:
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 84
	mov	x0, -1
	jmp	.LBB181_4
.LBB181_3:
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
.LBB181_4:
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
	jz	x0, .LBB182_2
	jmp	.LBB182_1
.LBB182_1:                              // %.preheader9.preheader
	mov	x2, 0
	mov	x6, -1
	mov	x7, x0
	jmp	.LBB182_6
.LBB182_2:
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, 0
	jz	rax, .LBB182_15
	jmp	.LBB182_3
.LBB182_3:                              // %.preheader.preheader
add	x3, 1
	mov	x4, 0
	mov	x2, 0
.LBB182_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, 255
	mov	r0, rax
	call	__bit_and
	mov	r1, 128
	mov	r0, rax
	call	__bit_xor
add	rax, -128
	jl	rax, x4, .LBB182_8
	jmp	.LBB182_5
.LBB182_5:                              //   in Loop: Header=BB182_4 Depth=1
	mov	r0, x3
	add	r0, x2
	mov	r0, [r0]
	mov	r1, 255
add	x2, 1
	call	__bit_and
	jz	rax, .LBB182_12
	jmp	.LBB182_4
.LBB182_6:                              // %.preheader9
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
	jz	x5, .LBB182_12
	jmp	.LBB182_7
.LBB182_7:                              //   in Loop: Header=BB182_6 Depth=1
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
	jg	rax, x6, .LBB182_9
	jmp	.LBB182_8
.LBB182_8:                              // %.loopexit
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 84
	mov	r0, -1
	jmp	.LBB182_15
.LBB182_9:                              //   in Loop: Header=BB182_6 Depth=1
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x2
	call	__bit_xor
	jge	rax, x5, .LBB182_11
	jmp	.LBB182_10
.LBB182_10:                             //   in Loop: Header=BB182_6 Depth=1
	mov	[x7], x4
.LBB182_11:                             //   in Loop: Header=BB182_6 Depth=1
add	x2, 1
add	x7, 4
	mov	r0, x1
	je	x1, x2, .LBB182_15
	jmp	.LBB182_6
.LBB182_12:                             // %.loopexit8
	mov	r0, x2
	jz	x0, .LBB182_15
	jmp	.LBB182_13
.LBB182_13:                             // %.loopexit8
	mov	r1, -2147483648
	mov	r0, x1
	call	__bit_xor
	mov	r1, -2147483648
	mov	x1, rax
	mov	r0, x2
	call	__bit_xor
	mov	r0, x2
	jge	rax, x1, .LBB182_15
	jmp	.LBB182_14
.LBB182_14:
	mov	r1, 2
	mov	r0, x2
	call	__bit_shl
	add	x0, rax
	mov	[x0], 0
	mov	r0, x2
.LBB182_15:                             // %.loopexit12
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
	jz	x0, .LBB183_2
	jmp	.LBB183_1
.LBB183_1:                              // %.preheader9.preheader
	mov	x1, 0
	mov	x6, -2147483520
	jmp	.LBB183_6
.LBB183_2:
	mov	r0, [x3]
	mov	rax, 0
	jz	r0, .LBB183_15
	jmp	.LBB183_3
.LBB183_3:                              // %.preheader.preheader
add	x3, 4
	mov	x1, 0
	mov	x4, -2147483521
.LBB183_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r1, -2147483648
	call	__bit_xor
	jg	rax, x4, .LBB183_8
	jmp	.LBB183_5
.LBB183_5:                              //   in Loop: Header=BB183_4 Depth=1
	mov	r0, [x3]
add	x1, 1
add	x3, 4
	jz	r0, .LBB183_12
	jmp	.LBB183_4
.LBB183_6:                              // %.preheader9
                                        // =>This Inner Loop Header: Depth=1
	mov	x4, [x3]
	jz	x4, .LBB183_12
	jmp	.LBB183_7
.LBB183_7:                              //   in Loop: Header=BB183_6 Depth=1
	mov	r1, -2147483648
	mov	r0, x4
	call	__bit_xor
	jl	rax, x6, .LBB183_9
	jmp	.LBB183_8
.LBB183_8:                              // %.loopexit
	mov	r0, mcasm_static_142472d2d59e3b09f160b4d97b43714d
	mov	[r0], 84
	mov	rax, -1
	jmp	.LBB183_15
.LBB183_9:                              //   in Loop: Header=BB183_6 Depth=1
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x5, rax
	mov	r0, x1
	call	__bit_xor
	jge	rax, x5, .LBB183_11
	jmp	.LBB183_10
.LBB183_10:                             //   in Loop: Header=BB183_6 Depth=1
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
.LBB183_11:                             //   in Loop: Header=BB183_6 Depth=1
add	x1, 1
add	x3, 4
	mov	rax, x2
	je	x2, x1, .LBB183_15
	jmp	.LBB183_6
.LBB183_12:                             // %.loopexit8
	mov	rax, x1
	jz	x0, .LBB183_15
	jmp	.LBB183_13
.LBB183_13:                             // %.loopexit8
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x2, rax
	mov	r0, x1
	call	__bit_xor
	mov	r0, rax
	mov	rax, x1
	jge	r0, x2, .LBB183_15
	jmp	.LBB183_14
.LBB183_14:
	add	x0, x1
	mov	r0, [x0]
	mov	r1, -256
	call	__bit_and
	mov	r1, 0
	mov	r0, rax
	call	__bit_or
	mov	[x0], rax
	mov	rax, x1
.LBB183_15:                             // %.loopexit12
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
.LBB184_1:                              // =>This Inner Loop Header: Depth=1
	mov	r1, [r0]
add	rax, 1
add	r0, 4
	jnz	r1, .LBB184_1
	jmp	.LBB184_2
.LBB184_2:
	ret
// -- End function
// -- Begin function wcscpy
wcscpy:                                 // @wcscpy
// %bb.0:
	mov	rax, r0
	mov	r0, 0
.LBB185_1:                              // =>This Inner Loop Header: Depth=1
	mov	r2, r1
	add	r2, r0
	mov	r2, [r2]
	mov	r3, rax
	add	r3, r0
	mov	[r3], r2
add	r0, 4
	jnz	r2, .LBB185_1
	jmp	.LBB185_2
.LBB185_2:
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
	jz	x0, .LBB186_4
	jmp	.LBB186_1
.LBB186_1:                              // %.preheader3.preheader
	mov	r0, x1
.LBB186_2:                              // %.preheader3
                                        // =>This Inner Loop Header: Depth=1
	mov	r2, [r1]
	jz	r2, .LBB186_4
	jmp	.LBB186_3
.LBB186_3:                              //   in Loop: Header=BB186_2 Depth=1
	mov	[r0], r2
add	x2, 1
add	r0, 4
add	r1, 4
	je	x0, x2, .LBB186_7
	jmp	.LBB186_2
.LBB186_4:                              // %.loopexit4
	mov	r1, -2147483648
	mov	r0, x2
	call	__bit_xor
	mov	r1, -2147483648
	mov	x3, rax
	mov	r0, x0
	call	__bit_xor
	jle	rax, x3, .LBB186_7
	jmp	.LBB186_5
.LBB186_5:                              // %.preheader.preheader
	mov	r1, 2
	sub	x0, x2
	mov	r0, x2
	call	__bit_shl
	add	rax, x1
.LBB186_6:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	[rax], 0
add	x0, -1
add	rax, 4
	jnz	x0, .LBB186_6
	jmp	.LBB186_7
.LBB186_7:                              // %.loopexit
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
.LBB187_1:                              // =>This Inner Loop Header: Depth=1
	mov	r2, rax
	add	r2, r0
	mov	r2, [r2]
add	r0, 4
	jnz	r2, .LBB187_1
	jmp	.LBB187_2
.LBB187_2:
add	r0, -4
.LBB187_3:                              // =>This Inner Loop Header: Depth=1
	mov	r2, [r1]
	mov	r3, rax
	add	r3, r0
add	r1, 4
	mov	[r3], r2
add	r0, 4
	jnz	r2, .LBB187_3
	jmp	.LBB187_4
.LBB187_4:
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
.LBB188_1:                              // =>This Inner Loop Header: Depth=1
add	x1, 4
	mov	r0, [x1]
	jnz	r0, .LBB188_1
	jmp	.LBB188_2
.LBB188_2:
	mov	r0, 0
	jz	r2, .LBB188_6
	jmp	.LBB188_3
.LBB188_3:                              // %.preheader.preheader
	mov	r3, 0
	mov	r4, x1
.LBB188_4:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r5, [r1]
	mov	r0, r3
	jz	r5, .LBB188_6
	jmp	.LBB188_5
.LBB188_5:                              //   in Loop: Header=BB188_4 Depth=1
	mov	[r4], r5
add	r3, 1
add	r4, 4
add	r1, 4
	mov	r0, r2
	jne	r2, r3, .LBB188_4
	jmp	.LBB188_6
.LBB188_6:                              // %.loopexit
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
	jz	r3, .LBB189_4
	jmp	.LBB189_1
.LBB189_1:                              // %.preheader.preheader
add	r0, 4
.LBB189_2:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r4, [r1]
	mov	r2, r3
	jne	r3, r4, .LBB189_4
	jmp	.LBB189_3
.LBB189_3:                              //   in Loop: Header=BB189_2 Depth=1
	mov	r3, [r0]
add	r1, 4
add	r0, 4
	mov	r2, 0
	jnz	r3, .LBB189_2
	jmp	.LBB189_4
.LBB189_4:                              // %.loopexit
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
	jz	r2, .LBB190_6
	jmp	.LBB190_1
.LBB190_1:                              // %.preheader.preheader
	jmp	.LBB190_3
.LBB190_2:                              //   in Loop: Header=BB190_3 Depth=1
add	r2, -1
add	r1, 4
add	r0, 4
	jz	r2, .LBB190_6
	jmp	.LBB190_3
.LBB190_3:                              // %.preheader
                                        // =>This Inner Loop Header: Depth=1
	mov	r3, [r0]
	mov	x0, [r1]
	jz	r3, .LBB190_5
	jmp	.LBB190_4
.LBB190_4:                              // %.preheader
                                        //   in Loop: Header=BB190_3 Depth=1
	je	r3, x0, .LBB190_2
	jmp	.LBB190_5
.LBB190_5:
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
.LBB190_6:                              // %.loopexit
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
.LBB191_1:                              // =>This Inner Loop Header: Depth=1
	mov	r2, [r0]
	mov	rax, r0
	je	r2, r1, .LBB191_3
	jmp	.LBB191_2
.LBB191_2:                              //   in Loop: Header=BB191_1 Depth=1
add	r0, 4
	mov	rax, 0
	jnz	r2, .LBB191_1
	jmp	.LBB191_3
.LBB191_3:
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
.LBB192_1:                              // =>This Inner Loop Header: Depth=1
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
	jnz	x2, .LBB192_1
	jmp	.LBB192_2
.LBB192_2:
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
	je	r2, r0, .LBB193_5
	jmp	.LBB193_4
.LBB193_4:                              //   in Loop: Header=BB193_3 Depth=2
add	r1, 4
	jz	r2, .LBB193_6
	jmp	.LBB193_3
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
	jz	r0, .LBB194_6
	jmp	.LBB194_1
.LBB194_1:                              // %.preheader.preheader
.LBB194_2:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB194_3 Depth 2
	mov	r1, x1
.LBB194_3:                              //   Parent Loop BB194_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r2, [r1]
	je	r2, r0, .LBB194_6
	jmp	.LBB194_4
.LBB194_4:                              //   in Loop: Header=BB194_3 Depth=2
add	r1, 4
	jnz	r2, .LBB194_3
	jmp	.LBB194_5
.LBB194_5:                              //   in Loop: Header=BB194_2 Depth=1
add	x2, 1
	mov	r1, 2
	mov	r0, x2
	call	__bit_shl
	add	rax, x0
	mov	r0, [rax]
	jnz	r0, .LBB194_2
	jmp	.LBB194_6
.LBB194_6:                              // %.loopexit
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
	jz	r2, .LBB195_6
	jmp	.LBB195_1
.LBB195_1:                              // %.preheader.preheader
.LBB195_2:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB195_3 Depth 2
	mov	rax, r0
	mov	r0, r1
.LBB195_3:                              //   Parent Loop BB195_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r3, [r0]
	je	r3, r2, .LBB195_6
	jmp	.LBB195_4
.LBB195_4:                              //   in Loop: Header=BB195_3 Depth=2
add	r0, 4
	jnz	r3, .LBB195_3
	jmp	.LBB195_5
.LBB195_5:                              //   in Loop: Header=BB195_2 Depth=1
add	rax, 4
	mov	r2, [rax]
	mov	r0, rax
	mov	rax, 0
	jnz	r2, .LBB195_2
	jmp	.LBB195_6
.LBB195_6:                              // %.loopexit
	ret
// -- End function
// -- Begin function wcsstr
wcsstr:                                 // @wcsstr
// %bb.0:
	mov	r2, -1
	mov	r3, r1
.LBB196_1:                              // =>This Inner Loop Header: Depth=1
	mov	r4, [r3]
add	r2, 1
add	r3, 4
	jnz	r4, .LBB196_1
	jmp	.LBB196_2
.LBB196_2:
	mov	rax, r0
	jz	r2, .LBB196_11
	jmp	.LBB196_3
.LBB196_3:
	mov	r3, [r0]
	mov	rax, 0
	jz	r3, .LBB196_11
	jmp	.LBB196_4
.LBB196_4:                              // %.preheader.preheader
.LBB196_5:                              // %.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB196_7 Depth 2
	mov	rax, r0
	mov	r0, 0
	mov	r3, r2
	jmp	.LBB196_7
.LBB196_6:                              //   in Loop: Header=BB196_7 Depth=2
add	r3, -1
add	r0, 4
	jz	r3, .LBB196_11
	jmp	.LBB196_7
.LBB196_7:                              //   Parent Loop BB196_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	r4, rax
	add	r4, r0
	mov	r4, [r4]
	mov	r5, r1
	add	r5, r0
	mov	r5, [r5]
	jz	r4, .LBB196_9
	jmp	.LBB196_8
.LBB196_8:                              //   in Loop: Header=BB196_7 Depth=2
	je	r4, r5, .LBB196_6
	jmp	.LBB196_9
.LBB196_9:                              //   in Loop: Header=BB196_5 Depth=1
	je	r4, r5, .LBB196_11
	jmp	.LBB196_10
.LBB196_10:                             //   in Loop: Header=BB196_5 Depth=1
add	rax, 4
	mov	r3, [rax]
	mov	r0, rax
	mov	rax, 0
	jnz	r3, .LBB196_5
	jmp	.LBB196_11
.LBB196_11:                             // %.loopexit
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
	jg	rax, r0, .LBB197_2
	jmp	.LBB197_1
.LBB197_1:
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
.LBB197_2:
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
	jl	rax, r0, .LBB205_2
	jmp	.LBB205_1
.LBB205_1:
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
.LBB205_2:                              // %ispunct.exit
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
	jg	rax, r0, .LBB206_5
	jmp	.LBB206_1
.LBB206_1:
	mov	r0, x0
add	r0, -9
	mov	r1, -2147483648
	mov	x1, 1
	call	__bit_xor
	mov	x2, -2147483646
	jl	rax, x2, .LBB206_5
	jmp	.LBB206_2
.LBB206_2:
	mov	r0, x0
add	r0, -12
	mov	r1, -2147483648
	call	__bit_xor
	jl	rax, x2, .LBB206_5
	jmp	.LBB206_3
.LBB206_3:
	mov	r0, 32
	je	x0, r0, .LBB206_5
	jmp	.LBB206_4
.LBB206_4:
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
.LBB206_5:                              // %isspace.exit
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
	jg	rax, r0, .LBB208_2
	jmp	.LBB208_1
.LBB208_1:
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
.LBB208_2:
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
	jl	rax, r0, .LBB209_2
	jmp	.LBB209_1
.LBB209_1:
add	x0, 32
.LBB209_2:
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
	jl	rax, r0, .LBB210_2
	jmp	.LBB210_1
.LBB210_1:
add	x0, -32
.LBB210_2:
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
	jz	x2, .LBB211_2
	jmp	.LBB211_1
.LBB211_1:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x1, rax
	mov	x5, mcasm_static_891f2c109a8df2c25cbf461c45dccc49
	mov	x3, x1
	mov	x6, x0
	jmp	.LBB211_7
.LBB211_2:
	mov	x1, [x0]
	mov	r1, 1970170977
	mov	x5, mcasm_static_891f2c109a8df2c25cbf461c45dccc49
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB211_7
	jmp	.LBB211_3
.LBB211_3:                              // %.preheader5.i.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB211_4:                              // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 1
	jne	r0, x3, .LBB211_113
	jmp	.LBB211_5
.LBB211_5:                              //   in Loop: Header=BB211_4 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB211_4
	jmp	.LBB211_6
.LBB211_6:
	mov	x3, r1
.LBB211_7:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB211_12
	jmp	.LBB211_8
.LBB211_8:                              // %.preheader.i.preheader
add	x6, 1
.LBB211_9:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB211_11
	jmp	.LBB211_10
.LBB211_10:                             //   in Loop: Header=BB211_9 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB211_9
	jmp	.LBB211_11
.LBB211_11:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB211_12:                             // %strcmp.exit
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 1
	je	x4, r0, .LBB211_113
	jmp	.LBB211_13
.LBB211_13:
	mov	x5, mcasm_static_7741ddae1f080eb9d7890906039deace
	mov	x3, x1
	mov	x6, x0
	jnz	x2, .LBB211_19
	jmp	.LBB211_14
.LBB211_14:
	mov	x1, [x0]
	mov	r1, 1752198241
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB211_19
	jmp	.LBB211_15
.LBB211_15:                             // %.preheader5.i2.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB211_16:                             // %.preheader5.i2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 2
	jne	r0, x3, .LBB211_113
	jmp	.LBB211_17
.LBB211_17:                             //   in Loop: Header=BB211_16 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB211_16
	jmp	.LBB211_18
.LBB211_18:
	mov	x3, r1
.LBB211_19:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB211_24
	jmp	.LBB211_20
.LBB211_20:                             // %.preheader.i1.preheader
add	x6, 1
.LBB211_21:                             // %.preheader.i1
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB211_23
	jmp	.LBB211_22
.LBB211_22:                             //   in Loop: Header=BB211_21 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB211_21
	jmp	.LBB211_23
.LBB211_23:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB211_24:                             // %strcmp.exit3
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 2
	je	x4, r0, .LBB211_113
	jmp	.LBB211_25
.LBB211_25:
	mov	x5, mcasm_static_80249caa2ec9aa2b026b4647a0fba325
	mov	x3, x1
	mov	x6, x0
	jnz	x2, .LBB211_31
	jmp	.LBB211_26
.LBB211_26:
	mov	x1, [x0]
	mov	r1, 1851878498
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB211_31
	jmp	.LBB211_27
.LBB211_27:                             // %.preheader5.i5.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB211_28:                             // %.preheader5.i5
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 3
	jne	r0, x3, .LBB211_113
	jmp	.LBB211_29
.LBB211_29:                             //   in Loop: Header=BB211_28 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB211_28
	jmp	.LBB211_30
.LBB211_30:
	mov	x3, r1
.LBB211_31:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB211_36
	jmp	.LBB211_32
.LBB211_32:                             // %.preheader.i4.preheader
add	x6, 1
.LBB211_33:                             // %.preheader.i4
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB211_35
	jmp	.LBB211_34
.LBB211_34:                             //   in Loop: Header=BB211_33 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB211_33
	jmp	.LBB211_35
.LBB211_35:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB211_36:                             // %strcmp.exit6
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 3
	je	x4, r0, .LBB211_113
	jmp	.LBB211_37
.LBB211_37:
	mov	x5, mcasm_static_829656523c3f4d9c88ca1f5c00af3fc7
	mov	x3, x1
	mov	x6, x0
	jnz	x2, .LBB211_43
	jmp	.LBB211_38
.LBB211_38:
	mov	x1, [x0]
	mov	r1, 1920233059
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB211_43
	jmp	.LBB211_39
.LBB211_39:                             // %.preheader5.i8.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB211_40:                             // %.preheader5.i8
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 4
	jne	r0, x3, .LBB211_113
	jmp	.LBB211_41
.LBB211_41:                             //   in Loop: Header=BB211_40 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB211_40
	jmp	.LBB211_42
.LBB211_42:
	mov	x3, r1
.LBB211_43:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB211_48
	jmp	.LBB211_44
.LBB211_44:                             // %.preheader.i7.preheader
add	x6, 1
.LBB211_45:                             // %.preheader.i7
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB211_47
	jmp	.LBB211_46
.LBB211_46:                             //   in Loop: Header=BB211_45 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB211_45
	jmp	.LBB211_47
.LBB211_47:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB211_48:                             // %strcmp.exit9
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 4
	je	x4, r0, .LBB211_113
	jmp	.LBB211_49
.LBB211_49:
	mov	x5, mcasm_static_4cb2607089a23c5217153e3aecbbb531
	mov	x3, x1
	mov	x6, x0
	jnz	x2, .LBB211_55
	jmp	.LBB211_50
.LBB211_50:
	mov	x1, [x0]
	mov	r1, 1768384868
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB211_55
	jmp	.LBB211_51
.LBB211_51:                             // %.preheader5.i11.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB211_52:                             // %.preheader5.i11
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 5
	jne	r0, x3, .LBB211_113
	jmp	.LBB211_53
.LBB211_53:                             //   in Loop: Header=BB211_52 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB211_52
	jmp	.LBB211_54
.LBB211_54:
	mov	x3, r1
.LBB211_55:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB211_60
	jmp	.LBB211_56
.LBB211_56:                             // %.preheader.i10.preheader
add	x6, 1
.LBB211_57:                             // %.preheader.i10
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB211_59
	jmp	.LBB211_58
.LBB211_58:                             //   in Loop: Header=BB211_57 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB211_57
	jmp	.LBB211_59
.LBB211_59:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB211_60:                             // %strcmp.exit12
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 5
	je	x4, r0, .LBB211_113
	jmp	.LBB211_61
.LBB211_61:
	mov	x5, mcasm_static_3365323f93813ddb74651c4e7ec585c4
	mov	x3, x1
	mov	x6, x0
	jnz	x2, .LBB211_67
	jmp	.LBB211_62
.LBB211_62:
	mov	x1, [x0]
	mov	r1, 1885434471
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB211_67
	jmp	.LBB211_63
.LBB211_63:                             // %.preheader5.i14.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB211_64:                             // %.preheader5.i14
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 6
	jne	r0, x3, .LBB211_113
	jmp	.LBB211_65
.LBB211_65:                             //   in Loop: Header=BB211_64 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB211_64
	jmp	.LBB211_66
.LBB211_66:
	mov	x3, r1
.LBB211_67:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB211_72
	jmp	.LBB211_68
.LBB211_68:                             // %.preheader.i13.preheader
add	x6, 1
.LBB211_69:                             // %.preheader.i13
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB211_71
	jmp	.LBB211_70
.LBB211_70:                             //   in Loop: Header=BB211_69 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB211_69
	jmp	.LBB211_71
.LBB211_71:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB211_72:                             // %strcmp.exit15
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 6
	je	x4, r0, .LBB211_113
	jmp	.LBB211_73
.LBB211_73:
	mov	x5, mcasm_static_63d5f05c649c07eacaa2cb1a0bb1a7f4
	mov	x3, x1
	mov	x6, x0
	jnz	x2, .LBB211_79
	jmp	.LBB211_74
.LBB211_74:
	mov	x1, [x0]
	mov	r1, 1702326124
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB211_79
	jmp	.LBB211_75
.LBB211_75:                             // %.preheader5.i17.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB211_76:                             // %.preheader5.i17
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 7
	jne	r0, x3, .LBB211_113
	jmp	.LBB211_77
.LBB211_77:                             //   in Loop: Header=BB211_76 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB211_76
	jmp	.LBB211_78
.LBB211_78:
	mov	x3, r1
.LBB211_79:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB211_84
	jmp	.LBB211_80
.LBB211_80:                             // %.preheader.i16.preheader
add	x6, 1
.LBB211_81:                             // %.preheader.i16
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB211_83
	jmp	.LBB211_82
.LBB211_82:                             //   in Loop: Header=BB211_81 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB211_81
	jmp	.LBB211_83
.LBB211_83:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB211_84:                             // %strcmp.exit18
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 7
	je	x4, r0, .LBB211_113
	jmp	.LBB211_85
.LBB211_85:
	mov	x5, mcasm_static_d9238f61a87a5036e49430924ded8b99
	mov	x3, x1
	mov	x6, x0
	jnz	x2, .LBB211_91
	jmp	.LBB211_86
.LBB211_86:
	mov	x1, [x0]
	mov	r1, 1852404336
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB211_91
	jmp	.LBB211_87
.LBB211_87:                             // %.preheader5.i20.preheader
	mov	x3, -2139062144
	mov	x6, x0
.LBB211_88:                             // %.preheader5.i20
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 8
	jne	r0, x3, .LBB211_113
	jmp	.LBB211_89
.LBB211_89:                             //   in Loop: Header=BB211_88 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB211_88
	jmp	.LBB211_90
.LBB211_90:
	mov	x3, r1
.LBB211_91:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB211_96
	jmp	.LBB211_92
.LBB211_92:                             // %.preheader.i19.preheader
add	x6, 1
.LBB211_93:                             // %.preheader.i19
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB211_95
	jmp	.LBB211_94
.LBB211_94:                             //   in Loop: Header=BB211_93 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB211_93
	jmp	.LBB211_95
.LBB211_95:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB211_96:                             // %strcmp.exit21
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 8
	je	x4, r0, .LBB211_113
	jmp	.LBB211_97
.LBB211_97:
	mov	x3, mcasm_static_0228fe89b879b7e909d630946938b170
	mov	x4, x0
	jnz	x2, .LBB211_103
	jmp	.LBB211_98
.LBB211_98:
	mov	x1, [x0]
	mov	r1, 1668183408
	mov	x4, x0
	jne	x1, r1, .LBB211_103
	jmp	.LBB211_99
.LBB211_99:                             // %.preheader5.i23.preheader
	mov	x1, -2139062144
	mov	x4, x0
.LBB211_100:                            // %.preheader5.i23
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	mov	r0, rax
	mov	rax, 9
	jne	r0, x1, .LBB211_113
	jmp	.LBB211_101
.LBB211_101:                            //   in Loop: Header=BB211_100 Depth=1
add	x4, 4
add	x3, 4
	mov	r1, [x4]
	mov	r0, [x3]
	je	r1, r0, .LBB211_100
	jmp	.LBB211_102
.LBB211_102:
	mov	x1, r1
.LBB211_103:
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	x2, 0
	jz	rax, .LBB211_108
	jmp	.LBB211_104
.LBB211_104:                            // %.preheader.i22.preheader
add	x4, 1
.LBB211_105:                            // %.preheader.i22
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, x1
	jne	rax, x2, .LBB211_107
	jmp	.LBB211_106
.LBB211_106:                            //   in Loop: Header=BB211_105 Depth=1
	mov	r0, [x4]
	mov	r1, 255
add	x3, 1
	call	__bit_and
	mov	x1, rax
add	x4, 1
	mov	r0, 0
	jnz	x1, .LBB211_105
	jmp	.LBB211_107
.LBB211_107:
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
.LBB211_108:                            // %strcmp.exit24
	mov	r0, [x3]
	mov	r1, 255
	call	__bit_and
	mov	r0, rax
	mov	rax, 9
	je	x2, r0, .LBB211_113
	jmp	.LBB211_109
.LBB211_109:
	mov	r1, mcasm_static_0a8b84f471e67cd381c37e11877f79b4
	mov	r0, x0
	call	strcmp
	mov	r0, rax
	mov	rax, 10
	jz	r0, .LBB211_113
	jmp	.LBB211_110
.LBB211_110:
	mov	r1, mcasm_static_740f2a919f676a7ab6224e0acc46b0e9
	mov	r0, x0
	call	strcmp
	mov	r0, rax
	mov	rax, 11
	jz	r0, .LBB211_113
	jmp	.LBB211_111
.LBB211_111:
	mov	r1, mcasm_static_938106abc356533ab100c79608f68fbc
	mov	r0, x0
	call	strcmp
	mov	r0, rax
	mov	rax, 12
	jz	r0, .LBB211_113
	jmp	.LBB211_112
.LBB211_112:
	mov	rax, 0
.LBB211_113:                            // %strcmp.exit.thread
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
	jg	r1, r0, .LBB212_8
	jmp	.LBB212_1
.LBB212_1:
	mov	r0, 3
	jg	r1, r0, .LBB212_5
	jmp	.LBB212_2
.LBB212_2:
	mov	r0, 1
	je	r1, r0, .LBB212_15
	jmp	.LBB212_3
.LBB212_3:
	mov	r0, 2
	je	r1, r0, .LBB212_17
	jmp	.LBB212_4
.LBB212_4:
	mov	r0, 3
	je	r1, r0, .LBB212_19
	jmp	.LBB212_40
.LBB212_5:
	mov	r0, 4
	je	r1, r0, .LBB212_21
	jmp	.LBB212_6
.LBB212_6:
	mov	r0, 5
	je	r1, r0, .LBB212_23
	jmp	.LBB212_7
.LBB212_7:
	mov	r0, 6
	je	r1, r0, .LBB212_25
	jmp	.LBB212_40
.LBB212_8:
	mov	r0, 9
	jg	r1, r0, .LBB212_12
	jmp	.LBB212_9
.LBB212_9:
	mov	r0, 7
	je	r1, r0, .LBB212_27
	jmp	.LBB212_10
.LBB212_10:
	mov	r0, 8
	je	r1, r0, .LBB212_29
	jmp	.LBB212_11
.LBB212_11:
	mov	r0, 9
	je	r1, r0, .LBB212_31
	jmp	.LBB212_40
.LBB212_12:
	mov	r0, 10
	je	r1, r0, .LBB212_33
	jmp	.LBB212_13
.LBB212_13:
	mov	r0, 11
	je	r1, r0, .LBB212_35
	jmp	.LBB212_14
.LBB212_14:
	mov	r0, 12
	je	r1, r0, .LBB212_37
	jmp	.LBB212_40
.LBB212_15:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_16
.LBB212_16:
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
	jmp	.LBB212_40
.LBB212_17:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_18
.LBB212_18:
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
	jmp	.LBB212_40
.LBB212_19:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_20
.LBB212_20:
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
	jmp	.LBB212_40
.LBB212_21:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_22
.LBB212_22:
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
	jmp	.LBB212_40
.LBB212_23:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_24
.LBB212_24:
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
	jmp	.LBB212_40
.LBB212_25:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_26
.LBB212_26:
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
	jmp	.LBB212_40
.LBB212_27:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_28
.LBB212_28:
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
	jmp	.LBB212_40
.LBB212_29:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_30
.LBB212_30:
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
	jmp	.LBB212_40
.LBB212_31:
	mov	r0, x0
add	r0, -127
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483554
	jl	rax, r0, .LBB212_40
	jmp	.LBB212_32
.LBB212_32:
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
	jmp	.LBB212_40
.LBB212_33:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_34
.LBB212_34:
add	x0, -9
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483624
	jl	rax, r0, .LBB212_39
	jmp	.LBB212_40
.LBB212_35:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_36
.LBB212_36:
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
	jmp	.LBB212_40
.LBB212_37:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB212_40
	jmp	.LBB212_38
.LBB212_38:
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
	jmp	.LBB212_40
.LBB212_39:                             // %switch.lookup
	mov	r0, 8388639
	mov	r1, x0
	call	__bit_shr
	mov	x1, rax
.LBB212_40:                             // %ispunct.exit
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
	jz	x2, .LBB213_2
	jmp	.LBB213_1
.LBB213_1:
	mov	r0, [x0]
	mov	r1, 255
	call	__bit_and
	mov	x1, rax
	mov	x5, mcasm_static_bbc55a42ca0240c6d2bf63850e5d2877
	mov	x3, x1
	mov	x6, x0
	jmp	.LBB213_7
.LBB213_2:
	mov	x1, [x0]
	mov	r1, 1869377396
	mov	x5, mcasm_static_bbc55a42ca0240c6d2bf63850e5d2877
	mov	x3, x1
	mov	x6, x0
	jne	x1, r1, .LBB213_7
	jmp	.LBB213_3
.LBB213_3:                              // %.preheader5.i.preheader
	mov	x4, -2139062144
	mov	x6, x0
	mov	x3, 1
.LBB213_4:                              // %.preheader5.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x4, .LBB213_26
	jmp	.LBB213_5
.LBB213_5:                              //   in Loop: Header=BB213_4 Depth=1
add	x6, 4
add	x5, 4
	mov	r1, [x6]
	mov	r0, [x5]
	je	r1, r0, .LBB213_4
	jmp	.LBB213_6
.LBB213_6:
	mov	x3, r1
.LBB213_7:
	mov	r1, 255
	mov	r0, x3
	call	__bit_and
	mov	x4, 0
	jz	rax, .LBB213_12
	jmp	.LBB213_8
.LBB213_8:                              // %.preheader.i.preheader
add	x6, 1
.LBB213_9:                              // %.preheader.i
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x4, rax
	mov	r0, x3
	call	__bit_and
	mov	r0, x3
	jne	rax, x4, .LBB213_11
	jmp	.LBB213_10
.LBB213_10:                             //   in Loop: Header=BB213_9 Depth=1
	mov	r0, [x6]
	mov	r1, 255
add	x5, 1
	call	__bit_and
	mov	x3, rax
add	x6, 1
	mov	r0, 0
	jnz	x3, .LBB213_9
	jmp	.LBB213_11
.LBB213_11:
	mov	r1, 255
	call	__bit_and
	mov	x4, rax
.LBB213_12:                             // %strcmp.exit
	mov	r0, [x5]
	mov	r1, 255
	call	__bit_and
	mov	x3, 1
	je	x4, rax, .LBB213_26
	jmp	.LBB213_13
.LBB213_13:
	mov	x4, mcasm_static_c2a2799b930ac2bd3b300be409c747db
	jnz	x2, .LBB213_19
	jmp	.LBB213_14
.LBB213_14:
	mov	x1, [x0]
	mov	r1, 1886744436
	jne	x1, r1, .LBB213_19
	jmp	.LBB213_15
.LBB213_15:                             // %.preheader5.i2.preheader
	mov	x1, -2139062144
.LBB213_16:                             // %.preheader5.i2
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, 16843008
	sub	r0, r1
	call	__bit_or
	mov	r1, -2139062144
	mov	r0, rax
	call	__bit_and
	jne	rax, x1, .LBB213_25
	jmp	.LBB213_17
.LBB213_17:                             //   in Loop: Header=BB213_16 Depth=1
add	x0, 4
add	x4, 4
	mov	r1, [x0]
	mov	r0, [x4]
	je	r1, r0, .LBB213_16
	jmp	.LBB213_18
.LBB213_18:
	mov	x1, r1
.LBB213_19:
	mov	r1, 255
	mov	r0, x1
	call	__bit_and
	mov	x3, 0
	mov	x2, 0
	jz	rax, .LBB213_24
	jmp	.LBB213_20
.LBB213_20:                             // %.preheader.i1.preheader
add	x0, 1
.LBB213_21:                             // %.preheader.i1
                                        // =>This Inner Loop Header: Depth=1
	mov	r0, [x4]
	mov	r1, 255
	call	__bit_and
	mov	r1, 255
	mov	x2, rax
	mov	r0, x1
	call	__bit_and
	mov	r0, x1
	jne	rax, x2, .LBB213_23
	jmp	.LBB213_22
.LBB213_22:                             //   in Loop: Header=BB213_21 Depth=1
	mov	r0, [x0]
	mov	r1, 255
add	x4, 1
	call	__bit_and
	mov	x1, rax
add	x0, 1
	mov	r0, 0
	jnz	x1, .LBB213_21
	jmp	.LBB213_23
.LBB213_23:
	mov	r1, 255
	call	__bit_and
	mov	x2, rax
.LBB213_24:                             // %strcmp.exit3
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
	jz	rax, .LBB213_26
	jmp	.LBB213_25
.LBB213_25:                             // %strcmp.exit3.thread
	mov	x3, 2
.LBB213_26:                             // %strcmp.exit.thread
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
	je	r1, r2, .LBB214_5
	jmp	.LBB214_1
.LBB214_1:
	mov	r0, 1
	jne	r1, r0, .LBB214_8
	jmp	.LBB214_2
.LBB214_2:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB214_8
	jmp	.LBB214_3
.LBB214_3:
	mov	r0, x0
add	r0, -91
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483622
	jl	rax, r0, .LBB214_8
	jmp	.LBB214_4
.LBB214_4:
add	x0, 32
	jmp	.LBB214_8
.LBB214_5:
	mov	r1, -2147483648
	mov	r0, x0
	call	__bit_xor
	mov	r0, -2147483521
	jg	rax, r0, .LBB214_8
	jmp	.LBB214_6
.LBB214_6:
	mov	r0, x0
add	r0, -123
	mov	r1, -2147483648
	call	__bit_xor
	mov	r0, 2147483622
	jl	rax, r0, .LBB214_8
	jmp	.LBB214_7
.LBB214_7:
add	x0, -32
.LBB214_8:
	mov	rax, x0
	mov	x0, [rsp]
add	rsp, 4
	ret
// -- End function
static mcasm_static_fd611fc114a120251d3bb0779527cffa [67, 0]
static mcasm_static_364a465b9a8c8cccb7995ee4c8f39368 [67, 0]
static mcasm_static_c0751ee5d80153739077df0eb22d8cf2 [80, 79, 83, 73, 88, 0]
static mcasm_static_ebdf0acee9ce76a249b6e991dee08477 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 127, 127, 127, 127, 127, 127, 127]
static mcasm_static_3443d36ac0fbff57434cfedae2780c15 [46, 0]
static mcasm_static_d044dad097491f3b231c062c51f98ef1 [0]
static mcasm_static_6c512c1d8a49073aa4033892406fe6f0 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
static mcasm_static_2078a7cad13418b7d6bb79f41d8e5039 [0, 0, 0, 0]
static mcasm_static_ee73e91b2ce062de0e51c818d378164b [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
static mcasm_static_a4e7dd8d428b46688e58083d59991365 [40, 110, 117, 108, 108, 41, 0]
static mcasm_static_33e910d9c02b581815e9f2b4c5abb7e7 [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 0]
static mcasm_static_f8e19bb548063f7e0853088bf1742635 [0]
static mcasm_static_19710b3210d64aff7e9537bfb47c693a [78, 65, 78, 0]
static mcasm_static_5b24bee0a469059477a316866143d333 [73, 78, 70, 0]
static mcasm_static_0bad95a651bdc2c03a026766d861797a [78, 97, 78, 0]
static mcasm_static_ec102b563ba176d293dc88ca08ecc96e [110, 97, 110, 0]
static mcasm_static_99deb3aad5ed05717e1eac3570660880 [73, 110, 102, 105, 110, 105, 116, 121, 0]
static mcasm_static_40f2bddad2b29e06c8c77391a68e96be [105, 110, 102, 0]
static mcasm_static_b86553a1da086346353b901a180db000 [45, 73, 110, 102, 105, 110, 105, 116, 121, 0]
static mcasm_static_c6baa867edf1c8a44886c01357c4c77a [45, 105, 110, 102, 0]
static mcasm_static_5ad1204a25ebfbceb67ccbbb51b2ba29 [48, 48, 48, 49, 48, 50, 48, 51, 48, 52, 48, 53, 48, 54, 48, 55, 48, 56, 48, 57, 49, 48, 49, 49, 49, 50, 49, 51, 49, 52, 49, 53, 49, 54, 49, 55, 49, 56, 49, 57, 50, 48, 50, 49, 50, 50, 50, 51, 50, 52, 50, 53, 50, 54, 50, 55, 50, 56, 50, 57, 51, 48, 51, 49, 51, 50, 51, 51, 51, 52, 51, 53, 51, 54, 51, 55, 51, 56, 51, 57, 52, 48, 52, 49, 52, 50, 52, 51, 52, 52, 52, 53, 52, 54, 52, 55, 52, 56, 52, 57, 53, 48, 53, 49, 53, 50, 53, 51, 53, 52, 53, 53, 53, 54, 53, 55, 53, 56, 53, 57, 54, 48, 54, 49, 54, 50, 54, 51, 54, 52, 54, 53, 54, 54, 54, 55, 54, 56, 54, 57, 55, 48, 55, 49, 55, 50, 55, 51, 55, 52, 55, 53, 55, 54, 55, 55, 55, 56, 55, 57, 56, 48, 56, 49, 56, 50, 56, 51, 56, 52, 56, 53, 56, 54, 56, 55, 56, 56, 56, 57, 57, 48, 57, 49, 57, 50, 57, 51, 57, 52, 57, 53, 57, 54, 57, 55, 57, 56, 57, 57, 0]
static mcasm_static_f5c19d5e962478431864f85657b6afe2 [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 0]
static mcasm_static_70f2f9ec418b2b3a16302bf74dd955fb [48, 48, 48, 49, 48, 50, 48, 51, 48, 52, 48, 53, 48, 54, 48, 55, 48, 56, 48, 57, 49, 48, 49, 49, 49, 50, 49, 51, 49, 52, 49, 53, 49, 54, 49, 55, 49, 56, 49, 57, 50, 48, 50, 49, 50, 50, 50, 51, 50, 52, 50, 53, 50, 54, 50, 55, 50, 56, 50, 57, 51, 48, 51, 49, 51, 50, 51, 51, 51, 52, 51, 53, 51, 54, 51, 55, 51, 56, 51, 57, 52, 48, 52, 49, 52, 50, 52, 51, 52, 52, 52, 53, 52, 54, 52, 55, 52, 56, 52, 57, 53, 48, 53, 49, 53, 50, 53, 51, 53, 52, 53, 53, 53, 54, 53, 55, 53, 56, 53, 57, 54, 48, 54, 49, 54, 50, 54, 51, 54, 52, 54, 53, 54, 54, 54, 55, 54, 56, 54, 57, 55, 48, 55, 49, 55, 50, 55, 51, 55, 52, 55, 53, 55, 54, 55, 55, 55, 56, 55, 57, 56, 48, 56, 49, 56, 50, 56, 51, 56, 52, 56, 53, 56, 54, 56, 55, 56, 56, 56, 57, 57, 48, 57, 49, 57, 50, 57, 51, 57, 52, 57, 53, 57, 54, 57, 55, 57, 56, 57, 57]
static mcasm_static_9ee17463bf5b806f51f18903a3b6b403 [0, 0, 0, 0]
static mcasm_static_142472d2d59e3b09f160b4d97b43714d [0, 0, 0, 0]
static mcasm_static_891f2c109a8df2c25cbf461c45dccc49 [97, 108, 110, 117, 109, 0]
static mcasm_static_7741ddae1f080eb9d7890906039deace [97, 108, 112, 104, 97, 0]
static mcasm_static_80249caa2ec9aa2b026b4647a0fba325 [98, 108, 97, 110, 107, 0]
static mcasm_static_829656523c3f4d9c88ca1f5c00af3fc7 [99, 110, 116, 114, 108, 0]
static mcasm_static_4cb2607089a23c5217153e3aecbbb531 [100, 105, 103, 105, 116, 0]
static mcasm_static_3365323f93813ddb74651c4e7ec585c4 [103, 114, 97, 112, 104, 0]
static mcasm_static_63d5f05c649c07eacaa2cb1a0bb1a7f4 [108, 111, 119, 101, 114, 0]
static mcasm_static_d9238f61a87a5036e49430924ded8b99 [112, 114, 105, 110, 116, 0]
static mcasm_static_0228fe89b879b7e909d630946938b170 [112, 117, 110, 99, 116, 0]
static mcasm_static_0a8b84f471e67cd381c37e11877f79b4 [115, 112, 97, 99, 101, 0]
static mcasm_static_740f2a919f676a7ab6224e0acc46b0e9 [117, 112, 112, 101, 114, 0]
static mcasm_static_938106abc356533ab100c79608f68fbc [120, 100, 105, 103, 105, 116, 0]
static mcasm_static_bbc55a42ca0240c6d2bf63850e5d2877 [116, 111, 108, 111, 119, 101, 114, 0]
static mcasm_static_c2a2799b930ac2bd3b300be409c747db [116, 111, 117, 112, 112, 101, 114, 0]
static mcasm_static_7f98860c67273bd73a13b5d46751e24d [0, 0, 0, 0, 0, 0, 0, 0]

export _ll_shared:z/__mc_string_begin_0:
    inline data modify storage std:vm s1 set value {str: "", next: ""}
    inline $data modify storage std:vm s1.str set from storage std:vm char2str_map."$(a)"
	ret

export _ll_shared:z/__mc_string_begin_1:
    inline $data modify storage std:vm s1.next set from storage std:vm char2str_map."$(a)"
    inline function std:_internal/merge_string with storage std:vm s1
	ret
