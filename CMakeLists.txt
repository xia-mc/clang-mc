cmake_minimum_required(VERSION 3.26)
project(clang-mc CXX)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_CXX_FLAGS_RELEASE_INIT "-O3 -flto -ffunction-sections -fdata-sections -Wl,--gc-sections")
set(CMAKE_CXX_FLAGS_DEBUG_INIT "-Og -g -Wall -Wextra")

set(CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++ -fuse-ld=lld")
set(CMAKE_LINKER "lld")

if(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -s")
endif()

include_directories(src/cpp)
add_executable(clang-mc
        src/cpp/main.cpp
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
#find_package(LLVM REQUIRED CONFIG)
#llvm_map_components_to_libnames(LLVM_LIBS option support core)
#target_link_libraries(clang-mc PRIVATE ${LLVM_LIBS})

find_package(fmt CONFIG REQUIRED)
target_link_libraries(clang-mc PRIVATE fmt::fmt)

find_package(spdlog CONFIG REQUIRED)
target_link_libraries(clang-mc PRIVATE spdlog::spdlog_header_only)

if (WIN32)
    target_link_libraries(clang-mc PRIVATE dbghelp)
endif()
