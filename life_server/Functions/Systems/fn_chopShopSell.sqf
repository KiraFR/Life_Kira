#include "\life_server\script_macros.hpp"
/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Checks whether or not the vehicle is persistent or temp and sells it.
*/
params[
	["_unit",objNull,[objNull]],
	["_vehicle",objNull,[objNull]],
	["_price",500,[0]],
	["_cash",0,[0]]
];

//Error checks
if(isNull _vehicle OR isNull _unit) exitWith
{
	owner _unit publicVariableClient "life_action_inUse";
};

_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_unit = owner _unit;

_dbInfo = _vehicle getVariable["dbInfo",[]];
if(count _dbInfo > 0) then {
	_uid = _dbInfo select 0;
	_plate = _dbInfo select 1;

	_query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];

	_sql = [_query,1] call DB_fnc_asyncCall;
};

deleteVehicle _vehicle;
_unit publicVariableClient "life_action_inUse";
_unit publicVariableClient "life_cash";
[2,format[(localize "STR_NOTF_ChopSoldCar"),[_displayName,[_price] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",_unit];
