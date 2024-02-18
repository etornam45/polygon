#include <stdio.h>

extern int yyparse();

int main() {
    printf("Enter an arithmetic expression: \n");
    yyparse();
    return 0;
}
