/*
	File: fn_DeleteAccount.sqf
	Author: R. `KronosD` R.

	Description:
	Lis merde
*/
disableSerialization;
_display = findDisplay 1600;
_AccountList = _display displayCtrl 1601;
_uid = getPlayerUID player;
_id = call compile format["%1",lnbData[1601,[_this select 0,0]]];

diag_log format["%1",_id];
_AccountList lnbDeleteRow (_this select 0);
_id = _id select 0;
[_uid,_id] RemoteExecCall ["BQKS_fnc_DeleteAccount",2];