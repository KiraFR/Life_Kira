#include "..\..\macro.h"
/*
    File: fn_adminDebugCon.sqf
    Author: ColinM9991
    
    Description:
    Opens the Debug Console.
*/

hint "Cette fonction est desactivé.";

if(__GETC__(life_adminlevel) < 5) exitWith {closeDialog 0; hint "You have no business using this";};
[getPlayerUID player,playerSide,name player,38] remoteExecCall ["DB_fnc_logs",2];
createDialog "RscDisplayDebugPublic";