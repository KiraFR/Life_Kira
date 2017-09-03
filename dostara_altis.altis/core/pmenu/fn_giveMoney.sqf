#include "..\..\macro.h"
/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives the selected amount of money to the selected player.
*/
private _amount = param[0,"",[""]];
private _unit = param[1,objNull,[objNull]];
if(isNil "_unit") exitWith {ctrlEnable[9004,true];};
if(_unit == player) exitWith {ctrlEnable[9004,true];};
if(isNull _unit) exitWith {ctrlEnable[9004,true];};

//A series of checks *ugh*
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Vous devez mettre un montant positif.";ctrlEnable[9004,true];};
_amount = parseNumber(_amount);
if(_amount <= 0) exitWith {hint "Ce n'est pas un chiffre/nombre.";ctrlEnable[9004,true];};
if(_amount > CASH) exitWith {hint "Vous n'avez pas assez d'argent !";ctrlEnable[9004,true];};
if(isNull _unit) exitWith {ctrlEnable[9004,true];};

//double check car ça m'enerve
if(_amount > CASH) exitWith {hint "Vous n'avez pas assez d'argent !";ctrlEnable[9004,true];};
hint format["Vous avez €%1 to %2",[_amount] call life_fnc_numberText,_unit getVariable["realname",name _unit]];
CASH = CASH - _amount;
[0] call SOCK_fnc_updatePartial;
[_unit,str(_amount),player] RemoteExecCall ["life_fnc_receiveMoney",_unit];
[] call life_fnc_p_updateMenu;
ctrlEnable[9004,true];
closeDialog 0;
