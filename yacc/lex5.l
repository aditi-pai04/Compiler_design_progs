%option noyywrap
%{
#include "y.tab.h"
%}
%%
"int"|"float"|"char"|"double" return KEY;
[0-9]+ return NUM;
[a-zA-Z_][a-zA-Z0-9_]* return ID;
"," return COMMA;
";" return SC;
"[" return LBRAC;
"]" return RBRAC;
# return 0;
[\t \n]+ ;
. return yytext[0];
