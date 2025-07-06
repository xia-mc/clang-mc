#once
#include "int"


// int String_Len(char *string)
String_Len:
    mov rax, 0
.loop:
    re [r0], 0
    add r0, 1
    add rax, 1
    jmp .loop


// void String_Copy(char *src, char *dst)
String_Copy:
    mov [r1], [r0]
    re [r0], 0
    add r0, 1
    add r1, 1
    jmp String_Copy
