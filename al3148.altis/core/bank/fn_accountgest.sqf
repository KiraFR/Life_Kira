#include "..\..\macro.h"
/*
	File: fn_accountgest.sqf
	Modifié par: R. `KronosD` R.
	
	Description:
	Kira: plein de Listes + modification dialog, j'ai pris celui de l'allemand et l'a bien modifié
*/
private["_display","_units","_type","_value","_numero","_count","_stringtext","_name","_uid","_num","_tab"];
if(isNil "life_account")exitwith{hint "Vous n'avez pas de compte en banque, veuillez vous deplacer a une banque pour en ouvrir un.";closeDialog 0;};
params[
	["_type",0,[0]],
	["_data",[],[[]]]
]

switch(_type) do {

	// Afficher les comptes
	case 0: {
		disableSerialization;
		waitUntil {!isNull findDisplay 16000};
		_display = findDisplay 16000;
		_AccountList = _display displayCtrl 16501;
		_MessageHeader = _display displayCtrl 16500;
		_MessageHeader lnbAddRow ["Nom du compte","Numero de compte","Offshore","Entrerprise","Solde","Default"];
		lbclear 16501;
		[getPlayerUID player, player,playerSide] remoteExecCall ["BQKS_fnc_GetAccount",2];
	};
	
	// Account list
	case 1:	{
		list_compte = _data;
		[] call life_fnc_lbAccounts;
	};
};
	