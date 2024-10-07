%{
#include<stdio.h>
#include<stdlib.h>
void yyerror();
int yylex(void);
%}
%token NUM ID RET TYPE
%%
S: S I 
|
;
I: TYPE ID '(' PARAMS ')' '{' BODY '}' {printf("This is a function\n");}
;
PARAMS: PARAMS ',' PARAM
| PARAM 
|
;
PARAM: TYPE ID 
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
    printf("Enter the snippet:\n");
    yyparse();
    return 0;
}

void yyerror() {
    printf("Invalid\n");
    exit(0);
}
