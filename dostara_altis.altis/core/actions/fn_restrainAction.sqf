/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

_unit setVariable["restrained",true,true];
[player], RemoteExec ["life_fnc_restrain", _unit];
[0,"STR_NOTF_Restrained",true,[_unit getVariable["realname", name _unit], profileName]] RemoteExecCall ["life_fnc_broadcast",west];
