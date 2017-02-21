/*
	File: fn_randomTicket.sqf
	Auteur: J. `Kira` D.
	
	Description:
	tirer un ticket loto au hasard
	
	PARAMETER:
	NONE
	
	RETURN:
	STRING: TICKET

	CALL: 
	call LOTO_fnc_randomTicket
*/
_first = random(floor(99));
_second = random(floor(99));
_third = random(floor(99));
_stringticket = str([_first,_second,_third]);

_stringticket