#include "..\..\macro.h"
/*
	File: fn_editcontactApply.sqf
	Author: J. `Kira` D.
	
	Description:
	Flemme d'expliquer
*/
lbclear 3003;
_pseudo = ctrlText 31203;
{
	_num = _x select 1;
	_id = _x select 3;
	if((_num == life_index_phone select 0) AND (_id == life_index_phone select 1)) then{
		life_repertoire = life_repertoire - [_x];
		life_repertoire = life_repertoire + [[_pseudo,_x select 1,_x select 2,_x select 3]];
	};
}forEach life_repertoire;
[10] spawn life_fnc_cellphone;
[player,_pseudo,life_index_phone select 1] remoteExecCall ["AGO_fnc_editcontact",RSERV];
closeDialog 31200;