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



  num_leaves(nil, 0).

  num_leaves(t(_, L, R), RT):-
    L \= nil, R \= nil,
    num_leaves(L, RL),
    num_leaves(R, RR),
	RT is RL + RR.
	
  num_leaves(t(_, nil, nil), 1).
  
  num_leaves(t(_, L, nil), RT):-
  L \= nil,
  num_leaves(L, RL),
  RT is RL.
  
  num_leaves(t(_, nil, R), RT):-
  R \= nil,
  num_leaves(R, RR),
  RT is RR.
  
  
	
	
% t(5, nil, nil)
% num_leaves(t(5, nil,nil), R).
% R = 1
 