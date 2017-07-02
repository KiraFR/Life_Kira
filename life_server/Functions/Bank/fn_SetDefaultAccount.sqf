#include "\life_server\script_macros.hpp"
/*
	File: fn_SetDefaultAccount.sqf
	Author: R. `KronosD` R.

	Description:
	Edit le default
*/
params[
	["_uid","",[""]],
	["_id",0,[0]]
];
_edit = ["UPDATE banque SET dflt='0' WHERE playerid='%1' AND dflt='1';
		   UPDATE banque SET dflt='1' WHERE playerid='%1' AND id='%2'",_uid,_id];
[_edit,1] call DB_fnc_asyncCall;
