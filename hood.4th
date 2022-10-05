
( Hood)

( ---------------------------------------------------)

( Word definition)
: GREET   ." Hello, I speak Forth " ;

( Word execution token - xt)
' GREET . CR

( Word execution)
' GREET EXECUTE CR

( Contents of definition)
' GREET 12 CELLS DUMP

( Execute token from variable)
VARIABLE pointer
' GREET pointer !
pointer @ EXECUTE CR

: HELLO   ." Hello " ;
: GOODBYE   ." Goodbye " ;

( Pointer to word 'HELLO')
VARIABLE 'aloha
' HELLO 'aloha !

( Execute 'aloha pointer)
: ALOHA   'aloha @ EXECUTE ;
ALOHA CR

( Update pointer)
' GOODBYE 'aloha !
ALOHA CR

( Read word from input stream)
: SAY   ' 'aloha ! ;
SAY HELLO
ALOHA CR
SAY GOODBYE
ALOHA CR

( Set pointer inside definition)
: COMING   ['] HELLO   'aloha ! ;
: GOING    ['] GOODBYE 'aloha ! ;
COMING ALOHA CR
GOING ALOHA CR

( Value of CP - address of next available cell in dictionary)
HERE . CR

( Pad address)
( HERE + 176)
PAD . CR

( Value from top stack location)
5
SP@ @ . . CR

( Terminal input buffer address)
TIB . CR

( User variable)
USER uservar
8 uservar !
uservar ? CR

( ---------------------------------------------------)

." --- " CR

( Problem 1)
: CONVICTED-OF   0 ;
: ARSON   10 + ;
: TAX-EVASION   5 + ;
: WILL-SERVE   . ." years" CR ;

( Execute pointer in loop)
: COUNTS
  ' -ROT 0 DO
    OVER EXECUTE
  LOOP NIP ;

CONVICTED-OF TAX-EVASION 2 COUNTS ARSON WILL-SERVE
." --- " CR

( Problem 2)
HERE . CR
." --- " CR

( Problem 3)
PAD HERE - . CR
." --- " CR

bye
