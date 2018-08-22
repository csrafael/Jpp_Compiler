/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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

#ifndef YY_YY_JPP_COMPILER_TAB_H_INCLUDED
# define YY_YY_JPP_COMPILER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    SIMBOLO_V = 258,
    SIMBOLO_PV = 259,
    JDOUBLE = 260,
    JFLOAT = 261,
    JCHAR = 262,
    JINT = 263,
    JBOOL = 264,
    JVOID = 265,
    JLONG = 266,
    JSHORT = 267,
    JIF = 268,
    JSWITCH = 269,
    JELSE = 270,
    JFOR = 271,
    JWHILE = 272,
    JDO = 273,
    JBREAK = 274,
    JCASE = 275,
    JSIZEOF = 276,
    JGOTO = 277,
    JRETURN = 278,
    JMAIN = 279,
    SIMBOLO_ID = 280,
    NUM_INT = 281,
    NUM_FLOAT = 282,
    CHAR = 283,
    NUM_BOOL = 284,
    STRING = 285,
    SIMBOLO_ABRE_PARENTESES = 286,
    SIMBOLO_FECHA_PARENTESES = 287,
    SIMBOLO_ABRE_CHAVES = 288,
    SIMBOLO_FECHA_CHAVES = 289,
    SIMBOLO_ABRE_COLCHETES = 290,
    SIMBOLO_FECHA_COLCHETES = 291,
    SIMBOLO_PRE_PROCESSADOR = 292,
    SIMBOLO_ATRIBUICAO = 293,
    OPERADOR_SUM = 294,
    OPERADOR_SUB = 295,
    OPERADOR_MUL = 296,
    OPERADOR_DIV = 297,
    OPERADOR_AND = 298,
    OPERADOR_OR = 299,
    OPERADOR_NOT = 300,
    OPERADOR_IGUAL = 301,
    OPERADOR_DIFERENTE = 302,
    OPERADOR_MAIOR = 303,
    OPERADOR_MENOR = 304,
    OPERADOR_MAIOR_IGUAL = 305,
    OPERADOR_MENOR_IGUAL = 306,
    OPERADOR_MOD = 307,
    OPERADOR_INC = 308,
    OPERADOR_DEC = 309
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_JPP_COMPILER_TAB_H_INCLUDED  */
