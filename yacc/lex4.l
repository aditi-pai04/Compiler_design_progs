%option noyywrap
%{
    #include "y.tab.h"
%}
%%
"if"    {return IF;}
[a-zA-Z]+   {return IDEN;}
[0-9]+  {return NUM;}
[\n ]   ;
[\+\-]{1,2} { 
    if (yytext[0] == '+' && yytext[1] == '+') { return UP; }
    else if (yytext[0] == '-' && yytext[1] == '-') { return UM; }
    else { return yytext[0]; }
}
# {return 0;}
.   {return yytext[0];}
%%