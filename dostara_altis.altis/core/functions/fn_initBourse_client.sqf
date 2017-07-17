/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/

private ["_bourseObject","_array","_virtName"];
params[["_bourseObject",[]]];
_array = [];
{
	_virtName = [(_x select 0),0] call life_fnc_varHandle;
    _array = _array + [_virtName];
}forEach _bourseObject;
Bourse_Iteams = _array;
life_bourse_completed = true;