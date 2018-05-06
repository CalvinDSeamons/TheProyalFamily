%Calvin Seamons
%CSCI 305 Prolog Lab 2


%--for mother/father i call parent with a gender attached--%
    mother(M,C):-parent(M,C),female(M).
    father(F,C):-parent(F,C),male(F).

%--for child i call parent with gender attached to see son or daughter or both
    child(X,Y):-parent(Y,X).
    son(X,Y):-child(X,Y),male(X).
    daughter(X,Y):-female(X),child(X,Y).


%--for spouse i pass X and Y and if they are married they are spouses--%
%--going off of that for husband and wife if they are spouse then there gender return thats--% 
    spouse(X,Y):-married(X,Y).
    husband(X,Y):-spouse(X,Y),male(X).
    wife(X,Y):-female(X),spouse(Y,X).


%--for sublings if they have they have parents that are married + there gender it returns Bro,sis ect--%
    sibling(X,Y):-parent(P,X),parent(O,Y),married(P,O),X\==Y.
    brother(X,Y):-male(X),sibling(X,Y).
    sister(X,Y):-female(X),sibling(X,Y).


%--for Uncle/Aunt i call the person parent, if the parent has sibling thats returned as aunt or uncle--%
    uncle(X,Y):-brother(X,P),parent(P,Y).
    uncle(W,X):-husband(W,Y),sibling(Y,Z),parent(Z,X).
    aunt(X,Y):-sister(X,P),parent(P,Y).
    %--for Aunt-inlaw i see if they are married. then the spouses aunt is there aunt
    aunt(A,P):-spouse(S,P),aunt(A,S).

%--for Grandparents i call parents twice, if the X is a parents parents its a grandparent+gender--%
    grandparent(X,Y):-parent(X,Z),parent(Z,Y).
    grandfather(X,Y):-father(X,Z),parent(Z,Y).
    grandmother(X,Y):-mother(X,Z),parent(Z,Y).
    grandchild(X,Y):-grandparent(Y,X).


%--Ancestor i recursevly call parents as far back as it can go. this returns all ancestors--%
    ancestor(X,Y):-parent(X,Y).
    ancestor(X,Y):-parent(X,Z),ancestor(Z,Y).
%--decenants is the same but reversed i call ancestor with inverted so it finds the child-child ect--%
    descendant(X,Y):-ancestor(Y,X).


%--------Older/Younger functions-------%

    %--Old/Yound calculate life age and see which is larger or smaller--%
    older(X,Y):-age(X,C),age(Y,D),C>D.
    younger(X,Y):-age(X,A),age(Y,B),A<B.

    %--Lifespan calculations--%
        age(X,C):-born(X,A),2018-A=C,C<120.
        age(X,C):-born(X,A),died(X,B),B-A=C.

%--------regentWhenBorn----------------%
%--regent sees when someone is born and checks that with the start and end of regent to see if it was born during that specific ruler--%
    regentWhenBorn(X,Y):-born(Y,A),reigned(X,C,D),C<A,A<D.


%-----Extra Credit-------%
%--cousin is super easy i call the value on X if Y there parent has a sibling and that sibling has a kid, its a first cousin--%
    cousin(X,Y):-parent(A,X),parent(B,Y),sibling(A,B).



