%{

#include <stdio.h>
#include <string.h>


%}


  /* Para identificar letras e numeros */
ALFANUMERICO [a-zA-Z0-9] 

  /* Para identificar letras, numeros, underlines, tracos e pontos */
ESPECIAL [a-zA-Z0-9_\-\.]



%%

{ALFANUMERICO}+{ESPECIAL}*{ALFANUMERICO}+\@{ALFANUMERICO}+{ESPECIAL}*{ALFANUMERICO}+ { printf("%s\n", yytext); } 

{ALFANUMERICO}+\@{ALFANUMERICO}+ { printf("%s\n", yytext); }

{ALFANUMERICO}+{ESPECIAL}*{ALFANUMERICO}+\@{ALFANUMERICO}+{ESPECIAL}*{ALFANUMERICO}+[.] { yytext[strlen(yytext)-1] = 0; printf("%s\n", yytext); } 


[[:space:]]+ ;
[[:^space:]]+ ;

[.\n]* ;


%%

int main() {
  yylex();
  return 0;
}







