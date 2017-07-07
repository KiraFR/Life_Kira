#include "..\..\macro.h"
/*
	File: fn_updateBanque.sqf
	Author: R. `KronosD` R.
*/

private["_Info","_PlayerUID","_tab","_save","_num"];

_PlayerUID = getPlayerUID player;
_Info = missionNamespace getVariable ["AccountBanque",[]];
{
	_tab = _x;
	_dft = _x select 3;
	if(_dft)exitWith{
		_num = _x select 1;
		_save = BANK;
	};
}forEach _Info;
[_num,_save] remoteExecCall ["DB_fnc_SyncAccountDB",2];
