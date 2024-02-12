#!/bin/bash

# Compiler and flags
COMPILER=gcc
FLAGS="-Wall -g -lfl -I/path/to/include/directory"

# Target executable name
EXECUTABLE=polygon

# Source and object files
SOURCES="./main.c ./lex.yy.c"
OBJECTS="${SOURCES//.c/.o}"

# Generate lex.yy.c from lexer.lex
flex ./front_end/lexer.lex

# Compile source files into object files
for src in $SOURCES; do
    obj="${src//.c/.o}"
    $COMPILER $FLAGS -c $src -o $obj
done

# Link object files into the final executable
$COMPILER $FLAGS $OBJECTS -o $EXECUTABLE

# Clean up the build
# rm -f $OBJECTS ./lex.yy.c