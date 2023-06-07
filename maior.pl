main :-
    read(Listas),
    maior(Listas, 1, Rlinha, Rcoluna, _),
    write(Rlinha), write(' '), write(Rcoluna),
    halt.
    
maior([], _, _, _, 'FLAG') :- !.
maior([Head|Tail], RlinhaEntrada, RlinhaSaida, Rcoluna, Maior) :-
    maior_coluna(Head, 1, RcolunaSaida, NewMaior1),
    RlinhaEntrada1 is RlinhaEntrada + 1,
    maior(Tail, RlinhaEntrada1, RlinhaSaida1, Rcoluna1, NewMaior2),
    (
        (NewMaior2 == 'FLAG';  NewMaior1 >= NewMaior2) ->
            (
                Maior is NewMaior1,
                RlinhaSaida is RlinhaEntrada,
                Rcoluna is RcolunaSaida
            );
            (
                Maior is NewMaior2,
                RlinhaSaida is RlinhaSaida1,
                Rcoluna is Rcoluna1
            )
    ).
    
maior_coluna([], _, _, 'FLAG') :- !.
maior_coluna([Head|Tail], RcolunaEntrada, RcolunaSaida, Maior) :-
    RcolunaEntrada1 is RcolunaEntrada + 1,
    maior_coluna(Tail, RcolunaEntrada1, RcolunaSaida1, Proximo),
    ((Proximo == 'FLAG'; Head >= Proximo) ->
        (Maior is Head, RcolunaSaida is RcolunaEntrada);
        (Maior is Proximo, RcolunaSaida is RcolunaSaida1)
    ).