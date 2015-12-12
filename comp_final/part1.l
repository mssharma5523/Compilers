%{
	#include<iostream>
	#include<map>
	#include<stdio.h>
	#include <fstream>
	#define ID 1
	#define OTH 2
	#define EO 3
	using namespace std;
%}

%%

"endl"					{ return (OTH);}
"__def"					{ return (OTH); }
"__res"					{ return (OTH); }
"INT"					{ return (OTH); }
"BOOL"					{ return (OTH); }
"print"					{ return (OTH); }
"input"					{ return (OTH); }
"if"					{ return (OTH); }
"goto"					{ return (OTH); }
"param"					{ return (OTH); }
"call"					{ return (OTH); }
"func_end"				{ return (OTH); }
","						{ return (OTH); }
[a-zA-z]+[a-zA-z0-9]*[:] 	{return(OTH); }
[a-zA-z]+[a-zA-z0-9]* 		{return(ID); }

<<EOF>> 					{return(EO); }
(.|\n) 						{return(OTH); }

%%
int yywrap()
{
	return 1;
}

int main()
{
	int k,n=1;
	ofstream fout;
	fout.open("intermediate.txt");
	//freopen("intermediate.txt","w",stdout);
	while(1)
		{
		k=yylex();
		if(k==ID)
		{
			//printf("%0.*s\n",yyleng,yytext);
			fout<<yytext<<endl;
			n++;
		}
		else if(k==EO)
		{
			break;
		}
	}
	fout.close();
return 0;
}
