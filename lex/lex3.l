%{
#include <stdio.h>

int comment_lines = 0;
%}

%%
"//"[^\n]*	{comment_lines++;}
"/*"[^*#]*"*/"	{
	for(int i=0;i<yyleng;i++)
	{
		if(yytext[i]=='\n')
			comment_lines++;
	}
	}
[^#\n] {
    fprintf(yyout, "%s", yytext);
}
\n {
    fprintf(yyout, "\n");
}
# return 0;

%%

int main() {
    yyin=fopen("C:/Users/aditi/OneDrive/Desktop/cd_progs/lex/input.c", "r");
    yyout = fopen("./output.c", "w");

    yylex();
    printf("Number of comment lines: %d\n", comment_lines);

    return 0;
}

int yywrap() {
    return 1;
}
