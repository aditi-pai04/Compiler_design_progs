%{
#include<stdio.h>
void yyerror();
int yylex(void);
%}
%%
S: A B {printf("Accepted\n");}
;
A: 'a' A 'b' 
| 
;
B: 'b' B 'c' 
| 
;
%%
int main() {
    printf("Enter string:\n");
    yyparse();
    return 0;
}
void yyerror() {
    printf("Invalid\n");
    exit(0);
}