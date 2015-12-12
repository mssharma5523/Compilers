/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "codegen.yacc" /* yacc.c:339  */

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

#line 104 "y.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "y.tab.h".  */
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

/* Copy the second part of user declarations.  */

#line 215 "y.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  2
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   74

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  31
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  29
/* YYNRULES -- Number of rules.  */
#define YYNRULES  47
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  67

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   285

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    46,    46,    47,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    63,   326,   327,   331,   334,
     337,   341,   344,   351,   362,   374,   381,   387,   394,   397,
     403,   417,   420,   441,   445,   460,   464,   478,   482,   488,
     494,   497,   505,   514,   516,   519,   521,   523
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "NUM", "ID", "EQUAL", "BIN_OP", "PLUS",
  "MINUS", "TIMES", "DIVIDE", "SMALLER", "SMALLEREQ", "GREATER",
  "GREATEREQ", "EQEQ", "GOTO", "IF", "LABEL", "AND", "PARAM", "COMMA",
  "CALL", "RETURN", "DEF", "_RES", "INT", "PRINT", "ENDL", "BOOL", "INPUT",
  "$accept", "line", "exp", "binary_op", "id_num", "bin_operators", "id",
  "num", "label", "uncond_jmp", "cond_jmp", "assign", "res", "label1",
  "parameter", "param", "func_call", "call", "return_stmt", "return",
  "func_def", "def", "print_stmt", "input_stmt", "print", "int", "endl",
  "bool", "input", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285
};
# endif

#define YYPACT_NINF -43

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-43)))

#define YYTABLE_NINF -18

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int8 yypact[] =
{
     -43,    44,   -43,   -43,   -16,     3,   -43,   -43,   -43,   -43,
     -43,   -43,   -43,   -43,   -43,     6,   -43,   -43,   -43,   -43,
     -43,   -43,     4,   -43,   -16,   -43,   -43,   -43,   -16,   -43,
     -43,     7,     4,   -43,   -43,    -4,    -2,     1,   -43,    -8,
     -43,   -43,   -43,   -43,   -43,     4,   -43,     4,   -43,   -16,
     -16,   -43,     9,    10,    12,   -43,    16,   -43,   -43,   -43,
     -43,   -43,     3,   -43,   -43,   -43,   -43
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,     0,     1,    19,     0,     0,    21,    31,    33,    35,
      37,    43,    47,     2,     4,     0,    29,     7,     6,     8,
       5,     9,     0,    11,     0,    10,    34,    12,     0,    13,
      14,     0,     0,    22,    20,     0,     0,     0,    30,     0,
      36,    44,    45,    46,    41,     0,    40,     0,    42,     0,
       0,    28,     0,    25,    26,    27,     0,    38,    39,    23,
      24,    18,     0,    32,    15,    16,    17
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -43,   -43,   -43,   -43,   -42,   -43,    -5,   -28,    -3,   -43,
     -43,   -43,   -43,   -43,   -43,   -43,   -43,   -43,   -43,   -43,
     -43,   -43,   -43,   -43,   -43,   -43,   -43,   -43,   -43
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     1,    13,    14,    52,    62,    15,    36,    16,    17,
      18,    19,    55,    20,    21,    22,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    45,    46,    47,    32
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int8 yytable[] =
{
      35,    33,     6,    44,    34,     3,    34,     3,     3,    54,
      34,    37,    49,    56,    50,    61,   -16,    38,   -17,    34,
      64,    39,     0,     0,     0,    40,    51,    48,    63,     0,
       0,     0,    53,    41,    66,    42,    43,     0,     0,     0,
      57,     0,    58,     0,     2,     0,    59,    60,     3,     0,
       0,     0,     0,     0,     0,     0,     0,    65,     0,     0,
       4,     5,     6,     0,     7,     0,     8,     9,    10,     0,
       0,    11,     0,     0,    12
};

static const yytype_int8 yycheck[] =
{
       5,     4,    18,    31,     3,     4,     3,     4,     4,    37,
       3,     5,    16,    21,    16,     6,     6,    22,     6,     3,
      62,    24,    -1,    -1,    -1,    28,    25,    32,    56,    -1,
      -1,    -1,    37,    26,    62,    28,    29,    -1,    -1,    -1,
      45,    -1,    47,    -1,     0,    -1,    49,    50,     4,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    62,    -1,    -1,
      16,    17,    18,    -1,    20,    -1,    22,    23,    24,    -1,
      -1,    27,    -1,    -1,    30
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    32,     0,     4,    16,    17,    18,    20,    22,    23,
      24,    27,    30,    33,    34,    37,    39,    40,    41,    42,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    59,    39,     3,    37,    38,     5,    37,    39,
      39,    26,    28,    29,    38,    56,    57,    58,    37,    16,
      16,    25,    35,    37,    38,    43,    21,    37,    37,    39,
      39,     6,    36,    38,    35,    37,    38
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    31,    32,    32,    33,    33,    33,    33,    33,    33,
      33,    33,    33,    33,    33,    34,    35,    35,    36,    37,
      38,    39,    40,    41,    41,    42,    42,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    53,
      53,    53,    54,    55,    56,    57,    58,    59
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     0,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     5,     1,     1,     1,     1,
       1,     1,     2,     4,     4,     3,     3,     3,     1,     1,
       2,     1,     4,     1,     1,     1,     2,     1,     3,     3,
       2,     2,     2,     1,     1,     1,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 15:
#line 65 "codegen.yacc" /* yacc.c:1646  */
    {
							if(strcmp((yyvsp[-1]),"+")==0){
								int off = find_cnt((yyvsp[-2]));
								cout<<off<<endl;
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",(yyvsp[-2]));
																		
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
								off = find_cnt((yyvsp[0]));
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",(yyvsp[0]));
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								
								fprintf(tmp,"lw $t1 4($sp)\n");
								fprintf(tmp,"add $a0 $a0 $t1\n");
								fprintf(tmp,"addiu $sp $sp 4\n");
								
								// store the result(in acc)in the stack loc corresponding to  ID 
								off = find_cnt((yyvsp[-4]));
								fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
							}
							else if(strcmp((yyvsp[-1]),"-")==0){
								int off = find_cnt((yyvsp[-2]));
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",(yyvsp[-2]));
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								// store the first operand in the stack
								fprintf(tmp,"sw $a0 0($sp)\n");
								// increase the stack ptr
								fprintf(tmp,"addiu $sp $sp -4\n");
									
								// for the second operand
								off = find_cnt((yyvsp[0]));
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",(yyvsp[0]));
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								
								fprintf(tmp,"lw $t1 4($sp)\n");
								fprintf(tmp,"sub $a0 $t1 $a0\n");
								fprintf(tmp,"addiu $sp $sp 4\n");
								
								// store the result(in acc)in the stack loc corresponding to  ID 
								off = find_cnt((yyvsp[-4]));
								fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
							}
							else if(strcmp((yyvsp[-1]),"*")==0){
								int off = find_cnt((yyvsp[-2]));
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",(yyvsp[-2]));
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								// store the first operand in the stack
								fprintf(tmp,"sw $a0 0($sp)\n");
								// increase the stack ptr
								fprintf(tmp,"addiu $sp $sp -4\n");
									
								// for the second operand
								off = find_cnt((yyvsp[0]));
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",(yyvsp[0]));
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								
								fprintf(tmp,"lw $t1 4($sp)\n");
								fprintf(tmp,"mul $a0 $a0 $t1\n");
								fprintf(tmp,"addiu $sp $sp 4\n");
								
								// store the result(in acc)in the stack loc corresponding to  ID 
								off = find_cnt((yyvsp[-4]));
								fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
							}
							else if(strcmp((yyvsp[-1]),"/")==0){
								int off = find_cnt((yyvsp[-2]));
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",(yyvsp[-2]));
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								// store the first operand in the stack
								fprintf(tmp,"sw $a0 0($sp)\n");
								// increase the stack ptr
								fprintf(tmp,"addiu $sp $sp -4\n");
									
								// for the second operand
								off = find_cnt((yyvsp[0]));
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",(yyvsp[0]));
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								
								fprintf(tmp,"lw $t1 4($sp)\n");
								fprintf(tmp,"div $a0 $a0 $t1\n");
								fprintf(tmp,"addiu $sp $sp 4\n");
								
								// store the result(in acc)in the stack loc corresponding to  ID 
								off = find_cnt((yyvsp[-4]));
								fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
							}
							else if(strcmp((yyvsp[-1]),"<")==0){
								int off = find_cnt((yyvsp[-2]));
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",(yyvsp[-2]));
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								// store the first operand in the stack
								fprintf(tmp,"sw $a0 0($sp)\n");
								// increase the stack ptr
								fprintf(tmp,"addiu $sp $sp -4\n");
									
								// for the second operand
								off = find_cnt((yyvsp[0]));
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",(yyvsp[0]));
																		
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
								
								off = find_cnt((yyvsp[-4]));
								fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
							}
							else if(strcmp((yyvsp[-1]),">")==0){
								int off = find_cnt((yyvsp[-2]));
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",(yyvsp[-2]));
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								// store the first operand in the stack
								fprintf(tmp,"sw $a0 0($sp)\n");
								// increase the stack ptr
								fprintf(tmp,"addiu $sp $sp -4\n");
									
								// for the second operand
								off = find_cnt((yyvsp[0]));
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",(yyvsp[0]));
																		
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
								
								off = find_cnt((yyvsp[-4]));
								fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
							}
							else if(strcmp((yyvsp[-1]),"==")==0){
								int off = find_cnt((yyvsp[-2]));
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",(yyvsp[-2]));
																		
								}
								else{
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
								}
								// store the first operand in the stack
								fprintf(tmp,"sw $a0 0($sp)\n");
								// increase the stack ptr
								fprintf(tmp,"addiu $sp $sp -4\n");
									
								// for the second operand
								off = find_cnt((yyvsp[0]));
								if(off==-1){ //Not in count_map must be a const
									fprintf(tmp,"li $a0 %s\n",(yyvsp[0]));
																		
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
								
								off = find_cnt((yyvsp[-4]));
								fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
							}
						}
#line 1598 "y.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 326 "codegen.yacc" /* yacc.c:1646  */
    {(yyval) = (yyvsp[0]);}
#line 1604 "y.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 327 "codegen.yacc" /* yacc.c:1646  */
    {(yyval) = (yyvsp[0]);}
#line 1610 "y.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 331 "codegen.yacc" /* yacc.c:1646  */
    { (yyval) = strdup(yytext); }
#line 1616 "y.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 334 "codegen.yacc" /* yacc.c:1646  */
    { (yyval) = strdup(yytext); }
#line 1622 "y.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 337 "codegen.yacc" /* yacc.c:1646  */
    { (yyval) = strdup(yytext); }
#line 1628 "y.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 341 "codegen.yacc" /* yacc.c:1646  */
    {(yyval)=strdup(yytext);}
#line 1634 "y.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 344 "codegen.yacc" /* yacc.c:1646  */
    {
										int len = strlen((yyvsp[0]));
										(yyvsp[0])[len-1]='\0'; //Removing :
										fprintf(tmp,"b %s\n",(yyvsp[0]));
									}
#line 1644 "y.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 351 "codegen.yacc" /* yacc.c:1646  */
    {
											
											int len = strlen((yyvsp[0]));
											(yyvsp[0])[len-1]='\0'; //Removing :
											
											int off=find_cnt((yyvsp[-2]));
										 	fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
									   	 	fprintf(tmp,"li $t1 0\n");
									   	 	fprintf(tmp,"bne $a0 $t1 %s\n",(yyvsp[0]));
											
										}
#line 1660 "y.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 362 "codegen.yacc" /* yacc.c:1646  */
    {
											
											int len = strlen((yyvsp[0]));
											(yyvsp[0])[len-1]='\0'; //Removing :
											
										 	fprintf(tmp,"li $a0 %s\n",(yyvsp[-2]));
									   	 	fprintf(tmp,"li $t1 0\n");
									   	 	fprintf(tmp,"bne $a0 $t1 %s\n",(yyvsp[0]));
											
										}
#line 1675 "y.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 374 "codegen.yacc" /* yacc.c:1646  */
    {
											int off = find_cnt((yyvsp[0]));
											fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
											cout<<"I am here with off="<<off<<endl;
											off = find_cnt((yyvsp[-2]));
											fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);										
										}
#line 1687 "y.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 381 "codegen.yacc" /* yacc.c:1646  */
    {
											int off = find_cnt((yyvsp[-2]));
											fprintf(tmp,"li $a0 %s\n",(yyvsp[0]));
											fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
										}
#line 1697 "y.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 387 "codegen.yacc" /* yacc.c:1646  */
    {
											fprintf(tmp,"move $a0 $v0\n");
											int off = find_cnt((yyvsp[-2]));
											fprintf(tmp,"sw $v0 %d($t0)\n",4*off-4);
										}
#line 1707 "y.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 394 "codegen.yacc" /* yacc.c:1646  */
    { (yyval) = strdup(yytext); }
#line 1713 "y.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 398 "codegen.yacc" /* yacc.c:1646  */
    {
						fprintf(tmp,"%s\n",(yyvsp[0]));
					}
#line 1721 "y.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 403 "codegen.yacc" /* yacc.c:1646  */
    {
									if(param_flag==0){
										cout<<"in param flag"<<endl;
										fprintf(tmp,"move $t1 $sp\n");
										fprintf(tmp,"addiu $sp $sp -4\n");
										param_flag=1;
									}
									int off = find_cnt((yyvsp[0]));
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
									fprintf(tmp,"sw $a0 0($sp)\n");
									fprintf(tmp,"addiu $sp $sp -4\n");								
								}
#line 1738 "y.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 417 "codegen.yacc" /* yacc.c:1646  */
    {(yyval)=strdup(yytext);}
#line 1744 "y.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 420 "codegen.yacc" /* yacc.c:1646  */
    {

												if(param_flag==0){
													cout<<"in param flag"<<endl;
													fprintf(tmp,"move $t1 $sp\n");
													fprintf(tmp,"addiu $sp $sp -4\n");
													param_flag=1;
												}
												int len = strlen((yyvsp[-2]));
												(yyvsp[-2])[len-1]='\0'; //Removing :
												//storing the number of parameters
												fprintf(tmp,"li $a0 %s\n",(yyvsp[0]));
												fprintf(tmp,"sw $a0 0($sp)\n");
												fprintf(tmp,"addiu $sp $sp -4\n");
												param_flag=0;
												fprintf(tmp,"jal %s\n",(yyvsp[-2]));
											}
#line 1766 "y.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 441 "codegen.yacc" /* yacc.c:1646  */
    { (yyval) = strdup(yytext); }
#line 1772 "y.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 445 "codegen.yacc" /* yacc.c:1646  */
    {
												
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
#line 1790 "y.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 460 "codegen.yacc" /* yacc.c:1646  */
    { (yyval) = strdup(yytext); }
#line 1796 "y.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 464 "codegen.yacc" /* yacc.c:1646  */
    {
												
												if(flag==0)
													fprintf(tmp,"b label_main\n");
												flag=1;
												fprintf(tmp,"%s\n",(yyvsp[0]));	
												
												//Storing return address
												fprintf(tmp,"sw $ra 0($t1)\n");
												
												
											}
#line 1813 "y.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 478 "codegen.yacc" /* yacc.c:1646  */
    { (yyval) = strdup(yytext); }
#line 1819 "y.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 482 "codegen.yacc" /* yacc.c:1646  */
    {
									fprintf(tmp,"li $v0, 1\n");
									int off=find_cnt((yyvsp[0]));
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
									fprintf(tmp,"syscall\n");
								}
#line 1830 "y.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 488 "codegen.yacc" /* yacc.c:1646  */
    {
									fprintf(tmp,"li $v0, 1\n");
									int off=find_cnt((yyvsp[0]));
									fprintf(tmp,"lw $a0 %d($t0)\n",4*off-4);
									fprintf(tmp,"syscall\n");
								}
#line 1841 "y.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 494 "codegen.yacc" /* yacc.c:1646  */
    {
									fprintf(tmp,"li $v0, 4 \n la $a0 newline \n syscall\n");
								}
#line 1849 "y.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 497 "codegen.yacc" /* yacc.c:1646  */
    {
									fprintf(tmp,"li $v0, 1\n");
									fprintf(tmp,"li $a0, %s\n",(yyvsp[0]));
									fprintf(tmp,"syscall\n");	
								}
#line 1859 "y.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 505 "codegen.yacc" /* yacc.c:1646  */
    {
									fprintf(tmp,"li $v0, 4\n");
									fprintf(tmp,"la $a0, msg2\n syscall \n");                        
									fprintf(tmp,"li $v0, 5 \n syscall \n move $a0, $v0 \n");
									int off=find_cnt((yyvsp[0]));
									fprintf(tmp,"sw $a0 %d($t0)\n",4*off-4);
								
								}
#line 1872 "y.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 514 "codegen.yacc" /* yacc.c:1646  */
    { (yyval) = strdup(yytext); }
#line 1878 "y.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 516 "codegen.yacc" /* yacc.c:1646  */
    { (yyval) = strdup(yytext); }
#line 1884 "y.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 519 "codegen.yacc" /* yacc.c:1646  */
    { (yyval) = strdup(yytext); }
#line 1890 "y.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 521 "codegen.yacc" /* yacc.c:1646  */
    { (yyval) = strdup(yytext);}
#line 1896 "y.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 523 "codegen.yacc" /* yacc.c:1646  */
    { (yyval) = strdup(yytext);}
#line 1902 "y.tab.c" /* yacc.c:1646  */
    break;


#line 1906 "y.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 524 "codegen.yacc" /* yacc.c:1906  */


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





