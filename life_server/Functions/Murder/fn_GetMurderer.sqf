/*
	File: fn_GetMurderer.sqf
	Author: R. `KronosD` R.

	Description:
	flemme d'expliquer
*/
private["_query","_queryResult"];
params[
	["_murduid","",[""]],
	"_returnToSender"
];
if(isNil "_returnToSender")exitWith{};

_query = format["SELECT murduid, targetname FROM assasin WHERE targetname"];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

//[_type, _data]
[1,_queryResult] remoteExecCall ["life_fnc_onKilled",_returnToSender];
