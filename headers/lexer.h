
#define TYPE 1
#define KEYWORD 2
#define ID 3
#define INTEGER 4
#define FLOAT 5
#define STRING 6
#define ASSIGN_OP 7
#define ARITHMETIC_OP 8
#define PUNCTUATION 9
#define LOGICAL_OP 10
#define COMPARISON_OP 11


typedef struct {
    int integerValue;
    char *stringValue;
    float floatValue; // Corrected the type from int to float
} YYSTYPE;

extern YYSTYPE yylval;
