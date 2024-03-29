#include "\life_server\script_macros.hpp"
/*
	File: fn_mresString.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Makes the string safe to be passed to MySQL (strips various stuff).
*/
private["_string","_filter"];
params[["_array","",[""]]];
_filter = "'/\`:|;,{}-""<>";

_string = toArray _string; //Blow it up to an array
_filter = toArray _filter; //Blow it up to an array

{
	if(_x in _filter) then {
		_string set[_forEachIndex,-1];
	};
} forEach _string;

_string = _string - [-1];
toString _string;