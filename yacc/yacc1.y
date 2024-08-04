%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(const char *s);
    int yylex(void);
%}
%%
S:A B
;
A:'a' A 'b'
| 
;
B: 'b' B 'c'
| 
;
%%
int main() {
    printf("Enter string:\n");
    yyparse();
    printf("Valid string!\n");
    return 0;
}
void yyerror(const char *s) {
    printf("invalid string\n");
    exit(0);
}