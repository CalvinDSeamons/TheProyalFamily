%Calvin Seamons
%CSCI 305 Prolog Lab 2

mother(M,C):-parent(M,C),female(M).

father(F,C):-parent(F,C),male(F).

child(X,Y):-parent(Y,X).

son(X,Y):-child(X,Y),male(X).

daughter(X,Y):-female(X),child(X,Y).

spouse(X,Y):-married(X,Y).

husband(X,Y):-spouse(X,Y),male(X).

wife(X,Y):-female(X),spouse(Y,X).

sibling(X,Y):-parent(P,X),parent(O,Y),married(P,O),X\==Y.

brother(X,Y):-male(X),sibling(X,Y).

sister(X,Y):-female(X),sibling(X,Y).

uncle(X,Y):-brother(X,P),parent(P,Y).

uncle(W,X):-husband(W,Y),sibling(Y,Z),parent(Z,X).

aunt(X,Y):-sister(X,P),parent(P,Y).

aunt(W,X):-wife(W,Y),sibling(Y,Z),parent(Z,X).

grandparent(X,Y):-parent(X,Z),parent(Z,Y).

grandfather(X,Y):-father(X,Z),parent(Z,Y).

grandmother(X,Y):-mother(X,Z),parent(Z,Y).

ancestor(X,Y):-parent(X,Y).
ancestor(X,Y):-parent(X,Z),ancestor(Z,Y).

descendant(X,Y):-ancestor(Y,X).

%--------Older/Younger functions-------%

older(X,Y):-born(X,A),born(Y,B),B>A.

younger(X,Y):-born(X,A),born(Y,B),A>B.

%--------regentWhenBorn----------------%

regentWhenBorn(X,Y):-born(Y,A),reigned(X,C,D),C<A,A<D.


%-----Extra Credit-------%

cousin(X,Y):-parent(A,X),parent(B,Y),sibling(A,B).



