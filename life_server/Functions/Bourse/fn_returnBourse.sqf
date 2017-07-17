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
_Object = Bourse_Object getVariable "Bourse";
[_Object] remoteExecCall [_Return,_ownerID];