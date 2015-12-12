%{
#include<stdio.h>
#include<iostream>
#include "y.tab.h"
using namespace std;
%}

%%
"endl"					{ return (ENDL);}
"__def"					{ return (DEF); }
"__res"					{ return (_RES); }
"if"					{ return (IF);  }
"goto"					{ return (GOTO);}
"INT"					{ return (INT); }
"print"					{ return (PRINT); }
"input"					{ return (INPUT); }
"BOOL"					{ return (BOOL); }
"param"					{ return (PARAM);}
"call"					{ return (CALL); }
"func_end"				{ return (RETURN);}
","						{ return (COMMA); }
[a-zA-Z]+[a-zA-Z0-9]*	{ return (ID);}
"=="					{ return (BIN_OP);}
[-+*/<>]				{ return (BIN_OP);}
[0-9]+					{ return (NUM); }

[=]						{ return (EQUAL);}
[&]						{ return (AND);	}
[a-zA-Z]+[a-zA-Z0-9]*[:] { return (LABEL); }
(.|\n) 					{ }
				

%%
int yywrap(){
	return 1;
}
