#include "..\..\macro.h"
/*
	File: fn_CreateAccount.sqf
	Author: R. `KronosD` R.

	Description:
	Ajoute le compte dans a db
*/
private["_check"];
params[
	["_uid","",[""]],
	"_numcompte",
	"_owner",
	"_prefixe"
];

if((_uid == "") OR (_numcompte == "")) exitWith {systemChat "Mauvais UID ou Numero";};
if(isNil "_owner") exitWith{systemChat "Tu n'es pas un joueur apparement.."};
_CheckNum = "SELECT playerid,numcompte FROM banque";
_ResultCheckNum = [_CheckNum,2,true] call DB_fnc_asyncCall;
_deja = false;
{	
	if(_uid == _x select 0) exitwith {_deja = true;};
	if(str(_x select 1) == str(_x)) then {
		format["Le numéro de compte %1 existe déjà, création d'un autre numéro..",_numcompte] remoteExec ["systemChat",(owner _owner)];
		_numcompte = _prefixe;
		for "_i" from 1 to 8 do {
			_value = str(floor random[0,9]);
			_numcompte = _numcompte + _value;
			_i = _i+1;
		};
	};
}forEach _ResultCheckNum;

_insertNum = format["INSERT INTO banque (playerid,numcompte, offshore) VALUES('%1', '""%2""', '0')",_uid,_numcompte,_offshore];
[_insertNum,1] call DB_fnc_asyncCall;