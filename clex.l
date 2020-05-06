%{

#include <stdio.h>

%}


Digit [0-9]
Alpha [a-zA-Z]

%%

{Digit}+ {return(INT);}

{Digit}+"."{Digit}* {return(FLOAT);}

"+"|"-"|"*"|"/"   {return(ArithmaticOperator);}

("if")|("else")|("while")|("do")|("break")|("continue")|("return")|("case")|("sizeof")|("typedef")|("switch")|("void")|("static")|("struct")|("goto")|("main")   {return(Keyword);}

("int")|("float")|("char")|("string") {return(Type);}

"true"|"false"  {return(Boolen);}

\".*\"   {return(String);}

[a-zA-Z][a-zA-Z0-9"_"]*  {return(ID);}

\t|\r|\s|" "  {return(Blank);}

"<="|">="|"++"|"!="|"=="|"<"|">"|"&&"|"||"|"!"  {return(RelationalOperator);}

"="   {return(AssignmentOperator);}

";"  {return(Semi);}

"#include ".+  {return(Pre-processorDirective);}

"#"|"@"|"$"|"^"|"%"|"^"|"&"  {return(SpecialCharacters);}

"//".*" "*    {return(SingleLineCommments);}

\/\*(.*\n)*.*\*\/    {return(MultiLineComments);}

.  {return(InvalidToken);}
%%


