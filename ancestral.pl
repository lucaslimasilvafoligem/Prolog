gerou(carlos, fabiana).
gerou(carlos, thomas).
gerou(gilberto, carlos).
ancestral(X, Y) :- gerou(X, Y).
ancestral(X, Y) :- gerou(X, Z), ancestral(Z, Y).
