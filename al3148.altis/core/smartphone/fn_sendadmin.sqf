#include "..\..\macro.h"
/*
	File: fn_cellphone.sqf
	Modifié par: J. `Kira` D.
	
	Description:
	Kira: plein de Listes + modification dialog, j'ai pris celui de l'allemand et l'a bien modifié
*/
private["_Cdisplay","_cPlayerList"];
if((isNil "life_adminlevel") OR (__GETC__(life_adminlevel) < 1)) exitWith {hint "Vous n'êtes pas admin !";closeDialog 0;};
_type = [_this,0,0] call BIS_fnc_param;
disableSerialization;
waitUntil {!isNull findDisplay 9000};
_Cdisplay = findDisplay 9000;
_cPlayerList = _Cdisplay displayCtrl 9008;
lbClear _cPlayerList;
{
	if(alive _x && _x != player) then {
		_cPlayerList lbAdd format["%1",_x getVariable["realname", name _x]];
		_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
	};
} forEach playableUnits;
lbSort [_cPlayerList, "ASC"];
lbSetCurSel [9008,0];