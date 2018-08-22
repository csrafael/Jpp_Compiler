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
%token COMENTARIOS
%token JEND

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
	| entrada acoes; 
	;
acoes   : SIMBOLO_PV
        /*| exprmat SIMBOLO_PV {printf("%d\n",$1);}*/
        | atrb SIMBOLO_PV    acoes 
        | estrcond acoes
        | for      acoes
        | while    acoes
        | atrbvec SIMBOLO_PV acoes
        | criaFuncao acoes
        | consulFunc acoes
        | comentarios acoes
        | retorno  SIMBOLO_PV   acoes
        | JEND {printf("COMPILACAO BEM SUCEDIDA");}
        ;

varnum  : NUM_FLOAT
        | NUM_INT
        | OPERADOR_SUB NUM_FLOAT
        | OPERADOR_SUB NUM_INT
        | OPERADOR_SUB SIMBOLO_ID
        | SIMBOLO_ID
        | consvec
        | NUM_BOOL
        ;



atrb    : tipo SIMBOLO_ID SIMBOLO_ATRIBUICAO exprmat
	| SIMBOLO_ID SIMBOLO_ATRIBUICAO exprmat
        ;

atrbvec : tipo SIMBOLO_ID SIMBOLO_ABRE_COLCHETES varnum SIMBOLO_FECHA_COLCHETES SIMBOLO_ATRIBUICAO SIMBOLO_ABRE_CHAVES elemen SIMBOLO_FECHA_CHAVES

elemen  : varnum 
        | varnum SIMBOLO_V elemen
        ;

consvec : SIMBOLO_ID SIMBOLO_ABRE_COLCHETES varnum SIMBOLO_FECHA_COLCHETES 

tipo    : JDOUBLE
        | JFLOAT 
        | JCHAR 
        | JINT 
        | JBOOL 
        | JLONG 
        | JSHORT
        ;

opuni   : SIMBOLO_ID OPERADOR_INC
        | SIMBOLO_ID OPERADOR_DEC
        ;

comentarios : COMENTARIOS;

exprmat :  SIMBOLO_ABRE_PARENTESES exprmat SIMBOLO_FECHA_PARENTESES { $$ = $2;} 
        |  exprmat OPERADOR_SUM exprmat            
        |  exprmat OPERADOR_SUB exprmat      	
        |  exprmat OPERADOR_MUL exprmat      
        |  exprmat OPERADOR_DIV exprmat      
        |  exprmat OPERADOR_MOD exprmat       
        |  varnum                           
        |  exprmat OPERADOR_AND exprmat         
        |  exprmat OPERADOR_OR  exprmat           
        |  OPERADOR_NOT exprmat                 
        |  exprmat OPERADOR_MAIOR exprmat       
        |  exprmat OPERADOR_MENOR exprmat       
        |  exprmat OPERADOR_MAIOR_IGUAL exprmat 
        |  exprmat OPERADOR_MENOR_IGUAL exprmat 
        |  exprmat OPERADOR_IGUAL exprmat       
        |  exprmat OPERADOR_DIFERENTE exprmat   
        ;

estrcond: JIF SIMBOLO_ABRE_PARENTESES exprmat SIMBOLO_FECHA_PARENTESES SIMBOLO_ABRE_CHAVES acoes SIMBOLO_FECHA_CHAVES else;

else    : 
        | JELSE SIMBOLO_ABRE_CHAVES acoes SIMBOLO_FECHA_CHAVES
        | JELSE estrcond
        ;

for     : JFOR SIMBOLO_ABRE_PARENTESES inic SIMBOLO_PV cond SIMBOLO_PV incr SIMBOLO_FECHA_PARENTESES SIMBOLO_ABRE_CHAVES acoes SIMBOLO_FECHA_CHAVES
	;

inic : atrb
     |
     ;

cond : exprmat
     |
     ;

incr : atrb
     | opuni
     |
     ;

while    : JWHILE SIMBOLO_ABRE_PARENTESES exprmat SIMBOLO_FECHA_PARENTESES SIMBOLO_ABRE_CHAVES acoes SIMBOLO_FECHA_CHAVES
         ;

criaFuncao : tipo SIMBOLO_ID SIMBOLO_ABRE_PARENTESES param SIMBOLO_FECHA_PARENTESES SIMBOLO_ABRE_CHAVES acoes SIMBOLO_FECHA_CHAVES

param    : tipo SIMBOLO_ID SIMBOLO_ABRE_COLCHETES SIMBOLO_FECHA_COLCHETES params
         | tipo SIMBOLO_ID params
	 ;

params   : SIMBOLO_V param
         | 
         ;

consulFunc : SIMBOLO_ID SIMBOLO_ABRE_PARENTESES var_par SIMBOLO_FECHA_PARENTESES

var_par  : varnum var_pars
         ;

var_pars : SIMBOLO_V var_par
         |
         ;

retorno : JRETURN varnum
	: JRETURN consulFunc
        ;

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
