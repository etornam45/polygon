typedef struct {
    int integerValue;
    char *stringValue;
    float floatValue; // Corrected the type from int to float
} YYSTYPE;

extern YYSTYPE yylval;