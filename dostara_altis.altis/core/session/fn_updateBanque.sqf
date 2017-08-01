#include "..\..\macro.h"
/*
	File: fn_updateBanque.sqf
	Author: R. `KronosD` R.
	Edited by : J. `Kira` D.
*/

private["_Info","_tab","_save","_num"];
_Info = missionNamespace getVariable ["AccountBanque",[]];
[_Info,getPlayerUID player] remoteExecCall ["DB_fnc_SyncAccountDB",2];
