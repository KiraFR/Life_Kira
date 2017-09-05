/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_crew = crew cursorTarget;

{
	if (_x getVariable "ACE_Captives_isHandcuffed")then {
		[_x] call ACE_captives_fnc_vehicleCaptiveMoveOut;
	};
} forEach _crew;