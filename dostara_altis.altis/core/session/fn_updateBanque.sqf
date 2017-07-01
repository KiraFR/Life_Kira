/*
	File: fn_updateBanque.sqf
	Author: R. `KronosD` R.
*/

private["_Info","_PlayerUID","_tab","_index"];

_PlayerUID = getPlayerUID player;

_Info = missionNamespace getVariable ["AccountBanque",[]];
{
	_tab = _x;
	_dft = _x select 3;
	if(_dft)exitWith{
		_tab set [2,life_atmCash];
		_index = _forEachIndex;
	};
}foreach _Info;
_Info set[_index,_tab];
missionNamespace getVariable ["AccountBanque",_Info];
//_Info pushBack missionNamespace setVariable ["AccountBanqueOrga",[]];

[_Info,_PlayerUID] remoteExecCall ["DB_fnc_SyncAccountDB",2];