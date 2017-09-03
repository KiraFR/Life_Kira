/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the cop siren sound for other players
*/
private _vehicle = param[0,ObjNull,[ObjNull]];
private _sound = param[1,"",[""]];
private _sleep = param[2,0,[0]];

private _siren = _vehicle getVariable "siren";
if(isNull _vehicle) exitWith {};
if(isNil "_siren") exitWith {};

while {true} do
{
	if(!_siren) exitWith {};
	if(count (crew (_vehicle)) == 0) then {_vehicle setVariable["siren",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	_vehicle say3D _sound;
	sleep _sleep;
	if(!_siren) exitWith {};
};
