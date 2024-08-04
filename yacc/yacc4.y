%{
#include<stdio.h>
#include<stdlib.h>
void yyerror();
int cnt=0;
int yylex(void);
extern *yyin;
%}
%token IF IDEN NUM UP UM
%%
S:I
;
I:IF A B    {cnt++;}
;
A:'('E')'
;
E:IDEN Z IDEN
|IDEN Z NUM
|IDEN U
|IDEN
;
Z:'='|'<'|'>'|'<''='|'>''='|'+''='|'-''='| '=''='| '+' |'-'|'*'|'/'
;
U:UM|UP
;
B:B B
|'{'B'}'
|I
|E';'
|
;
%%
int main()
{   //yyin=fopen("C:/Users/aditi/OneDrive/Desktop/cd_progs/lex/input.c", "r");
    printf("Enter the snippet:\n");
    yyparse();
    printf("Count of if is %d\n",cnt);
    return 0;
}
void yyerror()
{
    printf("Invalid\n");
    exit(0);
}