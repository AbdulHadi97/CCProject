%{
#include <stdio.h>
#include <stdlib.h>


%}
%start program
%token INT FLOAT ArithmaticOperator RelationalOperator keyword Boolen String Function ID AssignmentOperator Semi PreprocessorDirective SpecialCharacters SingleLineCommments InvalidToken MultiLineComments type Blank


%%
program : statement {printf("valid program ");};

statement : block
| Semi
| assignment
| declaration
| expression
| if
| while
| "break"  Semi
| "continue" Semi
|  "exit()" Semi
| "print" parExp Semi
| "println" parExp Semi
;

block : '{' statement '}';

expression : INT
| FLOAT
| String
| Boolen
| ID
| '!' expression
| '-' expression
| expression ArithmaticOperator  expression
| expression RelationalOperator expression
| parExp
;

parExp :  '('expression')' ;
assignment : ID AssignmentOperator expression Semi;
declaration : type ID AssignmentOperator expression Semi;
if : if   parExp '{' statement  '}' '(''else' statement')';

while: "while"   parExp '{' statement  '}'
          	;
for: "for" '(' expression ';' expression ';' expression ')' '{' statement  '}' 
       | "for" '(' expression ')' '{' statement  '}' 
       ;

Print : "printf" '(' expression ')' ;

%%
#include"lex.yy.c"

int main(int argc, char *argv[])
{
	
	
   if(!yyparse())
		printf("\nParsing complete\n");
	else
		printf("\nParsing failed\n");
    return 0;
}
         
yyerror(char *s) {
	printf("%d : %s %s\n", yylineno, s, yytext );
}         
