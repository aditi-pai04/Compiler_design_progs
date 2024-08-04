%{
#include<stdio.h>
#include<stdlib.h>
void yyerror();
int yylex(void);
int cnt=0;
%}
%token IF NUM ID UP UM
%%
S: I {printf("If statement\n");}
|
;
I: IF A B {cnt++;}
;
A: '(' E ')'
;
E: ID Z ID
| ID Z NUM 
| U ID 
| ID U 
| NUM
;
U: UP | UM;
;
Z: '+'|'-'|'=' '=' | '>' | '<' | '<' '=' | '>' '=' | '+' '='  | '-' '='|'='|'*'|'/'
;
B: '{' B '}'
| E ';' 
| I 
|
;
%%
int main() {
    printf("Enter the snippet:\n");
    yyparse();
    printf("Count of if : %d\n", cnt);
    return 0;
}

void yyerror() {
    printf("Invalid\n");
    exit(0);
}
