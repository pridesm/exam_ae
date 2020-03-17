%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();

int yyerror(char *s) {
	printf(“yyerror”);
	exit(1);
	return 1;
}
%}

%token  tA tB tC tD

%start S

%%

S: X inter Y
;

X: tD H C tD
;

C: C tC
| tC
;
H: tA H tB
|
;

Y: tD A G tD
;

A: A tA
| tA
;

G: tB G tC
|
;

%%
int main()
{
 return(yyparse());
}
