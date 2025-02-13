cmake_minimum_required(VERSION 3.26)
project(clang_mc CXX)

set(CMAKE_CXX_STANDARD 20)
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Os -s")

include_directories(src/cpp)
add_executable(clang_mc
        src/cpp/main.cpp
        src/cpp/ClangMc.cpp
        src/cpp/ClangMc.h
        src/cpp/config/Config.h
        src/cpp/config/ArgParser.cpp
        src/cpp/config/ArgParser.h
        src/cpp/utils/StringUtils.h
        src/cpp/utils/Helper.h
)


# Libraries
find_package(LLVM REQUIRED CONFIG)
target_link_libraries(clang_mc PRIVATE LLVM)

find_package(spdlog CONFIG REQUIRED)
target_link_libraries(clang_mc PRIVATE spdlog::spdlog_header_only)
