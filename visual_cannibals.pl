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