# Compiler and flags
COMPILER = gcc
FLAGS =  -g -lfl -I./headers

# Target executable name
EXECUTABLE = polygon

# Source and object files
SOURCES = ./main.c ./lex.yy.c
OBJECTS = $(SOURCES:.c=.o)
FROND_END = ./frontend

# Default target
default: $(EXECUTABLE)

# Rule to generate lex.yy.c from lexer.lex
./lex.yy.c: $(FROND_END)/lexer.lex
	flex $(FROND_END)/lexer.lex

# Rule to compile source files into object files
%.o: %.c
	$(COMPILER) $(FLAGS) -c $< -o $@

# Rule to link object files into the final executable
$(EXECUTABLE): $(OBJECTS)
	$(COMPILER) $(FLAGS) $^ -o $@
	rm -f $(OBJECTS)

run:
	./$(EXECUTABLE) ./test/polygon.sample
# Rule to clean up the build
clean:
	rm -f $(OBJECTS) $(EXECUTABLE) ./lex.yy.c