#include "..\..\macro.h"
/*
	File: fn_SetAccountDefault.sqf
	Crée par: R. `KronosD` R.
	
	Description:
	Mettre un compte en default 
*/

private["_deja"];
_uid = getPlayerUID player;
_tabAcc = call compile format["%1",lnbData[1601,[_this select 0,0]]];
_idAcc = _tabAcc select 0; // id du compte
if(!isNil "life_dflt")then{if(_idAcc isEqualTo life_dflt) exitWith {hint "Ce compte est deja votre compte par default.";};};
life_dflt = _idAcc;
life_atmcash = parsenumber(_tabAcc select 1);
[] call life_fnc_hudUpdate;
[_uid,_idAcc] remoteExecCall ["BQKS_fnc_SetDefaultAccount",2];
[] call life_fnc_accountgest;