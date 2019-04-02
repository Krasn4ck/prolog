/* 
	***************************************
	PROGRAMACIÓN LOGICA Y FUNCIONAL
	EJERCICIOS EN PROLOG 
	Fecha:20/10/2018
	V 0.02  Preview
    ************************************** 
*/

% 1.- Hacer un programa que reciba 3 listas y las concatene en una sola.
% Usamos una funcion predefinida por Prolog para unificar 2 listas la cual es: Append.
concatenar(A,B,C,L):- append(A,B,X),append(X,C,L).

% 2.- Dada una lista de numeros, escribir los predicados PROLOG necesarios para hallar el elemento
% minimo y el maximo.
% existe en Prolog las funciones min_list que devuelve el menor y max_list que devuelve el mayor.
minimo(Ls,Min):- min_list(Ls,Min).
maximo(Ls,Max):-max_list(Ls,Max).

% 3.- Dada una lista devolver el ultimo elemento de la lista.
% Creamos las condiciones 
ultimo([X],[X]).% asignamos para que devuelva cuando tenga un elemento unico
ultimo([_|Xs],X):-ultimo(Xs,X).

% 4.- Dada una lista devolver una lista ordenada.
% hacemos uso del algortimo naive sort para ordenar
naive_sort(List,Sorted):-permutation(List,Sorted),is_sorted(Sorted).
   
is_sorted([]).
is_sorted([_]).
is_sorted([X,Y|T]):-X=<Y,is_sorted([Y|T]).

% 5.- Dada una lista devolver la suma del primer y ultimo numero.
% Aqui es necesario utilizar la funcion que hicimos en el problema 3.
primero([X|_],X).
suma(Ls,X):- primero(Ls,Z),ultimo(Ls,Y),X is Z+Y.

% 6.- Dada una lista calcula la posición donde aparece el elemento Y.

pos(E,[E|_],0).%si empieza en 0 
pos(E,[_|C],P):- pos(E,C,P1), P is P1 + 1.

% 7.- Muestra los ultimos N elementos de una lista.
%con lo que aprendi puedo mostrar has 4 ultimos elemento de la lista
mostrar([],0,0):-!,fail.
mostrar([N],N,1).
mostrar([X,Y|_],N,2):-N=[X,Y].
mostrar([X,Y,Z|_],N,3):-N=[X,Y,Z].
mostrar([X,Y,Z,A|_],N,4):-N=[X,Y,Z,A].
most(Ls,U,Xs):-reverse(Ls,X),mostrar(X,Xs,U).

% 8.- Dada una lista que sume todos los elementos excepto la cabeza.

sum([_|C],X):- sum_list(C,X).

% 9.- Dada una lista que devuelva la cantidad de numero mayores a X.
mayor(_,[],0).%por defecto que mande 0 
mayor(N,[H|Q],X):- H>N, mayor(N,Q,X1), X is X1+1.%compara
mayor(N,[H|Q],X):- H=< N, mayor(N,Q,X).%contamos los menores por el backtrack


% 10.- Dada una lista saca los primeros N elementos de la lista y devuelve el resto.
%implementamos mostra.
saca(X,Ls,C):-mostra(Ls,C,X).
mostra([],0,0):-!,fail.
mostra([N],N,1).
mostra([_|N],N,1).
mostra([_,_|N],N,2).
mostra([_,_,_|N],N,3).
mostra([_,_,_,_|N],N,4).
%es asi mas o menos como se hace esta pendejada.
revok(0,[],[],0):-!,fail.
revok(X,[_|Xs],[Xs|Ys],K):- N is K+1, N =<X,revok(X,Xs,Ys,K).
