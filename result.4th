
( Result )

( --------------------------------------------------- )

( Arithmetic )

17 5 + .
7 4 - .
7 8 * .
20 4 / .
23 3 / .
10000000000 10000000000 * .

CR

17 12 * 4 + .
4 17 12 * + .
17 20 + 132 + 3 + 9 + .
17 20 132 3 9 + + + + .
3 9 + 4 6 + * .

: LINE   ." ------------------------------------" CR ;

CR LINE

( --------------------------------------------------- )

( Quizzie 2-a )

( Postfix )
( c[a+b]            ->   c a b + * )
( [3a - b] / 4 + c  ->   3 a * b - 4 / c + )
( [0.5 ab] / 100    ->   a b * 2 / 100 / )
( [n + 1] / n       ->   n 1 + n / )
( x[7x + 5]         ->   x 7 x * 5 + * )

( Infix )
( a b - b a + /     ->   [a - b] / [b + a] )
( a b 10 * /        ->   a / [b * 10] )

( --------------------------------------------------- )

( Conversions )
: YARDS>IN   36 * ;
: FT>IN   12 * ;

( Plural )
: YARDS   36 * ;
: FEET   12 * ;
: INCHES   ;

( Singular )
: YARD   YARDS ;
: FOOT   FEET ;
: INCH   ;

( 100 * 36 )
100 YARDS>IN .

( 10 * 12 )
10 FT>IN .

( 360 + 24 + 9 )
10 YARDS 2 FEET + 9 INCHES +  .

( 36 + 12 + 1 )
1 YARD 1 FOOT + 1 INCH +  .

CR

( hours speed tail-wind  -- result )
: FLIGHT-DISTANCE   + * ;

5 700 25 FLIGHT-DISTANCE . CR

( --------------------------------------------------- )

( Quizzie 2-b )

( c a b -- result )  
: 2B1   4 * - 6 / + ;

( a b -- result )
: 2B2   8 * / ;

( a b -- result )
: 2B3   * 2 / 100 / ;

( a a -- result )
: 2B4   2 * 3 + * ;

( c a b -- result )
: 2B5   - SWAP / ;

( --------------------------------------------------- )

LINE

( Quotient & Remainder )
22 5 /MOD . . CR

( Remainder )
22 5 MOD . CR

( Display values from stack )
: QUARTERS   4 /MOD . ." ones and " . ." quarters " CR ;
    
26 QUARTERS LINE

( --------------------------------------------------- )

1 2 SWAP . . CR
5 DUP . . CR
8 9 OVER . . . CR
5 6 7 ROT . . . CR
20 30 DROP . CR

( Show stack )
1 2 3 .S CR
. . . CR

( --------------------------------------------------- )

( Quizzie 2-c )

( 1. SWAP ROT )

( 2. SWAP DUP ROT ROT )

( 3. M-ROT )
: M-ROT   ROT ROT ;

( 4. EQ-4 )
: EQ-4   DUP 1 + SWAP / ;

( 5. EQ-5 )
: EQ-5   DUP 7 * 5 + * ;

( 6. EQ-6 )
: EQ-6   SWAP DUP 9 * ROT - * ;
: EQ-66   OVER 9 * SWAP - * ;

5 6 EQ-6 . 5 6 EQ-66 . CR LINE

( --------------------------------------------------- )

( Doubles )
1 2 3 4 2SWAP . . . . CR
1 2 2DUP . . . . CR
5 6 7 8 2OVER . . . . . . CR
1 2 3 4 5 2DROP . . . CR LINE

( --------------------------------------------------- )

( Problem 1 )
5 6 DUP DUP . . . . CR
5 6 2DUP . . . . CR

( Problem 2 )
( SWAP 2SWAP SWAP )

( Problem 3 )
: 3DUP   DUP 2OVER ROT ;
1 2 3 3DUP . . . . . . CR

( Problem 4 )
( a**2 + ab + c = a[a + b] + c )
( c a b -- result )
: IE1   OVER + * + ;

( [a - b] / [a + b] )
( a b -- result )
: IE2   2DUP - ROT ROT + / ;

( 2**2 + 2*6 + 5 )
5 2 6 IE1 . CR

( [2 - -4] / [2 + -4] )
2 -4 IE2 . CR

( Problem 5 )
: CONVICTED-OF   0 ;
: HOMICIDE   20 + ;
: ARSON   10 + ;
: TAX-EVASION   5 + ;
: BLACKMAIL   4 + ;
: BOOKMAKING   2 + ;
: KIDNAPPING   1 + ;
: WILL-SERVE   . ." years" CR ;

CONVICTED-OF ARSON HOMICIDE TAX-EVASION WILL-SERVE

( Problem 6 )
: EGG.CARTONS   12 /MOD ." Cartons: " . CR ." Leftovers: " . CR ;

30 EGG.CARTONS

bye

