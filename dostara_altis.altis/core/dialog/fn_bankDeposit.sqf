#include "..\..\macro.h"
/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out.
*/
private["_value","_dftfound","_plafond","_taxe","_taxes","_ac","_first"];
_value = parseNumber(ctrlText 2702);
if((time - life_action_delay) < 2.5) exitWith {hint "Vous ne pouvez pas faire d'actions aussi vite."};
life_action_delay = time;
//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 50) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > CASH) exitWith {hint localize "STR_ATM_NotEnoughCash"};
_ac = missionNamespace getVariable ["accountBanque",[]];
{
	_dft = _x select 3;

	
	if(_dft)exitWith{
		/*
			1. Epargne
			2. Courant
			3. Offshore
			4. Entreprise
			5. Organisme
		*/
		_first = (_x select 4);
		if(typeName _first == "SCALAR")then{_first = [(_x select 4)] call life_fnc_bool;};
		_type = [(_x select 1)] call life_fnc_typeCompte;
		switch (_type) do {
			case 1 : {
				_plafond = [0] call life_fnc_plafond;
			};
			case 2 : {
				if(_first)then{
					_plafond = [1] call life_fnc_plafond;
				};
			};
			case 3 : {
				if(_first)then{
					_plafond = [2] call life_fnc_plafond;
				};
			};
		};
	};
}forEach _ac;

_valTot = BANK + _value;
if(!(isNil "_plafond") && (_valTot > _plafond))exitWith{life_atmUsing = false;hint "Vous allez depasser le plafond de ce compte, impossible de deposer de l'argent."};
_taxe = 0;

_taxe = [0] call life_fnc_taxes;
if(_value <= 50 && (_taxe isEqualTo 50)) exitWith{life_atmUsing = false;hint "Vous ne pouvez pas deposer moins ou égale à 50€."};
if(_taxe == 50)then{
	_value = _value - _taxe;
	_taxes = _taxe;
	CASH = CASH - _value - _taxe;
}else{
	_taxes = floor(_value * _taxe);
	_value = floor(_value - _taxes);
	CASH = CASH - _value - _taxes;
};
	
BANK = BANK + _value;
call life_fnc_refreshAC;
hint format["Vous venez de deposer %1 dostar, %2€ de taxe ont été retiré.",[_value] call life_fnc_numberText,[_taxes] call life_fnc_numberText];
call SOCK_fnc_updateBanque;
call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

[CASH,BANK,_value,_taxes,"Depot"] remoteExecCall ["KIRA_fnc_taxes",2];
life_atmUsing = false;