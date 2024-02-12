#include <stdio.h>
#include <stdlib.h>
#include "./front_end/lexer.h"

// Token definitions
#define TYPE 1
#define KEYWORD 2
#define ID 3
#define INTEGER 4
#define FLOAT 5
#define STRING 6
#define ASSIGN_OP 7
#define BINARY_OP 8
#define PUNCTUATION 9


// Flex-generated lexer function
extern int yylex();
extern FILE* yyin;

// yylval variable to store token values
YYSTYPE yylval;

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening file");
        return 1;
    }

    yyin = input_file;

    int token;
    while ((token = yylex())) {
        switch (token) {
            case TYPE:
                printf("TYPE\n", yylval.stringValue);
                break;
            case KEYWORD:
                printf("KEYWORD\n", yylval.stringValue);
                break;
            case ID:
                printf("ID\n", yylval.stringValue);
                break;
            case INTEGER:
                printf("INTEGER: %d\n", yylval.integerValue);
                break;
            case FLOAT:
                printf("FLOAT: %f\n", yylval.floatValue); // Corrected the format specifier
                break;
            case STRING:
                printf("STRING: %s\n", yylval.stringValue);
                free(yylval.stringValue);
                break;
            case ASSIGN_OP:
                printf("ASSIGN_OP\n", yylval.stringValue);
                break;
            case BINARY_OP:
                printf("BINARY_OP\n", yylval.stringValue);
                break;
            case PUNCTUATION:
                printf("PUNCTUATION\n", yylval.stringValue);
                break;
            default:
                printf("Unknown token\n");
                break;
        }
    }

    fclose(input_file);
    return 0;
}
