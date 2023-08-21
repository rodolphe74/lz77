cmake_minimum_required(VERSION 3.0)

project(lz77 LANGUAGES C)


add_executable(lz77 main.c lz77.c)
add_executable(bitfield bitfield.c lz77.c)
add_executable(lzbuffer lzbuffer.c lz77.c)
add_executable(lzfile lzfile.c lz77.c)

install(TARGETS lz77 RUNTIME DESTINATION bin)
