/*
	File: fn_findContact.sqf
	Author: J `Kira` D

	Description:
	- 	Bizarre qu'il s'appelle findContact hein.. ?
		à la base il cherchait seulement les joueurs... 
		puis c'est partit en couilles..
	- Code assez chiant, je suis gentil avec les commentaires.
*/
private["_query","_queryFin","_query2","_queryFin2","_Numero","_name","_uidto","_contact","_queryInsertsms","_Numerocontactto","_de","_contactto","_ownerID"];
params [
	"_numperso",
	"_name",
	"_msg",
	"_uid",
	"_to",
	"_type",
	"_owner"
];

// vive arma
if (isNil "_owner") exitwith {diag_log "Pourquoi tu me casses les c******* ? Erreur fn_findContact: _owner";};
if(_msg == "") exitwith {diag_log "Pourquoi tu me casses les c******* ? Erreur fn_findContact:_msg"};
if(_uid == "") exitwith {diag_log "Pourquoi tu me casses les c******* ? Erreur fn_findContact:_uid"};

if(count _queryFin2 == 0) exitwith{["Le Destinataire n'est pas joignable ou n'existe pas.","Service Client",0] RemoteExecCall ["life_fnc_clientMessage",(owner _owner)];};
//gros code, beaucoup de variable, je verrais plus tard pour reduire
switch(_type) do {

	// Envoi de client à client
	case 0:
	{
		_queryUid = format["SELECT pid_owner FROM phonenumber WHERE numero='%1'",_to];
		_uidto = [_queryUid,2] call DB_fnc_asyncCall;
		if(count _uidto == 0)exitwith{["Le Destinataire n'est pas joignable ou n'existe pas.","Service Client",0] RemoteExecCall ["life_fnc_clientMessage",(owner _owner)];};
		
		//Recupere la liste de contact de la cible
		_queryCon = format["SELECT nam_contact, num_contact FROM numberrepertoire WHERE pid_owner='%1'",_uidto select 0];
		_queryConFin = [_queryCon,2,true] call DB_fnc_asyncCall;
		
		/*
			select 0: uid de celui qui reçoit
			select 1: liste de contact de celui qui reçoit
		*/
	
		// 	Sauvegarde du message
		_msgToSend = [_msg] call DB_fnc_mresString;
		_queryInsertsms = format["INSERT INTO `message`(`de`, `deUID`, `to`, `toUID`, `message`) VALUES ('%1','%2','%3','%4','""%5""')",_numperso,_uid,_to,_uidto select 0,_msgToSend];
		[_queryInsertsms,1] call DB_fnc_asyncCall;
		

		//	c'bout de code permet de check dans les contact si le numero de la personne qui envoi existe ou pas
		
		{
			if(_numperso == _x select 1) then{_de = _x select 0;};
			
		}Foreach _queryConFin;
		//si il n'existe pas, bah je laisse le numero
		if(isNil "_de")then{_de = _numperso;};
		{
			_uidplayableUnits = getplayerUID _x;
			if (_uidplayableUnits == _uidto select 0) then {_ownerID = owner _x;};
		}forEach playableUnits;

		// si il est pas connecté, bah j'envoi rien tout simplement
		if(isNil "_ownerID") exitwith{};
		
		// si il exite au contraire, retour au client(envoi du message)
		[_msg,_de,0] RemoteExecCall ["life_fnc_clientMessage",_ownerID];
	};
	
	
	// Envoi de client à police
	case 1: {[_msg,_numperso,1] RemoteExecCall ["life_fnc_clientMessage",west];};	
	// Envoi de client à admins
	case 2: {[_msg,_name,2] RemoteExecCall ["life_fnc_clientMessage",RCLIENT];};	
	// Envoi de client à medic
	case 3: {[_msg,_numperso,3] RemoteExecCall ["life_fnc_clientMessage",independent];};	
	//Envoi de admin au clients
	case 4: {[_msg,_name,5] RemoteExecCall ["life_fnc_clientMessage",RCLIENT];};
	// Envoi de client à Taxi
	case 5:{[_msg,_numperso,6] RemoteExecCall ["life_fnc_clientMessage",RCLIENT];};
	// Envoi de client à Depan
	case 6:{[_msg,_numperso,7] RemoteExecCall ["life_fnc_clientMessage",RCLIENT];};
	// Envoi de client en inconnu
	case 7:{
		_queryUid = format["SELECT pid_owner FROM phonenumber WHERE numero='%1'",_to];
		_uidto = [_queryUid,2] call DB_fnc_asyncCall;
		if(count _uidto == 0)exitwith{["Le Destinataire n'est pas joignable ou n'existe pas.","Service Client",0] RemoteExecCall ["life_fnc_clientMessage",(owner _owner)];};
	
		// 	Sauvegarde du message
		_msgToSend = [_msg] call DB_fnc_mresString;
		_queryInsertsms = format["INSERT INTO `message`(`de`, `deUID`, `to`, `toUID`, `message`) VALUES ('""Inconnu""','""Inconnu""','%1','%2','""%3""')",_to,_uidto select 0,_msgToSend];
		[_queryInsertsms,1] call DB_fnc_asyncCall;
		

		//	c'bout de code permet de check dans les contact si le numero de la personne qui envoi existe ou pas
		
		//si il n'existe pas, bah je laisse le numero
		{
			_uidplayableUnits = getplayerUID _x;
			if (_uidplayableUnits == (_uidto select 0)) then {_ownerID = owner _x;};
		}forEach playableUnits;

		// si il est pas connecté, bah j'envoi rien tout simplement
		if(isNil "_ownerID") exitwith{};
		
		// si il exite au contraire, retour au client(envoi du message)
		[_msg,_name,8] RemoteExecCall ["life_fnc_clientMessage",_ownerID];
	};
	// Envoi de gendarmes au client
	case 8: {
		_query = format["SELECT pid_owner FROM phonenumber WHERE numero='%1'",_to];
		_uidto = [_query,2] call DB_fnc_asyncCall;
		if(count _queryResult == 0) exitWith {"Le Destinataire n'existe pas !" remoteExec ["systemChat",(owner _owner)]};
		
		{
			_uidplayableUnits = getplayerUID _x;
			if (_uidplayableUnits == _uidto select 0) then {
				_ownerID = owner _x;
			};
		}forEach playableUnits;

		// si il est pas connecté, bah j'envoi rien tout simplement
		if(isNil "_ownerID") exitwith{};
		[_msg,_name,9] RemoteExecCall ["life_fnc_clientMessage",_ownerID];
	};
	// Envoi de pompiers au client
	case 9: {
		_query = format["SELECT pid_owner FROM phonenumber WHERE numero='%1'",_to];
		_uidto = [_query,2] call DB_fnc_asyncCall;
		if(count _queryResult == 0) exitWith {"Le Destinataire n'existe pas !" remoteExec ["systemChat",(owner _owner)]};
		
		{
			_uidplayableUnits = getplayerUID _x;
			if (_uidplayableUnits == _uidto select 0) then {
				_ownerID = owner _x;
			};
		}forEach playableUnits;

		// si il est pas connecté, bah j'envoi rien tout simplement
		if(isNil "_ownerID") exitwith{};
		[_msg,_name,10] RemoteExecCall ["life_fnc_clientMessage",_ownerID];
	};
	// Envoi de gang
	case 10: {
		_target = _this select 7;
		if(isNil "_target") exitwith{};
		[_msg,_name,11] RemoteExecCall ["life_fnc_clientMessage",(owner _target)];
	};		
	
	// envoi de admin à client (private)
	case 11: {
		_query = format["SELECT pid_owner FROM phonenumber WHERE numero='%1'",_to];
		_uidto = [_query,2] call DB_fnc_asyncCall;
		if(count _queryResult == 0) exitWith {"Le Destinataire n'existe pas !" remoteExec ["systemChat",(owner _owner)]};
		
		{
			_uidplayableUnits = getplayerUID _x;
			if (_uidplayableUnits == _uidto select 0) then {
				_ownerID = owner _x;
			};
		}forEach playableUnits;

		// si il est pas connecté, bah j'envoi rien tout simplement
		if(isNil "_ownerID") exitwith{};
		[_msg,_name,4] RemoteExecCall ["life_fnc_clientMessage",(owner _ownerID)];
	};	
};