%option noyywrap
%{
#include<stdio.h>
int pi=0,ni=0,pf=0,nf=0;
%}
num [0-9]+
posint \+?{num}
negint -{num}
posnum \+?{num}?\.\+?{num}?
negnum -{num}?\.{num}?
%%
{posint} {pi++;}
{negint} {ni++;}
{posnum} {pf++;}
{negnum} {nf++;}
{posint}\/{posint} {pf++;}
{negint}\/{negint} {pf++;}
{posnum}\/{posnum} {pf++;}
{negnum}\/{negnum} {pf++;}

{negint}\/{posint} {nf++;}
{posint}\/{negint} {nf++;}
{negnum}\/{posnum} {nf++;}
{posnum}\/{negnum} {nf++;}
# return 0;
%%
int main() {
    printf("Enter list of numbers:\n");
    yylex();
    printf("Pi:%d\tNi:%d\tPf:%d\tNf:%d\n",pi,ni,pf,nf);
    return 0;
}


