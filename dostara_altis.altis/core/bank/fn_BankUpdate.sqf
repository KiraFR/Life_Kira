#include "..\..\macro.h"
/*
	File: fn_BankUpdate.sqf
	Author: R. `KronosD` R.

	Description:
	Lol tu comprend rien
*/
_Bank = missionNamespace getVariable "AccountBanque";
_Bank pushBack _this;
missionNamespace setVariable ["AccountBanque",_Bank];
