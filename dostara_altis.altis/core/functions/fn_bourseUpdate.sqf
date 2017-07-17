/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/

private ["_bourseObject","_Var","_virtName","_varIteams"];
params[["_bourseObject",[]]];
_Var = [];
_varIteams = [];
_Iteams = [];
{
	_virtName = [(_x select 0),0] call life_fnc_varHandle;
    _Var = _Var + [[_virtName,_x select 1]];
    _varIteams = _varIteams + [_virtName];
    _Iteams = _Iteams + [(_x select 0)];
}forEach _bourseObject;
Bourse_VarIteams = _varIteams;
Bourse_Iteams = _Iteams;
Bourse_Object = _bourseObject;
Bourse_Var = _Var;