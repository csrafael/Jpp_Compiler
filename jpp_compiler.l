%{
 #include <stdio.h>
 #include <string.h>
 #include <stdbool.h>
 
 #include "jpp_compiler.tab.h"


 /*#define SIMBOLO_PALAVRA_RESERVADA 1
 #define SIMBOLO_ID 2
 #define SIMBOLO_PV 3
 #define SIMBOLO_V 4
 #define SIMBOLO_ABRE_CHAVES 5
 #define SIMBOLO_FECHA_CHAVES 6
 #define SIMBOLO_ABRE_PARENTESES 7
 #define SIMBOLO_FECHA_PARENTESES 8
 #define SIMBOLO_ABRE_COLCHETES 9
 #define SIMBOLO_FECHA_COLCHETES 10
 #define SIMBOLO_ATRIBUICAO 11
 #define SIMBOLO_PRE_PROCESSOR 12
 #define NUM_INT 13
 #define NUM_FLOAT 14
 #define CHAR 15
 #define STRING 16
 #define OPERADOR_SUM 17
 #define OPERADOR_SUB 18
 #define OPERADOR_MUL 19
 #define OPERADOR_DIV 20
 #define OPERADOR_MOD 21
 #define OPERADOR_IGUAL 22
 #define OPERADOR_MAIOR_IGUAL 23
 #define OPERADOR_MENOR_IGUAL 24
 #define OPERADOR_DIFERENTE 25
 #define OPERADOR_MENOR 26
 #define OPERADOR_MAIOR 27
 #define OPERADOR_AND 28
 #define OPERADOR_OR 29
 #define OPERADOR_NOT 30 
 #define OPERADOR_INC 31
 #define OPERADOR_DEC 32*/

 int num_linha=1;

%}

digito [0-9]
letra [a-zA-Z]
id (j|J)(_|{letra}|{digito})*
inteiro {digito}+
float {inteiro}\.{digito}+
char '{letra}'
string \".*\"

%%
\n {num_linha += 1;}
[ \t] { /* espacos em branco */ }
\/\/.* { /* comentarios */ }

"jdouble" { return JDOUBLE; }
"jfloat" { return JFLOAT; }
"jif" { return JIF ; }
"jswitch" { return JSWITCH ; }
"jchar" { return JCHAR ; }
"jelse" { return JELSE ; }
"jfor" { return JFOR ; }
"jsizeof" { return JSIZEOF ; }
"jbreak" { return JBREAK ; }
"jint" { return JINT ; }
"jvoid" { return JVOID ; }
"jcase" { return JCASE ; }
"jgoto" { return JGOTO ; }
"jlong" { return JLONG ; }
"jreturn" { return JRETURN ; }
"jdo" { return JDO ; }
"jshort" { return JSHORT ; }
"jwhile" { return JWHILE ; }
"jbool" { return JBOOL ;}
"jmain" { return JMAIN ; }
"jtrue" {
    yylval.b = true;
    return NUM_BOOL;
}
"jfalse" {
    yylval.b = false;
    return NUM_BOOL;
}


{id} { return SIMBOLO_ID ;  }
{float} { yylval.f=atof(yytext); return NUM_FLOAT ;}

{char} {return CHAR ;}
{string} {return STRING ;}
";" { return SIMBOLO_PV ; }
"," { return SIMBOLO_V ; }
"{" { return SIMBOLO_ABRE_CHAVES ; }
"}" { return SIMBOLO_FECHA_CHAVES ; }
"(" { return SIMBOLO_ABRE_PARENTESES ; }
")" { return SIMBOLO_FECHA_PARENTESES ; }
"[" { return SIMBOLO_ABRE_COLCHETES ; }
"]" { return SIMBOLO_FECHA_COLCHETES ; }
"==" { return OPERADOR_IGUAL ; }
"=" { return SIMBOLO_ATRIBUICAO ; }
"#" { return SIMBOLO_PRE_PROCESSADOR ; }
"++" { return OPERADOR_INC ; }
"--" { return OPERADOR_DEC ; }
"+" { return OPERADOR_SUM ; }
"-" { return OPERADOR_SUB ; }
"*" { return OPERADOR_MUL ; }
"/" { return OPERADOR_DIV ; }
"%" { return OPERADOR_MOD ; }
"!=" { return OPERADOR_DIFERENTE ; }
">=" { return OPERADOR_MAIOR_IGUAL ;}
"<=" { return OPERADOR_MENOR_IGUAL ;}
">" {return OPERADOR_MAIOR ;}
"<" {return OPERADOR_MENOR ;}
"&&" {return OPERADOR_AND ;}
"||" {return OPERADOR_OR ;}
"!" {return OPERADOR_NOT ;}
'{letra} {printf("Linha %d: %s - %s\n", num_linha, yytext, "CHAR INVALIDO: ASPAS NÃO FORAM FECHADAS");}
\"[^\"\n]* {printf("Linha %d: %s - %s\n", num_linha, yytext, "STRING INVALIDA: ASPAS NÃO FORAM FECHADAS");}
. {printf("Linha %d: %s - %s\n", num_linha, yytext, "Símbolo não reconhecido.");}

%%

/*int palavra_reservada(char pal[])
{
 if ((!strcmp(pal, "jdouble")) ||
     (!strcmp(pal, "jfloat")) ||
     (!strcmp(pal, "jif")) ||
     (!strcmp(pal, "jswitch")) ||
     (!strcmp(pal, "jchar")) ||
     (!strcmp(pal, "jelse")) ||
     (!strcmp(pal, "jfor")) ||
     (!strcmp(pal, "jsizeof")) ||
     (!strcmp(pal, "jbreak")) ||
     (!strcmp(pal, "jint")) ||
     (!strcmp(pal, "jvoid")) ||
     (!strcmp(pal, "jcase")) ||
     (!strcmp(pal, "jgoto")) ||
     (!strcmp(pal, "jlong")) ||
     (!strcmp(pal, "jreturn")) ||
     (!strcmp(pal, "jdo")) ||
     (!strcmp(pal, "jshort")) ||
     (!strcmp(pal, "jwhile")) ||
     (!strcmp(pal, "jtrue")) ||
     (!strcmp(pal, "jbool")) ||
     (!strcmp(pal, "jfalse")) ||
     (!strcmp(pal, "jmain"))) 

  return(1);    
 else
  return(0);
} */

/*const char *getString(int codigo)
{
 switch(codigo) {
   case SIMBOLO_PALAVRA_RESERVADA:
     return "PALAVRA_RESERVADA";
   case SIMBOLO_ID:
     return "ID";
  case SIMBOLO_PV:
     return "SIMBOLO_PV";
  case SIMBOLO_V:
     return "SIMBOLO_V";
  case SIMBOLO_ABRE_CHAVES:
     return "SIMBOLO_ABRE_CHAVES";
  case SIMBOLO_FECHA_CHAVES:
     return "SIMBOLO_FECHA_CHAVES";
  case SIMBOLO_ABRE_PARENTESES:
     return "SIMBOLO_ABRE_PARENTESES";
  case SIMBOLO_FECHA_PARENTESES:
     return "SIMBOLO_FECHA_PARENTESES";
  case SIMBOLO_ABRE_COLCHETES:
     return "SIMBOLO_ABRE_COLCHETES";
  case SIMBOLO_FECHA_COLCHETES:
     return "SIMBOLO_FECHA_COLCHETES";
  case SIMBOLO_ATRIBUICAO:
     return "SIMBOLO_ATRIBUICAO";
  case SIMBOLO_PRE_PROCESSOR:
     return "SIMBOLO_PRE_PROCESSOR";
  case NUM_INT:
     return "NUM_INT";
  case NUM_FLOAT:
     return "NUM_FLOAT";
  case CHAR:
     return "CHAR";
  case STRING:
     return "STRING";
  case OPERADOR_SUM:
     return "OPERADOR_SUM";
  case OPERADOR_SUB:
     return "OPERADOR_SUB";
  case OPERADOR_MUL:
     return "OPERADOR_MUL";
  case OPERADOR_DIV:
     return "OPERADOR_DIV";
  case OPERADOR_MOD:
     return "OPERADOR_MOD";
  case OPERADOR_IGUAL:
     return "OPERADOR_IGUAL";
  case OPERADOR_DIFERENTE:
     return "OPERADOR_DIFERENTE";
  case OPERADOR_MAIOR_IGUAL:
     return "OPERADOR_MAIOR_IGUAL";
  case OPERADOR_MENOR_IGUAL:
     return "OPERADOR_MENOR_IGUAL";
  case OPERADOR_MAIOR:
     return "OPERADOR_MAIOR";
  case OPERADOR_MENOR:
     return "OPERADOR_MENOR";
  case OPERADOR_AND:
     return "OPEERADOR_AND";
  case OPERADOR_OR:
     return "OPERADOR_OR";
  case OPERADOR_NOT:
     return "OPERADOR_NOT";
  case OPERADOR_INC:
     return "OPERADOR_INCREMENTO";
  case OPERADOR_DEC:
     return "OPERADOR_DECREMENTO";
   default:
     return "INVALIDO";
  }
}*/

/*int main()
{
 int codigo;

 while (codigo = yylex())
 {
  printf("%s - %s\n\n", yytext, getString(codigo));
 }

 return 0;
}*/


