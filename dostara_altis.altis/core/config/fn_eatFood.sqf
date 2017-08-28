/*
	File: fn_eatFood.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main handling system for eating food.
	*Needs to be revised and made more modular and more indept effects*
*/
private["_food","_val","_sum","_t"];
_food = [_this,0,"",[""]] call BIS_fnc_param;
if(_food == "") exitWith {};
_t = 0;
if([false,_food,1] call life_fnc_handleInv) then {
	switch (_food) do
	{
		case "Girelle": {_val = 50;};
		case "Jus_de_pommes":{ _val = 5;_t=15;};
		case "Jus_de_raisin": {_val = 5;_t=15;};
		case "Jus_Multifruit": {_val = 5;_t=15;};
		case "Maquereau": {_val = 30;};
		case "Mulet": {_val = 30;};
		case "Orange": {_val = 10;_t=10;};
		case "Peche": {_val = 15;_t=5;};
		case "Pommes": {_val = 10;_t=5;};
		case "Raisin": {_val = 5;_t=10;};
		case "Roussette": {_val = 55;};
		case "Saupe": {_val = 15;};
		case "Soupe_de_poisson": {_val = 35;_t=10;};
		case "Thon": {_val = 60;};
		case "Tortue": {_val = 100;_t=-10;};
		case "Wrap_Poulet": {_val = 25;};
		case "Big_Burger": {_val = 25;};
	};

	_sum = life_hunger + _val;
	life_thirst = life_thirst + _t;
	if(life_thirst>100)then{life_thirst = 100};
	if(_sum > 100) then {
		_sum = 100;
		player setFatigue 1;
		hint "Vous avez trop mangé...";
		[] spawn KIRA_fnc_peterMalade;
	};
	life_hunger = _sum;
};