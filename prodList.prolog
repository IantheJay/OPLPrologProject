prod_list(List, Product) :-
    [] = List ->  
    Product is 0 ;
    nonempty_prod_list(List, Product).
