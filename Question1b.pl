/*
Backstory and Goal
Kara recently moved to a new city, so last month she signed up for an online matchmaking
service to meet some interesting new people in her area. Using only the clues below, match
each of her dates to their age and occupation, and determine where each ended up taking Kara
on their first date.
Names are vincent, eddie, zachary, and wayne
Ages are 22,23,24, and 25
Professions are teacher, banker, firefighter, and lawyer
Locations are movies, restaurant, county_fair, and bowling_alley
Clues
1. vincent wasn't exactly 24 years old.
2. The 25-year-old took Kara to the movies.
3. Of the lawyer and wayne, one was 23 years old and the other took Kara to the county fair.
4. eddie was either the lawyer or the gentleman that took Kara to the movies.
5. eddie was younger than the date that took Kara to the restaurant.
6. eddie was 1 year younger than the banker.
7. The gentleman that took Kara to the movies was the firefighter.
8. The 23-year-old was either the teacher or the gentleman that took Kara to the restaurant.
*/


karasDates(Sol) :- length(Sol, 4),
    %Preamble
    (member((vincent,_,_,_), Sol), member((eddie,_,_,_), Sol), member((zachary,_,_,_), Sol), member((wayne,_,_,_), Sol)),

    (member((_,22,_,_), Sol), member((_,23,_,_), Sol), member((_,24,_,_), Sol), member((_,25,_,_), Sol)),

    (member((_,_,banker,_), Sol), member((_,_,firefighter,_), Sol), member((_,_,lawyer,_), Sol), member((_,_,teacher,_), Sol)),

    (member((_,_,_,bowling_alley), Sol), member((_,_,_,county_fair), Sol), member((_,_,_,movies), Sol), member((_,_,_,restaurant), Sol)),


    %Clues
    (member((vincent,23,_,_), Sol);member((vincent,25,_,_), Sol)), %Clue1

    (member((_,25,_,movies), Sol)), %clue2

    ((member((_,23,lawyer,_), Sol), member((wayne,_,_,county_fair), Sol)); (member((wayne,23,_,_), Sol), member((_,_,lawyer,county_fair), Sol))),

    (member((eddie,_,lawyer,_), Sol) ; member((eddie,_,_,movies), Sol)), %Clue4

    (member((eddie,EddieAge,_,_), Sol), member((_,OtherAge,_,restaurant), Sol), EddieAge<OtherAge), %Clue5

    (member((eddie,EddieAge,_,_), Sol), member((_,AnotherAge,banker,_), Sol), (EddieAge is AnotherAge-1)), %Clue6

    member((_,_,firefighter,movies), Sol), %Clue7

    (member((_,23,teacher,_), Sol);member((_,23,_,restaurant), Sol)). %Clue8