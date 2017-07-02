#include "..\..\macro.h"
/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(CASH > 0) then
{
	[CASH], RemoteExecCall ["life_fnc_robReceive",_robber];
	[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[CASH] call life_fnc_numberText]] RemoteExec ["life_fnc_broadcast",rob];
	[getPlayerUID _robber, side _robber, [name _robber, CASH, name player, getPlayerUID player, playerSide],22] remoteExecCall ["DB_fnc_logs",2];
	CASH = 0;
}
	else
{
	[2,"STR_NOTF_RobFail",true,[profileName]] RemoteExec ["life_fnc_broadcast",_robber];
};
