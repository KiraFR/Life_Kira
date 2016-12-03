#include "..\..\macro.h"
/*
	File: fn_SetAccountDefault.sqf
	Crée par: R. `KronosD` R.
	
	Description:
	Mettre un compte en default 
*/

private["_Default","_uid","_deja"];

_Default = (__GETC__(life_dflt) == 0);
_deja = if (__GETC__(life_dflt) == 1)then {hint "Vous avez deja un compte en option default , il sera remplacé pas celui ci"};
_owner = player;
_uid = getPlayerUID _owner;
_id = bq_id;


if (_Default = 0)then {[_uid,_owner,_id] remoteExecCall ["BQKS_fnc_SetDefaultAccount",2];}else { if (_deja)then{[_uid,_owner,_id] remoteExecCall ["BQKS_fnc_SetDefaultAccount",2]};};
