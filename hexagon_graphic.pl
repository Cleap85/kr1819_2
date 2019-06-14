:- use_module(library(pce)).


% to show the graphic in Prolog write hexagon.

hexagon :- draw_hexa(200, 200, 100).

draw_hexa(X, Y, Len) :-
	new(Window, picture('My Window Hexagon')),
	send(Window, size, size(400, 400)),
	send(Window, open),
	X1 is X - (Len div 2),
	X2 is X + (Len div 2),
	X3 is X + Len,
	Y1 is Y - (Len div 2),
	Y2 is Y - Len,
	
	send(Window, display, new(Pa, path)),
		(
		  send(Pa, append, point(X, Y)),
		  send(Pa, append, point(X1, Y1)),
		  send(Pa, append, point(X, Y2)),
		  send(Pa, append, point(X2, Y2)),
		  send(Pa, append, point(X3, Y1)),
		  send(Pa, append, point(X2, Y)),
		  send(Pa, closed, @on),
		  send(Pa, fill_pattern, colour(@default, 0, 0, 0)
		)
	).