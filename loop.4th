
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

." --- " CR

bye

