#include "..\..\macro.h"
/*
	File: fn_creatAccount.sqf
	Author: R. `KronosD` R.

	Description:
	créer un numéro et l'envoi au serveur
*/
private["_num","_name","_client","_Bank","_PriceB","_first"];
params ["_type"];
_uid = getPlayerUID player;

if(_type == 2) then {
	_name = ctrlText 11007;
	if(cbChecked (getControl(11000,11005))) then {_type = 3;};
};

switch (_type) do {

	//offshore
	case 1: {
		_name = ctrlText 11007;
		_PriceB = (life_AccOffshore)*(100000*3);
		_first = false;
		if(_PriceB == 0)then{_PriceB = 100000;_first = true;};
		if(CASH < _PriceB) exitWith{hint "Vous n'avez pas assez d'argent pour creer votre premier compte en banque";};
		CASH = CASH - _PriceB;
		_type = 1;
		_guid = (getPlayerUID Player) splitString "";
		if(clientOwner < 10)then{_client = format["00%1",clientOwner];};
		if(clientOwner > 10 AND clientOwner < 100) then{_client = format["0%1",clientOwner];};
		_guid = format["%1%2%3%4",
			_guid select 10,_guid select 11,_guid select 12,_guid select 13];
		_num = "OS" + _guid + format["%1",life_nbAcc+1];

		life_AccOffshore = life_AccOffshore +1;
		life_nbAcc = life_nbAcc +1;
		hint "Votre compte offshore a bien été créé";

		_Bank = [_name,_num,0,false,_first];
		_Bank call life_fnc_BankUpdate;

		[] call life_fnc_hudUpdate;
		[_uid,_num,_name,_type] remoteExecCall ["BQKS_fnc_CreateAccount",RSERV];
	};

	//normal
	case 2: {
		if(isNil "_uid")exitwith{hint "Vous n'êtes pas un joueur."};
		_PriceB = (20*25)*(life_AccN);
		_first = false;
		if(_PriceB == 0)then{_PriceB = 25;_first = true;};
		if(CASH < _PriceB) exitWith{hint "Vous n'avez pas assez d'argent pour creer votre premier compte en banque";};
		CASH = CASH - _PriceB;

		_type = 2;

		_guid = (getPlayerUID Player) splitString "";
		if(clientOwner < 10)then{_client = format["00%1",clientOwner];};
		if(clientOwner > 10 AND clientOwner < 100) then{_client = format["0%1",clientOwner];};
		_guid = format["%1%2%3%4",_guid select 10,_guid select 11,_guid select 12,_guid select 13];
		_num = "RD" + _client +_guid + format["%1",life_nbAcc+1];

		hint "Votre compte a bien était cree";

		_Bank = [_name,_num,0,false,_first];
		_Bank call life_fnc_BankUpdate;

		life_AccN = life_AccN +1;
		life_nbAcc = life_nbAcc +1;
		[] call life_fnc_hudUpdate;
		[_uid,_num,_name,_type] remoteExecCall ["BQKS_fnc_CreateAccount",RSERV];

	};

	//entreprise
	case 3: {
		if(life_EnterAcc)exitWith{hint "Votre entreprise a deja un compte."};
		if(isNil "_uid")exitwith{hint "Vous n'êtes pas un joueur."};
		if(CASH < 10000) exitWith{hint "Vous n'avez pas assez d'argent pour creer votre premier compte en banque";};
		CASH = CASH - 10000;

		_type = 3;

		_guid = (getPlayerUID Player) splitString "";
		_guid = format["%1%2%3%4%5%6%7",
			_guid select 13,_guid select 12,_guid select 11,
			_guid select 10,_guid select 9,_guid select 8,
			_guid select 7];
		_num = "ED" + _guid + format["%1",life_nbAcc+1];

		hint "Votre compte a bien était creer";

		_Bank = [_name,_num,0,false,false];
		_Bank call life_fnc_BankUpdate;

		[] call life_fnc_hudUpdate;
		life_EnterAcc = true;
		[_uid,_num,_name,_type] remoteExecCall ["BQKS_fnc_CreateAccount",RSERV];
	};
	//Epargne
	case 4: {
		if(life_EparAcc)exitWith{hint "Votre entreprise a deja un compte."};
		_type = 4;
		_guid = (getPlayerUID Player) splitString "";
		_guid = format["%1%2%3%4%5%6%7",
			_guid select 13,_guid select 12,_guid select 11,
			_guid select 10,_guid select 9,_guid select 8,
			_guid select 7];
		_num = "EP" + _guid + format["%1",life_nbAcc+1];

		hint "Votre compte a bien était creer";

		_Bank = [_name,_num,0,false,false];
		_Bank call life_fnc_BankUpdate;

		[] call life_fnc_hudUpdate;
		life_EparAcc = true;
		[_uid,_num,_name,_type] remoteExecCall ["BQKS_fnc_CreateAccount",RSERV];
	};
	//Orga
	case 5: {
		if(life_OrgaAcc)exitWith{hint "Votre entreprise a deja un compte."};
		if(isNil "_uid")exitwith{hint "Vous n'êtes pas un joueur."};
		if(CASH < 10000) exitWith{hint "Vous n'avez pas assez d'argent pour creer votre premier compte en banque";};
		_type = 5;

		_guid = (getPlayerUID Player) splitString "";
		_guid = format["%1%2%3%4%5%6%7",
			_guid select 13,_guid select 12,_guid select 11,
			_guid select 10,_guid select 9,_guid select 8,
			_guid select 7];
		_num = "OD" + _guid + format["%1",life_nbAcc+1];

		hint "Votre compte a bien était creer";

		_Bank = [_name,_num,0,false,false];
		_Bank call life_fnc_BankUpdate;

		[] call life_fnc_hudUpdate;
		life_OrgaAcc = true;
		[_uid,_num,_name,_type] remoteExecCall ["BQKS_fnc_CreateAccount",RSERV];
	};
};
