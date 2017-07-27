#include "..\..\macro.h"
/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pays the ticket.
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(CASH < life_ticket_val) exitWith
{
	if(BANK < life_ticket_val) exitWith
	{
		hint localize "STR_Cop_Ticket_NotEnough";
		[1,"STR_Cop_Ticket_NotEnoughNOTF",true,[profileName]] RemoteExec ["life_fnc_broadcast",life_ticket_cop];
		closeDialog 0;
	};
	hint format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call life_fnc_numberText];
	BANK = BANK - life_ticket_val;
	call life_fnc_refreshAC;
	call SOCK_fnc_updateBanque;
	life_ticket_paid = true;
	[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call life_fnc_numberText]] RemoteExec ["life_fnc_broadcast",west];
	[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] RemoteExec ["life_fnc_broadcast",life_ticket_cop];
	[life_ticket_val,player,life_ticket_cop] RemoteExecCall ["life_fnc_ticketPaid",life_ticket_cop];
	closeDialog 0;
};

CASH = CASH - life_ticket_val;
life_ticket_paid = true;

[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call life_fnc_numberText]] RemoteExec ["life_fnc_broadcast",west];
closeDialog 0;
[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] RemoteExec ["life_fnc_broadcast",life_ticket_cop];
[life_ticket_val,player,life_ticket_cop] RemoteExecCall ["life_fnc_ticketPaid",life_ticket_cop];
