#once
#define MIN_API_VER 1

#define SYS_getAPIVersion 0
#define SYS_nanoTimes 1
#define SYS_print 2

// int _Sys_GetAPIVer()
// 辅助函数，不应被内联
_Sys_GetAPIVer:
    mov rax, SYS_getAPIVersion
    syscall
    ret

// int Sys_GetAPIVer()
Sys_GetAPIVer:
    static .value -1
    mov rax, [.value]
    rg rax, -1

    call _Sys_GetAPIVer
    // 若syscall成功且满足，rax应大于等于MIN_API_VER
    // 若syscall失败，rax应等于SYS_getAPIVersion，也等于0表示不支持
    mov [.value], rax
    ret

// bool Sys_Check()
Sys_Check:
    call Sys_GetAPIVer
    mov rax, 1
    rge rax, MIN_API_VER
    mov rax, 0
    ret

// void Sys_NanoTimes(Int64 *value)
Sys_NanoTimes:
    mov rax, SYS_nanoTimes
    syscall
    ret
