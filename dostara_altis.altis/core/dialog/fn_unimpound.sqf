#include "..\..\macro.h"
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price","_PGarage"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_price = [_vehicle,__GETC__(life_garage_prices)] call TON_fnc_index;
if(_PGarage isKindOf "House_F")then {_price = 0;}else {
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices) select _price) select 1;};
};	//Changment du Prix pour un garage Privé

if(life_atmcash < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};

if(typeName life_garage_sp == "ARRAY") then {
	[_vid,_pid,life_garage_sp select 0,_unit,_price,life_garage_sp select 1] RemoteExecCall ["TON_fnc_spawnVehicle",2];
} else {
	if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		[_vid,_pid,life_garage_sp,_unit,_price] RemoteExecCall ["TON_fnc_spawnVehicle",2];
	} else {
		[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp] RemoteExecCall ["TON_fnc_spawnVehicle",2];
	};
};

hint localize "STR_Garage_SpawningVeh";

life_atmcash = life_atmcash - _price;
[1] call SOCK_fnc_updatePartial;