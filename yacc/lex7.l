%option noyywrap
%{
    #include "y.tab.h"
%}

%%
"int"|"float"|"char"|"void" {return TYPE;}

"return" {return RET;}

[a-zA-Z][a-zA-Z0-9_]* {return IDEN;}

[0-9]+ {return NUM;}

[\t\n ]+ ;
# return 0;

. {return yytext[0];}
%%