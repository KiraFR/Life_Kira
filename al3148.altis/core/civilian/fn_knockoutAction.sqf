/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Knocks out the target.
*/
private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
life_knockout = true;
[player,"AwopPercMstpSgthWrflDnon_End2"] RemoteExec ["life_fnc_animSync",nil];
sleep 0.08;
[_target,profileName] RemoteExecCall ["life_fnc_knockedOut",_target];

sleep 3;
life_knockout = false;