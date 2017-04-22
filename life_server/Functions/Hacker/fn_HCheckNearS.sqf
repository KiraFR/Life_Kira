/*
	File: fn_HCheckNearS.sqf
	Auteur: J. `Kira` D.

	Description:
	appelle les flics

	PARAMETRES:
	1.SCALAR(Rayon)
	2.OBJECT(Player)
	3.ARRAY(Position)

	RETURNS:
	NONE

	CALL:
	[SCALAR,OBJECT,ARRAY] call KIRA_fnc_HCheckNearS
*/
private["_listReturn","_list"];
params[
	["_rayon",0,[0]],
	["_return",objNull,[objNull]],
	["_center",[],[[]]]
];

_listReturn = [];
_list = [];
{
	if((_center distance (getPos _x)) >= _rayon) then {
		if(isNil {_x getVariable "phoneNumber"}) then {} else{
			_listReturn pushBack [name _x,_x getVariable "phoneNumber"];
			_list pushBack (getPlayerUID _x);
		};
	};
}foreach allUnits;

{
	_query = format["SELECT numcompte,bankacc FROM banque WHERE dflt = '1' AND playerid='%1'",_x];
	_compteBanque = [_query,2] call DB_fnc_asyncCall;
	if(count _compteBanque == 0) then {_compteBanque = ["0","0"];};
	(_listReturn select _forEachIndex) = (_listReturn select _forEachIndex) + _compteBanque;
}foreach _list;

[_listReturn] remoteExecCall ["KIRA_fnc_HCheckNear",_return];