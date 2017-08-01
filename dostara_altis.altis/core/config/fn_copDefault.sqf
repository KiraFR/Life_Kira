/*
	File: fn_copDefault.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Default cop configuration.
*/
//Strip the player down
RemoveAllWeapons player;
{player removeMagazine _x;} forEach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} forEach (assignedItems player);

//Load player with default cop gear.

[] call life_fnc_saveGear;