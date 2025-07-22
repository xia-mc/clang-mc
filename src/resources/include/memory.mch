#once

// void *malloc(int size)
malloc:
    mov rax, 0
    rle r0, 0

.loop:
    mov t0, [rax]
    jg t0, r0, .found
    sub rax, t0
    jge rax, shp, .oom
    jmp .loop
.oom:
    push r0
    mov r0, shp
    inline function std:heap/expand

    mov t0, r0
    mov [rax], t0

    pop r0
    jg t0, r0, .found
    add rax, t0
    jge rax, shp, .oom
    jmp .loop
.found:
    add r0, 1
    je t0, r0, .to_ret

    sub t0, r0
    mov [rax + r0], t0

.to_ret:
    mul r0, -1
    mov [rax], r0
    add rax, 1
    ret


// void free(void *ptr)
free:
    rle r0, 0
    // 暂时不考虑合并块
    mul [r0 - 1], -1  // 最高位取反
    ret

// void memset(void *ptr, int value, int size)
memset:
    rle r2, 0

    add r2, r0
.loop:
    mov [r0], r1
    add r0, 1
    re r0, r2

    mov [r0], r1
    add r0, 1
    re r0, r2

    mov [r0], r1
    add r0, 1
    re r0, r2

    mov [r0], r1
    add r0, 1
    re r0, r2

    jmp .loop

// void memcpy(void *from, void *to, int size)
memcpy:
    rle r2, 0
    re r0, r1

    add r2, r0
.loop:
    mov [r1], [r0]
    add r0, 1
    add r1, 1
    re r0, r2

    mov [r1], [r0]
    add r0, 1
    add r1, 1
    re r0, r2

    mov [r1], [r0]
    add r0, 1
    add r1, 1
    re r0, r2

    mov [r1], [r0]
    add r0, 1
    add r1, 1
    re r0, r2

    jmp .loop

// void memmove(void *src, void *dst, int size)
memmove:
    rle r2, 0
    re r0, r1

    jl r0, r1, .backward

.forward:
    add r2, r0
.forwardLoop:
    mov [r1], [r0]
    add r0, 1
    add r1, 1
    re r0, r2

    mov [r1], [r0]
    add r0, 1
    add r1, 1
    re r0, r2

    mov [r1], [r0]
    add r0, 1
    add r1, 1
    re r0, r2

    mov [r1], [r0]
    add r0, 1
    add r1, 1
    re r0, r2

    jmp .forwardLoop

.backward:
    mov t0, r0
    add r0, r2
    add r1, r2
.backwardLoop:
    sub r0, 1
    sub r1, 1
    mov [r1], [r0]
    re r0, t0

    sub r0, 1
    sub r1, 1
    mov [r1], [r0]
    re r0, t0

    sub r0, 1
    sub r1, 1
    mov [r1], [r0]
    re r0, t0
    
    sub r0, 1
    sub r1, 1
    mov [r1], [r0]
    re r0, t0

    jmp .backwardLoop
