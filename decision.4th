
( Decision)

( ---------------------------------------------------)

( Equal)
: ?FULL   12 = IF  ." It's full "  THEN ;

( Compare numbers)
: EQNUMBERS   - IF  ." Numbers are different "  ELSE  ." Numbers are equal "  THEN ;

( Greater)
: ?TOO-HOT   220 > IF  ." Danger -- reduce heat "  THEN ;

( Reverse condition)
: ?LE50   50 > INVERT IF  ." Less than or equal 50 "  THEN ;

( Branching)
: ?DAY   32 < IF  ." Looks good "  ELSE  ." No way "  THEN ;

( True if number is less than 1 OR greater than 31)
: ?DAY2  DUP 1 < SWAP 31 > + IF  ." No way " ELSE  ." Looks good "  THEN ;

( Safe division)
: /CHECK   DUP 0= IF  ." Invalid " DROP  ELSE  /  THEN ;

( Zero means false)
: /CHECK2   DUP IF  /  ELSE  ." Invalid " DROP  THEN ;

( Nested conditional statement)
: EGGSIZE
   DUP 18 < IF  ." reject "      ELSE
     DUP 21 < IF  ." small "       ELSE
       DUP 24 < IF  ." medium "      ELSE
         DUP 27 < IF  ." large "       ELSE
           DUP 30 < IF  ." extra large " ELSE
             ." error "
           THEN
         THEN
       THEN
     THEN
   THEN
 DROP ;
 
( Boolean test)
: TEST   IF  ." non-"  THEN  ." zero " ;

( Remainder)
: MULTIPLE10   10 MOD IF  ." Non-multiple "  ELSE  ." Multiple "  THEN ;

( ---------------------------------------------------)

( Definition tests)
5 ?FULL 12 ?FULL CR
150 ?TOO-HOT 250 ?TOO-HOT CR
55 ?LE50 50 ?LE50 CR 45 ?LE50 CR CR

( Day of month)
14 ?DAY CR 35 ?DAY CR
25 ?DAY2 CR -7 ?DAY2 CR CR

( Division)
10 5 /CHECK . CR 8 0 /CHECK . CR
80 2 /CHECK2 . CR 1 0 /CHECK2 . CR CR

( Egg size)
15 EGGSIZE 24 EGGSIZE 35 EGGSIZE CR

( Any non-zero value is true)
5 TEST -2 TEST 0 TEST CR

( Multiple of 10)
24 MULTIPLE10 50 MULTIPLE10 CR CR

( Number comparison)
5 2 EQNUMBERS 8 8 EQNUMBERS CR CR

( ---------------------------------------------------)

( Negative OR divisible by 10)
: VEGETABLE   DUP 0< SWAP 10 MOD 0= + IF  ." ARTICHOKE "  THEN ;

5 VEGETABLE -2 VEGETABLE 20 VEGETABLE -30 VEGETABLE CR CR

( Check box dimensions - [length width height -- ])
: BOXTEST   6 >  ROT 22 >  ROT 19 >  AND AND IF  ." Big enough "  THEN ;

( Dimensions: width > 22, length > 19, height > 6)
22 19 6 BOXTEST 24 21 8 BOXTEST CR

bye
