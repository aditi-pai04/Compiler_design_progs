%{
#include<stdio.h>
#include<stdlib.h>
void yyerror();
int yylex(void);
int c=0;
%}
%token NUM ID KEY SC COMMA LBRAC RBRAC
%%
S: declarations
;
declarations: declarations declaration {printf("This is a declaration\n");}
| declaration {printf("This is a declaration\n");}
;
declaration: KEY varlist SC
;
varlist: varlist COMMA var {c++;}
| var {c++;}
;
var: ID LBRAC NUM RBRAC
| ID
;
%%
int main() {
    printf("Enter input:\n");
    yyparse();
    printf("Count:%d\n",c);
    return 0;
}
void yyerror() {
    printf("Invalid\n");
    exit(0);
}
