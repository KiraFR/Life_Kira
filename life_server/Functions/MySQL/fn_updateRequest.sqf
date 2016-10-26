/*
	File: fn_updateRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Ain't got time to describe it, READ THE FILE NAME!
*/
private["_uid","_side","_cash","_bank","_licenses","_gear","_name","_query","_thread"];
params[
	["_uid","",[""]],
	["_name","",[""]],
	["_side",sideUnknown,[civilian]],
	["_cash",0,[0]],
	["_bank",5000,[0]],
	["_licenses",[],[[]]],
	["_gear",[],[[]]]
];

//Get to those error checks.
if((_uid == "") OR (_name == "")) exitWith {};

//Parse and setup some data.
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
	_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
	_licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

switch (_side) do {
	case west: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5' WHERE playerid='%6'",_name,_cash,_bank,_gear,_licenses,_uid];};
	case civilian: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%6', arrested='%7' WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear,[_this select 7] call DB_fnc_bool];};
	case independent: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', med_licenses='%4', med_gear='%6' WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear];};
};


_queryResult = [_query,1] call DB_fnc_asyncCall;