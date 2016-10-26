/*
	File: fn_wantedRemove.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes a person from the wanted list.
*/
private["_uid","_index"];
params[["_uid","",[""]]];
if(_uid == "") exitWith {}; //Bad data

_index = [_uid,life_wanted_list] call TON_fnc_index;
if(_index == -1) exitWith {};
life_wanted_list set[_index,-1];
life_wanted_list = life_wanted_list - [-1];

diag_log format["WANTED_LIST = %1", life_wanted_list];
_query = format["UPDATE wanted set list = '%1'", life_wanted_list];
_queryResult = [_query,1] call DB_fnc_asyncCall;