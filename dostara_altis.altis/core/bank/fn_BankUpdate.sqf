#include "..\..\macro.h"
/*
	File: fn_BankUpdate.sqf
	Author: R. `KronosD` R.

	Description:
	Lol tu comprend rien
*/
private _bank = missionNamespace getVariable "AccountBanque";
_bank pushBack _this;
missionNamespace setVariable ["AccountBanque",_bank];
