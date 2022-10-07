
( Classic)

( ---------------------------------------------------)

( Create variables)
VARIABLE DENSITY
VARIABLE THETA
VARIABLE ID

( Compile string and leave its address on stack)
: "   [CHAR] " WORD DUP C@ 1+ ALLOT ;

( Save 3 arguments for material)
( At run-time set values of THETA, DENSITY and ID)
: MATERIAL
  CREATE , , ,
  DOES> DUP @ THETA !
  CELL+ DUP @ DENSITY ! CELL+ @ ID ! ;

( Display material name)
: .SUBSTANCE   ID @ COUNT TYPE ;

( Convert units)
: FOOT   10 * ;
: INCH   100 12 */ 5 + 10 / + ;

( Divide by tangent)
( Multiply by 1000 to scale)
: /TAN   1000 THETA @ */ ;

( Calculate pile weight)
( W = [PI * h^3 * DENSITY] / [3 * tan[THETA]^2])
( PI = 355 / 113, PI / 3 = 355 / 339)
: PILE
  DUP DUP 10 */ 1000 */ 355 339 */ /TAN /TAN
  DENSITY @ 200 */ ." = " . ." tons of " .SUBSTANCE ;

( Define materials)
( Values are string address, density and angle tangent)
" cement"           131        700  MATERIAL CEMENT
" loose gravel"      93        649  MATERIAL LOOSE-GRAVEL
" packed gravel"    100        700  MATERIAL PACKED-GRAVEL
" dry sand"          90        754  MATERIAL DRY-SAND
" wet sand"         118        900  MATERIAL WET-SAND
" clay"             120        727  MATERIAL CLAY

( ---------------------------------------------------)

CEMENT
10 FOOT PILE CR
10 FOOT 3 INCH PILE CR

DRY-SAND
10 FOOT PILE CR

bye

