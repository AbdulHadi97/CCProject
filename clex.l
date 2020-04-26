%{

#include <stdio.h>

%}


Digit [0-9]
Alpha [a-zA-Z]

%%

{Digit}+ printf("This is Integer: %s\n",yytext);  

{Digit}+"."{Digit}* printf("This is Float: %s\n",yytext);  

"+"|"-"|"*"|"/"   printf("This is Arithmatic Operator: %s\n",yytext);

"<="|">="|"++"|"!="|"=="|"<"|">"   printf("This is Relational Operator: %s\n",yytext);

("int")|("if")|("else")|("while")|("do")|("break")|("continue")|("double")|("float")|("return")("return")|("char")|("case")|("sizeof")|("long")|("short")|("typedef")|("switch")|("void")|("static")|("struct")|("goto")|("main")   printf("This is Keyword: %s\n",yytext);

"true"|"false"  printf("This is boolen: %s\n",yytext);

\".*\"   printf("This is String:%s\n",yytext);

Alpha*\(  printf("This is Function: %s\n",yytext);

[a-zA-Z][a-zA-Z0-9"_"]*  printf("This is Identifier: %s\n",yytext);

\t|\r|\s|" "  printf("This is Blank \n");

'<='|'>='|'++'|'!='|'=='|'<'|'>'|'&&'|'||'|'!'  printf("This is Relational Operator: %s\n",yytext);

"="   printf("This is Assignment Operator: %s\n",yytext);

";"  printf("This is Semi: %s\n",yytext);

#|@|$|^|%|^|&  printf("This is Special Characters: %s\n",yytext);

[''|','|'('|')'|'{'|'}'|'['|']'|'.'|'_']  printf("This is Delimiter: %s\n",yytext);

#Alpha+  printf("This is Pre-processor directive: %s\n",yytext);

"//".*" "*    printf("This is single line Commments: %s\n",yytext);

\/\*(.*\n)*.*\*\/    printf("This is multi line Comments: %s\n",yytext);

.  printf("token: %s\n",yytext);
%%


