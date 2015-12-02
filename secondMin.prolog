secondMin(List, Min) :-
    length(List, Len),
    Len < 2 ->  
    write("ERROR: List has fewer than 2 members."), nl, fail ;
    
    ( listCheck(List),
      sort(0, @=<, List,  Sorted),
      [_,Min | _] = Sorted
    ).
    
    
listCheck([]).
listCheck([Head | Tail]) :-
    number(Head) ->  
    listCheck(Tail) ;
    write("ERROR: "), write(Head), write(" is not a number."), nl, fail.
