main :- 
    read(N),
    dobro(N, Dobro),
    write(Dobro).

dobro(N, Dobro) :- Dobro is 2 * N.
