/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/

private ["_Object","_Return"];
params[["_ownerID",""],["_Return",""]];
if (isNull _ownerID) exitWith {};
if (isNil _Return) exitWith {};
_ownerID = owner _ownerID;
Force_Save_Bourse = false;
[] call bourse_fnc_forceSaveObject;
waitUntil {if (Force_Save_Bourse) exitWith {true};false};
_Object = Bourse_Object getVariable "Bourse";
[_Object] remoteExecCall [_Return,_ownerID];