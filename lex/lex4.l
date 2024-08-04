%option noyywrap
%{
#include <stdio.h>

int id = 0, op = 0, key = 0;
%}

%%
"void"|"int"|"float"|"double"|"for"|"while"|"do"|"char"|"if"|"else"|"exit"|"return"|"switch"|"case" { printf("Keyword: %s\n", yytext); key++; }
"&&" | "<=" | ">=" | "==" | "||" { printf("Operator: %s\n", yytext); op++; }
[\*\/\^\!\>\<\|\=\&]  { printf("Operator: %s\n", yytext); op++; }
[\+\-]{1,2} { 
    if (yytext[0] == '+' && yytext[1] == '+') { printf("Operator: %s\n", yytext); op++; }
    else if (yytext[0] == '-' && yytext[1] == '-') { printf("Operator: %s\n", yytext); op++; }
    else { printf("Operator: %s\n", yytext); op++; }
}

[a-zA-Z_][a-zA-Z0-9_]* { printf("Id: %s\n", yytext); id++; }
# return 0;
[ \t\n] ; 
. ; 
%%

int main() {
    yyin= fopen("C:/Users/aditi/OneDrive/Desktop/cd_progs/lex/input.c", "r");
    yylex();
    printf("Keywords: %d\tIds: %d\tOperators: %d\n", key, id, op);
    return 0;
}
