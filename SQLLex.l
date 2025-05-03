%{

%}

comment				 {singlelinecomment}|{multilinecomment}
singlelinecomment                "--"{inputcharacters}?
inputcharacters                  {inputcharacter}+
inputcharacter                   [^\n]
com				 [.]*"*/"[.]*
multilinecomment                 "/*"[^{com}]"*/"
letter  			 [a-zA-Z]
nondigit  			 [_a-zA-Z]
nonSpecial 			 {nondigit}|{digit}
digit   			 [0-9]
digits  			 {digit}+
number 				 {digits}.{digits}?
keyword                          "create"|"primary key"|"insert"|"into"|"select"|"from"|"alter"|"add"|"distinct"|"update"|"set"|"delete"|"truncate"|"as"|"order by"|"asc"|"desc"|"between"|"where"|"where"|"limit"|"drop"|"column"|"database"|"table"|"group by"|"having"|"union"|"foreign key"|"references"|"values"



operator			{relOp}|{ArithmeticOp}|{AssignmentOp}|{compoundOp}|{bitwiseOp}|{logicalOp}
relOp				"<"|">"|"<="|">="|"="|"<>"
ArithmeticOp 			"+"|"-"|"*"|"/"|"%"
AssignmentOp			"="
compoundOp			"+="|"-="|"*="|"/="|"%="
bitwiseOp			"&"|"|"|"^"
logicalOp 			"OR"|"AND"|"NOT"|"ALL"|"AND"|"ANY"|"BETWEEN"|"EXISTS"|"IN"|"LIKE"|"SOME"
dataType			{int}|{decimal}|{char}|{char({digits})}|{varchar({digis})}|{date}|{time}
int 				{digits}
decomal				{digits}{"."}{digits}
char 				"'"[^{dot}]"'"
dot				"'"
charD				{char}{digits}
varchar				{char}+
date				"'"{{digit}{4}}{"-"}{{digit}{2}}{"-"}{{digit}{2}}
time				"'"{{digit}{2}}{":"}{{digit}{2}}{":"}{{digit}{2}}
whiteSpace			[ \n\t]+
identifier			{nondigit}{nonSpecial}*
value				{number}|{date}|{time}|{char}|{charD}|{varchar}	
StatementDelimiter 		[;\n] 
End				[;]

%%
{comment} 	{ printf("comment : %s \n",yytext) ; }
{keyword}	{ printf("keyword : %s \n", yytext); }
{identifier}    { printf("identifier : %s \n",yytext) ; }
{number}	{	printf("number : %s \n", yytext); }
{relOp}	{	printf("Relational Operator : %s \n", yytext); }
{logicalOp}	{ printf("Logical Operator : %s \n", yytext);}
{bitwiseOp}	{ printf("bitwise Operator : %s \n", yytext);}
{ArithmeticOp}	{ printf("Arithmetic Operator : %s \n", yytext);}
{compoundOp}	{ printf("compound  Operator : %s \n", yytext);}
{AssignmentOp}	{ printf("assignment Operator : %s \n", yytext);}
{End}		{ return 0;}
.		{}
%%

int yywrap(){
     return 1 ;
}

int main(){
  extern FILE *yyin ;

  printf( "enter file name : " ) ;
  char file[100] ;
  scanf("%s",file) ;
  yyin = fopen(file,"r") ;

  yylex() ;

}


