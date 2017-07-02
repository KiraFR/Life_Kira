#include "\life_server\script_macros.hpp"
/*
	File: fn_jailSys.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	I forget?
*/
params[
  ["_unit",Objnull,[Objnull]],
  ["_bad",false,[false]]
];

private _id = owner _unit;

if(isNull _unit) exitWith {};

[[],_bad] RemoteExecCall ["life_fnc_jailMe",_id];
