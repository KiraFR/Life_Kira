/*
	File: fn_putInCar.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Finds the nearest vehicle and loads the target into the vehicle.
*/
params [["_unit",ObjNull,[ObjNull]]];
if(isNull _unit OR !isPlayer _unit) exitWith {};

_nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],10] select 0;
if(isNil "_nearestVehicle") exitWith {hint localize "STR_NOTF_VehicleNear"};

detach _unit;
[player,_nearestVehicle] remoteExecCall ["moveInCargo",_unit];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",TRUE,TRUE];
