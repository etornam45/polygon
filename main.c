#include <stdio.h>

extern int yyparse();
extern void prompt();

int main(int argc, char *argv[])
{
    prompt();
    yyparse();
}