#CC 103411: Micro-C Compiler#

###PROJECT MEMBERS###
StdID | Name
------------ | -------------
**61659** | **Muhammad Hasnain Naseem** 
62209 | Muhammad abdul Hadi

## Project Description ##
Its a simple Micro C complier, it have lex file whihch define its token, and then the yacc will parse it from left to right.

##Sample Language Used ##
i = 1;
sum = 0;
while sum < 10000 do begin
sum = sum + i;
i = 1 + i;
end;

#include <some code examples.h>
int
a
=
1
;

###Lexical Specification###
-Keyword “int,string”
-Identifier “main”
-Parentheses “(,)”
-Open brace ”{“
-return keyword “return”
-Constant “2”
-Semicolon “;”
-Close brace “}”

###Grammar###
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
block = '{' statement* '}'expression = literal
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
while = 'while' parExp statementassignmentOp = '='
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

##Problems Faced##
for this project we found very less material or examples on internet also the help we get is of older version of the yacc that is why we get alot of error.
###Problem 1:Material availibility###
The examples was available but it was hard to clear our concepts because of low community and help support blogs 

###Problem 2: Syntax Difference###
As we get the help on it but the the version diffrence make the file buggy for new yacc version.

##References##
-https://github.com/rabishah/Mini-C-Compiler-using-Flex-And-Yacc
-https://elearning.dei.unipd.it/pluginfile.php/59781/mod_resource/content 1/03%20%20Lexical%20Analysis%20%28part%20I%29.pdf
-https://github.com/nicebub/project4/tree/master/src/interpreter
-https://norasandler.com/2017/11/29/Write-a-Compiler.html
