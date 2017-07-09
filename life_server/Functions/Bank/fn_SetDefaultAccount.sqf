#include "\life_server\script_macros.hpp"
/*
	File: fn_SetDefaultAccount.sqf
	Author: R. `KronosD` R.

	Description:
	Edit le default
*/
params[["_uid",""],["_NumCompte",""]];

diag_log format["%1 - %2",typeName _uid,typeName _NumCompte];
diag_log format["%1 - %2",_uid,_NumCompte];

_edit = ["UPDATE banque SET dflt='0' WHERE playerid='%1' AND dflt='1'; UPDATE banque SET dflt='1' WHERE playerid='%1' AND numcompte='%2'",_uid,_NumCompte];
[_edit,1] call DB_fnc_asyncCall;
