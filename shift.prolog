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
