/*
	File: fn_fourriereStore.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Stores the vehicle in the 'Garage'
*/
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit"];
params[
	["_vehicle",ObjNull,[ObjNull]],
	["_impound",false,[true]],
	["_unit",ObjNull,[ObjNull]]
];

if(isNull _vehicle OR isNull _unit) exitWith {life_impound_inuse = false; (owner _unit) publicVariableClient "life_impound_inuse";life_fourriere_store = false;(owner _unit) publicVariableClient "life_fourriere_store";}; //Bad data passed.

_vInfo = _vehicle getVariable["dbInfo",[]];
if(count _vInfo > 0) then
{
	_plate = _vInfo select 1;
	_uid = _vInfo select 0;
};

if(_impound) then
{
	if(count _vInfo == 0) then 
	{
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
	} 
		else
	{
		_query = format["UPDATE vehicles SET active='0' AND fourriere='1' WHERE pid='%1' AND plate='%2'",_uid,_plate];
		
		_thread = [_query,1] call DB_fnc_asyncCall;
		//waitUntil {scriptDone _thread};
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
	};
}