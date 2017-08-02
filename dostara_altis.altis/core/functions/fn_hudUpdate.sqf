#include "..\..\macro.h"
/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_health"];
disableSerialization;

_dialog = uiNameSpace getVariable ["RscDisplayInventory",displayNull];
if(isNull _dialog)exitWith{};
_food = _dialog displayCtrl 23500;
_water = _dialog displayCtrl 23510;
_health = _dialog displayCtrl 23515;
_money = _dialog displayCtrl 23520;

_food ctrlSetPosition [safeZoneX+safeZoneW-0.15,safeZoneY+safeZoneH-0.637];
_food ctrlSetText format["%1", life_hunger];
_food ctrlCommit 0;
_water ctrlSetPosition [safeZoneX+safeZoneW-0.15,safeZoneY+safeZoneH-0.576];
_water ctrlSetText format["%1", life_thirst];
_water ctrlCommit 0;
_health ctrlSetPosition [safeZoneX+safeZoneW-0.15,safeZoneY+safeZoneH-0.513];
_health ctrlSetText format["%1", round((1 - (damage player)) * 100)];
_health ctrlCommit 0;
_money ctrlSetPosition [safeZoneX+safeZoneW-0.15,safeZoneY+safeZoneH-0.445];
_cash = format["%1",[life_cash] call life_fnc_numberText];
_money ctrlSetText format["%1 €", format["%1",_cash]];
_money ctrlCommit 0;