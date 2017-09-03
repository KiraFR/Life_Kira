#include "..\..\macro.h"
/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
private["_dialog","_inv","_lic","_licenses","_near","_mstatus","_shrt","_side","_ui","_food","_water","_health","_itemsPoids"];
disableSerialization;
_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};
_dialog = uiNameSpace getVariable ["RscDisplayInventory",displayNull];
_inv = _dialog displayCtrl 2005;
_lic = _dialog displayCtrl 2014;
_itemsPoids = _dialog displayCtrl 2009;
_mstatus = _dialog displayCtrl 2015;
_pstatus = _dialog displayCtrl 2016;
_permis = _dialog displayCtrl 1066;
_food = _dialog displayCtrl 23500;
_water = _dialog displayCtrl 23510;
_health = _dialog displayCtrl 23515;
_money = _dialog displayCtrl 23520;
_struct = "";
lbClear _inv;


if(life_pPermis > 0) then {
	_permis ctrlSetStructuredText parseText format["<img size='1.3' image='\Kira_assets\texture\permis.paa'/> <t size='0.8px'>Points: %1</t>",life_pPermis];
}else{ctrlShow[2016,false];};

_itemsPoids ctrlSetText format["Items, place: %1 / %2", life_carryWeight, life_maxWeight];
{
	_str = [_x] call life_fnc_varToStr;
	_shrt = [_x,1] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		_inv lbAdd format["%1x - %2",_val,_str];
		_inv lbSetData [(lbSize _inv)-1,_shrt];
	};
} forEach life_inv_items;
{
	if((_x select 1) == _side) then
	{
		_str = [_x select 0] call life_fnc_varToStr;
		_val = missionNamespace getVariable (_x select 0);
		if(_val) then
		{
			_struct = _struct + format["%1<br/>",_str];
		};
	};
} forEach life_licenses;
if(_struct == "") then{_struct = "No Licenses";};
_lic ctrlSetStructuredText parseText format["<t size='0.8px'>%1</t>",_struct];



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