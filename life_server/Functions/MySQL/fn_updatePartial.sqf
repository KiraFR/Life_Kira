#include "\life_server\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Takes partial data of a player and updates it, this is meant to be
	less network intensive towards data flowing through it for updates.
*/
private["_uid","_side","_value","_mode","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_mode = [_this,3,-1,[0]] call BIS_fnc_param;

if(_uid == "" OR _side == sideUnknown) exitWith {}; //Bad.
_query = "";

switch(_mode) do {
	case 0: {
		_value = [_this,2,0,[0]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_numberSafe;
		_query = format["UPDATE players SET cash='%1' WHERE playerid='%2'",_value,_uid];
	};

	case 1: {
		_value = [_this,2,0,[0]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_numberSafe;
		_query = format["UPDATE banque SET bankacc='%1' WHERE playerid='%2',dflt='1'",_value,_uid];
	};

	case 2: {
		_value = [_this,2,[],[[]]] call BIS_fnc_param;
		//Does something license related but I can't remember I only know it's important?
		for "_i" from 0 to count(_value)-1 do {
			_bool = [(_value select _i) select 1] call DB_fnc_bool;
			_value set[_i,[(_value select _i) select 0,_bool]];
		};
		switch(_side) do {
			case west: {_query = format["UPDATE players SET cop_licenses='%1' WHERE playerid='%2'",_value,_uid];};
			case civilian: {_query = format["UPDATE players SET civ_licenses='%1' WHERE playerid='%2'",_value,_uid];};
			case independent: {_query = format["UPDATE players SET med_licenses='%1' WHERE playerid='%2'",_value,_uid];};
		};
	};

	case 3: {
		_value = [_this,2,[],[[]]] call BIS_fnc_param;
		switch(_side) do {
			case west: {_query = format["UPDATE players SET cop_gear='%1' WHERE playerid='%2'",_value,_uid];};
			case civilian: {_query = format["UPDATE players SET civ_gear='%1' WHERE playerid='%2'",_value,_uid];};
			case independent: {_query = format["UPDATE players SET med_gear='%1' WHERE playerid='%2'",_value,_uid];};
		};
	};

	case 4: {
		_value = [_this,2,false,[true]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_bool;
		_query = format["UPDATE players SET alive='%1' WHERE playerid='%2'",_value,_uid];
	};

	case 5: {
		_value = [_this,2,false,[true]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_bool;
		_query = format["UPDATE players SET arrested='%1' WHERE playerid='%2'",_value,_uid];
	};

	case 6: {
		_value1 = [_this,2,0,[0]] call BIS_fnc_param;
		_value2 = [_this,4,0,[0]] call BIS_fnc_param;
		_value1 = [_value1] call DB_fnc_numberSafe;
		_value2 = [_value2] call DB_fnc_numberSafe;
		_query = format["UPDATE banque SET bankacc='%1' WHERE playerid='%2',dflt='1'",_value2,_uid];
		_query = format["UPDATE players SET cash='%1' WHERE playerid='%2'",_value1,_uid];
	};

	case 7: {
		_array = [_this,2,[],[[]]] call BIS_fnc_param;
		[_uid,_side,_array,0] call TON_fnc_keyManagement;
	};

	case 8: {
		_value1 = [_this,2,0,[0]] call BIS_fnc_param;
		_value2 = [_this,4,0,[0]] call BIS_fnc_param;
		_value1 = [_value1] call DB_fnc_numberSafe;
		_value2 = [_value2] call DB_fnc_numberSafe;
		_query = format["UPDATE permis SET Ppermis='%1', nbrPermis='%2' WHERE uid='%3'",_value2,_value1,_uid];
	};

	case 9: {
		_value1 = [_this,2,0,[0]] call BIS_fnc_param;
		_value1 = [_value1] call DB_fnc_numberSafe;
		_query = format["UPDATE permis SET Ppermis='%1' WHERE uid='%2'",_value1,_uid];
	};
	case 10: {
		_value1 = [_this,2,false,[false]] call BIS_fnc_param;
		_value2 = [_this,4,false,[false]] call BIS_fnc_param;
		if(_value2)then{
			_value2 = 60;
		}else{
			_value2 = 0;
		};
		_value2 = [_value2] call DB_fnc_numberSafe;
		_value1 = [_value1] call DB_fnc_bool;
		_query = format["UPDATE permis SET permisDispo='%1',waitTime='%2' WHERE uid='%3'",_value1,_value2,_uid];
	};
	case 11: {
		_value1 = [_this,2,0,[0]] call BIS_fnc_param;
		_value1 = [_value1] call DB_fnc_numberSafe;
		_query = format["UPDATE permis SET waitTime='%1' WHERE uid='%2'",_value1,_uid];
	};
	case 12: {  
		_value1 = [_this,2,[]] call BIS_fnc_param;
		_value2 = [_this,4,false,[true]] call BIS_fnc_param;
		_value2 = [_value2] call DB_fnc_bool;
		_query = format["UPDATE players SET civPosition='%1', alive='%2' WHERE playerid='%3'",_value1,_value2,_uid];
	};
};

if(_query == "") exitWith {};

[_query,1] call DB_fnc_asyncCall;
