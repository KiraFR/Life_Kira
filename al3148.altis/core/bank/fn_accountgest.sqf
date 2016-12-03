#include "..\..\macro.h"
/*
	File: fn_accountgest.sqf
	Modifié par: R. `KronosD` R.
	
	Description:
	Kira: plein de Listes + modification dialog, j'ai pris celui de l'allemand et l'a bien modifié
*/
private["_display","_units","_type","_value","_numero","_count","_stringtext","_name","_uid","_num","_tab"];
if(isNil "life_account")exitwith{hint "Vous n'avez pas de compte en banque, veuillez vous deplacer a une banque pour en ouvrir un.";closeDialog 0;};
_type = [_this,0,0] call BIS_fnc_param;
_data = [_this,1,0] call BIS_fnc_param;
_target = [_this,2,2] call BIS_fnc_param;
disableSerialization;
waitUntil {!isNull findDisplay 16000};
_display = findDisplay 16000;
_AccountList = _display displayCtrl 16501;
_MessageHeader = _display displayCtrl 16500;
_MessageHeader lnbAddRow ["Nom du compte","Numero de compte","Offshore","Entrerprise","Solde","Default"];


switch(_type) do {

	// Afficher les comptes
	case 0: {
		lbclear 16501;
		[getPlayerUID player, player,playerSide] remoteExecCall ["BQKS_fnc_GetAccount",2];
	};
	
	// Account list
	case 1:	{
		Private["_tab"];
		{
					_tab = [];
					_result = _x;
				{
					format["%1",_x] pushBack _tab;
				}foreach _result;
			_AccountList lnbAddRow _tab;
		}foreach list_compte;
	};

};
	