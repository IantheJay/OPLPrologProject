%begin oddMultOf3 predicate
oddMultOf3(Val) :- 
   integer(Val) -> 
   odd(Val), (0 is Val mod 3) ;
   write("ERROR: The given parameter is not an integer"), fail.

odd(Val) :- not(0 is Val mod 2).
%end oddMultOf3

%begin prodList predicate
prod_list(List, Product) :-
    [] = List ->  
    Product is 0 ;
    nonempty_prod_list(List, Product).

nonempty_prod_list([], 1).
nonempty_prod_list([Head | Tail], Product) :-
    nonempty_prod_list(Tail, RecurseProduct),
    Product is Head * RecurseProduct.
%end prodList

%begin palindrome predicate
palindrome(List) :- reverse(List,List).
%end palindrome

%begin secondMin predicate
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
%end secondMin

%begin segregate predicate
segregate([], [], []).
segregate([Head | Tail], [Head | EvenTail], Odd) :-
    0 is mod(Head, 2), !, segregate(Tail, EvenTail, Odd).
segregate([Head | Tail], Even, [Head | OddTail]) :-
    segregate(Tail, Even, OddTail).
%end segregate

%begin bookends predicate
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
%end bookends

%begin magic
subslice(Sublist,List) :-
    append(_,EndSubList,List),
    append(Sublist,_,EndSubList).
%end magic

%begin shift predicate
shift(List, ShftAmt, Shifted) :-
    ShftAmt >= 0 ->  
    (   shiftHelp(List, ShftAmt, ListFront, ListBack), 
    	append(ListBack,ListFront,Shifted)
    ) ;
    
    (   reverse(List,RevList), 
    	shiftHelp(RevList, ShftAmt * -1, ListFront, ListBack),
        reverse(ListFront, Front),
        reverse(ListBack, Back), 
    	append(Front, Back, Shifted)
    ).
   
shiftHelp(List, 0, [], List).
shiftHelp(List, ShftAmt, ListFront, ListBack) :-
    List = [H | T],
	( 	ShftAmt1 is ShftAmt -1, 
    	shiftHelp(T, ShftAmt1, ListFront1, ListBack),
        ListFront = [H | ListFront1]
    ).
%end shift

%begin path and cycle predicates
edge(a,b).
edge(b,c).	
edge(c,d).	
edge(d,a).	
edge(d,e).	
edge(b,a).	
 

path(Start, End) :- edge(Start,End), !.
path(Start, End) :- edge(Start, Intermediate), path(Intermediate, End).

cycle(Node) :- path(Node,Node).
%end path and cycle
