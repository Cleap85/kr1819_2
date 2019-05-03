% P01 (*): Find the last element of a list

% my_last(List,R) :- R is the last element of the List
%    (list,element) (?,?)

% Note: last(?List, ?Elem) is predefined

  my_last([R],R).
  my_last([_|List],R) :- my_last(List,R).

% P02: Find the last but one element of a list.
%
% last_but_one(List,R) :- R is the last but one element of List
%    (element, list) (?,?)

  last_but_one([R,_], R).
  last_but_one([_|Tail], R) :-  last_but_one(Tail, R).
  
  
  % 1) P(n0)
  % 2) P(n-1) -> P(n)
  %    P(N):- N2 is N-1, P(N2),
