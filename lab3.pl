:- dynamic product/3. 
:- dynamic stock/2.   

setup_db :-
    retractall(product(_,_,_)), retractall(stock(_,_)),
    assertz(product(1, 'Ноутбук', 80000)),
    assertz(product(2, 'Мышка', 1500)),
    assertz(stock('DNS', 1)),
    assertz(stock('DNS', 2)),
    assertz(stock('MVideo', 1)),
    write('Данные загружены'), nl.

run_shop :-
    nl, write('ЭЛЕКТРОННЫЙ МАГАЗИН'), nl,
    write('1. Сброс БД | 2. Каталог | 3. Добавить товар | 4. Списать товар'), nl,
    write('Команда: '), read(Cmd),
    process(Cmd).

process(1) :- setup_db, run_shop.
process(2) :- show_prods, run_shop.
process(3) :- add_p, run_shop.
process(4) :- del_p, run_shop.
process(_). % Любой другой ввод просто завершает работу без сообщений

show_prods :-
    (product(I, N, P), write('Товар #'), write(I), write(': '), write(N), write(' ('), write(P), write(' руб)'), nl, fail ; true).

add_p :- 
    write('ID: '), read(I), write('Имя: '), read(N), write('Цена: '), read(P), 
    assertz(product(I, N, P)), write('Добавлено'), nl.

del_p :- 
    write('ID списания: '), read(I), 
    retractall(product(I,_,_)), retractall(stock(_,I)), write('Списано'), nl.
