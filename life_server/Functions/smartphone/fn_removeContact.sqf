/*
	File: fn_removeContact.sqf
	Author: J. `Kira` D.

	Description:
	enlever un joueur d'un repertoire
*/
params[
	"_id"
];
_remove = format ["DELETE FROM numberrepertoire WHERE id='%1'",_id];
[_remove,1] call DB_fnc_asyncCall;