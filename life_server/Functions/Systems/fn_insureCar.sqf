/*
	File: fn_insureCar.sqf
	Auteur: J. `Kira` D.

	Description:
	assurance

	PARAMETRES:
	1.SCALAR(Rayon)
	2.OBJECT(Player)
	3.ARRAY(Position)

	RETURNS:
	NONE

	CALL:
	[SCALAR,OBJECT,ARRAY] call KIRA_fnc_HCheckNearS
*/

private["_vid","_pid","_query","_unit"];
params[
	["_vid",-1,[0]],
	["_pid","",[""]]
];
if(_vid == -1 OR _pid == "") exitWith{};
_query = format["UPDATE vehicles SET insure='1' WHERE pid='%1' AND id='%2'",_pid,_vid];
[_query,1] call DB_fnc_asyncCall;