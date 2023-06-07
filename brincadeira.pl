main :-
    read(Lista),
    read(X),
    brincadeira(X, Lista, R),
    write(R).

brincadeira(X, Lista, R):- soma(X, Lista, R).

soma(X, [], X) :- !.
soma(X, [0|Tail], R) :- soma(X, Tail, R).
soma(X, [Head|Tail], R) :-
    R0 is X + Head, write(R0), write(' '), write(Head), write(' soma '),
    subtrai(R0, Tail, R).
   
subtrai(R0, [], R0) :- !.
subtrai(R0, [0|Tail], R2) :- soma(R0, Tail, R2).
subtrai(R0, [Head|Tail], R2) :-
    R1 is R0 - Head,  write(R1), write(' '), write(Head), write(' subtrai '),
    multiplica(R1, Tail, R2).
   
 multiplica(R1, [], R1) :- !.
 multiplica(R1, [0|Tail], R3) :- soma(R1, Tail, R3).
 multiplica(R1, [Head|Tail], R3) :-
    R2 is R1 * Head,  write(R2), write(' '), write(Head), write(' multiplica '),
    divide(R2, Tail, R3).
    
divide(R2, [], R2) :- !.
divide(R2, [0|Tail], R4) :- soma(R2, Tail, R4).
divide(R2, [Head|Tail], R4) :-
    R3 is R2/Head, write(R3), write(' '), write(Head), write(' divide '),
    soma(R3, Tail, R4).