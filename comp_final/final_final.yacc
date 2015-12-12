%{
#include <ctype.h>
#include <stdio.h>
#include<stdlib.h>
#include<iostream>
#include<vector>
#include<set>
#include<string>
#include<algorithm>
#include<utility>
#include<queue>
#include <bits/stdc++.h>
#include<fstream>
#include<map>
#include<sstream>
using namespace std;

extern int yylex(void);
extern int yyparse(void);
	extern int yylineno ;
	extern int line_no;
	extern char* yytext ;
extern FILE* yyin;
string label();
//int yydebug =1;
stringstream a;
vector<string> temp;
int pre_label=0;//auto increment it every time we need a label
int reg_str = 0;
string st = "";
map<string,vector<string> > func_param;//used for accessing the names of the parameters
map<string,vector<string> > :: iterator it_param;
string present_func = "";
queue<string> parameter;
bool loop_check=false;
string first;
//#define FOR(i,a) for(int i=0;i<a;i++)
typedef struct node node;
int param_count=0;
ofstream codegen_file;
bool isTrue = false;
struct node {
	vector<node*> child; //used to point to the child) nodes..
	string name;//i.e the name of the operator,operand,value,id etc... will be used to distin
	//string value;//value to be used if the po(inter is parent to the leaf
	string type ;
	int scp;
};
node* root;
vector<map<string,string> > table;
map<string,queue<string> > ac_record;
map<string,queue<string> > :: iterator it_rec;
string func_name = "";
map<string,int> func_param_count;
map<string,string> func_table;
int scope = 0;
bool sem_error = false;
bool syntax_err = false;
vector<map<string,string> > ::iterator it;

void printTable()
{
	//cout<<scope<<"\n";
	map<string,string> ::iterator it;
	
	for(int i=table.size()-1;i>=0;i--)
	{
		cout<<"The present scope is "<<i<<"\n";
		for(it = table[i].begin();it!=table[i].end();it++)
		{
			cout<<it->first<<" "<<it->second<<"\n";
		}
	}
	return;	
}

int findTable(string id)
{
	//cout<<scope<<" "<<id<<"\n";
	for(int i=scope;i>=0;i--)
	{
		if(table[i].find(id)!=table[i].end())
			return i;
	}
	return -1;
}
bool findfunc(string id)
{
	if(func_table.find(id)!=func_table.end())
		return true;
	return false;
}
string codegen(node *ptr);
void tab(int space)
{
	for(int i=0;i<space;i++)
		cout<<"\t";
}
void dfs(node *ptr,int space)
{
	tab(space);
	if(ptr == NULL)
		return;
	cout<<ptr->name<<"\n";
	for(int i=0;i<(ptr->child).size();i++)
		dfs(ptr->child[i],space+1);
	return;
}
ofstream myfile;
int height = 1;
void bfs(node *ptr,int space)
{
	tab(space);
	node *temp;
	//queue< pair<int,node* > > q;
	//q.push(makepair(height,ptr));
	queue<node*> q;
	q.push(ptr);	
	while(!q.empty())
	{
		int count = q.size();
		if(count == 0)
			break;
		
		while(count > 0)
		{
			temp = q.front();
			q.pop();
			cout<<temp->name;
			if(temp->name=="ID"){
				cout<<temp->child[0]->name<<endl;
			}
			tab(space);
			for(int i=0;i<temp->child.size();i++)
			{
				q.push(temp->child[i]);
			}
			count--;
		}
		cout<<endl;
	}	
	return;
}

void parse(char* filename)
{
	yyin = fopen(filename,"r");
	if(yyin==NULL)
		fprintf(stderr,"Could Not open the file\n");
	else{
		map<string,string> in;
		table.push_back(in);
		syntax_err=false;
		sem_error = false;
		//cout<<"hi\n";
		if(yyparse()==0)
			fprintf(stderr,"Successful parsing of the file\n");
		else
			fprintf(stderr,"Parsing failed\n");
	}
}
void yyerror(const char *s) {
	fprintf(stdout, "Error at Line no. : %d, %s\n", line_no,yytext);
}


int yywrap()
{
  return 1;
}
string mul_type = "";

void preorder(node* ptr, string space)
{

	cout<<(ptr->name);
	myfile<<ptr->name;
	if(ptr->child.size()==0)
	{
		cout<<"\n";
		myfile<<"\n";
	}
	else
	{
		size_t n = ptr->name.length();
				space.append(n,' ');
		if(ptr->child.size()==1)
		{
			space+=" ";
			cout <<"-"<<"-";
			myfile<<"-"<<"-";
		}
		else
		{
			cout<<"-"<<'|'<<"-";
			myfile<<"-"<<'|'<<"-";
			space+=" | ";
		}

		for(vector<node*>::iterator it = ptr->child.begin(); it!=ptr->child.end() ; it++)
		{
			if(it!=ptr->child.begin())
			{
				space[space.length()-1]='-';
				myfile<<space;
				cout<<space;
				space[space.length()-1]=' ';
				if(it+1==ptr->child.end())
				{
					space[space.length()-2] = ' ';
				}
			}
			preorder(*it,space);
		}	
		
	}
}

int main(int argc,char **argv)
{
	printf("> "); 
	if(argc!=2)
  	{
		printf("Enter the file name from which it needs to be parsed\n");
		exit(1);
	}
	//ofstream myfile;
	ifstream read;
	ofstream write;
	/*myfile.open("output.txt");
	myfile<<"The output syntax tree is->\n";
	myfile.close();*/
	parse(argv[1]);
	read.open("other.txt");
	write.open("codegen.txt",ios::app);
	
	string line;
	while ( getline (read,line) )
    {
      write << line << '\n';
    }
    read.close();
    remove("other.txt");	
	
	//myfile.close();
	//yyparse();
	
	//dfs(root,0);
  	return 0;
}

//code for generating the syntax trees...
/*
	The syntax tree will be used to print the nodes that are parsed. Also it will be used to define the attributes and will be used in the symbol table. Each of the operators,operations etc will be shown in the tree .
The non-terminals are the nodes of the trees and the terminals can be seen as basic string. Hence we have to define a union of these two types.
*/

 
//int syntax_err = 0;



%}
%union {
	node* ptr;//for the non-terminals
	char *str;//for the terminals
};
%start start
%error-verbose
%token <str> TOK_NUMBER TOK_PLUS TOK_TIMES TOK_MINUS TOK_DIVIDE TOK_LP TOK_RP ID REQUALS  LESS GREATER LESSEQ GREATEREQ NOTEQUAL OUT IN GOTO CONTINUE RETURN BREAK SWITCH THEN DO FOR WHILE FI ELSE IF INT FLOAT CHAR BOOL COMMA ASSIGN LC RC SEMI_C INPUT OUTPUT ENDL STRING HASH DEFINE INCLUDE IC DOT LB RB AMPER TRUE FALSE FLOAT_VAL CHAR_VAL AND OR NOT MAIN

%left TOK_PLUS TOK_MINUS
%left TOK_DIVIDE TOK_TIMES

%type <ptr> start line ID_array ID_ptr boolean function global_declaration macros header_declaration path func_stmt output d_in d_out input io_stmt factor term art_exp comp Rval expr H ptr ptr_y ptr_dec value1 values arr_declare loc_list1 loc_list loc_Y1 loc_B list1 list Y1 B third second first cond loop_stmt local_declaration N cond_stmt stmtlist cmpd_stmt p_ID param_func func_call M term_stmt param param_list Y A stmt type SEMI RC_c Y_rc LC_c ID_array_dec TOK_LP_c TOK_LP_r ID_c

%%

start	    :line			{	
								//cout<<"here\n";							
								string sp = "";
								myfile.open("output.txt");
								table.clear();
								map<string,string> in;
								table.push_back(in);
								scope = 0;
								if(!syntax_err && !sem_error)
								{								
									codegen_file.open("codegen.txt");
									codegen($1);
									codegen_file.close();
								}
								else{
									cout<<"Code contains errors\n";
									exit(0);
								}
								/*if(syntax_err==0)
								{
									//cout<<"1\n";
									//preorder($1,sp);
									table.clear();
									map<string,string> in;
									table.push_back(in);
									scope = 0;
									//codegen($1);
									//preorder($1,sp);
									myfile.close();
								}*/									//
									//print_tree($1,sp,true);							
								//dfs($1,2);								
								//rooptr->name="START";
								//rooptr->child.push_back($1);				
							}
	    ;
line        : line function     			{
								//cout<<"1\n";
								node *internal = new node;
								internal->name = "line";
								(internal->child).push_back($1);
								(internal->child).push_back($2);
								$$ = internal;						
							}
	    | line global_declaration SEMI 		{
								node *internal = new node;
								internal->name = "line";
								(internal->child).push_back($1);
								(internal->child).push_back($2);
								internal->child.push_back($3);
								$$ = internal;
							}
	    | line macros 				{
								node *internal = new node;
								internal->name = "line";
								(internal->child).push_back($1);
								(internal->child).push_back($2);
								$$ = internal;
							}
							
            | line header_declaration    		{
								node *internal = new node;
								internal->name = "line";
								(internal->child).push_back($1);
								(internal->child).push_back($2);
								$$ = internal;
							}
	    | /* empty word */				{
								node *internal = new node;
								internal->name = "Epsilon";
								$$ = internal;
							}
		;
SEMI	    : SEMI_C					{
								node *interval = new node;
								interval->name = "SEMI_C";
								node *id = new node; 
								id->name = string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
							}	
            | error					{ 
								node *interval = new node;
								interval->name = "ERROR";//string($1);
								 $$ = interval;
								syntax_err = 1;
								printf("Missing semicolon at line no.: %d\n",line_no);
							}

	    ;

ID_array_dec : ID					{
								//cout<<"here\n";	
								node *interval = new node;
								interval->name = "ID_array_ID";
								node *id = new node; 
								id->name = string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
							//check whether in scope
								int present = findTable(id->name);
								if(present == scope)
								{
									cout<<"Error : variable "<<id->name<<" already declared in the scope "<<line_no+1<<"\n";
									sem_error = 1;
									//printTable();
								}
								else{
									table[scope][id->name] = mul_type;
									$$->type = mul_type; 
									$$->scp = scope;
								}		
							}

		| ID LB TOK_NUMBER RB			{
								node *interval = new node;
								interval->name = "ID_array";
								node **id = new node*[4];
								for(int i=0;i<4;i++)
								{
									id[i] = new node;
									
								}
			
								id[0]->name = "ID";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1]->name = "LB";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2]->name = "TOK_NUMBER";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								 
								 
								id[3]->name = "RB";
								node *ch3 = new node; 
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								
								
								for(int i=0;i<4;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								//check whether in scope
								int present = findTable(ch->name);
								if(present == scope)
								{
									cout<<"Error : variable "<<ch->name<<" already declared in the scope "<<line_no+1<<"\n";
									sem_error = 1;
								}
								else{
									table[scope][ch->name] = mul_type;
									$$->scp = scope;

								}
							}
	        
		;
ID_array    : ID					{
								//cout<<"here\n";	
								node *interval = new node;
								interval->name = "ID_array_ID";
								node *id = new node; 
								id->name = string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
							//check whether in scope
								int present = findTable(id->name);
								if(present == -1)
								{
									cout<<"variable "<<id->name<<" not declared in the scope "<<line_no+1<<"\n";
									sem_error = 1;
									//printTable();
								}
								else{
									$$->type = table[present][id->name];
									$$->scp = present;
								}							
							}					
	    | ID LB TOK_NUMBER RB			{
								node *interval = new node;
								interval->name = "ID_array";
								node **id = new node*[4];
								for(int i=0;i<4;i++)
								{
									id[i] = new node;
									
								}
			
								id[0]->name = "ID";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1]->name = "LB";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2]->name = "TOK_NUMBER";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								 
								 
								id[3]->name = "RB";
								node *ch3 = new node; 
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								
								
								for(int i=0;i<4;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								//check whether in scope
								int present = findTable(ch->name);
								if(present == -1)
								{
									cout<<"variable "<<ch->name<<" not declared in the scope "<<line_no+1<<"\n";
									syntax_err = 1;
								}
								else{
									$$->type = table[present][ch->name];
									$$->scp = present;
								}
							}
	    | ID LB ID RB				{
								node *interval = new node;
								interval->name = "ARRAY";
								node **id = new node*[4];
								for(int i=0;i<4;i++)
								{
									id[i] = new node;
									
								}
								id[0]->name = "ID";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1]->name = "LB";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2]->name = "ID";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								 
								 
								id[3]->name = "RB";
								node *ch3 = new node; 
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								
								for(int i=0;i<4;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								//check whether in scope
								int present = findTable(ch->name);
								if(present == -1)
								{
									cout<<"variable "<<ch->name<<" not declared in the scope"<<line_no+1<<"\n";
									syntax_err = 1;
								}
								else{
									$$->type = table[present][ch->name];
									$$->scp = present;
								}
							}
            | ptr					{
								$$ = $1;
							}
	    ;
ID_ptr 	    : ID_array					{
								$$ = $1;
							}
	    | AMPER ID_array				{
								node *interval = new node;
								interval->name = "ID_ptr";
								node *id1 = new node;
								id1->name = "AMPER";
								node *ch = new node; 
								ch->name = string($1); 
								id1->child.push_back(ch);
								

								
								
								node *id2 = new node;
								id2 = $2;
								interval->child.push_back(id1);
								interval->child.push_back(id2);
								 $$ = interval;
								$$->type = $2->type;
							}
	    ;

boolean     : TRUE					{
								node *interval = new node;
								
								interval->name = "boolean";
								node *ch = new node; 
								ch->name = string($1); 
								interval->child.push_back(ch);
								
								 $$ = interval;
								$$->type ="BOOL";
							}
	    | FALSE					{
								node *interval = new node;
								
								interval->name = "boolean";
								node *ch = new node; 
								ch->name = string($1); 
								interval->child.push_back(ch);
								 $$ = interval;
								$$->type = "BOOL";
							}
	    ;
/* macros :) */
macros	    : HASH DEFINE ID TOK_NUMBER			{
								node *interval = new node;
								interval->name = "MACROS";
								node **id = new node*[4];
								for(int i=0;i<4;i++)
								{
									id[i] = new node;
									
								}
								id[0]->name = "HASH";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1]->name = "DEFINE";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2]->name = "ID";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								 
								 
								id[3]->name = "TOK_NUMBER";
								ch->name = string($4); 
								id[3]->child.push_back(ch);
								for(int i=0;i<4;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
							}
	    | HASH DEFINE ID boolean			{
								node *interval = new node;
								interval->name = "MACROS";
								node **id = new node*[4];
								for(int i=0;i<4;i++)
								{
									id[i] = new node;
									
								}
								id[0]->name = "HASH";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1]->name = "DEFINE";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2]->name = "ID";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								 
								 
								
								for(int i=0;i<3;i++)
									interval->child.push_back(id[i]);
								interval->child.push_back($4);
								 $$ = interval;

							}
	    | HASH DEFINE ID FLOAT_VAL			{
								node *interval = new node;
								interval->name = "MACROS";
								node **id = new node*[4];
								for(int i=0;i<4;i++)
								{
									id[i] = new node;
									
								}
								id[0]->name = "HASH";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1]->name = "DEFINE";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2]->name = "ID";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								 
								 
								id[3]->name = "FLOAT_VAL";
								node *ch3 = new node; 
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								for(int i=0;i<4;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;

							}
	  | HASH DEFINE ID CHAR_VAL			{
								node *interval = new node;
								interval->name = "MACROS";
								node **id = new node*[4];
								for(int i=0;i<4;i++)
								{
									id[i] = new node;
									
								}
								id[0]->name = "HASH";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1]->name = "DEFINE";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2]->name = "ID";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								 
								 
								id[3]->name = "CHAR_VAL";
								node *ch3 = new node; 
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								for(int i=0;i<4;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
							}

	    //|HASH DEFINE ID stmt
	    ;

/* Header Declaration :) */
header_declaration : HASH INCLUDE path			{
								//cout<<"2\n";
								node *interval = new node;
								interval->name = "HEADER_DECLARATION";
								node **id = new node*[4];
								for(int i=0;i<4;i++)
								{
									id[i] = new node;
									
								}
								id[0]->name = "HASH";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1]->name = "INCLUDE";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								 
		
								for(int i=0;i<2;i++)
									interval->child.push_back(id[i]);
								interval->child.push_back($3);						
								 $$ = interval;
							}
	    ;
path	    : STRING 					{
								
								node *interval = new node;
								
								interval->name = "path";
								node *ch = new node; 
								ch->name = string($1); 
								interval->child.push_back(ch);
								 $$ = interval;
							}
            | LESS ID GREATER				{
								node *interval = new node;
								interval->name = "HEADER_PATH";
								node **id = new node*[4];
								for(int i=0;i<4;i++)
								{
									id[i] = new node;
									
								}
								id[0]->name = "LESS";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1]->name = "ID";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2]->name = "GREATER";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								for(int i=0;i<3;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
							}
            ;

TOK_LP_c    : TOK_LP					{
								param_count = 0;
								node *interval = new node;
								interval->name = string($1);
								$$ = interval;
								map<string,string> in;
								table.push_back(in);
								scope++;
								$$->scp = scope;
							}
	    ;

ID_c        : ID					{
								node *interval = new node;
								isTrue = false;
								interval->name = string($1);
								$$ = interval;
								bool present = findfunc(string($1));
								if(!present)
								{
									isTrue = true;
									vector<string> in;
									func_param[string($1)] = in;
									st = string($1);
									func_table[string($1)] = mul_type;
									//cout<<func_table[string($1)]<<" "<<string($1)<<"\n";
								}
								else{
									cout<<"Error at lineno : "<<line_no+1<<" can't use  name"<<string($1)<<".. A function with same name present\n";
									sem_error = true;
								}	
							}
	    ;
function    : type ID_c TOK_LP_c param TOK_RP A		{
								node *interval = new node;
								interval->name = "FUNCTION";
								node **id = new node*[6];
								for(int i=0;i<6;i++)
								{
									id[i] = new node;
									
								}
								id[0] = $1;
								
								id[3] = $4;								
								
								id[5] = $6;
								node *ch = new node; 
								id[1] = $2;
								//id[1]->name = string($2);//"ID";
								ch->name = $2->name; 
								id[1]->child.push_back(ch);
								id[2] = $3;
								//id[2]->name = "TOK_LP";
								node *ch1 = new node; 
								ch1->name = "LP"; 
								id[2]->child.push_back(ch1);
								
								
								id[4]->name = "TOK_RP";
								node *ch2 = new node; 
								ch2->name = string($5); 
								id[4]->child.push_back(ch2);
								
								
								
								for(int i=0;i<6;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								//function declaration in scope
								if(isTrue)
								{
									
									$$->scp = $3->scp;
									if($6->type != $1->type)
									{
										cout<<"Error at lineno : "<<line_no+1<<"Return value must be "<<$1->type<<"\n";
										sem_error = true;
									}
									$$->type = $1->type;
								}
								param_count = 0;
								st = "";
							}
	    | type TOK_TIMES ID_c TOK_LP_c param TOK_RP A	{
								node *interval = new node;
								interval->name = "FUNCTION";
								node **id = new node*[7];
								for(int i=0;i<7;i++)
								{
									id[i] = new node;
									
								}
								id[0] = $1;
								
								id[4] = $5;								
								
								id[6] = $7;
								
								
								node *ch = new node; 
								id[1]->name = "TOK_TIMES";
								ch->name = string($2); 
								id[1]->child.push_back(ch);
								
								//id[2]->name = string($3);//"ID";
								id[2] = $3;								
								node *ch1 = new node; 
								ch1->name = $3->name; 
								id[2]->child.push_back(ch1);
								id[3] = $4;
								//id[3]->name = "TOK_LP";
								node *ch2 = new node; 
								ch2->name = "LP";//string($4); 
								id[3]->child.push_back(ch2);
								
								
								
								id[5]->name = "TOK_RP";
								node *ch3 = new node; 
								ch3->name = string($6); 
								id[5]->child.push_back(ch3);
								
								
								
								for(int i=0;i<7;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								if(isTrue)
								{
									func_param_count[ch1->name] = param_count;
									$$->scp = $4->scp;
									if($7->type != $1->type)
									{
										cout<<"Return type is wrong in function "<<$3->name<<"\n";
										sem_error = true;
									}
								}
								param_count = 0;
							}
	    | type MAIN TOK_LP_c param TOK_RP A		{
								node *interval = new node;
								interval->name = "MAIN_FUNCTION";
								node **id = new node*[6];
								for(int i=0;i<6;i++)
								{
									id[i] = new node;
									
								}
								id[0] = $1;
								
								id[3] = $4;								
								
								id[5] = $6;
								node *ch = new node; 
								
								id[1]->name = "main";
								ch->name = string($2); 
								id[1]->child.push_back(ch);
								id[2] = $3;
								//id[2]->name = "TOK_LP";
								node *ch1 = new node; 
								ch1->name = "LP";//string($3); 
								id[2]->child.push_back(ch1);
								
								
								id[4]->name = "TOK_RP";
								node *ch2 = new node; 
								ch2->name = string($5); 
								id[4]->child.push_back(ch2);
								
								
								
								for(int i=0;i<6;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								bool present = findfunc("main");
								if(!present)
								{
									func_table["main"] = "INT";
									$$->scp = $3->scp;
									func_param_count["main"] = param_count;
									if($6->type!="INT")
									{
										cout<<"Error at lineno : "<<line_no+1<<"Return value must be integer\n";
										sem_error = true;
									}
								}
								else{
									cout<<"Error at lineno : "<<line_no+1<<" can't use name MAIN.. A function with same name present\n";
									sem_error = true;
								}
								param_count = 0;
							}
	    ;




A    	    : func_stmt 				{
								node *internal = new node;
								internal->name = "A";
								(internal->child).push_back($1);
								$$ = internal;
								$$->type = $1->type;
								$$->scp = scope;
							}
	    | SEMI					{
								$$ = $1;
							}
            ;

LC_c	    : LC 					{
								map<string,string> in;
								table.push_back(in);
								scope++;
								node *interval = new node;
								interval->name = "LC";
								$$ = interval;
								$$->scp = scope;
								//printTable();
							}
func_stmt   : LC stmtlist RETURN M SEMI RC_c		{
								//enter into a new scope
								
								node *interval = new node;
								interval->name = "func_stmt";
								node **id = new node*[6];
								for(int i=0;i<6;i++)
									id[i] = new node;								
								
								id[0]->name = "LC";
								node *ch = new node; 
								//ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1] = $2;
								
								id[2]->name = "RETURN";
								
								node *ch1 = new node; 
								ch1->name = string($3); 
								id[2]->child.push_back(ch1);
								
								id[3] = $4;
								id[4] = $5;
								id[5] = $6;
								
								for(int i=0;i<6;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								$$->type = $4->type;
								//add RETURN and M also							
							}
	    |LC stmtlist RETURN SEMI RC_c		{
								
								node *interval = new node;
								interval->name = "FUNCTION_STMT";
								node **id = new node*[6];
								for(int i=0;i<6;i++)
									id[i] = new node;								
								
								id[0]->name = "LC";
								node *ch = new node; 
								//ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1] = $2;
								
								id[2]->name = "RETURN";
								
								node *ch1 = new node; 
								ch1->name = string($3); 
								id[2]->child.push_back(ch1);
								
								id[3] = $4;
								id[4] = $5;
								for(int i=0;i<5;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								$$->type ="void";							
							}
	    |LC stmtlist error RC_c			{
											syntax_err = 1;
											printf("Missing 'return' statement at line no:%d\n",line_no);
										}
			;
RC_c	    :RC						{
								//pop the last scope that is encountered
								//table.pop_back();
								//map<string,string> in;
								//table.push_back(in);
								table.pop_back();
								scope--;
								node *interval = new node;
								interval->name = "RC_c";
								node *ch = new node; 
								ch->name = string($1); 
								interval->child.push_back(ch);
								 $$ = interval;
							}
	    | error	         	{
								syntax_err = 1;
								printf("Missing '}' at line no.: %d\n",line_no);
							}
	    ;


param       : param_list	{
								if(isTrue)
								func_param_count[st] = param_count;
								$$ = $1;
							}
	    |					{
								node *interval = new node;
								interval->name = "Epsilon";
								 $$ = interval;
							}
            ;
param_list  : type ID Y					{
								it_param = func_param.find(st);
								if(it_param!=func_param.end())
								{
									it_param->second.push_back($1->type);
								}
								param_count++;
								node *interval = new node;
								interval->name = "param_list";
								node **id = new node*[3];
								for(int i=0;i<3;i++)
									id[i] = new node;
								id[0] = $1;
								
								node *ch = new node; 
								id[1]->name = "ID";
								ch->name = string($2); 
								id[1]->child.push_back(ch);
								
								id[2] = $3;
								for(int i=0;i<3;i++)
									interval->child.push_back(id[i]);	
								
								 $$ = interval;
								int present = findTable(ch->name);
								if(present!=scope)
								{
									table[scope][ch->name] = $1->type;
									$3->type = $1->type;
									mul_type = $1->type;
								}
								else{
									cout<<"Error : "<<ch->name<<" already declared in the scope "<<line_no+1<<"\n";
									sem_error =true;
								}
							}
            | type ID LB RB Y				{
								
								param_count++;
								node *interval = new node;
								interval->name = "param_list";
								node **id = new node*[5];
								for(int i=0;i<5;i++)
									id[i] = new node;
								id[0] = $1;
								node *ch = new node; 
								id[1]->name = "ID";
								ch->name = string($2); 
								id[1]->child.push_back(ch);
								
								id[2]->name = "LB";
								node *ch1 = new node; 
								ch1->name = string($3); 
								id[2]->child.push_back(ch1);
								
								id[3]->name = "RB";
								node *ch2 = new node; 
								ch2->name = string($4); 
								id[3]->child.push_back(ch2);
								id[4] = $5;
								for(int i=0;i<5;i++)
									interval->child.push_back(id[i]);
								int present = findTable(ch->name);	
								if(present!=scope)
								{
									table[scope][ch->name] = $1->type;
									$5->type = $1->type;
									mul_type = $1->type;
								}
								else{
									cout<<"Error : "<<ch->name<<" already declared in the scope "<<line_no+1<<"\n";
									sem_error =1;
								}
								 $$ = interval;
							}
	    ; 
Y           : COMMA param_list 				{
								node *interval = new node;
								interval->name = "Y";
								node *id=new node;
							
								id->name = ",";
								
								interval->child.push_back(id);
						       interval->child.push_back($2);
								$2->type = mul_type; 
								$$ = $2;
								
							}
            | 						{
								node *interval = new node;
								interval->name = "Y";
								node *ch = new node; 
								ch->name = "Epsilon"; 
								interval->child.push_back(ch);
								 $$ = interval;
							}
            ;
stmt        : cond_stmt 				{
								node *interval = new node;
								interval->name = "stmt";
								interval->child.push_back($1);
								 $$ = interval;
							}
	    | cmpd_stmt 				{
								node *interval = new node;
								interval->name = "stmt";
								interval->child.push_back($1);
								 $$ = interval;
							}
            | ID_array ASSIGN M SEMI			{
								node *interval = new node;
								interval->name = "ASSIGNMENT";
								node **id = new node*[4];
								for(int i=0;i<4;i++)
									id[i] = new node;
								id[0] = $1;
								node *ch = new node; 
								id[1]->name = "ASSIGN";
								ch->name = "="; 
								id[1]->child.push_back(ch);
								id[2] = $3;
								id[3] = $4;
								for(int i=0;i<4;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								if($1->type != $3->type)
								{
									//cout<<$1->type<<" "<<$3->type<<"\n";
									cout<<"Assignment of uneven types at lineno "<<line_no+1<<"\n";
									sem_error = true;
								}
							}
	    | loop_stmt 				{
								node *interval = new node;
								interval->name = "stmt";
								interval->child.push_back($1);
								 $$ = interval;
							}
            | func_call SEMI				{
												node *interval = new node;
												interval->name = "stmt";
															
												interval->child.push_back($1);
												interval->child.push_back($2);
												 $$ = interval;
							}
	    | local_declaration SEMI			{
												node *interval = new node;
												interval->name = "stmt";
															
												interval->child.push_back($1);
												interval->child.push_back($2);
												 $$ = interval;
							}
	    | io_stmt 		{
								node *interval = new node;
												interval->name = "stmt";
															
												interval->child.push_back($1);
												
												 $$ = interval;
							}
            | term_stmt	SEMI				{
								node *interval = new node;
												interval->name = "stmt";
															
												interval->child.push_back($1);
												interval->child.push_back($2);
												 $$ = interval;
							}
            ;
term_stmt   : BREAK					{
								node *interval = new node;
								interval->name = string($1);
								$$=interval;
							}	
	    | CONTINUE					{		
								node *interval = new node;
								interval->name = string($1);
								 $$ = interval;
							}
	    ;
M	    : expr					{
								$$ = $1;
							}
            | func_call					{
								node *interval = new node;
										interval->name = "M";
								 
										interval->child.push_back($1);
										$$ = interval;
										$$->type = $1->type;
							}
            ;
TOK_LP_r    : TOK_LP					{
								node *interval = new node;
								interval->name ="LP";
								$$ = interval;
								temp.clear();
								param_count = 0;
							}
func_call   : ID TOK_LP_r param_func TOK_RP		{
								node *interval = new node;
								interval->name = "func_call";
								node **id = new node*[4];
								for(int i=0;i<4;i++){
									id[i] = new node;
								}
								id[0]->name = string($1);
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								node *ch1 = new node; 
								id[1] = $2;								
								//id[1]->name = "TOK_LP";
								ch1->name = "TOK_LP";//string($2); 
								id[1]->child.push_back(ch1);
								
								id[2] = $3;
								node *ch2 = new node; 
								id[3]->name = "TOK_RP";
								ch2->name = string($4); 
								id[3]->child.push_back(ch2);
								for(int i=0;i<4;i++){
									interval->child.push_back(id[i]);
								}
								 $$ = interval;
								if(func_table.find(string($1))==func_table.end())
								{
									cout<<"The called function has not been defined previously at lineno "<<line_no+1<<"\n";
									sem_error = true;
								}
								else if(func_param_count[string($1)]!=param_count)
								{
									cout<<"Error at lineno "<<line_no+1<<" The number of parametrs passed are not same as required by the function\n";
									sem_error = true;
								}
								else{
									bool corr = true;	
									it_param = func_param.find(string($1));
									vector<string> v = func_param[string($1)];
									for(int i=0;i<param_count;i++)
									{
										//cout<<v[i]<<" "<<temp[i]<<"\n";
										if(v[i]!=temp[i])
										{
											cout<<"Error at lineno : "<<line_no+1<<" Different types of parameter passed in calling function \""<<string($1)<<"\"\n";
											corr = false;
											sem_error = true;
										}
									}
									$$->type = func_table[string($1)];
									corr = false;
								}
								param_count = 0;
								temp.clear();
							}
             ;
param_func  : p_ID param_func 				{
								param_count++;
								temp.push_back($1->type);
								node *interval = new node;
								node *id1 = new node;
								node *id2 = new node;
								interval->name = "param_func";
								id1 = $1;
								id2 = $2;
								interval->child.push_back($1);
								interval->child.push_back($2);
								 $$ = interval;
							}
            | COMMA p_ID param_func			{
								param_count++;
								temp.push_back($2->type);
								node *interval = new node;
								node *id1 = new node;
								node *id2 = new node;
								
								node *id3 = new node;
								
								id3->name = ",";
								
								
								interval->name = "param_func";
								id1 = $2;
								id2 = $3;
								//interval->child.push_back(id3);
								interval->child.push_back($2);
								interval->child.push_back($3);
								 $$ = interval;
							}
            |						{
								node *interval = new node;
								interval->name = "param_func_end";
								node *ch = new node; 
								ch->name = "Epsilon"; 
								interval->child.push_back(ch);
								 $$ = interval;
							}
	    ;

p_ID	    : ID_ptr					{
								//node *interval = new node;
								$$ = $1;	
							}
	    | TOK_NUMBER				{
								node *interval = new node;
								interval->name = "p_ID";
								node *ch = new node; 
								ch->name = string($1); 
								interval->child.push_back(ch);
								 $$ = interval;
								$$->type = "INT";
							}
            | boolean					{
								$$ = $1;
							}
	    | FLOAT_VAL					{
								node *interval = new node;
								interval->name = "p_ID";
								node *ch = new node; 
								ch->name = string($1); 
								interval->child.push_back(ch);
								 $$ = interval;
								$$->type = "FLOAT";
							}
	    | CHAR_VAL					{
								node *interval = new node;
								interval->name = "p_ID";
								node *ch = new node; 
								ch->name = string($1); 
								interval->child.push_back(ch);
								 $$ = interval;
								$$->type = "CHAR";
							}
	    ;
cmpd_stmt   : LC_c stmtlist Y_rc				{
								//insert a new scope in the table
								
								node *interval = new node;
								node *id1 = new node;
								node *id2 = new node;
								node *id3 = new node;
								interval->name = "cmpd_stmt";
								node *ch = new node; 
								id1->name = "LC";
								//ch->name = string($1); 
								id1->child.push_back(ch);
								id2 = $2;
								id3 = $3;								
								interval->child.push_back(id1);
								interval->child.push_back($2);
								interval->child.push_back($3);								
								 $$ = interval;
							}
            ;
Y_rc	    : RC					{
								//exit the last scope seen
								table.pop_back();
								scope--;
								node *interval = new node;
								interval->name = "Y_rc";
								node *ch = new node; 
								ch->name = string($1); 
								interval->child.push_back(ch);
								 $$ = interval;
							}
            | error					{
								syntax_err = 1;
								printf("Missing '}' at line no.: %d\n",line_no);
							}
            ;
stmtlist    : stmtlist stmt				{
								node *interval = new node;
								interval->name = "stmtlist";
								(interval->child).push_back($1);
								(interval->child).push_back($2);
								 $$ = interval;
							}
            |						{
								node *interval = new node;
								interval->name = "stmtlist";
								node *ch = new node; 
								ch->name = "Epsilon"; 
								interval->child.push_back(ch);
								 $$ = interval;
							}
            ;
cond_stmt   : IF TOK_LP M TOK_RP stmt N			{
								node *interval = new node;
								interval->name = "CONDITION_STMT";
								node **id = new node*[6];
								for(int i=0;i<6;i++)
									id[i] = new node;								
								
								id[0]->name = "IF";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								node *ch1= new node; 
								id[1]->name = "TOK_LP";
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2] = ($3);
								
								
								node *ch3 = new node; 
								id[3]->name = "TOK_RP";
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								
								id[4] = $5;
								id[5] = $6;
								for(int i=0;i<6;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
							}
            ;
N           : FI					{
								node *interval = new node;
								interval->name = "N";
								node *ch = new node; 
								ch->name = string($1); 
								interval->child.push_back(ch);
								 $$ = interval;
								
							}
            | ELSE stmt FI				{
								node *interval = new node;
								node *id1 = new node;
								node *id2 = new node;
								node *id3 = new node;
								interval->name = "N";
								id1->name = "ELSE";
								node *ch = new node; 
								ch->name = string($1); 
								id1->child.push_back(ch);
								id2 = $2;
								
								id3->name = "FI";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id3->child.push_back(ch2);
													
								interval->child.push_back(id1);
								interval->child.push_back($2);
								interval->child.push_back(id3);								
								 $$ = interval;
							}
	    | error					{
								syntax_err = 1;
								printf("Missed a 'fi' at line no.:%d\n",line_no);
							}
            ;   
loop_stmt  : WHILE TOK_LP M TOK_RP stmt 		{		
								node *interval = new node;
								interval->name = "loop_stmt";
								node **id = new node*[6];
								for(int i=0;i<6;i++)
									id[i] = new node;								
								
								id[0]->name = "WHILE";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								node *ch1= new node; 
								id[1]->name = "TOK_LP";
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2] = ($3);
								
								
								node *ch3 = new node; 
								id[3]->name = "TOK_RP";
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								
								id[4] = $5;
								//id[5] = $6;
								for(int i=0;i<5;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
							}	
	   | FOR TOK_LP cond TOK_RP stmt		{
								node *interval = new node;
								interval->name = "loop_stmt";
								node **id = new node*[6];
								for(int i=0;i<6;i++)
									id[i] = new node;								
								//(interval->child).push_back($2);
								//(interval->child).push_back($4);
								id[0]->name = "FOR";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								node *ch1= new node; 
								id[1]->name = "TOK_LP";
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2] = ($3);
								
								
								node *ch3 = new node; 
								id[3]->name = "TOK_RP";
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								
								id[4] = $5;
								//id[5] = $6;
								for(int i=0;i<5;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
							}
           ;
cond 	   : first SEMI second SEMI third		{
								node *interval = new node;
								interval->name = "cond";
								node *id1 = new node;
								node *id2 = new node;
								id1 = $2;
								id2 = $4;
								(interval->child).push_back($1);
								interval->child.push_back(id1);
								(interval->child).push_back($3);
								interval->child.push_back(id2);
								(interval->child).push_back($5);
								 $$ = interval;
							}
           ;
first      : local_declaration				{
								node *interval = new node;
								interval->name = "first";
								
								interval->child.push_back($1);
								 $$ = interval;
							}
	    | ID_ptr ASSIGN M				{
								node *interval = new node;
								interval->name = "ASSIGNMENT";
								node *id1 = new node;
								id1->name = "ASSIGN";
								node *ch = new node; 
								ch->name = string($2); 
								id1->child.push_back(ch);
								(interval->child).push_back($1);
								interval->child.push_back(id1);
								(interval->child).push_back($3);
								 $$ = interval;
								if ($1->type != $3->type)
								{
									cout<<"Wrong assignmetn types at lineno "<<line_no+1<<"\n";
									sem_error = true;
								}
								else
									$$->type = $1->type;
							}
            |						{
								node *interval = new node;
								interval->name = "first";
								node *ch = new node; 
								ch->name = "Epsilon"; 
								interval->child.push_back(ch);
								 $$ = interval;
							}
	    ;
second	   : ID_ptr comp M				{
								node *interval = new node;
								interval->name = "comparison";
								(interval->child).push_back($1);
								(interval->child).push_back($2);
								(interval->child).push_back($3);
								 $$ = interval;
								if ($1->type != $3->type)
								{
									cout<<"Wrong assignmetn types at lineno "<<line_no+1<<"\n";
									sem_error = true;
								}
							}
           |						{
								node *interval = new node;
								interval->name = "second";
								node *ch = new node; 
								ch->name = "Epsilon"; 
								interval->child.push_back(ch);
								 $$ = interval;
							}
	   ;
third      :ID_ptr ASSIGN M				{
								node *interval = new node;
								interval->name = "ASSIGNMENT";
								node *id1 = new node;
								id1->name = "ASSIGN";
								node *ch = new node; 
								ch->name = string($2); 
								id1->child.push_back(ch);
								(interval->child).push_back($1);
								interval->child.push_back(id1);
								(interval->child).push_back($3);
								 $$ = interval;
								if ($1->type != $3->type)
								{
									cout<<"Wrong assignmetn types at lineno "<<line_no+1<<"\n";
									sem_error = true;
								}
							}
           |						{

								node *interval = new node;
								interval->name = "third";
								node *ch = new node; 
								ch->name = "Epsilon"; 
								interval->child.push_back(ch);
								 $$ = interval;
							}
	   ;	


/**Global declarattion!!!!!!*/
global_declaration  : type B				{
								
								//$$ = $2;
								node *interval = new node;
								interval->name = "global_declaration";
								interval->child.push_back($1);
								interval->child.push_back($2);
								
								 $$ = interval;
								int present = findTable($2->child[0]->child[0]->name);
								if(present!=scope)
								{
									mul_type=table[scope][$2->child[0]->child[0]->name] =$1->type;
									//mul_type = id[0]->child[0]->name;
								}
								else{
									cout<<"Error : "<<$2->child[0]->child[0]->name<<" already declared in the scope "<<line_no+1<<"\n";
									sem_error =1;
								}						
							}
	     ;
B	     : ID list1				{
								
								node *interval = new node;
								
								interval->name = "B";
						
								node *i = new node;
								i->name = "ID";
								node *ch = new node; 
								ch->name = string($1); 
								i->child.push_back(ch);
								
								(interval->child).push_back(i);
								(interval->child).push_back($2);
								 $$ = interval;
								int present = findTable(string($1));
								if(present!=scope)
								{
									table[scope][string($1)] =mul_type;
									//mul_type = id[0]->child[0]->name;
								}
								else{
									cout<<"Error : "<<string($1)<<" already declared in the scope "<<line_no+1<<"\n";
									sem_error =1;
								}	
								
							}
	     | ID LB TOK_NUMBER RB list			{
								node *interval = new node;
								interval->name = "B";
								node **id = new node*[6];
								for(int i=0;i<6;i++)
									id[i] = new node;								
								
								id[0]->name = "ID";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1]->name = "LB";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2]->name = "TOK_NUMBER";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								
								id[3]->name = "RB";
								node *ch3 = new node; 
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								
								id[4] = $5;
								//id[5] = $6;
								for(int i=0;i<5;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								int present = findTable(string($1));
								if(present!=scope)
								{
									table[scope][string($1)] =mul_type;
									//mul_type = id[0]->child[0]->name;
								}
								else{
									cout<<"Error : "<<string($1)<<" already declared in the scope "<<line_no+1<<"\n";
									sem_error =1;
								}
							}
	     | ID LB TOK_NUMBER RB			{
								node *interval = new node;
								interval->name = "B";
								node **id = new node*[6];
								for(int i=0;i<6;i++)
									id[i] = new node;								
								
								id[0]->name = "ID";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1]->name = "LB";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2]->name = "TOK_NUMBER";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								
								id[3]->name = "RB";
								node *ch3 = new node; 
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								for(int i=0;i<4;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								int present = findTable(string($1));
								if(present!=scope)
								{
									table[scope][string($1)] =mul_type;
									//mul_type = id[0]->child[0]->name;
								}
								else{
									cout<<"Error : "<<string($1)<<" already declared in the scope "<<line_no+1<<"\n";
									sem_error =1;
								}
							}
             | arr_declare				{
								node *interval = new node;
								interval->name = "B";
								interval->child.push_back($1);
								$$ = $1;
							}
             | ptr_dec list				{
								node *interval = new node;
								interval->name = "B";
								(interval->child).push_back($1);
								(interval->child).push_back($2);
								 $$ = interval;
							}
	     | ptr_dec					{
								node *interval = new node;
								interval->name = "B";
								interval->child.push_back($1);
								 $$ = interval;
							}
	     | ptr list					{
								node *interval = new node;
								interval->name = "B";
								(interval->child).push_back($1);
								(interval->child).push_back($2);
								 $$ = interval;
							}
             | ptr					{
								node *interval = new node;
								interval->name = "B";
								interval->child.push_back($1);
								 $$ = interval;
							}
	     ;
Y1	     : ASSIGN M list1				{
								node *interval = new node;
								interval->name = "Y1";
								node *ch = new node; 
								ch->name = string($1); 
								
								node *id1 = new node;
								id1->name = "ASSIGN";
								
								id1->child.push_back(ch);
								interval->child.push_back(id1);
								(interval->child).push_back($2);
								(interval->child).push_back($3);
								 $$ = interval;
							}
	     |						{
								
								node *interval = new node;
								interval->name = "Y1";
								node *ch = new node; 
								ch->name = "Epsilon"; 
								interval->child.push_back(ch);
								 $$ = interval;
							}
	     ;
list	     :  COMMA ID LB TOK_NUMBER RB list		{
								node *interval = new node;
								interval->name = "list";
								node **id = new node*[6];
								for(int i=0;i<6;i++)
									id[i] = new node;								
								id[0]->name = ",";
																
								id[1]->name = "ID";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								
								
								id[2]->name = "LB";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								
								id[3]->name = "TOK_NUMBER";
								node *ch3 = new node; 
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								
								id[4]->name = "RB";
								node *ch4 = new node; 
								ch4->name = string($5); 
								id[4]->child.push_back(ch4);
								
								id[5] = $6;
								for(int i=0;i<6;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								int present = findTable(string($2));
								if(present!=scope)
								{
									table[scope][string($2)] = mul_type;
								}
								else{
									cout<<"Error at lineno : "<<line_no+1<<" "<<string($2)<<" already declared in the scope\n";
									sem_error = 1;
								}
							}
	     | COMMA ID list1				{
								node *interval = new node;
								interval->name = "list";
								node *id = new node;
								id->name = ",";
								node *id1=new node;							
								id1->name = "ID";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id1->child.push_back(ch1);
								(interval->child).push_back(id);
								(interval->child).push_back(id1);
								(interval->child).push_back($3);
								 $$ = interval;
								int present = findTable(string($2));
								if(present!=scope)
								{
									table[scope][string($2)] = mul_type;
								}
								else{
									cout<<"Error at lineno : "<<line_no+1<<" "<<string($2)<<" already declared in the scope\n";
									sem_error = 1;
								}
							}
	     | COMMA ptr_dec list 			{
								node *interval = new node;
								interval->name = "list";
								node *id = new node;
								id->name = ",";
								(interval->child).push_back(id);
								(interval->child).push_back($2);
								(interval->child).push_back($3);
								 $$ = interval;
							}
	     | COMMA ID LB TOK_NUMBER RB 		{
								node *interval = new node;
								interval->name = "list";
								node **id = new node*[6];
								for(int i=0;i<6;i++)
									id[i] = new node;								
								
								id[0]->name = ",";
																
								id[1]->name = "ID";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								
								
								id[2]->name = "LB";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								
								id[3]->name = "TOK_NUMBER";
								node *ch3 = new node; 
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								
								id[4]->name = "RB";
								node *ch4 = new node; 
								ch4->name = string($5); 
								id[4]->child.push_back(ch4);
								for(int i=0;i<4;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
							}
	     |COMMA ptr_dec				{
	     						node *interval = new node;
								interval->name = "list";
								node *id = new node;
								id->name = ",";
								(interval->child).push_back(id);
								(interval->child).push_back($2);
								 $$ = interval;
							}
	     ;
list1	     :list					{
								node *interval = new node;
								interval->name = "list1";
								interval->child.push_back($1);
								 $$ = interval;
							}
	     | Y1					{
								node *interval = new node;
								interval->name = "list1";
								interval->child.push_back($1);
								 $$ = interval;
							}
	     ;

/*Local declaration */
	 
local_declaration: type loc_B				{
								
								
								node *interval = new node;
								interval->name = "local_declaration";
								interval->child.push_back($1);
								interval->child.push_back($2);
								 $$ = interval;
								
							}
	      ;

loc_B	     : ID loc_list1				{
								node *interval = new node;
								
								interval->name = "loc_B";
						
								node *i = new node;
								i->name = "ID";
								node *ch = new node; 
								ch->name = string($1); 
								i->child.push_back(ch);
								
								(interval->child).push_back(i);
								(interval->child).push_back($2);
								 $$ = interval;
								int present = findTable(string($1));//cout<<present<<"\n";
								if(present != scope)
								{
									//cout<<scope<<"\n";
									table[scope][string($1)] = mul_type;//$1->child[0]->child[0]->name;
									//cout<<"Done\n";
								}
								else{
									cout<<"Error : "<<string($1)<<" already declared in the scope "<<line_no+1<<"\n";
									sem_error = true;
								}
							}
	     | ID LB TOK_NUMBER RB loc_list		{
								node *interval = new node;
								interval->name = "loc_B";
								node **id = new node*[6];
								for(int i=0;i<6;i++)
									id[i] = new node;								
								id[0]->name = "ID";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1]->name = "LB";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2]->name = "TOK_NUMBER";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								
								id[3]->name = "RB";
								node *ch3 = new node; 
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								
								id[4] = $5;
				
								for(int i=0;i<5;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								int present = findTable(string($1));//cout<<present<<"\n";
								if(present != scope)
								{
									//cout<<scope<<"\n";
									table[scope][string($1)] = mul_type;//$1->child[0]->child[0]->name;
									//cout<<"Done\n";
								}
								else{
									cout<<"Error : "<<string($1)<<" already declared in the scope "<<line_no+1<<"\n";
									sem_error = true;
								}
							}
	     | ID LB TOK_NUMBER RB			{
								node *interval = new node;
								interval->name = "local_declaration";
								node **id = new node*[6];
								for(int i=0;i<6;i++)
									id[i] = new node;								
								id[0]->name = "ID";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								id[1]->name = "LB";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2]->name = "TOK_NUMBER";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								
								id[3]->name = "RB";
								node *ch3 = new node; 
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								for(int i=0;i<4;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								int present = findTable(string($1));//cout<<present<<"\n";
								if(present != scope)
								{
									cout<<scope<<"\n";
									table[scope][string($1)] = mul_type;//$1->child[0]->child[0]->name;
									cout<<"Done\n";
								}
								else{
									cout<<"Error : "<<string($1)<<" already declared in the scope "<<line_no+1<<"\n";
									sem_error = true;
								}
							}
             | arr_declare				{
								node *interval = new node;
								interval->name = "loc_B";
								interval->child.push_back($1);
								$$ = $1;
							}
	     | ptr_dec loc_list				{
								node *interval = new node;
								interval->name = "loc_B";
								(interval->child).push_back($1);
								(interval->child).push_back($2);
								 $$ = interval;	
							}
	     | ptr_dec					{
								node *interval = new node;
								interval->name = "loc_B";
								interval->child.push_back($1);
								 $$ = interval;
							}
	     | ptr loc_list				{
								node *interval = new node;
								interval->name = "loc_B";
								(interval->child).push_back($1);
								(interval->child).push_back($2);
								 $$ = interval;
							}
             | ptr					{
								node *interval = new node;
								interval->name = "loc_B";
								interval->child.push_back($1);
								 $$ = interval;
							}
	     ;
loc_Y1	     : ASSIGN M loc_list1			{
								node *interval = new node;
								interval->name = "loc_Y1";
								node *ch = new node; 
								ch->name = string($1); 
								
								node *id1 = new node;
								id1->name = "ASSIGN";
								
								id1->child.push_back(ch);
								interval->child.push_back(id1);
								(interval->child).push_back($2);
								(interval->child).push_back($3);
								 $$ = interval;
								if($2->type != mul_type)
								{
									cout<<"Wrong type initialisation in lineno "<<line_no+1<<"\n";
									sem_error = true;
								}
							}
			|{
								
								node *interval = new node;
								interval->name = "Y1";
								node *ch = new node; 
								ch->name = "Epsilon"; 
								interval->child.push_back(ch);
								 $$ = interval;
							}
			
	     ;
loc_list     :  COMMA ID_array_dec loc_list			{
								node *interval = new node;
								interval->name = "loc_list";
								node *id = new node;
								id->name = ",";
								(interval->child).push_back(id);
								(interval->child).push_back($2);
								(interval->child).push_back($3);
								 $$ = interval;
								
							}
	     | COMMA ID loc_Y1				{
								node *interval = new node;
								interval->name = "loc_list";
								node *id1 = new node;
								id1->name = ",";
								(interval->child).push_back(id1);
								node *id = new node;
								id->name = "ID";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								(interval->child).push_back(id);
								(interval->child).push_back($3);
								 $$ = interval;
								int present = findTable(string($2));
								if(present == scope)
								{
									cout<<"Error : "<<string($2)<<" Already declared in the scope at lineno"<<line_no+1<<"\n";
									sem_error = true;
								}
								else{
									table[scope][string($2)] = mul_type;
								}
							}
	     | COMMA ptr_dec loc_list  			{
								
								node *interval = new node;
								interval->name = "loc_list";
								node *id1 = new node;
								id1->name = ",";
								(interval->child).push_back(id1);
								(interval->child).push_back($2);
								(interval->child).push_back($3);
								 $$ = interval;
							}
	     | COMMA ID LB TOK_NUMBER RB 		{
								node *interval = new node;
								interval->name = "loc_list";
								node **id = new node*[6];
								for(int i=0;i<6;i++)
									id[i] = new node;								
								id[0]->name = ",";
																
								id[1]->name = "ID";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								
								
								id[2]->name = "LB";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								
								id[3]->name = "TOK_NUMBER";
								node *ch3 = new node; 
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								
								id[4]->name = "RB";
								node *ch4 = new node; 
								ch4->name = string($5); 
								id[4]->child.push_back(ch4);
								for(int i=0;i<4;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
							}
	     |COMMA ptr_dec				{
								node *interval = new node;
								interval->name = "loc_list";
								node *id = new node;
								id->name = ",";
								(interval->child).push_back(id);
								(interval->child).push_back($2);
								 $$ = interval;
							}
	     ;
loc_list1     :loc_list					{
								node *interval = new node;
								interval->name = "loc_list1";
								interval->child.push_back($1);
								 $$ = interval;
							}
	     | loc_Y1					{
								node *interval = new node;
								interval->name = "loc_list1";
								interval->child.push_back($1);
								 $$ = interval;
							}
	     ;
/*Local declaration done*/

/*array*/

arr_declare  :ID LB RB ASSIGN LC value1 values RC	{
								node *interval = new node;
								interval->name = "ARRAY_DECL";
								node **id = new node*[8];
								for(int i=0;i<8;i++)
									id[i] = new node;
								id[0]->name = "ID";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
																
								id[1]->name = "LB";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								
								
								id[2]->name = "RB";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								
								id[3]->name = "ASSIGN";
								node *ch3 = new node; 
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								
								id[4]->name = "LC";
								node *ch4 = new node; 
								ch4->name = string($5); 
								id[4]->child.push_back(ch4);
								id[5] = $6;
								id[6] = $7;
								id[7]->name = "RC";
								node *ch5 = new node; 
								ch5->name = string($8); 
								id[7]->child.push_back(ch5);
								for(int i=0;i<8;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
								int present = findTable(string($1));
								if(present == scope)
								{
									cout<<"Error : The identifier "<<string($1)<<" already declared in the scope "<<line_no+1<<"\n";
									sem_error = true;
								}
								else{
									table[scope][string($1)] = mul_type;
								}
							}
            ;
values      : COMMA value1 values 			{
								node *interval = new node;
								interval->name = "values";
								node *id = new node;
								id->name = ",";
								(interval->child).push_back(id);
								(interval->child).push_back($2);
								(interval->child).push_back($3);
								 $$ = interval;
							}
	    |						{
								node *interval = new node;
								interval->name = "values";
								node *ch = new node; 
								ch->name = "Epsilon"; 
								interval->child.push_back(ch);
								
								 $$ = interval;
							}
	    ;
value1      : TOK_NUMBER				{
								node *interval = new node;
								interval->name = "value1";
								node *ch = new node; 
								ch->name = string($1); 
								interval->child.push_back(ch);
								 $$ = interval;
							}
            | boolean					{
								node *interval = new node;
								interval->name = "value1";
								
								interval->child.push_back($1);
								 $$ = interval;
							}
	    | FLOAT_VAL					{
								node *interval = new node;
								interval->name = "value1";
								node *ch = new node; 
								ch->name = string($1); 
								interval->child.push_back(ch);
								 $$ = interval;
							}
	    | CHAR_VAL					{
								node *interval = new node;
								interval->name = "value1";
								node *ch = new node; 
								ch->name = string($1); 
								interval->child.push_back(ch);
								 $$ = interval;
							}
	    ;
/*pointers!!!! */
ptr_dec	   : ptr ASSIGN ptr_y				{
								node *interval = new node;
								interval->name = "ptr_dec";
								(interval->child).push_back($1);	
								node *id = new node;
								id->name = "ASSIGN";
								node *ch = new node; 
								ch->name = "="; 
								id->child.push_back(ch);
								interval->child.push_back(id);
								(interval->child).push_back($3);
								 $$ = interval;
							}
	   ;
ptr_y      : ID_array					{
								node *interval = new node;
								interval->name = "ptr_y";
								
								interval->child.push_back($1);
								$$ = $1;
							}
           | AMPER ID_array				{
								node *interval = new node;
								interval->name = "ptr_y";
								node *id = new node;
								id->name = "AMPER";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								(interval->child).push_back(id);
								(interval->child).push_back($2);
								$$ = $2;
								
							}
	   ;
ptr	   : TOK_LP TOK_TIMES ID_array TOK_RP		{
								node *interval = new node;
								interval->name = "ptr";
								node **id = new node*[8];
								for(int i=0;i<8;i++)
									id[i] = new node;								
								
								id[0]->name = "TOK_LP";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								node *ch1= new node; 
								id[1]->name = "TOK_TIMES";
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								id[2] = ($3);
								
								
								node *ch3 = new node; 
								id[3]->name = "TOK_RP";
								ch3->name = string($4); 
								id[3]->child.push_back(ch3);
								
								
								for(int i=0;i<4;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
							}
	   | TOK_LP TOK_TIMES TOK_LP ID_array TOK_PLUS H TOK_RP TOK_RP	{
										node *interval = new node;
								interval->name = "ptr";
								node **id = new node*[8];
								for(int i=0;i<8;i++)
									id[i] = new node;								
								id[0]->name = "TOK_LP";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								node *ch1= new node; 
								id[1]->name = "TOK_TIMES";
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								
								id[2]->name = "TOK_LP";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								
								id[3] = ($4);
								
								
								node *ch3 = new node; 
								id[4]->name = "TOK_PLUS";
								ch3->name = string($5); 
								id[4]->child.push_back(ch3);
								
								id[5] = $6;
								
								node *ch4 = new node; 
								id[6]->name = "TOK_RP";
								ch4->name = string($7); 
								id[6]->child.push_back(ch4);
								
								node *ch6 = new node; 
								id[7]->name = "TOK_RP";
								ch6->name = string($8); 
								id[7]->child.push_back(ch6);
								
								
								for(int i=0;i<8;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
									}
           | TOK_LP TOK_TIMES TOK_LP ID_array TOK_MINUS H TOK_RP TOK_RP {
										node *interval = new node;
								interval->name = "ptr";
								node **id = new node*[8];
								for(int i=0;i<8;i++)
									id[i] = new node;								
								id[0]->name = "TOK_LP";
								node *ch = new node; 
								ch->name = string($1); 
								id[0]->child.push_back(ch);
								
								node *ch1= new node; 
								id[1]->name = "TOK_TIMES";
								ch1->name = string($2); 
								id[1]->child.push_back(ch1);
								
								
								id[2]->name = "TOK_LP";
								node *ch2 = new node; 
								ch2->name = string($3); 
								id[2]->child.push_back(ch2);
								
								id[3] = ($4);
								
								
								node *ch3 = new node; 
								id[4]->name = "TOK_MINUS";
								ch3->name = string($5); 
								id[4]->child.push_back(ch3);
								
								id[5] = $6;
								
								node *ch4 = new node; 
								id[6]->name = "TOK_RP";
								ch4->name = string($7); 
								id[6]->child.push_back(ch4);
								
								node *ch6 = new node; 
								id[7]->name = "TOK_RP";
								ch6->name = string($8); 
								id[7]->child.push_back(ch6);
								for(int i=0;i<8;i++)
									interval->child.push_back(id[i]);
								 $$ = interval;
							}
           ;
H          : ID_array					{
								node *interval = new node;
								interval->name = "H";
								interval->child.push_back($1);
								 $$ = interval;
								$$->type = $1->type;
							}
           | TOK_NUMBER					{
								node *interval = new node;
								interval->name = "H";
								node *ch = new node; 
								ch->name = string($1); 
								interval->child.push_back(ch);
								 $$ = interval;
								$$->type = "INT";
							}
	   ;


type         : INT					{
								node *interval = new node;
								interval->name = "type";
								//(interval->child).push_back();
								node *id = new node; 
								id->name = "INT";//string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
								mul_type=$$->type = "INT";
								
							}
	     | FLOAT					{
								node *interval = new node;
								interval->name = "type";
								//(interval->child).push_back();
								node *id = new node; 
								id->name = "FLOAT";//string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
								mul_type=$$->type = "FLOAT";
							}
	     | CHAR					{	
								node *interval = new node;
								interval->name = "type";
								//(interval->child).push_back();
								node *id = new node; 
								id->name = "CHAR";//string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
								mul_type=$$->type = "CHAR";
							}
	     | BOOL					{
								node *interval = new node;
								interval->name = "type";
								//(interval->child).push_back();
								node *id = new node; 
								id->name = "BOOL";//string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
								mul_type=$$->type = "BOOL";
							}
	     ;
	     
	     
	     
	     
	     
	     
	     
expr        : Rval					{
								node *interval = new node;
								interval->name = "expr";
								interval->child.push_back($1);
								 $$ = interval;
								$$->type = $1->type;
							}
	    
	
	    ;

//here is arithmetic expression

Rval 	    : Rval comp art_exp				{
								node *interval = new node;
								interval->name = "comparison";
								(interval->child).push_back($1);
								(interval->child).push_back($2);
								(interval->child).push_back($3);
								 $$ = interval;
								if($1->type!=$3->type)
								{
									cout<<"Comparison between unmatching types at lineno "<<line_no+1<<"\n";
									sem_error = false;
								}
								else{
									$$->type = "BOOL";
								}
							}
	    | art_exp					{
								node *interval = new node;
								interval->name = "Rval";
								interval->child.push_back($1);
								 $$ = interval;
								$$->type = $1->type;
							}
	    | NOT art_exp				{
								node *interval = new node;
								node *id = new node;
								interval->name = "Rval";
								id->name = "NOT";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								
								interval->child.push_back(id);
								interval->child.push_back($2);
								 $$ = interval;
								if($2->type!="BOOL")
								{
									cout<<"The NOT argument is not boolean in lineno "<<line_no+1<<"\n";
									sem_error = true;
								}
								else{
									$$->type = "BOOL";	
								}
							}
	    ;

comp	    : 		REQUALS 			{
								node *interval = new node;
								interval->name = "comp";
								node *id = new node; 
								id->name = string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
							}
			| LESS				{
								node *interval = new node;
								interval->name = "comp";
								node *id = new node; 
								id->name = string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
							}
			| GREATER			{
								node *interval = new node;
								interval->name = "comp";
								node *id = new node; 
								id->name = string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
							}
			| LESSEQ 			{
								node *interval = new node;
								interval->name = "comp";
								node *id = new node; 
								id->name = string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
							}
			| GREATEREQ 			{
								node *interval = new node;
								interval->name = "comp";
								node *id = new node; 
								id->name = string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
							}
			| NOTEQUAL			{
								node *interval = new node;
								interval->name = "comp";
								node *id = new node; 
								id->name = string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
							}
			| AND				{
								node *interval = new node;
								interval->name = "comp";
								node *id = new node; 
								id->name = string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
							}
			| OR 				{
								node *interval = new node;
								interval->name = "comp";
								node *id = new node; 
								id->name = string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
							}
			;

art_exp     :art_exp TOK_PLUS term          		{
								node *interval = new node;
								interval->name = "art_exp_plus";
								(interval->child).push_back($1);
								node *id = new node;
								id->name = "TOK_PLUS_ASSN";
								node *ch = new node; 
								ch->name = string($2); 
								id->child.push_back(ch);
								interval->child.push_back(id);
								(interval->child).push_back($3);
								 $$ = interval;
								if($1->type != $3->type)
								{
									cout<<"Addition between unmatching types in lineno "<<line_no+1<<"\n";
									sem_error = true;
								}
								else{
									$$->type = $1->type;
								}	
							}
            | art_exp TOK_MINUS term			{
								node *interval = new node;
								interval->name = "art_exp_minus";
								(interval->child).push_back($1);
								node *id = new node;
								id->name = "TOK_MINUS_ASSN";
								node *ch = new node; 
								ch->name = string($2); 
								id->child.push_back(ch);
								interval->child.push_back(id);
								(interval->child).push_back($3);
								 $$ = interval;
								if($1->type != $3->type)
								{
									cout<<"Subtraction between unmatching types in lineno "<<line_no+1<<"\n";
									sem_error = true;
								}
								else{
									$$->type = $1->type;
								}	
								
							}	
            | term                 			{
								node *interval = new node;
								interval->name = "comp";								 
								interval->child.push_back($1); 
								 $$ = interval;
								$$->type = $1->type;
							}
	    ;

term        : factor TOK_TIMES term        		{
								node *interval = new node;
								interval->name = "term_times";
								(interval->child).push_back($1);
								node *id = new node;
								id->name = "TOK_TIMES_ASSN";
								node *ch = new node; 
								ch->name = string($2); 
								id->child.push_back(ch);
								interval->child.push_back(id);
								(interval->child).push_back($3);
								 $$ = interval;
								if($1->type != $3->type)
								{
									cout<<"Multiplication between unmatching types in lineno "<<line_no+1<<"\n";
									sem_error = true;
								}
								else{
									$$->type = $1->type;
								}							
							}
            | factor TOK_DIVIDE term			{
								node *interval = new node;
								interval->name = "term_div";
								(interval->child).push_back($1);
								node *id = new node;
								id->name = "TOK_DIVIDE";
								node *ch = new node; 
								ch->name = string($2); 
								id->child.push_back(ch);
								interval->child.push_back(id);
								(interval->child).push_back($3);
								 $$ = interval;
								if($1->type != $3->type)
								{
									cout<<"Division between unmatching types in lineno "<<line_no+1<<"\n";
									sem_error = true;
								}
								else{
									$$->type = $1->type;
								}				
							}
	    | factor               			{
								node *interval = new node;
								interval->name = "term";								 
								interval->child.push_back($1); 
								 $$ = interval;
								$$->type = $1->type;
							}
	;
factor      : TOK_LP art_exp TOK_RP   			{
								node *interval = new node;
								interval->name = "factor";
						       node *id = new node;
								id->name = "TOK_LP";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								(interval->child).push_back(id);
								interval->child.push_back($2);
								node *id1 = new node;
								id1->name = "TOK_RP";
								node *ch1 = new node; 
								ch1->name = string($3); 
								id1->child.push_back(ch1);
								(interval->child).push_back(id1);
								 $$ = interval;
								$$->type = $2->type;		
							}
	    | TOK_PLUS factor  				{
								node *interval = new node;
								interval->name = "factor";
								 node *id = new node;
								id->name = "TOK_PLUS";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								(interval->child).push_back(id);
								(interval->child).push_back($2);
								 $$ = interval;
								$$->type = $2->type;
								
							}
	    | TOK_MINUS factor  			{
								node *interval = new node;
								interval->name = "factor";
								 node *id = new node;
								id->name = "TOK_MINUS";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								(interval->child).push_back(id);
								(interval->child).push_back($2);
								 $$ = interval;
								$$->type = $2->type;
							}
            | TOK_NUMBER				{
								node *interval = new node;
								interval->name = "factor_NUMBER";
								node *id = new node; 
								id->name = string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
								$$->type = "INT";
							}
            | boolean					{
								node *interval = new node;
								interval->name = "factor";
								
								interval->child.push_back($1); 
								 $$ = interval;
								$$->type = "BOOL";
							}
            | FLOAT_VAL 				{
								node *interval = new node;
								interval->name = "factor_NUMBER";
								node *id = new node; 
								id->name = string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
								$$->type = "FLOAT";
							}
	    | ID_ptr         				{
								node *interval = new node;
								interval->name = "factor";
								
								interval->child.push_back($1); 
								 $$ = interval;
								$$->type = $1->type;
							}
	    | CHAR_VAL					{
								node *interval = new node;
								interval->name = "factor_NUMBER";
								node *id = new node; 
								id->name = string($1); 
								interval->child.push_back(id); 
								 $$ = interval;
								$$->type = "CHAR";
							}
             ;
/* I/O statements..*/

io_stmt     : input SEMI				{
								
								node *interval = new node;
								interval->name = "io_stmt";
								interval->child.push_back($1);
								interval->child.push_back($2);
								 $$ = interval;
							}
	    | output SEMI				{
								node *interval = new node;
								interval->name = "io_stmt";
								interval->child.push_back($1);
								
								interval->child.push_back($2);
								 $$ = interval;
							}
	    ;
input	    : IN d_in					{
								node *interval = new node;
								interval->name = "input";
								node *id = new node;
								id->name = "IN";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								(interval->child).push_back(id);
								(interval->child).push_back($2);
								 $$ = interval;
							}
	     ;
d_in	    : INPUT ID_ptr d_in				{
								node *interval = new node;
								interval->name = "d_in";
								node *id = new node;
								id->name = "INPUT";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								(interval->child).push_back(id);
								(interval->child).push_back($2);
								(interval->child).push_back($3);
								 $$ = interval;
							}
	     | INPUT ID_ptr				{
								node *interval = new node;
								interval->name = "d_in";
								node *id = new node;
								id->name = "INPUT";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								(interval->child).push_back(id);
								(interval->child).push_back($2);
								 $$ = interval;
							}
	     ;
output 	     : OUT d_out				{
								node *interval = new node;
								interval->name = "output";
								node *id = new node;
								id->name = "OUT";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								(interval->child).push_back(id);
								(interval->child).push_back($2);
								 $$ = interval;
							}
	     ;
d_out	     : OUTPUT STRING d_out			{
								node *interval = new node;
								interval->name = "d_out";
								node *id = new node;
								id->name = "OUTPUT";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								node *id1 = new node;
								id1->name = "STRING";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id->child.push_back(ch1);
								(interval->child).push_back(id);
								(interval->child).push_back(id1);
								(interval->child).push_back($3);
								 $$ = interval;
							}
	     | OUTPUT ID_ptr d_out			{
								node *interval = new node;
								interval->name = "d_out";
								node *id = new node;
								id->name = "OUTPUT";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								(interval->child).push_back(id);
								(interval->child).push_back($2);
								(interval->child).push_back($3);
								 $$ = interval;
							}		
	     | OUTPUT ENDL d_out			{
								node *interval = new node;
								interval->name = "d_out";
								node *id = new node;
								id->name = "OUTPUT";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								node *id1 = new node;
								id1->name = "ENDL";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id->child.push_back(ch1);
								(interval->child).push_back(id);
								(interval->child).push_back(id1);
								(interval->child).push_back($3);
								 $$ = interval;
							}
	     | OUTPUT STRING				{
								node *interval = new node;
								interval->name = "d_out";
								node *id = new node;
								id->name = "OUTPUT";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								node *id1 = new node;
								id1->name = "STRING";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id->child.push_back(ch1);
								(interval->child).push_back(id);
								(interval->child).push_back(id1);
				
								 $$ = interval;
							}
	     | OUTPUT ID_ptr				{
								node *interval = new node;
								interval->name = "d_out";
								node *id = new node;
								id->name = "OUTPUT";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								(interval->child).push_back(id);
								(interval->child).push_back($2);
								 $$ = interval;
							}
	     | OUTPUT ENDL				{
								node *interval = new node;
								interval->name = "d_out";
								node *id = new node;
								id->name = "OUTPUT";
								node *ch = new node; 
								ch->name = string($1); 
								id->child.push_back(ch);
								node *id1 = new node;
								id1->name = "ENDL";
								node *ch1 = new node; 
								ch1->name = string($2); 
								id->child.push_back(ch1);
								(interval->child).push_back(id);
								(interval->child).push_back(id1);
				
								 $$ = interval;
							}

%%

/////code generating part... for 3rd assignment

string label()
{
	stringstream s;
	s << pre_label;
	pre_label++;
	string lab = "label" + s.str() + ":"; // label of the called 
	return lab;
}
string regist()
{
	stringstream s;
	s<<reg_str;
	reg_str++;
	return "r"+s.str();
}
string codegen(node *ptr)
{
	ofstream fout;
	fout.open("in.txt",ios::app);
	string s="";
	string one="";
		string two = "";
	string expr = "";
	if(ptr==NULL)
		return "";
	if(ptr->name == "FUNCTION")
	{
		one = "";
		two = "";	
		int count = 1;
		
		//parameter.clear();
		while(!parameter.empty())
		{
			parameter.pop();
		}		
		
		codegen(ptr->child[3]);
		cout<<"__def "<<ptr->child[1]->name<<":\n";
		codegen_file.close();
		codegen_file.open("other.txt",ios::app);
		codegen_file<<"__def "<<ptr->child[1]->name<<":\n";
		//whatever parameters are passed print it in the func definition
		stringstream y;
		y<<ptr->scp;
		while(!parameter.empty())
		{
			stringstream t;
			t<<count;
			one = parameter.front()+y.str();
			parameter.pop();
			two = ptr->child[1]->name + "label"+t.str();
			cout<<one<<" = "<<two<<"\n";
			codegen_file<<one<<" = "<<two<<"\n";
			count++;
		}
		codegen(ptr->child[5]);
		one = codegen(ptr->child[5]->child[0]->child[3]);
		cout<<"res = "<<one<<"\n";
		codegen_file<<"res = "<<one<<"\n";
		cout<<"func_end\n";
		codegen_file<<"func_end\n";
		codegen_file.close();
		codegen_file.open("codegen.txt",ios::app);
		return "";
	}
	else if(ptr->name == "param_list")
	{
		parameter.push(ptr->child[1]->child[0]->name);
		codegen(ptr->child[2]);
		return "";
	}
	else if(ptr->name == "cmpd_stmt")
	{
		//addition of scope in this area as we encounter a '{'
		codegen(ptr->child[1]);
		return "";
		
	}
	else if(ptr->name == "CONDITION_STMT")
	{
		//a label is required for IF and another label is required if we get else
		expr = codegen(ptr->child[2]);
		bool falseLabel = true;
		if((ptr->child[5])->child.size()!=1)
		{
			//else is required
			falseLabel = true;
		}	
		string if_label = label();
		string else_label;
		string nextlabel;
		cout<<"if "<<expr<<" goto "<<if_label<<"\n";
		codegen_file<<"if "<<expr<<" goto "<<if_label<<"\n";
		if(falseLabel)
		{
			else_label = label();
			nextlabel = label();
			cout<<"goto "<<else_label<<"\n";
			codegen_file<<"goto "<<else_label<<"\n";
		}
		cout<<if_label<<"\n";
		codegen_file<<if_label<<"\n";
		codegen(ptr->child[4]);
		cout<<"goto "<<nextlabel<<"\n";
		codegen_file<<"goto "<<nextlabel<<"\n";
		if(falseLabel)
		{
			cout<<else_label<<"\n";
			codegen_file<<else_label<<"\n";
			codegen((ptr->child[5])->child[1]); // writes the function for the else part of the code
		}
		cout<<nextlabel<<"\n";
		codegen_file<<nextlabel<<"\n";
		return "";
	}
	else if(ptr->name == "loop_stmt")
	{
		//first print the initial condition in case of for loop and then go for checking the expressions
		string loop_label = label();
		loop_check = true;
				
		if(ptr->child[0]->name == "FOR")
		{
			//print the initial condition
			//cout<<"I am here"<<"\n";			
			codegen((ptr->child[2])->child[0]);
			expr = codegen((ptr->child[2])->child[2]);
		}
		else{
			expr = codegen(ptr->child[2]);
		}
		cout<<loop_label<<" ";
		codegen_file<<loop_label<<" ";
		one = a.str();
		//string expr = codegen(ptr->child[2]);
		string loop_body = label();
		string loop_exit = label();
		cout<<"if "<<expr<<" goto "<<loop_body<<"\n";
		cout<<"goto "<<loop_exit<<"\n";
		codegen_file<<"if "<<expr<<" goto "<<loop_body<<"\n";
		codegen_file<<"goto "<<loop_exit<<"\n";
		
		cout<<loop_body<<"\n";
		codegen_file<<loop_body<<"\n";
		if(ptr->child[0]->name == "FOR")
		{
			codegen(ptr->child[2]->child[4]);
		}
		codegen(ptr->child[4]);
		cout<<one;
		codegen_file<<one;
		cout<<" goto "<<loop_label<<"\n";
		cout<<loop_exit<<"\n";
		codegen_file<<" goto "<<loop_label<<"\n";
		codegen_file<<loop_exit<<"\n";
		loop_check = false;
		return "";
	}
	else if(ptr->name == "func_call")
	{
		// function call stmt
		param_count=0;
		func_name = ptr->child[0]->child[0]->name; // recorind which function has been called
		//cout<<"2\n";		
		codegen(ptr->child[2]);
		//cout<<"1\n";
		//cout<<"refparam result\n";
		cout<<"call "<<ptr->child[0]->name<<": ,"<<param_count<<"\n";
		codegen_file<<"call "<<ptr->child[0]->name<<": ,"<<param_count<<"\n";

		//ac_record needs to be updated for this function... insert in the queue for the function the parameters that is passed
		
		return "result";
	}
	else if(ptr->name == "param_func")
	{
		//push into the queue of records the variables of the function
		
		//
		stringstream x;
		param_count++;
		x<<param_count;
		string m = codegen(ptr->child[0]);
		//it_rec->second.push(m);
		cout<<"param "<<m<<"\n";
		one = func_name+"label"+x.str();
		two = m;
		cout<<one<<" = "<<two<<"\n";
		codegen_file<<one<<" = "<<two<<"\n";
		codegen_file<<"param "<<m<<"\n";
		codegen(ptr->child[1]);
		return "";
	}
	else if(ptr->name == "ASSIGNMENT")
	{
		//cout<<"HI\n";
		string m = codegen(ptr->child[0]);
		string m1 = codegen(ptr->child[2]);
		cout<<m<<"="<<m1<<"\n";
		codegen_file<<m<<"="<<m1<<"\n";
		return "";
	}
	else if(ptr->name== "factor_NUMBER")
	{
		return ptr->child[0]->name;
	}
	else if(ptr->name == "ID_array_ID" || ptr->name == "ID" || ptr->name == "p_ID")
	{
		stringstream s;
		s<<ptr->scp;
		return ptr->child[0]->name + s.str();
	}
	else if(ptr->name == "term_times")
	{
		string first = codegen(ptr->child[0]);
		string second = codegen(ptr->child[2]);
		string reg = regist();
		cout<<reg<<"="<<first<<"*"<<second<<"\n";
		codegen_file<<reg<<"="<<first<<"*"<<second<<"\n";
		return reg;
	}
	else if(ptr->name == "art_exp_plus")
	{
		string first = codegen(ptr->child[0]);
		string second = codegen(ptr->child[2]);
		string reg = regist();
		cout<<reg<<"="<<first<<"+"<<second<<"\n";
		codegen_file<<reg<<"="<<first<<"+"<<second<<"\n";
		return reg;
	}
	else if(ptr->name == "art_exp_minus")
	{
		string first = codegen(ptr->child[0]);
		string second = codegen(ptr->child[2]);
		string reg = regist();
		cout<<reg<<"="<<first<<"-"<<second<<"\n";
		codegen_file<<reg<<"="<<first<<"-"<<second<<"\n";
		return reg;
	}
	else if(ptr->name == "term_div")
	{
		string first = codegen(ptr->child[0]);
		string second = codegen(ptr->child[2]);
		string reg = regist();
		cout<<reg<<"="<<first<<"/"<<second<<"\n";
		codegen_file<<reg<<"="<<first<<"/"<<second<<"\n";
		return reg;
	}
	else if(ptr->name == "comparison")
	{
		a.str("");
	    string first = codegen(ptr->child[0]);
		string second = codegen(ptr->child[2]);
		string reg = regist();
		cout<<reg<<"="<<first<<" "<<ptr->child[1]->child[0]->name<<" "<<second<<"\n";
		codegen_file<<reg<<"="<<first<<" "<<ptr->child[1]->child[0]->name<<" "<<second<<"\n";
		a<<reg<<"="<<first<<" "<<ptr->child[1]->child[0]->name<<" "<<second<<"\n";
		return reg;
		
	}
	else if(ptr->name == "d_out")
	{
		//print the generating code for printing
		node *temp;
		if(ptr->child[1]->name =="ID_array_ID")
		{
			temp = ptr->child[1];
			if(temp->type == "INT")
			{
			    stringstream s;
				s<<temp->scp;
				cout<<"print "<<temp->type<<" "<<temp->child[0]->name<<s.str()<<"\n";
				cout<<"print endl\n";
				codegen_file<<"print "<<temp->type<<" "<<temp->child[0]->name<<s.str()<<"\n";
				codegen_file<<"print endl\n";
				
			}
			else if(temp->type == "BOOL")
			{
			    stringstream s;
				s<<temp->scp;
				cout<<"print "<<temp->type<<" "<<temp->child[0]->name<<s.str()<<"\n";
				cout<<"print endl\n";
				codegen_file<<"print "<<temp->type<<" "<<temp->child[0]->name<<s.str()<<"\n";
				codegen_file<<"print endl\n";
				
			}
			else{}
		}
		for(int i=2;i<ptr->child.size();i++)
			codegen(ptr->child[i]);
		return "";
	}
	else if(ptr->name == "d_in")
	{
		//print the generating code for printing
		node *temp;
		
			temp = ptr->child[1];
			stringstream s;
			s<<temp->scp;
			cout<<"input "<<temp->child[0]->name<<s.str()<<"\n";
			codegen_file<<"input "<<temp->child[0]->name<<s.str()<<"\n";
		
		for(int i=2;i<ptr->child.size();i++)
			codegen(ptr->child[i]);
		return "";
	}
	else if(ptr->name == "M"){
		codegen(ptr->child[0]);
		return "__res";
	}
	else{
		string st="";
		if(ptr->child.size()==1){
			st = codegen(ptr->child[0]);
			//cout<<st<<" "<<ptr->name<<"\n";	
			return st ;
		}		
		else{
			for(int i=0;i<ptr->child.size();i++)
				codegen(ptr->child[i]);
			return "";		
		}
	}
}	
