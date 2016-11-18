/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(life_cash > 0) then
{
	[life_cash], RemoteExecCall ["life_fnc_robReceive",_robber];
	[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[life_cash] call life_fnc_numberText]], RemoteExec ["life_fnc_broadcast",nil];
	life_cash = 0;
}
	else
{
	[2,"STR_NOTF_RobFail",true,[profileName]],RemoteExec ["life_fnc_broadcast",_robber];
};