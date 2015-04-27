%Object(Code*,Name)

:-dynamic object/2.

addObject(Code, Name):-
	\+object(Code,_),
	assertz(object(Code,Name)),
	saveToDisk.
	
addObject(_,_,_):-
	writeln('falha em inserir Objeto, ja existe objeto com este codigo').

deleteObject(Code, Name):-
	object(Code,Name),
	retract(object(Code,Name)),
	saveToDisk.

writeObjectsToDisk(Stream):-
	object(Code,Name),
	writeq(Stream,object(Code,Name)),
	write(Stream,'.\n'),
	fail.
writeObjectsToDisk(_).


deleteAllObjects:-
	retractall(object(_,_)).