/*
	File: fn_wantedPerson.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Fetches a specific person from the wanted array.
*/
private["_unit","_index"];
params[["_unit",ObjNull,[ObjNull]]];
if(isNull _unit) exitWith {[]};

_index = [getPlayerUID _unit,life_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	life_wanted_list select _index;
}
	else
{
	[];
};
