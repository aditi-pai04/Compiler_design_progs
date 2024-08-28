%{
#include<stdio.h>
#include<stdlib.h>
void yyerror();
int yylex(void);
int cnt=0;
%}

%union {
    char *str;
}

%token <str> ID
%token INT FLOAT DOUBLE CHAR NUM COMMA SEMICOLON LBRACKET RBRACKET 
%%
S: declarations 
;
declarations: declarations declaration SEMICOLON {printf("This is a declaration\n");}
| declaration SEMICOLON {printf("This is a declaration\n");}
;
declaration: type varlist
;
type: INT | DOUBLE| CHAR | FLOAT
;
varlist: varlist COMMA var  {cnt++;}
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
    printf("Variables:%d\n",cnt);
    return 0;
}
