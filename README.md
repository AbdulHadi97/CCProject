# CCProject
Compiler of  Micro C

                   Micro C
            Sample Construction:
  EXAMPLE 1:
  i = 1;
  sum = 0;
  while sum < 10000 do 
    begin  sum = sum + i;
    i = 1 + i;
  end;
            Lexical Specification
  Keyword “int,string”
  Identifier “main”
  Parentheses “(,)”
  Open brace ”{“
  return keyword “return”
  Constant “2”
  Semicolon “;”
  Close brace “}”
      EXAMPLE1)
%
{
#include <stdio.h>
%}
%%
[0-9]+ { printf("%s\n", yytext); }
.|\n { }
%%
main()
{ yylex();
}
            Grammar
  program = statement*

  statement = block
   | SEMI
   | assignment
   | declaration
   | if
   | while
   | 'break' SEMI
   | 'continue' SEMI
   | 'exit' '(' ')' SEMI
   | 'print' parExpression SEMI
   | 'println' parExpression SEMI

  block = '{' statement* '}'
  
  expression = literal
  | ID
  | ('!' | '-') expression 	
  | expression ('*' | '/' | '%') expression
  | expression ('+' | '-') expression
  | expression ('<' | '>' | '<=' | '>=') expression
  | expression ('==' | '!=') expression
  | expression ('&&') expression	
  | expression ('||') expression	
  | parExp
  | 'readInt' '(' ')'
  | 'readDouble' '(' ')'
  | 'readLine' '(' ')'
  | 'toString' parExpression
  parExp = '(' expression ')'
  assignment = ID assignmentOp expression SEMI
  declaration = type ID (assignmentOp expression)? SEMI
  if = 'if' parExp statement ('else' statement)?
  while = 'while' parExp statement
  assignmentOp = '='

  type = 'int'
   | 'double'
   | 'bool'
   | 'string'

  literal = IntegerLiteral
   | FloatingPointLiteral
   | StringLiteral
   | BooleanLiteral

  IntegerLiteral = DIGIT+
  FloatingPointLiteral = DIGIT+ '.' DIGIT+
  StringLiteral = '"' (CHAR | '\"')* '"'
  BooleanLiteral = 'true' | 'false'
  SEMI = ';'

  ID = (LETTER | '_') (LETTER | DIGIT | '_')*
  DIGIT = [0-9]
  LETTER = [a-z|A-Z]
  Whitespace (‘ ‘)

