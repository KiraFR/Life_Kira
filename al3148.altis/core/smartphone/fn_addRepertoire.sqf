#include "..\..\macro.h"
/*
	File: fn_addRepertoire.sqf
	Author: J. `Kira` D.
	
	Description:
	Flemme d'expliquer
*/
[] spawn {
	_result = ["Êtes-vous sur de vouloir ajouter cette personne dans votre repertoire ?", "Oui", true, true] call BIS_fnc_GUImessage;
	if(_result) then {
		_deja=false;
		_num = life_index_phone select 0;
		{
			
			_numrep = _x select 1;
			if (_num == _numrep) exitwith{_deja=true;};
		}foreach life_repertoire;
		if(!_deja)then{
			[life_index_phone,getPlayerUID player,player] remoteExecCall ["AGO_fnc_insertRepertoire",RSERV];
		}else{
			hint "Ce numéro existe déjà dans votre repertoire";
			systemChat "Ce numero existe deja dans votre repertoire";
		};
	}else{
		hint "Ajout annulé...";
	};
};