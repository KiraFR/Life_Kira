#include "\life_server\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cleans up containers inside the house.
*/
private["_query","_houses"];
_query = format["SELECT pid, pos, inventory, containers FROM houses WHERE pid='%1' AND owned='1'",_this];

_houses = [_query,2,true] call DB_fnc_asyncCall;

if(count _houses == 0) exitWith {};
{
	_pos = call compile format["%1",_x select 1];
	_house = nearestBuilding _pos;
	
	if(!isNil {(_house getVariable "containers")}) then {
		{if(!isNull _x) then {deleteVehicle _x;};} forEach (_house getVariable "containers");
		_house setVariable["containers",nil,true];
	};
} forEach _houses;