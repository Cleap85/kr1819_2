% Hanoi game
%
% The goal of ths game is move N discs from A to C using B as auxilary tower. the restriction for this game is 
% that it is not possible to put a disc over another one with smaller size.
%
%		|		|		|
% 		|		|		|
%	  -----   -----   -----
%		A		B 		C
% 
% 1. Move n-1 discs from A to B using C as auxilary tower.
% 2. Move 1st disc from A to C.
% 3. Move n-1 discs from B to C using A as auxilary tower.

% hanoi(+Num, +A, +B, +C, -Result
% it is true if result unify with a list of movements to translate Num discs from tower A to C using B
% as auxilary tower.

hanoi(1, A, _, C, [move(A, C)]).
  
hanoi(N, A, B, C, R):-
  N2 is N-1,
  hanoi(N2, A, C, B, R1),
  hanoi(1, A, _, C, R2),
  hanoi(N2, B, A, C, R3),
  append([R1, R2, R3], R).