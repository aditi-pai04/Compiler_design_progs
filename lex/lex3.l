%option noyywrap
%{
#include<stdio.h>
int single=0,mline=0;
%}
%%
"//"[^\n#]* single++;
"/*"[^#]*"*/" {
    for (int i=0;i<yyleng;i++) {
        if(yytext[i]=='\n') mline++;
    }
}
[^\n#] {fprintf(yyout,"%s",yytext);}
\n {fprintf(yyout,"\n");}
# return 0;
%%
int main() {
    yyout=fopen("output.c","w");
    yyin=fopen("input.c","r");
    yylex();
    printf("Single:%d\tMulti:%d\n",single,mline);
    return 0;
}

