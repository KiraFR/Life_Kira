#include "..\..\macro.h"
/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
params[
	["_medic","Unknown Medic",[""]],
	["_medicP",objNull,[objNull]]
];


_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[life_corpse] RemoteExecCall ["life_fnc_corpse",nil];
_dir = getDir life_corpse;

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

call life_fnc_refreshAC;
call SOCK_fnc_updateBanque;

[player, false] call ACE_captives_fnc_setSurrendered;
player setVariable ["ACE_captives_isEscorting", false, true];
[player, false] call ACE_captives_fnc_setHandcuffed;


//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
[life_corpse] RemoteExecCall ["life_fnc_corpse",0];
hideBody life_corpse;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
[] call life_fnc_hudUpdate; //Request update of hud.
