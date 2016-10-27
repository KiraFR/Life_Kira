#include "..\..\macro.h"
/*
	File: fn_addcontact.sqf
	Author: J. `Kira` D.
	
	Description:
	Flemme d'expliquer
*/
_deja=false;
_pseudo = ctrlText 31103;
_num = ctrlText 31104;
lbclear 3003;
//check si vide
if(_num == "" OR _pseudo == "") exitWith {hint "Vous avez oublier de mettre un nom ou un numéro"};

_countstr = toArray _num;
if(count _countstr != 6) exitWith {hint "Ce n'est pas un numéro à 6 chiffre";};
{
	_numrep = _x select 1;
	if (_num == _numrep) exitwith{_deja=true;};
}forEach life_repertoire;
if(!_deja)then{
	hint format["Vous ajoutez %1, son numero est %2",_pseudo,_num];
	[_num,_pseudo,getPlayerUID player,player] remoteExecCall ["AGO_fnc_insertContact",RSERV];
	closeDialog 31100;
}else{
	hint "Ce numéro existe déjà dans votre repertoire";
	systemChat "Ce numero existe deja dans votre repertoire";
	closeDialog 31100;
};

