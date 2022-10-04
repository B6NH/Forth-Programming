
( Number)

( ---------------------------------------------------)

( Arithmetic left shift)
16 2* . CR

( Arithmetic right shift)
16 2/ . CR

( All printable characters)
: PRINTABLES   127 32 DO  I EMIT SPACE  LOOP ;
PRINTABLES CR

( Print as signed or unsigned numbers)
18446744073709551616 DUP . U. CR

( Set base to 16)
HEX

F 2 * .

( Set base to 10)
DECIMAL

( Convert decimal 100 into hexadecimal)
100 HEX . CR
DECIMAL

( Print signed double-length number)
200000. D. CR

( Number-formatting definition)
: UD2.   <# #S #> TYPE ;

12.345 UD2. CR
12. UD2. CR
0. UD2. CR

( Print phone number)
: .PH#   <# # # # # [CHAR] - HOLD #S #> TYPE SPACE ;
." Phone: " 9996784. .PH# CR

( Print date)
: .DATE   <# # # [CHAR] / HOLD   # # [CHAR] / HOLD  #S #>  TYPE SPACE ;
61503. .DATE CR

( Print time)
: SEXTAL   6 BASE ! ;
: :00   # SEXTAL # DECIMAL [CHAR] : HOLD ;
: SEC   <# :00 :00 #S #>  TYPE SPACE ;
4500. SEC CR

( Format number with dollar sign)
: .$   TUCK DABS  <#  # # [CHAR] . HOLD  #S  ROT SIGN  [CHAR] $ HOLD  #>  TYPE SPACE ;
2000.00 .$ CR
2.000.00 .$ CR

( ---------------------------------------------------)

." --- " CR

( Problem 1)
( 9223372036854775807)
: TEST-MAX   1 BEGIN 1+ DUP 0< UNTIL 1- . ;
( TEST-MAX CR)

( Problem 2)
( Logical or unlike addition, does not perform any carries)

( Problem 3)
: BEEP   ." BEEP "  7 EMIT CR ;
: DELAY   100 MS ;
: RING   BEEP DELAY BEEP DELAY BEEP ;
RING
." --- " CR

( Problem 4)
( Add double-length to single-length)
( Multiply and divide double-length number by single-length numbers)
: F>C   -320 M+  10 18 M*/ ;
: C>F   18 10 M*/  320 M+ ;
: C>K   2732 M+ ;
: K>C   -2732 M+ ;
: F>K   F>C C>K ;
: K>F   K>C C>F ;
90.0 F>C D. CR
100.0 C>K D. CR
600.0 K>F D. CR
." --- " CR

( Problem 5)
: .DEG   TUCK DABS <#  #  [CHAR] . HOLD  #S  ROT SIGN  #>  TYPE SPACE ;
7.8 .DEG CR
-12.5 .DEG CR
." --- " CR

( Problem 6)
0.0 F>C .DEG CR
212.0 F>C .DEG CR
20.0 F>C .DEG CR
16.0 C>F .DEG CR
-40.0 C>F .DEG CR
100.0 K>C .DEG CR
100.0 K>F .DEG CR
233.0 K>C .DEG CR
233.0 K>F .DEG CR
." --- " CR

( Problem 7)
( 7x^2 + 20x + 5 = x[7x + 20] + 5)
: EQUATION   DUP 7 * 20 + M* 5 M+ ;
." Equation: " 5 EQUATION D. CR
." --- " CR

( Problem 8)
( Word 'U.R' prints unsigned single-length number right-justified)
: BINARY   2 BASE ! ;
: .BASES
   17 0 DO
     ." DECIMAL" DECIMAL I 3 U.R 5 SPACES
     ." HEX " HEX I 2 U.R 5 SPACES
     ." BINARY" BINARY I 6 U.R 5 SPACES
     CR
   LOOP DECIMAL ;
.BASES
." --- " CR

( Problem 9)
( Current Forth interpreter treats decimal points as double specifiers)

( Problem 10)
: .PH2   <# # # # #  [CHAR] - HOLD  # # # OVER IF  [CHAR] / HOLD  #S THEN  #>  TYPE SPACE ;
." Phone: " 5551234. .PH2 CR
." Area: " 3105551234. .PH2 CR

bye
