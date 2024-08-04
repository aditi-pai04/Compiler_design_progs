%option noyywrap
%{
#include<stdio.h>
int keys=0,ids=0,ops=0;
%}
%%
"int"|"double"|"float"|"char"|"void"|"for"|"while"|"do"|"switch"|"case"|"if"|"else"|"exit"|"return" {printf("Keyword: %s\n",yytext);keys++;}
"&&" | "||" | "<=" | "==" | ">=" {printf("Operator: %s\n",yytext);ops++;}
[\*\/\<\>\!\^\&\|\=] {printf("Operator: %s\n",yytext);ops++;}
[\+\-]{1,2} {
    if (yytext[0]=='+' && yytext[1]=='+') {printf("Operator: %s\n",yytext);ops++;}
    else if (yytext[0]=='-' && yytext[1]=='-') {printf("Operator: %s\n",yytext);ops++;}
    else {printf("Operator: %s\n",yytext);ops++;}
}
[a-zA-Z_][a-zA-Z0-9_]* {printf("Id: %s\n",yytext);ids++;}
[^#] ;
# return 0;
%%

int main() {
    yyin= fopen("input.c", "r");
    yylex();
    printf("Keywords: %d\tIds: %d\tOperators: %d\n", keys, ids, ops);
    return 0;
}
