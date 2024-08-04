%{
#include <stdio.h>
#include <stdlib.h>
int cnt = 0;
int yylex(void);
void yyerror(const char *s);
%}

%token FOR IDEN NUM UP UM

%%

S: S I {printf("Matched for loop\n");}
 |
 ; 
 

I: FOR A B { cnt++;  }
 ;

A: '(' E ';' E ';' E ')' 
 ;

E: IDEN Z IDEN
 | IDEN Z NUM
 | IDEN U
 | U IDEN
 | IDEN
 ;

U: UP | UM
 ;
 
Z: '+'|'-'|'=''=' | '>' | '<' | '<''=' | '>''=' | '=''+' | '=''-'|'='|'*'|'/'
 ;


B: '{' B '}' 
 | I 
 | E ';' 
 |
 ;

%%

int main() {
    printf("Enter the snippet:\n");
    yyparse();
    printf("Count of for : %d\n", cnt);
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Invalid: %s\n", s);
    exit(1);
}