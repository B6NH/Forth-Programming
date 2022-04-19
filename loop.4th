
( Loop)

( ---------------------------------------------------)

( Definite loop)
: TEST   4 0 DO  ." Hello " CR  LOOP ;
TEST

." --- " CR

( Copy and display loop index)
: DECADE   10 0 DO  I .  LOOP ;
DECADE CR

( Loop from -250 to -244)
: SAMPLE   -243 -250 DO  I .  LOOP ;
SAMPLE CR

( Display multiples of parameter)
: MULTIPLICATIONS   11 1 DO  DUP I * .  LOOP DROP ;
7 MULTIPLICATIONS CR

." --- " CR

( Compound interest [20 years])
( amount interest -- )
: R%   10 */ 5 + 10 / ;
: COMPOUND
   SWAP 21 1 DO  ." YEAR " I . 3 SPACES ( Display year)
   2DUP R% + ( Calculate and add percentage to get new value)
   DUP ." BALANCE " . CR  LOOP 2DROP ; ( Display new value and continue loop)
1000 6 COMPOUND

." --- "

( Print star rectangle)
: RECTANGLE   256 0 DO  I 16 MOD 0= IF  CR  THEN ." *"  LOOP ;
RECTANGLE CR

." --- " CR

( Nursery rhyme)
: POEM
   11 1
   DO  I . ." Little "
     I 3 MOD 0= IF ." indians " CR  THEN
   LOOP
   ." indian boys. " ;
POEM CR

." --- " CR

( Use word 'MULTIPLICATIONS' inside loop)
: MTABLE   11 1 DO  I MULTIPLICATIONS CR  LOOP ;
MTABLE

." --- " CR

( Nested loops)
: MTABLE2
   11 1 DO
     11 1 DO
       I J * 5 U.R ( Multiply inner and outer loop indices)
     LOOP CR
   LOOP ;
MTABLE2

." --- " CR

( Change of loop index)
: PENTAJUMPS   50 0 DO  I .  5 +LOOP ;
PENTAJUMPS CR

." --- " CR

( Decreasing loop index)
: FALLING   -10 0 DO  I .  -1 +LOOP ;
FALLING CR

." --- " CR

( Step, limit and index on stack)
: INC-COUNT   DO  I . DUP +LOOP  DROP ;
3 20 0 INC-COUNT CR

." --- " CR

( Each time increase index by last value)
: DOUBLING   32767 1 DO  I . I +LOOP ;
DOUBLING CR

." --- " CR

( Definition with error)
( Type 'XX' to clear stack)
( : FIVES_E   100 0 DO  I 5 .  LOOP ;)
( FIVES_E)

( Correct definition)
: FIVES   100 0 DO  I 5 * .  LOOP ;
FIVES CR

." --- "

( Quit after 20 times or as soon as money has doubled)
: DOUBLED
   6 1000
     21 1 DO
       CR ." YEAR " I 2 U.R
       2DUP R% +  DUP ."    BALANCE " .
       DUP 2000 > IF
         CR ." more than doubled in "
         I . ." years " LEAVE
       THEN
     LOOP 2DROP ;
DOUBLED CR

( Clear screen)
( PAGE)

( Don't show "ok" message)
( QUIT)

( ---------------------------------------------------)

." --- " CR

( Problem 1)
: STARS   0 DO  42 EMIT  LOOP ;
5 STARS CR

." --- " CR

( Problem 2)
: BOX
   0 DO
     DUP
     0 DO
       42 EMIT
     LOOP
     CR
   LOOP DROP ;
: BOX2
   0 DO
     DUP STARS CR
   LOOP DROP ;
10 3 BOX
." --- " CR
10 3 BOX2
." --- " CR

( Problem 3)
: \STARS
   0 DO
     I 0> IF
       I 0 DO  ."  "  LOOP
     THEN
     10 STARS CR
   LOOP ;
: \STARS2
   0 DO
     I SPACES 10 STARS CR
   LOOP ;
4 \STARS
." --- " CR
4 \STARS2
." --- " CR

( Problem 4)
: /STARS
   DUP
   0 DO
     DUP I - 1- SPACES
     10 STARS CR
   LOOP DROP ;
: /STARS2
   1- 0 SWAP DO
     I SPACES 10 STARS CR
   -1 +LOOP ;
4 /STARS
." --- " CR
4 /STARS2
." --- " CR

( Problem 5)
: /STARSS ;

( Problem 6)
: DIAMONDS ;

( Problem 7)
: DOUBLEDD ;

( Problem 8)
: ** ;

bye

