/*	
	---------------------------------------------------------------------------------
	BaseConocimiento2: diagnostico y sintomas
	Dominio: diagnostico automotriz. Trata los sintomas como una lista de multi - elementos
	---------------------------------------------------------------------------------

	Integrantes de Equipo:
		-> Mier Huerta Fernando
		-> Mayo Vargas Andres
		-> Hernández Jimenez Dilan Enrique
		-> Enrique Dorantes Jimenez
		-> Hernández Miranda Carlos Daniel
	
	----------------------------------------------------------------------------------

*/
conocimento('Banda del Alternador Defectuosa',
	['la banda tiene grietas', 'la banda esta cristalizada',
	'la banda esta floja']).

conocimento('Banda del Alternado Defectuosa',
	['la banda esta engrasada', '',
	'la banda rechina al girar']).

conocimento('Bateria Defectuosa',
	['la luces estan encendidas', 'el ventilador esta encendido',
	'el motor esta apagado', 'el voltaje de bateria es menor a 10.5V']).
conocimento('Regulador Defectuoso',
	['el motor esta en marcha', 'las luces estan encendidas',
	'se intensifica al acelerar']).
conocimento('Alternador Defectuoso',
	['la bateria esta en buenas condiciones', 'la luz de advertencia esta encendida',
	'el motor de arranque gira lentamente']).
conocimento('Sistema de frenos defectuoso',
	['el pedal esta duro', 'al frenar se produce un tiron lateral', 'las ruedas rechinan al frenar']).



