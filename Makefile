# Compiler and flags
COMPILER = gcc
FLAGS =  

# Target executable name
EXECUTABLE = polygon

# Source and object files
SOURCES = ./main.c ./lex.yy.c ./parser.tab.c
OBJECTS = $(SOURCES:.c=.o)
FROND_END = ./frontend


run:
	flex $(FROND_END)/lexer.lex
	bison -d $(FROND_END)/parser.y
	$(COMPILER) $(SOURCES) -o $(EXECUTABLE)

exec:
	./$(EXECUTABLE) ./test/math.m

clean:
	rm -f $(EXECUTABLE) ./lex.yy.c ./parser.tab.c ./parser.tab.h