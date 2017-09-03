/*
	File: fn_giveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected item & amount to the selected player and
	removes the item & amount of it from the players virtual
	inventory.
*/
private _val = param[0,"",[""]];
private _item = param[1,"",[""]];
private _unit = param[2,objNull,[objNull]];
private _type = "";
if(isNil "_unit") exitWith {ctrlEnable[9004,true];};
if(_unit == player) exitWith {ctrlEnable[9004,true];};
if(isNull _unit) exitWith {ctrlEnable[9004,true];};

//A series of checks *ugh*
if(!([_val] call TON_fnc_isnumber)) exitWith {hint "Ce n'est pas un chiffre/nombre.";ctrlEnable[9004,true];};
if(parseNumber(_val) <= 0) exitWith {hint "Vous devez mettre un montant positif.";ctrlEnable[9004,true];};
if(!([false,_item,(parseNumber _val)] call life_fnc_handleInv)) exitWith {hint "Vous ne pouvez pas envoyer autant d'argent, vous n'avez pas assez.";ctrlEnable[9004,true];};
[_unit,_val,_item,player] RemoteExecCall ["life_fnc_receiveItem",_unit];
_type = [_item,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Vous avez donné %1 %2 %3",_unit getVariable["realname",name _unit],_val,_type];
[] call life_fnc_p_updateMenu;
ctrlEnable[9004,true];
closeDialog 0;