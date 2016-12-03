#include "..\..\macro.h"
/*
	File: fn_SetDefaultAccount.sqf
	Author: R. `KronosD` R.

	Description:
	Edit le default
*/

_edit1 = ["UPDATE banque SET dflt='0' WHERE playerid='%1'",_uid];
[_edit1,1] call DB_fnc_asyncCall;

_edit2 = ["UPDATE banque SET dflt='1'WHERE playerid='%1',id='%2'",_uid,_id];
[_edit2,1] call DB_fnc_asyncCall;
