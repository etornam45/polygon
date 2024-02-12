%{
#include <stdio.h>
#include <stdlib.h>
#include "lexer.h"
%}

%option noyywrap

    // Token definitions
%{
#define TYPE 1
#define KEYWORD 2
#define ID 3
#define INTEGER 4
#define FLOAT 5
#define STRING 6
#define ASSIGN_OP 7
#define BINARY_OP 8
#define PUNCTUATION 9
%}




    // Regular expressions
_ID [a-zA-Z_][a-zA-Z0-9_]*
_INT [0-9]+
_FLOAT [0-9]+\.[0-9]+
_STRING \"[^\"]*\"
_ASSIGN_OP =
_BINARY_OP [+*-/]
_PUNCTUATION [:;,\(\)\{\}]
_KEYWORD (if|else|while|for|return|break|continue|fn)
_TYPE (int|float|string)

%%

{_TYPE} { 
    yylval.stringValue = strdup(yytext);
    return TYPE; 
}

{_KEYWORD} { 
    yylval.stringValue = strdup(yytext);
    return KEYWORD; 
}

{_ID} { 
    yylval.stringValue = strdup(yytext);
    return ID; 
}

{_INT} { 
    yylval.integerValue = atoi(yytext);
    return INTEGER; 
}

{_FLOAT} { 
    yylval.floatValue = atof(yytext);
    return FLOAT; 
}

{_STRING} { 
    yylval.stringValue = strdup(yytext);
    return STRING; 
}

{_ASSIGN_OP} { 
    yylval.stringValue = strdup(yytext);
    return ASSIGN_OP; 
}

{_BINARY_OP} { 
    yylval.stringValue = strdup(yytext);
    return BINARY_OP; 
}

{_PUNCTUATION} { 
    yylval.stringValue = strdup(yytext);
    return PUNCTUATION; 
}

[ \t\n] ; // Skip whitespace

. { printf("Invalid character: %s\n", yytext); }

%%

    // Flex-generated lexer function
extern int yylex();
extern FILE* yyin;