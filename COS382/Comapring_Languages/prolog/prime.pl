:- use_module(library(clpfd)).

prime(N) :-
    prime_decomp(N,[_P]).

prime_decompo(N, Z) :-
    N #> 0,
    indomain(N),
    prime_decomp_ceiled_square_root(N,SN),
    prime_decomp_1(N, SN, 2, [], Z).

prime_decomp_1(1, _, _, L, L) :- !.
prime_decomp_1(N, SN, D, L, LF) :-
    (   
        0 #= N mod D ->
        Q #= N // D,
        prime_decomp_ceiled_square_root(Q,SQ),
        prime_decomp_1(Q, SQ, D, [D |L], LF)
        ;
        D1 #= D+1,
        (    
            D1 #> SN ->
            LF = [N |L]
            ;
            prime_decomp_2(N, SN, D1, L, LF)
        )
    ).

prime_decomp_2(1, _, _, L, L) :- !.
prime_decomp_2(N, SN, D, L, LF) :-
    (   
        0 #= N mod D ->
        Q #= N // D,
        prime_decomp_ceiled_square_root(Q,SQ),
        prime_decomp_2(Q, SQ, D, [D |L], LF);
        D1 #= D+2,
        (    
            D1 #> SN ->
            LF = [N |L]
            ;
            prime_decomp_2(N, SN, D1, L, LF)
        )
    ).

prime_decomp_ceiled_square_root(0, 0).
prime_decomp_ceiled_square_root(N0, Root) :-
        N1 #= N0 - 1,
        Max in 0..N1,
        R0^2 #= Max,
        Root #= Root0 + 1,
        fd_sup(R0, Root0).

ordered_sub([],[],0).
ordered_sub([H|T],[H|T2],N) :-
     M #= N - H,
     M #>= 0,
    ordered_sub(T,T2,M).
ordered_sub([_|T],T2,N) :-
    ordered_sub(T,T2,N).

partition(N,Z) :-
    findall(P, (P in 2..N, prime(P)), L),
    findall(S, ordered_sub(L, S, N), Z).
