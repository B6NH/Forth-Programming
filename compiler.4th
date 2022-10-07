
( Compiler)

( ---------------------------------------------------)

( Defining word 'CONSTANT')
( Compile-time behavior)
80 CONSTANT MARGIN

( Run-time behavior)
." Margin: " MARGIN . CR

( Comma takes value from stack and places it in array)
: VARIABLE2   CREATE 0 , ;
VARIABLE2 ORANGES
." Oranges: " ORANGES ? CR

( Run-time part starts with 'DOES>')
: CONSTANT2   CREATE , DOES> @ ;
76 CONSTANT2 TROMBONES
." Trombones: " TROMBONES . CR

( Compile-time)
( Create dictionary entry)
( Set string size in first cell of array)
( Add additional 20 bytes to array)
( Run-time)
( Copy body address and move to first character)
( Swap values and put string length on stack)
: CHARACTERS
  CREATE DUP , ALLOT
  DOES> DUP CELL+ SWAP @ ;

( Word 'my-name' puts string's address and length on stack)
40 CHARACTERS my-name
: TEXT   PAD 258 BL FILL WORD COUNT PAD SWAP MOVE ;
: SET-NAME   BL TEXT PAD my-name MOVE  ;
: DISPLAY-NAME   ." Name: " my-name -TRAILING TYPE ;
SET-NAME John
DISPLAY-NAME CR

( Create byte array)
: STRING
  CREATE ALLOT
  DOES> + ;

( Create array with size of 30 bytes)
30 STRING VALVE

( At run-time add 6 to address and put value on stack)
6 VALVE C@ . CR

( Erase and allocate bytes)
: ERASED   HERE OVER ERASE ALLOT ;

( Create string with zeros)
: 0STRING
  CREATE ERASED
  DOES> + ;

30 0STRING STRZERO
5 STRZERO C@ . CR

( Check array index at run-time)
( Set array size and allocate bytes)
( At run-time test if argument is smaller than index)
( Add argument to boddy address and skip count)
: STRING2
  CREATE DUP , ALLOT
  DOES> 2DUP @ U< 0= ABORT" Range error " + CELL+ ;

( Correct indices)
20 STRING2 STR
5 STR C@ . CR

( Errors)
( 25 STR C@ . CR)
( -5 STR C@ . CR)

( Compile-time)
( Create two-dimensional byte array)
( Copy number of columns and place it in array)
( Multiply rows and columns to get array size and allocate bytes)
( Run-time)
( Rotate and put total number of columns on stack)
( Multiply rows and total columns to find index)
( Add index and column number to address)
( Skip first cell)
: ARRAY
  CREATE DUP , * ALLOT
  DOES> ROT OVER @ * + + CELL+ ;

( Array 4x4)
4 4 ARRAY BOARD

( Row: 2 Col: 1)
2 1 BOARD C@ . CR

( Print star)
: STAR   [CHAR] * EMIT ;

( Print 8-bit line of stars)
: .ROW
  8 0 DO
    DUP 128 AND IF
      STAR
    ELSE
      SPACE
    THEN
    1 LSHIFT
  LOOP DROP CR ;

( Set byte array values)
( At run-time loop through array and display patterns)
: SHAPE
  CREATE 8 0 DO
    C,
  LOOP
  DOES> DUP 7 + DO
    I C@ .ROW
  -1 +LOOP ;

( Print star pattern)
2 BASE !
00111001 .ROW
DECIMAL
." --- " CR

( Define images)
HEX
18 18 3C 5A 99 24 24 24 SHAPE MAN
81 42 24 18 18 24 24 81 SHAPE EQUIS
AA AA FE FE 38 38 38 FE SHAPE CASTLE
DECIMAL

( Display images)
MAN
." --- " CR
EQUIS
." --- " CR
CASTLE
." --- " CR

( Immediate word)
: SAY-HELLO   ." Hello" CR ; IMMEDIATE

( Immediate word 'SAY-HELLO' is executed at compile time)
: GREET   SAY-HELLO ." I speak Forth " ;

." Mid" CR
GREET CR
." --- " CR

( Treat 'SAY-HELLO' as normal word)
: GREET2   POSTPONE SAY-HELLO  ." I speak Forth " ;
: TWELVE ;
." Before" CR
GREET2 CR

( Leave and enter compilation mode)
( Causes immediate execution of ordinary word 'SAY-HELLO2')
: SAY-HELLO2  ." Hello " ;
: GREET3   [ SAY-HELLO2 ] ." I speak Forth " ;
GREET3 CR

( Number 4 is literal)
: FOUR-MORE   4 + ;
: FOUR-MORE2   [ 4 ] LITERAL + ;

5 FOUR-MORE . CR
24 FOUR-MORE2 . CR

( Dump memory into which DUMP-THIS was defined)
: DUMP-THIS   [ HERE ] LITERAL  32 DUMP ." DUMP-THIS" ;
DUMP-THIS CR

( ---------------------------------------------------)

( Problem 1)
( Take argument from input stream and generate dictionary entry with 'CREATE' word)
( Calculate address 2 cells from here and store it in array)
( Store string length in array)
( Put string length on return stack)
( Put next available dictionary location and string length on stack)
( Copy string and get its size from return stack)
( Allocate required number of bytes)
( At run-time take pair of single-length numbers - string length and address)
( Include file with name contained in string)
: LOADED-BY
  CREATE HERE 2 CELLS + , DUP ,
  >R HERE R@ MOVE
  R> ALLOT
  DOES> 2@ SWAP INCLUDED ;

( Parse string and return its address and length on stack)
S" mail.4th" LOADED-BY CORRESPONDENCE
CORRESPONDENCE

( Use loaded word)
MAIL CR

( Problem 2)
( Put number base in array)
( At run-time put base on stack)
( Save old base on return stack)
( Set new base and display value)
( Restore old base)
: BASED
  CREATE ,
  DOES> @ BASE @ >R BASE ! . R> BASE ! ;

( Display value in ternary and decimal)
3 BASED H.
5 DUP H. . CR

( Problem 3)
( Take word pointer and save it in array)
( At run-time place word pointer on stack)
( Execute word in loop)
: PLURAL
  CREATE ,
  DOES> @ SWAP ?DUP IF 0 DO
    DUP EXECUTE
  LOOP THEN DROP ;
' STAR PLURAL STARS
20 STARS CR

( Problem 4)
( Words 'TOURNE' and 'RETOURNE' are immediate)
( Words 'DO' and 'LOOP' will be executed at run-time)
: TOURNE   POSTPONE DO ; IMMEDIATE
: RETOURNE   POSTPONE LOOP ; IMMEDIATE
: TRY2
  5 0 TOURNE
    I . CR
  RETOURNE ;
TRY2

( Problem 5)
( Put current parsed position on stack)
( Execute loop given number of times)
( Inside loop reset current parsed position and interpret remainder of input)
: LOOPS   >IN @ SWAP 0 DO
    DUP >IN ! INTERPRET
  LOOP DROP ;
4 LOOPS CHAR * EMIT SPACE
CR

bye
