cmake_minimum_required(VERSION 3.16)
project(ToyCompiler)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add the source file
add_executable(toy toy.cpp)

# Set compile options for debugging and optimization
target_compile_options(toy PRIVATE -g -O3)

