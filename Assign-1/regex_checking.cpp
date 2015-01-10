/*This program checks the correctness of the regex expression, The alphabets of the expression are a,b and the usual rules are applied
	The checking is done by using two stacks- one for checking the correctness of the parenthesis and other for the correctness of the operators. All other symbols except <a,b,(,),*,|,+,.> are discarded
*/

#include<iostream>
#include<cstdio>
#include<cstring>
#include<cstdlib>
#include<cstring>
#include<vector>
#include<string>
#include<stack>

using namespace std;


bool isCorrect_regex(string s)
{
	char allowed_char[] = {'a','b','|','.','*','+','(',')'}; //valid set of characters,add if u want to increase this set
	stack<char> paren,alpha;//stack for checking correctness of parenthesis and alphabet sequence
	bool flag; // to check the validity of the expression
	for(int i=0;i<s.length();i++)
	{
		flag = false;
		for(int j=0;j<7;j++)
		{
			if(s[i]==allowed_char[j])
				flag = true;
		}
		if(flag == false)
			return false; //an invalid character has been found ,hence an invalid regex
	}	
	for(int i=0;i<s.length();i++)
	{
		if(s[i]=='(')
		{
			paren.push('(');
		}
		else if(s[i]==')')
		{
			if(!paren.empty())
				paren.pop();
			else
				return false; //no matching parenthesis present hence a wrong expression
		}
		else{
			if(s[i]=='*' || s[i]=='|' || s[i] == '+' || s[i]=='.')
			{
				char c=alpha.top();
				if(c == '*' || c== '.' || c == '|' || c == '+')
					return false; //two continuos set of symbols of ,.,|,+,* are not allowed
			}
			alpha.push(s[i]);
		}
	}
	if(alpha.empty() || !paren.empty())
		return false; //invalid set of parenthesis or only parenthesis are present
	return true;
}



int main()
{
	string regex;
	cout<<"Enter the Regex Expression, The alphabet set consist of (a,b)\n";
	cin>>regex;
	if(!isCorrect_regex(regex))
	{
		cout<<"Invalid Regex expression inserted. Please check the characters or parenthesis\n";
	}
		
}
