
files('data.txt').


clearMemory:-	
	writeln('Clearing Memory'),
	deleteAllAnswers,
	deleteAllQuestions,
	deleteAllObjects.

saveToDisk:-
	writeln('Saving to Disk'),
	files(File),
	open(File,write,Stream),
	writeAnswers(Stream),
	writeQuestions(Stream),
	writeObjects(Stream),
	close(Stream).
	
readDataBase:-
	files(File),
	open(File,read,Stream),
	readLine(Stream),
	close(Stream),!.
readLine(Stream):-
	read(Stream,Line),
	\+fileEnd(Line),
	asserta(Line),
	readLine(Stream).

readLine(_).
fileEnd(end_of_file).
import:-[object,question,answer].

:-import.
:- clearMemory.
:- readDataBase.