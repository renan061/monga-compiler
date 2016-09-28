/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     TK_KEY_INT = 258,
     TK_KEY_FLOAT = 259,
     TK_KEY_CHAR = 260,
     TK_KEY_IF = 261,
     TK_KEY_ELSE = 262,
     TK_KEY_WHILE = 263,
     TK_KEY_NEW = 264,
     TK_KEY_RETURN = 265,
     TK_KEY_VOID = 266,
     TK_EQUAL = 267,
     TK_LEQUAL = 268,
     TK_GEQUAL = 269,
     TK_AND = 270,
     TK_OR = 271,
     TK_ID = 272,
     TK_INT = 273,
     TK_FLOAT = 274,
     TK_STR = 275
   };
#endif
/* Tokens.  */
#define TK_KEY_INT 258
#define TK_KEY_FLOAT 259
#define TK_KEY_CHAR 260
#define TK_KEY_IF 261
#define TK_KEY_ELSE 262
#define TK_KEY_WHILE 263
#define TK_KEY_NEW 264
#define TK_KEY_RETURN 265
#define TK_KEY_VOID 266
#define TK_EQUAL 267
#define TK_LEQUAL 268
#define TK_GEQUAL 269
#define TK_AND 270
#define TK_OR 271
#define TK_ID 272
#define TK_INT 273
#define TK_FLOAT 274
#define TK_STR 275




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

