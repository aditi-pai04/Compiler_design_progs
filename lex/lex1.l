%option noyywrap
%{
#include<stdio.h>
int line=0,words=0,spaces=0,digits=0,chars=0;
%}
%%
\n {line++;}
\t {spaces+=4;}
[ ] {spaces+=1;}
[^ \n\t#]+ {chars+=yyleng; words++;}
# return 0;
%%
int main( ) {
    printf("Enter string:\n");
    yylex();
    printf("Lines:%d\tWords:%d\tChars:%d\tSpaces:%d\tDigits:%d\n",line,words,chars,spaces,digits);
    return 0;
}