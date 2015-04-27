%Question(Code*,Sentence)

:-dynamic question/2.

addQuestion(Code, Sentence):-
	\+question(Code,_),
	assertz(question(Code,Sentence)),
	saveToDisk.
	
addQuestion(_,_,_):-
	writeln('falha em inserir Questão, ja existe questão com este codigo').

deleteQuestion(Code, Sentence):-
	question(Code,Sentence),
	retract(question(Code,Sentence)),
	saveToDisk.

writeQuestionsToDisk(Stream):-
	question(Code,Sentence),
	writeq(Stream,question(Code,Sentence)),
	write(Stream,'.\n'),
	fail.
writeQuestionsToDisk(_).


deleteAllQuestions:-
	retractall(question(_,_)).