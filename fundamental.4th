
( Fundamental )

( --------------------------------------------------- )

( Display star )
: STAR   42 EMIT ;

( Display literal star value )
: STAR2   [CHAR] * EMIT ;

( Newline and 10 spaces )
: MARGIN   CR 10 SPACES ;

( Spaces and star )
: BLIP   MARGIN STAR ;

( Many stars )
: STARS   0 DO STAR LOOP ;

( Spaces and many stars )
: BAR   MARGIN 5 STARS ;

( Letter F )
: F   BAR BLIP BAR BLIP BLIP CR ;

( Display text )
: GREET   ." Hello, I speak Forth " CR ;

( Add 4 )
: FOUR-MORE   4 + ;

( --------------------------------------------------- )

( Problem 1 )
: GIFT   ." cookies" ;
: GIVER   ." Lisa" ;
: THANKS   ." Dear " GIVER ." , thanks for the " GIFT ." . " CR ;

( Problem 2 )
: TEN.LESS   -10 + ;

( Problem 3 )
: GIVER   ." Ruby" ;

( --------------------------------------------------- )

( Letter F and greeting )
F CR GREET CR

( Sum numbers and display result )
3 4 + . CR

( Use defined word )
10 FOUR-MORE . CR
-5 FOUR-MORE . CR

( Display numbers )
5 10 15 . . . CR

( Use second star definition )
STAR2 CR

( Display thanks )
THANKS

( Display new giver definition )
GIVER CR

bye

