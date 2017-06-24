#include "..\macro.h"
/*
	File: initPlayerLocal.sqf

	Description:
	Starts the initialization of the player.
*/
if(!hasInterface) exitWith {}; //This is a headless client, he doesn't need to do anything but keep being headless..

CONSTANT(BIS_fnc_endMission,BIS_fnc_endMission);
[] execVM "core\init.sqf";

//Execute JIP code.
if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};
