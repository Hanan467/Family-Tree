% Facts
male(abebe).
male(sami).
male(eyob).
male(henok).
male(bereket).
male(solomon).
male(amir).

female(selam).
female(beza).
female(hanan).
female(eskedar).
female(blen).
female(kidist).
female(ikram).
female(seni).

parent(abebe, sami).
parent(selam, sami).
parent(sami, eyob).
parent(beza, eyob).
parent(eyob, blen).
parent(hanan, blen).
parent(hanan, bereket).
parent(eyob, eskedar).
parent(hanan, henok).
parent(hanan, kidist).
parent(eyob, bereket).
parent(eyob, kidist).
parent(solomon, amir).
parent(hanan, amir).
parent(amir, hanan).
parent(seni, hanan).


% Rules
child(Child, Parent) :- parent(Parent, Child).

brother(Brother1, Brother2) :-
    male(Brother1),
    male(Brother2),
    parent(Parent, Brother1),
    parent(Parent, Brother2),
    Brother1 \= Brother2,
    Brother1 @< Brother2.

father(Father, Child) :-
    male(Father),
    parent(Father, Child),
    Father \= Child.

grandMother(GrandMother, GrandChild) :-
    female(GrandMother),
    parent(GrandMother, Parent),
    parent(Parent, GrandChild).

greatGrandChild(GreatGrandChild, GreatGrandparent) :-
    parent(GreatGrandparent, Grandparent),
    parent(Grandparent, Parent),
    parent(Parent, GreatGrandChild).
    
grandChild(GrandChild, Grandparent) :-
    parent(Grandparent, Parent),
    parent(Parent, GrandChild).

greatGrandparent(GreatGrandparent, GreatGrandChild) :-
    parent(GreatGrandparent, Grandparent),
    parent(Grandparent, Parent),
    parent(Parent, GreatGrandChild).

grandParent(GrandParent, GrandChild) :-
    parent(GrandParent, Parent),
    parent(Parent, GrandChild).

countGrandparents(Person, Count) :-
    findall(Grandparent, grandParent(Grandparent, Person), Grandparents),
    sort(Grandparents, UniqueGrandparents),
    length(UniqueGrandparents, Count).

