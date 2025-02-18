cmake_minimum_required(VERSION 3.26)
project(clang-mc C CXX)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_compile_options(-Wall -Wextra -Werror -Wunknown-pragmas)

set(CMAKE_C_FLAGS_RELEASE "-O3 -flto -ffunction-sections -fdata-sections -DNDEBUG")
set(CMAKE_C_FLAGS_DEBUG "-Og -g")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}")
set(CMAKE_CXX_FLAGS_DEBUG  "${CMAKE_C_FLAGS_DEBUG}")

if (NOT WIN32)
    set(CMAKE_EXE_LINKER_FLAGS "-Wl,-static-libgcc -Wl,-static-libstdc++")
endif ()

if(CMAKE_BUILD_TYPE STREQUAL "Release")
    if (WIN32)
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,/OPT:REF -Wl,/OPT:ICF")
    else ()
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--gc-sections -Wl,-s")
    endif ()
endif()

include_directories(src/cpp)
add_executable(clang-mc
        src/cpp/Main.cpp
        src/cpp/ClangMc.cpp
        src/cpp/ClangMc.h
        src/cpp/config/Config.h
        src/cpp/config/ArgParser.cpp
        src/cpp/config/ArgParser.h
        src/cpp/utils/StringUtils.h
        src/cpp/utils/Common.h
        src/cpp/ir/ops/Op.h
        src/cpp/ir/IR.cpp
        src/cpp/ir/IR.h
        src/cpp/ir/values/Value.h
        src/cpp/ir/values/Immediate.h
        src/cpp/ir/values/Register.h
        src/cpp/ir/ops/Mov.h
        src/cpp/ir/ops/OpCommon.h
        src/cpp/ir/IRCommon.h
        src/cpp/ir/IRCommon.cpp
        src/cpp/utils/Stacktrace.h
        src/cpp/ir/ops/Label.h
        src/cpp/utils/FileUtils.h
        src/cpp/utils/OOMHandler.h
        src/cpp/utils/CLIUtils.h
        src/cpp/Start.c
        src/cpp/Main.h
)


# Compatibility
if (EXISTS "C:/LLVM/lib/cmake/llvm/LLVMConfig.cmake")
    set(LLVM_DIR "C:/LLVM/lib/cmake/llvm")
endif ()
if (EXISTS "C:/Users/Administrator/.vcpkg-clion/vcpkg/packages/fmt_x64-mingw-static/share/fmt/fmt-config.cmake")
    set(fmt_DIR "C:/Users/Administrator/.vcpkg-clion/vcpkg/packages/fmt_x64-mingw-static/share/fmt")
endif ()
if (EXISTS "C:/Users/Administrator/.vcpkg-clion/vcpkg/packages/spdlog_x64-mingw-static/share/spdlog/spdlogConfig.cmake")
    set(spdlog_DIR "C:/Users/Administrator/.vcpkg-clion/vcpkg/packages/spdlog_x64-mingw-static/share/spdlog")
endif ()


# Libraries
#find_package(LLVM CONFIG REQUIRED)
#llvm_map_components_to_libnames(LLVM_LIBS option support core)
#target_link_libraries(clang-mc PRIVATE ${LLVM_LIBS})

find_package(fmt CONFIG REQUIRED)
add_compile_definitions(FMT_HEADER_ONLY)
target_link_libraries(clang-mc PRIVATE fmt::fmt)

find_package(spdlog CONFIG REQUIRED)
target_link_libraries(clang-mc PRIVATE spdlog::spdlog_header_only)

if (WIN32)
    target_link_libraries(clang-mc PRIVATE dbghelp)
endif()
