%{
    #include <stdio.h>
    #include "y.tab.h"

    extern int yyerror (char *msg);
%}

%%

[ \t\n]                   ;
[0-9]+                    { yylval.iValue = atoi(yytext); return NUMBER;}            
"program"                 { return(PROGRAM);}
"type"                    { yylval.sValue = strdup(yytext); return (TYPE); }
"var"                     { return(VAR); }
"add"                     { return(ADD); }
"mul"                     { return(MUL); }
"rel"                     { return(REL); }
"int"                     { return(INT); }
"float"                   { return(FLOAT); }
"string"                  { return(STRING); }
"bool"                    { return(BOOL); }
"if"                      { return(IF); }
"else"                    { return(ELSE); }
"then"                    { return(THEN); }
"while"                   { return(WHILE); }
"do"                      { return(DO); }
"begin"                   { return(B_BEGIN); }
"end"                     { return(B_END); }
"case"                    { return(CASE); }
"for"                     { return(FOR); }
"void"                    { return(VOID); }
"static"                  { return(STATIC); }
"const"                   { return(CONST); }
"default"                 { return(DEFAULT); }
"break"                   { return(BREAK); }
"continue"                { return(CONTINUE); }
"exit"                    { return(EXIT); }
"quit"                    { return(QUIT); }
"return"                  { return(RETURN); }
"printf"                  { return(PRINTF); }
"scanf"                   { return(SCANF); }
"maloc"                   { return(MALOC); }
"free"                    { return(FREE); }
"inttostr"                { return(INTTOSTR); }
"strtoint"                { return(STRTOINT); }
"floattostr"              { return(FLOATTOSTR); }
"strtofloat"              { return(STRTOFLOAT); }
"inttofloat"              { return(INTTOFLOAT); }
"floattoint"              { return(FLOATTOINT); }
"include"                 { return(INCLUDE); }
"assing"                  { return(ASSING); }
"read"                    { return(READ); }
"write"                   { return(WRITE); }
"+"                       { return(SUM); }
"-"                       { return(SUB); }
"/"                       { return(DIV); }
"*"                       { return(MULT); }
"="                       { return(IQUAL); }
":="                      { return(ASSIGN); }
"+="                      { return(SUMIQ); }
"-="                      { return(SUBIQ); }
"++"                      { return(SUMS); }
"--"                      { return(SUBS); }
"=="                      { return(IQUALS); }
"!="                      { return(DIFS); }
">"                       { return(BIG); }
"<"                       { return(SMA); }
">="                      { return(BIGS); }
"<="                      { return(SMAS); }
"!"                       { return(NOT); }
"&&"                      { return(AND); }
"||"                      { return(OR); }
"("                       { return(PARL); }
")"                       { return(PARR); }
"{"                       { return(KEYL); }
"}"                       { return(KEYR); }
";"                       { return(SEMI); }
"["                       { return(BRAL); } 
"]"                       { return(BRAR); }
[a-zA-Z][a-zA-Z0-9]*      { yylval.sValue = strdup(yytext); return ID;}
.                         { yyerror("invalid character");}


%%

//int yyerror(char *s) { printf("Linha: %d, com erro: %s.\n",yylineno, s);}
#ifndef yywrap
    int yywrap (void) {return 1;}
#endif

/*
int main(void){
    yylex();
    return 0;
}
*/
