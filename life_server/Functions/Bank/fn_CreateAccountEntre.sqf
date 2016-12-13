#include "..\..\macro.h"
/*
	File: fn_CreateAccountEntre.sqf
	Author: R. `KronosD` R.

	Description:
	Ajoute le compte Entreprise dans a db
*/
params[
	["_uid","",[""]],
	["_numcompte","",[""]],
	["_name","",[""]]
];

if((_uid == "") OR (_numcompte == "")) exitWith {};

_insertNum = format["INSERT INTO banque (playerid, nam_account, numcompte, entreprise) VALUES('%1', '""%3""', '""%2""', '1')",_uid,_numcompte,_name];
[_insertNum,1] call DB_fnc_asyncCall;