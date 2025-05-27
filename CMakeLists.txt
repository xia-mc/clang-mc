cmake_minimum_required(VERSION 3.26)
project(clang-mc C CXX)
set(DEBUG_MODE OFF)
set(VCPKG_DIR "C:/Users/Administrator/.vcpkg-clion/vcpkg")

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_compile_options(-Wall -Wextra -Werror -Wunknown-pragmas)

set(CMAKE_C_FLAGS_DEBUG "-O0 -g")
if (DEBUG_MODE)
    set(CMAKE_C_FLAGS_RELEASE ${CMAKE_C_FLAGS_DEBUG})
else ()
    set(CMAKE_C_FLAGS_RELEASE "-O3 -flto -ffunction-sections -fdata-sections -DNDEBUG")
endif ()
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG}")
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")

if (NOT WIN32)
    set(CMAKE_EXE_LINKER_FLAGS "-Wl,-static-libgcc -Wl,-static-libstdc++")
endif ()

if (CMAKE_BUILD_TYPE STREQUAL "Release" AND NOT DEBUG_MODE)
    if (WIN32)
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,/OPT:REF -Wl,/OPT:ICF")
    else ()
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--gc-sections -Wl,-s")
    endif ()
endif ()

include_directories(src/cpp)
add_executable(clang-mc
        src/cpp/Main.cpp
        src/cpp/ClangMc.cpp
        src/cpp/ClangMc.h
        src/cpp/config/Config.h
        src/cpp/config/ArgParser.cpp
        src/cpp/config/ArgParser.h
        src/cpp/utils/string/StringUtils.h
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
        src/cpp/ir/ops/Label.h
        src/cpp/utils/FileUtils.h
        src/cpp/utils/CLIUtils.h
        src/cpp/Start.c
        src/cpp/Main.h
        src/cpp/i18n/I18n.h
        src/cpp/i18n/I18n.cpp
        src/cpp/objects/NameGenerator.h
        src/cpp/objects/include/UnorderedDense.h
        src/cpp/ir/ops/Ret.h
        src/cpp/ir/verify/Verifier.cpp
        src/cpp/ir/verify/Verifier.h
        src/cpp/ir/ops/Jmp.h
        src/cpp/ir/ops/Call.h
        src/cpp/ir/verify/Verifier.cpp
        src/cpp/ir/ops/JmpLike.h
        src/cpp/ir/verify/VerifyResult.h
        src/cpp/i18n/LogFormatter.h
        src/cpp/ir/ops/Add.h
        src/cpp/ir/values/Ptr.h
        src/cpp/ir/ops/OpCommon.cpp
        src/cpp/utils/Native.c
        src/cpp/utils/Native.h
        src/cpp/ir/ops/Inline.h
        src/cpp/ir/ops/Push.h
        src/cpp/ir/ops/Pop.h
        src/cpp/ir/ops/Peek.h
        src/cpp/ir/ops/Je.h
        src/cpp/ir/ops/CmpLike.h
        src/cpp/utils/string/StringBuilder.h
        src/cpp/ir/ops/Nop.h
        src/cpp/builder/Builder.cpp
        src/cpp/builder/Builder.h
        src/cpp/llvm/LlvmMachine.cpp
        src/cpp/llvm/LlvmMachine.h
        src/cpp/ir/controlFlow/JmpTable.cpp
        src/cpp/ir/controlFlow/JmpTable.h
        src/cpp/ir/ops/Jl.h
        src/cpp/builder/PostOptimizer.cpp
        src/cpp/builder/PostOptimizer.h
        src/cpp/ir/ops/Sub.h
        src/cpp/utils/CLIUtils.cpp
        src/cpp/ir/ops/Jg.h
        src/cpp/ir/ops/Jge.h
        src/cpp/ir/ops/Mul.h
        src/cpp/ir/ops/CallLike.h
        src/cpp/extern/ResourceManager.h
        src/cpp/parse/ParseManager.cpp
        src/cpp/parse/ParseManager.h
        src/cpp/extern/PreProcessorAPI.h
        src/cpp/extern/ClRustAPI.h
        src/cpp/patches/fmt/core.h
        src/cpp/ir/ops/Jne.h
        src/cpp/objects/Int.h
        src/cpp/ir/ops/Syscall.h
        src/cpp/ir/ops/Jle.h
        src/cpp/objects/MatrixStack.h
        src/cpp/objects/MatrixStack.h
)


# i18n
foreach (LANG IN ITEMS ZH_CN EN_US)
    file(READ ${CMAKE_SOURCE_DIR}/src/resources/lang/${LANG}.yaml YAML_${LANG})
    string(REPLACE "\"" "\\\"" YAML_${LANG} "${YAML_${LANG}}")
    string(REPLACE "\n" "\\n\"\n\"" YAML_${LANG} "${YAML_${LANG}}")
endforeach ()

configure_file(
        ${CMAKE_SOURCE_DIR}/src/cpp/i18n/I18nTemplate.h
        ${CMAKE_BINARY_DIR}/generated/GeneratedI18n.h
        @ONLY
)
add_compile_definitions(GENERATED_SETUP)
include_directories(${CMAKE_BINARY_DIR}/generated)


# Components
if (DEBUG_MODE)
    add_custom_command(
            TARGET clang-mc
            PRE_LINK
            COMMAND cargo build
            COMMENT "Building rust components"
    )
    set(RUST_COMPONENT_DIR "${CMAKE_BINARY_DIR}/rust/debug")
else ()
    add_custom_command(
            TARGET clang-mc
            PRE_LINK
            COMMAND cargo build -r
            COMMENT "Building rust components"
    )
    set(RUST_COMPONENT_DIR "${CMAKE_BINARY_DIR}/rust/release")
endif ()
set(RUST_COMPONENT_NAME "clang_mc_rust")
if (WIN32)
    set(RUST_COMPONENT_NAME "${RUST_COMPONENT_NAME}.lib")
else ()
    set(RUST_COMPONENT_NAME "${RUST_COMPONENT_NAME}.a")
endif ()
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${RUST_COMPONENT_DIR}/${RUST_COMPONENT_NAME}")


# Building
add_definitions(-D_CRT_SECURE_NO_WARNINGS)
set_target_properties(clang-mc PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/build/bin"
)
add_custom_command(
        TARGET clang-mc
        POST_BUILD
        COMMAND python
        ${CMAKE_SOURCE_DIR}/src/python/build_assets.py
        COMMENT "Post building"
)


# Compatibility
if (EXISTS "C:/LLVM/lib/cmake/llvm/LLVMConfig.cmake")
    set(LLVM_DIR "C:/LLVM/lib/cmake/llvm")
endif ()
if (EXISTS "${VCPKG_DIR}/installed/x64-windows-static/share/fmt/fmt-config.cmake")
    set(fmt_DIR "${VCPKG_DIR}/installed/x64-windows-static/share/fmt")
endif ()
if (EXISTS "${VCPKG_DIR}/packages/spdlog_x64-windows-static/share/spdlog/spdlogConfig.cmake")
    set(spdlog_DIR "${VCPKG_DIR}/packages/spdlog_x64-windows-static/share/spdlog")
    set(spdlog_INCLUDE_DIR "${VCPKG_DIR}/packages/spdlog_x64-windows-static/include")
endif ()
if (EXISTS "${VCPKG_DIR}/installed/x64-windows-static/share/yaml-cpp/yaml-cpp-config.cmake")
    set(yaml-cpp_DIR "${VCPKG_DIR}/installed/x64-windows-static/share/yaml-cpp")
endif ()
if (EXISTS "${VCPKG_DIR}/installed/x64-windows-static/share/libzip/libzip-config.cmake")
    set(libzip_DIR "${VCPKG_DIR}/installed/x64-windows-static/share/libzip")
endif ()
if (EXISTS "${VCPKG_DIR}/packages/nlohmann-json_x64-windows-static/share/nlohmann_json/nlohmann_jsonConfig.cmake")
    set(nlohmann_json_DIR "${VCPKG_DIR}/packages/nlohmann-json_x64-windows-static/share/nlohmann_json")
endif ()
include_directories(${CMAKE_SOURCE_DIR}/src/cpp/patches)


# Libraries
set(CMC_CLANG_LIBS libclang clangDriver clangFrontend clangFrontendTool clangCodeGen clangParse
        clangSema clangAST clangLex clangBasic)
set(CMC_IR_COMPONENTS core support bitreader bitwriter irreader analysis transformutils)
set(CMC_OPTIMIZE_COMPONENTS passes scalaropts vectorize ipo lto)
set(CMC_TARGET_COMPONENTS target mc mcparser codegen selectiondag globalisel asmprinter
        asmparser mirparser runtimedyld)
set(CMC_LLVM_COMPONENTS "")
list(APPEND CMC_LLVM_COMPONENTS ${CMC_IR_COMPONENTS})
list(APPEND CMC_LLVM_COMPONENTS ${CMC_OPTIMIZE_COMPONENTS})
list(APPEND CMC_LLVM_COMPONENTS ${CMC_TARGET_COMPONENTS})

find_package(LLVM CONFIG REQUIRED)
include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})
add_definitions(-D_ITERATOR_DEBUG_LEVEL=0)
llvm_map_components_to_libnames(LLVM_LIBS ${CMC_LLVM_COMPONENTS})
list(APPEND LLVM_LIBS ${CLANG_LIBS})
target_link_libraries(clang-mc PRIVATE ${LLVM_LIBS})

find_package(fmt CONFIG REQUIRED)
add_compile_definitions(FMT_HEADER_ONLY)
target_link_libraries(clang-mc PRIVATE fmt::fmt)

find_package(spdlog CONFIG REQUIRED)
include_directories(${spdlog_INCLUDE_DIR})
#target_link_libraries(clang-mc PRIVATE spdlog::spdlog_header_only)

find_package(nlohmann_json CONFIG REQUIRED)
target_link_libraries(clang-mc PRIVATE nlohmann_json::nlohmann_json)

if (WIN32)
    target_link_libraries(clang-mc PRIVATE dbghelp)
    target_link_libraries(clang-mc PRIVATE Userenv)
endif ()

find_package(yaml-cpp CONFIG REQUIRED)
target_link_libraries(clang-mc PRIVATE yaml-cpp::yaml-cpp)

find_package(libzip CONFIG REQUIRED)
target_link_libraries(clang-mc PRIVATE libzip::zip)
