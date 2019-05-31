% State Problem
% 3 missionares and 3 cannibals need to travel from one to the other shore
% only 2 persons can be on the boat
% one person has to steer the boat
% there can never be more cannibals than missionares on one shore

% cannibalsleft = CL 	cannibalsright = CR
% missionariesleft = ML 	missionariesright = MR
% Boat = B

% state(+MissionairesRight, +CannibalsRight, +BoatSide)

% initial state
% state (3,3,right)

% final state
% state (0,0,left)

% Movements

mov( move(M, C, left), state(MR, CR, right), state(NMR, NCR, left)) :- 
  move(M,C,left),
  M =< MR, C =< CR, % move if we have people
  NMR is MR - M, NCR is CR - C, % new people to the right
  \+ not_valid(NMR, NCR).
  
mov( move(M, C, right), state(MR, CR, left), state(NMR, NCR, right)) :-
  move(M, C, right),
  ML is 3 - MR, CL is 3 - CR, % initial people to the left
  M =< ML, C =< CL, % enough people to the left to move
  NMR is MR + M, NCR is CR + C, % new people to the right
  \+ not_valid(NMR, NCR).
  
move( 0, 1, _).
move( 1, 0, _).
move( 1, 1, _).
move( 2, 0, _).
move( 0, 2, _).

% notvalid(MR, CR).
not_valid(1, 2).
not_valid(2, 3).
not_valid(1, 3).
not_valid(2, 1).
not_valid(2, 0).

path(Ini, Ini, _, []).
path(Ini, Fin, Visited, [move(M, C, Side)|Path]) :-
  mov( move(M, C, Side), Ini, Temp),
  \+ member(Temp, Visited),
  path(Temp, Fin, [Temp|Visited], Path).
  

  
% INTEGRATE GRAPHICS

misPos([point(9, 180), point(59, 180), point(109, 180), point(259, 180), point(309, 180), point(359, 180)]).
canPos([point(9, 220), point(59, 220), point(109, 220), point(259, 220), point(309, 220), point(359, 220)]).
 
mis([0,0,0,1,1,1]).
can([0,0,0,1,1,1]).


% rotateLeft(List, N, R).

rotateLeft(List, 0, List).
rotateLeft([Head|Tail], N, R2) :-
	N > 0, N2 is N-1,
	append(Tail, [Head], R),
	rotateLeft(R, N2, R2).
  
% rotateRight(List, N, R).

rotateRight(List, 0, List).
rotateRight(List, N, R) :-
	N > 0, N2 is N-1,
	append(L1, [Last], List),
	rotateRight([Last|L1], N2, R).
  
  
  
  
  
  
  
  
  
  
  

% posRight(RX1, RX2, RX3).
xPosRight(59, 109, 159). % MaxX div 2 + 59
YPosMis(20). % MaxY div 2 - 20
yPosCan(20). % MaxY div 2 + 20
xPosLeft(91, 141, 191).

% mov(mov(M, C, Dir), MisPosLeft, MisPosRight, CanPosLeft, CanPosRight).

mov(mov(M, C, left), MisPosLeft, MisPosRight, CanPosLeft, CanPosRight) :-
	lenght(L2, M),
	append(L1, L2, MisPosLeft),















