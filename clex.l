%{

#include <stdio.h>

%}


Digit [0-9]
Alpha [a-zA-Z]

%%

{Digit}+ {return(INT);}

{Digit}+"."{Digit}* {return(FLOAT);}

"+"|"-"|"*"|"/"   {return(Arithmatic Operator);}

"<="|">="|"++"|"!="|"=="|"<"|">"   {return(Relational Operator);}

("int")|("if")|("else")|("while")|("do")|("break")|("continue")|("double")|("float")|("return")("return")|("char")|("case")|("sizeof")|("long")|("short")|("typedef")|("switch")|("void")|("static")|("struct")|("goto")|("main")   {return(Keyword);}

"true"|"false"  {return(Boolen);}

\".*\"   {return(String);}

Alpha*\(  {return(Function);}

[a-zA-Z][a-zA-Z0-9"_"]*  {return(Identifier);}

\t|\r|\s|" "  {return(Blank);}

"<="|">="|"++"|"!="|"=="|"<"|">"|"&&"|"||"|"!"  {return(Relational Operator);}

"="   {return(Assignment Operator);}

";"  {return(Semi);}

"#"|"@"|"$"|"^"|"%"|"^"|"&"  {return(Special Characters);}

"#include ".+  {return(Pre-processor directive);}

"//".*" "*    {return(single line Commments);}

\/\*(.*\n)*.*\*\/    {return(multi line Comments);}

.  {return("token: %s\n",yytext);}
%%


