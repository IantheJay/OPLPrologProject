secondMin(List, Min2) :-
    length(List, Len),
    Len < 2 ->  
    write("ERROR: List has fewer than 2 members."), nl, fail ;
    
    ( listCheck(List),
      sort(0, @=<, List,  Sorted),
      [_,Min2 | _] = Sorted
    ).
    
    
listCheck([]).
listCheck([Head | Tail]) :-
    number(Head) ->  
    listCheck(Tail) ;
    write("ERROR: "), write(Head), write(" is not a number."), nl, fail.
