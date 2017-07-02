#include "..\..\macro.h"
/*
	File: fn_atmMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens and manages the bank menu.
*/
if(!life_use_atm) exitWith
{
	hint localize "STR_Shop_ATMRobbed";
};

if(!dialog) then
{
	if(!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;
private _text = getControl(2700,2701);
private _units = getControl(2700,2780);

lbClear _units;
_text ctrlSetStructuredText parseText format["<img size='1.7' image='\Kira_assets\hud\bank.paa'/> $%1<br/><img size='1.6' image='\Kira_assets\hud\money.paa'/> $%2",[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
_repertoire = profileNamespace getVariable ["repertoireBanque",[]];
{
	_units lbAdd format["%1 (%2)",_x select 0, _x select 1];
	_units lbSetData [(lbSize _units)-1,str(_x select 1)];
} forEach _repertoire;
lbSetCurSel [2780,0];
/*
if(isNil {(grpPlayer getVariable "gang_bank")}) then {
	(getControl(2700,2705)) ctrlEnable false;
};
/*
