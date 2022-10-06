
( Io)

( ---------------------------------------------------)

( Display ASCII characters)
65 EMIT CR
66 EMIT CR

( Display characters from terminal input buffer)
TIB #TIB @ TYPE CR

( Display string from definition)
: TEST   ." sample" ;
' TEST >BODY CELL+ CELL+ 6 TYPE CR

( Superstring)
: "LABEL"  ." REJECT  SMALL   MEDIUM  LARGE   XTRA LRGERROR   " ;

( Display second label - 2 * 8 = 16)
' "LABEL" >BODY CELL+ CELL+ 16 + 8 TYPE CR

: LABEL   8 * ['] "LABEL" >BODY CELL+ CELL+  +  8 TYPE ;

( Third label)
3 LABEL CR

: "LABEL2"  C" REJECT  SMALL   MEDIUM  LARGE   XTRA LRGERROR   " ;
: LABEL2   8 *  "LABEL2" 1+ +  8 TYPE ;

( Fourth label)
4 LABEL2 CR

( Print lines from block)
( 1 BLOCK 64 TYPE CR)
( 1 BLOCK 512 + 64 TYPE CR)

( Generate random numbers)
VARIABLE rnd   HERE rnd !
: RANDOM   rnd @ 31421 *  6927 +  DUP rnd ! ;
: CHOOSE   RANDOM UM*  NIP ;
10 CHOOSE . 10 CHOOSE .
10 CHOOSE . 10 CHOOSE .
CR

( Don't print trailing blanks)
( 1  BLOCK 64 -TRAILING TYPE)

( Read one character from input and print its ASCII code)
( KEY ." Code: " . CR)

( Display blocks)
: BLOCKS
  SCR @ + SCR @ DO
    I LIST KEY DROP
  LOOP ;
( 5 BLOCKS)

( Store 10 characters in terminal input buffer)
( TIB 10 ACCEPT)

( Take delimiter and scan input stream)
( Fill pad with blanks)
( Parse one word and leave address on stack)
( Count number of characters and increment address)
( Move string to pad)
: TEXT
  PAD 258 BL FILL
  WORD COUNT PAD SWAP MOVE ;

( Create array)
CREATE my-name 40 ALLOT

( Parse word and move it to 'my-name' array)
: I'M   BL TEXT PAD my-name 40 MOVE ;

( Set array value)
I'M EDWARD

( Use variable in definition)
: GREET   ." Hello, " my-name 40 -TRAILING TYPE  ." , I speak Forth. " ;
GREET CR

( Create three arrays)
CREATE mname 14 ALLOT
CREATE eyes 12 ALLOT
CREATE me 14 ALLOT

( Set strings using comma as delimiter)
( ASCII character with code 1 never appears in input)
( In this case separator is carriage return)
: VITALS
  [CHAR] , TEXT PAD mname 14 MOVE
  [CHAR] , TEXT PAD eyes 12 MOVE
  1 TEXT PAD me 14 MOVE ;

( Display letter)
: LETTER   PAGE  ." Dear " mname 14 -TRAILING TYPE ." ,"
  CR ." I go to heaven whenever I see your deep "  
  eyes 12 -TRAILING TYPE ."  eyes. Can 
  CR ." you go to the movies Friday? "
  CR 30 SPACES ." Love, "
  CR 30 SPACES me 14 -TRAILING TYPE
  CR ." P.S. Wear something " eyes 12 -TRAILING TYPE
  ."  to show off those eyes! " ;

( VITALS Alice,blue,Fred)
( LETTER CR)

( Put terminal input buffer address and 40 on stack)
( Store up to 40 characters in terminal input buffer with 'ACCEPT')
( Return number of stored characters)
( Save number of stored characters in #TIB)
( Reset pointer >IN)
: GREET2
  ." What's your name? "
  TIB 40 ACCEPT #TIB ! 0 >IN !
  1 TEXT CR
  ." Hello, " PAD 40 -TRAILING TYPE ." , I speak Forth. " CR ;
( GREET2)

( Put left value on and double-length zero on stack)
( Parse word from input stream and leave its address on stack)
( Check word length and increment address)
( Convert character string into binary value)
( Drop string and half of double-length value)
( Add numbers and display result)
: PLUS   0. BL WORD COUNT >NUMBER 2DROP DROP  + ." = " . ;
." 2 + 13 " 2 PLUS 13 CR
." --- " CR

( ---------------------------------------------------)

( Problem 1)
( Each string has length of 6)
: ANIMALS
  C" rat   ox    tiger rabbitdragonsnake horse ram   monkeycock  dog   boar  " ;

( Display animal name)
: .ANIMAL
  6 * ANIMALS 1+ + 6 -TRAILING TYPE ;

( Display all animal names)
: ALL_ANIMALS
  12 0 DO
    I 1+ . I .ANIMAL CR
  LOOP ;
ALL_ANIMALS
." --- " CR

( Problem 2)
: (JUNEESHEE) 
  1900 - 12 MOD
  ." You were born in the year of the "
  .ANIMAL [CHAR] . EMIT CR ;

1899 (JUNEESHEE)
1900 (JUNEESHEE)
2000 (JUNEESHEE)
." --- " CR

( Problem 3)
( Read and display one digit)
( Subtract code of zero from key code to calculate character value)
: DIGIT   KEY DUP EMIT [CHAR] 0 - ;

( Read for digits of year)
( Multiply times 10 to get correct year)
: YEAR
  0 4 0 DO
    10 * DIGIT +
  LOOP ;

: JUNEESHEE
  CR  ." In what year were you born? "  YEAR CR (JUNEESHEE) ;
( JUNEESHEE)

bye
