all:
	yacc -d -v -t final_final.yacc
	flex thru1045.l
	g++ lex.yy.c y.tab.c -lfl
	./a.out final_mayb.cpp
	flex part1.l
	g++ lex.yy.c
	./a.out < codegen.txt
	yacc -d -v -t codegen.yacc
	flex part.l
	g++ lex.yy.c y.tab.c -lfl
