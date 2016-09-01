%%
[0-9]+				{ return TK_INT;	}
[0-9]+"."[0-9]+		{ return TK_FLOAT;	}
.					{ return TK_ERR;	}
%%