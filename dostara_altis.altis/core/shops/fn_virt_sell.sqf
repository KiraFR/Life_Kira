#include <macro.h> 
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name","_val"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,__GETC__(sell_array)] call TON_fnc_index; 
if(_index == -1) exitWith {};
_var = [_type,0] call life_fnc_varHandle;

_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

_sender = player;
[_var,_amount,false,_sender] remoteExecCall ["bourse_fnc_vente",RSERV];