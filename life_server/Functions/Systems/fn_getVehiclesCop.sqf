#include "\life_server\script_macros.hpp"
/*
	File: fn_getVehiclesCop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sends a request to query the database information and returns vehicles.
*/
private["_pid","_side","_type","_unit","_ret","_tickTime","_queryResult"];
params[
	["_side","",[""]],
	["_type","",[""]],
	["_unit",ObjNull,[ObjNull]]
];
//Error checks
if(_side == "" OR _type == "" OR isNull _unit) exitWith{
	if(!isNull _unit) then{
		[[]] RemoteExecCall ["life_fnc_impoundMenuCop",_unit];
	};
};
_query = format["SELECT id, side, classname, type, alive, active, plate, color FROM vehicles WHERE alive='1' AND active='0' AND side='%1' AND type='%2'",_side,_type];
_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
if(typeName _queryResult == "STRING") exitWith {
	[[]] RemoteExecCall ["life_fnc_impoundMenuCop",_unit];
};

[_queryResult] RemoteExecCall ["life_fnc_impoundMenuCop",_unit];
