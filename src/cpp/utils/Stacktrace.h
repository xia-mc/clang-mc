//
// Created by xia__mc on 2025/2/17.
//

#ifndef CLANG_MC_STACKTRACE_H
#define CLANG_MC_STACKTRACE_H

#include <vector>
#include <string>
#include <thread>

#if defined(__cpp_lib_stacktrace)
#include <stacktrace>
static inline std::vector<std::string> getStacktrace() {
    std::vector<std::string> result;
    for (const auto& frame : std::stacktrace::current()) {
        result.push_back(frame.description());
    }
    return result;
}

#elif defined(__linux__) || defined(__APPLE__)
#include <execinfo.h>
#include <cstdlib>
static inline std::vector<std::string> getStacktrace() {
    std::vector<std::string> result;
    void* callstack[128];
    int frames = backtrace(callstack, 128);
    char** symbols = backtrace_symbols(callstack, frames);
    if (symbols) {
        for (int i = 0; i < frames; ++i) {
            result.emplace_back(symbols[i]);
        }
        free(symbols);
    }
    return result;
}

#elif defined(_WIN32)
#include <windows.h>
#include <dbghelp.h>

static inline std::vector<std::string> getStacktrace() {
    std::vector<std::string> result;
    void *stack[100];
    unsigned short frames;
    SYMBOL_INFO *symbol;
    HANDLE process = GetCurrentProcess();

    SymInitialize(process, NULL, TRUE);
    frames = CaptureStackBackTrace(0, 100, stack, NULL);
    symbol = (SYMBOL_INFO *) calloc(sizeof(SYMBOL_INFO) + 256 * sizeof(char), 1);
    symbol->MaxNameLen = 255;
    symbol->SizeOfStruct = sizeof(SYMBOL_INFO);

    for (int i = 0; i < frames; i++) {
        SymFromAddr(process, (DWORD64) (stack[i]), 0, symbol);
        if (symbol->Address == 0) {
            result.emplace_back(symbol->Name);
        } else {
            result.emplace_back(fmt::format("{}(0x{:x})", symbol->Name, symbol->Address));
        }
    }

    free(symbol);
    return result;
}

#else
static inline std::vector<std::string> getStacktrace() {
    static std::vector<std::string> result = {"No stacktrace support on this platform."};
    return result;
}
#endif

static inline std::string getThreadName() noexcept {
#if defined(__linux__) || defined(__APPLE__)
    #include <pthread.h>
    const auto id = pthread_self();
    char name[16];  // Linux 线程名最多16字节
    if (pthread_getname_np(id, name, sizeof(name)) == 0) {
        return std::string(name);
    }
    return fmt::format("0x{:x}", reinterpret_cast<uintptr_t>(id));

#elif defined(_WIN32)
#include <windows.h>
    const auto id = GetCurrentThread();
    PWSTR name;
    if (GetThreadDescription(id, &name) == S_OK) {
        std::wstring wname(name);
        LocalFree(name);
        return std::string(wname.begin(), wname.end());
    }
    return fmt::format("0x{:x}", reinterpret_cast<uintptr_t>(id));

#else
    return "Unknown";
#endif
}

#endif // CLANG_MC_STACKTRACE_H
