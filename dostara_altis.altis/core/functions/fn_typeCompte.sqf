/*
	File: fn_typeCompte.sqf
	Author: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1. STRING(Numero compte)

	RETURNS:
	1. SCALAR(type compte)
		1. Epargne
		2. Courant
		3. Offshore
		4. Entreprise
		5. Organisme

	CALL:
	[STRING] call life_fnc_typeCompte
*/
private["_ret"];
_num = param[0,"",[""]];
_numArray = _num splitString "";
_type = [_numArray select 0,_numArray select 1] joinString "";
switch (_type) do { 
	case "OS": {_ret = 3;}; //offshore
	case "RD" : {_ret = 2;}; //courant
	case "EP" : {_ret = 1;}; //Epargne
	case "ED" : {_ret = 4;}; //Enteprise
	case "OD" : {_ret = 5;}; //Organisme
};
_ret;