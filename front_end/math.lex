%{
/* Include any necessary header files */
#include <stdio.h>

%}

/* Define any necessary tokens */
DIGIT [0-9]
LETTER [a-zA-Z]
BINARY_OP [+|-|*|/|%|==|!=|<|>|<=|>=|&&|\|\|]
KEYWORD (if|else|while|for|return|break|continue|fn)
TYPE (int|float|char|void|string)
ID {LETTER}({LETTER}|{DIGIT})*
NUM {DIGIT}+
FLOAT {DIGIT}+\.{DIGIT}+
STRING \"[^\"]*\"
WS [ \t\n\r\f\v]
PUNCTUATION [,.:;(){}]
ASSIGN_OP [=]


%%
{WS} { /* skip whitespace */ }

{TYPE} { printf("TYPE: %s\n", yytext); }

{KEYWORD} { printf("KEYWORD: %s\n", yytext); }

{ID} { printf("ID: %s\n", yytext); }

{NUM} { printf("NUM: %s\n", yytext); }

{FLOAT} { printf("FLOAT: %s\n", yytext); }

{STRING} { printf("STRING: %s\n", yytext); }

{ASSIGN_OP} { printf("ASSIGN_OP: %s\n", yytext); }

{BINARY_OP} { printf("BINARY_OP: %s\n", yytext); }

{PUNCTUATION} { printf("PUNCTUATION: %s\n", yytext); }


. { 
    printf("--------------------\n");
    printf("Unrecognized character: %s\n", yytext); }
%%


/* Additional functions or code snippets */

/* Error handling function */
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s at line %d\n", s, yylineno);
    /* You can include additional error handling logic here */
}

/* Main function (if needed) */
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
    yylex();

    fclose(input_file);
    return 0;
}
