#include "..\..\macro.h"
/*
	File: fn_removecontact.sqf
	Author: J. `Kira` D.
	
	Description:
	supprime un contact de la liste de contact puis envoi dans le DB.
*/

_to = life_index_phone;
{
	_num = _x select 1;
	_id = _x select 3;
	if ((_num == (_to select 0)) AND (_id == (_to select 1))) then {
		hint format ["Vous avez supprime: %1 - (%2)",_x select 0,_x select 1];
		life_repertoire = life_repertoire - [_x];
	};
}forEach life_repertoire;

[_to select 1] remoteExecCall ["AGO_fnc_removeContact",RSERV];
[10] spawn life_fnc_cellphone;
ctrlEnable[3020,true];