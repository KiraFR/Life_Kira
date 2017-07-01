/*
	File:  fn_plafond.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1. SCALAR(Type)
		0. Epargne
		1. Normal
		2. Offshore
	RETURNS:
	NONE

	CALL:
	[SCALAR] call life_fnc_plafond
*/
private ["_ret"];
_type = param[0,0,[0]];

switch (_type) do {
	case 0 : {_ret = 10000;};
	case 1 : {_ret = 200000;};
	case 2 : {_ret = 1000000;};
};

_ret;