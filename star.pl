star(sun).
star(sirius).
star(betelgeuse).
via_lactea(X) :- star(X).

print_result :-
    via_lactea(X),
    write(X), nl,
    fail.
print_result.
