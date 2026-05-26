% Вариант 15: Найти сумму элементов на нечетных местах
sum_odd([], 0).
sum_odd([X], X).
sum_odd([Odd, _Even | Tail], Sum) :-
    sum_odd(Tail, RestSum),
    Sum is Odd + RestSum.

% Вариант 23: Удалить максимальный элемент
% Вспомогательная функция поиска максимума
find_max([X], X).
find_max([H|T], Max) :- 
    find_max(T, MTail), 
    (H > MTail -> Max = H ; Max = MTail).

% Удаление первого вхождения максимума
delete_one(X, [X|T], T) :- !.
delete_one(X, [H|T], [H|R]) :- delete_one(X, T, R).

remove_max(List, Result) :-
    find_max(List, Max),
    delete_one(Max, List, Result).
