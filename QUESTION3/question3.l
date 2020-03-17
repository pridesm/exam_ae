%{
#include "y.tab.h"
%}

%%
"$" return tD;
"a" return tA;
"b" return tB;
"c" return tC;

%%
int yywrap(void) { }
