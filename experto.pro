/*	
	---------------------------------------------------------------------------------
	Sistema Experto: experto.pro
	Trata los sintomas como una lista. la cabeza es el diagnostico y la "Cola" son
	los sintomas.
	Utiliza assert/1 para cambiar dinamicamente la base de conocimientos .
	Determina la verdad y la falsedad de los sintomas conocidos.
	Puede contestar a las preguntas 'porque' e incluye capacidad de explicacion.
	Elimina dinamicamente las aseveraciones agregadas despues de cada consulta.
	---------------------------------------------------------------------------------

	Integrantes de Equipo:
		-> Mier Huerta Fernando
		-> Mayo Vargas Andres
		-> Hernández Jimenez Dilan Enrique
		-> Enrique Dorantes Jimenez
		-> Hernández Miranda Carlos Daniel
	
	----------------------------------------------------------------------------------
*/


:-dynamic conocido/1.
consulta:-
	haz_diagnostico(X),
	escribe_diagnostico(X),
	ofrece_explicacion_diagnostico(X),
	clean_scratchpad.
consulta:-
	write('No hay suficiente conocimento para elaborar un diagnostico.'),
	clean_scratchpad.

haz_diagnostico(Diagnosis):-
	obten_hipotesis_y_sintomas(Diagnosis,ListaDeSintomas),
	prueba_presencia_de(Diagnosis,ListaDeSintomas).

obten_hipotesis_y_sintomas(Diagnosis, ListaDeSintomas):-
	conocimento(Diagnosis,ListaDeSintomas).

prueba_presencia_de(Diagnosis, []).
prueba_presencia_de(Diagnosis, [Head | Tail]):- prueba_verdad_de(Diagnosis,Head),
	prueba_presencia_de(Diagnosis, Tail).

prueba_verdad_de(Diagnosis, Sintoma):-conocido(Sintoma).
prueba_verdad_de(Diagnosis, Sintoma):- not(conocido(is_false(Sintoma))),
	pregunta_sobre(Diagnosis, Sintoma, Reply), Reply=si.

pregunta_sobre(Diagnosis, Sintoma, Reply):- write('Es verdad que '),
	write(Sintoma), write('?'),
	read(Respuesta), process(Diagnosis, Sintoma, Respuesta, Reply).

process(Diagnosis, Sintoma, si, si):- asserta(conocido(Sintoma)).
process(Diagnosis, Sintoma, no, no):- asserta(conocido(is_false(Sintoma))).
process(Diagnosis, Sintoma, porque, Reply):- nl,
	write('Estoy Investigando la hipotesis siguiente: '),
	write(Diagnosis), write('.'), nl, write('Para esto necesito saber si '),
	write(Sintoma), write('.'), nl, pregunta_sobre(Diagnosis, Sintoma, Reply).
process(Diagnosis, Sintoma, Respuesta, Reply):-Respuesta \== no,
	Respuesta \== si , Respuesta \== porque, nl, 
	write('Debes contestar si, no o porque .'), nl, 
	pregunta_sobre(Diagnosis, Sintoma, Reply).

escribe_diagnostico(Diagnosis):- write('El Diagnostico es '),
	write(Diagnosis), write('.'), nl.

ofrece_explicacion_diagnostico(Diagnosis):-
	pregunta_si_necesita_explicacion(Respuesta),
	actua_consecuentemente(Diagnosis, Respuesta).

pregunta_si_necesita_explicacion(Respuesta):-
	write('¿Quieres que justifique este diagnostico?'),
	read(RespuestaUsuario),
	asegura_respuesta_si_o_no(RespuestaUsuario, Respuesta).

asegura_respuesta_si_o_no(si, si).
asegura_respuesta_si_o_no(no, no).
asegura_respuesta_si_o_no(_, Respuesta):- write('Debes contestar si o no.'),
	pregunta_si_necesita_explicacion(Respuesta).

actua_consecuentemente(Diagnosis, no).
actua_consecuentemente(Diagnosis, si):- conocimento(Diagnosis, ListaDeSintomas),
	write('Se determino este diagnostico por que se encontraron los siguientes
	sintomas:'), nl, 
	escribe_lista_de_sintomas(ListaDeSintomas).

escribe_lista_de_sintomas([]).
escribe_lista_de_sintomas([Head | Tail]):-
	write(Head), nl, escribe_lista_de_sintomas(Tail).

clean_scratchpad:-retract(conocido(X)),fail.
clean_scratchpad.
conocido(_):- fail.
not(X):- X,!,fail.
not(_).