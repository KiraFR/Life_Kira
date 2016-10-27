#include "..\..\macro.h"
/*
	File: fn_cellphone.sqf
	Modifié par: J. `Kira` D.
	
	Description:
	Kira: plein de Listes + modification dialog, j'ai pris celui de l'allemand et l'a bien modifié
*/
private["_display","_units","_type","_value","_pseudo","_numero","_count","_stringtext","_name","_icon","_uid","_info","_num"];
if(isNil "life_num")exitwith{hint "Votre carte SIM n'est pas activée, rendez vous au magasin de téléphonie pour l'activer.";closeDialog 0;};
_type = [_this,0,0] call BIS_fnc_param;
_data = [_this,1,0] call BIS_fnc_param;
_target = [_this,2,2] call BIS_fnc_param;
disableSerialization;
waitUntil {!isNull findDisplay 3000};
_display = findDisplay 3000;
_cMessageList = _display displayCtrl 3004;
_cMessageHeader = _display displayCtrl 3001;
_cMessageHeader2 = _display displayCtrl 3082;
_cMessageHeader3 = _display displayCtrl 3081;
_PlayerList = _display displayCtrl 3003;
_title = _display displayCtrl 3045;
_repertoire = _display displayCtrl 3011;
_annuaire = _display displayCtrl 3071;
_cMessageHeader ctrlSetText format[" De:"];
_cMessageHeader3 ctrlSetStructuredText parseText format["<t align='center'>Message: </t>"];
_cMessageHeader2 ctrlSetStructuredText parseText format["<t align='right'>A:</t>"];
_title ctrlSetStructuredText parseText format["<t align='right'>Votre numero: %1</t>",life_num];
_gang = (group player) getVariable "gang_name";
_edit = ctrlshown _repertoire;
_add = ctrlshown _annuaire;
ctrlEnable[3006,False];
ctrlEnable[3066,False];
ctrlEnable[3067,False];
if((isNil "life_adminlevel") OR (__GETC__(life_adminlevel) < 1)) then {
	ctrlShow[3062,false];
};

switch(_type) do {

	// Afficher les messages
	case 0: {
		lbclear 3004;
		[getPlayerUID player, player,playerSide] remoteExecCall ["AGO_fnc_msgRequest",RSERV];
	};
	
	// Message list
	case 1:	{
		_msg = [_data select 5,25] call KRON_StrLeft;
		_rowData = [_data select 2, _data select 4, _data select 5, _data select 1,_data select 0,_data select 6];
		_value = _data select 1;
		_to = _data select 3;
		_A = _data select 6;
		{
			_num = _x select 1;			
			if(_num == _value) then {
				_name = _x select 0;
			};
		}forEach life_repertoire;
		
		if(isNil "_name") then {_name = _value};
		_stringtext = format["%1",_name];
		_cMessageList lnbAddRow[_stringtext,_A,format["%1 ...",_msg]];
		_cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_rowData)];
	};
	
	
	//Dialog Edit
	case 2: {
		createDialog "Life_Edit_contact";
		[life_index_phone] call life_fnc_editcontact;
		if(!(isNil "_gang")) then {
			if(typeName life_index_phone == "ARRAY") then {
				if((life_index_phone select 0) == "gang") exitWith {hint "Vous ne pouvez pas modifier le gang !";closeDialog 0;};
			};
		};

	};
	
	// Ajout dans repertoire
	case 4: {
		hint format["Vous venez de rajouter %1 dans votre repertoire",_data select 0];
		life_repertoire = life_repertoire + [_data];
		[10] spawn life_fnc_cellphone;
	};
	
	//Requete Annuaire
	case 5:{
		lbclear 3003;
		[player] remoteExecCall ["AGO_fnc_AnnuaireRequest",RSERV];
		ctrlEnable[30201,false];
	};
	
	//Annuaire
	case 6:{
		{
			_info = _x select 0;
			_msg = format["%1",_info select 0];
			_addlist = lbAdd[3003,_msg];
			lbSetData [3003,_addlist,format["%1",[_info select 1,_info select 3,_info select 0,1]]];
			lbSetPicture [3003, _addlist, _x select 1];
			lbSetTooltip [3003,_addlist,format["Numero: %1",_info select 1]];
			lbSort [_PlayerList, "ASC"];
		}foreach _data;
		ctrlEnable[30201,true];
	};

	//Afficher repertoire directement
	case 8:{	
		ctrlshow[30201,false];
		ctrlshow[3071,false];
		ctrlshow[3012,false];
		ctrlshow[30231,false];
		ctrlshow[30271,false];
		[10] spawn life_fnc_cellphone;
	};

	//supprimer un contact
	case 9: {
		lbclear 3003;
		ctrlEnable[3020,false];
		if(!(isNil "_gang")) then {
			if((life_index_phone select 0) == "gang") exitWith {hint "Vous ne pouvez pas supprimer le gang !"};
		};
			[life_index_phone] call life_fnc_removecontact;
	};
	
	//Check si le joueur est connecté ou pas via le serveur
	case 10:{
		ctrlEnable[3020,false];
		lbclear 3003;
		if(count life_repertoire == 0)then{
			[player,[]] remoteExecCall ["AGO_fnc_CheckRepertoire",RSERV];
		}else{[player,life_repertoire] remoteExecCall ["AGO_fnc_CheckRepertoire",RSERV];};
	};

	//Reçoit l'info des contact connecté ou pas
	case 11: {
		if(!(isNil "_gang")) then {
			_gang = lbAdd [3003,"*Gang*"];
			lbSetData [3003,_gang,format["%1",["gang",0,"gang",2]]];
			lbSetTooltip [3003,_gang,"Envoyer message au gang"];
			lbSetPicture [3003,_gang,"\agorapolis_icons\data\smartphone\ico_gang.paa"];
		};

		{
			_info = _x select 0;
			_msg = format["%1",_info select 0];
			_list = lbAdd[3003,_msg];
			lbSetData [3003,_list,format["%1",[_info select 1,_info select 3,_info select 0,0]]];
			lbSetPicture [3003, _list, _x select 1];
			lbSetTooltip [3003,_list,format["numero: %1",_info select 1]];
			lbSort [_PlayerList, "ASC"];
		}foreach _data;
		ctrlEnable[3020,true];
	};

	case 12: {
		if((isNil "life_adminlevel") OR (__GETC__(life_adminlevel) < 1)) exitWith {hint "Vous n'êtes pas admin !";closeDialog 0;};
		_Cdisplay = findDisplay 9000;
		_cPlayerList = _Cdisplay displayCtrl 9008;
		lbClear _cPlayerList;
		{
			if(alive _x && _x != player) then {
				//_cPlayerList lbAdd format["%1 (%2)",_x getVariable["realname", name _x],_type];
				_cPlayerList lbAdd format["%1",_x getVariable["realname", name _x]];
				_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
			};
		} forEach playableUnits;
		lbSort [_cPlayerList, "ASC"];
	};
};
switch(true)do{
	case _edit:{
		ctrlEnable[3011,false];
		ctrlEnable[3009,false];
	};
	case _add:{
		ctrlEnable[3071,false];
	};
};