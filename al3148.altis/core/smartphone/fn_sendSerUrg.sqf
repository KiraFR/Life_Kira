#include "..\..\macro.h"
/*
	File: fn_sendSerUrg.sqf
	Author: J. `Kira` D.
	
	Description:
	Flemme d'expliquer
*/
private["_msg","_to","_send"];
params["_type"];

_msg = ctrlText 9003;
_msgcount = toArray _msg;
if(count _msgcount > 256) exitwith{hint "Votre message contient plus de 256 caracteres !"};
_send = true;
if (_type == 99) then {
	// service/Urgence
	_checkgen = cbChecked (findDisplay 8500 displayCtrl 8004);
	_checkdepan = cbChecked (findDisplay 8000 displayCtrl 8005);
	_checkTaxi = cbChecked (findDisplay 8000 displayCtrl 8006);
	_checkpom = cbChecked (findDisplay 8500 displayCtrl 8007);
	_checktoAdmin = cbChecked (findDisplay 8500 displayCtrl 8009);

	//Admin
	_checkAdminMsgAll = cbChecked (findDisplay 9000 displayCtrl 9007);
	_checkAdmin = cbChecked (findDisplay 9000 displayCtrl 9005);

	if ((_checkgen && _checkpom) OR (_checkpom && _checkgen)) exitWith {
		hint "Merci de cocher qu'une seule case ou aucune.";
	};
	if ((_checkdepan && _checkTaxi) OR (_checkdepan && _checktoAdmin)OR 
		(_checkTaxi && _checkdepan) OR (_checkTaxi && _checktoAdmin) OR 
		(_checktoAdmin && _checkdepan) OR (_checktoAdmin && _checkTaxi)) exitWith {
		hint "Merci de cocher qu'une seule case ou aucune.";
	};


	if ((_checkAdminMsgAll && _checkAdmin) OR (_checkAdmin && _checkAdminMsgAll)) exitWith {
		hint "Merci de cocher qu'une seule case ou aucune.";
	};

	//aux gendarmes
	if (_checkgen) then {_type = 0;};
	//aux depanneurs
	if (_checkdepan) then {_type = 5;};
	//aux taxis
	if (_checkTaxi) then {_type = 4;};
	//aux pompiers
	if (_checkpom) then {_type = 2;};
	//aux Admins
	if (_checktoAdmin) then {_type = 1;};
	//AdminMsgAll
	if (_checkAdminMsgAll) then {_type = 3;};

	if (_checkAdmin) then {_type = 6;};

};

switch(_type) do {	
	//client à cop
	case 0:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["La Gendarmerie est actuellement indisponible. Veuillez réessayer plus tard."];};
		if(_msg == "") exitWith {hint "Vous devez écrire quelque chose !"; ctrlShow[888895,true];};
		if(!([str(_msg)] call life_fnc_prohibitedCharactersInMsgs)) exitWith {hint "Envoi impossible. Les caractères "":"" et ""&"" sont interdits dans les messages !"; ctrlShow[888895,true];};
		

		[[life_num,name player,_msg,getPlayerUID player,ObjNull,1,player],"SMPH_fnc_findContact",false,false] spawn life_fnc_MP;
		//[life_num,name player,_msg,getPlayerUID player,ObjNull,1,player] RemoteExecCall ["SMPH_fnc_findContact",RSERV];
		_to = "Gendarmerie";
		hint format["Message à la %1 : %2",_to,_msg];
		[[life_num, position player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;
		//[life_num, position player] remoteExec ["life_fnc_createMarker",west];
		closeDialog 8500;
	};
	
	//msgadmin
	case 1:
	{
		if(_msg == "") exitWith {hint "Vous devez écrire quelque chose !"; ctrlShow[8000,true];};
		if(!([str(_msg)] call life_fnc_prohibitedCharactersInMsgs)) exitWith {hint "Envoi impossible. Les caractères "":"" et ""&"" sont interdits dans les messages !"; ctrlShow[888896,true];};

		[[life_num,name player,_msg,getPlayerUID player,ObjNull,2,player],"SMPH_fnc_findContact",false,false] spawn life_fnc_MP;
		//[life_num,name player,_msg,getPlayerUID player,ObjNull,2,player] RemoteExecCall ["SMPH_fnc_findContact",RSERV];
		

		hint format["Message aux admins : %1",_msg];
		//closeDialog 8500;
	};
	
	
	//emsrequest
	case 2:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["Les Sapeurs Pompiers sont actuellement indisponibles. Veuillez réessayer plus tard."];};
		if(_msg == "") exitWith {hint "Vous devez écrire quelque chose !"; ctrlShow[8000,true];};
		if(!([str(_msg)] call life_fnc_prohibitedCharactersInMsgs)) exitWith {hint "Envoi impossible. Les caractères "":"" et ""&"" sont interdits dans les messages !"; ctrlShow[888899,true];};
		
		[[life_num,name player,_msg,getPlayerUID player,ObjNull,3,player],"SMPH_fnc_findContact",false,false] spawn life_fnc_MP;
		//[life_num,name player,_msg,getPlayerUID player,ObjNull,3,player] RemoteExecCall ["SMPH_fnc_findContact",RSERV];
		
		hint format["Vous avez envoyé un message aux Pompiers : %1",_msg];
		[[life_num, position player],"life_fnc_createMarker",independent,false] spawn life_fnc_MP;
		//[life_num, position player] remoteExec ["life_fnc_createMarker",independent];
		closeDialog 8500;
	};

	//adminMsgAll
	case 3:
	{
		if(isNil "life_adminlevel" OR (call life_adminlevel) < 1) exitWith {hint "Vous n'êtes pas Admin !";};
		if(_msg == "") exitWith {hint "Vous devez écrire quelque chose !";};
		if(!([str(_msg)] call life_fnc_prohibitedCharactersInMsgs)) exitWith {hint "Envoi impossible. Les caractères "":"" et ""&"" sont interdits dans les messages !";};
		[[_msg,_name,5],"life_fnc_clientMessage",true,false] spawn life_fnc_MP;
		//[_msg,_name,5] RemoteExecCall ["life_fnc_clientMessage",-2];
		systemChat format["Admin message à tous les joueurs: %1",_msg];
		closeDialog 9000;
	};
	/*//MsgTaxi
	case 4:
	{
		if(_msg == "") exitWith {hint "Vous devez écrire quelque chose !";};
		if(!([str(_msg)] call life_fnc_prohibitedCharactersInMsgs)) exitWith {hint "Envoi impossible. Les caractères "":"" et ""&"" sont interdits dans les messages !";};
		[life_num,name player,_msg,getPlayerUID player,ObjNull,5,player] remoteExecCall ["SMPH_fnc_findContact",RSERV];
		hint format["Vous avez envoyé un message aux Taxi : %1",_msg];
		closeDialog 8000;
	};
	//MsgDepanneur
	case 5:
	{
		if(_msg == "") exitWith {hint "Vous devez écrire quelque chose !";};
		if(!([str(_msg)] call life_fnc_prohibitedCharactersInMsgs)) exitWith {hint "Envoi impossible. Les caractères "":"" et ""&"" sont interdits dans les messages !";};
		[life_num,name player,_msg,getPlayerUID player,ObjNull,6,player] remoteExecCall ["SMPH_fnc_findContact",RSERV];
		hint format["Vous avez envoyé un message aux Depanneur : %1",_msg];
		closeDialog 8000;
	};*/
	//adminToPerson
	case 6:
	{
		if(isNil "life_adminlevel" OR (call life_adminlevel) < 1) exitWith {hint "Vous n'êtes pas Admin !";};
		_to = call compile format["%1",(lbData[9008,(lbCurSel 9008)])];
		if(isNull _to) exitWith {};
		if(_msg == "") exitWith {hint "Vous devez écrire quelque chose !";};
		if(!([str(_msg)] call life_fnc_prohibitedCharactersInMsgs)) exitWith {hint "Envoi impossible. Les caractères "":"" et ""&"" sont interdits dans les messages !";};
		[[_msg,"Admin",4],"life_fnc_clientMessage",_to,false] spawn life_fnc_MP;
		//[_msg,"Admin",4] RemoteExecCall ["life_fnc_clientMessage",_to];
		
		hint format["Admin Message envoyé à : %1 - Message: %2",name _to,_msg];
		closeDialog 9000;
	};
};