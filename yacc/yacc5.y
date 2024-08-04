%{
#include<stdio.h>
#include<stdio.h>
#include<stdlib.h>
void yyerror();
int yylex(void);
int cnt=0;
%}

%union {
    char *str;
}

%token <str> IDENTIFIER
%token INT FLOAT DOUBLE CHAR NUM COMMA SEMICOLON LBRACKET RBRACKET ID 
%%
S: declarations {printf("This is a declaration\n");}
;
declarations: declarations declaration SEMICOLON
| declaration SEMICOLON {cnt++;}
;
declaration: type varlist
;
type: INT | DOUBLE| CHAR | FLOAT
;
varlist: varlist COMMA var {cnt++;}
| var {cnt++;}
;
var: ID LBRACKET NUM RBRACKET
| ID
;
%%

void yyerror() {
    printf("Invalid\n");
}

int main() {
    yyparse();
    printf("Variables:%d\n",cnt-1);
    return 0;
}

