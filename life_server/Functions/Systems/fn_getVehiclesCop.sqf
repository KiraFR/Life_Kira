#include "..\..\macro.h"
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
if(_pid == "" OR _side == sideUnknown OR _type == "" OR isNull _unit) exitWith
{
	if(!isNull _unit) then
	{
		[[]] RemoteExecCall ["life_fnc_impoundMenuCop",(owner _unit)];
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
	[[]] RemoteExecCall ["life_fnc_impoundMenuCop",_unit];
};

_query = format["SELECT id, side, classname, type, alive, active, plate, color FROM vehicles WHERE alive='1' AND active='0' AND fourriere='0' AND side='%1' AND type='%2'",_side,_type];


_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
if(typeName _queryResult == "STRING") exitWith {
	[[]] RemoteExecCall ["life_fnc_impoundMenuCop",_unit];
};

[_queryResult] RemoteExecCall ["life_fnc_impoundMenuCop",_unit];
