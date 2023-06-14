maladen :- 
 nl,write("|----------WELCOME TO MALADEN EXPERT SYSTEM----------|"),
 nl,write("|----------------------------------------------------------------------------------|"),
 nl,write("|---------------THIS IS A DISEASE IDENTIFICATION PROGRAM---------------|"),
 nl,write("|------------IT WHETHER THE PERSON HAS MALARIA OR DENGUE------------|"),
 nl,write("|------------IT WORKS BASED ON THE KNOWLEDGE AND FACTS.------------|"),
 nl,write("|----------------PLEASE ANSWER THE QUESTION BY TYPING----------------|"),
 nl,write("| -----------------------------------'YES' or 'NO'-------------------------------|"),
 nl,write("|----------------------------------------------------------------------------------|"),
 nl,nl,
assumption(Disease), 
write('I believe that you have ':-''),
write(Disease),
nl,
write('Thank you and best regards'),
undo.

/*Testing the Assumptions*/
assumption(malaria)  :- malaria, !.
assumption(dengue)     :- dengue, !.
assumption(fracture)      :- fracture, !.
assumption(strain)  :- strain, !.
assumption(unknown). /* unidentify case*/

/* Identification Rules*/
malaria :-
validate(pain_in_arm),
validate(join_pain),
validate(liver_function),
validate(normal),
write('Advices and Sugestions:'),
nl,
write('1: Chloroquine phosphate'),
nl,
write('2: Artemisinin-based combination therapies'),
nl,
write('3: Aralen'),
nl,
write('Spray pyrethrin or a similar insecticide in your bedroom before going to bed'),
nl.

dengue :-
validate(pain_in_arm),
validate(join_pain),
validate(liver_function),
validate(abnormal),
write('Advices and Sugestions:'),
nl,
write('1: Acetaminophen'),
nl,
write('2: Tepid sponge baths'),
nl,
write('3: Steroidal'),
nl,
write('You should avoid mosquito bites to reduce risk of further transmission'),
nl.

fracture :-
validate(pain_in_arm),
validate(can_move_arm),
write('Advice and Sugestions:'),
nl,
write('1: Tylenol'),
nl,
write('2: Advil'),
nl,
write('3: Motrin IB'),
nl,
write('Apply ice packs to limit swelling and help relieve pain.'),
nl.

strain :-
validate(pain_in_arm),
validate(join_pain),
validate(muscle_damage),
write('Advices and Sugestions:'),
nl,
write('1: Tylenol'),
nl,
write('2: Anti-inflammatory'),
nl,
write('3: Advil'),
nl,
write('Rest the strained muscle and apply ice for the first few days after the injury'),
nl.

/* Questions */
ask(Question) :-
write('Do you have the following symptom:'),
write(Question),
write('? '),
read(Response),
nl,

( (Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).
:- dynamic yes/1,no/1.

/*Validation of facts */
validate(S) :-
 (yes(S)
  ->
   true ;
 (no(S)
  ->
   fail ;
 ask(S))).

/* undo all yes/no assertions*/
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.