#include "..\..\macro.h"
/*
	File: fn_callP.sqf
	Modifié par: J. `Kira` D.
	
	Description:
	Appeler un joueur
*/
private["_display","_units","_type"];
disableSerialization;
waitUntil {!isNull findDisplay 3250};
_display = findDisplay 3250;
_units = _display displayCtrl 3251;
lbClear _units;
{

	if(alive _x && _x != player) then
	{
		_units lbAdd format["%1",_x getVariable["realname",name _x]];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} forEach playableUnits;
lbSort _units;
lbSetCurSel [3251,0];