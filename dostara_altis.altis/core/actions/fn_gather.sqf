/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
if((time - life_action_delay) < 2.5) exitWith {hint "Vous ne pouvez pas faire d'actions aussi vite."};
life_action_delay = time;
_ressourceZones = ["apple_1","apple_2","apple_3","apple_4","heroin_1","cocaine_1","Cannabis_01","Cannabis_02","Cannabis_03","Pavot_01","Pavot_02","opium_1","wine_1","wine_2","Ress_Orange_01","Ress_Orange_02","Ress_Pêche_01","Ress_Pêche_02",
					"Ress_Pomme_01","Ress_Pomme_02","Ress_Raisin_01","Ress_Raisin_02","Ress_Alu_01","Ress_Alu_02","Ress_Argent_01","Ress_Bois_01","Ress_Bois_02","Ress_Bois_03","Ress_Bois_04",
					"Ress_Charbon_01","Ress_Charbon_02","Ress_Calcaire_01","Ress_Calcaire_02","Ress_Cuivre_01","Ress_Fer_01","Ress_Fer_02","Ress_Petrole_01","Ress_PP_01","Ress_Sable_01",
					"Ress_Sable_02","Ress_Sel_01","Ress_Cuivre_02","Coca_01","Coca_02"];
private _zone = "";
if(life_action_inUse)exitWith{};
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} forEach _ressourceZones;
if(_zone == "") exitWith {life_action_inUse = false;};
hint "Vous commencez à recolter.";
[_zone] spawn life_fnc_loopGather;