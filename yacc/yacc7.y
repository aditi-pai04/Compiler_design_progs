%{
#include<stdio.h>
#include<stdlib.h>
void yyerror();
int yylex(void);
extern FILE *yyin;
%}
%token TYPE ID NUM RET
%%
S: S I {printf("This is a function\n");}
|
;
I: TYPE ID '(' PARAM ')' '{' BODY '}'
;
PARAM: PARAM ',' PARAM
| TYPE ID 
|
;
BODY: BODY BODY
| PARAM ';'
| E ';'
| RET E ';'
| 
;
E: E '+' E 
| E '-' E 
| E '*' E 
| E '/' E
| ID '=' E 
| NUM
| ID 
;
%%
int main() {
    printf("Enter input:\n");
    yyparse();
    return 0;
}
void yyerror() {
    printf("Invalid\n");
    exit(0);
}
