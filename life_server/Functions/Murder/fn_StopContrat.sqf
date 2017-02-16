#include "..\..\macro.h"
/*
	File: fn_StopContrat.sqf
	Author: R. `KronosD` R..

	Description:
	Lit merde
*/
params[
	"_uid",
	"_name"
];
_remove = format ["DELETE FROM assasin WHERE deuid='%1',targetname='%2'",_uid,_name];
[_remove,1] call DB_fnc_asyncCall;