%{
#include<stdio.h>
#include<stdlib.h>
void yyerror();
int yylex(void);
%}
%token NUM ID RET TYPE VOID
%%
S: S I 
|
;
I: TYPE ID '(' PARAMS ')' '{' BODY RET E ';' '}' {printf("This is a function\n");}
| VOID ID '(' PARAMS ')' '{' BODY '}' {printf("This is a function\n");}
| TYPE ID '(' PARAMS ')' RET E ';' {printf("This is a function\n");}
| VOID ID '(' PARAMS ')' ';' {printf("This is a function\n");}
| VOID ID '(' PARAMS ')' RET ';' {printf("This is a function\n");}
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
