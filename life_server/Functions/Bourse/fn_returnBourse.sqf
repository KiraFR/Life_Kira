/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/

private ["_Object"];
params[["_ownerID",""]];
if (isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;
_Object = Bourse_Object getVariable "Bourse";
[_Object] remoteExecCall ["KIRA_fnc_initBourse_Recive",_ownerID];