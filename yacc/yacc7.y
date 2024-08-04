%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror();
    int yylex(void);
    extern *yyin;
%}

%token TYPE IDEN NUM RET
 
%%
S:FUN  {printf("Accepted\n");exit(0);}
;
FUN:TYPE IDEN '(' PARAM ')' '{' BODY '}'
;
PARAM: PARAM ',' PARAM
|TYPE IDEN
|
;
BODY: BODY BODY
| PARAM ';'
| E ';'
| RET E ';'
|
;
E: IDEN '=' E
| E '+' E
| E '-' E
| E '*' E
| E '/' E
| IDEN
| NUM
;
%%
int main()
{   //yyin =fopen("C:/Users/aditi/OneDrive/Desktop/cd_progs/lex/input.c", "r");
    printf("enter input: ");
    yyparse();
    printf("successfull\n");
    return 0;
}
void yyerror()
{
    printf("ERROR\n");
    exit(0);
}