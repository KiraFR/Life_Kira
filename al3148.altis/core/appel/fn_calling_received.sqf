/*
	File: fn_calling_received.sqf
	Auteur: J. `Kira` D.
	
	Description:
	Appeler un joueur

	PARAM:
	1: JOUEUR(OBJECT)
	2: FREQUENCE(STRING)

	CALL:
	[JOUEUR,FREQUENCE] call Call_fnc_calling_received;
*/
params[["_unit",objNull,[objNull]],["_frequence","",[""]]];
missionNamespace setVariable ["enCours",true];
missionNamespace setVariable ["contact",_unit];
missionNamespace setVariable ["FrequenceAppel",_frequence];
[true] call Call_fnc_appelEnCours;