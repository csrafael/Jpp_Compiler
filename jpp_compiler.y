%{

#include <stdio.h>
#include <string.h>
#include <stdbool.h>

/*using namespace std;*/

void yyerror(char *msg);
int yylex();

%}

 /* %union{
   float f;
   int i;
   char c;
   bool b;
   string str;
  };*/
/**************************/
/* Bison declarations     */
/**************************/

%start entrada

%left SIMBOLO_V SIMBOLO_PV

%token JDOUBLE JFLOAT JCHAR JINT JBOOL JVOID JLONG JSHORT
%token JIF JSWITCH JELSE JFOR JWHILE JDO JBREAK JCASE
%token JSIZEOF JGOTO JRETURN 
%token JMAIN

%token /*<f>*/ SIMBOLO_ID 
%token /*<i>*/ NUM_INT 
%token /*<f>*/ NUM_FLOAT 
%token /*<c>*/ CHAR 
%token /*<b>*/ NUM_BOOL
%token /*<str>*/ STRING
%token SIMBOLO_ABRE_PARENTESES SIMBOLO_FECHA_PARENTESES SIMBOLO_ABRE_CHAVES SIMBOLO_FECHA_CHAVES SIMBOLO_ABRE_COLCHETES SIMBOLO_FECHA_COLCHETES

%left SIMBOLO_PRE_PROCESSADOR
%left SIMBOLO_ATRIBUICAO
%left OPERADOR_SUM OPERADOR_SUB
%left OPERADOR_MUL OPERADOR_DIV
%left OPERADOR_AND OPERADOR_OR OPERADOR_NOT
%left OPERADOR_IGUAL OPERADOR_DIFERENTE 
%left OPERADOR_MAIOR OPERADOR_MENOR OPERADOR_MAIOR_IGUAL OPERADOR_MENOR_IGUAL
%left OPERADOR_MOD
%left OPERADOR_INC OPERADOR_DEC

/*%type <i> exprmatint*/
/*%type  exprmat*/
/*%type  exprlog*/

%%


/**************************/
/* Grammar rules          */
/**************************/
entrada : 
	| entrada final; 
	;
final   : SIMBOLO_PV
        /*| exprmat SIMBOLO_PV {printf("%d\n",$1);}*/
	| exprmat  SIMBOLO_PV/*{printf("%.2f\n",$1);}*/
        | exprlog  SIMBOLO_PV/*{printf("%d\n",$1);}*/
        | atrb     SIMBOLO_PV 
        | estrcond SIMBOLO_PV
        ;

varnum  : NUM_FLOAT
        | NUM_INT
        | SIMBOLO_ID
        ;



atrb    : tipo SIMBOLO_ID SIMBOLO_ATRIBUICAO exprmat {$2 = $4;}
        ;

tipo    : JDOUBLE
        | JFLOAT 
        | JCHAR 
        | JINT 
        | JBOOL 
        | JLONG 
        | JSHORT
        ;

/*opuni   : SIMBOLO_ID OPERADOR_INC
        | SIMBOLO_ID OPERADOR_DEC
        ;
*/

exprmat :  SIMBOLO_ABRE_PARENTESES exprmat SIMBOLO_FECHA_PARENTESES { $$ = $2;} 
        |  exprmat OPERADOR_SUM exprmat      { $$ = $1 + $3;}
        |  exprmat OPERADOR_SUB exprmat      { $$ = $1 - $3;}	
        |  exprmat OPERADOR_MUL exprmat      { $$ = $1 * $3;}
        |  exprmat OPERADOR_DIV exprmat      {
		 if($3==0){ yyerror("Divisao por zero"); yyerrok;}
		 else{$$ = $1 / $3;}}
        |  exprmat OPERADOR_MOD exprmat       
        |  varnum                            { $$ = $1;}
        ;

exprlog : SIMBOLO_ABRE_PARENTESES exprlog SIMBOLO_FECHA_PARENTESES { $$ = $2;}
        | exprlog OPERADOR_AND exprlog         { $$ = $1 && $3  ;}
        | exprlog OPERADOR_OR  exprlog         { $$ = $1 || $3  ;}
        | OPERADOR_NOT exprlog                 {  $$ = !$2      ;}
        | exprmat OPERADOR_MAIOR exprmat       { $$ = $1 > $3   ;}
        | exprmat OPERADOR_MENOR exprmat       { $$ = $1 < $3   ;}
        | exprmat OPERADOR_MAIOR_IGUAL exprmat { $$ = $1 >= $3  ;}
        | exprmat OPERADOR_MENOR_IGUAL exprmat { $$ = $1 <= $3  ;}
        | exprmat OPERADOR_IGUAL exprmat       { $$ = $1 == $3  ;}
        | exprmat OPERADOR_DIFERENTE exprmat   { $$ = $1 != $3  ;}
        | NUM_BOOL                             { $$ = $1       ;}
        | SIMBOLO_ID
        ;

estrcond: JIF SIMBOLO_ABRE_PARENTESES exprlog SIMBOLO_FECHA_PARENTESES SIMBOLO_ABRE_CHAVES SIMBOLO_FECHA_CHAVES else;

else    : 
        | JELSE SIMBOLO_ABRE_CHAVES SIMBOLO_FECHA_CHAVES
        | JELSE estrcond
        ;

/*for     : JFOR SIMBOLO_ABRE_PARENTESES inic SIMBOLO_PV cond SIMBOLO_PV incr SIMBOLO_FECHA_PARENTESES SIMBOLO_ABRE_CHAVES SIMBOLO_FECHA_CHAVES
*/
/**************************/
/* Additional C code      */
/**************************/

%%

void yyerror(char *msg)
{
  extern int yylineno;
  extern char *yytext;
  fprintf(stderr, "Erro: %s no simbolo '%s' na linha %d\n", msg, yytext, yylineno);
}


int main(){
  yyparse();

  return 0;
}
