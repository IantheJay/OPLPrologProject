prod_list(List, Product) :-
    [] = List ->  
    Product is 0 ;
    nonempty_prod_list(List, Product).

nonempty_prod_list([], 1).
nonempty_prod_list([Head | Tail], Product) :-
    nonempty_prod_list(Tail, RecurseProduct),
    Product is Head * RecurseProduct.
