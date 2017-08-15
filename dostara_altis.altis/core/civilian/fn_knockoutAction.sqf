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
[player,"AwopPercMstpSgthWrflDnon_End2"] RemoteExecCall ["life_fnc_animSync",0];
sleep 0.08;
[_target,profileName] RemoteExec ["life_fnc_knockedOut",_target];

sleep 10;
life_knockout = false;
