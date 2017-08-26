#include "..\..\macro.h"
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_price = [_vehicleLife] call life_fnc_priceVehBuy;
_price = _price * 0.5;
[_vid,_pid,_price,player,life_garage_type] RemoteExecCall ["TON_fnc_vehicleDelete",2];
hint format[localize "STR_Garage_SoldCar",[_price] call life_fnc_numberText];
BANK = BANK + _price;
call life_fnc_refreshAC;
call SOCK_fnc_updateBanque;
closeDialog 0;