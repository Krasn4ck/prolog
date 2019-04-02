:- dynamic(vuelo/3).
/*
Ejercicio de PROLOG 
*/

vuelo(nueva_york, chicago,1000).
vuelo(chicago, denver,1000).
vuelo(nueva_york, toronto,800).
vuelo(nueva_york, denver,1900).



% 1.- Hacer una regla donde visualice todos los viajes.
% 2.- Hacer una regla que elimine todos los viajes de un origen.


vuelade:-write('desde '),read(A), 
               write('a: '), read(B), encontrar(A,B).

encontrar(A,B):- ruta(A,B,D), write('La distancia es de '),write(D), write(' Km.'),read(_),!, nl.

ruta(A,B,C):- es_vuelo(A,B,C).
ruta(_,_,D):- write('no, hay ruta para ese destino '), nl, D=0,read(_),!.
es_vuelo(T,T2,D):- vuelo(T,T2,D), write(T).


agregar:-write('desde: '),read(Desde),write('hacia: '),read(H),
write('distancia: '),read(Dis),
assert(vuelo(Desde,H,Dis)).

borrar :- write('Desde: '),read(Desde), retract(vuelo(Desde,_,_)), !,
	   write('vuelo Borrado'),read(_).

borrar :- write('No existe este vuelo').

borratodo:- abolish(vuelo/3), write('vuelos Borrados'),read(_).
%soluciones
% 1.- Hacer una regla donde visualice todos los viajes.

mostrar:-findall([Origen, Destino, Distancia], vuelo(Origen, Destino, Distancia), Vuelos),
    writeln(Vuelos),read(_).

% 2.- Hacer una regla que elimine todos los viajes de un origen.
elim_vuelo:- write('ingresa el vuelo de origen:'),read(Origen),borra_origen(Origen).
borra_origen(Origen):- vuelo(Aux,_,_), Origen == Aux, retract(vuelo(Aux,_,_)), borra_origen(Origen), !.
borra_origen(Origen):-write('los vuelos de '),write(Origen),write(' han sido borrados con exito'),read(_).

% Menu del programa.
menu :- limpiapantalla,
      write('                            *** M e n u   P r i n c i p a l ***'),nl,
      write('				    1.- Agregar vuelos '),nl,
      write('				    2.- Eliminar vuelos '),nl,
      write('				    3.- Listar vuelos '),nl,
      write('				    4.- Eliminar todos los vuelos '),nl,
      write('				    5.- Eliminar los vuelos de un origen '),nl,
      write('				    6.- Tomar un vuelo '),nl,
      write('				    7.- Salir '),nl,
	read(Op),
	ejecutar(Op).

ejecutar(Op) :- Op == 1, limpiapantalla,
                          write('Agregar vuelos '),
                          nl, nl, agregar, 
                          menu;
		Op == 2, limpiapantalla,
                          write('Eliminar vuelo '),
                          nl, nl,borrar,menu;
		Op == 3, limpiapantalla,
                          write('Lista de vuelos '),
                          nl, nl,mostrar,menu;
		Op == 4,  limpiapantalla,
                          write('Borrar todos los vuelos '),
                          nl, nl,borratodo, menu;
		Op == 5, limpiapantalla,
                          write('Eliminar vuelos de origen'),
                          nl, nl,elim_vuelo,menu;
		Op == 6, limpiapantalla,
                         write('Toma de vuelos '),
			 nl,nl,
			 vuelade, menu;
		Op == 7,  write('Adios...'),
                          nl, nl,true.


limpiapantalla :-  write('\e[H\e[2J').
