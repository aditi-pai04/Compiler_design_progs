%{
#include<stdio.h>
#include<stdlib.h>
void yyerror();
int yylex(void);
extern FILE *yyin;
typedef char *string;
struct {
    string res,op1,op2;
    char op;
} code[100];
int idx=-1;
string addtoTable(string,string,char);
void targetCode();
%}

%union {
    char *exp;
}
%token <exp> NUM ID 
%type <exp> EXP
%left '+' '-' '*' '/'
%%
STMTS: STMTS STMT 
|
;
STMT: EXP '\n'
;
EXP: EXP '+' EXP {$$=addtoTable($1,$3,'+');}
| EXP '-' EXP {$$=addtoTable($1,$3,'-');}
| EXP '*' EXP {$$=addtoTable($1,$3,'*');}
| EXP '/' EXP {$$=addtoTable($1,$3,'/');}
| '(' EXP ')' {$$=$2;}
| ID '=' EXP {$$=addtoTable($1,$3,'=');}
| NUM {$$=$1;}
| ID {$$=$1;}
;
%%
string addtoTable(string op1,string op2, char op) {
    idx++;
    if (op=='=') {
        code[idx].res=op1;
        code[idx].op1=op2;
        code[idx].op2=" ";
        return op1;    }
    string res=malloc(3);
    sprintf(res,"@%c",idx+'A');
    code[idx].op1 = op1;
	code[idx].op2 = op2;
	code[idx].op = op;
	code[idx].res = res;
	return res;

}
void targetCode() {
    for(int i=0; i <= idx; ++i) {
        string instr;

        // Special case for '=' (assignment)
        if (!code[i].op) {
            printf("LOAD\tR1,%s\n", code[i].op1);  // Load the value into a register
            printf("STORE\t%s,R1\n", code[i].res); // Store it in the destination variable
        } else {
            // Handle arithmetic instructions
            switch(code[i].op) {
                case '+': instr = "ADD"; break;
                case '-': instr = "SUB"; break;
                case '*': instr = "MUL"; break;
                case '/': instr = "DIV"; break;
            }
            printf("LOAD\tR1,%s\n", code[i].op1);  // Load operand 1 into R1
            printf("LOAD\tR2,%s\n", code[i].op2);  // Load operand 2 into R2
            printf("%s\tR3,R1,R2\n", instr);       // Perform the operation
            printf("STORE\t%s,R3\n", code[i].res); // Store the result in the temporary variable
        }
    }
}

int main() {
    printf("Enter input:\n");
    yyparse();
    targetCode();
    return 0;
}
void yyerror() {
    printf("Invalid\n");
    exit(0);
}
