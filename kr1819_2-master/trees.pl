% Treeterror
%
% 01: Count the numbers of nodes in a tree.

  tree1( t(9,
    t(5,  t(2 ,nil,nil), t(6 ,nil,nil) ) , 
    t(12, t(10,nil,nil), t(14,nil,nil) )
 )).
 
% Befehl in Prolog: tree1(T), num_nodes(T, N).
 
  num_nodes(nil, 0).
  num_nodes(t(_,L, R), RT) :-
   num_nodes(L, RL),
   num_nodes(R, RR),
   RT is RL + RR + 1.
   
% 02: Count the leafs.
%
% num_leafs(+Tree, -Num)
% it is true if Num unify with the number of leafs in Tree.



  num_leafs(nil, 0).

  num_leafs(t(_, L, R), RT):-
    num_leafs(L, RL),
    num_leafs(R, RR),
	RT is RL + RR.
 