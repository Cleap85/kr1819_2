:- use_module(library(pce)).

window(690, 690).

my_fractal(N) :-
  window(MaxX, MaxY), 
  
  
draw_fractal1(Window, 1, point(X, Y), Len) :-
	X1 is X + Len,
	Y1 is Y - Len,
	send(Window, display, new,(Pa, path),
		(
		send(Window, X, Y),
		send(Window, X, Y1),
		send(Window, X1, Y),
		send(