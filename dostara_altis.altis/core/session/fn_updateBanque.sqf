/*
	File: fn_updateBanque.sqf
	Author: R. `KronosD` R.
*/

private["_Info","_PlayerUID","_tab","_index"];

_PlayerUID = getPlayerUID player;
_Info = [];

_ac = missionNamespace getVariable ["AccountBanque",[]];

{
	_tab = _x;
	_dft = _x select 3;
	if(_dft)exitWith{
		_tab set [2,life_atmCash];
		_index = _forEachIndex;
	};
}foreach _ac;
_ac set[_index,_tab];
missionNamespace getVariable ["AccountBanque",_ac];
_of = missionNamespace getVariable ["AccountBanqueOffshore",[]];
_ent = missionNamespace setVariable ["AccountBanqueEntreprise",[]];
_Info pushBack _ac;
_Info pushBack _of;
_Info pushBack _ent;
//_Info pushBack missionNamespace setVariable ["AccountBanqueOrga",[]];

[_Info,_PlayerUID] remoteExecCall ["DB_fnc_SyncAccountDB",2];