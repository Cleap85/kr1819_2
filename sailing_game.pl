% Game of Sailing
% 
% state(pos(X, Y)).
% map(MaxX, MaxY).
%
% size of the map:

map(20, 20).

valid(X, Y) :- map(MaxX, MaxY), X >= 0, Y >= 0, 
  X =< MaxX, Y =< MaxY.

% the boat moves backwards (running):

mov(running, 1, state(X,Y), state(X, Y2)) :-
  Y2 is Y-1, valid(X, Y2).  
  
% movements on one side (starboard):
  
mov(stboard_cl_hauled, 4, state(X,Y), state(X2, Y2)) :-
  X2 is X+1, Y2 is Y+1, valid(X2, Y2).
mov(stboard_beam_reached, 2, state(X,Y), state(X2, Y)) :-
  X2 is X+1, valid(X2, Y).
mov(stboard_broad_reached, 1, state(X,Y), state(X2, Y2)) :-
  X2 is X+1, Y2 is Y-1, valid(X2, Y2).

% other side (port):
  
mov(port_cl_hauled, 4, state(X,Y), state(X2, Y2)) :-
  X2 is X-1, Y2 is Y+1, valid(X2, Y2).
mov(port_beam_reached, 2, state(X,Y), state(X2, Y)) :-
  X2 is X-1, valid(X2, Y).
mov(port_broad_reached, 1, state(X,Y), state(X2, Y2)) :-
  X2 is X-1, Y2 is Y-1, valid(X2, Y2).
  
% creating the path:
%
% path(+Ini, +Fin, +Visited, -Path, -Time)
% it is true if Path unify with the list of movements to go to
% from position Ini to position Fin without repeating 
% Visited positions. Time unify with the total path time.

path(Ini, Ini, _, [], 0).

path(Ini, Fin, Visited, [Mov|Path], Totaltime) :- 
  mov(Mov, TimeMov, Ini, Temp),
  \+ member(Temp, Visited),
  path(Temp, Fin, [Temp|Visited], Path, Time),
  Totaltime is Time + TimeMov.
  