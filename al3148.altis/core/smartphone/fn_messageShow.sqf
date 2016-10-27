#include "..\..\macro.h"
/*
	File: fn_messageShow.sqf
	Author: J. `Kira` D.
	
	Description:
	Flemme d'expliquer
*/
private["_index","_info","_to"];
_data = _this select 0;
_msg = _data select 2;
disableSerialization;
waitUntil {!isNull findDisplay 3000};
_display = findDisplay 3000;
_cMessageShow = _display displayCtrl 3005;
_cMessageHeader = _display displayCtrl 3002;
_to = life_index_phone;
{
	_num = _x select 1;
	if (_num == life_index_phone) then {
		 _to = format["%1",_x select 0];	
	};
}forEach life_repertoire;

_cMessageHeader ctrlSetText format["%1 ecrit:",_to];
_cMessageShow ctrlSetText format["%1",_msg];