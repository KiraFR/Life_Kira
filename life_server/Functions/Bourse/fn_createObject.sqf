/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/

private ["_pos","_Object"];

_pos = [-1,-1,-1];

if (!isNil 'Bourse_Object') then {
deleteVehicle Bourse_Object;
};

_Object = createSimpleObject ["a3\structures_f\civ\Garbage\GarbageBags_F.p3d", _pos];
_Object setPos (_pos vectorAdd (getPosWorld _Object vectorDiff (_Object modelToWorld [0,0,0])));

Bourse_Object = _Object;

[] call bourse_fnc_setObject;