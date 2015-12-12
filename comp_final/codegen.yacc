%{
/*error for SEMI , RC, fi, return*/
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <map>
#include <sstream>

using namespace std;

map<string,int>count_map;

int find_cnt(char*a);
extern int yylex(void);
extern int yyparse(void);
	//extern int yylineno ;
	//extern int line_no;
	//extern char* yytext ;
extern FILE* yyin;
#define YYSTYPE char*
void yyerror(const char *s) {
	fprintf(stdout, "Error at Line no.");
}
int flag=0;
int param_flag=0;
int yywrap()
{
  return 1;
}

FILE* tmp;
extern char *yytext;
int labelcount=0;
string getlabel();
%}

%start line
%token NUM ID EQUAL BIN_OP PLUS MINUS TIMES DIVIDE SMALLER SMALLEREQ GREATER GREATEREQ EQEQ GOTO IF LABEL AND PARAM COMMA CALL RETURN DEF _RES INT PRINT ENDL BOOL INPUT


%%


line:				line exp 
					|
					;
		
exp					:binary_op
					|label1
					|cond_jmp
					|uncond_jmp
					|assign
					|parameter
					|return_stmt
					|func_call
					|func_def
					|print_stmt
					|input_stmt
					;
		
binary_op:			id EQUAL id_num bin_operators id_num

						{
							if(strcmp($4,"+")==0){
								int off = find_cnt($3);
								cout<<off<<endl;
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",$3);
																		
								}
								else{
									cout<<"in first else"<<endl;
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								// store the first operand in the stack
								cout<<"aa gaya 1"<<endl;
								fprintf(tmp,"sw $a0 0($sp)\n");
								// increase the stack ptr
								fprintf(tmp,"addiu $sp $sp -4\n");
								cout<<"aa gaya 1"<<endl;	
								// for the second operand
								off = find_cnt($5);
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",$5);
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								
								fprintf(tmp,"lw $t1 4($sp)\n");
								fprintf(tmp,"add $a0 $a0 $t1\n");
								fprintf(tmp,"addiu $sp $sp 4\n");
								
								// store the result(in acc)in the stack loc corresponding to  ID 
								off = find_cnt($1);
								fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
							}
							else if(strcmp($4,"-")==0){
								int off = find_cnt($3);
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",$3);
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								// store the first operand in the stack
								fprintf(tmp,"sw $a0 0($sp)\n");
								// increase the stack ptr
								fprintf(tmp,"addiu $sp $sp -4\n");
									
								// for the second operand
								off = find_cnt($5);
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",$5);
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								
								fprintf(tmp,"lw $t1 4($sp)\n");
								fprintf(tmp,"sub $a0 $t1 $a0\n");
								fprintf(tmp,"addiu $sp $sp 4\n");
								
								// store the result(in acc)in the stack loc corresponding to  ID 
								off = find_cnt($1);
								fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
							}
							else if(strcmp($4,"*")==0){
								int off = find_cnt($3);
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",$3);
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								// store the first operand in the stack
								fprintf(tmp,"sw $a0 0($sp)\n");
								// increase the stack ptr
								fprintf(tmp,"addiu $sp $sp -4\n");
									
								// for the second operand
								off = find_cnt($5);
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",$5);
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								
								fprintf(tmp,"lw $t1 4($sp)\n");
								fprintf(tmp,"mul $a0 $a0 $t1\n");
								fprintf(tmp,"addiu $sp $sp 4\n");
								
								// store the result(in acc)in the stack loc corresponding to  ID 
								off = find_cnt($1);
								fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
							}
							else if(strcmp($4,"/")==0){
								int off = find_cnt($3);
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",$3);
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								// store the first operand in the stack
								fprintf(tmp,"sw $a0 0($sp)\n");
								// increase the stack ptr
								fprintf(tmp,"addiu $sp $sp -4\n");
									
								// for the second operand
								off = find_cnt($5);
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",$5);
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								
								fprintf(tmp,"lw $t1 4($sp)\n");
								fprintf(tmp,"div $a0 $a0 $t1\n");
								fprintf(tmp,"addiu $sp $sp 4\n");
								
								// store the result(in acc)in the stack loc corresponding to  ID 
								off = find_cnt($1);
								fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
							}
							else if(strcmp($4,"<")==0){
								int off = find_cnt($3);
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",$3);
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								// store the first operand in the stack
								fprintf(tmp,"sw $a0 0($sp)\n");
								// increase the stack ptr
								fprintf(tmp,"addiu $sp $sp -4\n");
									
								// for the second operand
								off = find_cnt($5);
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",$5);
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								
								fprintf(tmp,"lw $t1 4($sp)\n");
								fprintf(tmp,"sub $a0 $a0 $t1\n");
								fprintf(tmp,"addiu $sp $sp 4\n");
								
								string lbl1 = getlabel();
								string lbl2 = getlabel();
								
								fprintf(tmp,"bgtz $a0 %s\n",lbl1.c_str());
								fprintf(tmp,"li $a0 0\n");
								fprintf(tmp,"b %s\n",lbl2.c_str());
								
								fprintf(tmp,"%s:",lbl1.c_str());
								fprintf(tmp,"li $a0 1\n");
								fprintf(tmp,"%s:",lbl2.c_str());
								
								off = find_cnt($1);
								fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
							}
							else if(strcmp($4,">")==0){
								int off = find_cnt($3);
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",$3);
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								// store the first operand in the stack
								fprintf(tmp,"sw $a0 0($sp)\n");
								// increase the stack ptr
								fprintf(tmp,"addiu $sp $sp -4\n");
									
								// for the second operand
								off = find_cnt($5);
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",$5);
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								
								fprintf(tmp,"lw $t1 4($sp)\n");
								fprintf(tmp,"sub $a0 $a0 $t1\n");
								fprintf(tmp,"addiu $sp $sp 4\n");
								
								string lbl1 = getlabel();
								string lbl2 = getlabel();
								
								fprintf(tmp,"bltz $a0 %s\n",lbl1.c_str());
								fprintf(tmp,"li $a0 0\n");
								fprintf(tmp,"b %s\n",lbl2.c_str());
								
								fprintf(tmp,"%s:",lbl1.c_str());
								fprintf(tmp,"li $a0 1\n");
								fprintf(tmp,"%s:",lbl2.c_str());
								
								off = find_cnt($1);
								fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
							}
							else if(strcmp($4,"==")==0){
								int off = find_cnt($3);
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",$3);
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								// store the first operand in the stack
								fprintf(tmp,"sw $a0 0($sp)\n");
								// increase the stack ptr
								fprintf(tmp,"addiu $sp $sp -4\n");
									
								// for the second operand
								off = find_cnt($5);
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",$5);
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								
								fprintf(tmp,"lw $t1 4($sp)\n");
								fprintf(tmp,"addiu $sp $sp 4\n");
								
								string lbl1 = getlabel();
								string lbl2 = getlabel();
								
								fprintf(tmp,"beq $a0 $t1 %s\n",lbl1.c_str());
								fprintf(tmp,"li $a0 0\n");
								fprintf(tmp,"b %s\n",lbl2.c_str());
								
								fprintf(tmp,"%s:",lbl1.c_str());
								fprintf(tmp,"li $a0 1\n");
								fprintf(tmp,"%s:",lbl2.c_str());
								
								off = find_cnt($1);
								fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
							}
						}

					;
					
id_num				:id			{$$ = $1;}
					|num		{$$ = $1;}
					
					;
					
bin_operators:		BIN_OP		{ $$ = strdup(yytext); }
					;
					
id					: ID		{ $$ = strdup(yytext); }
					;
					
num					:NUM		{ $$ = strdup(yytext); }
					;
										

label				:LABEL		{$$=strdup(yytext);}
					;

uncond_jmp			:GOTO label		{
										int len = strlen($2);
										$2[len-1]='\0'; //Removing :
										fprintf(tmp,"b %s\n",$2);
									}
					;
					
cond_jmp			:IF id  GOTO label  {
											
											int len = strlen($4);
											$4[len-1]='\0'; //Removing :
											
											int off=find_cnt($2);
										 	fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
									   	 	fprintf(tmp,"li $t1 0\n");
									   	 	fprintf(tmp,"bne $a0 $t1 %s\n",$4);
											
										}
					|IF num GOTO label  {
											
											int len = strlen($4);
											$4[len-1]='\0'; //Removing :
											
										 	fprintf(tmp,"li $a0 %s\n",$2);
									   	 	fprintf(tmp,"li $t1 0\n");
									   	 	fprintf(tmp,"bne $a0 $t1 %s\n",$4);
											
										}
					;
					
assign				: id EQUAL id		{
											int off = find_cnt($3);
											fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
											cout<<"I am here with off="<<off<<endl;
											off = find_cnt($1);
											fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);										
										}
					|id EQUAL num 		{
											int off = find_cnt($1);
											fprintf(tmp,"li $a0 %s\n",$3);
											fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
										}
					
					| id EQUAL res		{
											fprintf(tmp,"move $a0 $v0\n");
											int off = find_cnt($1);
											fprintf(tmp,"sw $v0 %d($t0)\n",4*off-4);
										}			
					;
					
res					: _RES				{ $$ = strdup(yytext); }
					;
					
label1: 			label
					{
						fprintf(tmp,"%s\n",$1);
					}
					;
		
parameter			: param id 	{
									if(param_flag==0){
										cout<<"in param flag"<<endl;
										fprintf(tmp,"move $t1 $sp\n");
										fprintf(tmp,"addiu $sp $sp -4\n");
										param_flag=1;
									}
									int off = find_cnt($2);
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
									fprintf(tmp,"sw $a0 0($sp)\n");
									fprintf(tmp,"addiu $sp $sp -4\n");								
								}
					;
					
param				: PARAM		{$$=strdup(yytext);}
					;

func_call			: call label COMMA num	{

												if(param_flag==0){
													cout<<"in param flag"<<endl;
													fprintf(tmp,"move $t1 $sp\n");
													fprintf(tmp,"addiu $sp $sp -4\n");
													param_flag=1;
												}
												int len = strlen($2);
												$2[len-1]='\0'; //Removing :
												//storing the number of parameters
												fprintf(tmp,"li $a0 %s\n",$4);
												fprintf(tmp,"sw $a0 0($sp)\n");
												fprintf(tmp,"addiu $sp $sp -4\n");
												param_flag=0;
												fprintf(tmp,"jal %s\n",$2);
											}
					;

		

call				: CALL 					{ $$ = strdup(yytext); }
					;
					
					
return_stmt			:	return 			{
												
												fprintf(tmp,"move $v0 $a0\n");												
												//popping stack and reverting it to its original state
												fprintf(tmp,"lw $a0 4($sp)\n");
												fprintf(tmp,"addiu $sp $sp 4\n");
												fprintf(tmp,"mul $a0 $a0 4\n");
												fprintf(tmp,"addu $sp $sp $a0\n");
												
												fprintf(tmp,"lw $ra 4($sp)\n");
												fprintf(tmp,"addiu $sp $sp 4\n");
												fprintf(tmp,"jr $ra\n");
											}
					;
					
return 				: RETURN 			{ $$ = strdup(yytext); }
					;


func_def		:	 def label  			{
												
												if(flag==0)
													fprintf(tmp,"b label_main\n");
												flag=1;
												fprintf(tmp,"%s\n",$2);	
												
												//Storing return address
												fprintf(tmp,"sw $ra 0($t1)\n");
												
												
											}
				;
				
def				: DEF	{ $$ = strdup(yytext); }
				;
				
				
print_stmt		: print int id	{
									fprintf(tmp,"li $v0, 1\n");
									int off=find_cnt($3);
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
									fprintf(tmp,"syscall\n");
								}
				|print bool id	{
									fprintf(tmp,"li $v0, 1\n");
									int off=find_cnt($3);
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
									fprintf(tmp,"syscall\n");
								}
				| print endl	{
									fprintf(tmp,"li $v0, 4 \n la $a0 newline \n syscall\n");
								}
				| print num {
									fprintf(tmp,"li $v0, 1\n");
									fprintf(tmp,"li $a0, %s\n",$2);
									fprintf(tmp,"syscall\n");	
								}
								
				;
				
input_stmt		: input id		{
									fprintf(tmp,"li $v0, 4\n");
									fprintf(tmp,"la $a0, msg2\n syscall \n");                        
									fprintf(tmp,"li $v0, 5 \n syscall \n move $a0, $v0 \n");
									int off=find_cnt($2);
									fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
								
								}
				
print			: PRINT 		{ $$ = strdup(yytext); }	
				;
int				: INT			{ $$ = strdup(yytext); }
				;

endl			: ENDL			{ $$ = strdup(yytext); }
				;
bool			:BOOL			{ $$ = strdup(yytext);}
				;
input			:INPUT			{ $$ = strdup(yytext);}
%%

int find_cnt(char*a){
	string str(a);
	if(count_map.find(str)!=count_map.end())
		return count_map[str];
	return -1;
}

string getlabel(){
	string l = "lbl";
	stringstream ss;
	ss<<labelcount;
	labelcount++;
	cout<<labelcount<<endl;
	return l+ss.str();
}

int main(){
	char ch[1000];
	tmp = fopen("intermediate.txt","r");
	int c = 1;
	while(fscanf(tmp,"%s",ch)!=EOF){
		string str(ch);		
		if(count_map.find(str)==count_map.end()){
			count_map[str]=c;
			c++;
		}
		
	}
	fclose(tmp);
	tmp=fopen("out.asm","w");
	
	// for printing stuffs
	fprintf(tmp,".data\n newline:\n.asciiz \"\\n\" \n word: \n .space 21 \n  msg2: .asciiz \"please enter a value: \" \n .text \n");
	
	fprintf(tmp,"main:\n");
	fprintf(tmp,"move $t0 $sp\n");
	fprintf(tmp,"addiu $sp $sp %d\n",-4*c );
	fprintf(tmp,"sw $ra 0($sp)\n");
	fprintf(tmp,"addiu $sp $sp -4\n");
	//yyparse ();
	yyin = fopen("codegen.txt","r");
	if(yyin==NULL)
		fprintf(stderr,"Could Not open the file\n");
	else{
		if(yyparse()==0)
			fprintf(stderr,"Successful parsing of the file\n");
		else
			fprintf(stderr,"Parsing failed\n");
	}
	fprintf(tmp,"label_main:");
	fprintf(tmp,"lw $ra 4($sp)\n");
	fprintf(tmp,"addiu $sp $sp 4\n");
	fprintf(tmp,"addiu $sp $sp %d\n",4*c );
	fprintf(tmp,"jr $ra\n" );
	fclose(tmp);	
	return 0;
}





