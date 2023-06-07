main :-
    read(N), ( N == 0 -> (Floor is 0, Ceil is 0, Abs is 0); (meu_abs(N, Abs), meu_floor(N, Floor), meu_ceil(N, Ceil))),
    write('Floor de '), write(N), write(' = '), write(Floor), nl,
    write('Ceil de '), write(N), write(' = '), write(Ceil), nl,
    write('Abs de '), write(N), write(' = '), write(Abs), nl,
    halt.

meu_abs(X, Abs) :- (X >= 0 -> Abs is X; Abs is -X).

meu_floor(X, Floor) :-
    ((number_chars(X, Chars), is_integer(Chars, R), R) -> Floor is X;
    (number_chars(X, Chars),
    split_decimal_point(Chars, DecimalChars),
    concatenate_strings('0.', DecimalChars, DecimalPart),
    (DecimalPart == 0 -> Floor0 is X - 1;
    (X >= 0 -> Floor0 is X - DecimalPart;
    Floor0 is X - (1 - DecimalPart))), number_chars(Floor0, Chars0),
    split_integer_point([], Chars0, Output),
    concatenate_strings('', Output,  Floor))).
    
meu_ceil(X, Ceil) :- number_chars(X, Chars), is_integer(Chars, R), (R -> Ceil is X).

meu_ceil(X, Ceil) :-
    ((number_chars(X, Chars1), is_integer(Chars1, R), R) -> Ceil is X;
    (number_chars(X, Chars),
    split_decimal_point(Chars, Dec),
    concatenate_strings('0.', Dec, DecimalPart),
    (DecimalPart == 0 -> Ceil0 is X + 1;
    (X >= 0 -> Ceil0 is X + (1 - DecimalPart);
    Ceil0 is X + DecimalPart)), number_chars(Ceil0, Chars0),
    split_integer_point([], Chars0, Output),
    concatenate_strings('', Output, Ceil))).
    
concatenate_strings(Acc, [], Output) :- 
    atom_chars(Acc, Chars), number_chars(Output, Chars).
concatenate_strings(Acc, [Head|Tail], Output) :-
    atom_concat(Acc, Head, NewAcc),
    concatenate_strings(NewAcc, Tail, Output).
    
split_decimal_point([], []) :- !.
split_decimal_point(['.'|DecimalChars], DecimalChars) :- !.
split_decimal_point([_|Rest], DecimalChars) :-
    split_decimal_point(Rest, DecimalChars).
    
split_integer_point(IntegerPart, [], IntegerPart) :- !.
split_integer_point(IntegerPart, ['.'|_], IntegerPart) :- !.
split_integer_point(IntegerPart, [IntegerP|Rest], Output) :-
    append(IntegerPart, [IntegerP], NewIntegerPart),
    split_integer_point(NewIntegerPart, Rest, Output).
    
is_integer([], true) :- !.
is_integer(['.'|_], false) :- !.
is_integer([_|Tail], R) :- is_integer(Tail, R).
    