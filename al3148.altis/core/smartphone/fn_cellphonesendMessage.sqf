#include "..\..\macro.h"
/*
	File: fn_cellphonesendMessage.sqf
	Author: J. `Kira` D.
	
	Description:
	Flemme d'expliquer
*/
private["_msg","_to","_send"];
params["_type"];
ctrlShow[3100,false];
_msg = ctrlText 3103;
_msgcount = toArray _msg;
_to = life_index_phone;
if((typeName _to) == "ARRAY")then{_to = _to select 0};
if(count _msgcount > 256) exitwith{hint "Votre message contient plus de 256 caracteres !"};
if(_to isEqualTo "Inconnu") exitwith{hint "Vous ne pouvez pas repondre !"};
if(_to isEqualTo "gang") then {_type = 4};

_send = true;
if (_type == 99) then {
	_checkAnonyme = cbChecked (findDisplay 3100 displayCtrl 3107);
	_checkCop = cbChecked (findDisplay 3100 displayCtrl 3109);
	_checkMed = cbChecked (findDisplay 3100 displayCtrl 3111);

	//Verification
	if ((_checkAnonyme && _checkCop) OR (_checkAnonyme && _checkMed) OR 
		(_checkCop && _checkAnonyme) OR (_checkCop && _checkMed) OR 
		(_checkMed && _checkAnonyme) OR (_checkMed && _checkCop)) exitWith {
		hint "Merci de cocher qu'une seule case ou aucune.";
	};

	// Normal Message
	if (!_checkAnonyme && !_checkCop && !_checkMed) then {_type = 0;};
	// Anonyme
	if (_checkAnonyme) then {_type = 1};
	//En tant que Gendarme
	if (_checkCop) then {_type = 2;};
	//En tant que Pompier
	if (_checkMed) then {_type = 3;};
};

switch(_type) do {
	//client à client
	case 0: {
		if(isNull (findDisplay 3100)) exitwith {hint "vous ne pouvez pas envoyer un message"};
		if(_msg == "") exitWith {hint "Message vide !";ctrlShow[3100,true];};
		if(!([str(_msg)] call life_fnc_prohibitedCharactersInMsgs)) exitWith {hint "Envoi impossible. Les caractères "":"" et ""&"" sont interdits dans les messages !"; ctrlShow[88885,true];};
		{
			_uid = _x select 2;
			_num = _x select 1;
			
			if((_num == _to) && (_uid == "0")) exitwith{_send=false;hint "Le numero que vous essayez de joindre, n'est pas disponible ou n'est pas attribue";systemChat "Le numero que vous essayez de joindre, n'est pas disponible ou n'est pas attribue";};
			if(_num == _to) then {
				_name = _x select 0;
				hint format["Message a %1: %2",_name,_msg];
			};
		}forEach life_repertoire;
		
		if(isNil "_name") then {hint format["Message a %1: %2",_to,_msg];};

			//["Numero","nom","message","uid","target","envoi a client","qui envoi?"]
		if(_send) then {[life_num,name player,_msg,getPlayerUID player,_to,0,player] RemoteExecCall ["AGO_fnc_findContact",RSERV];};
		ctrlShow[3100,true];
		closeDialog 3100;
	};	
	//Inconnu
	case 1:
	{
		if(_to == "") exitWith {hint format["Aucun destinataire sélectionné !"];};
		if(!([str(_msg)] call life_fnc_prohibitedCharactersInMsgs)) exitWith {hint "Envoi impossible. Les caractères "":"" et ""&"" sont interdits dans les messages !";};
		if(_msg == "") exitWith {hint "Vous devez écrire quelque chose !";};
		[life_num,name player,_msg,getPlayerUID player,_to,7,player] remoteExecCall ["AGO_fnc_findContact",RSERV];
		hint format["Message anonyme envoyé à: %1 - Message: %2",_to,_msg];
		closeDialog 3100;
	};
	//Des Gendarmes
	case 2:
	{
		if (playerSide != west) then {hint "Vous n'êtes pas Gendarme !";};
		if(_to == "") exitWith {hint format["Aucun destinataire sélectionné !"];};
		if(_msg == "") exitWith {hint "Vous devez écrire quelque chose !";};
		if(!([str(_msg)] call life_fnc_prohibitedCharactersInMsgs)) exitWith {hint "Envoi impossible. Les caractères "":"" et ""&"" sont interdits dans les messages !";};
		[life_num,name player,_msg,getPlayerUID player,_to,8,player] remoteExecCall ["AGO_fnc_findContact",RSERV];
		hint format["Message en tant que Gendarme envoyé à: %1 - Message: %2",_to,_msg];
		closeDialog 3100;
	};
	//Des Pompiers
	case 3:
	{
		if (playerSide != independent) then {hint "Vous n'êtes pas Pompiers !";};
		if(_to == "") exitWith {hint format["Aucun destinataire sélectionné !"];};
		if(_msg == "") exitWith {hint "Vous devez écrire quelque chose !";};
		if(!([str(_msg)] call life_fnc_prohibitedCharactersInMsgs)) exitWith {hint "Envoi impossible. Les caractères "":"" et ""&"" sont interdits dans les messages !";};
		[life_num,name player,_msg,getPlayerUID player,_to,9,player] remoteExecCall ["AGO_fnc_findContact",RSERV];
		hint format["Message en tant que Pompier envoyé à: %1 - Message: %2",_to,_msg];
		closeDialog 3100;
	};

	//MsgGang
	case 4:
	{
		if(_msg == "") exitWith {hint "Vous devez écrire quelque chose !";};
		if(!([str(_msg)] call life_fnc_prohibitedCharactersInMsgs)) exitWith {hint "Envoi impossible. Les caractères "":"" et ""&"" sont interdits dans les messages !";};
		_gang = (group player) getVariable "gang_name";
		[_msg,name player,11,_gang] RemoteExecCall ["life_fnc_clientMessage",RCLIENT];
		hint format["Message envoyé aux membres du gang: %1",_msg];
	};
};