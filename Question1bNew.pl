solve(DateList) :-
  DateList = [ [VincentAge, VincentProfession, VincentLocation],
               [EddieAge, EddieProfession, EddieLocation],
               [ZacharyAge, ZacharyProfession, ZacharyLocation],
               [WayneAge, WayneProfession, WayneLocation] ],
  AgeList = [VincentAge, EddieAge, ZacharyAge, WayneAge],
  ProfessionList = [VincentProfession, EddieProfession, ZacharyProfession, WayneProfession],
  LocationList = [VincentLocation, EddieLocation, ZacharyLocation, WayneLocation],

  % Clue 1
  VincentAge \= 24,

  % Clue 2
  member([25, _, movies], DateList),

  % Clue 3
  ( (WayneAge = 23, WayneLocation = county_fair, (LawyerAge = 23, LawyerProfession = lawyer ; LawyerAge =\= 23, LawyerProfession \= lawyer))
  ; (LawyerAge = 23, LawyerLocation = county_fair, (WayneAge =\= 23, WayneProfession \= lawyer ; WayneAge = 23, WayneProfession = lawyer)) ),

  % Clue 4
  ( (EddieAge \= 25, member([25, _, movies], DateList), (EddieProfession = lawyer ; EddieLocation \= movies))
  ; (EddieProfession = lawyer, EddieLocation \= movies, (member([25, _, movies], DateList), EddieAge \= 25 ; EddieAge = 25, member([25, lawyer, _], DateList))) ),

  % Clue 5
  member([_, _, restaurant], DateList),
  member([EddieAge, _, _], DateList),
  EddieAge < 25,

  % Clue 6
  member([EddieAge, banker, _], DateList),

  % Clue 7
  member([25, firefighter, movies], DateList),

  % Clue 8
  ( (TeacherAge = 23, TeacherLocation = restaurant, (EddieAge =\= 23, EddieProfession \= teacher ; EddieAge = 23, EddieProfession = teacher))
  ; (EddieProfession \= teacher, EddieLocation \= restaurant, (TeacherAge = 23, TeacherLocation = restaurant ; TeacherAge \= 23, TeacherLocation \= restaurant)) ),

  % Create lists for each variable and make sure they are distinct
  append(DateList, [AgeList, ProfessionList, LocationList], Vars),
  Vars ins 22..25,
  all_distinct(AgeList),
  all_distinct(ProfessionList),
  all_distinct(LocationList),

  % Label the variables and return the result
  label(Vars),
  write(DateList).