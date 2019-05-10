% inverter(+List, -Result)
% it is true fif Result unify with a list
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