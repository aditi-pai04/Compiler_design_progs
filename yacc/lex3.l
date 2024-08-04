%{
	#include "y.tab.h"
%}
%%
"for" return FOR;
[a-zA-Z_][a-zA-Z0-9_]* return IDEN;
[0-9]+ return NUM;
[\+\-]{1,2} { 
    if (yytext[0] == '+' && yytext[1] == '+') { return UP; }
    else if (yytext[0] == '-' && yytext[1] == '-') { return UM; }
    else { return yytext[0]; }
}
[\n\t ]+  ;
# {return 0;}
.  {return yytext[0];}
%%

int yywrap() {
    return 1;
}