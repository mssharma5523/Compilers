/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    NUM = 258,
    ID = 259,
    EQUAL = 260,
    BIN_OP = 261,
    PLUS = 262,
    MINUS = 263,
    TIMES = 264,
    DIVIDE = 265,
    SMALLER = 266,
    SMALLEREQ = 267,
    GREATER = 268,
    GREATEREQ = 269,
    EQEQ = 270,
    GOTO = 271,
    IF = 272,
    LABEL = 273,
    AND = 274,
    PARAM = 275,
    COMMA = 276,
    CALL = 277,
    RETURN = 278,
    DEF = 279,
    _RES = 280,
    INT = 281,
    PRINT = 282,
    ENDL = 283,
    BOOL = 284,
    INPUT = 285
  };
#endif
/* Tokens.  */
#define NUM 258
#define ID 259
#define EQUAL 260
#define BIN_OP 261
#define PLUS 262
#define MINUS 263
#define TIMES 264
#define DIVIDE 265
#define SMALLER 266
#define SMALLEREQ 267
#define GREATER 268
#define GREATEREQ 269
#define EQEQ 270
#define GOTO 271
#define IF 272
#define LABEL 273
#define AND 274
#define PARAM 275
#define COMMA 276
#define CALL 277
#define RETURN 278
#define DEF 279
#define _RES 280
#define INT 281
#define PRINT 282
#define ENDL 283
#define BOOL 284
#define INPUT 285

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
