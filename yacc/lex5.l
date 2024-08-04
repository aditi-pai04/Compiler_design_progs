%option noyywrap
%{
#include "y.tab.h"
%}
%%
"int" return INT;
"float" return FLOAT;
"char" return CHAR;
"double" return DOUBLE;
"," return COMMA;
";" return SEMICOLON;
"[" return LBRACKET;
"]" return RBRACKET;
[a-zA-Z_][a-zA-Z0-9_]* return ID;
[0-9]+ return NUM;
# return 0;
[ \t\n]+ ;
. return yytext[0];
%%
