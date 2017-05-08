#include "..\..\macro.h"
/*
	File: fn_creatNum.sqf
	Author: J. `Kira` D.

	Description:
	créer un numéro et l'envoi au serveur
*/
private["_num"];
_prefixe = _this select 3;

if(_prefixe == "")exitwith{hint "Problème de préfixe, contactez un Administrateur."};
if(life_cash < 1000) exitWith{hint "Vous n'avez pas assez d'argent de poche pour acheter une carte SIM";}; 
life_cash = life_cash - 1000;
hint "Vous pouvez maintenant envoyer des messages.";
[0] call SOCK_fnc_updatePartial;
[_prefixe,player,getPlayerUID player] remoteExecCall ["KIRA_fnc_phoneNum",RSERV];