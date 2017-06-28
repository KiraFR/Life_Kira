#include "..\..\macro.h"
/*
	File: fn_DeleteAccount.sqf
	Author: R. `KronosD` R.

	Description:
	Lis merde
*/
disableSerialization;
_AccountList = getControl(1600,1601);
_id = call compile format["%1",lnbData[1601,[_this select 0,0]]];

diag_log format["%1",steamid];
_AccountList lnbDeleteRow (_this select 0);
_id = _id select 0;
[steamid,_id] RemoteExecCall ["BQKS_fnc_DeleteAccount",2];
