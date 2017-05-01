/*
	File: fn_updateBanque.sqf
	Author: R. `KronosD` R.
*/

private["_Info","_PlayerUID"];

_PlayerUID = getPlayerUID player;
_Info = missionNamespace getVariable "AccountBanque";

[_Info,_PlayerUID] remoteExecCall ["BQKS_fnc_SyncAccountDB",2];
