//
// Created by xia__mc on 2025/2/18.
//

#include "Main.h"

#ifdef _WIN32

#include <windows.h>

#define bool BOOLEAN
#define true TRUE
#define false FALSE

static __forceinline bool isVCRuntimeAvailable() {
    HMODULE runtime = LoadLibraryA("MSVCP140.dll");
    if (runtime == NULL)
        return false;
    FreeLibrary(runtime);

    runtime = LoadLibraryA("VCRUNTIME140.dll");
    if (runtime == NULL)
        return false;
    FreeLibrary(runtime);

    return true;
}

#endif

int main(const int argc, const char *argv[]) {
#ifdef _WIN32
    volatile bool envReady = isVCRuntimeAvailable();

    if (envReady) {
        return init(argc, argv);
    } else {
        MessageBoxA(NULL,
                    "Microsoft Visual C++ Runtime is missing!\n\n"
                    "Please install the latest VC++ runtime from:\n"
                    "https://aka.ms/vs/17/release/vc_redist.x64.exe\n\n"
                    "After installation, restart the program.",
                    "Error: Missing Runtime",
                    MB_ICONERROR | MB_OK);
        return 1;
    }
#else
    return init(argc, argv);
#endif
}
