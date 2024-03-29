#include "\life_server\script_macros.hpp"
/*
	File: fn_insertRequest.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something with inserting... Don't have time for
	descriptions... Need to write it...
*/
private["_uid","_name","_side","_money","_licenses","_handler","_thread","_queryResult","_query","_alias"];
params[
	["_uid","",[""]],
	["_name","",[""]],
	["_money",300,[0]],
	["_returnToSender",ObjNull,[ObjNull]]
];

//Error checks
if((_uid == "") OR (_name == "")) exitWith {systemChat "Bad UID or name";}; //Let the client be 'lost' in 'transaction'
if(isNull _returnToSender) exitWith {systemChat "ReturnToSender is Null!";}; //No one to send this to!

_query = format["SELECT playerid, name FROM players WHERE playerid='%1'",_uid];

_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;
if(debug) then {
	diag_log "------------- Insert Query Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
	diag_log format["Result: %1",_queryResult];
	diag_log "------------------------------------------------";
};
//Double check to make sure the client isn't in the database...
if(typeName _queryResult == "STRING") exitWith {[] remoteExecCall ["SOCK_fnc_dataQuery",(owner _returnToSender)]}; //There was an entry!
if(count _queryResult != 0) exitWith {[] remoteExecCall ["SOCK_fnc_dataQuery",(owner _returnToSender)]};

//Clense and prepare some information.
_alias = [_name];
_money = [_money] call DB_fnc_numberSafe;

//Prepare the query statement..
_query = format["INSERT INTO players (playerid, name, cash, aliases, cop_licenses, med_licenses, civ_licenses, civ_gear, cop_gear, med_gear, civPosition) VALUES('%1', '%2', '%3', '%4','[]','[]','[]','[]','[]','[]','[]')",
	_uid,
	_name,
	_money,
	_alias
];

[_query,1] call DB_fnc_asyncCall;

_query = format["INSERT INTO permis (uid) VALUES('%1')",_uid];
[_query,1] call DB_fnc_asyncCall;

[] remoteExecCall ["SOCK_fnc_dataQuery",(owner _returnToSender)];
