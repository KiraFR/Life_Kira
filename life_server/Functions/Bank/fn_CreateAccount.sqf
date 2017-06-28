#include "..\..\macro.h"
/*
	File: fn_CreateAccount.sqf
	Author: R. `KronosD` R.

	Description:
	Ajoute le compte dans a db
*/
private["_insertNum"];
params[
	["_uid","",[""]],
	["_numcompte","",[""]],
	["_name","",[""]],
	["_type",0,[0]]
];

if((_uid == "") OR (_numcompte == "")) exitWith {};

switch (_type) do {
	case 1: {
		_insertNum = format["INSERT INTO banque (playerid, nam_account, numcompte, offshore) VALUES('%1','""%3""', '""%2""', '1')",
		_uid,_numcompte,_name];
	};
	case 2:{
		_insertNum = format["INSERT INTO banque (playerid, nam_account, numcompte, offshore) VALUES('%1','""%3""', '""%2""', '0')",
		_uid,_numcompte,_name];
	};
	case 3:{
		_insertNum = format["INSERT INTO banque (playerid, nam_account, numcompte, entreprise) VALUES('%1','""%3""', '""%2""', '1')",
		_uid,_numcompte,_name];
	};
	case 4:{
		_name = "Compte Epargne";
		_insertNum = format["INSERT INTO banque (playerid, nam_account, numcompte, epargne, dflt) VALUES('%1','""%3""', '""%2""', '1','1')",
		_uid,_numcompte,_name];
	};
	case 5:{
		_insertNum = format["INSERT INTO banque (playerid, nam_account, numcompte, organisation) VALUES('%1','""%3""', '""%2""', '1')",
		_uid,_numcompte,_name];
	};
};
[_insertNum,1] call DB_fnc_asyncCall;
