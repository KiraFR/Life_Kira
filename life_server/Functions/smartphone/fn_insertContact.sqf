#include "..\..\macro.h"
/*
	File: fn_insertcontact.sqf
	Author: J. `Kira` D.

	Description:
	Ajoute seulement le contact dans la db
*/
params[
	"_num",
	"_pseudo",
	"_pidOwner",
	["_owner",objNull,[objNull]] // celui qui reçoit le numero
];

//Check, vive arma...
if(isNil "_owner") exitWith {};
if(_pidOwner == "") exitWith {};
if(_pseudo == "") exitWith {};

//1ere phase
//Recupère le numero pour savoir si il existe
_recup = format["SELECT pid_owner FROM phonenumber WHERE numero ='%1'",_num];
_ResultRecup = [_recup,2] call DB_fnc_asyncCall;
if(count _ResultRecup == 0)then{_ResultRecup = "0"}else{_ResultRecup = _ResultRecup select 0;};
diag_log format ["fn_insertcontact: %1",_ResultRecup];

_insertCon = format["INSERT INTO numberrepertoire (pid_owner, pid_contact, num_contact, nam_contact) VALUES('%1', '%2','%3','""%4""')",_pidOwner,_ResultRecup,_num,_pseudo];
[_insertCon,1] call DB_fnc_asyncCall;

_recupID = format["SELECT MAX(LAST_INSERT_ID(ID)) as last_id FROM numberrepertoire WHERE pid_owner='%1'",_pidOwner];
_ResultRecupID = [_recupID,2] call DB_fnc_asyncCall;

[4,[_pseudo,_num,_ResultRecup,_ResultRecupID]] remoteExec ["life_fnc_cellphone",(owner _owner)];