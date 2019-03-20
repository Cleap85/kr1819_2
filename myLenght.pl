% myLength(List, Result)
% it is true if Result unify with the length of List

myLength([], 0).
myLength([Head|Tail], ):-
  myLength(Tail, Result).