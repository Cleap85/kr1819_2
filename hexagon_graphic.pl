:- use_module(library(pce)).



draw_hexa(X, Y, Len) :-
	new(Window, picture('My Window Hexagon')),
	send(Window, size, size(400, 400)),
	send(Window, open),
	X1 is X - Len div 4,
	Y1 is Y - Len div 2,
	Y2 is Y - Len,
	X3 is X + Len div 3,
	X4 is X + Len div 4 + Len,
	
	send(Window, display, new(Pa, path)),
		(
		  send(Pa, append, point(X, Y)),
		  send(Pa, append, point(X1, Y1)),
		  send(Pa, append, point(X, Y2)),
		  send(Pa, append, point(X3, Y2)),
		  send(Pa, append, point(X4, Y1)),
		  send(Pa, append, point(X3, Y)),
		  send(Pa, closed, @on),
		  send(Pa, fill_pattern, colour(@default, 0, 0, 0)
		)
	).