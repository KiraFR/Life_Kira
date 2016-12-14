#include "..\..\macro.h"
/*
	File: fn_creatAccount.sqf
	Author: R. `KronosD` R.

	Description:
	créer un numéro et l'envoi au serveur
*/
private["_num","_name"];
_type = _this;
_uid = getPlayerUID player;

if(isNil "_type") then {
	_name = ctrlText ACHANGER;
	if(cbChecked (findDisplay 11000 displayCtrl 11040))	then{_type = 3;}else{_type = 2;};
};

switch (_type) do {

	//offshore
	case 1: {
		_name = ctrlText ACHANGER;
		if(isNil "_uid")exitwith{hint "Vous n'êtes pas un joueur."};
		if(life_cash < 20000) exitWith{hint "Vous n'avez pas assez d'argent pour creer votre premier compte en banque";}; 
		life_cash = life_cash - 20000;

		_guid = (getPlayerUID Player) splitString "";

		if(clientOwner < 10)then{_client = format["00%1",clientOwner];
		}else if(clientOwner > 10 AND clientOwner < 100) then{_client = format["0%1",clientOwner];};
		_guid = format["%1%2%3%4",_guid select 10,_guid select 11,_guid select 12,_guid select 13];
		_num = "RD" + _guid + format["%1",life_nbAcc+1]];

		hint "Votre compte offshore a bien été créé";
		[] call life_fnc_hudUpdate;
		[_uid,_num,_name] remoteExecCall ["BQKS_fnc_CreateAccountOff",RSERV];
	};

	//normal
	case 2: {
		if(isNil "_uid")exitwith{hint "Vous n'êtes pas un joueur."};
		if(life_cash < 100) exitWith{hint "Vous n'avez pas assez d'argent pour creer votre premier compte en banque";}; 
		life_cash = life_cash - 100;

		_guid = (getPlayerUID Player) splitString "";
		if(clientOwner < 10)then{_client = format["00%1",clientOwner];
		}else if(clientOwner > 10 AND clientOwner < 100) then{_client = format["0%1",clientOwner];};
		_guid = format["%1%2%3%4",_guid select 10,_guid select 11,_guid select 12,_guid select 13];
		_num = "RD" + _guid + format["%1",life_nbAcc+1]];

		hint "Votre compte a bien était creer";
		[] call life_fnc_hudUpdate;
		[_uid,_num,_name] remoteExecCall ["BQKS_fnc_CreateAccount",RSERV];
	};

	//entreprise
	case 3: {
		if(life_EnterAcc)exitWith{hint "Votre entreprise a deja un compte."};
		if(isNil "_uid")exitwith{hint "Vous n'êtes pas un joueur."};
		if(life_cash < 10000) exitWith{hint "Vous n'avez pas assez d'argent pour creer votre premier compte en banque";}; 
		life_cash = life_cash - 10000;

		_guid = (getPlayerUID Player) splitString "";
		_guid = format["%1%2%3%4",
		_guid select 13,_guid select 12,_guid select 11,
		_guid select 10,_guid select 9,_guid select 8,
		_guid select 7];
		_num = "ED" + _guid + format["%1",life_nbAcc+1]];

		hint "Votre compte a bien était creer";
		[] call life_fnc_hudUpdate;
		life_EnterAcc = true;
		[_uid,_num,_name] remoteExecCall ["BQKS_fnc_CreateAccountEntre",RSERV];
	};
};