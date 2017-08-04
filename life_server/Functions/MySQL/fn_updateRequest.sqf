#include "\life_server\script_macros.hpp"
/*
	File: fn_updateRequest.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Ain't got time to describe it, READ THE FILE NAME!
*/
private["_uid","_side","_cash","_bank","_licenses","_gear","_name","_query","_thread"];
_uid = param[0,"",[""]];
_name = param[1,"",[""]];
_side = param[2,sideUnknown,[civilian]];
_cash = param[3,300,[0]];
_licenses = param[4,[],[[]]];
_gear = param[5,[],[[]]];

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
	case west: {
		_query = format["UPDATE players SET name='%1', cash='%2', cop_gear='%3', cop_licenses='%4' WHERE playerid='%6'",_name,_cash,_gear,_licenses,_uid];
	};
	case civilian: {
		_arrested = [param[6,false,[false]]] call DB_fnc_bool;
		_civPosition = param[7,[],[[]]];
		_alive = [param[8,false,[false]]] call DB_fnc_bool;
		_query = format["UPDATE players SET name='%1', cash='%2', civ_licenses='%3', civ_gear='%5', arrested='%6', civPosition='%7', alive='%8' WHERE playerid='%4'",_name,_cash,_licenses,_uid,_gear,_arrested,_civPosition,_alive];};
	case independent: {
		_query = format["UPDATE players SET name='%1', cash='%2', med_licenses='%3', med_gear='%5' WHERE playerid='%4'",_name,_cash,_licenses,_uid,_gear];
	};
};
[_query,1] call DB_fnc_asyncCall;