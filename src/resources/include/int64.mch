#once

// typedef struct {
//     int low;
//     int high;
// } Int64;


// void Int64_Zero(Int64 *result)
Int64_Zero:
    mov [r0], 0
    add r0, 1
    mov [r0], 0
    ret


// void Int64_FromInt(Int64 *result, int value)
Int64_FromInt:
    mov [r0], r1
    rge r1, 0
    add r0, 1
    mov [r0], 0x7FFFFFFF
    ret

// void Int64_Copy(Int64 *result, Int64 *value)
Int64_Copy:
    mov [r0], [r1]
    add r0, 1
    add r1, 1
    mov [r0], [r1]
    ret


// bool Int64_CheckInt(Int64 *value)
Int64_CheckInt:
    mov rax, 1
    add r0, 1
    rne [r0], 0x00000000
    rne [r0], 0x7FFFFFFF
    mov rax, 0
    ret


// int Int64_AsInt(Int64 *value)
Int64_AsInt:
    // assert(Int64_CheckInt(value));
    mov rax, [r0]
    add r0, 1
    re [r0], 0x00000000
    mul rax, -1
    ret


#define Int64_ADD(resLow, resHigh, valueLow, valueHigh) \
    #push label \
    add resHigh, valueHigh \
    add resLow, valueLow \
    jge resLow, valueLow, ._Int64_ADD__fin \
    add resHigh, 1 \
._Int64_ADD__fin: \
    #pop label

#define Int64_SUB(resLow, resHigh, valueLow, valueHigh, tmp)   \
    #push label \
    mov     tmp,  resLow \
    sub     resLow, valueLow \
    sub     resHigh, valueHigh \
    jge     tmp,  valueLow, ._Int64_SUB__fin \
    sub     resHigh, 1  // 借位，修正高32位 \
._Int64_SUB__fin: \
    #pop label


// void Int64_Add(Int64 *result, Int64 *value)
Int64_Add:
    mov t0, r0
    add t0, 1
    mov t1, [r0]
    mov t2, [t0]
    mov t3, [r1]
    add r1, 1
    mov t4, [r1]

    // int *r0;  // resultLow
    // int *t0; // resultHigh
    // int t1; // resultLowVal
    // int t2; // resultHighVal
    // int t3; // valueLowVal
    // int t4; // valueHighVal
    Int64_ADD(t1, t2, t3, t4)

.fin:
    mov [r0], t1
    mov [t0], t2
    ret


// void Int64_Sub(Int64 *result, Int64 *value)
Int64_Sub:
    mov t0, r0
    add t0, 1
    mov t1, [r0]
    mov t2, [t0]
    mov t3, [r1]
    add r1, 1
    mov t4, [r1]

    // int *r0;  // resultLow
    // int *t0; // resultHigh
    // int t1; // resultLowVal
    // int t2; // resultHighVal
    // int t3; // valueLowVal
    // int t4; // valueHighVal
    Int64_SUB(t1, t2, t3, t4, t5)

.fin:
    mov [r0], t1
    mov [t0], t2
    ret
