/*
	File: fn_updateBanque.sqf
	Author: R. `KronosD` R.
*/
private["_NumCompte","_Cash","_PlayerUID","_Info","_query"];
params[["_Info",[],[[]]],["_PlayerUID","",[""]]];

_query = "";

{
	_NumCompte = _x select 1;
	_Cash = _x select 2;

	_query = _query + format ["UPDATE banque SET bankAcc='%1' WHERE numcompte= '%2';",_Cash,_NumCompte];
}forEach _Info;

[_query,1] call DB_fnc_asyncCall;
