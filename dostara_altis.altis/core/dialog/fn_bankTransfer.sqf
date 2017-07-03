#include "..\..\macro.h"
/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out again.
*/

private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_num = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if((lbCurSel 2703) == -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if(_val > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > BANK) exitWith {hint localize "STR_ATM_NotEnough"};
_tax = [2] call life_fnc_taxes;
if((typeName _tax) == "BOOL")exitWith{hint "Vous ne pouvez pas faire de virement avec ce type de compte."};
if((_val + _tax) > BANK) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_val,_tax]};

//BANK = BANK - (_val + _tax);

[] call life_fnc_atmMenu;
hint format[localize "STR_ATM_SentMoneySuccess",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText];
[1] call SOCK_fnc_updatePartial;