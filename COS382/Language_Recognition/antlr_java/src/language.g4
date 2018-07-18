grammar language;

scripture  : book reference translation NL;

book       : name
           | ord_num name
           ;

reference  : text
           | text ';' reference
           | Digit*
           | Letter*
           ;
text       : chapter
           | chapter ':' verses
           ;

chapter    : number;

verses     : length
           | length ',' verses
           ;

length     : number
           | number '-' number
           ;

translation: ('(' name ')')?;

ord_num    : Digit?;

number     : Digit+
           ;

name       : Letter+
           ;

Digit      : [0-9];

Letter     : [A-Za-z];
WS : [ ] -> skip;
NL : '\r'? '\n';