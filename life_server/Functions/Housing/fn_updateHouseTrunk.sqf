#include "..\..\macro.h"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the storage for a house blah blah
*/
private["_house"];
params[["_house",ObjNull,[ObjNull]]];
if(isNull _house) exitWith {};

_trunkData = _house getVariable["Trunk",[[],0]];
_houseID = _house getVariable["house_id",-1];

if(_houseID == -1) exitWith {}; //Dafuq?

_query = format["UPDATE houses SET inventory='%1' WHERE id='%2'",_trunkData,_houseID];

[_query,1] call DB_fnc_asyncCall;