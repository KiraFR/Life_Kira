#include "..\..\macro.h"
/*
	File: fn_updateBanque.sqf
	Author: R. `KronosD` R.
	Edited by : J. `Kira` D.
*/

private["_Info","_tab","_save","_num"];
diag_log "fn_updateBanque 1";
_Info = missionNamespace getVariable ["AccountBanque",[]];
diag_log format["fn_updateBanque 2 : %1",_Info];
[_Info] remoteExecCall ["DB_fnc_SyncAccountDB",2];
