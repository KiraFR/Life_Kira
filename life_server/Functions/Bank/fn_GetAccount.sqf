#include "..\..\macro.h"
/*
	File: fn_GetAccount.sqf
	Author: R. `KronosD` R.
	
	Description:
	flemme d'expliquer
*/
private["_query","_queryResult"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_returnToSender = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

_query = format["SELECT  nam_account, numcompte, offshore, entreprise, bankacc, default FROM banque WHERE playerid='%1'",_uid];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;