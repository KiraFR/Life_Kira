#include "..\..\macro.h"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Verifies that the ticket was paid.
*/
params [
    ["_value",5,[0]],
    ["_unit",objNull,[objNull]],
    ["_cop",objNull,[objNull]]
];
if (isNull _unit || {!(_unit isEqualTo life_ticket_unit)}) exitWith {}; //NO
if (isNull _cop || {!(_cop isEqualTo player)}) exitWith {}; //Double NO

BANK = BANK + _value;
call life_fnc_refreshAC;
call SOCK_fnc_updateBanque;
