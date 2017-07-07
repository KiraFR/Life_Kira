#include "\life_server\script_macros.hpp"
/*
	File: fn_SetDefaultAccount.sqf
	Author: R. `KronosD` R.

	Description:
	Edit le default
*/
params[
	["_uid","",[""]],
	["_numcompte","",[""]]
];
_edit = ["UPDATE banque SET dflt='0' WHERE playerid='%1' AND dflt='1';
		   UPDATE banque SET dflt='1' WHERE playerid='%1' AND numcompte='%2'",_uid,_numcompte];
[_edit,1] call DB_fnc_asyncCall;
