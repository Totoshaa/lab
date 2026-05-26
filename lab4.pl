gen_num(X) :- between(1, 9, X).

% собираем список из 4 случайных цифр и проверяем, палиндром ли он
solve_naive(L) :-
    gen_num(A), gen_num(B), gen_num(C), gen_num(D),
    L = [A, B, C, D],
    reverse(L, L).

% генерируем только половину и сразу строим палиндром
solve_opt(L) :-
    gen_num(A), gen_num(B),
    L = [A, B, B, A].
