homem(francisco).
homem(joao).
homem(fernando).
mulher(anna).

mae(joao, roberta).
mae(francisco, roberta).

pai(joao, paulo).
pai(francisco, paulo).
pai(fernando, paulo).

pais(X, M, P) :- mae(X, M), pai(X, P).

homem_ou_mulher(Pessoa) :-
    (homem(Pessoa) ; mulher(Pessoa)).

irmao_ou_irma(X, Y) :-
    homem_ou_mulher(X),
    homem_ou_mulher(Y),
    (pais(X, P, _) ; pais(X, _, P)),
    (pais(Y, P, _) ; pais(Y, _, P)),
    X \= Y.
