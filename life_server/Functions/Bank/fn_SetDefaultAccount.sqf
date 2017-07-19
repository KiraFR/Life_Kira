#include "\life_server\script_macros.hpp"
/*
	File: fn_SetDefaultAccount.sqf
	Author: R. `KronosD` R.

	Description:
	Edit le default
*/
private["_edit","_edit1"];
params[["_uid",""],["_NumCompte",""]];

_edit = format["UPDATE banque SET dflt='0' WHERE playerid='%1' AND dflt='1';",_uid,_NumCompte];
[_edit,1] call DB_fnc_asyncCall;

Sleep 0.2;

_edit1 = format["UPDATE banque SET dflt='1' WHERE playerid='%1' AND numcompte='%2';",_uid,_NumCompte];
[_edit1,1] call DB_fnc_asyncCall;