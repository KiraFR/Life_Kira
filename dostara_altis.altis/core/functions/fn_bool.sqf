/*
	File: fn_bool.sqf
	Auteur: J. `Kira` D.

	Description:
	convertir de numero à boolean ou l'inverse

	PARAMETRES:
	1. SCALAR/BOOLEAN(A convertir)

	RETURNS:
	1. SCALAR/BOOLEAN(converti)

	CALL:
	[SCALAR/BOOLEAN] call life_fnc_Bool
*/
private["_after"];
_before = param[0,false,[false,0]];

switch (typeName _before) do { 
	case "BOOL" : {
		if(_before) then{
			_after = 1;
		}else{
			_after = 0;
		};
	}; 
	case "SCALAR" : {
		if(_before isEqualTo 1) then{
			_after = true;
		}else{
			_after = false;
		};
	};
};

_after;