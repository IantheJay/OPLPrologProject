segregate([], [], []).
segregate([Head | Tail], [Head | EvenTail], Odd) :-
    0 is mod(Head, 2), !, segregate(Tail, EvenTail, Odd).
segregate([Head | Tail], Even, [Head | OddTail]) :-
    segregate(Tail, Even, OddTail).
