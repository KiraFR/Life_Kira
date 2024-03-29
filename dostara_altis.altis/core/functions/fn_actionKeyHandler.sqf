#include "..\..\macro.h"
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater"];
_curTarget = cursorTarget;
if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_interrupted) exitWith {life_interrupted = false;};
_isWater = surfaceIsWater (getPosASL player);
if(isNull _curTarget) exitWith {
	if(_isWater) then {
		private["_fish"];
		_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") then {
			[_fish] call life_fnc_catchFish;
		};
	} else {
		if(!life_gathering)then{
			life_gathering = true;
			[] call life_fnc_gather;
		};
	};
};

if(_curTarget isKindOf "House_F" && {player distance _curTarget < 12} OR ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget)) exitWith {
	[_curTarget] call life_fnc_houseMenu;
};

if(dialog) exitWith {};
if(vehicle player != player) exitWith {};
life_action_inUse = true;

//Temp fail safe.
[] spawn {
	sleep 60;
	life_action_inUse = false;
};

if!(isPlayer _curTarget && _curTarget isKindOf "Man") then {
	private["_isVehicle","_miscItems","_money"];
	_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];
	_money = "Land_Money_F";
	if((typeOf _curTarget) in _animalTypes) then {
			private["_handle"];
			_handle = [_curTarget] spawn life_fnc_catchFish;
			waitUntil {scriptDone _handle};
	} else {
		if((typeOf _curTarget) in _miscItems) then {
			private["_handle"];
			_handle = [_curTarget] spawn life_fnc_pickupItem;
			waitUntil {scriptDone _handle};
		} else {
			if((typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])}) then {
				private["_handle"];
				_curTarget setVariable["inUse",TRUE,TRUE];
				_handle = [_curTarget] spawn life_fnc_pickupMoney;
				waitUntil {scriptDone _handle};
			};
		};
	};
};
