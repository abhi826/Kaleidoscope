#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define the build directory
BUILD_DIR="build"

# Create the build directory if it doesn't exist
mkdir -p "$BUILD_DIR"

# Navigate to the build directory
cd "$BUILD_DIR"

# Configure the project with Clang as the compiler
cmake -DCMAKE_CXX_COMPILER=clang++ ..

# Build the project
cmake --build .


