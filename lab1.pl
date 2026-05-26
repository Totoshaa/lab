% Факты о сменах
shift(mary, day). shift(susie, day). shift(jane, day).
shift(sam, night). shift(jane, night). shift(bob, night). shift(patricia, night).

% Знают друг друга те, кто работает в одну смену (и это разные люди)
knows(X, Y) :- 
    shift(X, Shift), 
    shift(Y, Shift), 
    X \= Y.
