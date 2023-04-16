/*
Backstory and Goal
Kara recently moved to a new city, so last month she signed up for an online matchmaking
service to meet some interesting new people in her area. Using only the clues below, match
each of her dates to their age and occupation, and determine where each ended up taking Kara
on their first date.
Clues
1. Vincent wasn't exactly 24 years old.
2. The 25-year-old took Kara to the movies.
3. Of the lawyer and Wayne, one was 23 years old and the other took Kara to the county fair.
4. Eddie was either the lawyer or the gentleman that took Kara to the movies.
5. Eddie was younger than the date that took Kara to the restaurant.
6. Eddie was 1 year younger than the banker.
7. The gentleman that took Kara to the movies was the firefighter.
8. The 23-year-old was either the teacher or the gentleman that took Kara to the restaurant.
*/

karasDates(Sol) :- length(Sol, 4),
    %Preamble
    member((Vincent,_,_,_), Sol), member((Eddie,_,_,_), Sol), member((Zachary,_,_,_), Sol), member((Wayne,_,_,_), Sol),
    member((_,22,_,_), Sol), member((_,23,_,_), Sol), member((_,24,_,_), Sol), member((_,25,_,_), Sol),
    member((_,_,banker,_), Sol), member((_,_,firefighter,_), Sol), member((_,_,lawyer,_), Sol), member((_,_,teacher,_), Sol),
    member((_,_,_,bowling alley), Sol), member((_,_,_,county_fair), Sol), member((_,_,_,movies), Sol), member((_,_,_,restaurant), Sol),
    
    
    %Clues
    (member((Vincent,22,_,_), Sol);member((Vincent,23,_,_), Sol);member((Vincent,25,_,_), Sol)), %Clue1

    (member((_,25,_,movies), Sol)), %clue2

    (member((_,23,lawyer,_), Sol), member((Wayne,_,_,county_fair),Sol);member((Wayne,23,_,_), Sol), member((_,_,lawyer,county_fair),Sol)), %Clue3

    (member((Eddie,_,lawyer,_), Sol);member((Eddie,_,_,movies), Sol)), %Clue4

    (member((Eddie,A,_,_), Sol), member((_,B,_,restaurant), Sol), A<B), %Clue5

    (member((Eddie,A,_,_), Sol), member((_,C,banker,_), Sol), C is A-1), %Clue6

    member((_,_,firefighter,movies), Sol), %Clue7

    (member((_,23,teacher,_), Sol);member((_,23,_,restaurant), Sol)), %Clue8
