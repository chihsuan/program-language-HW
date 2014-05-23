read_lines(S) :- read_line_to_codes(user_input, S).


write_lines([]).
write_lines([H|T]) :-
	write(H),
	writef(" "),
    write_lines(T).

lists([],_).
lists([H|T],Y):- H=32,!, lists(T,Y).
lists([H|T],[_|T2]):- H=48,!,lists(T,T2).
lists([H|T],[H2|T2]) :-
	X is H-48,
	H2 is X,
    lists(T,T2).

value(1). 
value(2). 
value(3). 
value(4). 
value(5). 
value(6). 
value(7). 
value(8). 
value(9).

notmember(_, []).
notmember(V, [H|T]) :- integer(H),!, V \= H,  notmember(V, T).
notmember(V, [_|T]) :- notmember(V,T).


value(X,_):- integer(X), value(X).
value(X,W):- value(X),notmember(X,W).

sudoku(Solution,P):-
		 Solution = P,
	      Solution =
				 [A1,A2,A3,A4,A5,A6,A7,A8,A9,
				  B1,B2,B3,B4,B5,B6,B7,B8,B9,
				  C1,C2,C3,C4,C5,C6,C7,C8,C9,
				  D1,D2,D3,D4,D5,D6,D7,D8,D9,
				  E1,E2,E3,E4,E5,E6,E7,E8,E9,
				  F1,F2,F3,F4,F5,F6,F7,F8,F9,
				  G1,G2,G3,G4,G5,G6,G7,G8,G9,
				  H1,H2,H3,H4,H5,H6,H7,H8,H9,
				  I1,I2,I3,I4,I5,I6,I7,I8,I9],	

				(var(A1)-> value(A1,[A2,A3,A4,A5,A6,A7,A8,A9,B1,C1,D1,E1,F1,G1,H1,I1]);true), 
				(var(A2)-> value(A2,[A1,A3,A4,A5,A6,A7,A8,A9,B2,C2,D2,E2,F2,G2,H2,I2]);true),
				(var(A3)-> value(A3,[A1,A2,A4,A5,A6,A7,A8,A9,B3,C3,D3,E3,F3,G3,H3,I3]);true),
				(var(A4)-> value(A4,[A1,A2,A3,A5,A6,A7,A8,A9,B4,C4,D4,E4,F4,G4,H4,I4]);true),  
				(var(A5)-> value(A5,[A1,A2,A3,A4,A6,A7,A8,A9,B5,C5,D5,E5,F5,G5,H5,I5]);true), 
				(var(A6)-> value(A6,[A1,A2,A3,A4,A5,A7,A8,A9,B6,C6,D6,E6,F6,G6,H6,I6]);true), 
				(var(A7)-> value(A7,[A1,A2,A3,A4,A5,A6,A8,A9,B7,C7,D7,E7,F7,G7,H7,I7]);true), 
				(var(A8)-> value(A8,[A1,A2,A3,A4,A5,A6,A7,A9,B8,C8,D8,E8,F8,G8,H8,I8]);true),
				(var(A9)-> value(A9,[A1,A2,A3,A4,A5,A6,A7,A8,B9,C9,D9,E9,F9,G9,H9,I9]);true),

				(var(B1)-> value(B1,[B2,B3,B4,B5,B6,B7,B8,B9,A1,C1,D1,E1,F1,G1,H1,I1]);true), 
				(var(B2)-> value(B2,[B1,B3,B4,B5,B6,B7,B8,B9,A2,C2,D2,E2,F2,G2,H2,I2]);true), 
				(var(B3)-> value(B3,[B1,B2,B4,B5,B6,B7,B8,B9,A3,C3,D3,E3,F3,G3,H3,I3]);true),
				(var(B4)-> value(B4,[B1,B2,B3,B5,B6,B7,B8,B9,A4,C4,D4,E4,F4,G4,H4,I4]);true), 
				(var(B5)-> value(B5,[B1,B2,B3,B4,B6,B7,B8,B9,A5,C5,D5,E5,F5,H5,G5,I5]);true),
				(var(B6)-> value(B6,[B1,B2,B3,B4,B5,B7,B8,B9,A6,C6,D6,E6,F6,G6,H6,I6]);true), 
				(var(B7)-> value(B7,[B1,B2,B3,B4,B5,B6,B8,B9,A7,C7,D7,E7,F7,G7,H7,I7]);true), 
				(var(B8)-> value(B8,[B1,B2,B3,B4,B5,B6,B7,B9,A8,C8,D8,E8,F8,G8,H8,I8]);true), 
				(var(B9)-> value(B9,[B1,B2,B3,B4,B5,B6,B7,B8,A9,C9,D9,E9,F9,G9,H9,I9]);true),

				(var(C1)-> value(C1,[C2,C3,C4,C5,C6,C7,C8,C9,A1,B1,D1,E1,F1,G1,H1,I1]);true), 
				(var(C2)-> value(C2,[C1,C3,C4,C5,C6,C7,C8,C9,A2,B2,D2,E2,F2,G2,H2,I2]);true), 
				(var(C3)-> value(C3,[C1,C2,C4,C5,C6,C7,C8,C9,A3,B3,D3,E3,F3,G3,H3,I3]);true),
				(var(C4)-> value(C4,[C1,C2,C3,C5,C6,C7,C8,C9,A4,B4,D4,E4,F4,G4,H4,I4]);true),
				(var(C5)-> value(C5,[C1,C2,C3,C4,C6,C7,C8,C9,A5,B5,D5,E5,F5,G5,H5,I5]);true), 
				(var(C6)-> value(C6,[C1,C2,C3,C4,C5,C7,C8,C9,D6,A6,B6,E6,F6,G6,H6,I6]);true), 
				(var(C7)-> value(C7,[C1,C2,C3,C4,C5,C6,C8,C9,D7,E7,A7,B7,F7,G7,H7,I7]);true), 
				(var(C8)-> value(C8,[C1,C2,C3,C4,C5,C6,C7,C9,D8,E8,A8,B8,F8,G8,H8,I8]);true), 
				(var(C9)-> value(C9,[C1,C2,C3,C4,C5,C6,C7,C8,A9,B9,D9,E9,F9,G9,H9,I9]);true), 


				(var(D1) -> value(D1,[D2,D3,D4,D5,D6,D7,D8,D9,A1,B1,C1,E1,F1,G1,H1,I1]);true), 
				(var(D2) -> value(D2,[D1,D3,D4,D5,D6,D7,D8,D9,A2,B2,C3,E2,F2,G2,H2,I2]);true), 
				(var(D3) -> value(D3,[D1,D2,D4,D5,D6,D7,D8,D9,A3,B3,C3,E3,F3,G3,H3,I3]);true),
				(var(D4) -> value(D4,[D1,D2,D3,D5,D6,D7,D8,D9,A4,B4,C4,E4,F4,G4,H4,I4]);true), 
				(var(D5) -> value(D5,[D1,D2,D3,D4,D6,D7,D8,D9,A5,B5,C5,E5,F5,G5,H5,I5]);true), 
				(var(D6) -> value(D6,[D1,D2,D3,D4,D5,D7,D8,D9,A6,B6,C6,E6,F6,G6,H6,I6]);true), 
				(var(D7) -> value(D7,[D1,D2,D3,D4,D5,D6,D8,D9,A7,B7,C7,E7,F7,G7,H7,I7]);true), 
				(var(D8) -> value(D8,[D1,D2,D3,D4,D5,D6,D7,D9,A8,B8,C8,E8,F8,G8,H8,I8]);true),
				(var(D9) -> value(D9,[D1,D2,D3,D4,D5,D6,D7,D8,A9,B9,C9,E9,F9,G9,H9,I9]);true), 


				(var(E1) -> value(E1,[E2,E3,E4,E5,E6,E7,E8,E9,A1,B1,C1,D1,F1,G1,H1,I1]);true), 
				(var(E2) -> value(E2,[E1,E3,E4,E5,E6,E7,E8,E9,A2,B2,C2,D2,F2,G2,H2,I2]);true), 
				(var(E3) -> value(E3,[E1,E2,E4,E5,E6,E7,E8,E9,A3,D3,C3,D3,F3,G3,H3,I3]);true),
				(var(E4) -> value(E4,[E1,E2,E3,E5,E6,E7,E8,E9,A4,B4,C4,D4,F4,G4,H4,I4]);true),
				(var(E5) -> value(E5,[E1,E2,E3,E4,E6,E7,E8,E9,A5,B5,C5,D5,F5,G5,H5,I5]);true), 
				(var(E6) -> value(E6,[E1,E2,E3,E4,E5,E7,E8,E9,A6,B6,C6,D6,F6,G6,H6,I6]);true), 
				(var(E7) -> value(E7,[E1,E2,E3,E4,E5,E6,E8,E9,A7,B7,C7,D7,F7,G7,H8,I8]);true),
				(var(E8) -> value(E8,[E1,E2,E3,E4,E6,E5,E7,E9,A8,B8,C8,D8,F8,G8,H8,I8]);true), 
				(var(E9) -> value(E9,[E1,E2,E3,E4,E5,E6,E7,E8,A9,B9,C9,D9,F9,G9,H9,I9]);true),


				(var(F1) -> value(F1,[F2,F3,F4,F5,F6,F7,F8,F9,A1,B1,C1,D1,E1,G1,H1,I1]);true), 
				(var(F2) -> value(F2,[F1,F3,F4,F5,F6,F7,F8,F9,A2,B2,C2,D2,E2,G2,H2,I2]);true),
				(var(F3) -> value(F3,[F1,F2,F4,F5,F6,F7,F8,F9,A3,B3,C3,D3,E3,G3,H3,I3]);true),
				(var(F4) -> value(F4,[F1,F2,F3,F5,F6,F7,F8,F9,A4,B4,C4,D4,E4,G4,H4,I4]);true), 
				(var(F5) -> value(F5,[F1,F2,F3,F4,F6,F7,F8,F9,A5,B5,C5,D5,E5,G5,H5,I5]);true),
				(var(F6) -> value(F6,[F1,F2,F3,F4,F5,F7,F8,F9,A6,B6,C6,D6,E6,G6,H6,I6]);true), 
				(var(F7) -> value(F7,[F1,F2,F3,F4,F5,F6,F8,F9,A7,B7,C7,D7,E7,G7,H7,I7]);true),
				(var(F8) -> value(F8,[F1,F2,F3,F4,F5,F6,F7,F9,A8,B8,C8,D8,E8,G8,H8,I8]);true),
				(var(F9) -> value(F9,[F1,F2,F3,F4,F5,F6,F7,F8,A9,B9,C9,D9,E9,G9,H9,I9]);true),


				(var(G1) -> value(G1,[G2,G3,G4,G5,G6,G7,G8,G9,H1,I1,A1,B1,C1,D1,E1,F1]);true),
				(var(G2) -> value(G2,[G1,G3,G4,G5,G6,G7,G8,G9,H2,I2,A2,B2,C2,D2,E2,F2]);true),
				(var(G3) -> value(G3,[G1,G2,G4,G5,G6,G7,G8,G9,H3,I3,A3,B3,C3,D3,E3,F3]);true),
				(var(G4) -> value(G4,[G1,G2,G3,G5,G6,G7,G8,G9,H4,I4,A4,B4,C4,D4,E4,F4]);true), 
				(var(G5) -> value(G5,[G1,G2,G3,G4,G6,G7,G8,G9,H5,I5,A5,B5,C5,D5,E5,F5]);true),
				(var(G6) -> value(G6,[G1,G2,G3,G4,G5,G7,G8,G9,H6,I6,A6,B6,C6,D6,E6,F6]);true), 
				(var(G7) -> value(G7,[G1,G2,G3,G4,G5,G6,G8,G9,H7,I7,A7,B7,C7,D7,E7,F7]);true), 
				(var(G8) -> value(G8,[G1,G2,G3,G4,G5,G6,G7,G9,H8,I8,A8,B8,C8,D8,E8,F8]);true),
				(var(G9) -> value(G9,[G1,G2,G3,G4,G5,G6,G7,G8,H9,I9,A9,B9,C9,D9,E9,F9]);true),


				(var(H1) -> value(H1,[H2,H3,H4,H5,H6,H7,H8,H9,I1,A1,B1,C1,D1,E1,F1,G1]);true), 
				(var(H2) -> value(H2,[H1,H3,H4,H5,H6,H7,H8,H9,I2,A2,B2,C2,D2,E2,F2,G2]);true),
				(var(H3) -> value(H3,[H1,H2,H4,H5,H6,H7,H8,H9,I3,A3,B3,C3,D3,E3,F3,G3]);true),
				(var(H4) -> value(H4,[H1,H2,H3,H5,H6,H7,H8,H9,I4,A4,B4,C4,D4,E4,F4,G4]);true), 
				(var(H5) -> value(H5,[H1,H2,H3,H4,H6,H7,H8,H9,I5,A5,B5,C5,D5,E5,F5,G5]);true), 
				(var(H6) -> value(H6,[H1,H2,H3,H4,H5,H7,H8,H9,I6,A6,B6,C6,D6,E6,F6,G6]);true), 
				(var(H7) -> value(H7,[H1,H2,H3,H4,H5,H6,H8,H9,I7,A7,B7,C7,D7,E7,F7,G7]);true),
				(var(H8) -> value(H8,[H1,H2,H3,H4,H5,H6,H7,H9,I8,A8,B8,C8,D8,E8,F8,G8]);true), 
				(var(H9) -> value(H9,[H1,H2,H3,H4,H5,H6,H7,H8,I9,A9,B9,C9,D9,E9,F9,G9]);true),


				(var(I1) -> value(I1,[I2,I3,I4,I5,I6,I7,I8,I9,A1,B1,C1,D1,E1,F1,G1,H1]);true),
				(var(I2) -> value(I2,[I1,I3,I4,I5,I6,I7,I8,I9,A2,B2,C2,D2,E2,F2,G2,H2]);true),
				(var(I3) -> value(I3,[I1,I2,I4,I5,I6,I7,I8,I9,A3,B3,C3,D3,E3,F3,G3,H3]);true),
				(var(I4) -> value(I4,[I1,I2,I3,I5,I6,I7,I8,I9,A4,B4,C4,D4,E4,F4,G4,H4]);true),
				(var(I5) -> value(I5,[I1,I2,I3,I4,I6,I7,I8,I9,A5,B5,C5,D5,E5,F5,G5,H5]);true), 
				(var(I6) -> value(I6,[I1,I2,I3,I4,I5,I7,I8,I9,A6,B6,C6,D6,E6,F6,G6,H6]);true), 
				(var(I7) -> value(I7,[I1,I2,I3,I4,I5,I6,I8,I9,A7,B7,C7,D7,E7,F7,G7,H7]);true), 
				(var(I8) -> value(I8,[I1,I2,I3,I4,I5,I6,I7,I9,A8,B8,C8,D8,E8,F8,G8,H8]);true), 
				(var(I9) -> value(I9,[I1,I2,I3,I4,I5,I6,I7,I8,A9,B9,C9,D9,E9,F9,G9,H9]);true);true.




main :- read_lines(X),
	 Y=[A1,A2,A3,A4,A5,A6,A7,A8,A9,
	 B1,B2,B3,B4,B5,B6,B7,B8,B9,
	 C1,C2,C3,C4,C5,C6,C7,C8,C9,
	 D1,D2,D3,D4,D5,D6,D7,D8,D9,
	 E1,E2,E3,E4,E5,E6,E7,E8,E9,
	 F1,F2,F3,F4,F5,F6,F7,F8,F9,
	 G1,G2,G3,G4,G5,G6,G7,G8,G9,
	 H1,H2,H3,H4,H5,H6,H7,H8,H9,
	 I1,I2,I3,I4,I5,I6,I7,I8,I9],
	 lists(X,Y),
	 Ans=[A1,A2,A3,A4,A5,A6,A7,A8,A9,
	 B1,B2,B3,B4,B5,B6,B7,B8,B9,
	 C1,C2,C3,C4,C5,C6,C7,C8,C9,
	 D1,D2,D3,D4,D5,D6,D7,D8,D9,
	 E1,E2,E3,E4,E5,E6,E7,E8,E9,
	 F1,F2,F3,F4,F5,F6,F7,F8,F9,
	 G1,G2,G3,G4,G5,G6,G7,G8,G9,
	 H1,H2,H3,H4,H5,H6,H7,H8,H9,
	 I1,I2,I3,I4,I5,I6,I7,I8,I9],
	 sudoku(Ans,Y),
	 write_lines(Y),
	 writef("\n"),halt.

:- initialization(main).

