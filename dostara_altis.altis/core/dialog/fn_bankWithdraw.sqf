#include "..\..\macro.h"
/*
	COPY PASTE TIME
*/
private _val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && BANK > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

diag_log format["%1",_val];
_taxe = [1] call life_fnc_taxes;
diag_log format["%1",_taxe];
_taxes = _val * _taxe;
diag_log format["%1",_taxes];
_val = _val - _taxes;
diag_log format["%1",_val];
CASH = CASH + _val;
diag_log format["%1",CASH];
BANK = BANK - _val;
diag_log format["%1",BANK];

hint format ["Vous venez de retirer %1 dostar, %2 dostar de taxe ont été retiré.",[_val] call life_fnc_numberText,[_taxes] call life_fnc_numberText];
call life_fnc_atmMenu;
call SOCK_fnc_updateBanque;
[6] call SOCK_fnc_updatePartial;
[CASH,BANK,_val,_taxes,"Retrait"] remoteExecCall ["KIRA_fnc_taxes",2];
