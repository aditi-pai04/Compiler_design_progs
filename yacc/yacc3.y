%{
#include<stdio.h>
#include<stdlib.h>
void yyerror();
int yylex(void);
int cnt=0;
%}
%token FOR NUM ID UP UM
%%
S: S I {printf("Matched for loop\n");}
|
;
I: FOR A B {cnt++;}
;
A: '(' E ';' E ';' E ')'
;
E: ID Z ID
| ID Z NUM 
| U ID 
| ID U 
| NUM
;
U: UP | UM;
;
Z: '+'|'-'|'=' '=' | '>' | '<' | '<' '=' | '>' '=' | '=' '+' | '=' '-'|'='|'*'|'/'
;
B: B B 
| '{' B '}'
| E ';' 
| I 
|
;
%%
int main() {
    printf("Enter the snippet:\n");
    yyparse();
    printf("Count of for : %d\n", cnt);
    return 0;
}

void yyerror() {
    printf("Invalid:\n");
    exit(0);
}
