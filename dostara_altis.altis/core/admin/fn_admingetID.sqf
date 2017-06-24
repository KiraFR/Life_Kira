#include "..\..\macro.h"

private "_unit";
_unit = getSelData(2902);
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

[_unit,player] RemoteExecCall ["TON_fnc_getID",0];
