#include "..\..\macro.h"
/*
	File: fn_editcontact.sqf
	Author: J. `Kira` D.
	
	Description:
	Flemme d'expliquer
*/
private["_index","_data"];
disableSerialization;

_display2 = findDisplay 31200;
_cMessageHeader = _display2 displayCtrl 31201;
{
	_num = _x select 1;
	if(_num == life_index_phone select 0) then{
		_index = format["%1 (%2)",_x select 0,_x select 1];
	};
}forEach life_repertoire;
_cMessageHeader ctrlSetText format["Edit Contact: %1",_index];