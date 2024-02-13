%{
#include <stdio.h>
#include <stdlib.h>
#include "lexer.h"
%}

%option noyywrap




    // Regular expressions
_ID [a-zA-Z_][a-zA-Z0-9_]*
_INT [0-9]+
_FLOAT [0-9]+\.[0-9]+
_STRING \"[^\"]*\"
_ASSIGN_OP =
_ARITHMETIC_OP [\+\-\*\/]
_COMPARISON_OP (==|!=|<=|>=|<|>)
_LOGICAL_OP (and|or|not)
_PUNCTUATION [:;,.\(\)\{\}\[\]]
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

{_PUNCTUATION} { 
    yylval.stringValue = strdup(yytext);
    return PUNCTUATION; 
}

{_ASSIGN_OP} { 
    yylval.stringValue = strdup(yytext);
    return ASSIGN_OP; 
}

{_LOGICAL_OP} {
    yylval.stringValue = strdup(yytext);
    return LOGICAL_OP;
}

{_COMPARISON_OP} {
    yylval.stringValue = strdup(yytext);
    return COMPARISON_OP;
}

{_ARITHMETIC_OP} { 
    yylval.stringValue = strdup(yytext);
    return ARITHMETIC_OP; 
}

[ \t\n] ; // Skip whitespace

. { 
    printf("_________________________________\n");
    printf("Invalid character: %s\n", yytext); 
    printf("_________________________________\n");
}

%%

    // Flex-generated lexer function
extern int yylex();
extern FILE* yyin;