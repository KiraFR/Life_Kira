#include "..\..\macro.h"
/*
	File: fn_accountgest.sqf
	Modifié par: R. `KronosD` R.

	Description:
	Kira: plein de Listes + modification dialog, j'ai pris celui de l'allemand et l'a bien modifié
*/
if (life_nbAcc == 0) exitWith {hint "Vous n'avez pas de compte en banque, veuillez vous deplacer a une banque pour en ouvrir un.";closeDialog 0;};
disableSerialization;
waitUntil {!isNull findDisplay 1600};
_MessageHeader = getControl(1600,1605);
lbClear 1605;
lbClear 1601;
ctrlEnable[1603,false];
ctrlEnable[1604,false];
_MessageHeader lnbAddRow ["Nom","Numero","Solde","Default"];

[getPlayerUID player, player] remoteExecCall ["BQKS_fnc_GetAccount",2];
