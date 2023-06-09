% Royal Family tree according to the following link: https://www.bbc.com/news/uk-23272491

ever_married_to(charles, diana).
ever_married_to(diana, charles).
ever_married_to(charles, camilla).
ever_married_to(camilla, charles).
ever_married_to(william, catherine).
ever_married_to(catherine, william).
ever_married_to(harry, meghan).
ever_married_to(meghan, harry).

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


uncle_of(Person1, Person2) :-
    child_of(Person2, Parent),
    child_of(Parent, GrandParent),
    male(GrandParent), % only checks for grandfather
    child_of(UncleOrAunt, GrandParent),
    male(UncleOrAunt),
    not(child_of(Person2, UncleOrAunt)),
    Person1 = UncleOrAunt.

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

mother_of(Person1, Person2) :-
    child_of(Person2, Parent),
    female(Parent),
    Person1 = Parent.

stepmother_of(Person1, Person2) :-
    child_of(Person2, Parent),
    ever_married_to(Parent, Spouse),
    female(Spouse),
    not(child_of(Person2, Spouse)),
    Person1 = Spouse.

son_of(Person1, Person2) :-
    male(Person1),
    child_of(Child, Person2),
    Person1 = Child.
