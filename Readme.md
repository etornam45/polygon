# Polygon Programming Language

This repository contains the source code for Polygon, a new programming language designed for simplicity and ease of use.

## Repository Structure

Here's a brief overview of the key files and directories in this repository:

- `./main.c`: The main entry point for the compiler/interpreter. This file contains the main function which opens the input file, calls the lexer function `yylex()`, and handles the tokens returned by the lexer.
- `./frontend/lexer.lex`: The Flex lexer specification for our language. This file defines the regular expressions for the tokens of our language and the actions to be performed when these tokens are recognized.
- `./headers/lexer.h`: This header file contains the definition of the `YYSTYPE` union which is used to store the values of the tokens recognized by the lexer.
- `./Makefile`: A Makefile for building the compiler/interpreter. This file contains rules for generating `lex.yy.c` from `lexer.lex`, compiling the source files into object files, linking the object files into the final executable, and cleaning up the build.
- `./test/polygon.sample`: A sample program written in our language. This file can be used to test the lexer.
- `./.gitignore`: This file specifies the files and directories that Git should ignore.

## Building

To build the compiler/interpreter, run the following command in your terminal:

```bash
$ make

$ make run #to run the built files

$ make clean # to clean all generated binary files 
```