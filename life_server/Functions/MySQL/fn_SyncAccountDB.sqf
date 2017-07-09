/*
	File: fn_syncAccountDB.sqf
	Author: R. `KronosD` R.
	Changed: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1. ARRAY(tout les compte)
		select 0: courant.
		select 1: entreprise.
		select 2: offshore

	RETURNS:
	NONE

	CALL:
	[ARRAY] call DB_fnc_syncAccountDB
*/

private["_NumCompte","_Cash","_query"];
params[["_NumCompte", ""],["_Cash", 0]];

_query = format["UPDATE banque SET bankacc = '%1' WHERE numcompte = '%2';",_Cash,_NumCompte];

[_query,1] call DB_fnc_asyncCall;