oddMultOf3(Val) :- 
   integer(Val) -> 
   odd(Val), (0 is Val mod 3) ;
   write("ERROR: The given parameter is not an integer"), fail.

odd(Val) :- not(0 is Val mod 2).
