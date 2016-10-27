#include "..\..\macro.h"
/*
	File: fn_messageShow.sqf
	Author: J. `Kira` D.
	
	Description:
	Flemme d'expliquer
*/
private["_data","_info"];
params["_type",["_data",0]];
disableSerialization;
_display = findDisplay 3000;
_cMessageList = _display displayCtrl 3004;
switch(_type) do {
	case 0:{
		[] spawn {
			_result = ["Êtes-vous sur de vouloir supprimer tout les messages ?", "Oui", true, true] call BIS_fnc_GUImessage;
			if(_result) then {
				[0,getPlayerUID player,player,objNull,objNull,playerSide] remoteExecCall ["AGO_fnc_delMsg",RSERV];
			}else{
				hint "Supression totale annulé...";
			};
		};
	};
	case 1:{
		[_cMessageList,_data] spawn {
			_result = ["Êtes-vous sur de vouloir supprimer ce message ?", "Oui", true, true] call BIS_fnc_GUImessage;
			_cMessageList = _this select 0;
			_data = _this select 1;
			if(_result) then {
				_info = call compile (_cMessageList lnbData [_data,0]);
				_id = _info select 4;
				_tag = _info select 5;
				[1,getPlayerUID player,player,_id,_tag] remoteExecCall ["AGO_fnc_delMsg",RSERV];
			}else{
				hint "Supression annulé...";
			};
		};
	};
};