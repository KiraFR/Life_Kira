#include "..\..\macro.h"
/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle"];
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"};
_className = getSelData(2302);
_vIndex = getSelValue(2302);
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg;
_basePrice = (_vehicleList select _vIndex) select 1;
_colorIndex = getSelValue(2304);

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(CASH < _basePrice && playerSide == civilian) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - CASH] call life_fnc_numberText];};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense"};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";
_shop = (life_veh_shop select 0);
//Check if there is multiple spawn points and find a suitable spawnpoint.
if(typeName _spawnPoints == typeName []) then {
	//Find an available spawn point.
	{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} forEach _spawnPoints;
} else {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
};


if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";};

if(_shop in ["med_shop","med_air_hs","cop_car","cop_air","cop_ship","med_ship"]) then{
	[false,_basePrice] remoteExecCall ["KIRA_fnc_modifComptGouv",2];
}else{
	CASH = CASH - _basePrice;
};

hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];

//Spawn the vehicle and prep it.
_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
waitUntil {!isNil "_vehicle"}; //Wait?
_vehicle allowDamage false; //Temp disable damage handling..
_vehicle lock 2;
_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
_vehicle setDir (markerDir _spawnPoint);
_vehicle setPos (getMarkerPos _spawnPoint);
diag_log format["couleur: %1",_colorIndex];
[_vehicle,_colorIndex] RemoteExecCall ["life_fnc_colorVehicle",0];
[_vehicle] call life_fnc_clearVehicleAmmo;
[_vehicle,"trunk_in_use",false,true] RemoteExecCall ["TON_fnc_setObjVar",2];
[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] RemoteExecCall ["TON_fnc_setObjVar",2];
_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.

//Side Specific actions.
switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
	};

	case civilian: {
		if((life_veh_shop select 2) == "civ" && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
	};

	case independent: {
		[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
	};
};

_vehicle allowDamage true;

//life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
life_vehicles pushBack _vehicle;

[getPlayerUID player,playerSide,_vehicle,1] RemoteExecCall ["TON_fnc_keyManagement",2];

[(getPlayerUID player),playerSide,_vehicle,_colorIndex] RemoteExecCall ["TON_fnc_vehicleCreate",2];
[0] call SOCK_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;
