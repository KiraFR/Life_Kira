#include <macro.h>
/*
	File: fn_unfourriere.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 18002 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[18002,(lbCurSel 18002)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[18002,(lbCurSel 18002)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error";};

_price = [_vehicle,__GETC__(life_fourriere_prices)] call TON_fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_fourriere_prices) select _price) select 1;};
if(life_atmcash < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};


if(typeName life_fourriere_sp == "ARRAY") then {
	[[_vid,_pid,life_fourriere_sp select 0,_unit,_price,life_fourriere_sp select 1] RemoteExecCall ["TON_fnc_spawnVehicle",2];
} else {
	if(life_fourriere_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		[_vid,_pid,life_fourriere_sp,_unit,_price] RemoteExecCall ["TON_fnc_spawnVehicle",2];
	} else {
		[_vid,_pid,(getMarkerPos life_fourriere_sp),_unit,_price,markerDir life_fourriere_sp] RemoteExecCall ["TON_fnc_spawnVehicle",2];
	};
};

hint localize "STR_Garage_SpawningVeh";

life_atmcash = life_atmcash - _price;
[1] call SOCK_fnc_updatePartial;