/*
	File: fn_silentSync.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receives the silent sync and sends the query.
*/
private["_uid","_side","_cash","_bank","_gear","_query","_thread"];
params[
	["_uid","",[""]],
	["_side",civilian,[sideUnknown]],
	["_cash",0,[0]],
	["_bank",2500,[0]],
	["_gear",[],[[]]]
];
if(_uid == "") exitWith {};

//Is the headless client active? If so let him take over.
if(!isNil "hc_1" && {life_HC_isActive}) exitWith {
	private["_packet"];
	_packet = _this;

	_packet remoteExecCall ["HC_fnc_silentSync",(owner hc_1)];
};

_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

switch(_side) do
{
	case west: {
		_query = format["UPDATE players SET cash='%1', bankacc='%2', cop_gear='%3' WHERE playerid='%4'",_cash,_bank,_gear,_uid];
	};
	
	case civilian: {
		_query = format["UPDATE players SET cash='%1', bankacc='%2', civ_gear='%3' WHERE playerid='%4'",_cash,_bank,_gear,_uid];
	};
	
	case independent: {
		_query = format["UPDATE players SET cash='%1', bankacc='%2' WHERE playerid='%3'",_cash,_bank,_uid];
	};
};

//Execute SQL Statement

_thread = [_query,false] spawn DB_fnc_asyncCall;