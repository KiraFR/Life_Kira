#include "..\..\macro.h"
/*
	File: fn_onDeath.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does whatever it needs to when a player dies.
*/
private["_unit","_killer","_weapons","_handle"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_source = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};

cutText["Waiting to respawn....","BLACK FADED"];
0 cutFadeOut 9999999;

if(playerSide == civilian) then
{
	removeAllContainers _unit;
};

hideBody _unit;

if(side _source == west && !life_use_atm) then
{
	if(CASH != 0) then
	{
		[format["$%1 from the Federal Reserve robbery was returned from the robber being killed.",[CASH] call life_fnc_numberText]] RemoteExec ["life_fnc_broadcast",0];
		CASH = 0;
	};
};

//New addition for idiots.
if(side _source == civilian && _source != _unit && !local _source) then
{
	if(vehicle _source isKindOf "LandVehicle") then {
		[2] RemoteExecCall ["life_fnc_removeLicenses",_source];
	} else {
		[3] RemoteExecCall ["life_fnc_removeLicenses",_source];
	};
};


_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_carryWeight = 0;
life_thirst = 100;
life_hunger = 100;
life_use_atm = true;
CASH = 0;

[] call SOCK_fnc_updateRequest;
