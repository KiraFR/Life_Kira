#include "kira.h"
/*
	File: fn_takeTicket.sqf
	Auteur: J. `Kira` D.
	
	Description:
	Acheter un ticket loto
	
	PARAMETRES:
	NONE
		
	CALL: 
	call LOTO_fnc_takeTicket
*/
private["_stringticket","_listticket","_1","_2","_3","_count3"];
//if(isNil {LOTO getVariable "cagnotte";}) exitWith {}; //débile
_stringticket = call LOTO_fnc_randomTicket;
_listTicketWin = call compile format["%1",_stringticket];
_1 = [];
_2 = [];
_3 = [];

{
	_ticketPlayer = _x getVariable "ticketLoto";
	if(!(isNil "_ticketPlayer")) then {
		_listTicketPlayer = call compile format["%1",_ticketPlayer];
		_listTicketPlayer = _listTicketPlayer - _listTicketWin;
		_countListTicket = count _listTicketPlayer;
		switch(_countListTicket) do {
			case 0:{_3 pushBack _x;};
			case 1:{_2 pushBack _x;};
			case 2:{_1 pushBack _x;};
		};
	};
}foreach allUnits;


//_total = LOTO getVariable "cagnotte";
{
	[floor(LOTO_Total*(2/100))] remoteExecCall ["LOTO_fnc_winners",_x];
	LOTO_Total = LOTO_Total - floor(LOTO_Total*(2/100));
	//_total = _total - _total*(2/100);
}foreach _1;

publicVariable "LOTO_Total"; 
//LOTO setVariable ["cagnotte",_total,true];
{
	[floor(LOTO_Total*(8/100))] remoteExecCall ["LOTO_fnc_winners",_x];
	LOTO_Total = LOTO_Total - floor(LOTO_Total*(8/100));
	//_total = _total - _total*(8/100);
}foreach _2;

publicVariable "LOTO_Total";
//LOTO setVariable ["cagnotte",_total,true];
_count3 = count _3; // normalement egale a 1 sinon WTF ARMA
{
	[floor(LOTO_Total/_count3)] remoteExecCall ["LOTO_fnc_winners",_x];
}foreach _3;// mais non mais -_-...
publicVariable "LOTO_Total";
//LOTO setVariable ["cagnotte",_total,true];