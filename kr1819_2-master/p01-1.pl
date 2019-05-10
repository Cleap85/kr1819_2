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

% P03: Find the K´s element of a list.

%  element_at(X,[_|X],1).
%  element_at(
 
% P06: Find out a palindrome.
%
% first part: Reverse the List.
%
   myReverse([], []).
   myReverse([Head|Tail], R2) :- myReverse(Tail, R), append(R, [Head], R2).
%
% second part: palindrome problem.
%
  palindrome(L) :- reverse(L, L).
%
% P09: Pack consecutive elements dublicates of list  elements into sublists.
%
% Example:
% pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
% X = [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]

  pack([], []).
  
  pack([E], [[E]]).
  pack([H1, H1|Tail], [[H1|Hr]|Tr]) :- pack([H1|Tail], [Hr|Tr]).
  
  pack([H1, H2|Tail], [[H1]|R]) :- H1 \= H2, pack([H2|Tail], R).