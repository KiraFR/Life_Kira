#include "..\..\macro.h"
/*
	File: fn_CheckRepertoire.sqf
	Author: J. `Kira` D.

	Description:
	Check si le joueur est connecté
*/
private ["_send","_index"];
params ["_owner","_data"];

//Check, vive arma...
if(isNil "_owner") exitWith {diag_log "Fack you arma, probleme fn_CheckRepertoire"};

_send = [];
{
	_info = _x;
	_uidP = _x select 2;
	_index = [_info,"icons\ico_noco.paa"];
	{
		_uid = getPlayerUID _x;
		if(_uidP == _uid) then {_index = [_info,"icons\ico_co.paa"];};
	}forEach PlayableUnits;
	_send pushback _index;
}foreach _data;
diag_log format["fn_CheckRepertoire: %1",_send];
[11,_send] remoteExec ["life_fnc_cellphone",(owner _owner)];