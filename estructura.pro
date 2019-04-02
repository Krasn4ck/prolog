/*
Estructuras en PROLOG
Alumno: Hernández Miranda Carlos Daniel
02/11/2018
*/
% lee(persona,importe,[escritor(escritor,titulo,paginas,costo)
lee(maria,600,[escritor(marquez,cien_años_soledad,150,200), escritor(antoine,principito,200,150), escritor(coelho,el_alquimista,50,250)]).
lee(sofia,650,[escritor(antoine,principito,100,150), escritor(marquez,tiempos_colera,200,150), escritor(frank,el_diario,160,350)]).
lee(ricardo,1150,[escritor(brow,el_codigo_da_vinci,250,450), escritor(patrik,perfume,100,250), escritor(dante,divina_comedia,260,450)]).


% 1.- El costo($) de la lectura de libros
% 2.- Numero de libros que ha leido una persona
% 3.- El numero de paginas que ha leido una persona

%Rutinas necesarias
longitud([],0).		  	     
longitud([_|L],N) :- longitud(L,T),   N is T + 1.


% 1.- El costo($) de la lectura de libros
costo:-write('Dame el nombre de la persona: '),read(Persona),
lee(Persona,Costo,_),write('El costo de lectura de todos los libros es $ '),write(Costo).

% 2.- Numero de libros que ha leido una persona
num_libros:-write('Dame el nombre de la persona:'),read(Persona),
lee(Persona,_,Xs),longitud(Xs,N),write('El numero de libros es: '),write(N).

% 3.- El numero de paginas que ha leido una persona
num_paginas :- write('Dame el nombre de la persona: '), read(Persona),
lee(Persona,_,[escritor(_,_,A,_), escritor(_,_,B,_), escritor(_,_,C,_)]), sum_list([A,B,C], S),
write('El numero total de paginas leidas son: '), write(S).




