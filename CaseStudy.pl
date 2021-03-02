/******************** CASE STUDY ON DISEASE DIAGNOSIS  *********************/

start:- concern(Disease),    /* here start is the procedure which will return true only if its given condition return true */   /* here we need to check or verify for the disease which are given below whether it is true or not */
write('Hello SURAJ, I believe that the patient have : '),
write(Disease),
nl,              /* here nl is used for the new line */
write('TAKE CARE '),
undo.

/* These are the disease that should be tested with the symptoms*/
             /* for checking disease we are having some of the hypothesis which needs to return true in order to verify the disease and return the start procedure as true */
concern(cold) :- cold, !.
concern(corona) :- corona, !.
concern(flu) :- flu, !.
concern(typhoid) :- typhoid, !.
concern(measles) :- measles, !.
concern(malaria) :- malaria, !.

concern(unknown_disease).         /* which means there is no diagnosis for the following symptoms*/


/*Here the rules are given for disease identification*/
                                                   /* here we are defining some of the rules which is used to verify the hypothesis which we gave above */
cold :-        /* now it will verify the given symptoms for returning cold to be true and if anyone of the symptoms is false then it will proceed with next hypothesis */
askfor(headache),
askfor(runny_nose),
askfor(sneezing),
askfor(sore_throat),
write('Advices and Sugestions:'),
nl,
write('1: Tylenol/tab'),
nl,
write('2: panadol/tab'),
nl,
write('3: Nasal spray'),
nl,
write('Please wear warm cloths Because'),
nl.

corona :-
askfor(headache),
askfor(fever),
askfor(runny_nose),
askfor(dry_cough),
write('Advices and Sugestions:'),
nl,
write('1: wear a mask'),
nl,
write('2: Contact to the nearby hospital'),
nl,
write('3: Isolate Yourself'),
nl,
write('Please wear a mask and isolate yourself and contact to the nearby COVID hospital beacuse'),
nl.

flu :-
askfor(fever),
askfor(headache),
askfor(chills),
askfor(body_ache),
write('Advices and Sugestions:'),
nl,
write('1: Tamiflu/tab'),
nl,
write('2: panadol/tab'),
nl,
write('3: Zanamivir/tab'),
nl,
write('Please take a warm bath and do salt gargling Because'),
nl.

typhoid :-
askfor(headache),
askfor(abdominal_pain),
askfor(poor_appetite),
askfor(fever),
write('Advices and Sugestions:'),
nl,
write('1: Chloramphenicol/tab'),
nl,
write('2: Amoxicillin/tab'),
nl,
write('3: Ciprofloxacin/tab'),
nl,
write('4: Azithromycin/tab'),
nl,
write('Please do complete bed rest and take soft Diet Because'),
nl.

measles :-
askfor(fever),
askfor(runny_nose),
askfor(rash),
askfor(conjunctivitis),
write('Advices and Sugestions:'),
nl,
write('1: Tylenol/tab'),
nl,
write('2: Aleve/tab'),
nl,
write('3: Advil/tab'),
nl,
write('4: Vitamin A'),
nl,
write('Please Get rest and use more liquid Because'),
nl.

malaria :-
askfor(fever),
askfor(sweating),
askfor(headache),
askfor(nausea),
askfor(vomiting),
askfor(diarrhea),
write('Advices and Sugestions:'),
nl,
write('1: Aralen/tab'),
nl,
write('2: Qualaquin/tab'),
nl,
write('3: Plaquenil/tab'),
nl,
write('4: Mefloquine'),
nl,
write('Please do not sleep in open air and cover your full skin Because'),
nl.

/* how to ask questions */
ask(Question) :-
write('Does the patient have following symptom:'),
write(Question),      /* here it will ask for the symptomps and the question is replaced by the symptomps */
write(' ? '),
read(Response),       /* the reply of the user is read by using this read command */
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question)) ;          /* it will assert and save it in memory if the answer is yes */
assert(no(Question)), fail).     /* it will not save in its memory if the answer is no and moved to the other question */

:- dynamic yes/1,no/1.           /* it will start keep asking questions from user dynamically and user has to give answer in yes(y) or no(n) format according to the question */  
/*How to askfor something */
askfor(S) :- (yes(S) -> true ; 
(no(S) -> fail ; ask(S))).      /* if the answer is yes and it is true an will ask for another set of question and if the answer is no it will fail and move to other hypothesis */ /* and here the s is replaced by the symptoms as it is a parameter */
/* undo all yes/no assertions*/     /* the undo function is here to undo or clear(refresh) all the working memory and one set of question or hypothesis is verified */
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
