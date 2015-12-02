subslice(Sublist,List) :-
    append(_,EndSubList,List),
    append(Sublist,_,EndSubList).
