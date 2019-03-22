% sum(X, Y, Z)
% is it true if Z is the sum of X + Y.


% 1. P(n0)
% 2. (P(n-1) -> P(n)


sum(0, Y, Y).

%     P(n)        <-      P(n-1)
% ------------         ------------
sum(n(X), Y, n(Z)) :- sum(X, Y, Z).