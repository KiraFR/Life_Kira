#include "..\..\macro.h"
/*
	File: fn_SetAccountDefault.sqf
	Crée par: R. `KronosD` R.
	
	Description:
	Mettre un compte en default 
*/

private["_deja"];
_uid = getPlayerUID player;
_tabAcc = call compile _this;
_idAcc = _tabAcc select 0; // id du compte

if(_idAcc isEqualTo life_dflt) exitWith {hint "Ce compte est deja votre compte par default.";};

_bankAcc = _tabAcc select 0; // argent du compte
if(typeName _bankAcc == "STRING") then{life_atmcash = parsenumber(_bankAcc);}else{life_atmcash = _bankAcc;};

[] call life_fnc_hudUpdate;
[_uid,clientOwner,_idAcc] remoteExecCall ["BQKS_fnc_SetDefaultAccount",2];