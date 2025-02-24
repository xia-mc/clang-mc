//
// Created by xia__mc on 2025/2/24.
//

#include "Native.h"
#include "stdio.h"
#include "stdlib.h"
#include "inttypes.h"

static const char *const OOM_MSG = "\033[31mfatal error:\033[97m out of memory\n\033[31m致命错误:\033[97m 内存已耗尽";
static void *EMERGENCY_MEMORY = NULL;

void initNative() {
    EMERGENCY_MEMORY = malloc(128);
}

void onOOM() {
    free(EMERGENCY_MEMORY);
    EMERGENCY_MEMORY = NULL;

    fprintf(stderr, "%s\n", OOM_MSG);
    fflush(stderr);
    _exit(1);
}

#if defined(_WIN32)

#include <windows.h>
#include <DbgHelp.h>
#include <string.h>

__forceinline void printStackTrace() {
    HANDLE process = GetCurrentProcess();
    HANDLE thread = GetCurrentThread();

    CONTEXT context;
    RtlCaptureContext(&context);  // 获取当前CPU上下文

    // 初始化调试帮助库
    SymInitialize(process, NULL, TRUE);

    STACKFRAME64 stackFrame;
    memset(&stackFrame, 0, sizeof(STACKFRAME64));

    DWORD machineType;
#ifdef _M_IX86
    machineType = IMAGE_FILE_MACHINE_I386;
    stackFrame.AddrPC.Offset = context.Eip;
    stackFrame.AddrPC.Mode = AddrModeFlat;
    stackFrame.AddrFrame.Offset = context.Ebp;
    stackFrame.AddrFrame.Mode = AddrModeFlat;
    stackFrame.AddrStack.Offset = context.Esp;
    stackFrame.AddrStack.Mode = AddrModeFlat;
#elif _M_X64
    machineType = IMAGE_FILE_MACHINE_AMD64;
    stackFrame.AddrPC.Offset = context.Rip;
    stackFrame.AddrPC.Mode = AddrModeFlat;
    stackFrame.AddrFrame.Offset = context.Rbp;
    stackFrame.AddrFrame.Mode = AddrModeFlat;
    stackFrame.AddrStack.Offset = context.Rsp;
    stackFrame.AddrStack.Mode = AddrModeFlat;
#endif

    fprintf(stderr, "Exception in thread \"0x%" PRIxPTR "\" with an unknown exception.\n", (uintptr_t) thread);

    size_t unknownCount = 0;
    while (StackWalk64(machineType, process, thread, &stackFrame, &context, NULL, SymFunctionTableAccess64,
                       SymGetModuleBase64, NULL)) {
        DWORD64 address = stackFrame.AddrPC.Offset;
        if (address == 0) break;

        // 获取函数名
        char symbolBuffer[sizeof(SYMBOL_INFO) + MAX_SYM_NAME * sizeof(TCHAR)];
        SYMBOL_INFO *symbol = (SYMBOL_INFO *) symbolBuffer;
        symbol->SizeOfStruct = sizeof(SYMBOL_INFO);
        symbol->MaxNameLen = MAX_SYM_NAME;

        if (SymFromAddr(process, address, NULL, symbol)) {
            if (unknownCount > 0) {
                unknownCount = 0;
                fprintf(stderr, "        Suppressed %zu unknown stack traces.\n", unknownCount);
            }
            fprintf(stderr, "        at %s", symbol->Name);
        } else {
            unknownCount++;
            continue;
        }

        // 获取文件名和行号
        IMAGEHLP_LINE64 line;
        DWORD displacement;
        memset(&line, 0, sizeof(IMAGEHLP_LINE64));
        line.SizeOfStruct = sizeof(IMAGEHLP_LINE64);

        if (SymGetLineFromAddr64(process, address, &displacement, &line)) {
            fprintf(stderr, "(0x%" PRIxPTR ") (%s:%lu)\n", line.Address, line.FileName, line.LineNumber);
        } else {
            fprintf(stderr, "(Unknown Source)\n");
        }
    }

    SymCleanup(process);
}

void onTerminate() {
    printStackTrace();
}
#else
void onTerminate() {
}
#endif
