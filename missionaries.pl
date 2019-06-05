% Graphics from Code: visual_cannibals.pl

:- use_module(library(pce)).


window_size(400, 400).

draw_square :-
    window_size(MaxX, MaxY),
	new(Window, picture('My Window River')),
	send(Window, size, size(MaxX, MaxY)),
	send(Window, open),
	draw_lines(Window),
	
% Right side
	
	MX1Right is (MaxX div 2 + 59), MY1Right is (MaxY div 2 - 20),
	draw_angel(Window, MX1Right, MY1Right, _),
	MX2Right is (MaxX div 2 + 109), MY2Right is MY1Right,
	draw_angel(Window, MX2Right, MY2Right, _),
	MX3Right is (MaxX div 2 + 159), MY3Right is MY1Right,
	draw_angel(Window, MX3Right, MY3Right, _),
	
	CX1Right is MX1Right, CY1Right is (MaxY div 2 + 52),
	draw_cannibal(Window, CX1Right, CY1Right, _),
	CX2Right is MX2Right, CY2Right is CY1Right,
	draw_cannibal(Window, CX2Right, CY2Right, _),
	CX3Right is MX3Right, CY3Right	is CY1Right,
	draw_cannibal(Window, CX3Right, CY3Right, _),
	
% Left side
	
    MX1Left is (MaxX div 2 - 91), MY1Left is (MaxY div 2 - 20),
	draw_angel(Window, MX1Left, MY1Left, _),
	MX2Left is (MaxX div 2 - 141), MY2Left is MY1Left,
	draw_angel(Window, MX2Left, MY2Left, _),
	MX3Left is (MaxX div 2 - 191), MY3Left is MY1Left,
	draw_angel(Window, MX3Left, MY3Left, _),
	
	CX1Left is MX1Left, CY1Left is (MaxY div 2 + 52),
	draw_cannibal(Window, CX1Left, CY1Left, _),
	CX2Left is MX2Left, CY2Left is CY1Left,
	draw_cannibal(Window, CX2Left, CY2Left, _),
	CX3Left is MX3Left, CY3Left is CY1Left,
	draw_cannibal(Window, CX3Left, CY3Left, _).

% Lines
	
	draw_lines(Window) :-
	window_size(MaxX, MaxY),
	X11 is (MaxX div 2 + 50),
	Y11 is MaxY,
	X12 is X11, Y12 is 0,
	send(Window, display, new(Pa, path)),
		(
		 send(Pa, append, point(X11, Y11)),
		 send(Pa, append, point(X12, Y12))
		),
	
	X21 is (MaxX div 2 - 50),
	Y21 is MaxY,
	X22 is X21, Y22 is 0,
	send(Window, display, new(Pa2, path)),
		(
		 send(Pa2, append, point(X21, Y21)),
		 send(Pa2, append, point(X22, Y22))
		).
		
draw_cannibal(Window, X, Y, Bitmap) :-
	send(Window, display,
	 new(Bitmap, bitmap('32x32/cannibal.xpm')), point(X, Y)),
	 sleep(1).
		  
draw_angel(Window, X, Y, Bitmap) :-
	send(Window, display,
	new(Bitmap, bitmap('32x32/angel.xpm')), point(X, Y)),
	sleep(1).

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

  
% Window with Cannibals and Missionaries and Lines

draw_square :-
  new(Window, picture('Cannibals and Missionaries')),
  send(Window, size, size(400, 400)),
  send(Window, open).
  

  
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
	
moveGraphics(state(MisGraphState, CanGraphState), [move(Mis, Can, left)| Tail]) :-
  rotateLeft(MisGraphState, Mis, NewMisGraphState),
  rotateLeft(CanGraphState, Mis, NewCanGraphState),
  % Delete elements
  % Paint new state
  % Delay time
  write(state(NewMisGraphState, NewCanGraphState)),
  write(n1),
  moveGraphics(state(MisGraphState, CanGraphState), Tail).
  
moveGraphics(state(MisGraphState, CanGraphState), [move(Mis, Can, right)| Tail]) :-
  rotateRight(MisGraphState, Mis, NewMisGraphState),
  rotateRight(CanGraphState, Mis, NewCanGraphState),
  % Delete elements
  % Paint new state
  % Delay time
  write(state(NewMisGraphState, NewCanGraphState)),
  write(n1),
  moveGraphics(state(MisGraphState, CanGraphState), Tail).
  
  
solution :-  path(state(3,3,right9, state(0,0,_), [], R), draw_square(Window), moveGraphics(

paintState(state([], []), _, _, _, []).
paintState(state([HeadMis|TailMis], [HeadCan|TailCan]),
  [HeadPosMis|TailPosMis], [HeadPosCan|TailPosCan], Window) :-
  drawMis(Window, HeadMis, HeadPosMis, BitmapMis), 
  drawCan(Window, HeadCan, HeadPosCan, BitmapCan),
  paintState(state(TailMis, TailCan), TailPosMis, TailPosCan, BitmapList).
  
drawCan(_, 0, _, _).
drawCan(Window, 1, point(X, Y), Bitmap1) :-
		send(Window, display,
		  new(Bitmap1, bitmap('32x32/cannibal.xpm')), point(X, Y)),
	 sleep(1).

drawMis(_, 0, _, _).
drawMis(Window, 1, point(X, Y), Bitmap1) :-
		send(Window, display,
		  new(Bitmap1, bitmap('32x32/angel.xpm')), point(X, Y)),
	 sleep(1).
