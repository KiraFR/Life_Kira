/*
	File: fn_jailSys.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	I forget?
*/
private["_unit","_bad","_id","_ret"];
params[["_unit",Objnull,[Objnull]]];
if(isNull _unit) exitWith {};
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_id = owner _unit;

[[[],_bad],"life_fnc_jailMe",_id,false] spawn life_fnc_MP;