#include "..\..\macro.h"
/*
	File: fn_GetIDinfo.sqf
	Author: R. `KronosD` R.
	
	Description:
	flemme d'expliquer
*/

_queryid = format["SELECT id FROM banque WHERE playerid='%1',num_compte='%2'",_uid,_num];
_queryidResult = [_queryid,true] call DB_fnc_asyncCall;
bq_id = _queryidResult;

[_id,_numcompte,_playerid] RemoteExecCall ["life_fnc_SetAccountDefault",0];