%{
	#include <stdio.h>
	#include <stdlib.h>

	int yydebug = 1;

	extern int yylex();

	int yyerror(char *s) {
		printf("=== YYERROR ===\n");
		exit(1);
		return 1;
	}
%}

%token
	tSECTION
	tKEY
	tEQUAL
	tVALUE

%%

S :	SECTION 
	| SECTION S
	;

SECTION	:	tSECTION PARAMETERS 
		;

PARAMETERS :	tKEY tEQUAL tVALUE
		| tKEY tEQUAL tVALUE PARAMETERS;


%%

int main(void)
{
	yyparse();
	return 0;
}

