bookends(List1,List2,List3) :-
    frontend(List1,List3),
    backend(List2,List3).

frontend([], _).
frontend([He | Ta], [Head | Tail]) :-
    He = Head ,
    frontend(Ta, Tail).

backend([], []) :- true.
backend([], _) :- true.
backend(_, []) :- false.
backend([BackHe | BackTa], [Head | Tail]) :-
    length([BackHe | BackTa], BackLength),
    length([Head | Tail], ListLength),
    (   ListLength = BackLength ->  
    	BackHe = Head, backend(BackTa,Tail) ;
    	backend([BackHe | BackTa], Tail)
    ).
