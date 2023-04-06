% Problem 1

ever_married_to(charles, diana).
ever_married_to(diana, charles).
ever_married_to(charles, camilla).
ever_married_to(camilla, charles).
ever_married_to(william, catherine).
ever_married_to(catherine, william).
ever_married_to(harry, meghan).
ever_married_to(meghan, harry).

% person1 is a child of person2
child_of(william, charles).
child_of(william, diana).
child_of(harry, charles).
child_of(harry, diana).
child_of(george, william).
child_of(george, catherine).
child_of(charlotte, william).
child_of(charlotte, catherine).
child_of(louis, william).
child_of(louis, catherine).
child_of(archie, harry).
child_of(archie, meghan).
child_of(lilibet, harry).
child_of(lilibet, meghan).

male(charles).
male(william).
male(harry).
male(george).
male(louis).
male(archie).

female(diana).
female(camilla).
female(catherine).
female(meghan).
female(charlotte).
female(lilibet).

deceased(diana).

senior_royal(diana).
senior_royal(charles).
senior_royal(camilla).
senior_royal(william).
senior_royal(catherine).
senior_royal(george).
senior_royal(charlotte).
senior_royal(louis).

% Problem 2

uncle_of(Person1, Person2) :-
    male(Person1),
    child_of(Person1, GrandParent),
    male(GrandParent), % remove duplicates
    child_of(Parent, GrandParent),
    male(Parent), % remove dulicates
    Parent \= Person1,
    child_of(Child, Parent),
    Child = Person2.

grandmother_of(Person1, Person2) :-
    child_of(Person2, Parent),
    child_of(Parent, GrandParent),
    female(GrandParent),
    Person1 = GrandParent.

grandson_of(Person1, Person2) :-
    child_of(Child, Person2),
    child_of(GrandChild, Child),
    male(GrandChild),
    Person1 = GrandChild.

parent_of(Person1, Person2) :-
    child_of(Person2, Parent),
    Person1 = Parent.
