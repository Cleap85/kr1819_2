% myReverse(+List, -Result)
% it is true if Result unify with a list
% with the same elements that List have but in reverse order
%
% ? myReverse([1,2,3,4], R).
% R = [4,3,2,1].

  myReverse([], []).

  myReverse([Head|Tail], R2) :- myReverse(Tail, R),
    append(R, [Head], R2).

% myReverse([1,2,3,4], R2) :- myReverse([2,3,4], [4,3,2]),

% ? append([1,2,3], [4,5,6], R).
% R = [1,2,3,4,5,6]
%
%
% new session
% pg. 76 in Prolog.pdf
% 
% Bubblesort
%
  bubblesort(List, List) :- sorted(List).
  bubblesort(List, R1) :-  
  append(L1, [E1,E2|L2], List),
  E1>E2,
  append(L1, [E2,E1|L2], R2),
  bubblesort(R2, R1).
%
%
% Sort a List
%
  sorted([]).
  sorted([_]).
  sorted([Head1, Head2|R]) :-
  Head1 =< Head2,
  sorted([Head2|R]).
%
%
% Insertion
%
%
  sortinsert([], []).
  sortinsert([Head|Tail], R2):-
	 sortinsert(Tail, R),
	 insert(Head, R, R2).
	 

  insert(Elem, [], [Elem]).
  insert(Elem, [Head|Tail], [Elem, Head|Tail]):-
  Elem =< Head.
  insert(Elem, [Head|Tail], [Head|R]):-
  Elem > Head,
  insert(Elem, Tail, R).
%
%
% Quicksort
%
%
  divide(_,[],[],[]).
  divide(Elem, [Head|Tail], Lower, [Head|Higher]):-
  Head > Elem,
  divide(Elem, R, Lower, Higher).
  divide(Elem, [Head|R], [Head|Lower], Higher):-
  Head =< Elem,
  divide(Elem, R, Lower, Higher).
%
%
% List the primenumbers X to Y
%
%
  listDivisors(_, 1, [1]).
  listDivisors(X, Y, [Y|R]):- Y > 1,
  Y2 is Y-1,
  listDivisors(X,Y2, R),
  0 is X mod Y.
  listDivisors(X, Y, R):- Y > 1,
  Y2 is Y-1,
  listDivisors(X,Y2, R),
  Z is X mod Y, Z \== 0.