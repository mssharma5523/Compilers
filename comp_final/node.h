#include<stdio.h>
#include<stdlib.h>

typedef struct node node;
struct node{
	vector<node*> child; //used to point to the child nodes..
	string name;//i.e the name of the operator,operand,value,id etc... will be used to distin
	//string value;//value to be used if the pointer is parent to the leaf
};
