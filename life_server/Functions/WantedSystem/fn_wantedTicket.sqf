/*
	File: fn_wantedTicket.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks the price of the ticket against the bounty, if => then bounty remove them from the wanted list.
*/
private["_price","_uid","_ind","_entry"];
params[
	["_uid","",[""]],
	["_price",0,[0]]
];
if(_uid == "" OR _price == 0) exitWith {};

_ind = [_uid,life_wanted_list] call TON_fnc_index;
if(_ind == -1) exitWith {};
life_wanted_list set[_ind,-1];
life_wanted_list = life_wanted_list - [-1];

diag_log format["WANTED_LIST = %1", life_wanted_list];
_query = format["UPDATE wanted set list = '%1'", life_wanted_list];
_queryResult = [_query,1] call DB_fnc_asyncCall;