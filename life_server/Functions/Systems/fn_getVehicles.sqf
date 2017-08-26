#include "\life_server\script_macros.hpp"
/*
	File: fn_getVehicles.sqf
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
if(_pid == "" or _side == sideUnknown or _type == "" or isNull _unit) exitWith
{
	if(!isNull _unit) then
	{
		[[]] remoteExecCall ["life_fnc_impoundMenu",(owner _unit)];
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
	[[]] remoteExecCall ["life_fnc_impoundMenu",_unit];
};

_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color, insure FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND fourriere='0' AND side='%2' AND type='%3'",_pid,_side,_type];


_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
if(typeName _queryResult == "STRING") exitWith {
	[[]] remoteExecCall ["life_fnc_impoundMenu",_unit];
};

[_queryResult] remoteExecCall ["life_fnc_impoundMenu",_unit];