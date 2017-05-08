#include <macro.h>
/*
	File: fn_p_updateMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the player menu (Virtual Interaction Menu)
*/
private["_dialog","_inv","_lic","_licenses","_near","_near_units","_mstatus","_shrt","_side","_ui","_food","_water","_health"];
disableSerialization;
_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};
_dialog = uiNameSpace getVariable ["RscDisplayInventory",displayNull];
_inv = _dialog displayCtrl 2005;
_lic = _dialog displayCtrl 2014;
_near = _dialog displayCtrl 2022;
_near_i = _dialog displayCtrl 2023;
_mstatus = _dialog displayCtrl 2015;
_pstatus = _dialog displayCtrl 2016;
_food = _dialog displayCtrl 23500;
_water = _dialog displayCtrl 23510;
_health = _dialog displayCtrl 23515;
_money = _dialog displayCtrl 23520;
_struct = "";
lbClear _inv;
lbClear _near;
lbClear _near_i;

_near_units = [];
{ if(player distance _x < 10) then {_near_units pushBack _x};} foreach playableUnits;
{
	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then
	{
		_near lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
		_near lbSetData [(lbSize _near)-1,str(_x)];
		_near_i lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
		_near_i lbSetData [(lbSize _near)-1,str(_x)];
	};
} foreach _near_units;
if(life_nbAcc > 0) then{
	_mstatus ctrlSetStructuredText parseText format["<img size='1.3' image='icons\bank.paa'/> <t size='0.8px'>%1€</t><br/><img size='1.2' image='icons\money.paa'/> <t size='0.8'>%2€</t>",[life_atmcash] call life_fnc_numberText,[life_cash] call life_fnc_numberText];
}else{
	_mstatus ctrlSetStructuredText parseText format["<img size='1.2' image='icons\money.paa'/> <t size='0.8'>%1€</t>",[life_cash] call life_fnc_numberText];
};
if(life_pPermis > 0) then {
	_pstatus ctrlSetStructuredText parseText format["<img size='1.3' image='icons\ppermis.paa'/> <t size='0.8px'>Points: %1</t>",life_pPermis];
}else{ctrlShow[2016,false];};
ctrlSetText[2009,format["%3,place: %1 / %2", life_carryWeight, life_maxWeight,ctrlText 2009]];
{
	_str = [_x] call life_fnc_varToStr;
	_shrt = [_x,1] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		_inv lbAdd format["%1x - %2",_val,_str];
		_inv lbSetData [(lbSize _inv)-1,_shrt];
	};
} foreach life_inv_items;
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
} foreach life_licenses;
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