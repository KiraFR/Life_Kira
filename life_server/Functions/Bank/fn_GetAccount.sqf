#include "..\..\macro.h"
/*
	File: fn_GetAccount.sqf
	Author: R. `KronosD` R.
	
	Description:
	flemme d'expliquer
*/
private["_query","_queryResult"];
params[
	["_uid","",[""]],
	"_returnToSender"
];
if(isNil "_returnToSender")exitWith{};

_query = format["SELECT id,nam_account, numcompte, offshore, entreprise, bankacc, dflt FROM banque WHERE playerid='%1'",_uid];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

//[_type, _data]
[1,_queryResult] remoteExecCall ["life_fnc_accountgest",_returnToSender];