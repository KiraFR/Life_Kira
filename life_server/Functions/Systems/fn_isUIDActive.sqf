#include "..\..\macro.h"
/*
	File: fn_isUIDActive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sees if the UID passed to it is in the server.
	
	Returns:
	True if there was a match, false if not in server.
*/
private["_uid","_ret"];
params[["_uid","",[""]]];
if(_uid == "") exitWith {false}; //Bad UID
_ret = false;
{
	if(getPlayerUID _x == _uid) exitWith {_ret = true;};
} forEach playableUnits;

_ret;