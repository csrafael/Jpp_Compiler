%{

#define YYPARSER 

#include "stdio.h"
#include "string.h"

#include "globals.h"
#include "util.h"
#include "scan.h"
#include "parse.h"

#define YYSTYPE TreeNode *
static char * savedName; 
static int savedLineNo; 
static TreeNode * savedTree;


%}

/**************************/
/* Bison declarations     */
/**************************/
%%

%token JIF JELSE JINT JRETURN JVOID JWHILE JEND
%token SIMBOLO_ID NUM_INT NUM_FLOAT CHAR STRING
%token SIMBOLO_ABRE_PARENTESES SIMBOLO_FECHA_PARENTESE SIMBOLO_ABRE_CHAVES SIMBOLO_FECHA_CHAVES SIMBOLO_ABRE_COLCHETES SIMBOLO_FECHA_COLCHETES
%left OPERADOR_SUM OPERADOR_SUB
%left OPERADOR_MUL OPERADOR_DIV
%left OPERADOR_MOD

%left SIMBOLO_V
%token ERROR

%%


/**************************/
/* Grammar rules          */
/**************************/



/**************************/
/* Additional C code      */
/**************************/

int yyerror(char * mensagem) {
  fprintf(listing,"Erro de sintaxe na linha %d: %s\n",numeroLinha,mensagem);
  fprintf(listing,"Current token: ");
  printToken(yychar,tokenString);
  Error = TRUE;
  return 0;
}
