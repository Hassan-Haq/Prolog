
legalPath([],[]).
legalPath([X,_], [X]).
legalPath([X,_,Z], [X,Z]).
legalPath([X,_,Z,_], [X,Z]).
legalPath([X,_,_,A], [X,A]).
legalPath([X,_|L], [X|R]) :-
	legalPath(L,R).
legalPath([X,_,_|L], [X|R]):-
	legalPath(L,R).

betterPath([],[],[]).
%betterPath([], Path2, Path2).
%betterPath(Path1, [], Path1).
betterPath(Path1, Path2, Better):-
	sum_list(Path1,Sum1),
	sum_list(Path2,Sum2),
	(Sum1 >= Sum2)->Better = Path1; Better = Path2.

bestPathOfList([],[]).
bestPathOfList([X], X).
bestPathOfList([X,Y|Xs], Best) :-
	betterPath(X,Y, Better),
	append([Better],Xs,Lol),
	bestPathOfList(Lol, B),
	Best = B.

	
listOLists(List,Lol):-
	setof(L,legalPath(List,L),Lol).

hopscotch(List, Best) :-
	listOLists(List, Lol),
	bestPathOfList(Lol, Best).

