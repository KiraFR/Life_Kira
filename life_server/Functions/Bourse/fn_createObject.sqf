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

Bourse_Object = createSimpleObject ["a3\structures_f\civ\Garbage\GarbageBags_F.p3d", _pos];
Bourse_Object setPos (_pos vectorAdd (getPosWorld Bourse_Object vectorDiff (Bourse_Object modelToWorld [0,0,0])));

[] call bourse_fnc_setObject;