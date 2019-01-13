%{
	#include "y.tab.h"
		int NumarLinie=1;
		int NumarColoana=1;		
%}

%%
"PROGRAM"		{NumarColoana+=7; return TOK_PROGRAM; }
"VAR"			{NumarColoana+=3; return TOK_VAR; }
"BEGIN"			{NumarColoana+=5; return TOK_BEGIN; }
"END"			{NumarColoana+=3; return TOK_END; }
";"			{NumarColoana++;  return TOK_SEMICOLON; }
":"			{NumarColoana++;  return TOK_2POINTS; }
"INTEGER" 		{NumarColoana+=7; return TOK_INTEGER; }
","			{NumarColoana++;  return TOK_COMMA; }
":="			{NumarColoana+=2; return TOK_ASSIGNEMENT; }
"+"			{NumarColoana++;  return TOK_PLUS; }
"-"			{NumarColoana++;  return TOK_MINUS; }
"*"			{NumarColoana++;  return TOK_MULTIPLY; }
"DIV"			{NumarColoana+=3; return TOK_DIV; }
"("			{NumarColoana++;  return TOK_LEFT; }
")"			{NumarColoana++;  return TOK_RIGHT; }
"READ"			{NumarColoana+=4; return TOK_READ; }
"WRITE"			{NumarColoana+=5; return TOK_WRITE; }
"FOR"			{NumarColoana+=3; return TOK_FOR; }
"DO"			{NumarColoana+=2; return TOK_DO; }
"TO"			{NumarColoana+=2; return TOK_TO; }
[a-zA-Z][a-zA-Z0-9]* { NumarColoana+=strlen(yytext); yylval.nume = new char[strlen(yytext)+1]; strcpy(yylval.nume,yytext); return TOK_ID;}
0|[1-9][0-9]*	{ NumarColoana+=strlen(yytext); yylval.nr = new char[strlen(yytext)+1]; strcpy(yylval.nume,yytext); return TOK_INT; }
[ ]			{ NumarColoana++; }
\r\n			{ NumarLinie++; NumarColoana=1; }
\n			{ NumarLinie++; NumarColoana=1; }
.			{ NumarColoana++; return TOK_ERROR; }
%%

