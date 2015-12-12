%{
#include <cstdio>
#include<algorithm>
#include<vector>
#include<string>
using namespace std;
#include "node.h"
#include "y.tab.h"
#include <stdlib.h>

int line_no=0;
void countlno();

%}
ID    		[a-zA-Z_][a-zA-Z0-9_]*
CHAR_VAL	[\'][a-zA-Z0-9][\']
PLUS            [\+]
MINUS           [\-]
TIMES           [\*]
STRING 		\"(\\.|[^"])*\"
IC		["]
INPUT		[>][>]
OUTPUT		[<][<]	
REQUALS		[=][=]
NOTEQUAL	[!][=]
LESSEQ		[<][=]
GREATEREQ	[>][=]
AND		[&][&]
OR		[|][|]
NOT		[!][|]
LESS		[<]
GREATER		[>]
DIVIDE          [/]
DIGIT           [0-9]
NUMBER          [0-9]+
WS              [ \t]*
LP              "("
RP              ")"
LC	        "{"
RC		"}"
FLOAT_VAL 	[0-9]+[.][0-9]+
RET		[\n]
COMMENT		"/*"([^*]|\*+[^*/])*\*+"/"

%%

{WS}            {
                /* eat up white space */
                }
{COMMENT}	{
		/*eat up comment*/
		}
{CHAR_VAL}	{
		yylval.str = strdup(yytext);
		return (CHAR_VAL);
		}
{LC}		{
		yylval.str = strdup(yytext);
		return (LC);
		}
{RC}		{
		yylval.str = strdup(yytext);
		return (RC);
		}
"true"		{
		yylval.str = strdup(yytext);
	
		return (TRUE);
		}
"false"		{
		yylval.str = strdup(yytext);
	
		return (FALSE);
		}

{AND}		{
		yylval.str = strdup(yytext);
		return (AND);
		}
{OR}		{
		yylval.str = strdup(yytext);
		return (OR);
		}
{NOT}		{
		yylval.str = strdup(yytext);
		return (NOT);
		}
{FLOAT_VAL}	{
		yylval.str = strdup(yytext);
	
		return (FLOAT_VAL);
		}
{INPUT}		{
		yylval.str = strdup(yytext);
		
		return (INPUT);
		}
{OUTPUT}	{
		yylval.str = strdup(yytext);
	
		return (OUTPUT);
		}
{STRING}	{
		yylval.str = strdup(yytext);
	
		return (STRING);
		}
{IC}		{
		yylval.str = strdup(yytext);
		
		return (IC);
		}
"&"		{
		yylval.str = strdup(yytext);
	
		return (AMPER);
		}
"["		{
		yylval.str = strdup(yytext);

		return (LB);
		}
"]"		{
		yylval.str = strdup(yytext);
		
		return (RB);
		}
"."		{
		yylval.str = strdup(yytext);
		
		return (DOT);
		}
";"		{
		yylval.str = strdup(yytext);
	
		return (SEMI_C);
		}
"#"	        {
		yylval.str = strdup(yytext);
		
		return (HASH);
		}
"define"  	{
		yylval.str = strdup(yytext);
	
		return (DEFINE);
		}
"include"	{
		yylval.str = strdup(yytext);
		
		return (INCLUDE);
		}
"int"		{
		yylval.str = strdup(yytext);
		
		return (INT);
		}
"float"		{
		yylval.str = strdup(yytext);
		
		return (FLOAT);
		}
"char"		{
		yylval.str = strdup(yytext);
	
		return (CHAR);
		}
","		{
		yylval.str = strdup(yytext);
		
		return (COMMA);
		}
"="		{
		yylval.str = strdup(yytext);
	
		return (ASSIGN);
		}
"bool"		{
		yylval.str = strdup(yytext);
		
		return (BOOL);
		}
"if"		{
		yylval.str = strdup(yytext);
	
		return (IF);
		}
"else"		{
		yylval.str = strdup(yytext);
		
		return (ELSE);
		}
"fi"		{
		yylval.str = strdup(yytext);
		
		return (FI);
		}
"while"		{
		yylval.str = strdup(yytext);
		
		return (WHILE);
		}
"for"		{
		yylval.str = strdup(yytext);
	
		return (FOR);
		}
"do"		{
		yylval.str = strdup(yytext);
		
		return (DO);
		}
"then"		{
		yylval.str = strdup(yytext);
		
		return (THEN);
		}
"switch"	{
		yylval.str = strdup(yytext);
		
		return (SWITCH);
		}
"break"		{
		yylval.str = strdup(yytext);
		
		return (BREAK);
		}
"return"	{
		yylval.str = strdup(yytext);
		
		return (RETURN);
		}
"continue"	{
		yylval.str = strdup(yytext);
		
		return (CONTINUE);
		}
"goto"		{
		yylval.str = strdup(yytext);
		
		return (GOTO);
		}
"in"		{
		yylval.str = strdup(yytext);
		
		return (IN);
		}
"out"		{
		yylval.str = strdup(yytext);
		
		return (OUT);
		}
"endl"		{
		yylval.str = strdup(yytext);
	
		return (ENDL); 
		}
"main"		{
		yylval.str = strdup(yytext);
		return (MAIN);
		}
{ID}            {
		yylval.str = strdup(yytext);
		
		return (ID);
		}
{NUMBER}        {
		yylval.str = strdup(yytext);
               
		return TOK_NUMBER;
                }
{REQUALS} 	{
		yylval.str = strdup(yytext);
	
		return REQUALS ;
		}
{NOTEQUAL} 	{
		yylval.str = strdup(yytext);
	
		return NOTEQUAL ;
		}
{LESSEQ} 	{
		yylval.str = strdup(yytext);
		
		return LESSEQ ;
		}
{GREATEREQ} 	{
		yylval.str = strdup(yytext);
	
		return GREATEREQ ;
		}
{LESS} 		{
		yylval.str = strdup(yytext);
		
		return LESS ;
		}		
{GREATER}	{
		yylval.str = strdup(yytext);
 		
		return GREATER ;
		}
{PLUS}          {
		yylval.str = strdup(yytext);
               
		return TOK_PLUS;
                }
{TIMES}         {
		yylval.str = strdup(yytext);
                
		return TOK_TIMES;
                }
{MINUS}         {
		yylval.str = strdup(yytext);
              
		return TOK_MINUS;
                }
{DIVIDE}        {
		yylval.str = strdup(yytext);
                
		return TOK_DIVIDE;
                }
{LP}            {
		yylval.str = strdup(yytext);
             
		return TOK_LP;
                }
{RP}            {
		yylval.str = strdup(yytext);
             
		return TOK_RP;
                }
\n				{
					line_no++;
				}
.               {
		
		
				}

%%

void countlno()
{
	int i;
	for(i=0; i<yyleng; i++)
	{
		if(*(yytext+i)=='\n') 
			line_no++;
	}
}
