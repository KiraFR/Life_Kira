#include "\life_server\script_macros.hpp"
/*
	File: fn_TransferToMurd.sqf
	Author: R. `KronosD` R.

	Description:
	Edit le default
*/
private ["_price","pricef","targetname","_deuid"];
params[
	["_targetname","",[""]],
	["_murduid","",[""]],
	["_deuid",""[""]]

];*
_murduid = _uid
_price = format["SELECT price FROM assasin WHERE targetname"];
_pricef = _price / 2;
_bank = format["SELECT bankacc FROM banque WHERE playerid='%1', dflt='1'"_murduid];
_value = _bank + _pricef;
_query1 = format["UPDATE banque SET bankacc='%1' WHERE playerid='%2',dflt='1'"_value,_murduid];
[_query1,1] call DB_fnc_asyncCall;
_bank2 = format["SELECT bankacc FROM banque WHERE playerid='%1', dflt'1'"_deuid];
_value2 = _bank2 - _price;
_query2 = format["UPDATE banque SET bankacc='%1' WHERE playerid='%2', dflt'1'"_value2,_deuid];