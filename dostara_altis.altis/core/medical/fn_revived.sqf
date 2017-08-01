#include "..\..\macro.h"
/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_dir"];

_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true];
[life_corpse] remoteExecCall ["life_fnc_corpse",0];
_dir = getDir life_corpse;


closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

[player, false] call ACE_captives_fnc_setSurrendered;
player setVariable ["ACE_captives_isEscorting", false, true];
[player, false] call ACE_captives_fnc_setHandcuffed;
player setDamage 0.95;
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,true];
life_corpse setVariable["name",nil,true];
[life_corpse] remoteExecCall ["life_fnc_corpse",RANY];
hideBody life_corpse;

player setVariable["Revive",nil,true];
player setVariable["name",nil,true];
player setVariable["Reviving",nil,true];
[] call life_fnc_hudUpdate;
