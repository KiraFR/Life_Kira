/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if(!isNil "life_canpay_bail") exitWith {hint localize "STR_NOTF_Bail_Post"};
if(life_atmcash < life_bail_amount) exitWith {hint format[localize "STR_NOTF_Bail_NotEnough",life_bail_amount];};

if (life_nbAcc == 0)then {life_cash = life_cash - life_bail_amount}else {life_atmcash = life_atmcash - life_bail_amount};
if (life_nbAcc && life_cash == 0) exitWith {hint "Vous ne pouvez pas payer votre caution !"};
life_bail_paid = true;
[0,"STR_NOTF_Bail_Bailed",true,[profileName]] RemoteExec ["life_fnc_broadcast",0];