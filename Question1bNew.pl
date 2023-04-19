karasDate(Sol) :-
    length(Sol, 4),
    member(date(vincent, AgeV, ProfV, LocV), Sol),
    member(date(eddie, AgeE, ProfE, LocE), Sol),
    member(date(wayne, AgeW, ProfW, LocW), Sol),
    member(date(zachary, AgeZ, ProfZ, LocZ), Sol),
    % Rule 1: Vincent's age is either 22 or 23.
    (AgeV = 22 ; AgeV = 23),
    % Rule 2: The 25-year-old took Kara to the movies.
    member(date(_, 25, _, movies), Sol),
    % Rule 3: One of the lawyer and Wayne is 23 and took Kara to the county fair.
    ( (ProfE = lawyer, AgeE \= 23, LocE \= county_fair, (ProfW = teacher, AgeW = 23, LocW = county_fair ; ProfW = lawyer, AgeW \= 23, LocW \= county_fair)) ;
      (ProfW = lawyer, AgeW = 23, LocW = county_fair, (ProfE = teacher, AgeE \= 23, LocE \= county_fair ; ProfE = lawyer, AgeE \= 23, LocE \= county_fair)) ),
    % Rule 4: Eddie is either the lawyer or the one who took Kara to the movies.
    ( (ProfE = lawyer, LocE \= movies, (ProfZ = banker, AgeZ = 25, LocZ \= movies, (ProfV = teacher, AgeV \= 24, LocV \= movies ; ProfV = firefighter, AgeV = 25, LocV = movies))) ;
      (LocE = movies, (ProfZ = banker, AgeZ = 25, LocZ \= lawyer, (ProfV = teacher, AgeV \= 24, LocV \= lawyer ; ProfV = firefighter, AgeV = 25, LocV = lawyer))) ),
    % Rule 5: Eddie is younger than the one who took Kara to the restaurant.
    (AgeE < AgeZ),
    % Rule 6: Eddie is 1 year younger than the banker.
    ( (ProfE = banker, AgeZ is AgeE + 1) ; (ProfZ = banker, AgeE is AgeZ + 1) ),
    % Rule 7: The gentleman who took Kara to the movies was the firefighter.
    (LocZ \= movies, LocV \= movies, LocW \= movies, LocE \= firefighter, ProfZ = firefighter, LocZ = movies),
    % Rule 8: The 23-year-old is either the teacher or the one who took Kara to the restaurant.
    ( (AgeW = 23, (ProfV = teacher, LocV \= restaurant ; ProfZ = teacher, LocZ \= restaurant)) ;
    ( (ProfV \= teacher, LocV = restaurant ; ProfZ \= teacher, LocZ = restaurant), AgeW \= 23) ).