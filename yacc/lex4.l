%option noyywrap
%{
#include "y.tab.h"
%}
%%
"if" return IF;
[_a-zA-Z][a-zA-Z0-9_]* return ID;
[0-9]+ return NUM;
[\+\-]{1,2} { 
    if (yytext[0] == '+' && yytext[1] == '+') { return UP; }
    else if (yytext[0] == '-' && yytext[1] == '-') { return UM; }
    else { return yytext[0]; }
}
[ \t\n]+ ;
# return 0;
. return yytext[0];
%%
