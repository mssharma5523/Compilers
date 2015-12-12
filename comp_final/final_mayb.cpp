#include<iostream>

int foo(int a){
		out<<a;
		if(a>0){
			a=a-1;
			foo(a);
		}fi		
		return 9;
		 
}

int main()
{
	int a;
	in>>a;
	int i;
	for(i=0;i<2;i=i+1){
		a=a+1;
	}
    foo(a);
	
	return 0;
}
	
