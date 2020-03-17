%{
	#include <stdlib.h>
	#include "y.tab.h"
%}

SPACE	[ \t]
NEWLINE	[\n]
/*COMMENT ("#"|";")[^\n]*[\n]*/
BLANKS	(({SPACE})|({NEWLINE}))+

KEY	[_a-zA-Z0-9]+
VALUE	[^=\n][^\n]*
SECTION "["({KEY})"]"

%%

"="		{ return tEQUAL; }

{SECTION}	{ return tSECTION; }
{KEY}		{ return tKEY; }
{VALUE}		{ return tVALUE; }

{BLANKS}	{ }

%%

int yywrap(void) {}

