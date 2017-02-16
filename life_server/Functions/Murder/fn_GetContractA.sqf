#include "..\..\macro.h"
/*
	File: fn_GetContrat.sqf
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

_query = format["SELECT targetname, targetjob, price, type FROM assasin WHERE accepted '1' AND murduid '%1'",_uid];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

//[_type, _data]
[1,_queryResult] remoteExecCall ["life_fnc_murdererMenu",_returnToSender];