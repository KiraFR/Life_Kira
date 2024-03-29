#include "\life_server\script_macros.hpp"
/*
	File: fn_getVehicles_fourriere.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends a request to query the database information and returns vehicles.
*/
private["_pid","_side","_type","_unit","_ret","_tickTime","_queryResult"];
params[
	["_pid","",[""]],
	["_side",sideUnknown,[civilian]],
	["_type","",[""]],
	["_unit",ObjNull,[ObjNull]]
];
//Error checks
if(_pid == "" OR _side == sideUnknown OR _type == "" OR isNull _unit) exitWith
{
	if(!isNull _unit) then
	{
		[[]] remoteExecCall ["life_fnc_fourriereMenu",(owner _unit)];

	};
};

_unit = owner _unit;
_side = switch(_side) do
{
	case west:{"cop"};
	case civilian: {"civ"};
	case independent: {"med"};
	default {"Error"};
};

if(_side == "Error") exitWith {
	[[]] remoteExecCall ["life_fnc_fourriereMenu",_unit];
};

_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND fourriere='1' AND side='%2' AND type='%3'",_pid,_side,_type];


_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
if (Debug) then {
	diag_log "------------- Client Query Fourriere Request -------------";
	diag_log format["QUERY Fourriere: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
	diag_log format["Result: %1",_queryResult];
	diag_log "------------------------------------------------";
};
if(typeName _queryResult == "STRING") exitWith {
	[[]] remoteExecCall ["life_fnc_fourriereMenu",_unit];
};

[_queryResult] remoteExecCall ["life_fnc_fourriereMenu",_unit];