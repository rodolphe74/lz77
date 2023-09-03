cmake_minimum_required(VERSION 3.0)

project(lz77 LANGUAGES C)

set(CMAKE_C_FLAGS "-Wall -Wpedantic -fsanitize=address")
SET (CMAKE_C_COMPILER "/usr/bin/gcc" CACHE STRING "C compiler" FORCE)

add_executable(lz77 main.c lz77.c)
add_executable(bitfield bitfield.c lz77.c)
add_executable(lzbuffer lzbuffer.c lz77.c)
add_executable(lzfile lzfile.c lz77.c)

install(TARGETS lz77 RUNTIME DESTINATION bin)
