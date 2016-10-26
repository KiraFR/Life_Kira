/*
	File: fn_insertNumber.sqf
	Author: J. `Kira` D.

	Description:
	Ajoute seulement le numéro dans la db
*/
private["_check"];
params[
	["_uid","",[""]],
	"_num",
	"_owner",
	"_prefixe",
	"_name"
];

if((_uid == "") OR (_num == "") OR (_name == "")) exitWith {systemChat "Mauvais UID ou Nom ou Numero";};
if(isNil "_owner") exitWith{systemChat "Tu n'es pas un joueur apparement.."};
_CheckNum = "SELECT pid_owner,numero FROM phonenumber";
_ResultCheckNum = [_CheckNum,2,true] call DB_fnc_asyncCall;
_deja = false;
{	
	if(_uid == _x select 0) exitwith {_deja = true;};
	if(str(_x select 1) == str(_x)) then {
		format["Le numéro %1 existe déjà, création d'un autre numéro..",_num] remoteExec ["systemChat",(owner _owner)];
		_num = _prefixe;
		for "_i" from 1 to 8 do {
			_value = str(floor random[0,9]);
			_num = _num + _value;
			_i = _i+1;
		};
	};
}forEach _ResultCheckNum;

if(_deja) then{"Vous avez deja un numero" remoteExec ["hint",(owner _owner)];}else{
_insertNum = format["INSERT INTO phonenumber (pid_owner,nom, numero) VALUES('%1', '""%2""', '%3')",_uid,_name,_num];
[_insertNum,1] call DB_fnc_asyncCall;
[1,_num] remoteExec ["SOCK_fnc_contactReceived",(owner _owner)];
};

