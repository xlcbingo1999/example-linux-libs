cmake_minimum_required(VERSION 3.27)

project(example_linux_libs)
include(CheckPIESupported)
check_pie_supported()

option(USE_STATIC "Use STATIC" OFF)
if(USE_STATIC)
    set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
    set(BUILD_SHARED_LIBS OFF)
    set(CMAKE_EXE_LINKER_FLAGS "-static")
    add_library(hello STATIC hello.c hello.h)
    target_include_directories(hello PUBLIC ./)
    target_link_libraries(hello PRIVATE libm.a libc.a) # 需要显式链接静态库

    add_executable(main main.c)
    target_link_libraries(main PUBLIC hello "-static") # 这个应该是静态库才对吧
else()
    set(BUILD_SHARED_LIBS ON)
    add_library(hello SHARED hello.c hello.h)
    target_include_directories(hello PUBLIC ./)
    target_link_libraries(hello PUBLIC libm.so) # 需要显式链接动态库
    add_executable(main main.c)
    target_link_libraries(main PUBLIC hello) # 这个应该是静态库才对吧
endif()

# https://cmake.org/cmake/help/latest/policy/CMP0083.html 
set_property(TARGET main PROPERTY POSITION_INDEPENDENT_CODE FALSE)

set(CMAKE_C_FLAGS "${CMAKE_CXX_FLAGS} -Wall -g")

