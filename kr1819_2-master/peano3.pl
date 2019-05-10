% Peano Arithmetic concept:
% 
% 0 - 0
% 1 - n(0)
% 2 - n(n(0))
% 3 - n(n(n(0)))
%
%
% sum(?X, ?Y, ?Z)
% is it true if Z is the sum of X + Y using Peano Arithmetic.

% define the induction priciple:
% 1. P(n0)
% 2. P(n-1) -> P(n)


  sum(0, Y, Y).

%               n    :-   n-1
  sum(n(X), Y, n(Z)) :- sum(X, Y, Z).

% p2d(+P, -D)
% it is true if D unify with a decimal number equivalent to the Peano representation of P

  p2d(0, 0).
  p2d(n(P), D2) :- p2d(P, D), D2 is D + 1.

% substr(?X, ?Y, ?Z)
% it is true if Z is X - Y using Peano Arithmetic.

  substr(X, 0, X).

  substr(X, n(Y), Z) :- substr(X, Y, n(Z)).