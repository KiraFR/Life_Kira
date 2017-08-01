/*
	File: fn_syncAccountDB.sqf
	Author: R. `KronosD` R.
	Changed: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1. ARRAY(tout les compte)

	RETURNS:
	NONE

	CALL:
	[ARRAY] call DB_fnc_syncAccountDB
*/
/*private ["_str","_query"];*/
_comptes = param[0,[],[[]]];
_pid = param[1,"",[""]];
private _query = "UPDATE banque SET bankacc = CASE";
{
	_str = format[" WHEN numcompte = '%1' THEN '%2' ",(_x select 1),(_x select 2)];
	_query = _query + _str;
}foreach _comptes;
_query = _query + format["ELSE bankacc END WHERE playerid='%1';",_pid];

[_query,1] call DB_fnc_asyncCall;