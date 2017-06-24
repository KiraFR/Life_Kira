#include "..\..\macro.h"
/*
	File: fn_BankUpdate.sqf
	Author: R. `KronosD` R.

	Description:
	Lol tu comprend rien 
*/

[getPlayerUID player, player] remoteExecCall ["BQKS_fnc_GetAccount",2];

_CBName = _Bank select 1;
_CBID = _Bank select 2;
_CBSolde = _Bank select 5;
_Bank = [_CBName,_CBID,_CBSolde,_Bank select 6];

missionNamespace setVariable ["AccountBanque",[_Bank]];
