#include "\life_server\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Fetches all the players houses and sets them up.
*/
private["_query","_houses"];
if(_this == "") exitWith {};

_query = format["SELECT pid, pos, inventory, containers FROM houses WHERE pid='%1' AND owned='1'",_this];

_houses = [_query,2,true] call DB_fnc_asyncCall;

_return = [];
{
	_pos = call compile format["%1",_x select 1];
	_house = nearestBuilding _pos;
	_house allowDamage false;
	_containers = [];
	_house setVariable["slots",[],true];
	if(!isNil {(_house getVariable "containers")}) then {
		{if(!isNull _x) then {deleteVehicle _x;};} forEach (_house getVariable "containers");
	};

	_trunk = _x select 2;
	_containerData = _x select 3;
	_house setVariable["Trunk",_trunk,true];
	{
		if(count _x == 0) exitWith {}; //No containers / items.
		_className = _x select 0;
		_weapons = (_x select 1) select 0;
		_magazines = (_x select 1) select 1;
		_items = (_x select 1) select 2;
		_backpacks = (_x select 1) select 3;

		//Setup the variables
		_positions = [_house] call life_fnc_getBuildingPositions;
		_pos = [0,0,0];

		{
			_slots = _house getVariable ["slots",[]];
			if(!(_forEachIndex in _slots)) exitWith {
				_slots pushBack _forEachIndex;
				_house setVariable["slots",_slots,true];
				_pos = _x;
			};
		} forEach _positions;

		if(_pos isEqualTo [0,0,0]) exitWith {};

		_container = createVehicle[_className,_pos,[],0,"NONE"];
		waitUntil{!isNil "_container"};
		_container setPosATL _pos;
		//_container enableSimulation false;

		_containers pushBack _container;
		clearWeaponCargoGlobal _container;
		clearItemCargoGlobal _container;
		clearMagazineCargoGlobal _container;
		clearBackpackCargoGlobal _container;
		//Add weapons to the crate.
		{
			_weaponCount = (_weapons select 1) select _forEachIndex;
			_container addWeaponCargoGlobal [_x,_weaponCount];
		} forEach (_weapons select 0);

		//Add magazines
		{
			_magazineCount = (_magazines select 1) select _forEachIndex;
			_container addMagazineCargoGlobal [_x,_magazineCount];
		} forEach (_magazines select 0);

		//Add items
		{
			_itemCount = (_items select 1) select _forEachIndex;
			_container addItemCargoGlobal [_x,_itemCount];
		} forEach (_items select 0);

		//Add backpacks
		{
			_backpackCount = (_backpacks select 1) select _forEachIndex;
			_container addBackpackCargoGlobal [_x,_backpackCount];
		} forEach (_backpacks select 0);

	} forEach _containerData;


	_house setVariable["containers",_containers,true];
	_return pushBack [_x select 1,_containers];
} forEach _houses;

missionNamespace setVariable[format["houses_%1",_this],_return];
