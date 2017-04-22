/*
	File: fn_isConnected.sqf
	Auteur: J. `Kira` D.

	Description:
	1. STRING(NUMERO)


	PARAMETRES:

	RETURNS:
	NONE

	CALL:
	[STRING] call KIRA_fnc_isConnected
*/
private["_ret"];
_uid = param[0,"",[""]];
{
	if(_uid = (getPlayerUID _x))exitWith{
		_ret = _x;
	};
}foreach playableUnits;
if(isNil "_ret")exitWith{objNull};
_ret