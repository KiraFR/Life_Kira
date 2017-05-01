#include "..\..\macro.h"
/*
	File: fn_creatNum.sqf
	Author: J. `Kira` D.

	Description:
	créer un numéro et l'envoi au serveur
*/
private["_num"];
_prefixe = _this select 3;
_owner = player;
_uid = getPlayerUID _owner;
_name = name _owner;

if(_prefixe == "")exitwith{hint "Problème de préfixe, contactez un Administrateur."};
if(life_cash < 1000) exitWith{hint "Vous n'avez pas assez d'argent de poche pour acheter un forfait téléphonique";}; 
life_cash = life_cash - 1000;
_value = str(floor random 10000);
_numcount= toArray _value;
switch(true) do {
	case (count _numcount == 1):{ _num = _prefixe + format["000%1",_value];};
	case (count _numcount == 2):{ _num = _prefixe + format["00%1",_value];};
	case (count _numcount == 3):{ _num = _prefixe + format["0%1",_value];};
	case (count _numcount == 4):{ _num = _prefixe + format["%1",_value];};
};
hint "Vous pouvez maintenant envoyer des messages.";
[0] call SOCK_fnc_updatePartial;
[] call life_fnc_hudUpdate;
life_annuaire = false;
[_uid,_num,_owner,_prefixe,_name] remoteExecCall ["AGO_fnc_insertNumber",RSERV];