#include "kira.h"
/*
	File: fn_winners.sqf
	Auteur: J. `Kira` D.
	
	Description:
	
	
	PARAMETRES:
	1: NUMBER
		
	RETURN: 
	NONE

	CALL: 
	[NUMBER] call LOTO_fnc_winners
*/

_moneymoney = param[0];
life_cash = life_cash + _moneymoney;
[0] call SOCK_fnc_updatePartial;
hintFormat("Vous avez gagné %1euros !",_moneymoney);
sysFormat("Vous avez gagné %1euros !",_moneymoney);