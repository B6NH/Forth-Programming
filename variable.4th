
( Variable)

( ---------------------------------------------------)

( Create variable)
VARIABLE DATE

( Set variable value)
14 DATE !

( Display variable)
." Date: " DATE @ . CR
." Date: " DATE ? CR

( Set new value)
21 DATE !
." New date: " DATE ? CR

VARIABLE EGGS
: RESET   0 EGGS ! ;
: EGG   1 EGGS +! ;

( Add value to variable)
2 EGGS +! 3 EGGS +!
EGGS ? CR
RESET

EGG EGG EGG EGGS ? CR
RESET

( Constant and its value)
220 CONSTANT LIMIT
LIMIT . CR

( Double-length variable)
2VARIABLE DATE2
800.000 DATE2 2!
DATE2 2@ D. CR
71703. DATE2 2!
DATE2 2@ D. CR

( Double-length constant)
200.000 2CONSTANT APPLES
APPLES D. CR

( Pair of single-length numbers)
355 113 2CONSTANT PI2
10000 PI2 */ . CR
." --- " CR

( Create array of size 5)
VARIABLE LIMITS  4 CELLS ALLOT

( Find array cell address)
: MLIMIT   CELLS LIMITS + ;

( Set array values)
220 LIMITS !
340 LIMITS 1 CELLS + !
170 2 MLIMIT !

( Display cell value)
2 MLIMIT ? CR

( Compare value with cell limit)
: ?TOO-HOT   MLIMIT @ > IF  ." Danger -- reduce heat "  THEN ;
230 0 ?TOO-HOT CR
350 1 ?TOO-HOT CR
." --- " CR

( Egg categories)
0 CONSTANT REJECT
1 CONSTANT SMALL
2 CONSTANT MEDIUM
3 CONSTANT LARGE
4 CONSTANT EXTRA-LARGE
5 CONSTANT ERROR

( Array for counting eggs)
VARIABLE COUNTS 5 CELLS ALLOT

( Fill array with zeros)
: RESETARR  COUNTS 6 CELLS ERASE ;
RESETARR

( Get counter address)
: COUNTER   CELLS COUNTS + ;

( Add 1 to counter)
: TALLY   COUNTER 1 SWAP +! ;

( Size category)
: CATEGORY
   DUP 18 < IF REJECT ELSE
     DUP 21 < IF SMALL ELSE
       DUP 24 < IF MEDIUM ELSE
         DUP 27 < IF LARGE ELSE
           DUP 30 < IF EXTRA-LARGE ELSE
             ERROR
           THEN
         THEN
       THEN
     THEN
   THEN NIP ;

( Label description)
: LABEL
   CASE
      REJECT      OF ." reject "      ENDOF
      SMALL       OF ." small "       ENDOF
      MEDIUM      OF ." medium "      ENDOF
      LARGE       OF ." large "       ENDOF
      EXTRA-LARGE OF ." extra large " ENDOF
      ERROR       OF ." error "       ENDOF
  ENDCASE ;

( Add 2 medium eggs)
MEDIUM TALLY
MEDIUM TALLY

( Display counter values)
REJECT COUNTER ?
SMALL COUNTER ?
MEDIUM COUNTER ?
LARGE COUNTER ?
EXTRA-LARGE COUNTER ?
ERROR COUNTER ?
CR
." --- " CR

( Display report)
: REPORT   PAGE ." QUANTITY       SIZE" CR CR
   6 0 DO
     I COUNTER @ 5 U.R  7 SPACES  I LABEL CR
   LOOP ;
( REPORT)

( Loop through array)
: DUMP2  CELLS OVER + SWAP
   DO
     I @ 5 U.R CR 1 CELLS
   +LOOP ;

COUNTS 6 DUMP2
." --- " CR

( Array with permanent values)
CREATE PLIMITS  220 , 340 , 170 , 100 , 190 ,
PLIMITS @ . CR
PLIMITS 1 CELLS + @ . CR
PLIMITS 2 CELLS + @ . CR
PLIMITS 3 CELLS + @ . CR
PLIMITS 4 CELLS + @ . CR
." --- " CR

( Byte array)
CREATE SIZES 18 C, 21 C, 24 C, 27 C, 30 C, 255 C,
: NCATEGORY
  6 0 DO
    DUP SIZES I + C@  < IF
      DROP I LEAVE
    THEN
  LOOP ;
15 NCATEGORY LABEL CR
22 NCATEGORY LABEL CR
26 NCATEGORY LABEL CR
." --- " CR

( ---------------------------------------------------)

( Problem 1)
( Initialize counter)
VARIABLE PIES
0 PIES !

( Add 1 to counter)
: BAKE-PIE   1 PIES +! ;

( Display message and subtract 1 from counter)
: EAT-PIE
   PIES @ IF
     -1 PIES +!  ." Thank you! "
   ELSE
     ." What pie? "
   THEN ;
BAKE-PIE
BAKE-PIE
EAT-PIE CR
EAT-PIE CR
EAT-PIE CR
." --- " CR

( Problem 2)
( Initialize variable)
VARIABLE FROZEN-PIES
0 FROZEN-PIES !

( Freeze all pies)
: FREEZE-PIES   PIES @  FROZEN-PIES +!  0 PIES ! ;

BAKE-PIE
BAKE-PIE
FREEZE-PIES
BAKE-PIE
EAT-PIE CR
EAT-PIE CR
FROZEN-PIES ? CR
." --- " CR

( Problem 3)
( Get base and print it in decimal)
( Restore original base)
: .BASE   BASE @ DUP DECIMAL . BASE ! ;
.BASE CR
.BASE CR
HEX
.BASE CR
.BASE CR
DECIMAL
.BASE CR
.BASE CR
." --- " CR

( Problem 4)
( Decimal point position)
VARIABLE PLACES
2 PLACES !

( Display digits and decimal point)
: M.   TUCK DABS
  <#  PLACES @  DUP -1 <> IF
    0 DO
      #
    LOOP
    [CHAR] . HOLD  
  ELSE
    DROP  S>D
  THEN
  #S  ROT SIGN  #>  TYPE SPACE ;

200.000 M. CR
4 PLACES !
-60000.0 M. CR
." --- " CR

( Problem 5)
( Create array)
CREATE #PENCILS 4 CELLS ALLOT

( Calculate cell address)
: PENCILS   #PENCILS + ;

( Display pencil)
: SHOW   ? CR ;

( Set cell positions)
0 CELLS CONSTANT RED
1 CELLS CONSTANT GREEN
2 CELLS CONSTANT BLUE
3 CELLS CONSTANT ORANGE

( Set array values)
23 RED PENCILS !
12 GREEN PENCILS !
15 BLUE PENCILS !
0 ORANGE PENCILS !

( Display values)
RED PENCILS SHOW
GREEN PENCILS SHOW
BLUE PENCILS SHOW
ORANGE PENCILS SHOW
." --- " CR

( Problem 6)
( Array with samples)
CREATE 'SAMPLES 10 CELLS ALLOT

( Display star)
: STAR   [CHAR] * EMIT ;

( Display many stars)
: STARS
  0 ?DO
    STAR
  LOOP ;

( Get sample address)
: SAMPLES   CELLS  'SAMPLES + ;

( Initialize samples)
: INIT-SAMPLES
  10 0 DO
    I 4 MOD I SAMPLES !
  LOOP ;

( Display histogram)
: PLOT
  10 0 DO
    I 2 .R SPACE
    I SAMPLES @ STARS CR
  LOOP ;

INIT-SAMPLES
PLOT
." --- " CR

( Problem 7)
( Initialize byte array)
CREATE BOARD 9 ALLOT

( Cell address)
: SQUARE   BOARD + ;

( Clear board)
: CLEAR   BOARD 9 ERASE ;

( Display vertical bar)
: BAR   ." | " ;

( Display horizontal line)
: DASHES   CR  9 0 DO  [CHAR] - EMIT  LOOP CR ;

( Draw box)
: .BOX
   SQUARE C@  DUP 0= IF
     2 SPACES
   ELSE
     DUP 1 = IF
       ." X "
     ELSE
       ." O "
     THEN
   THEN DROP ;

( Draw lines and boxes)
: DISPLAY
   CR 9 0 DO
     I IF
       I 3 MOD  0= IF
         DASHES
       ELSE
         BAR
       THEN
     THEN
     I .BOX
   LOOP CR QUIT ;

( Place 1 or -1 in array)
: PLAY   1- 0 MAX 8 MIN SQUARE C! ;

( Select X or Y)
: X!   1 SWAP  PLAY  DISPLAY ;
: O!   -1 SWAP PLAY  DISPLAY ;

( Comment out to play tic-tac-toe)
bye
