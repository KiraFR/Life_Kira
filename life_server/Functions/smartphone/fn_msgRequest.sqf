#include "..\..\macro.h"
/*
	File: fn_msgRequest.sqf
	Author: J `Kira` D
	
	Description:
	flemme d'expliquer
*/
private["_query","_queryResult","_uid","_player","_listmsg"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_returnToSender = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

_query = format["SELECT  `id`, `de`, `deUID`, `to`, `toUID`, `message` FROM `message` WHERE toUID='%1' ORDER BY nowtime DESC",_uid];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

{
	[1,_x] remoteExec ["life_fnc_cellphone",(owner _returnToSender)];
}forEach _queryResult;