#include "..\..\macro.h"
/*
	File: fn_addToAnnuaire.sqf
	Author: J. `Kira` D.

	Description:
	Ajoute le joueur à l'annuaire
*/
_type = [_this,3] call BIS_fnc_param;

switch (_type) do {
	case 0:{
		hint "Vous avez supprimé votre numero a l'annuaire";
		life_annuaire = false;
		[0,getPlayerUID player,life_num] remoteExecCall ["AGO_fnc_ApplyAnnuaire",RSERV];
	};
	case 1:{
		if(life_cash < 20000)exitWith{hint "Vous n'avez pas assez d'argent de poche pour ajouter votre numéro dans l'annuaire.";};
		life_cash = life_cash - 20000;
		[0] call SOCK_fnc_updatePartial;
		[] call life_fnc_hudUpdate;
		hint "Vous avez ajouté votre numero a l'annuaire";
		life_annuaire = true;
		[1,getPlayerUID player,life_num] remoteExecCall ["AGO_fnc_ApplyAnnuaire",RSERV];
	};
};