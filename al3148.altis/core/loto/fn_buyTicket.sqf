#include "kira.h"
/*
	File: fn_buyTicket.sqf
	Auteur: J. `Kira` D.
	
	Description:
	Acheter un ticket loto
	
	PARAMETRES:
	NONE
		
	CALL: 
	call LOTO_fnc_buyTicket
*/
private["_first","_second","_third","_stringticket"];
if(!(isNil {player getVariable "ticketLoto"})) exitWith {hint "Vous avez déjà un ticket.";}; // pour la 1ere version
//if(isNil {LOTO getVariable "cagnotte"})then{LOTO setVariable ["cagnotte",0,true];};
//_cagnotte = LOTO getVariable "cagnotte";
_stringticket = call LOTO_fnc_randomTicket;
player setVariable ["ticketLoto",_stringticket,true];
hintFormat("Votre ticket est %1",_stringticket);
sysFormat("Votre ticket est %1",_stringticket);

_cagnotte = LOTO_Total;
_cagnotte = _cagnotte + (PrixTicketLoto*5);
LOTO_Total = LOTO_Total + _cagnotte;
_cagnotte = _cagnotte + (PrixTicketLoto*5);
//LOTO setVariable ["cagnotte",0,true];
publicVariable "LOTO_Total";

life_cash = life_cash - PrixTicketLoto;
[0] call SOCK_fnc_updatePartial;