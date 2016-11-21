#include "..\..\macro.h"
/*
	File: fn_insertRepertoire.sqf
	Author: J. `Kira` D.

	Description:
	Ajoute seulement le contact dans le repertoire
*/
private["_pidTo","_pseudo"];
params[
	"_num",
	"_pidOwner",
	["_owner",objNull,[objNull]] // celui qui reçoit le numero
];
//Check, vive arma...
if(isNil "_owner") exitWith {};
if(_pidOwner == "") exitWith {};
if(_pseudo == "") exitWith {};

//1ere phase
//Recupère le numero pour savoir si il existe
_recup = format["SELECT pid_owner,nom FROM phonenumber WHERE numero ='%1'",_num];
_ResultRecup = [_recup,2] call DB_fnc_asyncCall;

if(count _ResultRecup == 0)then{
	_insertCon = format["INSERT INTO numberrepertoire (pid_owner, pid_contact, num_contact, nam_contact) VALUES('%1', '0','%2','""Inconnu""')",_pidOwner,_num];
	[_insertCon,1] call DB_fnc_asyncCall;
	
	_recupID = format["SELECT MAX(LAST_INSERT_ID(ID)) as last_id FROM numberrepertoire WHERE pid_owner='%1'",_pidOwner];
	_ResultRecupID = [_recupID,2] call DB_fnc_asyncCall;
	
	
	[4,[_pseudo,_num,_pidTo,_ResultRecupID select 0]] remoteExec ["life_fnc_cellphone",(owner _owner)];
}else{
	_insertCon = format["INSERT INTO numberrepertoire (pid_owner, pid_contact, num_contact, nam_contact) VALUES('%1', '%2','%3','""%4""')",_pidOwner,_ResultRecup select 0,_num,_ResultRecup select 1];
	[_insertCon,1] call DB_fnc_asyncCall;
	
	_recupID = format["SELECT MAX(LAST_INSERT_ID(ID)) as last_id FROM numberrepertoire WHERE pid_owner='%1'",_pidOwner];
	_ResultRecupID = [_recupID,2] call DB_fnc_asyncCall;
	
	[4,[_ResultRecup select 1,_num,_ResultRecup select 0,_ResultRecupID select 0]] remoteExec ["life_fnc_cellphone",(owner _owner)];
};
