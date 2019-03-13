% man(Person)
% it is true if Person is a man

man(jose).
man(sebastian).
man(justus).
man(kevin).
man(teun).

woman(lisanne).
woman(wendele).
woman(andrea).

% person(P)
% it is true if P is a man or a woman

person(P):-man(P).
person(P):-woman(P).

%person(P) -> animal(P) and human(P).
%
%person(P) -> animal(P)
%person(P) -> human(P)

animal(P):-person(P).
human(P):-person(P).