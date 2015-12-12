%1A 
vampire(Name) :- whedon(_,_,Name,vampire).

%1B
category(Char, Job) :- whedon(_,_,Char,Job).

%1C
twice(Actor) :- 
	whedon(Show1,Actor,Role1,_),
	whedon(Show2,Actor,Role2,_),
	Show1 \= Show2,
	Role1 \= Role2.
%1D
hatTrick(Actor) :- 
	whedon(buffy,Actor,_,_),
	whedon(firefly,Actor,_,_),
	whedon(angel,Actor,_,_).
	
%2A
hasOscar(Actor) :- 
	oscar(award(_,_,winner), person(Actor,_)).
%2B
winner(Actor,Year,Award) :- 
	oscar(award(Award,Year,winner), person(Actor,_)).
	
winner(Film,Year,Award) :-
	oscar(award(Award,Year,winner), film(Film)).

%2C	
doubleNominee(Actor) :-
	oscar(award(Award1,_,_), person(Actor,_)),
	oscar(award(Award2,_,_), person(Actor,_)),
	Award1 \= Award2.
doubleNominee(Actor) :-
	oscar(award(_,Time1,_), person(Actor,_)),
	oscar(award(_,Time2,_), person(Actor,_)),
	Time1 \= Time2.
