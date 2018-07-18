#include "tokens.h"
#include <stdio.h>
#include <stdlib.h>

int lookahead;

int next() {
    int t;
    t = getchar();
    if (t != EOF) {
        while(t==' ' || t=='\t') t = getchar();
    if((t>='A')&&(t<='Z') || (t>='a')&&(t<='z')) {
	     t=getchar();
	     while((t>='A')&&(t<='Z') || (t>='a')&&(t<='z')) t=getchar();
	     ungetc(t,stdin);
	     return N;
	  }
	  if((t>='0')&&(t<='9')) {
	     t=getchar();
	     while((t>='0')&&(t<='9')) t=getchar();
	     ungetc(t,stdin);
	     return D;
	  }
	  if (t==';' || t==':' || t==',' || t=='(' || t==')' || t=='-' ||
	          t=='\n' || t=='\r') return t;
	     return ERR;

    }
    else return EOF;

}

void match(char c) {
    if (lookahead == c) lookahead = next();
    else {
        printf("Error: '%c' expected, '%c' found\n", c, lookahead);
        exit(0);
    }
}

int main(){
  while((lookahead=next())!=EOF){
    int parse_scripture();
    parse_scripture();
  }
}

int parse_scripture(){
  int parse_book();
  int parse_reference();
  int parse_translation();
  parse_book();
  parse_reference();
  parse_translation();
}

int parse_book(){
  int parse_ord_num();
  int parse_name();
  parse_ord_num();
  parse_name();
}

int parse_reference(){
  int parse_text();
  int parse_reference();
  if(lookahead == D){
    parse_text();
    if (lookahead == ';'){
      match(';');
      parse_reference();
    }
  }
}

int parse_text(){
  int parse_chapter();
  int parse_verse();
  //if(lookahead == D){
  parse_chapter();
  if(lookahead == ':'){
    parse_verse();
    }
  //}
}

int parse_chapter(){
  int parse_number();
  //if(lookahead == D){
  parse_number();
  //}
}

int parse_verse(){
  int parse_length();
  if(lookahead == ':'){
    match(':');
    parse_length();
    if(lookahead == ','){
      match(',');
      parse_length();
    }
  }
}

int parse_length(){
  int parse_number();
  if(lookahead == D){
    parse_number();
    if(lookahead == '-'){
      match('-');
      parse_number();
    }
  }
}

int parse_translation(){
  int parse_name();
  if(lookahead == '('){
    match('(');
    parse_name();
    match(')');
  }
}

int parse_ord_num(){
  if(lookahead == D){
    match(D);
  }
}

int parse_number(){
  match(D);
}

int parse_name(){
  match(N);
}
