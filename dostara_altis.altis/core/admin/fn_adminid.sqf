#include "..\macro.h"
/*
	File: fn_adminid.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Output information received to admin menu.
*/
params ["_ret"];
disableSerialization;
private _text = getControl (2900,2903);

_text ctrlSetStructuredText parseText format["ID: %1",_ret];
