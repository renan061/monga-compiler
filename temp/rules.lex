%{
	#include <stdio.h>
	#include "rules.tab.h"
%}
%%
[0-9]+                  return NUMBER;
"+"                    	return PLUS;
\n                      /* ignore end of line */;
[ \t]+                  /* ignore whitespace */;
%%