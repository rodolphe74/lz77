cmake_minimum_required(VERSION 3.0)

project(lz77 LANGUAGES C)


add_executable(lz77 main.c lz77.c)
# add_compile_definitions(COMPILER_IS_CMOC=0)

install(TARGETS lz77 RUNTIME DESTINATION bin)
