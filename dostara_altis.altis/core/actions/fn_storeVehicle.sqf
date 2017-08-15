/*
	File: fn_storeVehicle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Stores the vehicle in the garage.
*/
private["_nearVehicles","_vehicle","_dist"];
if(PlayerSide in [west,independent]) then {_dist = 80} else {_dist = 40};
if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],_dist]; //Fetch vehicles within _dist.
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_vehicle = _x;
				};
			};
		} forEach _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_NoNPC"};
if(isNull _vehicle) exitWith {};
[_vehicle,false,(_this select 1)] RemoteExecCall ["TON_fnc_vehicleStore",0];
hint localize "STR_Garage_Store_Server";
life_garage_store = true;
