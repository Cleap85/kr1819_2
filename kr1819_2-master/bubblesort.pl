
%
bubblesort(List, List) :- sorted(List).
bubblesort(List, R1) :-  
append(L1, [E1,E2|L2], List),
E1>E2,
append(L1, [E2,E1|L2], R2),
bubblesort(R2, R1).
%
%
%
%
sorted([]).
sorted([_]).
sorted([Cab1, Cab2|R]) :-
Cab1 =< Cab2,
sorted[Cab2|R]).