#include "\life_server\script_macros.hpp"
/*
	File: fn_AcceptContrat.sqf
	Author: R. `KronosD` R.

	Description:
	Edit le default
*/
params[
	["_uid","",[""]],
	["_targetname","",[""]]
];
_accept = ["UPDATE assasin SET accepted='1' WHERE playerid='%1' AND targetname='%1'",_uid,_targetname];
[_accept,1] call DB_fnc_asyncCall;