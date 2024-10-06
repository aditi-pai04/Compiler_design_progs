%option noyywrap
%{
#include "y.tab.h"
%}
%%
"int"|"float"|"char"|"void" {return TYPE; }
"return " { return RET; } //space to account for a space after return 
[a-zA-Z_][a-zA-Z_0-9]* { return ID; }
[0-9]+ { return NUM; }
# return 0;
[ \t\n]+ { /* Ignore whitespace */ }
. { return yytext[0]; }
%%
