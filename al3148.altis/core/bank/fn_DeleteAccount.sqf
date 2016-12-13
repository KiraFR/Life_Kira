/*
	File: fn_DeleteAccount.sqf
	Author: R. `KronosD` R.

	Description:
	Lis merde
*/
_owner = player;
_uid = getPlayerUID _owner;

[_uid] RemoteExecCall ["BQKS_fnc_DeleteAccount",2]