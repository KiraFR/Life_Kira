/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
if((time - life_action_delay) < 2.5) exitWith {hint "Vous ne pouvez pas faire d'actions aussi vite."};
life_action_delay = time;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint "Vous n'avez rien supprimé.";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint "Ce n'est pas un nombre."};
if(parseNumber(_value) <= 0) exitWith {hint "Vous devez entrer un nombre positif."};
_ind = [_data,life_illegal_items] call life_fnc_index;
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Vous n'avez pas autant d'items."};
_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Vous avez jeté %1 %2.",(parseNumber _value), _type];
	
[] call life_fnc_p_updateMenu;