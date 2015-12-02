edge(a,b).
edge(b,c).	
edge(c,d).	
edge(d,a).	
edge(d,e).	
edge(b,a).	
 

path(Start, End) :- edge(Start,End), !.
path(Start, End) :- edge(Start, Intermediate), path(Intermediate, End).

cycle(Node) :- path(Node,Node).
