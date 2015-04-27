%Answer(Object Code#*,Question Code#*,Answer )

:-dynamic answer/3.

addAnswer(ObjCode,QueCode, Answer):-
	\+answer(ObjCode,QueCode,_),
	assertz(answer(ObjCode,QueCode,Answer)),
	saveToDisk.
	
addAnswer(_,_,_):-
	writeln('falha em inserir Resposta, ja existe uma resposta para esse objeto para essa questão').

deleteAnswer(ObjCode,QueCode, Answer):-
	answer(ObjCode,QueCode,Answer),
	retract(answer(ObjCode,QueCode,Answer)),
	saveToDisk.

writeAnswersToDisk(Stream):-
	answer(ObjCode,QueCode,Answer),
	writeq(Stream,answer(ObjCode,QueCode,Answer)),
	write(Stream,'.\n'),
	fail.
writeAnswersToDisk(_).


deleteAllAnswers:-
	retractall(answer(_,_,_)).