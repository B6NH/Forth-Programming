
( Fixed)

( ---------------------------------------------------)

." Operators: " CR
9 1+ . CR
30 2/ . CR
-5 ABS . CR
12 6 MAX . CR
4 8 MIN . CR
99 NEGATE . CR

." ---- " CR

( Return smaller value [1/10 or 50])
: COMMISSION   10 / 50 MIN ;
." Commision: " CR
1000 COMMISSION . CR
400 COMMISSION . CR

." ---- " CR

( Reorder numbers using return stack)
: NEW_ORDER   >R SWAP R> ;
." Order of numbers: "
2 3 1 NEW_ORDER . . . CR

( Solve quadratic equation)
( a b c x -- n )
: QUADRATIC   >R SWAP ROT R@ *  + R> * + ;

( >R    2 7 9 [3])
( SWAP  2 9 7 [3])
( ROT   9 7 2 [3])
( R@    9 7 2 3 [3]) 
( *     9 7 6 [3]) ( 2*3)
( +     9 13 [3]) ( 2*3+7)
( R>    9 13 3)
( *     9 39) ( 3[2*3+7])
( +     48) ( 3[2*3+7]+9 = 2*3^2 + 7*3 + 9)
." Quadratic equation: "
2 7 9 3 QUADRATIC . CR

." ---- " CR

." Scaling operator [star-slash]:" CR

( Perform multiplication and then division)
( 225 * 32 / 100)
225 32 100 */ . CR

( Calculate percentage)
: %   100 */ ;
1000 25 % . CR

( Calculate rounded percentage)
: R%   10 */  5 +  10 / ;
." Rounded percentage: "
225 32 R% .
226 32 R% .
227 32 R% . CR

( Calculate 2/3 of 171)
( 171 * 2 / 3)
." 2/3 of 171: "
171 2 3 */ . CR

( Calculate proportions)
( 7,105      ?)
( 5,145      ?)
( 12,250     150)

." ---- " CR

." Proportions: "
7105 150 12250 */ .
5145 150 12250 */ . CR

( Star-slash-mod operator)
." Quotient and remainder: "
5 4 7 */MOD . . CR

." ---- " CR

( Calculate area of circle)
: MPI   DUP * 31416 10000 */ ;
." Circle area 1: " 10 MPI . CR

( Better PI approximation)
: MPI2   DUP * 355 113 */ ;
." Circle area 2: " 20 MPI . CR

( ---------------------------------------------------)

( Problem 1)

( Problem 2)

( Problem 3)

( Problem 4)

bye

