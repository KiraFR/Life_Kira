#include "\life_server\script_macros.hpp"
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
	["_cash",10000,[0]],
	["_licenses",[],[[]]],
	["_gear",[],[[]]],
	["_civPosition","",[[]]]
];

//Get to those error checks.
if((_uid == "") OR (_name == "")) exitWith {};

//Parse and setup some data.
_cash = [_cash] call DB_fnc_numberSafe;

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
	_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
	_licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

switch (_side) do {
	case west: {_query = format["UPDATE players SET name='%1', cash='%2', cop_gear='%3', cop_licenses='%4' WHERE playerid='%5'",_name,_cash,_gear,_licenses,_uid];};
	case civilian: {
									_arrested = [_this select 6];
									_civPosition = [_this select 7] call DB_fnc_mresArray;
									_alive = [_this select 8] call DB_fnc_bool;
									_query = format["UPDATE players SET name='%1', cash='%2', civ_licenses='%3', civ_gear='%5', arrested='%6', civPosition='%7', alive='%8' WHERE playerid='%4'",_name,_cash,_licenses,_uid,_gear,_arrested,_civPosition,_alive];};
	case independent: {_query = format["UPDATE players SET name='%1', cash='%2', med_licenses='%3', med_gear='%5' WHERE playerid='%4'",_name,_cash,_licenses,_uid,_gear];};
};


_queryResult = [_query,1] call DB_fnc_asyncCall;
