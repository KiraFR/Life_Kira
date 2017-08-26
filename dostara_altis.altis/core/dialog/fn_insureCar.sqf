#include "..\..\macro.h"
/*
 File: fn_insureCar.sqf
 Author: Guit0x "Lintox"
 Description:
 Insure a vehicle from the garage.
*/
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_multiplier","_price","_purchasePrice","_insurancePrice"];
disableSerialization;
if ((lbCurSel 2802) isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue [ 2802 , (lbCurSel 2802 )];
_pid = getPlayerUID player;
_unit = player;
if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if ((time - life_action_delay) < 1.5) exitWith {hint localize "STR_NOTF_ActionDelay";};

_price = [_vehicleLife] call life_fnc_priceVehBuy;

_insurancePrice = _price * 0.2;
if(!(_insurancePrice isEqualType 0) || _insurancePrice < 1) then {_insurancePrice = 500};
if(BANK < _insurancePrice) exitWith {hint format[(localize "STR_GNOTF_NotEnoughMoney"),[_insurancePrice] call life_fnc_numberText];};

 [_vid,_pid,_insurancePrice,player,life_garage_type] remoteExecCall ["TON_fnc_insureCar",RSERV];

hint localize "STR_InsuranceApply";
BANK = BANK - _insurancePrice;
call life_fnc_refreshAC;
call SOCK_fnc_updateBanque;
life_action_delay = time;
closeDialog 0;
