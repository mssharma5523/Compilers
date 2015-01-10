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
#include<map>
#include<algorithm>

using namespace std;

//This function checks if the input regex is of correct form
bool isCorrect_regex(string s)
{
	char allowed_char[] = {'a','b','|','.','*','+','(',')'}; //valid set of characters,add if u want to increase this set
	stack<char> paren,alpha;//stack for checking correctness of parenthesis and alphabet sequence
	bool flag; // to check the validity of the expression
	for(int i=0;i<s.length();i++)
	{
		flag = false;
		for(int j=0;j<8;j++)
		{
			if(s[i]==allowed_char[j])
			{
				flag = true;
			}
		}
		if(flag == false)
		{
			cout<<"Invalid set of characters\n";
			return false; //an invalid character has been found ,hence an invalid regex
		}	
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
			{
				cout<<"Invalid set of parenthesis\n";		
				return false; //no matching parenthesis present hence a wrong expression
			}
		}
		else{
			if(s[i]=='*' || s[i]=='|' || s[i] == '+' || s[i]=='.')
			{
				char c=alpha.top();
				if(c == '*' || c== '.' || c == '|' || c == '+')
				{
					cout<<"Invalid set of symbols\n";
					return false; //two continuos set of symbols of ,.,|,+,* are not allowed
				}
			}
			alpha.push(s[i]);
		}
	}
	if(alpha.empty() || !paren.empty())
	{
		cout<<"No alphabets or odd no. of parenthesis\n";
		return false; //invalid set of parenthesis or only parenthesis are present
	}
	return true;
}

//This function converts the current regex into a parenthesised expression form
string parenthesised_regex(string s)
{
	map<string,char> mapping;//used for performing a mapping between the parenthesis tokens to a single char to make it easier to code..
	string temp_regex,fin_regex,paren_sep;
	stack<int> paren;
	int start_pos,end_pos,j;
	char unused[]={};
	int count=0;//for increasing the mapping counter

	for(int i=0;i<s.length();i++)
	{
		if(s[i]=='(')
		{
			paren.push(i);
			j=i+1;
			while(!paren.empty())
			{
				if(s[j]=='(')
				{
					paren.push(j);
				}
				else if(s[j]==')')
				{
					paren.pop();
				}
			}
			paren_sep.clear();
			paren_sep = s.substr(i,j-i+1);
			mapping[paren_sep] = unused[count++];
			s.erase(s.begin()+i,s.begin()+j-i+1);
			s.insert(i,1,unused[count-1]);
		}
	}
	//next section, to the temp_regex, firstly tokenise by |,then in each token whenever * is there, insert parenthesise it
	vector<string> tokens;
	vector<int> positions;
	vector<int>::iterator it;
	int cur;
	stack<char> fin_stk;
	
	positions.push_back(0);
	for(int i=0;i<s.length();i++)
	{
		if(s[i]=='|')
			positions.push_back(i);
	}
	cur = 0;	
	char c;
	for(it = positions.begin()+1;it!=positions.end();it++)
	{
		for(int i=cur;i<*it;i++)
		{
			if(s[i]=='*')
			{
				c=fin_stk.top();
				fin_stk.pop();
				fin_stk.push('(');
				fin_stk.push(c);
			}
			fin_stk.push(s[i]);
		}
		cur= *it+1;
		fin_stk.push('|');
	}
	fin_regex.clear();
	while(!fin_stk.empty())
	{
		fin_regex.append(&fin_stk.top());
		fin_stk.pop();
	}	
	reverse(fin_regex.begin(),fin_regex.end()); //final string after proper parenthesising, now unmapping needs to be done
	
	//code segment for unmapping the fin_regex expression so as to get the final expression;
	map<string,char>::iterator unmap;
	for(unmap=mapping.begin();unmap!=mapping.end();unmap++)
	{
		c = unmap->second;
		for(int i=0;i<fin_regex.length();i++)
		{
			if(fin_regex[i]==c)
			{
				fin_regex.insert(i+1,unmap->first);
				fin_regex.erase(fin_regex.begin()+i);
			}
		}
	}
	return fin_regex;
}

int main()
{
	string regex,paren_regex;
	cout<<"Enter the Regex Expression, The alphabet set consist of (a,b)\n";
	cin>>regex;
	if(!isCorrect_regex(regex))
	{
		cout<<"Invalid Regex expression inserted. Please check the characters or parenthesis\n";
	}
	else{
		cout<<"Correct Expression\nThe parenthesised string is: ";
		paren_regex = parenthesised_regex(regex);
	}
	return 0;
}
