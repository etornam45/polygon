%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();

void yyerror(const char *msg)
{
    fprintf(stderr, "error: %s\n", msg);
}

int yywrap() { return 1; }

void prompt() { printf("expr > "); }


%}

%token NUMBER
%token ADD SUB MUL DIV
%token EOL SPACE EXIT

%%
calculation:
| calculation line { prompt(); }
;

line: EOL
| exp EOL  { printf("%d\n", $1); }
| EXIT EOL { printf("bye! \n"); exit(0); }
;

exp: factor        { $$ = $1; }
| exp ADD factor   { $$ = $1 + $3; }
| exp SUB factor   { $$ = $1 - $3; }
;

factor: term       { $$ = $1; }
| factor MUL term  { $$ = $1 * $3; }
| factor DIV term  { $$ = $1 / $3; }
;


term: NUMBER { $$ = $1; }
;

%%