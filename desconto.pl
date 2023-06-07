main :-
    read(Preco),
    read(Tamanho),
    calcula_Preco(Preco, 0, 0, 0, Tamanho, R),
    write(R).
    
calcula_Preco(Preco, G, P, M, -1, R) :-
    Total is (G + P + M) * Preco,
    desconto(G, P, M, Desconto),
    R is Total - (Total * Desconto).
    
calcula_Preco(Preco, G, P, M, Tamanho, R) :-
    (
    Tamanho = 'g' ->
    G2 is G + 1, read(ProximoTamanho), calcula_Preco(Preco, G2, P, M, ProximoTamanho, R);
    Tamanho = 'p' ->
    P2 is P + 1, read(ProximoTamanho), calcula_Preco(Preco, G, P2, M, ProximoTamanho, R);
    Tamanho = 'm' ->
    M2 is M + 1, read(ProximoTamanho), calcula_Preco(Preco, G, P, M2, ProximoTamanho, R)
    ).
    
    desconto(G, P, M, R) :-
    R0 is 0,
    (G > 3 -> R1 is R0 + 0.04; R1 is R0),
    (P > 3 -> R2 is R1 + 0.08; R2 is R1),
    (M > 3 -> R is R2 + 0.06; R is R2).