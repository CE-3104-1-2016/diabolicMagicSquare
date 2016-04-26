%Function that verifies if the addition of 4 elements is equal to 34
sum_([A,B,C,D]) :- 
	A+B+C+D =:= 34.


%Function auxiliar to verifies that the user only use numbers from 1 to 16
select_(RangeList,[A,B,C,D],ResultList) :-
	select(A,RangeList,Temp0),
	select(B,Temp0,Temp1),
	select(C,Temp1,Temp2),
	select(D,Temp2,ResultList).


%Function that verifies if the user entry is a diablic square
diabolic([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P]) :-
	%List that contains the range of numbers that the user can use.
	RangeList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],

	%Compare if the user entry is in the RangeList, and without repeated numbers.
	ROW1=[A,B,C,D], select_(RangeList,ROW1,ResultList1), sum_(ROW1),
	ROW2=[E,F,G,H], select_(ResultList1,ROW2,ResultList2), sum_(ROW2),
	ROW3=[I,J,K,L], select_(ResultList2,ROW3,ResultList3), sum_(ROW3),
	ROW4=[M,N,O,P], select_(ResultList3,ROW4,[]),sum_(ROW4),
	
	%Verifies if the addition of the columns is equal to 34.
	COL1=[A,E,I,M],sum_(COL1),
	COL2=[B,F,J,N],sum_(COL2),
	COL3=[C,G,K,O],sum_(COL3),
	COL4=[D,H,L,P],sum_(COL4),
	
	%Verifies if the addition of the diagonals is equal to 34.
	sum_([A,F,K,P]),
	sum_([D,G,J,M]).


%Defines the function that shows different diabolic squares
diabolic(L) :- square1(L).
diabolic(L,M) :- square1(L), square2(M).
diabolic(L,M,N) :- square1(L), square2(M), square3(N).
diabolic(L,M,N,O) :- square1(L), square2(M), square3(N), square4(O).
diabolic(L,M,N,O,P) :- square1(L), square2(M), square3(N), square4(O), square5(P).
diabolic(L,M,N,O,P,Q) :- square1(L), square2(M), square3(N), square4(O), square5(P), square6(Q).
diabolic(L,M,N,O,P,Q,R) :- square1(L), square2(M), square3(N), square4(O), square5(P), square6(Q),
	square7(R).
diabolic(L,M,N,O,P,Q,R,S) :- square1(L), square2(M), square3(N), square4(O), square5(P), square6(Q),
	square7(R), square8(S).
diabolic(L,M,N,O,P,Q,R,S,T) :- square1(L), square2(M), square3(N), square4(O), square5(P), square6(Q),
	square7(R), square8(S), square9(T).
diabolic(L,M,N,O,P,Q,R,S,T,U) :- square1(L), square2(M), square3(N), square4(O), square5(P), square6(Q),
	square7(R), square8(S), square9(T), square10(U).

%Prints a list
print([]).
print([X|List]) :- 
	write(X),
	print(List).
	

%Adds 1 to the entire list
add1([],[]).
add1([X|L],[Z|Zs]) :- add1(L,Zs),
	Z is X+1.
	
%Multiplies the entire list and an integer 	
multi(_,[],[]).
multi(N,[X|L],[Z|Zs]) :- multi(N,L,Zs),
	Z is X*N. 

%Add two lists
addLists(L1,L2,L):- addLA(L1,L2,L). 
addLA([],[],[]):-!. 
addLA([X|Xs],[Y|Ys],[S|L]):- addLA(Xs,Ys,L),S is X + Y.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%S = [0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0]
%A = [0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1]
%N = [0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0]
%C = [0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1]

%Generates the first square
square1(F1) :- multi(8,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(1,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(4,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(2,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the second square
square2(F1) :- multi(8,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(2,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(4,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(1,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).

%Generates the third square
square3(F1) :- multi(8,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(4,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(2,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(1,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).

%Generates the forth square	
square4(F1) :- multi(8,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(1,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(2,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(4,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the fifth square
square5(F1) :- multi(8,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(2,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(1,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(4,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the sixth square
square6(F1) :- multi(8,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(4,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(1,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(2,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the seventh square
square7(F1) :- multi(2,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(1,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(4,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(8,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the eighth square
square8(F1) :- multi(2,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(1,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(8,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(4,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the ninth square
square9(F1) :- multi(2,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(8,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(4,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(1,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the tenth square
square10(F1) :- multi(2,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(8,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(1,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(4,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the eleventh square
square11(F1) :- multi(2,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(4,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(1,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(8,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the twelve square
square12(F1) :- multi(2,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(4,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(8,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(1,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the thirteen square
square13(F1) :- multi(1,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(4,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(2,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(8,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the fourteen square
square14(F1) :- multi(1,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(4,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(8,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(2,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).

%Generates the fifteenth square
square15(F1) :- multi(1,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(2,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(4,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(8,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the sixteenth square
square16(F1) :- multi(1,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(2,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(8,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(4,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the seventeen square
square17(F1) :- multi(1,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(8,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(4,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(2,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the eighteen square
square18(F1) :- multi(1,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(8,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(2,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(4,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the nineteen square
square19(F1) :- multi(4,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(1,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(2,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(8,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the twenty square
square20(F1) :- multi(4,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(1,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(8,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(2,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the twenty one square
square21(F1) :- multi(4,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(2,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(8,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(1,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the twenty two square
square22(F1) :- multi(4,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(2,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(1,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(8,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the twenty three square
square23(F1) :- multi(4,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(8,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(1,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(2,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
	
%Generates the twenty four square
square24(F1) :- multi(4,[0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],A),
	multi(8,[0,1,1,0,1,0,0,1,0,1,1,0,1,0,0,1],B),
	multi(2,[0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0],C),
	multi(1,[0,1,0,1,1,0,1,0,1,0,1,0,0,1,0,1],D),
	addLists(A,B,E),addLists(C,D,E1),
	addLists(E,E1,F),
	add1(F,F1).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Une un numero al inicio de una lista
concatenate([],L,L) :- !.
concatenate([X|M],L,[X|Y]) :- concatenate(M,L,Y).

%Inverts a list 
invert([],[]) :- !. 
invert([X],[X]) :- !. 
invert([X|M],L) :- invert(M,S), concatenate(S,[X],L).

%Applies reflection to a magic square
reflection([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],R10) :- 
	R = [A,B,C,D], invert(R,R1),
	R2 = [E,F,G,H], invert(R2,R3),
	R4 = [I,J,K,L], invert(R4,R5),
	R6 = [M,N,O,P], invert(R6,R7),
	append(R1,R3,R8),append(R5,R7,R9),
	append(R8,R9,R10).

%Changes inner values in the first list and outer values in the second list
changeVal([A,B,C,D],[E,F,G,H],L,M) :- L = [A,E,H,D], M = [B,F,G,C].

%Applies rotation about the center point to a magic square
rotationCenter([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],X) :- R = [A,B,C,D],
	R1 = [E,F,G,H],
	changeVal(R,R1,Q,S),
	R2 = [I,J,K,L], R3 = [M,N,O,P],
	changeVal(R3,R2,T,U),
	append(Q,S,V),append(U,T,W),
	append(V,W,X).
	
%Applies Rotation of rows to a magic square
rotationRow([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],T) :- R = [A,B,C,D],
	select_([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],R,S),
	append(S,R,T).

%Moves the last item to the first place of a list
changeLast([A,B,C,D],E) :- E = [D,A,B,C].

%Applies Rotation of columns to a magic square
rotationColumn([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],T2) :- R = [A,B,C,D],
	R1 = [E,F,G,H], R2 = [I,J,K,L], R3 = [M,N,O,P],
	changeLast(R,S),
	changeLast(R1,S1),
	changeLast(R2,S2),
	changeLast(R3,S3),
	append(S,S1,T), append(S2,S3,T1),
	append(T,T1,T2).

%Order the lists to make convolution
order([A,B,C,D],[E,F,G,H],I,J) :- I = [A,D,H,E], J = [B,C,G,F].

%Applies Convolution to a magic square
convolution([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],T2) :- R = [A,B,C,D],
	R1 = [E,F,G,H], R2 = [I,J,K,L], R3 = [M,N,O,P],
	order(R,R1,S,S1),
	order(R3,R2,S2,S3),
	append(S,S1,T), append(S3,S2,T1),
	append(T,T1,T2).
	
%Aux for the showall method 
auxshowall([],Result,Result).
auxshowall([LC|R],N1,Result) :- rotationCenter(LC,S1),append([LC],N1,A),append([S1],A,B),
	rotationRow(LC,S2),append([S2],B,C),
	rotationColumn(LC,S3),append([S3],C,D),
	reflection(LC,S4),append([S4],D,E),
	convolution(LC,S5),append([S5],E,F),
	reflection(S1,T1),append([T1],F,G),
	convolution(S1,T2),append([T2],G,H),
	reflection(S2,T3),append([T3],H,I),
	convolution(S2,T4),append([T4],I,J),
	reflection(S3,T5),append([T5],J,K),
	convolution(S3,T6),append([T6],K,L),
	rotationRow(S2,U1),append([U1],L,M),
	rotationRow(U1,U2),append([U2],M,O),
	rotationColumn(S3,U3),append([U3],O,P),
	rotationColumn(U3,U4),append([U4],P,N),
%	reflection(U1,V1),append([V1],M,O),
	auxshowall(R,N,Result).

%Function that executes the showall
showall(X) :- square1(C1),square2(C2),square3(C3),square4(C4),
	square5(C5),square6(C6),square7(C7),square8(C8),
	square9(C9),square10(C10),square11(C11),square12(C12),
	square13(C13),square14(C14),square15(C15),square16(C16),
	square17(C17),square18(C18),square19(C19),square20(C20),
	square21(C21),square22(C22),square23(C23),square24(C24),
	auxshowall([C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18,C19,C20,C21,C22,C23,C24],[],X),
	long(X,L),write(L).

%Determines if two elements are the same
eq(L1,L2) :- L1 = L2.

%Calculates the lenght of a list
long([],0):-!. 


%Une un numero al inicio de una lista
concatenate([],L,L) :- !.
concatenate([X|M],L,[X|Y]) :- concatenate(M,L,Y).

%Inverts a list 
invert([],[]) :- !. 
invert([X],[X]) :- !. 
invert([X|M],L) :- invert(M,S), concatenate(S,[X],L).

%Applies reflection to a magic square
reflection([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],R10) :- R = [A,B,C,D], invert(R,R1),
	R2 = [E,F,G,H], invert(R2,R3),
	R4 = [I,J,K,L], invert(R4,R5),
	R6 = [M,N,O,P], invert(R6,R7),
	append(R1,R3,R8),append(R5,R7,R9),
	append(R8,R9,R10).

%Changes inner values in the first list and outer values in the second list
changeVal([A,B,C,D],[E,F,G,H],L,M) :- L = [A,E,H,D], M = [B,F,G,C].

%Applies rotation about the center point to a magic square
rotationCenter([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],X) :- R = [A,B,C,D],
	R1 = [E,F,G,H],
	changeVal(R,R1,Q,S),
	R2 = [I,J,K,L], R3 = [M,N,O,P],
	changeVal(R3,R2,T,U),
	append(Q,S,V),append(U,T,W),
	append(V,W,X).
	
%Applies Rotation of rows to a magic square
rotationRow([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],T) :- R = [A,B,C,D],
	select_([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],R,S),
	append(S,R,T).

%Moves the last item to the first place of a list
changeLast([A,B,C,D],E) :- E = [D,A,B,C].

%Applies Rotation of columns to a magic square
rotationColumn([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],T2) :- R = [A,B,C,D],
	R1 = [E,F,G,H], R2 = [I,J,K,L], R3 = [M,N,O,P],
	changeLast(R,S),
	changeLast(R1,S1),
	changeLast(R2,S2),
	changeLast(R3,S3),
	append(S,S1,T), append(S2,S3,T1),
	append(T,T1,T2).

%Order the lists to make convolution
order([A,B,C,D],[E,F,G,H],I,J) :- I = [A,D,H,E], J = [B,C,G,F].

%Applies Convolution to a magic square
convolution([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],T2) :- R = [A,B,C,D],
	R1 = [E,F,G,H], R2 = [I,J,K,L], R3 = [M,N,O,P],
	order(R,R1,S,S1),
	order(R3,R2,S2,S3),
	append(S,S1,T), append(S3,S2,T1),
	append(T,T1,T2).
	
%Aux for the showall method 
auxshowall([],Result,Result).
auxshowall([LC|R],N1,Result) :- rotationCenter(LC,S1),append([LC],N1,A),append([S1],A,B),
	rotationRow(LC,S2),append([S2],B,C),
	rotationColumn(LC,S3),append([S3],C,D),
	reflection(LC,S4),append([S4],D,E),
	convolution(LC,S5),append([S5],E,F),
	reflection(S1,T1),append([T1],F,G),
	convolution(S1,T2),append([T2],G,H),
	reflection(S2,T3),append([T3],H,I),
	convolution(S2,T4),append([T4],I,J),
	reflection(S3,T5),append([T5],J,K),
	convolution(S3,T6),append([T6],K,L),
	rotationRow(S2,U1),append([U1],L,M),
	rotationRow(U1,U2),append([U2],M,O),
	rotationColumn(S3,U3),append([U3],O,P),
	rotationColumn(U3,U4),append([U4],P,N),
%	reflection(U1,V1),append([V1],M,O),
	auxshowall(R,N,Result).

%Function that executes the showall
showall(X) :- square1(C1),square2(C2),square3(C3),square4(C4),
	square5(C5),square6(C6),square7(C7),square8(C8),
	square9(C9),square10(C10),square11(C11),square12(C12),
	square13(C13),square14(C14),square15(C15),square16(C16),
	square17(C17),square18(C18),square19(C19),square20(C20),
	square21(C21),square22(C22),square23(C23),square24(C24),
	auxshowall([C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18,C19,C20,C21,C22,C23,C24],[],X),
	long(X,L),write(L).

%Determines if two elements are the same
eq(L1,L2) :- L1 = L2.

%Calculates the lenght of a list
long([],0):-!. 
long([_X|Y],S):-long(Y,T), S is T+1. 

%[14,7,12,1,11,2,13,8,5,16,3,10,4,9,6,15]

