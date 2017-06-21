/*
	File: fn_onTake.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Blocks the unit from taking something they should not have.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_container",objNull,[objNull]],
    ["_item","",[""]]
];

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?

switch playerSide do
{
	case west: {}; //Blah
	case independent: {};
	case civilian: {
		//Currently stoping the civilians from taking the indep clothing from medics.
		if(_item in ["U_I_CombatUniform"]) then {
			[_item,false,false,false,false] call life_fnc_handleItem;
		};
	};
};
