
( Edit)

( ---------------------------------------------------)

( First definition)
: GREET   ." Hello, I speak Forth." CR ;

GREET

( Create marker)
MARKER -work

( Redefinition)
: GREET   ." Hi there!" CR ;

( Newline after 'redefined GREET' message)
CR

GREET

( Doesn't work with gforth 0.7.3)
( FORGET GREET)

( It should display original message)
( GREET)

( Execute marker word to discard other definitions)
-work

( Display original message)
GREET

( Block = 1024 characters [16 lines * 64 characters])

( Load source file)
( INCLUDE edit.4th)

( List block)
( 1 LIST)

( Load block)
( 1 LOAD)

bye

